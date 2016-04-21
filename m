Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 69C5660119
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 19:55:15 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n3so24267222wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 12:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:reply-to:subject:references:to:from:organization:message-id
	:date:user-agent:mime-version:in-reply-to;
	bh=4QWJKt09mIcBtXiQIPVy4+E+RQXuO2dNKWCDO7zUBTo=;
	b=Vtqx4bxKWCJYWFPDn208roww4R1y457AowYlH9GdP8txRN3Dhp8bb0iDJVDiiXJKAg
	U5fa0uv7GbNZYzlKEGesCroBq8l2rR+GjI+qjJOlgNBzbKJ0fTTeetCtUiPnMKmWks+c
	F2JJH3lcBB58POMN+kbXOGUTXGwDr8q1wUA1E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:reply-to:subject:references:to:from:organization:message-id
	:date:user-agent:mime-version:in-reply-to;
	bh=4QWJKt09mIcBtXiQIPVy4+E+RQXuO2dNKWCDO7zUBTo=;
	b=pNFVuPWKDBsDoaK0kDoIj9oxN9BxXk8RLCgkZu5Tvkawch0sR6sSTx8uHV8Qyu22RW
	xiVnDVqUTYK2iP0NmU/iFa2XaFcsxA9h0zSC9o0T6sk/XoDtw/zs3uteWwPAbz0yjYwF
	//dPVEOi/ZXQi/wUOmz62zepuBXpxGCk3bzrHu0tWu3WZ3dkIn0wgfL9Q12uHhyeFUD0
	Bw2xjjzc6j013O2YHpUnZA2zcwdYVkukkFaNXlYqwPMBNhT8E57xq7V2eAkSoii94pIj
	DOl7xECa0YsI2dVOCBZwbQ5Wav6qZt0FXbbMJJfzYaUKLKi82rxptWfzbN1HW0dEQjNW
	OU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:reply-to:subject:references:to:from
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=4QWJKt09mIcBtXiQIPVy4+E+RQXuO2dNKWCDO7zUBTo=;
	b=HnKbw7TEkxQtqIBXTJKxr98jlkCgVJaUXTqUsPO/nLqxfzNnC5t3dZbBdXQEXvcxg9
	m0//OgyKzfRiWGRE+Ie7oQo73vDflsJ3Mus+VRtYmRWWOJenpS1QYOWEhrIJzL80mmFa
	c2E5tM9U/rZGW1RNG+/OQuaLvTrYb0BFYFyb4zWkYno/i4nSXK90m5yVHAhuH274W5AY
	+SxhMeOH/gZ1uE6gl+MJl9W6FRnlArffih6psUmpOgoRdM5IHkU7R2sf/B0MMxMgaeKG
	GQ+8XpQW8iu+mGY5AlDyOgcELBx5qzu/eYgmxi1384i6HKTAxmljQYoKmiKVleKEGkdU
	hNDw==
X-Gm-Message-State: AOPr4FWCC+Ts/oisdrmLMwSwPNHyawbdmVfCahhhc+61XSO6TfSk4o2lL6LBunYB7qYzKg==
X-Received: by 10.194.59.138 with SMTP id z10mr16174797wjq.74.1461268516361;
	Thu, 21 Apr 2016 12:55:16 -0700 (PDT)
Received: from [10.20.105.60] (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164])
	by smtp.gmail.com with ESMTPSA id s10sm4438951wjp.3.2016.04.21.12.55.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2016 12:55:15 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
Reply-To: yannick.gicquel@iot.bzh
References: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461160239-7799-2-git-send-email-yannick.gicquel@iot.bzh>
	<5718DE65.1070402@opendreambox.org>
To: openembedded-core@lists.openembedded.org
From: Yannick GICQUEL <yannick.gicquel@iot.bzh>
Organization: IOT.bzh
Message-ID: <57193029.7010209@iot.bzh>
Date: Thu, 21 Apr 2016 21:55:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <5718DE65.1070402@opendreambox.org>
Subject: Re: [RFC][PATCH v2 1/4] u-boot: basic support of dtb append for verified boot
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
X-List-Received-Date: Thu, 21 Apr 2016 19:55:17 -0000
X-Groupsio-MsgNum: 81133
Content-Type: multipart/mixed; boundary="------------040806030702080408030203"

--------------040806030702080408030203
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit



