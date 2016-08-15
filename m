Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 422BA76536
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 14:58:05 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i138so11491258wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 07:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2FeGeaCNGKpteAIMBPXxQWolcUQc296huUh+0TraIuY=;
	b=LADN85MOzHH18wgqhvIdC2qIK5woYjewb9iMBhKZHXNuUSf/v+R5BEyJLYvq+Qf0Uf
	Awj7Tbf0Jems2N10KIvdwPR0OhThNnqX0eUIsB97ZWCwKQclwM4xtzxO2SsjwrfMpGey
	qDp1B8AtobzumnUcC9W6Y5n70OrrjU6x5DNY/8HrDMuXQQl5O423cX2VKGs9En/wNF3L
	j8ws17gtTK4pwECaQWl5x/AkIwonjeS6prKx3Ho5MQVZJgvSH5vbnse93aqgFf78Iy0C
	VPHqm8K38uMkBgm2bMuqphfoqEz4LkyFQ2wlUzIon1v04Kh0dp6fziF4JL3CHBLUwN6Q
	aSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2FeGeaCNGKpteAIMBPXxQWolcUQc296huUh+0TraIuY=;
	b=AjPmfboTor5/yxJzTXav3KWNYWkPEEYQ9Ws7H8bhpMK4asGqaH4GumTYD/2p+ZoQIN
	VERpHyJB1uXOtgXSyxM2Djd/y7i2b1uPs18llzRemZtaAhEtyFJ+GLSgLPMtFrk1VsLr
	+/myOJZnxXumBJMtNKLRRleql9ZJktd5YaJJUE5ToeP+pHReJeCfTjtPWfnNH0Rl8HgX
	3UOQNUJaWeyJYpN3V+JjJYUX0ngEcJzdJ3Tut9bjOFP6ykSqbVMNMjOraAN78ZffP4Pv
	T5HeNA2ZiUeh/9yJaBPn6m3DTULDxFcpOP/wU3qqfhzTyYzsKwVDT9pUa0n7wped0b1n
	oOQQ==
X-Gm-Message-State: AEkoouuio5Xl+oqRFD3RbuhE2YzKCg11ncWEXUCTF6aknSgPFX+KNHDftmdFYrLLSRoXlA==
X-Received: by 10.25.21.32 with SMTP id l32mr5218685lfi.158.1471273086125;
	Mon, 15 Aug 2016 07:58:06 -0700 (PDT)
Received: from localhost.localdomain (m77-218-245-174.cust.tele2.se.
	[77.218.245.174])
	by smtp.gmail.com with ESMTPSA id g88sm73501ljg.26.2016.08.15.07.58.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 07:58:04 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2016 16:58:02 +0200
Message-Id: <1471273082-14460-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] bootchart2: fixes a BOOTLOG_DEST typo
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
X-List-Received-Date: Mon, 15 Aug 2016 14:58:06 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

A flaw was observed in bootchartd that BUILDLOG_DEST should actually be
BOOTLOG_DEST, this seems to be a typo or mix-up which has been fixed in
upstream.

Cherry pick the fix since bootchart2 0.14.8 is still the newest release
so far.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 ...ed-Missing-default-value-for-BOOTLOG_DEST.patch | 28 ++++++++++++++++++++++
 .../bootchart2/bootchart2_0.14.8.bb                |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch

diff --git a/meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch b/meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch
new file mode 100644
index 0000000..dd76ce7
--- /dev/null
+++ b/meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch
@@ -0,0 +1,28 @@
+From 2225ab2038bfe50f16f972e39d89bcd0bd7767f5 Mon Sep 17 00:00:00 2001
+From: Steffen Pankratz <kratz00@gmx.de>
+Date: Tue, 9 Feb 2016 13:49:42 +0100
+Subject: [PATCH] Fixed: Missing default value for BOOTLOG_DEST
+
+Upstream-Status: Backport
+
+BUILDLOG_DEST seems to be a typo or mix-up which was introduced with 281d1df80884bf2969c509ec60ee8a6593524fe8
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
index d0555c3..e6b6611 100644
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


