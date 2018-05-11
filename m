Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4681F753E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 00:53:41 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id d4-v6so2535231ual.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 17:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3GOOfXQYSA9TkfrUufQmSqq25Os8pvqhblj8zsgfD0A=;
	b=poUYrTblwYpiJ03HGvDnPwAN/SclzHORzYdr7K1nUcgncnc8DGKsGAFcsgNNelFyC6
	M9kZSKHNZYNizQQwDtCiPGtLuQlo7vbqJ2Aunsq+ElXgBEw1ILDpM7mKgyWEtScgQN74
	3EF4ZbV17ralQUmRCysGfnnELmoUVqr1Lpjk6GMsjOiWNm9J+yEkcxhsnvkPBj732VHt
	qONk1U6rbxuGsd9jHkHhxL0o8ecsbmgapliaxfpAgXfLJgDaL8Zk5HtTP4TH2YQwl4x9
	GOZqJWjLkjq/h64qWuppGOUVeDYZSdAVBxfupLGwPZJlnR/0d9NytcFzK5VEBIfTP8KB
	ZWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3GOOfXQYSA9TkfrUufQmSqq25Os8pvqhblj8zsgfD0A=;
	b=eRJ/GuaIbq+aWO+NI0vyST5NnOh82ZLkJ/zWKuWY7HNMDhmk2Lb9c0t6kImxZIcJDk
	iFp6fVkMS1OzW0cjTucQv/3TCgeoQaxzRBBAtiEPJxyc0YtVChg58i7p5Oy8pCcLG/E9
	FRxVdmhD0SH7X/QoSTWuzaCmo9Y3ICXX6QB1Lo1XuuR5xdvgBWV1EZWHnXUCKYTqh7YF
	W08tjSUT3JyTeUlM3bxKvrKRvKnOr+/aCIfcG+bNyDGokxYwke+PjFJlPS6S8LefLbRc
	qzqDEW0hqG3c/f9kpwYj647t4y7mCTjOKA+g7/UAxiaEfMbMrPeP7A8n33AkyjbfmPqV
	xxJw==
X-Gm-Message-State: ALKqPwcP/jKBZTuibFvOCWBqYQb4NiLXLWsC3WLzib291BD7uMG9LQ1v
	hNRJgNoaqFbDtLuu/wU1RoUjrT/AAo9+Z3fU9ZQ=
X-Google-Smtp-Source: AB8JxZp+N1fxwdDnHDatVLUAY+682eyvYCoDS4cri9gfMX6cA+qwZKaxRcMy2n9iNCfX61gmkaMQNOHqxM0VTObZEy8=
X-Received: by 2002:a9f:336c:: with SMTP id
	a44-v6mr2725562uac.38.1526000022074; 
	Thu, 10 May 2018 17:53:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Thu, 10 May 2018 17:53:41 -0700 (PDT)
In-Reply-To: <CAMKF1sq9O820Dh-RkJ30LXZDNkSbw7p484jPspz5RLB6K-mqBg@mail.gmail.com>
References: <1525922097-15292-1-git-send-email-armccurdy@gmail.com>
	<874d828c-9387-3a1c-3a4c-381da0a0e270@gmail.com>
	<CAJ86T=VJ6OL+EABTwV9QJumdYu_CvxHOnOGKYuLonpXUyy-dig@mail.gmail.com>
	<CAMKF1sq9O820Dh-RkJ30LXZDNkSbw7p484jPspz5RLB6K-mqBg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 10 May 2018 17:53:41 -0700
