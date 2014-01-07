Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id BC5156BE7A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 11:46:12 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id uz6so30031obc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jan 2014 03:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=k9c1OWfigF9NuiW0BVrJ71sZqVzWwtustY2hoNpcaJk=;
	b=H+h5dDJQKCM6uYdGHV/jzOsCtFsytyZIQe2I8DWWptotpdG2/A9SrE1jdqEoM2o7us
	6maOtB/KQ0Bptao4g/5hwFiuY3olXhazqHC7HVjvr2+0r61AQfGw0FP7EzFGQZIxs9KG
	PLbyIcjEGaxnB+v+B+3Te/67cvjAMjfN5aEiGDQ1fX28pkcKfY2GZnFNcjufgCuFvc0D
	AP//Y+WxOfcbhOgCsSZe/buFW1eCRrwsu1p0k6por6AVNGYBm+FI/1RElcYEvIJLZW/a
	gRPQfg0fIxQ1z/grPbb4ebP0MNQmb2zuQW8TU9sgPhuoDKT+51gYKdGpUJAZYi3QAkFg
	Hi6w==
MIME-Version: 1.0
X-Received: by 10.60.136.132 with SMTP id qa4mr149073oeb.68.1389095173379;
	Tue, 07 Jan 2014 03:46:13 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 7 Jan 2014 03:46:13 -0800 (PST)
In-Reply-To: <52CB29BA.5050404@linux.intel.com>
References: <1387889050-25592-1-git-send-email-lpapp@kde.org>
	<CAOMwXhOfJEkntBTQLDGWjRYA6jorCWNEUF1+t8n5RJJoozcVJA@mail.gmail.com>
	<52CB29BA.5050404@linux.intel.com>
Date: Tue, 7 Jan 2014 09:46:13 -0200
X-Google-Sender-Auth: sfh2ghoT-s7M4leVy0-K58Yh_lg
Message-ID: <CAP9ODKr5ivPcDbKkfa1xSUx-qCRwFni7V+O83rWw=3J7O555_w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/patch.py: Prefer "git am" over "git apply" when applying git patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jan 2014 11:46:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 6, 2014 at 8:10 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 12/31/2013 06:18 AM, Laszlo Papp wrote:
>>
>> Ping?
>>
>> Alternatively, the system could also have an option for further
>> fine-tuning what to do with git patches
>>
>> On Tue, Dec 24, 2013 at 12:44 PM, Laszlo Papp <lpapp@kde.org> wrote:
>>>
>>> It is better to use "git am" when possible to preserve the commit
>>> messages and
>>> the mail format in general for patches when those are present. A typical
>>> use
>>> case is when developers would like to keep the changes on top of the
>>> latest
>>> upstream, and they may occasionally need to rebase. This is not possible
>>> with
>>> "git diff" and "diff" generated patches.
>>>
>>> Since this is not always the case, the fallback would be the "git apply"
>>> operation which is currently available.
>>>
> Looking at this, is it possible to detect a git patch and only then use git
> am?  Since most of the patches carried in oe-core and other layers the 'git
> am' will typically fail and increase the build time since it will have to
> re-run the git apply, we don't want to had more forking and work in the main
> hot path.
>
> I am not the expert in this, neither is RP, so maybe Chris can comment
> further.

I am not sure it'd buy us a lot trying to detect it; in fact using git
am patches easy rework, rebase and upstreaming of those.

To detect it, we'd need to parse the file somehow and I am unsure it
would be faster than just try to apply it.

My 2c.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

