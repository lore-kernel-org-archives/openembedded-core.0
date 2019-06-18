Return-Path: <just.another.mariano@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5160F7E712
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 22:02:24 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id n5so33438351ioc.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 15:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=ShJgS1hyzmIOSXsmeGasIthJmzC12MVW+FiIja1FbFI=;
	b=uF0Km51Xplo5TeTMU7h7IbAz5YkTpd4rmOu3d6kAH0qLNslPmLKtH1jSLZh/UYdzq4
	dyuscnACOjsOPHep8Lwoys+zzh4PYt2XHcsIoxTdJPxtQZzc84b7K/rdXucZWxzmRXBN
	rluGCOW9CxbFM6ch9eju4/XKUet3erIxRkTKj3uerEXdN2Wp+dp4NHVpK8+ikXgtEekv
	2AT1rq1OddDboJ+RF8AQZCA9zcH2QynkpNG8YrHeRjNwGTwgQu+sZCc9d6mjO8UaLqpg
	xZyxr8yEPKsSVYqkOAK1eNhYv4UqMtQSQGajLItP9Aiz3xSIIihtPdbcZoeYEDOYo3Op
	bNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ShJgS1hyzmIOSXsmeGasIthJmzC12MVW+FiIja1FbFI=;
	b=hWkPxRSYeCbrmejzJLJ4t+9IZdEBn0zeV3FDBjnVMQcnVUbc2xne4eV/AJ68yXdYst
	zRxxIZZwx8sJDOB3oAAFXv5YQKfJW/d9Xx941eSuKJ6HR/XXlGE1zImrkoOe6RgCjDSz
	vIxX9DEGXAQhU51/Pz5EBhMHvTKN9Yp4FAdZ3OtRJrMPhmmRTRKF8/nOyRZR2sjuoPtL
	sy6vR5x5V66eHoyg7Ugxp6hC3voDFn9L4KZLImq2iqkW+dnmdKTEoDwlxHX6OP9FGibh
	dVnmlLoUwEfi5UiVdQEYEJxj26lCicxHoB8fLgxzmRD92Dndw3r+hqQUmhwrPw06eBwf
	AVDg==
X-Gm-Message-State: APjAAAXTyOXITQpHfV4ca5KwN7pdV6MC+P21GSk3asij7bxTMHzrR1jN
	G0YNCHxGMR0QoQCghyWsheRwR9Ek
X-Google-Smtp-Source: APXvYqy5hIADCvf+703JCuS9mrCEz/15qk2ZxjdEH2pjFEi7Qq7JdIXugzKNNsFSpuWh2ciOJ1Iq4Q==
X-Received: by 2002:a6b:6f09:: with SMTP id k9mr66605497ioc.223.1560895345161; 
	Tue, 18 Jun 2019 15:02:25 -0700 (PDT)
Received: from ?IPv6:2605:a601:43d5:f700:c5be:7ada:a7e0:e98c?
	([2605:a601:43d5:f700:c5be:7ada:a7e0:e98c])
	by smtp.gmail.com with ESMTPSA id
	c10sm19657828ioh.58.2019.06.18.15.02.24
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jun 2019 15:02:24 -0700 (PDT)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1560482696.git.just.another.mariano@gmail.com>
	<e1f95376a17a9cc240d051db9d63cccd82ab02d2.1560482696.git.just.another.mariano@gmail.com>
	<5227c124e870dce2a5eed682dcd9f7cb7ea9d2b6.camel@linuxfoundation.org>
	<1b6183ff-0500-5c2f-f31a-4a90d46626c7@gmail.com>
	<CADkTA4O18vKXznOvnYJP+AeVF96grvF-Jash07zwy4mgHY_ABQ@mail.gmail.com>
From: Mariano Lopez <just.another.mariano@gmail.com>
Message-ID: <d7d883bc-0372-6011-9945-0202cc54c59f@gmail.com>
Date: Tue, 18 Jun 2019 17:02:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4O18vKXznOvnYJP+AeVF96grvF-Jash07zwy4mgHY_ABQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 18 Jun 2019 22:02:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 6/15/19 8:02 PM, Bruce Ashfield wrote:
> On Sat, Jun 15, 2019 at 3:47 PM Mariano Lopez
> <just.another.mariano@gmail.com> wrote:
>>
>> On 6/15/19 10:15 AM, Richard Purdie wrote:
>>> On Thu, 2019-06-13 at 22:32 -0500, Mariano López wrote:
>>>> util-linux ptest requires the scsi_debug module to perform eject/mount
>>>> tests. This will conditionally add scsi_debug module when ptest is in
>>>> DISTRO_FEATURES.
>>>>
>>>> This doesn't include linux-yocto-tiny because the resulting image will
>>>> be too big and do_image would complain about this.
>>>>
>>>> [YOCTO #13301]
>>>>
>>>> Signed-off-by: Mariano López <just.another.mariano@gmail.com>
>>>> ---
>>>>    meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 1 +
>>>>    meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 1 +
>>>>    meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 1 +
>>>>    meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 1 +
>>>>    4 files changed, 4 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
>>>> index 6604bdf90c..0836dc7ea0 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
>>>> @@ -41,3 +41,4 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>>>    KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>>>    KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>>>    KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>>> +KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
>>>> index 1fe28b1bf0..b5e415f935 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
>>>> @@ -41,3 +41,4 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>>>    KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>>>    KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>>>    KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>>> +KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
>>>> index a5fdafe6b2..cda4ecf89e 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
>>>> @@ -47,3 +47,4 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>>>    KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>>>    KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>>>    KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
>>>> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
>>>> index da795d97aa..8aec315084 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
>>>> @@ -50,3 +50,4 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>>>    KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>>>    KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>>>    KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
>>>> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
>>> I merged this but have just realised its causing warnings:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/93/builds/31
>>>
>>> which suggest its not quite doing what we hope/need? :/
>>>
>>> Cheers,
>>>
>>> Richard
>> Indeed, it seems the configuration is not applied for the qemuarm64
>> MACHINE:(
>>
> It would be applied, but it may be missing some dependency on that
> machine and is hence not enabled in the final kernel .config.
>
> Bruce

SCSI support is not enabled by default for ARM architectures, I just 
sent the patch for this:
http://lists.openembedded.org/pipermail/openembedded-core/2019-June/283775.html


Thanks!
Mariano

>
>> Let me look into this and send another patch
>>
>> Thanks,
>> Mairano
>>
>

