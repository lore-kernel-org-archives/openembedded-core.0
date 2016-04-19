Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 17F0760232
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 12:47:30 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n3so4895724wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 05:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=iIhsG2UmhdPfcA5g50jDzCUKdxAaZMa/3FR0pSnKlwY=;
	b=MSuUIxfIXRuoKNBO+W5r+y151ZLPVO0W9Quj9CiVmwjDrOdryNfViLkDCGItCiXaeT
	hOGo2S4t2ezGTzkj9dUrmXwFg8WdVmesVucrBEgmf6MkZFwpd3K1b29cl3A6QsQmQf06
	v0xGKiahrKclYfuopa/QFXsRAfTOcq2Sy+iVs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=iIhsG2UmhdPfcA5g50jDzCUKdxAaZMa/3FR0pSnKlwY=;
	b=J6hGhHPcLmiNv3kKyPVQ+dntDlz+y93b3X7liWUh1//hbIRDcppyoaXXeJNpsWj0qE
	yGEvQktJUxyKivX+1qlAlFg3Bjk4MvBUK2Uxora15KG+zEGkVAlOGrTdFRqCP58CT528
	RmwtDYJxS8w+EEUSevMHBRUVeepCL963Cf2xpPqyZY6RKx9D9KjSs498T7qkvnq1cy4b
	uklyeoNaJj86D+KcNRG6XESnGAXgB8zBwKEI/3BvkNEvBeqHmYT2Plfr4Ml2R8VKPG7W
	WZEcfDJxzNpAL50ZUygon05eyQHOOcuK2lOZpJxVER511xz3RB+5bs0EPFqFXxbBCT7f
	h9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=iIhsG2UmhdPfcA5g50jDzCUKdxAaZMa/3FR0pSnKlwY=;
	b=P36WmHWafWMHbWpzZuOZQ/0QfWn0fCWIpyAvtmYjQGkwXml/M1QDPXha4bYyORyh5U
	2daZYSTM3osWTkLOwtIGU69bcbT6iupfJcSoU0RsAbgCpAxwUvFQRtsVNYPaT9MmL24x
	uEwA/V0AILl/1NsoWMsTLWqHs/3MtbH47QW4h8ZIqADXZfsHJGF0eToy7DUXtBQpU97S
	GRs7VfpwU/kgremSyxgsg27MtchW19pXASFrop7GjAlCIjJymcRLvjO9AuJeieDdYFTU
	1h1j4tJf3idgVp7UYc8JMH9DZevKa/xYy99MwwEA0drXsSASyfePguio5cOf9LChMr/x
	d1CQ==
X-Gm-Message-State: AOPr4FXyW/npIff1og8uFTW0zwYbiwHh17KfUAPOvnIRDoRkP8Pz2HW2Pa9RwPVoiXTQ4A==
X-Received: by 10.194.103.198 with SMTP id fy6mr3478129wjb.48.1461070050307;
	Tue, 19 Apr 2016 05:47:30 -0700 (PDT)
Received: from pollux.vannes.iot (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164]) by smtp.gmail.com with ESMTPSA id
	g141sm4228868wme.0.2016.04.19.05.47.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Apr 2016 05:47:29 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Apr 2016 14:46:39 +0200
Message-Id: <1461070003-12494-1-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
Subject: [RFC PATCH 0/4] U-Boot verified boot basic support
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
X-List-Received-Date: Tue, 19 Apr 2016 12:47:33 -0000

Hello,

Please find a patchset proposal for U-Boot verified boot basic support.
Before submitting those, I would like to ask people on this list some feedbacks
on the way it's currently implemented.

The verified boot support principle is to sign a kernel fitImage, thanks to an
SSL keypair, and to append a public key in u-boot device tree blob to enable
software integrity check at runtime.

The proposal depends on the U-Boot CONFIG_OF_SEPARATE which in effect splits
U-Boot binaries allowing the DTB file to be outside the main u-boot binaries.

Thus, regarding the current fitImage generation, the following is proposed:

 - extend the generated fit-images.its file from kernel-fitimage.bbclass in
   order to add a 'signature' tag to the configuration section, then add a call
   to uboot-mkimage to sign the fitImage and append the public key to DTB file.

 - add a task in u-boot.inc 'do_assemble_dtb' which concatenates the device
   tree blob with public key to u-boot binary, and organize the u-boot and
   virtual/kernel recipes' tasks this way:

   u-boot:do_deploy -> virtual/kernel:do_assemble_fitimage -> u-boot:do_assemble_dtb

To enable the verified boot, the following variables can be added in a 
configuration file:

   KERNEL_CLASSES ?= " kernel-fitimage "
   KERNEL_IMAGETYPE ?= "fitImage"
   UBOOT_SIGN_KEYDIR = "/signature/keys/directory"
   UBOOT_SIGN_KEYNAME = "dev"
   UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
   UBOOT_SIGN_ENABLE = "1"

Well, I don't know if these changes are the way to go, but at least I think
this limits the codes changes and it propagates the feature to BSP layers which
uses u-boot.inc. Anyway, I would be pleased to get feedback on this.

Best regards,
Yannick

Yannick Gicquel (4):
  u-boot: basic support of device tree blob reassembly
  u-boot: deploy u-boot nodtb and dtb files
  kernel: fitimage: support device tree compiler options
  kernel: fitimage: basic support for fitimage signature

 meta/classes/kernel-fitimage.bbclass    | 53 +++++++++++++++++++++++++++++++--
 meta/recipes-bsp/u-boot/u-boot-sign.inc | 21 +++++++++++++
 meta/recipes-bsp/u-boot/u-boot.inc      | 36 ++++++++++++++++++++++
 3 files changed, 108 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-sign.inc

-- 
1.9.1


