Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id BC9CB755F8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 14:23:21 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id w143so13658388wmw.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=mFUPvhpr+XZ0o56gpVf3K7ZdDNDEOhnEKwXEI4/avtM=;
	b=aed3iW5X2rFEgZm1OzOQU1p89Zn3Ohbjbl+1LmhIV4BNKgC8kZrqQgbGrm8YGpKVLy
	KNWnFGM39bLgNC522JJBFudPt+lDtzmm9JGQbYWoBau7u5ypBtRKLlJSUzXkEQ+rYS72
	IhxSkDkL0cMueXyLRv2IVRAMYpxqJaAQwBBrc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=mFUPvhpr+XZ0o56gpVf3K7ZdDNDEOhnEKwXEI4/avtM=;
	b=PIYGBATRZKX2qz15Vze57uNCQT+5P810GIbae4DaF7k/8LD6HM8mPN9zoC3V1Zg97G
	Suhdk8GQ7JR4eFObqu4Oj1kCQMjaeEmn6JVI6VkxfpJmQdIbSe6Cues4hssUXZnYgaOI
	1PcbvEYZfe0Kt8DOJnKcvb6Dj827hg/ialvRW6h5QxiZTp6nuHgLoesR4ILM7axyCS8U
	KxO7RVpLzxMgU9pNd9GYYoKLDvCD1wgcNiaoO/iqmWWFrUWC8hxQI1M5XoK+ewRb+hD5
	wU+RQk8DHnSOiW3YhMwfzCBj3FFz70jxekhToZD1MtkCXPqBRJRkgRixOYfkJeKy0Hk1
	s9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=mFUPvhpr+XZ0o56gpVf3K7ZdDNDEOhnEKwXEI4/avtM=;
	b=QgVieDHrwpnEZrwrgyh+QMgL8+H4FuaP5ex6Qn1vYWeQ/vZdVwjOfthEgaaMyyi7nb
	Q/Ecdws3AzfEYtvjYNfxPaPa5ViB2n0fxV87icTc1sNAhZj/fD82AHBPi5Dzet7XOJtR
	ptHfLfG3rPfHBglp60ag1AN6QfJX/AuWqW1Nnx3KG2DNULqfWlfurfEK0aw9tgPvcLSm
	Va7j1Bb+NLeYCmRD/m+MqeNPs+CgKDDl0osTqxx19oo0/iSAlaxzOrNQ+Pvdp9NbIsWx
	yjE5UzhbSlFxqpAd13FSRscXa52S2j0sl7WqzPOCgUsmxv54cAPR6oKrvDvfM16tCKF7
	Xbqg==
X-Gm-Message-State: AOPr4FVMFt66XTxJLYAeKuO7ZxHpIIf8G8dHiDP1YkryaxGnTv/dKuaEToth0/NugYvfeg==
X-Received: by 10.194.32.199 with SMTP id l7mr9640214wji.137.1461767002275;
	Wed, 27 Apr 2016 07:23:22 -0700 (PDT)
Received: from pollux.vannes.iot (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164]) by smtp.gmail.com with ESMTPSA id
	kq9sm4313514wjc.26.2016.04.27.07.23.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 07:23:21 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 16:20:52 +0200
Message-Id: <1461766856-27881-1-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v3 0/4] U-Boot verified boot basic support
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
X-List-Received-Date: Wed, 27 Apr 2016 14:23:26 -0000

Changes since v2:
  * Support custom u-boot recipe name based on PREFERRED_PROVIDER_u-boot
  * Introduces new tasks instead of '_append' and '_prepend' on existing tasks

Changes since v1:
  * Uses a class uboot-sign.bbclass file instead of include file.
  * 'assemble_dtb' task removed and replace by do_install_prepend function
    for u-boot recipe.

Yannick Gicquel (4):
  u-boot: basic support of dtb append for verified boot
  u-boot: deploy u-boot-nodtb and dtb files
  kernel: fitimage: support device tree compiler options
  kernel: fitimage: basic support for fitimage signature

 meta/classes/kernel-fitimage.bbclass | 53 +++++++++++++++++++--
 meta/classes/uboot-sign.bbclass      | 89 ++++++++++++++++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot.inc   |  2 +-
 3 files changed, 140 insertions(+), 4 deletions(-)
 create mode 100644 meta/classes/uboot-sign.bbclass

-- 
1.9.1


