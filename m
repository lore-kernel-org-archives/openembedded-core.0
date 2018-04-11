Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3F923746E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 16:04:10 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id l21so957837pgc.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 09:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Bq98DEe4LMlMmRnmVQoOz1skyVmN4FZaXeeeJ1XLo+8=;
	b=SR56bDJqFd9yAfAn0yDTEeK7Qd4zBcK4V27gF7My2QdKsOsAE8kEjXNHWrvxLjutYL
	8QEBltrI+AwEf1xfVjsDs5eaaFMy1tqcLlVkJkeBSR1aBZm/d1TlErkKuJRI2a81Rb8+
	KdtEDqXYiIDH3VBK5Qxkg/UfMFg6gNFRjCwxddilTbrw6uPQIKQJhakWz7EpJgC2cqE+
	xsViDxkRmTOR63PyGrUcpMj1J5U11L83UCruzwlvHfywNPefqy68/ayF/t4W/gMo2Ldz
	SyQzy9LvcVdNIqkskJAHbMmJuQMxQ9MYGsG7ujQqXnfRt21Kaqv1yZr/4qIVEWkBAx5d
	tLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Bq98DEe4LMlMmRnmVQoOz1skyVmN4FZaXeeeJ1XLo+8=;
	b=USJcUq3S/FS0ccW332sNyoBNVrEevvkBWLFBOgEFlw3G/88i+pWaWSsdb+InuNbwdq
	dtkGvod8zJ6VJNFixzgL4V1bTQx818DBwh7gMxkpYQo+xEtJrpcE4udwUQHW7zYpqmbi
	ltuPdJEPuC/T83VTs9iIFikxdlq0R2GMVoT7WKl7fgoP4AY5KatJ3hkBdq2aWICAAjcW
	2pfUv5zHoBWlCsqsW2dVM83uWYFhSyG68xm2oozHfJR3u7XFgUBvNOvScgZwWRLH8/zy
	QnFhHfYZM52yIh0B9QWEUWub1ZOtCCUfhs60C3Xm74fjAcg6zI72Z7KMla+chz9S6T8A
	HR2A==
X-Gm-Message-State: ALQs6tCErmq4PcB2vfaPVzTigo2Y1EpmedNdMVwVWIlgexa6kBGRZyEO
	ZGfvJkYJdPecIXyBgebFwHZal0blZofWfg8NPag=
X-Google-Smtp-Source: AIpwx4/ibwI3yUhcsFz7I/nX3Aw5FnOTPRdsuRX0GHIpr80VGpSDtpQMKcZaCSzcfabBe5qMep1Wl53LIehkO97jMmQ=
X-Received: by 10.101.97.15 with SMTP id z15mr3866644pgu.393.1523462651967;
	Wed, 11 Apr 2018 09:04:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.187.129 with HTTP; Wed, 11 Apr 2018 09:03:41 -0700 (PDT)
In-Reply-To: <CAJTo0LZWZRj0u9J+Z42Lxuh98u-f2i8HQwM37z1TPqRB9KbfLA@mail.gmail.com>
References: <20180410143532.31916-1-ross.burton@intel.com>
	<CA+chaQdRDvvi-2UgmbC_=yjiuN-8yqdrk5K1yzTh9CVKZsXiJA@mail.gmail.com>
	<CAJTo0LZWZRj0u9J+Z42Lxuh98u-f2i8HQwM37z1TPqRB9KbfLA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Apr 2018 09:03:41 -0700
Message-ID: <CAMKF1srSW0=y7K3q+q-cUN7XXTnGiRV1e5Ag3PjC2tb12Htqnw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Wed, 11 Apr 2018 16:04:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 11, 2018 at 6:36 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Wouldn't that introduce a fun circular dependency if pigz-native needs
> to be built?
>

interesting idea certainly, if it ends up with improvements in build
time, we could
add pigz to host dependencies.

> Ross
>
> On 11 April 2018 at 11:53, Martin Jansa <martin.jansa@gmail.com> wrote:
>> What about using pigz for sstate-cache archives?
>>
>> On Tue, Apr 10, 2018 at 4:35 PM, Ross Burton <ross.burton@intel.com> wrote:
>>>
>>> Since pigz is no longer a drop-in replacement for gzip (oe-core 1624b7b)
>>> the
>>> image creation has been using gzip instead of pigz, despite still
>>> depending on
>>> pigz-native.  Fix this by invoking pigz explicitly.
>>>
>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>> ---
>>>  meta/classes/image_types.bbclass | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/image_types.bbclass
>>> b/meta/classes/image_types.bbclass
>>> index e872ae20982..00a00d318f4 100644
>>> --- a/meta/classes/image_types.bbclass
>>> +++ b/meta/classes/image_types.bbclass
>>> @@ -281,7 +281,7 @@ COMPRESSIONTYPES ?= ""
>>>
>>>  CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum
>>> sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2
>>> ${COMPRESSIONTYPES}"
>>>  CONVERSION_CMD_lzma = "lzma -k -f -7
>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>>> -CONVERSION_CMD_gz = "gzip -f -9 -n -c
>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>>> +CONVERSION_CMD_gz = "pigz -f -9 -n -c
>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>>>  CONVERSION_CMD_bz2 = "pbzip2 -f -k
>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>>>  CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS}
>>> --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
>>>  CONVERSION_CMD_lz4 = "lz4 -9 -z -l
>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
>>> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
>>> --
>>> 2.11.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

