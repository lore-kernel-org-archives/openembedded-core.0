Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30996.1794845357645232928
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lNmWL03P;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 131711A169D
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D526F6023F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14F7211BC118D;
	Mon, 16 Nov 2026 17:09:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845355; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mOZVTJO0tHxsgzCcAmy0WwL5XJ/AGNkBXwhcxCI9JFA=;
	b=lNmWL03P73CGXyUANLhBhURB8i2Jfavv3BaM6iG+Zd/zFy8CvgEGB+w1RF4DJFdHdI3OX/
	70y/MPCsJ7PpPVARb29Sqd0d5nAKs/7YFS7AKP3m+vcBnhsvn89wPeW9z0DP1f0pvjEY8D
	st4JcaKehcZsGbksIylpykcCEp7Xd8tOpgh1L4AJx7btcfTSQAQ6N/SLnFC3pMo1LC6hmm
	GF7SIpHupfZR+do9hAS+5IOvRCXOxoK2VSIUR5MNuNiA3hQagWS5t6aBbBEb24bZeGP4sh
	CCs9jNJ82DT9CLtcfInQ7ZoG4GA4nEiginHOAEFvTozFyqkedWIZyMaTE1Gnjg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 16 Nov 2026 17:09:06 +0100
Subject: [PATCH 08/13] lib/oe/kernel: convert comments to docstrings and
 improve
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-oe-lib-docstrings-v1-8-0c894f6a1064@bootlin.com>
References: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
In-Reply-To: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2300;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/yYCp1M22XeRIT2Y21p45vhIwKetUPxykt7Tg1C/NEY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq+yqfnAOXiM8TpG3goBtvMLR1QerKuXIGYWd05
 Bvm3s1gpweJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCavsqnwAKCRDRgEFAKaOo
 NvLnD/9ojDbgYramBCMwQi2BGJuHFJvEHavr4Kfb7yKhqe9Amjz3GFkRpNYNBe02ZA7dtse74yG
 fyhsUuXh4J3tGCput98QGGGs+B4DUFfqWaZk5TYZB6pkrRi+Z2KBSwhQwwT7mInKUGipiyyJ4P4
 UYGAdUlPkYsBmlCjWXkRKDL39IclIqjaJX+itcCyxJ/yDZehGJeY8PhWPoshFZv+N0f4gMQp4VC
 LJdAUvi0eE7ysbuVdCbhSoIc4k+zm/yPTwN6dawJ0Aw3UgfsCPTN/AWFGngTqWGoPAeAQMlhAbm
 sw5bx7MNJ7VsF1IF/rBMo5jqGOArFs98PKIHCV0I4ig3pPwJuT+4YswdkVVGNPtuZGMPIUaa4WW
 Mw8+8ynMCQNp5e3WsRvwyo1+MD/VGaBXhxNivb9QaqYaceHThc/PKvLJ3bhdOfvuOv6rPwifAFt
 5mcAmIuaFDnYQt9S5poZXI7t8TGzTZBjLSPC/HGsYp+8hBEXZsl7GTXmqdvFKxDKhgpWt8xrOoe
 xNiBsA2EW5+0vyjRTqTiVIBNtofCyHBW6nXPKivU7s6aUyuk4GA7rwZmmTutmlMv3yFJYzGeN10
 2/C2u1HATN/Tbh+1MFZTvnnLAaXhsQopBLxB4JuZYtZZUWVBWZ28MBD7FZJ/aF//b2i8/10nmMd
 RW+xMvk1HVeDzdw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250358

Most functions in this module were comments. Move them to docstrings so
we can use this data in documentation modules such as Sphinx. Improve
the docstrings by detailing the parameters and return value.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/lib/oe/kernel.py | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/kernel.py b/meta/lib/oe/kernel.py
index 624eace10e..5c94a5df90 100644
--- a/meta/lib/oe/kernel.py
+++ b/meta/lib/oe/kernel.py
@@ -7,10 +7,13 @@
 import os
 import re
 
-# Return a value for the ARCH environment variable for kernel compilation (including
-# modules). return value must match one of the architecture directories
-# in the kernel source "arch" directory
 def map_kernel_arch(d):
+    """
+    Take ``d`` (the :term:`datastore`) to get the value of :term:`TARGET_ARCH`
+    and return a value for the ``ARCH`` environment variable for kernel
+    compilation (including modules). Return value must match one of the architecture
+    directories in the kernel source "arch" directory.
+    """
     a = d.getVar('TARGET_ARCH')
 
     valid_archs = ["alpha", "cris", "ia64", "i386", "x86", "m68knommu", "m68k", "ppc", "powerpc",
@@ -39,13 +42,20 @@ def map_kernel_arch(d):
             return a
         bb.error("cannot map '%s' to a linux kernel architecture" % a)
 
-# Return a value for the -A parameter to u-boot's mkimage
-# This would be the value from the table in boot/image.c:uimage_arch
 def map_uboot_arch(d):
+    """
+    Take ``d`` (the :term:`datastore`) to get the value of :term:`TARGET_ARCH`
+    and return a value for the ``-A`` parameter to U-Boot's ``mkimage``.
+    This would be the value from the table in ``boot/image.c:uimage_arch``.
+    """
     return map_kernel_arch(d)
 
-# parse kernel ABI version out of <linux/version.h>
 def get_version_headers(p):
+    """
+    Take ``p``, the root of the kernel build directory and parse the kernel
+    ABI version out of ``<linux/version.h>``, and return a string containing
+    the ABI version, if found. If not found, return ``None``.
+    """
     fn = p + '/include/linux/utsrelease.h'
     if not os.path.isfile(fn):
         # after 2.6.33-rc1

-- 
2.56.0

