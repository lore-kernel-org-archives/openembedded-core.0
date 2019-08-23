Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E60B57F367
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 14:37:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46FPBm1Tb7z5k
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 16:37:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566571072;
	bh=41aWYrvCB+9Gl4c2uVVayQ1d+tQSjfWP5KlNSVVThqg=;
	h=From:To:Subject:Date:From;
	b=CIw85JuPYcPXgvlchzW84ShYyv8anm+66CukR2WPWJRuIjElzg4p6XCDzuv3lGvOe
	+UY8ZkizIS3k9pdaSinz2qVMNYsWl9EEoFgRRY0HSkC2nXTGpZToIoezG3OE1Ul6gA
	XNfeAmT/bf4U4rICcrK/o4L0pKVUIVj9LPN8Y4etrLQtM716V8Q23LofSDnz0SL39J
	pBydH+OHTLvD3glfDIirfpQ+03QtqcO8Wkb63ui7MjVnij8/MO67Gy3wcgmjXQpWoY
	oyw2WSe3fRcMEXtWK7Rg8AiC0fVp84emUsm0PGxK3l0fXYg/fEy/vRVC6afAj9mHeL
	URRn4E6Uhe3pnIi3Wox4ifgn3BX1NT6oPm3FUQjCwpcqVvbon+yB4IH6MBtzjoOByZ
	alHdM+RBeB0jR9UQj9vcwvR1a+Wp2IG/y1MB7DpdLsSsOEDeMxW4LP0qjYU050RkEa
	zS/FV6MOi1cT9iBrNaR5UPduMotQRvBZGijVUI077OgqoX2eOSuUfzosVnGymZPFg5
	SRGyajPlbe3Q6R+OrtrKupL2z5pPAyffLVT+gfyZKOjh4AMif6+la2sUtvcC/wU7YJ
	/LMuucbup3b5dv27BfQuUOdELHPo4kk/gqe4DnE0guhfk1d69lSJ2+mi+u8YvJ4X+a
	A2jCn3XoKHmc8hJg6516Sc5M=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 17:37:50 +0300
Message-Id: <20190823143750.12232-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] linux-dtb.inc: Remove
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
X-List-Received-Date: Fri, 23 Aug 2019 14:37:52 -0000

It only printed a warning since Yocto 2.4,
documented to be removed in a future release.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-kernel/linux/linux-dtb.inc | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-dtb.inc

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
deleted file mode 100644
index f1912775ca..0000000000
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-python() {
-    bb.warn("You are using the linux-dtb.inc which is deprecated. You can safely remove it as the Device Tree support is automatically enabled when KERNEL_DEVICETREE is set.")
-}
-- 
2.17.1


