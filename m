Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 825BF60110
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 08:12:36 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l6so11383610wml.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 01:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:reply-to:subject:references:to:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=TArFIm7mvlyTDCCqJDc7nwCjwiGbJ+pcWXbE8NT9Wj4=;
	b=DDiySXN2Kma81PFP/TtvQBvSysYx2SRIPQEhAGLGqcGPK6ITDOFgi8nTD/QfKy1Wm1
	9djtAdMP5PUedF05ajNMW61ikB3Frp5TO1Ok5zl/d6lo0+mmZZRzbHgNBRo+dOvxVL80
	tHyczGqkkHLDrRna3F2jKiVeVP/uREd4qdxZU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:reply-to:subject:references:to:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=TArFIm7mvlyTDCCqJDc7nwCjwiGbJ+pcWXbE8NT9Wj4=;
	b=JgLcDjaljlSyD0rG6xOnS8miNK2EKVwxRTjAsJOWfcj3GGIQTyWzemovWuNQTlwPLL
	aDPT7qkuUF0y7684MWwhCf/e5REhNxTzabR9DWHIwmmH7OZMaH2JFse6//BYV7y4Q98n
	4wizWl7ciYCSNxKgrSwjsAd1hU3OlAoZ7OIigKBBF+IlTdqL8prSDS59HAxeQKRnlRNW
	QcC5L9J1Qcv7GTQ18gdNl/UDaAx1Yq78ViVo2zgE53x+S88GGogWlqkLsHC10ryFd+se
	zTPeOK3wNcTdSdwhpiYd4NdroVa06ZcB4OSZe3yj+6OTJ8wj6OfOIgHi3TCcDSCji10Z
	ShkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:reply-to:subject:references:to:cc:from
	:organization:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=TArFIm7mvlyTDCCqJDc7nwCjwiGbJ+pcWXbE8NT9Wj4=;
	b=dwAe2OtS+mNsBDo9yo2mwabxQbEO7QI67fe2sw4kdzuRkNJLIzTP3UeWOBdkzyPmLI
	C9v1355Rn3kEG78YhdCLV2Kx3doq1kMICl4eQYdzYe1iaLyy6YsIywxw/R8JZA251le9
	vIbiLNuR32TgbRTcI0obb+m701kmAUfZNkNHTUUv6mpREckAvBEfO7E5c9uX3MGVQK60
	JzuriEqx0+EZRKZUl6z0ZzymuUviZ2FRb5OKO0gdR8kWo4h0NR824tPIzkFM5TvcZ9wn
	4vQT+tCdvKsm94WFcDdTyvgcFZEF53CCycAFKh8CXjlHlBT5mvkx50FdnHINBYziPHII
	58aQ==
X-Gm-Message-State: AOPr4FXtRQVJDvJgKO2AKWWxE1fRbBsMhhmWEuQhPQalXH7zIROVb3wcm2JVlACqTZivvw==
X-Received: by 10.28.31.22 with SMTP id f22mr7844441wmf.103.1461139957137;
	Wed, 20 Apr 2016 01:12:37 -0700 (PDT)
Received: from [10.20.105.60] (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164]) by smtp.gmail.com with ESMTPSA id
	o128sm8247702wmb.19.2016.04.20.01.12.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2016 01:12:36 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
Reply-To: yannick.gicquel@iot.bzh
References: <1461070003-12494-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461070003-12494-2-git-send-email-yannick.gicquel@iot.bzh>
	<CAP9ODKprhOzhzVyb4Z_vRChr-WzAo1uuEm4Rd1-_PwAHEx_efA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
