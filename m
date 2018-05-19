Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3BA74F4B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 21:26:43 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id c11-v6so6551930plr.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 14:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ykrA3YqaXx/C5pdEwf+VdfA1z/pjysBV6RIiliYiJZQ=;
	b=WIoOxG910MTENrAc/BPZxu//YhgtnhKBX8ha32prrduFn7bEy65Cxxf5rpYJyg72xI
	d9Xogy5o0fjAif5CkrPoXRtgvHBGPu+tRnIvSDMqXkigTWKjNbJK/hwlyyoaESNvE61U
	bBf33IcPFx54sHhEMdJDGRYB+Gm8xUbpxI3p3/KUtPC3wykRShD5glFoo1SzFWPWEM6H
	sbssWoDzQytOJasT721/MvIhnxHq5+3BRYwQGZQrkJBwPcUJ+SnYC7hUV3txw/JjfEW9
	j+9P9+dED8qoqRE1p9lmnP2D1KKsfLkrrgflcmDF9O5efImOIFW2DyRU9Lccp5MLJiKp
	foBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ykrA3YqaXx/C5pdEwf+VdfA1z/pjysBV6RIiliYiJZQ=;
	b=aQgjB9q/uRpxUWuC+QgAMPjQ/M1u5v5/HPNMpp1TiWSyNdHd4B2M8ugJ1LfUWLUaGO
	NYHwDMzPqf4BBgPFygvt+3XbOR9+TQzf40CO8ZeRTpdSWyo4fmUxNZexD2ARwtxmUmLJ
	zul5f8bpX+oumjY2+5Prl7T6hZGJFE8R7SwakZ5myP5MXVWgKslg8IIPC99qv5l1olkg
	q5Oz1m5+0XZBQyQH6z4HONlBDl6kMquwADpdxRxnMEMlFl0OZVIZzxl+ds/ACgcpZY6R
	E99Aybu6edn1pVG/Djtwb+Nly/NbyvETTV+I7HvgYzwJe6/ktnvG1V+wTkAuW93f+9YA
	3yTA==
X-Gm-Message-State: ALKqPwfTcpD16pDUqV95qb/cM6c9xhXz3qUcP3olPjawGYSxpPZFl5OI
	xKP0pyDcuZ+jlAT6NrkOPrlXaA6TZfnD6tsqtK8=
X-Google-Smtp-Source: AB8JxZpmkq0B9MabUB9CPrZzVTrhRVFBeZA3d5e2ofty+7JZhms8iSh/torfO1TJtVP8EeDu2KpZzsMiCZicupgskyM=
X-Received: by 2002:a17:902:10c:: with SMTP id
	12-v6mr14846869plb.252.1526765204193; 
	Sat, 19 May 2018 14:26:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Sat, 19 May 2018 14:26:13
	-0700 (PDT)
In-Reply-To: <20180519193341.GM19965@denix.org>
References: <20180519162102.GL19965@denix.org>
	<CAMKF1srt3AbRBgdBZp2ya-VkWm1K6r8eywFbqr3nMFe7EqNuFw@mail.gmail.com>
	<20180519193341.GM19965@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 May 2018 14:26:13 -0700
Message-ID: <CAMKF1sqfpZhKJKjFoouGhpRbZEfJBqXJxmqunepAx2weVsQEnA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: GCC 9 Drops Support For Older ARM Microarchitecture Versions
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
X-List-Received-Date: Sat, 19 May 2018 21:26:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, May 19, 2018 at 12:33 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Sat, May 19, 2018 at 11:07:55AM -0700, Khem Raj wrote:
>> On Sat, May 19, 2018 at 9:21 AM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > https://www.phoronix.com/scan.php?page=news_item&px=GCC-9-Dropping-Older-ARM
>> >
>> > Particularly, ARMv5 and ARMv5E are being dropped (but T and TE variants
>> > remain)
>> >
>> > Are there any concerns from OE community perspective?
>>
>> From yocto project perspctive qemuarm which is emulating arm926ejs
>> with default tune armv5te is used.
>> so we are right at the trailing edge and wont be affected. However, I
>> know there were OE users who had
>> devices using other armv5 or v4 variants
>>
>> I have been suggesting to switch qemuarm to use armv7 based board
>> emulator for few years now.
>> may be this is the time to make that call for next YP release.
>
> Valid point about qemuarm, but see below.
>
>
>> > At least for binutils we needed this patch even for armv5te:
>> > http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
>> >
>>
>> this patch technically required to support one of OEs available tune
>> values. namely armv5e, we should be able to drop it.
>
> $ grep conf/machine meta/conf/machine/qemuarm.conf
> require conf/machine/include/qemu.inc
> require conf/machine/include/tune-arm926ejs.inc
> #require conf/machine/include/tune-arm1136jf-s.inc
>
> $ MACHINE=qemuarm bitbake virtual/kernel -e|grep -E '^DEFAULTTUNE=|^ARMPKGSFX_THUMB=|^TUNE_PKGARCH=|^TUNE_CCARGS='
> ARMPKGSFX_THUMB=""
> DEFAULTTUNE="armv5te"
> TUNE_CCARGS=" -march=armv5e -marm"
> TUNE_PKGARCH="armv5e"
>
>
> I have already tried binutils w/o that patch for arm926ejs/armv5te machine and
> it fails, because as you can see above, -march=armv5e is being passed...
>

What happens if you drop setting TUNE_CCARGS and  TUNE_PKGARCH ?

> --
> Denys

