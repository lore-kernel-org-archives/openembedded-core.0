Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 86F0778A20
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 06:37:06 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id w128so13579344wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 22:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BriIT4GPx62YH+AXuVfsYHdZefcYTKK64gJ21yT40uo=;
	b=jHBtmiuy9u2ec+nOoS1nX0wuaZ9reMpeyQyz3l+mCNFNN84Esovo7we/bz1owqTNuQ
	ZDt18vanUIDKG1O3FcOWBaW8YVErcppAkQE0RZwgKukXgmM9yWHbiow3V6KLlql7w1uG
	9dMtFg4sRADTaeCgM1/ei4VlqbvhXn8Q22641QHWaClJFanXvXqIiWeDErSDEZ8aQGr4
	a8fzIxnee8W00SgLcDFOLaF0bmkwsUlqu1mlWA7werWjqYv7xnthtdRk4AeVnxZgf1Oh
	fdbCjJlAfomn+dduJFSa86W3pTnel+vGkV3wDzIQicIV7XGo2doAInnLA6vxKQa2G5Ed
	mGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BriIT4GPx62YH+AXuVfsYHdZefcYTKK64gJ21yT40uo=;
	b=f8kDKEA62S7+RdVdKNUOBkDAVzhO4xSN+i7BQrdQAFqP2nVhqpj7b/ZICKfA+II7mY
	HFYGTU7nkK//yIPoIFPfBH/UPk/kZ6GWfNCwUcap2WP7DytixATE5DaHVIlcAtIEPHoI
	jt/n31tIJmXuv7WQv1SgBVZWfHFboPbwk3W4m1OESg9D1jO+xgDzfrXDJKZqDYwqQ7gA
	fkWlu76PGVkatW1UBSxgPUCF7ei57CovUArB61N6mZ1gYD6ysVcNqCDfUYE74ytfsg2d
	rd4zYusabQUp1IujC2x4k+JjZ20iPPng6+9+7c6+6tbc69PS+6oxpxJLQZ9w5W+YP0Vu
	uvcQ==
X-Gm-Message-State: AElRT7GtgbAtj21EyMfEfI5A1RaPr99Bj0BaX7sg+625tbi+/7FoOhwz
	BuFXPw1BceYEavSDKo7g5zpHpDHXi5fD+//KVc0=
X-Google-Smtp-Source: AG47ELtsOIlleqiZGq+nTuaSEZJzVHPr1NTSf1Hysph0eYNsPrENmkCww0aRXKX5F7iN4VTlOhtRxVv8Zw1btIy9/IQ=
X-Received: by 10.28.170.205 with SMTP id t196mr7659601wme.42.1520231827238;
	Sun, 04 Mar 2018 22:37:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.173.193 with HTTP; Sun, 4 Mar 2018 22:37:06 -0800 (PST)
In-Reply-To: <20180304162216.GC1370@jama>
References: <1520162492-29839-1-git-send-email-richard.purdie@linuxfoundation.org>
	<20180304141538.GB1370@jama> <20180304162216.GC1370@jama>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sun, 4 Mar 2018 22:37:06 -0800
Message-ID: <CAJ86T=VPkRT06Jg7i7CK=mZBWZM_Ssn4a0-8+zf9RQyu-NXQLA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][morty] gcc6: Upgrade to 6.4.0 (latest stable series release)
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
X-List-Received-Date: Mon, 05 Mar 2018 06:37:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 4, 2018 at 8:22 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sun, Mar 04, 2018 at 03:15:38PM +0100, Martin Jansa wrote:
>> On Sun, Mar 04, 2018 at 11:21:32AM +0000, Richard Purdie wrote:
>> > From: Juro Bystricky <juro.bystricky@intel.com>
>> >
>> > Changed BINV and PV from 6.2.0 to 6.4.0
>> > Modified BASEURI to load xz tarball instead of bz2
>> >
>> > Backported series of patches from https://github.com/hjl-tools/gcc.git
>> > branch /hjl/indirect/gcc-6-branch/master which contains
>> > an IA patch series for security related issues
>> >
>> > ubsan-fix-check-empty-string.patch : removed, already applied
>>
>> Very limited testing with this change in morty shows that raspberrypi3
>> (cortexa7hf-neon-vfpv4) build of glibc-initial fails with:
>>
>> configure:5344: checking for broken __attribute__((alias()))
>> configure:5359: arm-oe-linux-gnueabi-gcc  -march=armv7ve -marm
>> -mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
>> --sysroot=sysroots/raspberrypi3-tcbootstrap
>> -Werror -S conftest.c -o conftest.s 1>&5
>> conftest.c:1:0: error: switch -mcpu=cortex-a7 conflicts with
>> -march=armv7ve switch [-Werror]
>>          extern int foo (int x) __asm ("xyzzy");
>>
>> cc1: all warnings being treated as errors
>> configure:5362: $? = 1
>> configure:5372: result: yes
>> configure:5375: error: working alias attribute support required
>>
>> Which is a bit strange as armv7ve was added to resolve this error with
>> -mcpu=cortexa7 and -march=armv7a in:
>>
>> commit 35392025f3236f5e5393f9cf0857732da9a2e503
>> Author: Martin Jansa <Martin.Jansa@gmail.com>
>> Date:   Tue Oct 6 17:08:59 2015 +0200
>>
>>     arch-armv7ve: add tune include for armv7ve and use it from cortexa7
>> and cortexa15
>>
>>     * be aware that this -march value is available only in gcc-4.9 and
>>       newer:
>>       https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57907
>>     * -mcpu=cortex15 and -mcpu=cortexa7 conflict with -march=armv7a
>>       We either have to stop putting -march in default CCARGS or at
>>       least set it compatible one like this patch does.
>>
>> Regards,
>
> It seems to be known regression in 6.4, with fix available here:
> https://patchwork.ozlabs.org/patch/835592/

Yes. Not only was the patch submitted upstream to gcc, it was even
submitted to oe-core:

  http://lists.openembedded.org/pipermail/openembedded-core/2017-November/144159.html

Unfortunately gcc 6.4.0 was dropped from oe-core master before the fix
was merged...