Le 21/04/2016 16:06, Andreas Oberritter a écrit :
> On 20.04.2016 15:50, Yannick Gicquel wrote:
>> This introduces a new uboot-sign.class to support U-Boot verified boot.
>>
>> This part delivers the new class file, with related environment variables, and
>> a basic prepend to do_install task which performs the concatenation of the
>> u-boot-nodtb.bin and the device tree blob. The 'cat' command used
>> overrides the u-boot.bin in both DEPLOYDIR & build dir to propagate the
>> changes in later tasks (do_install, do_package, etc.)
>>
>> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
>> ---
>>   meta/classes/uboot-sign.bbclass    | 59 ++++++++++++++++++++++++++++++++++++++
>>   meta/recipes-bsp/u-boot/u-boot.inc |  2 +-
>>   2 files changed, 60 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/classes/uboot-sign.bbclass
>>
>> diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
>> new file mode 100644
>> index 0000000..63a5181
>> --- /dev/null
>> +++ b/meta/classes/uboot-sign.bbclass
>> @@ -0,0 +1,59 @@
>> +# This file is part of U-Boot verified boot support and is intended to be
>> +# inherited from u-boot recipe and from kernel-fitimage.bbclass.
>> +#
>> +# The signature procedure requires the user to generate an RSA key and
>> +# certificate in a directory and to define the following variable:
>> +#
>> +#   UBOOT_SIGN_KEYDIR = "/keys/directory"
>> +#   UBOOT_SIGN_KEYNAME = "dev" # keys name in keydir (eg. "dev.crt", "dev.key")
>> +#   UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
>> +#   UBOOT_SIGN_ENABLE = "1"
>> +#
>> +# As verified boot depends on fitImage generation, following is also required:
>> +#
>> +#   KERNEL_CLASSES ?= " kernel-fitimage "
>> +#   KERNEL_IMAGETYPE ?= "fitImage"
>> +#
>> +# The signature support is limited to the use of CONFIG_OF_SEPARATE in U-Boot.
>> +#
>> +# The tasks sequence is as below, using DEPLOY_IMAGE_DIR as common place to
>> +# treat the device tree blob:
>> +#
>> +# u-boot:do_deploy -> virtual/kernel:do_assemble_fitimage -> u-boot:do_install
>> +#
>> +# For more details on signature process, please refer to U-boot documentation.
>> +
>> +# Signature activation.
>> +UBOOT_SIGN_ENABLE ?= "0"
>> +
>> +# Default value for deployment filenames.
>> +UBOOT_DTB_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.dtb"
>> +UBOOT_DTB_BINARY ?= "u-boot.dtb"
>> +UBOOT_DTB_SYMLINK ?= "u-boot-${MACHINE}.dtb"
>> +UBOOT_NODTB_IMAGE ?= "u-boot-nodtb-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
>> +UBOOT_NODTB_BINARY ?= "u-boot-nodtb.${UBOOT_SUFFIX}"
>> +UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
>> +
> I think you should split the file at this point and either put the lines
> above into uboot-sign-base.bbclass and include it from here or put the
> lines below into u-boot.inc directly. This way you don't add unnecessary
> code for u-boot to kernel recipes, and lose the dependency on PN =
> "u-boot" at the same time.

Thanks for the proposal, that's interesting.
I agree that splitting the file should remove the dependencies on 
'_pn-u-boot' and it also allow to keep usage of existing 'deploy' and 
'install' tasks.
But even in that case, we will still have a last reference to 'u-boot' 
recipe name, hardcoded in kernel-fitimage.bbclass:

d.appendVarFlag('do_assemble_fitimage', 'depends', ' u-boot:do_deploy')
                                                      ^^^^^^
For now, I don't know a way to avoid using PREFERRED_PROVIDER_u-boot 
variable at some point.

Also, I worked on an update (keeping one class file) and in that case it 
now introduces specifics tasks for u-boot. (cf. patch attached).
I would prefer to keep the whole thing in one single class file to avoid 
fragmentation, except if introducing new tasks it is not advised for any 
reason?
Your comments are welcome.

Anyway, I would be able to send a V3 series (maybe without RFC) early 
next week.
Thank you all for Acked, Reviewed and comments!

Best regards,
Yannick

