Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id D2546607E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 01:34:27 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id h69so2206808pfe.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 18:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DCkuBMte6U98bvN6RAwnHXBzxfFAOWUsgoXxF3ApjyI=;
	b=MEB1ipbFMF/bMc/OCtnK4yVkXVs1iALQ6qu1Ya4niptyKONhmMlj+DWap/Rlqwqx13
	ikHWbQaaNapI3JKPaZQEtwsbcYsSsSuvoDULAXjW3A1vhHoSYT58k/hvP0liFSMr47ww
	mwwwYkP3IZ9QsZhZ1BV6407d1Kn3BO1FWeyh+Pmx3O4ZNdKKZnhOj7LfS0qwY306TCVO
	wTljHycvfotj/SkRkFrdHBh6BgPo15PWFzlnz7Vsb4QGNU2hJ330mzQmDoKiWPdCsfd3
	b/uEcZUeKcLLFp6wNeZeJ0LBXETOu3ZXYiaqyH01Gj2957mkdex0V1+a4mPKeaHlsR2Z
	Ss8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DCkuBMte6U98bvN6RAwnHXBzxfFAOWUsgoXxF3ApjyI=;
	b=CdEJB+90xFifSFp6GUKCt+09wWqSP8Mg9elG5eORP8wNERvtdN5R1ceiSPodpwsOrj
	eUARz/ZitINY/l1MahRnTY2Mg4t/yIBJAi1eBPpM6mxjsw1Un4wVrEFQLzEPgCbNOhJG
	YW8RGGoA8y1onZwKljDdDDfOQKH1Caqb7s7viRft5rZT/5C3l+fG6gwTgL10CCzNGIDS
	W0OvBNXyGfSEYqskRPvNDM7AjHXl5OLcogB/FGgpkMgMWCCNTz7YKt93NuUzCdUprOLX
	wGxPF2JYY54uR/bcNVx1aXw+wx4ynZDetjDCBiQufPzjfE1WI8ekWGsWk1AybhaVapY6
	kYcQ==
X-Gm-Message-State: ALQs6tCpOQca5a0roiI5/g3AY+0Bm3fJL8NmZiR57m22T2a+leeRbk/y
	a1Jl2kGvVL24Ar3rm4o/wRheGj1mDJq96F+vZSU=
X-Google-Smtp-Source: AIpwx48FR/0DcupcMAmWSRKJtOKaYnNt0pwaSRkULomB5/jfNoQnB7bH0DnGoD2+ngaXQA+Dir6DSBBabgcQ2aU1toI=
X-Received: by 10.99.96.147 with SMTP id u141mr5152380pgb.227.1523496868730;
	Wed, 11 Apr 2018 18:34:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.187.129 with HTTP; Wed, 11 Apr 2018 18:33:58 -0700 (PDT)
In-Reply-To: <20180412011902.GG3228@denix.org>
References: <20180410143532.31916-1-ross.burton@intel.com>
	<CA+chaQdRDvvi-2UgmbC_=yjiuN-8yqdrk5K1yzTh9CVKZsXiJA@mail.gmail.com>
	<CAJTo0LZWZRj0u9J+Z42Lxuh98u-f2i8HQwM37z1TPqRB9KbfLA@mail.gmail.com>
	<CAMKF1srSW0=y7K3q+q-cUN7XXTnGiRV1e5Ag3PjC2tb12Htqnw@mail.gmail.com>
	<CAJTo0Lbon36HCngX2DFNtfrtZQP-nn2t=hp=_mAeHK-bYBpF6w@mail.gmail.com>
	<20180412011902.GG3228@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Apr 2018 18:33:58 -0700
Message-ID: <CAMKF1spjNd8BDkV4eKDQ-t8rze+z0pTqRTYVdsB23RMSf_PVvQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: use pigz to create .gz files
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
X-List-Received-Date: Thu, 12 Apr 2018 01:34:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 11, 2018 at 6:19 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, Apr 11, 2018 at 05:07:38PM +0100, Burton, Ross wrote:
>> Woud be interesting to see a benchmark of a full build from scratch
>> with host gzip vs host pigz...
>
> Is pigz so widely used now to be available in every Linux distro like gzip?
>

Tested distros do seem to provide it as old as ubuntu 14.04 and centos 6
xz is another option for sstate archives the extra time it requires might
be compensated with threaded run in addition the archives will be smaller

>
>> On 11 April 2018 at 17:03, Khem Raj <raj.khem@gmail.com> wrote:
>> > On Wed, Apr 11, 2018 at 6:36 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> >> Wouldn't that introduce a fun circular dependency if pigz-native needs
>> >> to be built?
>> >>
>> >
>> > interesting idea certainly, if it ends up with improvements in build
>> > time, we could
>> > add pigz to host dependencies.
>> >
>> >> Ross
>> >>
>> >> On 11 April 2018 at 11:53, Martin Jansa <martin.jansa@gmail.com> wrote:
>> >>> What about using pigz for sstate-cache archives?
>> >>>
>> >>> On Tue, Apr 10, 2018 at 4:35 PM, Ross Burton <ross.burton@intel.com> wrote:
>> >>>>
>> >>>> Since pigz is no longer a drop-in replacement for gzip (oe-core 1624b7b)
>> >>>> the
>> >>>> image creation has been using gzip instead of pigz, despite still
>> >>>> depending on
>> >>>> pigz-native.  Fix this by invoking pigz explicitly.
>> >>>>
>> >>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> >>>> ---
>> >>>>  meta/classes/image_types.bbclass | 2 +-
>> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>>>
>> >>>> diff --git a/meta/classes/image_types.bbclass
>> >>>> b/meta/classes/image_types.bbclass
>> >>>> index e872ae20982..00a00d318f4 100644
>> >>>> --- a/meta/classes/image_types.bbclass
>> >>>> +++ b/meta/classes/image_types.bbclass
>> >>>> @@ -281,7 +281,7 @@ COMPRESSIONTYPES ?= ""
>> >>>>
>> >>>>  CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum
>> >>>> sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2
>> >>>> ${COMPRESSIONTYPES}"
>> >>>>  CONVERSION_CMD_lzma = "lzma -k -f -7
>> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>> >>>> -CONVERSION_CMD_gz = "gzip -f -9 -n -c
>> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
>> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>> >>>> +CONVERSION_CMD_gz = "pigz -f -9 -n -c
>> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
>> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>> >>>>  CONVERSION_CMD_bz2 = "pbzip2 -f -k
>> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>> >>>>  CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS}
>> >>>> --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
>> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
>> >>>>  CONVERSION_CMD_lz4 = "lz4 -9 -z -l
>> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
>> >>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
>> >>>> --
>> >>>> 2.11.0
>> >>>>
>> >>>> --
>> >>>> _______________________________________________
>> >>>> Openembedded-core mailing list
>> >>>> Openembedded-core@lists.openembedded.org
>> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >>>
>> >>>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

