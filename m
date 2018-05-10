Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id A860975393
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 22:33:19 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id g72-v6so2173473vke.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 15:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t5tK1aOUC1Ygob+XsKh3PPwFLhJL3bTspq8ao1007zA=;
	b=PSutCMc9I6A8A0h+s745u8FyXohM6ZnpLhbLFIhSl2JGnaY8zstkX4ADMhL/4JGogb
	qwWWgjQaFjWceV77fzAJuKbwQd+3iYmswFQ5O0p9aHb3+UrlXLopLDKk5ioCG7DqCKRj
	KXZ+BBAvno/dqsrVXLoqkVPSjZzgdDEaT1Fb2oaOioSlRFh0+sLu/vDSgg18gVZs/uTh
	jCvpz28RGR43z/SjxYsshONvARV7uDtJNeIre8zSzwNsl+rmqNa3B8XRI+IkbygHhoqX
	RHBmsViy9KFuzPON/59EfR8abzuERO8VNHkuZO3d2Bu7mr3g37RegX6HTiXY14Utz4OZ
	XG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t5tK1aOUC1Ygob+XsKh3PPwFLhJL3bTspq8ao1007zA=;
	b=dWS6T75G1iEpKK1Ilw1MYC8Mq6q0Nnqq/3GApkDOoDw/izp4tAwpuwemSq0yMJ7/hl
	UDNJprdX4VhrirbgZfidkrFHzGvK/w9VU+YwYam0hTtWjb8Xm5OzNlHOgM4XLsrCxoHN
	mkGA9xsXTB+RbN4IZp2HjyrbVt/+4BQoCYUoPp2bzKizCy7A/zvMlZPuAlq5OzI2okJS
	NbU6t5e9elAy59x4dKrGspiTYDPjLEcKym5ac/zk12EJ3uFwxknT08p3Nxeb3XGFVAEy
	claSO85qrIfJykp+5tRUKKRkEkS2lUPcamPS0JBV9OKx82iOgMxfUWj+6qJS/5ilbGqr
	oklA==
X-Gm-Message-State: ALKqPweoSmeVVMxHHuwa1F1XzQQvCM7KaMhB6OqT0j1gBlUUhslwhR6v
	ktIfbzNLuHYXWmpvQhgbx2hQ8AxaJmrK8Uac9cI=
X-Google-Smtp-Source: AB8JxZpEcIFjCdMM4pyltjJzLQrNSQeyFVAVOj6z3mzIC1u/3TBoNNFILvYKrKQZ3g3bicqGrf1EWiwIHkBLogL3Xtg=
X-Received: by 2002:a1f:a7c7:: with SMTP id
	q190-v6mr2299665vke.5.1525991600203; 
	Thu, 10 May 2018 15:33:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Thu, 10 May 2018 15:33:19 -0700 (PDT)
In-Reply-To: <874d828c-9387-3a1c-3a4c-381da0a0e270@gmail.com>
References: <1525922097-15292-1-git-send-email-armccurdy@gmail.com>
	<874d828c-9387-3a1c-3a4c-381da0a0e270@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 10 May 2018 15:33:19 -0700
Message-ID: <CAJ86T=VJ6OL+EABTwV9QJumdYu_CvxHOnOGKYuLonpXUyy-dig@mail.gmail.com>
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
X-List-Received-Date: Thu, 10 May 2018 22:33:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 9, 2018 at 10:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On 5/9/18 8:14 PM, Andre McCurdy wrote:
>>
>> Fix long standing quirk, _forcevariable is documented as being the
>> highest priority over-ride.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>   meta/conf/bitbake.conf                        | 3 ++-
>>   meta/conf/distro/include/tclibc-baremetal.inc | 2 --
>>   meta/conf/distro/include/tclibc-glibc.inc     | 2 --
>>   meta/conf/distro/include/tclibc-musl.inc      | 2 --
>>   4 files changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index a21b728..a772cab 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -735,7 +735,8 @@ DISTRO_NAME ??= "OpenEmbedded"
>>   #
>>   # This works for  functions as well, they are really just environment
>> variables.
>>   # Default OVERRIDES to make compilation fail fast in case of build
>> system misconfiguration.
>> -OVERRIDES =
>> "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
>> +OVERRIDES =
>> "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
>> +LIBCOVERRIDE ?= ""
>
>
> Overall this looks an improvement
>
>>   CLASSOVERRIDE ?= "class-target"
>>   DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
>>   MACHINEOVERRIDES ?= "${MACHINE}"
>> diff --git a/meta/conf/distro/include/tclibc-baremetal.inc
>> b/meta/conf/distro/include/tclibc-baremetal.inc
>> index 8d570f0..1bf44c8 100644
>> --- a/meta/conf/distro/include/tclibc-baremetal.inc
>> +++ b/meta/conf/distro/include/tclibc-baremetal.inc
>> @@ -4,9 +4,7 @@
>>     LIBCEXTENSION = ""
>>   -# Add baremetal libc overrides to the overrides.
>>   LIBCOVERRIDE = ":libc-baremetal"
>> -OVERRIDES .= "${LIBCOVERRIDE}"
>>     ASSUME_PROVIDED += "virtual/libc virtual/libiconv virtual/crypt"
>>   diff --git a/meta/conf/distro/include/tclibc-glibc.inc
>> b/meta/conf/distro/include/tclibc-glibc.inc
>> index ad8000f..8d10764 100644
>> --- a/meta/conf/distro/include/tclibc-glibc.inc
>> +++ b/meta/conf/distro/include/tclibc-glibc.inc
>> @@ -4,9 +4,7 @@
>>     LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') !=
>> '']}"
>>   -# Add glibc overrides to the overrides for glibc.
>>   LIBCOVERRIDE = ":libc-glibc"
>> -OVERRIDES .= "${LIBCOVERRIDE}"
>
>
> having .= appear was letting user know how it was being lined up in
> overrides, now it might raise question in new readers mind as to why ':' is
> prepended

Yes, it's a shame LIBCOVERRIDE was defined with a leading : to begin
with, but now it's done that way I'm not sure it's worth redefining
(there could be classes or recipe in other layers which reference
LIBCOVERRIDE and expect the leading : to be there).

  http://git.openembedded.org/openembedded-core/commit/?id=6e2b53f47da0e97271fb51b281d24da1e1d549cc

> so ideally it would be good to define LIBCOVERRIDE = "libc-<libc>" but that
> might add useless : in case of native recipes
>
> Maybe bitbake should just eat consecutive separators without consequence but
> that seems less than ideal too.

Bitbake already does eat consecutive separators (it needs to for
native recipes, since native recipes set MACHINEOVERRIDES to "").

>>     PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
>>   PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
>> diff --git a/meta/conf/distro/include/tclibc-musl.inc
>> b/meta/conf/distro/include/tclibc-musl.inc
>> index 54e1acf..052ae0e 100644
>> --- a/meta/conf/distro/include/tclibc-musl.inc
>> +++ b/meta/conf/distro/include/tclibc-musl.inc
>> @@ -4,9 +4,7 @@
>>     LIBCEXTENSION = "-musl"
>>   -# Add musl libc overrides to the overrides.
>>   LIBCOVERRIDE = ":libc-musl"
>> -OVERRIDES .= "${LIBCOVERRIDE}"
>>     PREFERRED_PROVIDER_virtual/libc ?= "musl"
>>   PREFERRED_PROVIDER_virtual/libiconv ?= "musl"
>>
>

