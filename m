Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8687778985
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 19:21:56 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id q11-v6so4136096oic.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 12:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8cB30SZGgl16loeniIkiR4PSBHuRztHFUje4KtZzIYE=;
	b=lZXcIBSzzFmP+pVkxptmggM3D2IJK0GhPeh664usP8Byq74yGXYOxLYaWpEZHBINYK
	P6ZwyCTZcJg8SUNbkoAb86k6G4RjDFXNp6dXXlAs2qPeuW/Wuw2ar3WwL+VFWanZHyx6
	pLWe+cOfc5jyd45tLKjsdIzc7G3Be7biDWHOtnnnwoH0030jcnmGBp91ThDQxwZPp7nf
	//YavpzOmpbN8pTGxU+TBQN3HWRtzvVSGz4GFhruvv4OdxVXasTHHgDlwKs7mmtU5OtT
	FZebMi02xLanzuOjr7Hqd2TiWlLU9CmhiCPIrXK6g1XCksuZlzeXSGgEyS90KnFytI7p
	mdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8cB30SZGgl16loeniIkiR4PSBHuRztHFUje4KtZzIYE=;
	b=J4HLYd74scS1/ggTbbrCoQ/4gi57BCETw3JIpUgFod4pL0wm/IDa4lNbPql4J8ceYv
	hNLMASsixM8Oq7yChbn8vaEcR2axnZ4YP2y7W7B01cZJEZK8qMxgg6GNoeYU5u93InBX
	4trPKrlkSBSm61vaZQDPxgiYv0fCL6Re3vnoM5N9fA0P7GKD025DkoKfq0CmggQvrSaX
	+5CXtsejVNZj2L6Gi7cPdiCbYabQ/z48OlKIxoYGd3whps7Up5GzkguqbEm3/4MawKOg
	OGYItoV0ggXFWulB5JE21Kv+DRQ0Bf/+fe5LlPHVtLDFDalmK/7kj7q82H4x2M2mD5YZ
	1Rbw==
X-Gm-Message-State: AOUpUlHNWis2o43UvIdeJ7cZxpOXUTynFMtm6vJOxnvNUGDD7H89tR+C
	ceyEQI8h/p9yfylS+GsR8h8VYnWvrwkj+WC1vQ9ooQ==
X-Google-Smtp-Source: AAOMgpfsZVjZEXR/Q+qltgdSWNuISZx4mXdDEUsWueCs6yKVtq84dlX5wh0fxpRJAXhAJrmZBEF6v3axcBF+F/KLg1Y=
X-Received: by 2002:aca:3f41:: with SMTP id
	m62-v6mr3347258oia.18.1531855317542; 
	Tue, 17 Jul 2018 12:21:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 12:21:36
	-0700 (PDT)
In-Reply-To: <CAMKF1sq+kYj+hiPRRMbwZOR-Rr-MRmSM5aAoKUEWwiyROQPT3g@mail.gmail.com>
References: <20180717163910.3196-1-ross.burton@intel.com>
	<20180717163910.3196-12-ross.burton@intel.com>
	<CAMKF1sq+kYj+hiPRRMbwZOR-Rr-MRmSM5aAoKUEWwiyROQPT3g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Jul 2018 20:21:36 +0100
Message-ID: <CAJTo0LZCVmN1bZfOEUPqp01kamBs6sgnycfkwyERCx0oZjSYYQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/15] harfbuzz: upgrade 1.7.5 -> 1.8.4
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
X-List-Received-Date: Tue, 17 Jul 2018 19:21:56 -0000
Content-Type: text/plain; charset="UTF-8"

Realised I forgot to put that and updated my branch.  Because there's
a new library, libharfbuzz-subset.so, which doesn't justify a new
subpackage but otherwise upsets the renaming.

Ross

On 17 July 2018 at 19:23, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jul 17, 2018 at 9:41 AM Ross Burton <ross.burton@intel.com> wrote:
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  .../harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.4.bb}              | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>  rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.4.bb} (86%)
>>
>> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.4.bb
>> similarity index 86%
>> rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
>> rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.8.4.bb
>> index 0a9b029461f..4d5964d6bb7 100644
>> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
>> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.4.bb
>> @@ -11,9 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
>>  DEPENDS = "glib-2.0 cairo fontconfig freetype"
>>
>>  SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
>> -
>> -SRC_URI[md5sum] = "1466ab51fc5aaa6af4065936939cec62"
>> -SRC_URI[sha256sum] = "84574e1b1f65ca694cb8fb6905309665c0368af18a312357f8ff886ee2f29563"
>> +SRC_URI[md5sum] = "f176eeda0a4e51a056d3ea6b9e65c27f"
>> +SRC_URI[sha256sum] = "3c592f86fa0da69e2e0e98cae9f5d5b61def3bb7948aa00ca45748f27fa545fd"
>>
>>  inherit autotools pkgconfig lib_package gtk-doc
>>
>> @@ -30,6 +29,8 @@ EXTRA_OECONF = " \
>>
>>  PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
>>
>> +LEAD_SONAME = "libharfbuzz.so"
>> +
>
> why is this needed in this version
>
>>  FILES_${PN}-icu = "${libdir}/libharfbuzz-icu.so.*"
>>  FILES_${PN}-icu-dev = "${libdir}/libharfbuzz-icu.la \
>>                         ${libdir}/libharfbuzz-icu.so \
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

