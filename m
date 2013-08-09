Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1422E6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 17:44:08 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wo10so6791703obc.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2013 10:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ovJ6WQROEMtIc2iFgs5hqz/HatGn5YlDomo38Cr11kE=;
	b=bxmz4imtn+mhp5pJNhtC3nLdqwKCIg39ZmRSXVq4uemG2k2fuoVbM3DF2g0xKL4YFO
	wuhy7AtdL84qSyN5rJNLk7UyVwpYgddp+4jr/ROLUYcWrbAycm/OVodgoZpiplrX9vtc
	GN5zt61kKwK67IXoBSg0bL9wVKnq3rpH1fAo4imjlaTj05tDP6267POvZutGkGijkOsH
	OAn0n7AVQTMXlEi06tfu5ESHXE/770myFwfC0BkN9cWyq4zFgA6IIP3NWf2Up+1Bo71U
	C2s7UlY+wBiMX82TGd0ZoYwWjQwLTnQwXFYzSocePXBIplMeXq3z1gdpQ9Ta0BIfC7cd
	am6w==
MIME-Version: 1.0
X-Received: by 10.182.22.5 with SMTP id z5mr1321155obe.42.1376070248422; Fri,
	09 Aug 2013 10:44:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 9 Aug 2013 10:44:08 -0700 (PDT)
In-Reply-To: <2788148.lfVDMmudBm@helios>
References: <1375570717-3017-1-git-send-email-otavio@ossystems.com.br>
	<2788148.lfVDMmudBm@helios>
Date: Fri, 9 Aug 2013 14:44:08 -0300
X-Google-Sender-Auth: Qwrwd7tK639YHSRKpeSWa_s_YE4
Message-ID: <CAP9ODKro0FZO4TmkTmphf5TrpmzxGm7_MP9FfUYZUReABBhraw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] blacklist.bbclass: Avoid blacklist specific handle in base.bbclass
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
X-List-Received-Date: Fri, 09 Aug 2013 17:44:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 9, 2013 at 12:47 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Saturday 03 August 2013 19:58:37 Otavio Salvador wrote:
>> +# Cope with PNBLACKLIST flags for multilib case
>> +addhandler blacklist_multilib_eventhandler
>> +blacklist_multilib_eventhandler[eventmask] = "bb.event.ConfigParsed"
>> +python blacklist_multilib_eventhandler() {
>> +    multilibs = e.data.getVar('MULTILIBSA', True)
>
> Typo - this should be MULTILIBS. Did you test this patch in a multilib
> configuration?

I changed it to test and ended commiting it. Sorry. I can send a v2 of it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