>
> Regards,
> Andreas
>
>> +#
>> +# Following is relevant only for u-boot recipes:
>> +#
>> +
>> +do_install_prepend_pn-u-boot () {
>> +	# Concatenate U-Boot w/o DTB & DTB with public key
>> +	# (cf. kernel-fitimage.bbclass for more details)
>> +	cd ${DEPLOYDIR}
>> +	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
>> +		if [ -e "${UBOOT_NODTB_IMAGE}" -a -e "${UBOOT_DTB_IMAGE}" ]; then
>> +			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} > ${UBOOT_IMAGE}
>> +			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} > ${B}/${UBOOT_BINARY}
>> +		else
>> +			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
>> +		fi
>> +	fi
>> +}
>> +
>> +python () {
>> +	if d.getVar('UBOOT_SIGN_ENABLE', True) == '1' and d.getVar('PN', True) == 'u-boot':
>> +		kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel', True)
>> +		d.appendVarFlag('do_install', 'depends', ' %s:do_assemble_fitimage' % kernel_pn)
>> +}
>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
>> index 3ba866d..037f35c 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>> @@ -12,7 +12,7 @@ S = "${WORKDIR}/git"
>>   
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   
>> -inherit uboot-config deploy
>> +inherit uboot-config uboot-sign deploy
>>   
>>   EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
>>   EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
>>


--------------040806030702080408030203
Content-Type: text/x-patch;
 name="uboot-pn.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="uboot-pn.patch"

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index dfd3306..809bd4d 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -20,7 +20,8 @@ python __anonymous () {
         # U-boot dtb. We ensure the U-Boot dtb is deployed before assembling
         # the fitImage:
         if d.getVar('UBOOT_SIGN_ENABLE', True):
-            d.appendVarFlag('do_assemble_fitimage', 'depends', ' u-boot:do_deploy')
+            uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot', True) or 'u-boot'
+            d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_deploy' % uboot_pn)
 }
 
 # Options for the device tree compiler passed to mkimage '-D' feature:
diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index adb24d4..f3d0c73 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -16,10 +16,14 @@
 #
 # The signature support is limited to the use of CONFIG_OF_SEPARATE in U-Boot.
 #
-# The tasks sequence is as below, using DEPLOY_IMAGE_DIR as common place to
+# The tasks sequence is set as below, using DEPLOY_IMAGE_DIR as common place to
 # treat the device tree blob:
 #
-# u-boot:do_deploy -> virtual/kernel:do_assemble_fitimage -> u-boot:do_install
+#   u-boot:do_deploy_dtb
+#   u-boot:do_deploy
+#   virtual/kernel:do_assemble_fitimage
+#   u-boot:do_concat_dtb
+#   u-boot:do_install
 #
 # For more details on signature process, please refer to U-boot documentation.
 
@@ -38,8 +42,10 @@ UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
 # Following is relevant only for u-boot recipes:
 #
 
-do_deploy_append_pn-u-boot () {
-	# OF_SEPARATE generated files deployment
+do_deploy_dtb () {
+	mkdir -p ${DEPLOYDIR}
+	cd ${DEPLOYDIR}
+
 	if [ -f ${B}/${UBOOT_DTB_BINARY} ]; then
 		install ${B}/${UBOOT_DTB_BINARY} ${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
 		rm -f ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SYMLINK}
@@ -54,7 +60,7 @@ do_deploy_append_pn-u-boot () {
 	fi
 }
 
-do_install_prepend_pn-u-boot () {
+do_concat_dtb () {
 	# Concatenate U-Boot w/o DTB & DTB with public key
 	# (cf. kernel-fitimage.bbclass for more details)
 	cd ${DEPLOYDIR}
@@ -69,7 +75,16 @@ do_install_prepend_pn-u-boot () {
 }
 
 python () {
-	if d.getVar('UBOOT_SIGN_ENABLE', True) == '1' and d.getVar('PN', True) == 'u-boot':
+	uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot', True) or 'u-boot'
+	if d.getVar('UBOOT_SIGN_ENABLE', True) == '1' and d.getVar('PN', True) == uboot_pn:
 		kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel', True)
-		d.appendVarFlag('do_install', 'depends', ' %s:do_assemble_fitimage' % kernel_pn)
+
+		# u-boot.dtb and u-boot-nodtb.bin are deployed _before_ do_deploy
+		# Thus, do_deploy_setscene will also populate them in DEPLOY_IMAGE_DIR
+		bb.build.addtask('do_deploy_dtb', 'do_deploy', 'do_compile', d)
+
+		# do_concat_dtb is scheduled _before_ do_install as it overwrite the
+		# u-boot.bin in both DEPLOYDIR and DEPLOY_IMAGE_DIR.
+		bb.build.addtask('do_concat_dtb', 'do_install', None, d)
+		d.appendVarFlag('do_concat_dtb', 'depends', ' %s:do_assemble_fitimage' % kernel_pn)
 }

--------------040806030702080408030203--
