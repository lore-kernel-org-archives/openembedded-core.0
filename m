Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id BA00E76B69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:18:53 +0000 (UTC)
Received: by pdob1 with SMTP id b1so58158660pdo.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=U07fIIKIL+5ce9eMtFDIWZ4qqRGUEsv0tpAPY7i3YBQ=;
	b=xyKqdSw/oBrpjUtiqX0r2QuPjitvjZuKVolhdb7jqh+vf3VgnVKvzS+ci+AJpJXvi5
	9xJxRxuZDyN3yw06vEL4pJ6NiuUBY1UohTj2/uBmb1+QW/j9pXeuN8RaJZO34ovcrcO7
	Vm51XgBFLPnU81T+eAeqAJKZpsE9otZYKTAsaiNsz/icOl8pSGsA+OOltxVkiDUH9P2T
	xlyc7aBtbVhaGLhIHsvnuFj42ULvvhI2vEn3onKAZJtN2VSkCrx+RkZU1zcwYjlhTGfG
	BPWE0FrxZXvUCJ885hR8t68as0APpOB+NPvpVInPB5d7TDuMiqLmC71JCU7sJunQacvx
	g2yA==
X-Received: by 10.70.49.36 with SMTP id r4mr49235148pdn.119.1440454733479;
	Mon, 24 Aug 2015 15:18:53 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	mc1sm18565465pdb.14.2015.08.24.15.18.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:18:52 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:18:36 -0700
Message-Id: <16c46495d37fed950d54ef66134e6cb77771e696.1440454289.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <88f419e3f0f9c1a3fa5619641be68b9832de9196.1440454289.git.chris_larson@mentor.com>
References: <88f419e3f0f9c1a3fa5619641be68b9832de9196.1440454289.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440454289.git.chris_larson@mentor.com>
References: <cover.1440454289.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/7] bitbake.conf: add MIRROR vars to SRC_URI vardeps
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
X-List-Received-Date: Mon, 24 Aug 2015 22:18:54 -0000

From: Christopher Larson <chris_larson@mentor.com>

Changes to what mirror we happen to fetch from shouldn't cause rebuilds.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/bitbake.conf | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 21f1698..1407c5f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -581,6 +581,23 @@ SAVANNAH_GNU_MIRROR = "http://download.savannah.gnu.org/releases"
 SAVANNAH_NONGNU_MIRROR = "http://download.savannah.nongnu.org/releases"
 CPAN_MIRROR = "http://search.cpan.org/CPAN"
 
+SRC_URI[vardeps] += "\
+    APACHE_MIRROR \
+    CPAN_MIRROR \
+    DEBIAN_MIRROR \
+    GENTOO_MIRROR \
+    GNOME_GIT \
+    GNOME_MIRROR \
+    GNU_MIRROR \
+    GPE_MIRROR \
+    KERNELORG_MIRROR \
+    SAVANNAH_GNU_MIRROR \
+    SAVANNAH_NONGNU_MIRROR \
+    SOURCEFORGE_MIRROR \
+    XLIBS_MIRROR \
+    XORG_MIRROR \
+"
+
 # You can use the mirror of your country to get faster downloads by putting
 #  export DEBIAN_MIRROR = "ftp://ftp.de.debian.org/debian/pool"
 #     into your local.conf
-- 
2.2.1


