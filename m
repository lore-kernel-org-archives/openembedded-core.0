Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id B2EB46E221
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 18:41:14 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id uq10so3075078igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Mar 2014 10:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=b1HVIRqPvJLeNtS/+OffR7rIOJywm6jXP4W7gpo3HMA=;
	b=cMoIAm86r0K84bVnjCsGZ4ZF9DocAD82FeeUa7C6yjlWWT4TSMPZNBc9quqkyGyvz2
	YkN/B+91lS828Sx4Gd9GhYDQCWMQB5aZUrIrMasjxALgHDxVm3GUuuncS5vXCuICcvMh
	2JHW4Mf22weOcCEQm8IeAlNsAS1jY4O05EawQazj9bAsaxXvDXeeI2UB+piIn6MlstwZ
	qJWRRG3KRMmxuJ+gzsfOTvow4hHr1egUICrYK7CBU29xNxaP+/01U0WqrxENDlJUBII8
	z0cnKTAWz4zsYKKgkv85CfdY8Sl14if9Nclvbig1LwqlD4tA1+jQXwCaQrA3h31Y4icU
	Aapg==
X-Received: by 10.42.235.197 with SMTP id kh5mr16672704icb.25.1394217675097;
	Fri, 07 Mar 2014 10:41:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Fri, 7 Mar 2014 10:40:45 -0800 (PST)
In-Reply-To: <CAP71WjyKO+CKgNAr-ZB+17O=8dwb=_-aRKWNWnNRmMikoibyrA@mail.gmail.com>
References: <1393965644-17393-1-git-send-email-abelous@broadcom.com>
	<1393969384.4151.5.camel@e130.pbcl.net>
	<AC63B68CC9C36B4FBF9FD4FEEFE754AA20DAA367@SJEXCHMB06.corp.ad.broadcom.com>
	<CAMKF1sqrQ7y=UVUVgBt0nuYM=xTGofwSw2cuha91CN6rQg0TKQ@mail.gmail.com>
	<CAP71WjyKO+CKgNAr-ZB+17O=8dwb=_-aRKWNWnNRmMikoibyrA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Mar 2014 10:40:45 -0800
Message-ID: <CAMKF1srTAexcmFvCvFrCoYDNdgQJb6ZpJFTHZsj+DkZ19C5KyQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Signed-off-by: Andrey Belous <abelous@broadcom.com>
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
X-List-Received-Date: Fri, 07 Mar 2014 18:41:17 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 7, 2014 at 2:33 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> Hi Khem,
>
> On Fri, Mar 7, 2014 at 6:43 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Mar 4, 2014 at 1:55 PM, Andrey Belous <abelous@broadcom.com> wrote:
>>> Hi Phil,
>>> I have prebuild uclibc library that I would like to use, without that change I cannot force to use my prebuild library
>>>
>>
>> OK so write a uclibc recipe for it and let it provide virtual/libc
>> and, we can very well have multiple version of recipes, this is no
>> different. Then use higher DEFAULT_PREFERENCE for your recipe.
>
> I still don't get it why in distro/include/tclibc-uclibc.inc we have
>
> PREFERRED_PROVIDER_virtual/libc = "uclibc"
> PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
> PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
> PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-eglibc"
> PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-eglibc"
>
> and in distro/include/tclibc-eglibc.inc, we have:
>
> PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc"
> PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-eglibc"
> PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-eglibc"
> PREFERRED_PROVIDER_virtual/libintl ?= "eglibc"
> PREFERRED_PROVIDER_virtual/libc ?= "eglibc"
> PREFERRED_PROVIDER_virtual/nativesdk-libc ?= "nativesdk-eglibc"
> PREFERRED_PROVIDER_virtual/libc-locale ?= "eglibc-locale"
>
> Is a specific reason why in the first case we use "=" and not "?="
> like used everywhere else? This file is loaded last, so we have no
> chance to override the value. regardless of the actual reason, don't
> we need the change anyways?

I would think eglibc.inc should be fixed as well.

