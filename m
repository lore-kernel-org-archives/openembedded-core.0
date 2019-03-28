Return-Path: <jdmason@kudzu.us>
Received: from mail-yw1-f50.google.com (mail-yw1-f50.google.com
	[209.85.161.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8E85E7D1AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 18:56:18 +0000 (UTC)
Received: by mail-yw1-f50.google.com with SMTP id u197so15525854ywf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 11:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bHI8vO2CG6mEpVQeq0xNsg9R6jC96SvXS0vlSibf1Gs=;
	b=NaFEglEiFmGWF3iXkBF+Hv3qiuqGHkeSAFbte5Gf2mR27Fsbyd5IhVcbLqzF7zzBfC
	B9sHDejCH8jBIO1BiKyMib8k85aE55ZsWWjBmUVYeHQSD6tpLeNKBslUh+8L5n5Ebqg4
	Fc3AL4QCUID+micMboRayJ43IYErUrg0fIsMO42A+RukL03OoaZ/zuF7kf4dRO01mINU
	GT9CAl02K/MglmX8lSbUxtPzcvZ9ZnejlGOyMfdSQ7/QNZ1YKJzk0KXw/nf9uepLjVCN
	b3d76hHm0F8wtvx07MoEA/QQ/Wp8dGExjkxtnYaZj8cMlUQCwal+EhUGLm2Xludo2qls
	Sbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bHI8vO2CG6mEpVQeq0xNsg9R6jC96SvXS0vlSibf1Gs=;
	b=n4TXku7Sabk/j+dPeS9nK9XIXFVXAttXRWQ7muPb5ifoOdfYKuaAdtajGht9jhC0em
	wD3a9laRStzOo1yeBklGo3T5yt6J1Y/7/+5Cz6TQ+BxTFu+1t0SUckE1FqOveVEEJjKy
	LMTrWaOtE6Pa0icIpQD5pskQo6Dy+2oNGsaAilVy8nynT/lI4VzIKZgObwjVIpjyE8Kr
	iHbvwFxZx7WX9utNClLRAykbHNpUFfu8uZQDYaZkB2xDTPDGXylQfOI8kwlsb48kC9QS
	5XET332UCHJXYfXkGBWoMB+Nja4VQW2WTkM/Vyeltr0VsvbVRGPBrsaOqnUvbUHM6wx5
	geDQ==
X-Gm-Message-State: APjAAAXahJCEGlCC/tBU6GehapB1ycJJb4upz1uoc26XF+kCyVqB7NZw
	CwFDDtXvYMnBQi5/0Gny8/G9MQ==
X-Google-Smtp-Source: APXvYqzRDervYxfT7mGl4Ym7i3d0ADbBWhxjiH4TRYtqwM9MAGRL5G1Pd1uu2cGSu7lvHHYETga9HQ==
X-Received: by 2002:a81:7058:: with SMTP id l85mr36234515ywc.68.1553799379450; 
	Thu, 28 Mar 2019 11:56:19 -0700 (PDT)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4]) by smtp.gmail.com with ESMTPSA id
	x16sm22654307ywx.74.2019.03.28.11.56.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Mar 2019 11:56:18 -0700 (PDT)
Received: by graymalkin (sSMTP sendmail emulation);
	Thu, 28 Mar 2019 14:56:17 -0400
From: Jon Mason <jdmason@kudzu.us>
To: yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2019 14:55:53 -0400
Message-Id: <20190328185553.5247-3-jdmason@kudzu.us>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190328185553.5247-1-jdmason@kudzu.us>
References: <20190328185553.5247-1-jdmason@kudzu.us>
Subject: [PATCH 2/2] machine: clean up config files
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
X-List-Received-Date: Thu, 28 Mar 2019 18:56:18 -0000

