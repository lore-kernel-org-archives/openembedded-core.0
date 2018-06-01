Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC5E60017
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 15:15:34 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id x9-v6so12662354pfm.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 08:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=LHpEjyKJpSzK2A4D6xMWTOWlS6KTvBV/i5AxdfMk5xQ=;
	b=o+/zzJR9NjI2WVvnQTV2PWQatKRJk8G2ZFFX1tokiepEpQ5fPcXhr0W3gN8vJI1DBC
	WEmVrNvXP4RG2PWzDjR8Fo3as21MNSI0TKx6/1+NSqVqER16MY978kO0G1K8hkQH5Uok
	56XRLoUt0lHZgmjyLjK3Qd+O/iwObAGYKHa3wFzG9WVk6RJgPrpzgD8FYB5PKEEzUBU1
	1dyyj+ZLd2RZZ1FfAytQEnt6Vra+rjnVhedAg3bPAoSQn4kSnUBTBKWrGnm21YLY2dRb
	4toePLWnliXUrMl2rBjpTV5yFHxGencMVkiPFSokxtyA1iolVCEBPe8NVMH4VhwUgZ4r
	uzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=LHpEjyKJpSzK2A4D6xMWTOWlS6KTvBV/i5AxdfMk5xQ=;
	b=HbUnLnAoQEUYQ8x9Q/WLMLURiKj0n+f0c6RxdiGewJAJW3RR8FisB9hsORwGekmKJQ
	IyYuRarLjzQbCC2QkyCsWsXW7uC/0vR5NHDDCb8elKYf6wr3RKdH1Hyi+q1eTr4hA/0f
	34ae29OUjPxHJXLslWkzVyGDMq+6Gp1vgPvRlhBon20rGqh9wORfD+7j+FhAaVXsEKGp
	AGNfyV4TS9xTCyPiYvFIK1Jg4fQxfOdmNSvIq5YRbGBD607zVXw2Qam8rNlzRJvNJlk8
	C+y6DjXbQXNi2PqSJlJXXwJbI29vm7NJzZ8Xa3r/flpih4W+Fu1oiqjS5ZFjTZ63tL90
	Lmdg==
X-Gm-Message-State: ALKqPwe245FIR2h1jTf+4Mpm8c2VR1BYB44ZIDqjlIOV5aQHRPF1AeI9
	TdkubfLLjaM5pmlKftesstNGVA==
X-Google-Smtp-Source: ADUXVKK6D4t/LppSpFIkClcZjP3mt2W538MCAJktj0kFk5iqIiH/CHrS0IsKE1UIOq7EvYtSLyPORQ==
X-Received: by 2002:a63:203:: with SMTP id 3-v6mr9248378pgc.133.1527866135307; 
	Fri, 01 Jun 2018 08:15:35 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:cd69:7d4:a4bc:31b4?
	([2601:202:4000:1184:cd69:7d4:a4bc:31b4])
	by smtp.gmail.com with ESMTPSA id
	k73-v6sm25415179pfb.31.2018.06.01.08.15.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jun 2018 08:15:34 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1526696034-3857-1-git-send-email-akuster@mvista.com>
	<1526696034-3857-6-git-send-email-akuster@mvista.com>
	<CAJTo0LbV4mAKK1drQ-LcgsrL8JC_MmYrqhYmM1QPGhJRSx+cPw@mail.gmail.com>
	<62741663-6b5c-c4d3-6376-2e5ffe8e197c@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <108ea3e8-8aef-7bec-ca9c-cda47772a1fe@gmail.com>
Date: Fri, 1 Jun 2018 08:15:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <62741663-6b5c-c4d3-6376-2e5ffe8e197c@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] xserver-xorg: upgrade 1.19.6 -> 1.20.0
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
X-List-Received-Date: Fri, 01 Jun 2018 15:15:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 05/28/2018 07:25 AM, akuster808 wrote:
>
> On 05/23/2018 04:01 AM, Burton, Ross wrote:
>> This is breaking a number of other bits of X:
>>
>> - xf86-video-intel (was DRI1 removed or disabled in 1.20?)
DRI 1 is still there.

>> - xf86-input-mouse
sent fixed for xf86-inout-mount

