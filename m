Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2264174726
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 16:07:57 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id m22-v6so2585072otf.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 09:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=37pL2ax70A+HzXZ5vYJI85Y7UjaCd3h/xhg63kzqS0U=;
	b=U2eFtCJEtNO9HzrMMLen/9mvQGC1AaYwJ7akRfMhw/XExgOuz4PsGjuHUdhrnDx3Nj
	wX7e1KFA5UQMk8piUdeM0/wXgWV0oe6kLIodwJiFS663Z7T/wPy8FLzJLYK1gKT5IvG+
	KqJ5CrSxlBsFaxWxMDGM553jGrJ4JS8TzUSk+wisQ6JvUL9w2uIUIrgVAkp2n9N3e1Sv
	P3rJHlAZmqwxTtpCIj9aFC9MRMhgJtqClQ/0eBaQn2Sjk+TI83rX4tp7v7ewq64IeBia
	HCkVzRbxnuwdMLiXJNWcKPWRDE8YcVZ0Q9RaX0ID31biHuXXez5m4no7hKY0jIbBHAlx
	r4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=37pL2ax70A+HzXZ5vYJI85Y7UjaCd3h/xhg63kzqS0U=;
	b=WnK+8w8E8RDuh7XA93SgVE0gSPkoV1RIjFtGv7sl0ZAOlX036t/2R2sg2NYKTXQcv1
	Ww9KRTE6GnH1hyLfVOp7dF4irJTBfkePyYLwaVhK3fk/fIUJfMQIW8Tn8nY9ojdp6UBa
	Mgc07n2VmoPPk3tMlA7J0Sph7fwXNf+K8vMMYW8RMbHjVfu7nyUywOgLfjGog8PsnFHD
	F3w1p4nqmmKf582mInJF8Zpw2PXJ3prfmuBZAzo6bzFbxFNwenqKkaNUp41g2gKQTZBO
	KSlxvpxi+EdOkjdqIGJ6WGxQ9nL0K/WFeREvhB1rF5ObzfccvvhJKoFuQ/wxX4COsD93
	4lrw==
X-Gm-Message-State: ALQs6tBXS9miRMGSrTEA2qXrqp7dKFWVbBTOlBrJ3WgAV2nDHPgpMR8z
	CpbhmIdu3ozL8AODxIyoVUQrxGRcelYej1A9rAQVJQ==
X-Google-Smtp-Source: AIpwx4+JMES3V/IHf+J2N+Tqfbj/bke/G1W3Kg9AV8HFvunDBLbMlOT4wNwL/xGpPSqruxK6L2pzkAMOqqnx2OOZdFk=
X-Received: by 2002:a9d:2ce2:: with SMTP id
	e31-v6mr3347990otd.135.1523462878814; 
	Wed, 11 Apr 2018 09:07:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Wed, 11 Apr 2018 09:07:38 -0700 (PDT)
In-Reply-To: <CAMKF1srSW0=y7K3q+q-cUN7XXTnGiRV1e5Ag3PjC2tb12Htqnw@mail.gmail.com>
References: <20180410143532.31916-1-ross.burton@intel.com>
	<CA+chaQdRDvvi-2UgmbC_=yjiuN-8yqdrk5K1yzTh9CVKZsXiJA@mail.gmail.com>
	<CAJTo0LZWZRj0u9J+Z42Lxuh98u-f2i8HQwM37z1TPqRB9KbfLA@mail.gmail.com>
	<CAMKF1srSW0=y7K3q+q-cUN7XXTnGiRV1e5Ag3PjC2tb12Htqnw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Apr 2018 17:07:38 +0100
Message-ID: <CAJTo0Lbon36HCngX2DFNtfrtZQP-nn2t=hp=_mAeHK-bYBpF6w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 11 Apr 2018 16:07:58 -0000
Content-Type: text/plain; charset="UTF-8"

Woud be interesting to see a benchmark of a full build from scratch
with host gzip vs host pigz...

On 11 April 2018 at 17:03, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Apr 11, 2018 at 6:36 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> Wouldn't that introduce a fun circular dependency if pigz-native needs
>> to be built?
>>
>
> interesting idea certainly, if it ends up with improvements in build
> time, we could
> add pigz to host dependencies.
>
>> Ross
>>
>> On 11 April 2018 at 11:53, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> What about using pigz for sstate-cache archives?
>>>
>>> On Tue, Apr 10, 2018 at 4:35 PM, Ross Burton <ross.burton@intel.com> wrote:
>>>>
>>>> Since pigz is no longer a drop-in replacement for gzip (oe-core 1624b7b)
>>>> the
>>>> image creation has been using gzip instead of pigz, despite still
>>>> depending on
>>>> pigz-native.  Fix this by invoking pigz explicitly.
>>>>
>>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>>> ---
>>>>  meta/classes/image_types.bbclass | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/classes/image_types.bbclass
>>>> b/meta/classes/image_types.bbclass
>>>> index e872ae20982..00a00d318f4 100644
>>>> --- a/meta/classes/image_types.bbclass
>>>> +++ b/meta/classes/image_types.bbclass
>>>> @@ -281,7 +281,7 @@ COMPRESSIONTYPES ?= ""
>>>>
>>>>  CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum
>>>> sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2
>>>> ${COMPRESSIONTYPES}"
>>>>  CONVERSION_CMD_lzma = "lzma -k -f -7
>>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>>>> -CONVERSION_CMD_gz = "gzip -f -9 -n -c
>>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
>>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>>>> +CONVERSION_CMD_gz = "pigz -f -9 -n -c
>>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
>>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>>>>  CONVERSION_CMD_bz2 = "pbzip2 -f -k
>>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>>>>  CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS}
>>>> --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
>>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
>>>>  CONVERSION_CMD_lz4 = "lz4 -9 -z -l
>>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
>>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
>>>> --
>>>> 2.11.0
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

