Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7A48C606E9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 12:50:20 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id b6so2616392yha.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Feb 2015 04:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=JAvRAmo51YEGwG29lfdJxJExiVZdTzltGvmcOTzxtHs=;
	b=CCjQqNTC1z2iCtzIf7abyT+XrZE1EdiaCCP+shgc9ESqETvvqCLba0QZTdxHA1/vta
	Vy5L3j+H7C9kURhwyeb7sLeuicLsGOY2H61fTF34qbQdfU+l/8a9bqcnivNU0wxl96Tx
	XnRLJCqEmIQeOX0jA3WOq4FuR5VTbmLFVe+nF7CWbZlaKBZ7kQN0M6vdh1hWv6LUHpZo
	EVds/1LQK8/R02WWz+5NENdO5aqj6eqaW8WBZPMzLspJunrN/oCP6fFIGFZhGceDrblO
	g08EKxwdI7IvK30cbqF92Etm33gX9jbE5ZPGlBi/H4sALo1InYoUEjqiwZj+WpD4AftV
	Jt/g==
MIME-Version: 1.0
X-Received: by 10.170.195.150 with SMTP id m144mr6554942yke.50.1423486221839; 
	Mon, 09 Feb 2015 04:50:21 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Mon, 9 Feb 2015 04:50:21 -0800 (PST)
In-Reply-To: <54D8AB8D.8000500@mentor.com>
References: <1423263383-15461-1-git-send-email-nathan_lynch@mentor.com>
	<CAP9ODKqwuOnwWH3Otue31U8z1S_ypiFdwhHnY3t=3yG_Z5MLnQ@mail.gmail.com>
	<54D8AB8D.8000500@mentor.com>
Date: Mon, 9 Feb 2015 10:50:21 -0200
X-Google-Sender-Auth: dHMIK-LTtcCY5MbHYE0CZAJ7NsA
Message-ID: <CAP9ODKpkOpUaRR6hsJ=g78TrF0zzpDWt6x5+nsLcrtVwdnsa4Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Nathan Lynch <Nathan_Lynch@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng-tools: use perl-misc, perl-modules in ptest deps
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
X-List-Received-Date: Mon, 09 Feb 2015 12:50:29 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 9, 2015 at 10:43 AM, Nathan Lynch <Nathan_Lynch@mentor.com> wrote:
> On 02/07/2015 03:48 PM, Otavio Salvador wrote:
>> On Fri, Feb 6, 2015 at 8:56 PM, Nathan Lynch <nathan_lynch@mentor.com> wrote:
>>> The testcases for lttng-tools use the "prove" command from perl-misc,
>>> which needs many modules not in the base perl package.
>>>
>>> Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
>>
>> Wouldn't be better to specify the modules needed for the prove
>> command? This avoids unneeded packages to be installed.
>
> I had thought so too (sort of -- why doesn't perl-misc depend on the
> necessary module packages?), but I encountered runtime errors such
> as this (using perl-module-app-prove instead of perl-modules):
...

Your patch seems very close to what I would expect. I think the
granular dependency fix is the way to go otherwise we start to grow
the rootfs size and it will be a very difficult thing to fix in long
term. We should avoid this at any cost or we end build a bloated
system... not what we are looking for.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