>> - xf86-video-omapfb
> hmm, will double check
>
> - armin
>> Ross
>>
>> On 19 May 2018 at 03:13, Armin Kuster <akuster808@gmail.com> wrote:
>>> From: Armin Kuster <akuster808@gmail.com>
>>>
>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> ---
>>>  ...1-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch | 19 +++++++++----------
>>>  ...{xserver-xorg_1.19.6.bb => xserver-xorg_1.20.0.bb} |  4 ++--
>>>  2 files changed, 11 insertions(+), 12 deletions(-)
>>>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.19.6.bb => xserver-xorg_1.20.0.bb} (89%)
>>>
>>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
>>> index 16ec3ed..020a1cf 100644
>>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
>>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
>>> @@ -1,12 +1,13 @@
>>> -Discover monotonic clock using compile-time check
>>> +From 8a91316c4a38f20e7866289f3d779a037d27a129 Mon Sep 17 00:00:00 2001
>>> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>>> +Date: Mon, 12 Dec 2016 12:11:39 +0200
>>> +Subject: [PATCH] Discover monotonic clock using compile-time check
>>>
>>>  monotonic clock check does not work when cross-compiling.
>>>
>>>  Upstream-Status: Denied [Does not work on OpenBSD]
>>>  Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>>>
>>> -
>>> -
>>>  Original patch follows:
>>>
>>>  When xorg-xserver is being cross-compiled, there is currently no way
>>> @@ -21,15 +22,16 @@ monotonic clock is available. This check can run just fine when we are
>>>  cross-compiling.
>>>
>>>  Signed-off-by: David James <davidjames at google.com>
>>> +
>>>  ---
>>>   configure.ac | 17 +++++++----------
>>>   1 file changed, 7 insertions(+), 10 deletions(-)
>>>
>>>  diff --git a/configure.ac b/configure.ac
>>> -index f7ab48c..26e85cd 100644
>>> +index 2b21667..786e002 100644
>>>  --- a/configure.ac
>>>  +++ b/configure.ac
>>> -@@ -1048,19 +1048,16 @@ if ! test "x$have_clock_gettime" = xno; then
>>> +@@ -984,19 +984,16 @@ if ! test "x$have_clock_gettime" = xno; then
>>>           CPPFLAGS="$CPPFLAGS -D_POSIX_C_SOURCE=200112L"
>>>       fi
>>>
>>> @@ -54,8 +56,5 @@ index f7ab48c..26e85cd 100644
>>>  -       [MONOTONIC_CLOCK="cross compiling"])
>>>  +]])],[MONOTONIC_CLOCK=yes], [MONOTONIC_CLOCK=no])
>>>
>>> -     LIBS="$LIBS_SAVE"
>>> -     CPPFLAGS="$CPPFLAGS_SAVE"
>>> ---
>>> -2.1.4
>>> -
>>> +     if test "$MONOTONIC_CLOCK" = "cross compiling"; then
>>> +         AC_CHECK_DECL([CLOCK_MONOTONIC],[MONOTONIC_CLOCK="guessing yes"],[MONOTONIC_CLOCK=no],[#include <time.h>])
>>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.0.bb
>>> similarity index 89%
>>> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
>>> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.0.bb
>>> index c680cf9..620eb7b 100644
>>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
>>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.0.bb
>>> @@ -6,8 +6,8 @@ SRC_URI += "file://musl-arm-inb-outb.patch \
>>>              file://0003-Remove-check-for-useSIGIO-option.patch \
>>>              file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
>>>              "
>>> -SRC_URI[md5sum] = "3e47777ff034a331aed2322b078694a8"
>>> -SRC_URI[sha256sum] = "a732502f1db000cf36a376cd0c010ffdbf32ecdd7f1fa08ba7f5bdf9601cc197"
>>> +SRC_URI[md5sum] = "c1ca1ea0a905ea788da03c77cc38b06e"
>>> +SRC_URI[sha256sum] = "9d967d185f05709274ee0c4f861a4672463986e550ca05725ce27974f550d3e6"
>>>
>>>  # These extensions are now integrated into the server, so declare the migration
>>>  # path for in-place upgrades.
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


