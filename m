Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 91F4F75E2D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 11:26:15 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o80so23087320wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 04:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=d4fDImmVHomGvXFE2Jk2jZeRMMY9eWAShkBejVTHigg=;
	b=J/0B5wFo/9Nup+4XuvCgp1UTD15iNL/wOgV47BiQeq8E+S4cvm6yfbAwm8YvwJm/Ka
	YP2Myw8JYfgFLpNmbf6ald0TVe/cysGGsNXwuHuv2OzR/gSldr0axnf5m4PXhgav3zdI
	2J6STVsCL5r3ov1reTOyOr+31MdcBJxlB5pMxwW8W/e3UvjBuwde/F9C+rhGcnKAGlBv
	BxoXmckuzBdIcRFpFfaoTzhzjcbyqYA7Cfy/RPS5kqxkz1xZNfS6wHF0pYnPEsVMY65V
	/QPjESeYWo6zTmE2da8CFsMFvEKkYs2daCyhoAOpGLRBlyJfKWMnsQ9QDDpq618Xf4lE
	y/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=d4fDImmVHomGvXFE2Jk2jZeRMMY9eWAShkBejVTHigg=;
	b=MJBMu/1okBaj9YUbehwecPTW5I3pXcvHt3CM6d8/bYlYoJExxWQlYTMvIBTaX1CorF
	ZsRHd10f+wFf3qi0SUfdG17JmTLtV9lS9WlI9f92gb+21sRzhbgtAZvRRisb+9AOvKRH
	MnxobQOZWnbPnI4kT2pFgRTu4aXm8rA6eavRqiA8lE8jtNLfot9dOu52ctQy0rCc4khg
	+UWPVTJPguGmog9NOXBxP/2Zm8iWAWr+XVnUEJ81ZDhwXjG2sor5ZKLzFBtcKIr2mRbL
	6ZI288+HKXdGs/1mK+iJ2UvZFkD6wQaW6Dd4qTgS+fYNJr2bdIKkkN8SkJb4RPa1aySv
	+2HA==
X-Gm-Message-State: AEkoousYCKM2TL5Tdu8BzzjrbAYGIj3vwnaP2vTxgdhlFtCS5KRIOFsDES4Zz+DC9WyJ6Q==
X-Received: by 10.46.1.224 with SMTP id f93mr6855978lji.44.1471433175273;
	Wed, 17 Aug 2016 04:26:15 -0700 (PDT)
Received: from localhost.localdomain (m83-185-244-190.cust.tele2.se.
	[83.185.244.190]) by smtp.gmail.com with ESMTPSA id
	g72sm1471901lji.43.2016.08.17.04.26.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Aug 2016 04:26:13 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2016 13:26:09 +0200
Message-Id: <1471433169-15298-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V3] bootchart2: fixes a BOOTLOG_DEST typo
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
X-List-Received-Date: Wed, 17 Aug 2016 11:26:17 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

A flaw was observed in bootchartd that BUILDLOG_DEST should actually be
BOOTLOG_DEST, this seems to be a typo or mix-up which has been fixed in
upstream.

Cherry pick the fix since bootchart2 0.14.8 is still the newest release
so far.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 ...ed-Missing-default-value-for-BOOTLOG_DEST.patch | 30 ++++++++++++++++++++++
 .../bootchart2/bootchart2_0.14.8.bb                |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch

diff --git a/meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch b/meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch
new file mode 100644
index 0000000..118814a
--- /dev/null
+++ b/meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch
@@ -0,0 +1,30 @@
+From 2225ab2038bfe50f16f972e39d89bcd0bd7767f5 Mon Sep 17 00:00:00 2001
+From: Steffen Pankratz <kratz00@gmx.de>
+Date: Tue, 9 Feb 2016 13:49:42 +0100
+Subject: [PATCH] Fixed: Missing default value for BOOTLOG_DEST
+
+Upstream-Status: Backport
+
+BUILDLOG_DEST seems to be a typo or mix-up which was introduced with 281d1df80884bf2969c509ec60ee8a6593524fe8
+
+Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
+---
+ bootchartd.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bootchartd.in b/bootchartd.in
+index f58ab9e..30af677 100755
+--- a/bootchartd.in
++++ b/bootchartd.in
+@@ -37,7 +37,7 @@ PATH="/sbin:/bin:/usr/sbin:/usr/bin:$PATH"
+ 
+ # Defaults, in case we can't find our configuration
+ SAMPLE_HZ=50
+-BUILDLOG_DEST=/var/log/bootchart.tgz
++BOOTLOG_DEST=/var/log/bootchart.tgz
+ AUTO_RENDER="no"
+ AUTO_RENDER_DIR="/var/log"
+ AUTO_RENDER_FORMAT="png"
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
index d039b1b..cc79a93 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
@@ -92,6 +92,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
 SRC_URI = "git://github.com/mmeeks/bootchart.git \
            file://bootchartd_stop.sh \
+           file://0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