Message-ID: <CAJ86T=V8DnbmwP=0xMZ_4zwHGgF5TKCPKsYuXxYtXvbo4Tt5Xg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] bitbake.conf: make libc over-ride lower priority than _forcevariable
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
X-List-Received-Date: Fri, 11 May 2018 00:53:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 10, 2018 at 3:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, May 10, 2018 at 3:33 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Wed, May 9, 2018 at 10:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On 5/9/18 8:14 PM, Andre McCurdy wrote:
>>>>
>>>> Fix long standing quirk, _forcevariable is documented as being the
>>>> highest priority over-ride.
>>>>
>>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>>> ---
>>>>   meta/conf/bitbake.conf                        | 3 ++-
>>>>   meta/conf/distro/include/tclibc-baremetal.inc | 2 --
>>>>   meta/conf/distro/include/tclibc-glibc.inc     | 2 --
>>>>   meta/conf/distro/include/tclibc-musl.inc      | 2 --
>>>>   4 files changed, 2 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>>> index a21b728..a772cab 100644
>>>> --- a/meta/conf/bitbake.conf
>>>> +++ b/meta/conf/bitbake.conf
>>>> @@ -735,7 +735,8 @@ DISTRO_NAME ??= "OpenEmbedded"
>>>>   #
>>>>   # This works for  functions as well, they are really just environment
>>>> variables.
>>>>   # Default OVERRIDES to make compilation fail fast in case of build
>>>> system misconfiguration.
>>>> -OVERRIDES =
>>>> "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
>>>> +OVERRIDES =
>>>> "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
>>>> +LIBCOVERRIDE ?= ""
>>>
>>>
>>> Overall this looks an improvement
>>>
>>>>   CLASSOVERRIDE ?= "class-target"
>>>>   DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
>>>>   MACHINEOVERRIDES ?= "${MACHINE}"
>>>> diff --git a/meta/conf/distro/include/tclibc-baremetal.inc
>>>> b/meta/conf/distro/include/tclibc-baremetal.inc
>>>> index 8d570f0..1bf44c8 100644
>>>> --- a/meta/conf/distro/include/tclibc-baremetal.inc
>>>> +++ b/meta/conf/distro/include/tclibc-baremetal.inc
>>>> @@ -4,9 +4,7 @@
>>>>     LIBCEXTENSION = ""
>>>>   -# Add baremetal libc overrides to the overrides.
>>>>   LIBCOVERRIDE = ":libc-baremetal"
>>>> -OVERRIDES .= "${LIBCOVERRIDE}"
>>>>     ASSUME_PROVIDED += "virtual/libc virtual/libiconv virtual/crypt"
>>>>   diff --git a/meta/conf/distro/include/tclibc-glibc.inc
>>>> b/meta/conf/distro/include/tclibc-glibc.inc
>>>> index ad8000f..8d10764 100644
>>>> --- a/meta/conf/distro/include/tclibc-glibc.inc
>>>> +++ b/meta/conf/distro/include/tclibc-glibc.inc
>>>> @@ -4,9 +4,7 @@
>>>>     LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') !=
>>>> '']}"
>>>>   -# Add glibc overrides to the overrides for glibc.
>>>>   LIBCOVERRIDE = ":libc-glibc"
>>>> -OVERRIDES .= "${LIBCOVERRIDE}"
>>>
>>>
>>> having .= appear was letting user know how it was being lined up in
>>> overrides, now it might raise question in new readers mind as to why ':' is
>>> prepended
>>
>> Yes, it's a shame LIBCOVERRIDE was defined with a leading : to begin
>> with, but now it's done that way I'm not sure it's worth redefining
>> (there could be classes or recipe in other layers which reference
>> LIBCOVERRIDE and expect the leading : to be there).
>>
>>   http://git.openembedded.org/openembedded-core/commit/?id=6e2b53f47da0e97271fb51b281d24da1e1d549cc
>
> oh in this case then please remove it, its not an ABI element that
> we need to keep compatibility with and layers who use it should
> change to new ways.

A patch removing the leading : was rejected about a month ago:

  http://lists.openembedded.org/pipermail/openembedded-core/2018-April/149742.html
  http://lists.openembedded.org/pipermail/openembedded-core/2018-April/149743.html

If you think RP was wrong then maybe reply to that thread and try to
get the original patch merged?

>>> so ideally it would be good to define LIBCOVERRIDE = "libc-<libc>" but that
>>> might add useless : in case of native recipes
>>>
>>> Maybe bitbake should just eat consecutive separators without consequence but
>>> that seems less than ideal too.
>>
>> Bitbake already does eat consecutive separators (it needs to for
>> native recipes, since native recipes set MACHINEOVERRIDES to "").
>>
>>>>     PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
>>>>   PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
>>>> diff --git a/meta/conf/distro/include/tclibc-musl.inc
>>>> b/meta/conf/distro/include/tclibc-musl.inc
>>>> index 54e1acf..052ae0e 100644
>>>> --- a/meta/conf/distro/include/tclibc-musl.inc
>>>> +++ b/meta/conf/distro/include/tclibc-musl.inc
>>>> @@ -4,9 +4,7 @@
>>>>     LIBCEXTENSION = "-musl"
>>>>   -# Add musl libc overrides to the overrides.
>>>>   LIBCOVERRIDE = ":libc-musl"
>>>> -OVERRIDES .= "${LIBCOVERRIDE}"
>>>>     PREFERRED_PROVIDER_virtual/libc ?= "musl"
>>>>   PREFERRED_PROVIDER_virtual/libiconv ?= "musl"
>>>>
>>>

