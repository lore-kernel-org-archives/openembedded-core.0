Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id CE8AD6D14A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 00:36:32 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id uq10so6241153igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 16:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=x5pUJpW3kRuGxNuAWmEVSicYUYQ2Lqzf2Hh2OTA3nUI=;
	b=ilHuvT4h/NNpIYvlRWqMPIeANCxVTsZFjBTWpBYnLtcy45/+9V87d6coA2zIeAZV7D
	Jgo9U6aJ9kbpjy+b0HfinnSq5b+v8wBLnlV+uNC1gLv6CfxQMFHChdf5rIOsW2QsBUk3
	vF0U9+gLwLaFPdBpnEI11p23WVrXMdgiufhk4Wdz3+kWtluvxpC8VX1wZwCNf0cOXmeo
	wfOiUDWRLgfWnOUf0akLMoBILGtzkuq5e5BIClI4iPyQgAvRw4Gn4oZpKLd9uY1tC0wo
	Yi91hSweAntEVNWVG1xfIMQCMbrPnh1Cw4ez1Em3/G/xh682UjUdL44BvbGZViVp5tWo
	rXHw==
X-Received: by 10.50.20.100 with SMTP id m4mr18926554ige.17.1392683793726;
	Mon, 17 Feb 2014 16:36:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Mon, 17 Feb 2014 16:36:02 -0800 (PST)
In-Reply-To: <alpine.LFD.2.11.1402171954550.26476@localhost.localdomain>
References: <CAMKF1sr14p-RtkTpK8FcYA3PjDExfxq_qJZfX3k0c0sKy5AzdQ@mail.gmail.com>
	<alpine.LFD.2.11.1402171954550.26476@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Feb 2014 16:36:02 -0800
Message-ID: <CAMKF1srmnStsMB_sfsfaEq8dRZ8wQOoxHKWW6-=+u5uzf3EZJg@mail.gmail.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
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
X-List-Received-Date: Tue, 18 Feb 2014 00:36:33 -0000
Content-Type: text/plain; charset=UTF-8

>> mke2fs 1.42.9 (28-Dec-2013)
>> debugfs 1.42.9 (28-Dec-2013)
>> bzip2: Can't open input file
>> core-image-minimal-qemux86-20140217182225.rootfs.tar: No such file or
>> directory.
>> ERROR: Error: The image creation script
>>
>> '/home/kraj/oe-core/build/tmp-uclibc/work/qemux86-oe-linux-uclibc/core-image-minimal/1.0-r0/temp/create_image.tar'
>> returned 1:
>>
>>
>> I am seeing this starting today with pure oecore
>>
>> Build Configuration:
>> BB_VERSION        = "1.21.1"
>> BUILD_SYS         = "x86_64-linux"
>> NATIVELSBSTRING   = "Ubuntu-12.04"
>> TARGET_SYS        = "i586-oe-linux-uclibc"
>> MACHINE           = "qemux86"
>> DISTRO            = "nodistro"
>> DISTRO_VERSION    = "nodistro.0"
>> TUNE_FEATURES     = "m32 i586"
>> TARGET_FPU        = ""
>> meta              = "staging:e114cc405bd98ebbe5376e094842c9d49e7ca9b8"
>>
>> staging has few patches on top but they were same working few days ago
>>
>> any ideas ?
>
>
> I saw this aswell today, temporary reverting
> 9d9bca8785911e8ae06d507bbfb99d6a811f072e in OE-core worked for me.
>

OK so I am not going insane yet. I have a potential fix for this issue here

http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/misc&id=fa250f06f0d1d89450b95040b59887cd5c897757

can you try it out in your environment. Since you have a environment
where this happens as well ?

-Khem

