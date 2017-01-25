Return-Path: <yannick.gicquel@iot.bzh>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4D50A6025F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 20:20:07 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id c85so42965696wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 12:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=OSXeJ9O+Pu+SqCXo59drh5/IO0W2O1bsWPaUe5j7BL8=;
	b=trkT+rcWwI4Q7Ms8lcAaLLD2N/n9EKTw4zP8O1dfHcbZV6fzIFgAuxPhGasgWCox1P
	a3IXJU4TraU+Nrz/+t82QYrJRyo9Lbr34MjSqIuJU7GdXmLVpu8BNhuLfhOGqEG6AeAF
	mYwRk/Pwqj4krTiIK4fMemXH07bMrD3kfkcLkaJqpYoTZWrb/TRnaomClqpPwdqgK8yy
	zks+8IB3OtqTVWCmbIsQU+hGG9G/PgdT/SRP9paHo1PjtGlr1g/a36U5B8ImeKJLFw5p
	535MQYs1N1LCplpyS498sNODbcbFpvxM1+Ljuqi68zE1aecORNV0IMHePwXT5Qk8TxR2
	1JkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OSXeJ9O+Pu+SqCXo59drh5/IO0W2O1bsWPaUe5j7BL8=;
	b=CObIoUJJ3LFO6o14GiQFimUi4IIfeMzGt+LI1JT+640FzOqkxKuTD/VuunNlnsyUpG
	O9/68p3IKdppwVqPwxtIuUbWh/zKDFH+eg6EqGq0QcUzd6KE0AXhUeNS9dzSofvCTBk6
	g0DvJfcFxyh0xJvzuH4tXCnpEfKRH27O63fQAFvnXpx3zNnZIZL/bE0MnihxHeUHuftj
	we66ag3vtDlNzjFSyAv2Ga5pxa83RbvM4cn6o6GnvTO+Mk/t4VDbBMdF0zHc3YPCfna1
	Zhh0RKTr1dCi4tMdQ4bVnwJ6PqSLtuCUK6ujmFabCnB9PzpIJQgO8Q+09HMG8tvPUgsE
	KliQ==
X-Gm-Message-State: AIkVDXLygvTmgN0QiHX443ArKMz+OW1hiaaXv8603W/iLJdvDltjjhHaqt1iCavxJT0oSw==
X-Received: by 10.28.211.205 with SMTP id k196mr22880953wmg.124.1485375608050; 
	Wed, 25 Jan 2017 12:20:08 -0800 (PST)
Received: from eiger.ygl.iot (lns-bzn-38-82-253-123-24.adsl.proxad.net.
	[82.253.123.24]) by smtp.gmail.com with ESMTPSA id
	k70sm14668827wmc.3.2017.01.25.12.20.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 12:20:07 -0800 (PST)
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 21:19:46 +0100
Message-Id: <1485375586-30172-1-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] ccache: update to 3.3.3
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
X-List-Received-Date: Wed, 25 Jan 2017 20:20:08 -0000

Release note available at this location:
https://ccache.samba.org/releasenotes.html#_ccache_3_3_3

Moving to tarball source as git.samba.org is not used anymore.

License checksum change is due to an update in URL, now refering to "https"
protocol instead of "http", line 32:
'https://ccache.samba.org/authors.html'

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta/recipes-devtools/ccache/ccache.inc      |  4 +---
 meta/recipes-devtools/ccache/ccache_3.2.5.bb | 11 -----------
 meta/recipes-devtools/ccache/ccache_3.3.3.bb | 12 ++++++++++++
 3 files changed, 13 insertions(+), 14 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.2.5.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.3.3.bb

diff --git a/meta/recipes-devtools/ccache/ccache.inc b/meta/recipes-devtools/ccache/ccache.inc
index 69aa64e..dd528d6 100644
--- a/meta/recipes-devtools/ccache/ccache.inc
+++ b/meta/recipes-devtools/ccache/ccache.inc
@@ -9,9 +9,7 @@ LICENSE = "GPLv3+"
 
 DEPENDS = "zlib"
 
-SRC_URI = "git://git.samba.org/ccache.git"
-
-S = "${WORKDIR}/git"
+SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/ccache/ccache_3.2.5.bb b/meta/recipes-devtools/ccache/ccache_3.2.5.bb
deleted file mode 100644
index afd1b0e..0000000
--- a/meta/recipes-devtools/ccache/ccache_3.2.5.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require ccache.inc
-
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b8a4fa173ed91c1a5204ea4f9c9eadc3"
-
-SRCREV = "424d3ae1fb73444c6c38bf189f8fc048f66d6499"
-
-SRC_URI += " \
-            file://0002-dev.mk.in-fix-file-name-too-long.patch \
-            file://Revert-Create-man-page-in-the-make-install-from-git-.patch \
-"
diff --git a/meta/recipes-devtools/ccache/ccache_3.3.3.bb b/meta/recipes-devtools/ccache/ccache_3.3.3.bb
new file mode 100644
index 0000000..ded7b30
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache_3.3.3.bb
@@ -0,0 +1,12 @@
+require ccache.inc
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=938c02728101936f2a74a67d1d82ee25"
+
+SRC_URI[md5sum] = "ea1f95303749b9ac136c617d1b333eef"
+SRC_URI[sha256sum] = "87a399a2267cfac3f36411fbc12ff8959f408cffd050ad15fe423df88e977e8f"
+
+SRC_URI += " \
+            file://0002-dev.mk.in-fix-file-name-too-long.patch \
+            file://Revert-Create-man-page-in-the-make-install-from-git-.patch \
+"
-- 
1.9.1


