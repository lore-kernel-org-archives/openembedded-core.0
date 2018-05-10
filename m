Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E5934753DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 22:41:15 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id p14-v6so1739451pfh.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 15:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bKPnKXP2+TyK04Mhj5MpobbZ7WFCURoCL2CcaV59sP4=;
	b=TD9MZF6Fpr0rLp2bpKrYcXXqlM2ggJtEhLeEBHOVdpMKujUVVqDf8KJ6lmOBqKe05c
	VMZUZAyerQTMEpqj6JzFUP6gnESeWMJkW7VGwMLubR+4M8boAdWqNtVQqvK0JLHXNoE5
	Vdo0dJpoZySIL10vvVZZomRgZ6udRgckUBlB9X0klFFZdL2pyjabEJ1Kk3o2QNK+SqZt
	Kgk4JUO5hgbfmG6nqFilScQ8ndGg3qLEvMctqDpmkyPcPEJrKZQHpo2L2tndDT8qWsPe
	CuMepaKD36J7nqvEtmwBYqtv+dKSpWy3pPktfpm7ANzelQzOGZFhPgotuiFaKgxkDjeU
	exlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bKPnKXP2+TyK04Mhj5MpobbZ7WFCURoCL2CcaV59sP4=;
	b=oa5AS0+ZhyY8+CZvJl+eEgaOzN1w93kwGeWYNAm0+ScPAsQ6X/TenpGONWw49SkWPS
	rZ+Mbg6bQ5cDm13qbiRLImHKsITas61GD3CQN29mF6z9jXX+J4Fm1jXzum+l9H/lTcBF
	l6OoIPhyH4+07+/yQxuLJrc2682MQVqiEYj5hIwf2l3SiAactHOD4IAm7M3kcCs2ASYM
	j69udnvWhP+9RAqp5LVFzYCo1ip463SuIGpMKRFx3Jqks7lErRvhbpZdPxqD84URcJIP
	D3n3/bPrw86WUtYVOIDo5ItHK9U+RF1Qm1b4cCMHlvCrZ8+GX5eeVENGxPXRFphDVS2I
	zufw==
X-Gm-Message-State: ALKqPwesCyWKQ9VDtSLTPUm/9P+3o1/IHQ+fLTaJw0kpLNNlyIwWmUJM
	oEeUGOZolSCjwf0q+yzIF81AoLfS4cQMqZPr2io=
X-Google-Smtp-Source: AB8JxZqwB+U7QvUFM3/k0LXnPGBW3n0qZzUYJKTKu72vI0tEA2gofP2zdPC5Gl1fhBxfD36VIq8M0acfosU0abCZM6g=
X-Received: by 2002:a62:74b:: with SMTP id
	b72-v6mr3009697pfd.133.1525992076616; 
	Thu, 10 May 2018 15:41:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.147.132 with HTTP; Thu, 10 May 2018 15:40:45 -0700 (PDT)
In-Reply-To: <CAJ86T=VJ6OL+EABTwV9QJumdYu_CvxHOnOGKYuLonpXUyy-dig@mail.gmail.com>
References: <1525922097-15292-1-git-send-email-armccurdy@gmail.com>
	<874d828c-9387-3a1c-3a4c-381da0a0e270@gmail.com>
	<CAJ86T=VJ6OL+EABTwV9QJumdYu_CvxHOnOGKYuLonpXUyy-dig@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 May 2018 15:40:45 -0700
