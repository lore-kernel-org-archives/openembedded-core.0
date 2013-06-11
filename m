Return-Path: <kergoth@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id E52EA6A9BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 01:49:32 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp16so4395249pbb.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 18:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=S6u9LjyrFAHTSMWMD0K1eprlP0ris5FGwdx8DiHG3VM=;
	b=oea1PyLRcASHqSmL4m7EMTbrKZnxQiCm+YJiSilxL9348pGjvPBICQq77I9eQZWhyR
	FFExhPwWpk2slVX9/4K9FXGAwnnYL6nOQyvhd97YlJ+QO4Y+vadwBmPqh0zjffjT1frp
	U+3rpal9Z5up2t05qvAo9IAp1+aPY4VKZnGQr25TJ4t/VjPXBFvfxe7rVW8kur3oRwEO
	/6wz0L0lplRm6pi2bU3WMPOoPn8xPi1FTzekQ5DL4VPiuRyBLu9fSX/Id6dhhyqC1M5m
	sTo9IRJxw6OQ3uQlpxKYWNgHBFCNSmVHtRRmp7viIM+JZFx11yJ+DJy5OoCwiXG9o4aL
	CeIQ==
X-Received: by 10.66.87.5 with SMTP id t5mr16759057paz.169.1370915374293;
	Mon, 10 Jun 2013 18:49:34 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id z19sm3388361paf.12.2013.06.10.18.49.32
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 18:49:33 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 18:49:32 -0700
Message-Id: <7f4fb2309d94309d5aeb7f1535f3bb807a4794a8.1370915304.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370915304.git.chris_larson@mentor.com>
References: <cover.1370915304.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370915304.git.chris_larson@mentor.com>
References: <cover.1370915304.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2 2/4] packagegroup-base-vfat: include dosfsprogs
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
X-List-Received-Date: Tue, 11 Jun 2013 01:49:33 -0000

From: Christopher Larson <chris_larson@mentor.com>

The ext2 group includes e2fsprogs, so this is consistent and should be
appropriate, I think.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 799e12a..061c1a7 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -179,7 +179,8 @@ RRECOMMENDS_packagegroup-base-vfat = "\
     kernel-module-msdos \
     kernel-module-vfat \
     kernel-module-nls-iso8859-1 \
-    kernel-module-nls-cp437"
+    kernel-module-nls-cp437 \
+    dosfsprogs"
 
 SUMMARY_packagegroup-base-alsa = "ALSA sound support"
 RDEPENDS_packagegroup-base-alsa = "\
-- 
1.8.3


