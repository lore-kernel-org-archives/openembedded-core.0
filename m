Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE8577284
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:39:38 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so79686316pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=bZ1+NdNo09jjbwZ/MAjhi8KIlVmo9tLdxTFzhVDnII8=;
	b=GElxCPaUaQXB1cD1+IwXVHeEylU3kXafZRoYJtv4zWISa924sJy5jYZcpyQm5RUuiG
	Te4TbS9/4x4xavQOB0zMBc7FJSzeuhOxP43qmgkRbcC7qYFozUdsgPqUVDw+FcbDxx0Z
	qm/Rj2UNlr2ZhB3+ztZ/OgL1NIVEhm/4O3nZtUeTsEBNicYVVdDJLulOG4HA3Bfb78R6
	jKzpNnwMJpROjCYT0T+HtUn/Yir2LEH+3+DRsETuADdd8gT69CxLjEB/O1UMSDNfMRhu
	x3NFwbYvpA8V5fIHXMU2UveiK8l834MoO0lp5v4Wo8kpA0JIiXgQCVGwSdg9/CFhE6Xe
	oHoQ==
X-Received: by 10.66.123.9 with SMTP id lw9mr27221140pab.119.1447371579456;
	Thu, 12 Nov 2015 15:39:39 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	cs5sm16739866pbc.15.2015.11.12.15.39.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:39:38 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:39:13 -0700
Message-Id: <8d4bc896fd71bbf9bc3bb87ebbd327d0380ec8d8.1447371033.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
References: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371033.git.chris_larson@mentor.com>
References: <cover.1447371033.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 02/11] qemu.bbclass: correct the fsl ppc QEMU_EXTRAOPTIONS
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
X-List-Received-Date: Thu, 12 Nov 2015 23:39:39 -0000

From: Christopher Larson <chris_larson@mentor.com>

These need to be based on PACKAGE_ARCH rather than TARGET_ARCH, as we aren't
using overrides for this.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/qemu.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 601f587..064b57e 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -42,10 +42,10 @@ QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVa
 QEMU_EXTRAOPTIONS_iwmmxt    = " -cpu pxa270-c5"
 QEMU_EXTRAOPTIONS_armv6     = " -cpu arm1136"
 QEMU_EXTRAOPTIONS_armv7a    = " -cpu cortex-a8"
-QEMU_EXTRAOPTIONS_e500v2    = " -cpu e500v2"
-QEMU_EXTRAOPTIONS_e500mc    = " -cpu e500mc"
-QEMU_EXTRAOPTIONS_e5500     = " -cpu e5500"
-QEMU_EXTRAOPTIONS_e5500-64b = " -cpu e5500"
-QEMU_EXTRAOPTIONS_e6500     = " -cpu e6500"
-QEMU_EXTRAOPTIONS_e6500-64b = " -cpu e6500"
+QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
+QEMU_EXTRAOPTIONS_ppce500mc = " -cpu e500mc"
+QEMU_EXTRAOPTIONS_ppce5500 = " -cpu e5500"
+QEMU_EXTRAOPTIONS_ppc64e5500 = " -cpu e5500"
+QEMU_EXTRAOPTIONS_ppce6500 = " -cpu e6500"
+QEMU_EXTRAOPTIONS_ppc64e6500 = " -cpu e6500"
 QEMU_EXTRAOPTIONS_ppc7400   = " -cpu 7400"
-- 
2.2.1