Message-ID: <CAMKF1sq9O820Dh-RkJ30LXZDNkSbw7p484jPspz5RLB6K-mqBg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Thu, 10 May 2018 22:41:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 10, 2018 at 3:33 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, May 9, 2018 at 10:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On 5/9/18 8:14 PM, Andre McCurdy wrote:
>>>
>>> Fix long standing quirk, _forcevariable is documented as being the
>>> highest priority over-ride.
>>>
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>   meta/conf/bitbake.conf                        | 3 ++-
>>>   meta/conf/distro/include/tclibc-baremetal.inc | 2 --
>>>   meta/conf/distro/include/tclibc-glibc.inc     | 2 --
>>>   meta/conf/distro/include/tclibc-musl.inc      | 2 --
>>>   4 files changed, 2 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> index a21b728..a772cab 100644
>>> --- a/meta/conf/bitbake.conf
>>> +++ b/meta/conf/bitbake.conf
>>> @@ -735,7 +735,8 @@ DISTRO_NAME ??= "OpenEmbedded"
>>>   #
>>>   # This works for  functions as well, they are really just environment
>>> variables.
>>>   # Default OVERRIDES to make compilation fail fast in case of build
>>> system misconfiguration.
>>> -OVERRIDES =
>>> "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
>>> +OVERRIDES =
>>> "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
>>> +LIBCOVERRIDE ?= ""
>>
>>
>> Overall this looks an improvement
>>
>>>   CLASSOVERRIDE ?= "class-target"
>>>   DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
>>>   MACHINEOVERRIDES ?= "${MACHINE}"
>>> diff --git a/meta/conf/distro/include/tclibc-baremetal.inc
>>> b/meta/conf/distro/include/tclibc-baremetal.inc
>>> index 8d570f0..1bf44c8 100644
>>> --- a/meta/conf/distro/include/tclibc-baremetal.inc
>>> +++ b/meta/conf/distro/include/tclibc-baremetal.inc
>>> @@ -4,9 +4,7 @@
>>>     LIBCEXTENSION = ""
>>>   -# Add baremetal libc overrides to the overrides.
>>>   LIBCOVERRIDE = ":libc-baremetal"
>>> -OVERRIDES .= "${LIBCOVERRIDE}"
>>>     ASSUME_PROVIDED += "virtual/libc virtual/libiconv virtual/crypt"
>>>   diff --git a/meta/conf/distro/include/tclibc-glibc.inc
>>> b/meta/conf/distro/include/tclibc-glibc.inc
>>> index ad8000f..8d10764 100644
>>> --- a/meta/conf/distro/include/tclibc-glibc.inc
>>> +++ b/meta/conf/distro/include/tclibc-glibc.inc
>>> @@ -4,9 +4,7 @@
>>>     LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') !=
>>> '']}"
>>>   -# Add glibc overrides to the overrides for glibc.
>>>   LIBCOVERRIDE = ":libc-glibc"
>>> -OVERRIDES .= "${LIBCOVERRIDE}"
>>
>>
>> having .= appear was letting user know how it was being lined up in
>> overrides, now it might raise question in new readers mind as to why ':' is
>> prepended
>
> Yes, it's a shame LIBCOVERRIDE was defined with a leading : to begin
> with, but now it's done that way I'm not sure it's worth redefining
> (there could be classes or recipe in other layers which reference
> LIBCOVERRIDE and expect the leading : to be there).
>
>   http://git.openembedded.org/openembedded-core/commit/?id=6e2b53f47da0e97271fb51b281d24da1e1d549cc
>

oh in this case then please remove it, its not an ABI element that
we need to keep compatibility with and layers who use it should
change to new ways.

>> so ideally it would be good to define LIBCOVERRIDE = "libc-<libc>" but that
>> might add useless : in case of native recipes
>>
>> Maybe bitbake should just eat consecutive separators without consequence but
>> that seems less than ideal too.
>
> Bitbake already does eat consecutive separators (it needs to for
> native recipes, since native recipes set MACHINEOVERRIDES to "").
>
>>>     PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
>>>   PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
>>> diff --git a/meta/conf/distro/include/tclibc-musl.inc
>>> b/meta/conf/distro/include/tclibc-musl.inc
>>> index 54e1acf..052ae0e 100644
>>> --- a/meta/conf/distro/include/tclibc-musl.inc
>>> +++ b/meta/conf/distro/include/tclibc-musl.inc
>>> @@ -4,9 +4,7 @@
>>>     LIBCEXTENSION = "-musl"
>>>   -# Add musl libc overrides to the overrides.
>>>   LIBCOVERRIDE = ":libc-musl"
>>> -OVERRIDES .= "${LIBCOVERRIDE}"
>>>     PREFERRED_PROVIDER_virtual/libc ?= "musl"
>>>   PREFERRED_PROVIDER_virtual/libiconv ?= "musl"
>>>
>>