From: Yannick GICQUEL <yannick.gicquel@iot.bzh>
Organization: IOT.bzh
Message-ID: <571739FA.9000803@iot.bzh>
Date: Wed, 20 Apr 2016 10:12:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKprhOzhzVyb4Z_vRChr-WzAo1uuEm4Rd1-_PwAHEx_efA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/4] u-boot: basic support of device tree blob reassembly
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
X-List-Received-Date: Wed, 20 Apr 2016 08:12:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 19/04/2016 15:30, Otavio Salvador a écrit :
> On Tue, Apr 19, 2016 at 9:46 AM, Yannick Gicquel
> <yannick.gicquel@iot.bzh> wrote:
>> This introduces a new task 'assemble_dtb' to handle the concatenation of U-Boot
>> without DTB and the compiled U-Boot DTB while using CONFIG_OF_SEPARATE.
>> Basically, this task merges the u-boot-nodtb.bin and the device tree blob using
>> the 'cat' command and overrides the u-boot.bin file which is generated
>> at the compilation step.
>>
>> This task is intended to be used in the verified-boot image generation process
>> after the kernel-fitimage class had appended a public key to the device tree
>> blob. It is placed after the do_deploy and before the do_install tasks and it
>> replaces the u-boot binaries in both deploy directory and build directory
>> in order to minimize the changes in later tasks.
>>
>> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
>> ---
>>   meta/recipes-bsp/u-boot/u-boot-sign.inc | 21 +++++++++++++++++++++
>>   meta/recipes-bsp/u-boot/u-boot.inc      | 22 ++++++++++++++++++++++
>>   2 files changed, 43 insertions(+)
>>   create mode 100644 meta/recipes-bsp/u-boot/u-boot-sign.inc
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-sign.inc b/meta/recipes-bsp/u-boot/u-boot-sign.inc
>> new file mode 100644
>> index 0000000..c88a2a1
>> --- /dev/null
>> +++ b/meta/recipes-bsp/u-boot/u-boot-sign.inc
> I think it could be moved to a class, so the U-Boot can inherit it.
Ok
>
>> @@ -0,0 +1,21 @@
>> +# This file is part of U-Boot verified boot support and is intended to be
>> +# included from u-boot recipe and from kernel-fitimage.bbclass
>> +#
>> +# The signature procedure requires the user to generate an RSA key and
>> +# certificate in a directory and to define the following variable:
>> +#
>> +# UBOOT_SIGN_KEYDIR = "/keys/directory"
>> +# UBOOT_SIGN_KEYNAME = "dev" # keys name in keydir (eg. "dev.crt", "dev.key")
>> +# UBOOT_SIGN_ENABLE = "1"
>> +#
>> +# The signature support is limited to the use of CONFIG_OF_SEPARATE in U-Boot.
>> +#
>> +# For more details, please refer to U-boot documentation.
>> +
>> +UBOOT_SIGN_ENABLE ?= "0"
>> +UBOOT_DTB_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.dtb"
>> +UBOOT_DTB_BINARY ?= "u-boot.dtb"
>> +UBOOT_DTB_SYMLINK ?= "u-boot-${MACHINE}.dtb"
>> +UBOOT_NODTB_IMAGE ?= "u-boot-nodtb-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
>> +UBOOT_NODTB_BINARY ?= "u-boot-nodtb.${UBOOT_SUFFIX}"
>> +UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
>> index 3ba866d..29b0b95 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>> @@ -65,6 +65,28 @@ UBOOT_ENV_BINARY ?= "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
>>   UBOOT_ENV_IMAGE ?= "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SUFFIX}"
>>   UBOOT_ENV_SYMLINK ?= "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
>>
>> +# The use of verified boot requires to share environment variables with kernel
>> +# fitImage class as the mkimage call requires dtb filepath to append signature
>> +# public key.
>> +require u-boot-sign.inc
>> +
>> +do_assemble_dtb() {
>> +       # Concatenate U-Boot w/o DTB & DTB with public key
>> +       # (cf. kernel-fitimage.bbclass for more details)
>> +       cd ${DEPLOYDIR}
>> +       if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
>> +               if [ -e "${UBOOT_NODTB_IMAGE}" -a -e "${UBOOT_DTB_IMAGE}" ]; then
>> +                       cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} > ${UBOOT_IMAGE}
>> +                       cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} > ${S}/${UBOOT_BINARY}
>> +               else
>> +                       bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
>> +               fi
>> +       fi
>> +}
>> +
>> +addtask assemble_dtb after do_deploy before do_install
>> +do_assemble_dtb[depends] += "${@' ${PREFERRED_PROVIDER_virtual/kernel}:do_assemble_fitimage' if '${UBOOT_SIGN_ENABLE}' == '1' else ''}"
>> +
> This should be part of the class, not another .inc file.
Ok, I understand your point and will move the whole dtb related parts in 
the class file.
Thanks,
>
>>   do_compile () {
>>          if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
>>                  sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' config.mk
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


