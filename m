Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2FB60762
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 08:27:46 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n3so11556200wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 01:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:reply-to:subject:references:to:from:organization:message-id
	:date:user-agent:mime-version:in-reply-to;
	bh=mHG5PoAeQnk5VKmHmCmS27jd9gyQ/HoifH0INus4oPo=;
	b=cFVTxfGSc0d3tW6eacYgsHVD20jO+oYBW6tbDl4iT4XEd/dw+XOLioRIJfwB6H69Xa
	ZHn413rvpf93nm8WKD4REzZJrjiUto8g0fTWlYyE5FYVf/qLT5QECak9yfIkxOMlBifp
	+TiLJFTvRYUbFb2j7fnnA2qVmZYzgdOKaOuW8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:reply-to:subject:references:to:from:organization:message-id
	:date:user-agent:mime-version:in-reply-to;
	bh=mHG5PoAeQnk5VKmHmCmS27jd9gyQ/HoifH0INus4oPo=;
	b=g5UH5I9ortKEMgBxzDG4GBjhO2zSPTnRv3OV7EEmYhoe5HflgRMcH8XHKyuVjel+aT
	J+M3Z9586B0aXMo69YgDV/paShYm+nukNS4MMqbWMO0YCRoSeocFSsWwRi6jCyUAPkKG
	seD0hUQg8KtOU3DN20oOQg7Tb/jI4zDKKAT7QXXH3BZOpVWuXJ9R3FOawgjewBt6tV+q
	yL4s7dBee0lBjJdjjIbaAhN0Q0OOcH4ELeBm+NHBzpY7hpIuQ83ZbTLIA8jwVQJd8n6W
	BUeNVAINPoaC682z8UCCgtE5N+VQc9AFHsLPt2Kkv9enHr1G8K0LexssqblejKUR6TsW
	0Mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:reply-to:subject:references:to:from
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=mHG5PoAeQnk5VKmHmCmS27jd9gyQ/HoifH0INus4oPo=;
	b=jWJMdo/Vp6lnfKePA0ozaxe1EgGxy6Hvg5DGH2HkB3HhnrKrr+1p5sTVEb6ablsnnd
	lzf9MijsBcRVg3UpEh+27mx2Y5pmTifk5bVnkdDwOG1zvcKRgFcdDfIjyQoSNJprZRjA
	gbQ244ogeH7DjTJYCNRyLiUMmysajzvMCQz0w3nfsND24tJBHO8K4C3Gd7YU3CMXrYbL
	NQ6poB6fcixIQ5N8Mp8nPTph8/JyqJO8W4m5DGRbKpc0I1YDdF5L7ifxUXaM+9Kensq1
	h1rOewc5gg/iwKY131CybaxPBvMIVerw/29HPiMcTxYI2OdhdvEBO35S+AF6dB2YUJhB
	wd6w==
X-Gm-Message-State: AOPr4FXNCxKwjrrUGmquLP4y+M52mlLMWJizqjvKiBqqCs/sFjZkANjBS40/2hjie5iNlQ==
X-Received: by 10.194.14.130 with SMTP id p2mr7752997wjc.173.1461140867132;
	Wed, 20 Apr 2016 01:27:47 -0700 (PDT)
Received: from [10.20.105.60] (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164])
	by smtp.gmail.com with ESMTPSA id b15sm6894424wmd.1.2016.04.20.01.27.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2016 01:27:46 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
Reply-To: yannick.gicquel@iot.bzh
References: <1461070003-12494-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461070003-12494-2-git-send-email-yannick.gicquel@iot.bzh>
	<571640FF.4040000@opendreambox.org>
To: Andreas Oberritter <obi@opendreambox.org>,
	openembedded-core@lists.openembedded.org
From: Yannick GICQUEL <yannick.gicquel@iot.bzh>
Organization: IOT.bzh
Message-ID: <57173D88.5040102@iot.bzh>
Date: Wed, 20 Apr 2016 10:27:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <571640FF.4040000@opendreambox.org>
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
X-List-Received-Date: Wed, 20 Apr 2016 08:27:47 -0000
X-Groupsio-MsgNum: 81053
Content-Type: multipart/mixed; boundary="------------010203060606000802060909"

--------------010203060606000802060909
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


Le 19/04/2016 16:30, Andreas Oberritter a écrit :
> Hello Yannick,
Hi Andreas,
>
> On 19.04.2016 14:46, Yannick Gicquel wrote:
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
>> +	# Concatenate U-Boot w/o DTB & DTB with public key
>> +	# (cf. kernel-fitimage.bbclass for more details)
>> +	cd ${DEPLOYDIR}
>> +	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
>> +		if [ -e "${UBOOT_NODTB_IMAGE}" -a -e "${UBOOT_DTB_IMAGE}" ]; then
>> +			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} > ${UBOOT_IMAGE}
>> +			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} > ${S}/${UBOOT_BINARY}
> in general, you should avoid writing to ${S} (source). It's better to
> write to ${B} (build).
Ok, I will change to ${B}
>
>> +		else
>> +			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
>> +		fi
>> +	fi
>> +}
>> +
>> +addtask assemble_dtb after do_deploy before do_install
> The task do_deploy executes after do_install. Does it really work this
> way? I think bitbake should try to detect this and error out.
I confirm do_deploy is executed before do_install.
It looks like it is schedule this way by the last line of the file:

addtask deploy before do_build after do_compile

(I attached the log.task_order for reference - FYI, behavior is the same on
jethro or today's master branch)

>
> Maybe you could just use do_install_append and add the dependency below
> to do_install.
Interesting.
After reviewing this more carefully, I agree with you and also think 
that a dedicated task is
finally not really needed for these actions. The point which matters is 
the task order
and the schedule required to add the public key to the DTB.
And regarding this task order it should be possible to place it in a 
"do_install_prepend".

I will sent a new version integrating comments from Otavio's and you.

Thanks

>
> Regards,
> Andreas
>
>> +do_assemble_dtb[depends] += "${@' ${PREFERRED_PROVIDER_virtual/kernel}:do_assemble_fitimage' if '${UBOOT_SIGN_ENABLE}' == '1' else ''}"
>> +
>>   do_compile () {
>>   	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
>>   		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' config.mk
>>


--------------010203060606000802060909
Content-Type: text/plain; charset=UTF-8;
 name="log.task_order"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="log.task_order"

do_fetch (29836): log.do_fetch.29836
do_unpack (29844): log.do_unpack.29844
do_patch (30357): log.do_patch.30357
do_configure (30788): log.do_configure.30788
do_populate_lic (30789): log.do_populate_lic.30789
do_compile (30833): log.do_compile.30833
do_deploy (5656): log.do_deploy.5656
do_assemble_dtb (5766): log.do_assemble_dtb.5766
do_install (7724): log.do_install.7724
do_package (7877): log.do_package.7877
do_populate_sysroot (7878): log.do_populate_sysroot.7878
do_packagedata (9046): log.do_packagedata.9046
do_package_write_rpm (10190): log.do_package_write_rpm.10190
do_package_qa (10204): log.do_package_qa.10204

--------------010203060606000802060909--