Beautify the machine config files by making the names and descriptions
more uniform and verbose

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/qemuarm.conf    | 4 ++--
 meta/conf/machine/qemuarm64.conf  | 4 ++--
 meta/conf/machine/qemuarmv5.conf  | 6 +++---
 meta/conf/machine/qemumips.conf   | 4 ++--
 meta/conf/machine/qemumips64.conf | 4 ++--
 meta/conf/machine/qemuppc.conf    | 4 ++--
 meta/conf/machine/qemux86-64.conf | 4 ++--
 meta/conf/machine/qemux86.conf    | 4 ++--
 8 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 9555046189..0a2c995312 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
-#@NAME: generic Arm Cortex-A15 machine
-#@DESCRIPTION: Machine configuration for running a generic armv7
+#@NAME: QEMU Arm Cortex-A15 machine
+#@DESCRIPTION: Machine configuration for running an ARMv7 system on QEMU
 
 require conf/machine/include/tune-cortexa15.inc
 require conf/machine/include/qemu.inc
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 22f6cb742b..5c8aac1511 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
-#@NAME: generic armv8 machine
-#@DESCRIPTION: Machine configuration for running a generic armv8
+#@NAME: QEMU ARMv8 machine
+#@DESCRIPTION: Machine configuration for running an ARMv8 system on QEMU
 
 require conf/machine/include/arm/arch-armv8a.inc
 require conf/machine/include/qemu.inc
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index e3948a25da..1c21d3342d 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
-#@NAME: arm_versatile_926ejs
-#@DESCRIPTION: arm_versatile_926ejs
+#@NAME: QEMU ARM9 machine
+#@DESCRIPTION: Machine configuration for running an ARMv5 system on QEMU
 
 require conf/machine/include/qemu.inc
 require conf/machine/include/tune-arm926ejs.inc
@@ -20,4 +20,4 @@ QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virti
 PREFERRED_VERSION_linux-yocto ??= "5.0%"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
-KMACHINE_qemuarmv5 = "qemuarm"
\ No newline at end of file
+KMACHINE_qemuarmv5 = "qemuarm"
diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index a60f67aa87..48d9f41d9d 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
-#@NAME: mti_malta32_be MIPS
-#@DESCRIPTION: mti_malta32_be
+#@NAME: QEMU MIPS32 machine
+#@DESCRIPTION: Machine configuration for running a MIPS system on QEMU
 
 require conf/machine/include/qemu.inc
 require conf/machine/include/tune-mips32r2.inc
diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
index 970c0ce7ae..1872e7b62d 100644
--- a/meta/conf/machine/qemumips64.conf
+++ b/meta/conf/machine/qemumips64.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
-#@NAME: mti-malta64-be MIPS64
-#@DESCRIPTION: mti-malta64-be
+#@NAME: QEMU MIPS64 machine
+#@DESCRIPTION: Machine configuration for running a MIPS64 system on QEMU
 
 require conf/machine/include/qemu.inc
 require conf/machine/include/tune-mips64r2.inc
diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index 743d26170e..bd88eeb12a 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
-#@NAME: qemu PPC Emulator setup
-#@DESCRIPTION: Machine configuration for running an PPC system under qemu emulation
+#@NAME: QEMU PPC machine
+#@DESCRIPTION: Machine configuration for running a PPC system on QEMU
 
 require conf/machine/include/qemu.inc
 require conf/machine/include/tune-ppc7400.inc
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 9966d1a04c..383e3bd6f3 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
-#@NAME: common_pc
-#@DESCRIPTION: Machine configuration for running a common x86
+#@NAME: QEMU x86-64 machine
+#@DESCRIPTION: Machine configuration for running an x86-64 system on QEMU
 
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index e78fb6e87b..ae5187cbd5 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
-#@NAME: common_pc
-#@DESCRIPTION: Machine configuration for running a common x86
+#@NAME: QEMU x86 machine
+#@DESCRIPTION: Machine configuration for running an x86 system on QEMU
 
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-- 
2.17.2


