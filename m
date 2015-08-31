Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3B75B74197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 17:11:08 +0000 (UTC)
Received: by iods203 with SMTP id s203so165723798iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 10:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=lh1Hw3VUOxAESGMYHnYO+y1oLGwRAKlL+Fr4+IwtaFQ=;
	b=QeFQKhRb5lXDv/UuYPxFNSbkZLtQIp0IemwwghCZs0yMZV3xAr5N4OQPpa75srFsQj
	DHzO3bEY7Tu5eBMbmJbIjRdrIOL2pKWGDGtL2BVQ58G6ccnEpjdWTyBXH0Kid41vN0Sm
	KWo9KTE0w1ktKif8mdMWt1RtLmwMKJLoK/yNfpMuNuYX3DrbAm+e7SxnfYsXKzfdWVln
	CsUGRNRb4GsXgKhWNDx3+wMaPoIAlPBdrxYLrwow+J6eeorvluyGuYv/Ntr/VSmrWT8G
	nicrrT1XkXk63bW4bRBLvuluWUM6yDTTtFj4g/tgSsfxUI0aB+V4jSHTcXmIvd90NxnF
	ucKg==
X-Received: by 10.107.35.195 with SMTP id j186mr23677929ioj.49.1441041068686; 
	Mon, 31 Aug 2015 10:11:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.202 with HTTP; Mon, 31 Aug 2015 10:10:39 -0700 (PDT)
In-Reply-To: <CAPhnLPBue6s_m7rYYyuy6hyxdBTz8y1MedgspDeOLcL1XaunYQ@mail.gmail.com>
References: <1440952270-9085-1-git-send-email-raj.khem@gmail.com>
	<CAPhnLPBue6s_m7rYYyuy6hyxdBTz8y1MedgspDeOLcL1XaunYQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Aug 2015 10:10:39 -0700
Message-ID: <CAMKF1srWus=7f3EoCGtMVez0FbsFPsa1g8COMM87pqxxpkg2zw@mail.gmail.com>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xz: Correctly specify GPL-3.0 with autoconf exception
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
X-List-Received-Date: Mon, 31 Aug 2015 17:11:10 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 10:05 AM, Flanagan, Elizabeth
<elizabeth.flanagan@intel.com> wrote:
> On 30 August 2015 at 17:31, Khem Raj <raj.khem@gmail.com> wrote:
>> There is m4/ax_pthread.m4 macro which uses GPL-3.0 with autoconf
>> exception, there is no other occurance of GPL-3.0 use, lets mark the
>> licence correctly.
>
> Unless the macro is actually shipped with any of the packages, I don't
> think we actually need to do this. Generally, LICENSE should be the
> intersection of all LICENSE_${PN}*.

its not shipped on target,

>
> I think the correct fix here is actually:
>
> LICENSE = "GPLv2+ & PD"

why did you drop LGPLv2.1+

> LICENSE_${PN} = "GPLv2+"
> LICENSE_${PN}-dev = "GPLv2+"
> LICENSE_${PN}-staticdev = "GPLv2+"
> LICENSE_${PN}-doc = "GPLv2+"
> LICENSE_${PN}-dbg = "GPLv2+"
> LICENSE_${PN}-locale = "GPLv2+"
> LICENSE_liblzma = "PD"
>
>
>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-extended/xz/xz_5.2.1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/xz/xz_5.2.1.bb b/meta/recipes-extended/xz/xz_5.2.1.bb
>> index e0ae48f..cf7fba6 100644
>> --- a/meta/recipes-extended/xz/xz_5.2.1.bb
>> +++ b/meta/recipes-extended/xz/xz_5.2.1.bb
>> @@ -6,7 +6,7 @@ SECTION = "base"
>>  # which is GPLv3 is an m4 macro which isn't shipped in any of our packages,
>>  # and the LGPL bits are under lib/, which appears to be used for libgnu, which
>>  # appears to be used for DOS builds. So we're left with GPLv2+ and PD.
>> -LICENSE = "GPLv2+ & GPLv3+ & LGPLv2.1+ & PD"
>> +LICENSE = "GPLv2+ & GPL-3.0-with-autoconf-exception & LGPLv2.1+ & PD"
>>  LICENSE_${PN} = "GPLv2+"
>>  LICENSE_${PN}-dev = "GPLv2+"
>>  LICENSE_${PN}-staticdev = "GPLv2+"
>> --
>> 2.5.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Elizabeth Flanagan
> Yocto Project
> Build and Release

