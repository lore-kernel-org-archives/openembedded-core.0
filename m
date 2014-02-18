Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7A76EEE6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 07:54:44 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id hr13so12142490lab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 23:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:in-reply-to:message-id:references
	:user-agent:mime-version:content-type;
	bh=LFdrMUAPXXz1SbO9KgqxOqPCLQRjNP7uVKlkiSEuHq8=;
	b=irOFuQcgs3sQ9luyZQkDlv4bbLhovVbJ9mvlQZZAm/DavpOYTdvs5mUqKBbdZBd6gi
	OUAvta+C6hzpd4Hz6/GFTVKtvCBzHpJWSsml7H/oVzdKXPdxI0uHi95Q3PThuyKi4TXH
	MW/QFKQYsYT13bzRGJeuR6HIn/MMbji9xwn/WKmydDjMkOXqal/HxdDETNXIduh8Hqaz
	Tal867DACDe05AVAzNLig0NEYxx5H70oJ2Vlc4uXKDeAQwR1YNfmgAVzjfMCPJLSzBg6
	lfV3gMr4lXOrPDjC1bXFWtp7cN8LLMupaqprDyqcEDJN/LQgHlDuisWHKEdNWU9Y/A8P
	r6sQ==
X-Received: by 10.152.27.133 with SMTP id t5mr158068lag.66.1392710084391;
	Mon, 17 Feb 2014 23:54:44 -0800 (PST)
Received: from [172.16.17.230] ([193.15.174.198])
	by mx.google.com with ESMTPSA id yq2sm30475722lab.3.2014.02.17.23.54.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Feb 2014 23:54:44 -0800 (PST)
Date: Tue, 18 Feb 2014 08:54:39 +0100 (CET)
From: Jacob Kroon <jacob.kroon@gmail.com>
X-X-Sender: jkroon@localhost.localdomain
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAMKF1srmnStsMB_sfsfaEq8dRZ8wQOoxHKWW6-=+u5uzf3EZJg@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1402180850570.23687@localhost.localdomain>
References: <CAMKF1sr14p-RtkTpK8FcYA3PjDExfxq_qJZfX3k0c0sKy5AzdQ@mail.gmail.com>
	<alpine.LFD.2.11.1402171954550.26476@localhost.localdomain>
	<CAMKF1srmnStsMB_sfsfaEq8dRZ8wQOoxHKWW6-=+u5uzf3EZJg@mail.gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error: The image creation script fails
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
X-List-Received-Date: Tue, 18 Feb 2014 07:54:45 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed



On Mon, 17 Feb 2014, Khem Raj wrote:

>>> mke2fs 1.42.9 (28-Dec-2013)
>>> debugfs 1.42.9 (28-Dec-2013)
>>> bzip2: Can't open input file
>>> core-image-minimal-qemux86-20140217182225.rootfs.tar: No such file or
>>> directory.
>>> ERROR: Error: The image creation script
>>>
>>> '/home/kraj/oe-core/build/tmp-uclibc/work/qemux86-oe-linux-uclibc/core-image-minimal/1.0-r0/temp/create_image.tar'
>>> returned 1:
>>>
>>>
>>> I am seeing this starting today with pure oecore
>>>
>>> Build Configuration:
>>> BB_VERSION        = "1.21.1"
>>> BUILD_SYS         = "x86_64-linux"
>>> NATIVELSBSTRING   = "Ubuntu-12.04"
>>> TARGET_SYS        = "i586-oe-linux-uclibc"
>>> MACHINE           = "qemux86"
>>> DISTRO            = "nodistro"
>>> DISTRO_VERSION    = "nodistro.0"
>>> TUNE_FEATURES     = "m32 i586"
>>> TARGET_FPU        = ""
>>> meta              = "staging:e114cc405bd98ebbe5376e094842c9d49e7ca9b8"
>>>
>>> staging has few patches on top but they were same working few days ago
>>>
>>> any ideas ?
>>
>>
>> I saw this aswell today, temporary reverting
>> 9d9bca8785911e8ae06d507bbfb99d6a811f072e in OE-core worked for me.
>>
>
> OK so I am not going insane yet. I have a potential fix for this issue here
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/misc&id=fa250f06f0d1d89450b95040b59887cd5c897757
>
> can you try it out in your environment. Since you have a environment
> where this happens as well ?
>

Thanks, patch works for me too. Without the patch and using master 
branches I see the same error message as before, with the patch applied 
the image builds fine.

My environment for reference:

Build Configuration:
BB_VERSION        = "1.21.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Fedora-20"
TARGET_SYS        = "arm-oe-linux-gnueabi"
MACHINE           = "wandboard-solo"
DISTRO            = "monkey"
DISTRO_VERSION    = "0.1"
TUNE_FEATURES     = "armv7a vfp neon callconvention-hard cortexa9"
TARGET_FPU        = "vfp-neon"
meta-oe           = "master:2397f51915252c00c4b86dc324feec76f61dcf22"
meta-qt5          = "master:32cee0b6d18a9e8ae2977accf2c8d32f303827d7"
meta              = "master:9d9bca8785911e8ae06d507bbfb99d6a811f072e"
meta-fsl-arm      = "master:40385ba8b3060adb3a535c6e5f08199b69f47754"
meta-fsl-arm-extra = "master:1b612d3045fe572d842186870903b8871c69e589"

/Jacob

