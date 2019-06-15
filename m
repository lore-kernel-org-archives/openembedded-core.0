Return-Path: <just.another.mariano@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id DF8167EA65
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Jun 2019 19:47:22 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id d12so5122992iod.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Jun 2019 12:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=qiLPvFbsvIag++4gRbe26ISbWGlTXXu/64a6frCjuUw=;
	b=MHgdt5XLSu1BWjm4X7mXAYLvLonPgq5q4dxOATEC6JcIPQCznYbHpjc1HKLsmfGf+t
	z6MyvS2/IpoDg1515AvGREgIgz/0arHs2/1UNPxF9eDq6UDRWrxs8HaK7udagkg0LBAB
	JtQBRZQZ6WERC3pMF3WtaST3bqzIISq8Xc/szBev0NDciD0jJZ69kSF/8XMZXMoPSgd4
	1otcO9lmNGjFV3MKS7gLGMSud5IwcoYW2QI+TPhczAMGDd0mpxJqTLx+ZL/mVT3T0fdI
	4prDmqgSTR/v7W7EZHNdsS36habj+OEUgB6eoUwVtVwUbCKaDxLAQi3bFJNCgwiX9CX9
	zrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=qiLPvFbsvIag++4gRbe26ISbWGlTXXu/64a6frCjuUw=;
	b=TVM10JsWx8DL7KintCTvl8SVVM1aHUKQdBd0ATmgtld3GNrVtn0EoEg2NQu1/TMyVb
	chpU2AM/hJXTyo+cy/y791VGYhfpIBaj3nsnjTNXOcybvazZbPppX5/oUqjMDZDbK8zG
	X9YEzbNccCgoGn/LxSdUV6UkzQXYub+bb0vhJLnCVkgn5qnTMcMQtSpZAd+RTqlVDlAH
	fsI99pTg7sOOBqLRUp7Jr0ei1+LdGKntXPxcMtFUUUjsmGUrnHtV0WUsE+ooOCZWYVvP
	WecMO4x6u2BtYykpi0xTh1BXLWUsJoaWEuDNBscz+9dU4zQE2kxjREhpQEiuxC1bV1ZX
	K0dA==
X-Gm-Message-State: APjAAAVh5ATZnmovzddRtE5yWEHrVWBbz8OepMpXlFmTtUBRK006e1N3
	g2IAqVkYYeAZSrcSjjXzmIw=
X-Google-Smtp-Source: APXvYqzA7pUfMViTP5VSUrK6rFfc0Or7LvjsGGQmAVHg21LY9wfg1pM9MPO9xIr5pIgXQyVFFxLzOA==
X-Received: by 2002:a02:8a:: with SMTP id 132mr31277458jaa.89.1560628043356;
	Sat, 15 Jun 2019 12:47:23 -0700 (PDT)
Received: from ?IPv6:2605:a601:43d5:f700:c5be:7ada:a7e0:e98c?
	([2605:a601:43d5:f700:c5be:7ada:a7e0:e98c])
	by smtp.gmail.com with ESMTPSA id
	e84sm13034450iof.39.2019.06.15.12.47.22
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Jun 2019 12:47:22 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <cover.1560482696.git.just.another.mariano@gmail.com>
	<e1f95376a17a9cc240d051db9d63cccd82ab02d2.1560482696.git.just.another.mariano@gmail.com>
	<5227c124e870dce2a5eed682dcd9f7cb7ea9d2b6.camel@linuxfoundation.org>
From: Mariano Lopez <just.another.mariano@gmail.com>
Message-ID: <1b6183ff-0500-5c2f-f31a-4a90d46626c7@gmail.com>
Date: Sat, 15 Jun 2019 14:47:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5227c124e870dce2a5eed682dcd9f7cb7ea9d2b6.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/2] linux-yocto: Add scsi_debug module when ptest is in DISTRO_FEATURES
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
X-List-Received-Date: Sat, 15 Jun 2019 19:47:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 6/15/19 10:15 AM, Richard Purdie wrote:
> On Thu, 2019-06-13 at 22:32 -0500, Mariano López wrote:
>> util-linux ptest requires the scsi_debug module to perform eject/mount
>> tests. This will conditionally add scsi_debug module when ptest is in
>> DISTRO_FEATURES.
>>
>> This doesn't include linux-yocto-tiny because the resulting image will
>> be too big and do_image would complain about this.
>>
>> [YOCTO #13301]
>>
>> Signed-off-by: Mariano López <just.another.mariano@gmail.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 1 +
>>   meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 1 +
>>   meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 1 +
>>   meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 1 +
>>   4 files changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
>> index 6604bdf90c..0836dc7ea0 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
>> @@ -41,3 +41,4 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>   KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>   KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>> +KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
>> index 1fe28b1bf0..b5e415f935 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
>> @@ -41,3 +41,4 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>   KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>   KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>> +KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
>> index a5fdafe6b2..cda4ecf89e 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
>> @@ -47,3 +47,4 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>   KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>   KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
>> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
>> index da795d97aa..8aec315084 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
>> @@ -50,3 +50,4 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>   KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>   KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
>> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> I merged this but have just realised its causing warnings:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/93/builds/31
>
> which suggest its not quite doing what we hope/need? :/
>
> Cheers,
>
> Richard

Indeed, it seems the configuration is not applied for the qemuarm64 
MACHINE:(

Let me look into this and send another patch

Thanks,
Mairano


