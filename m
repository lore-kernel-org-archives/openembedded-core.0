Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4AF5D78F14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 15:29:28 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id e18-v6so16298642wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 08:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=uesKvN1pCb7k9w43CICjxioCS9uju1vSFa64z2FEpgs=;
	b=V/l8hLIMTy8/mrtpkNuSw2X5Nt8y+l+THVf1D8qJ+KapB3uzfjcmHhOl3PEtSRCXEW
	0gv01jGnHEQPcC6C6k6LJTxADdGTneJM33uE/GiqHeK+iwHXIwqRI79Qwp+Kcjx9hdNI
	OSEMya45n3LR1CDMjxeUF6FQSemjXmTeriuAN69fnJ+GnGwuNANA7w7UzeSd/4GnyAsH
	5YSl3swmbjm26J7ElZnJf50fDNSn7njU+q+m5NuFFDikyypbS5KVOD6gOT6rtRanqYFi
	ptqkgfb8BR4zN6z7tFcC9JgtBqQzTTJpNAiKiF7ASiylqjtM1odDukNp97ps0v5SBrzS
	KW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uesKvN1pCb7k9w43CICjxioCS9uju1vSFa64z2FEpgs=;
	b=jrLNiFmhi3B+8SYIVjUIEeBQHIXTS9GnQKJtVfWm25EdFP9ziojjrebO4FIYzlPxqL
	NmSFTYVEo8nZ96+qNMTOtxqLrUCtWzVYWuDrjU0zFHW3hIrEhw3KJqQssCe8aCzPMxvY
	6kddTMDBUNlQYUxqfsBvUj7QpckqZxOXqhN+0SoENcckGoRGU4WlXhYXxFfivI4cqolh
	1Mpy2d0l2I0Mc5nd7F6qCNIC51BqjsGVwircMXpw85vbGNJNFUagBccvLW2bOixI0Nax
	zGoyd4vxytfaOzTYUlgrsP5PHWMzuMPyh1eeZf0XecrN4qQ8viRPcGpXZIojthrOvGHx
	ZLdQ==
X-Gm-Message-State: APt69E135Ew4DZmXnO2eeCWenClzuKCbDb/XNjyjJ5JR+4aO5noN9A+n
	VIULdbaS1wKjLJlhEqo954Pgt+1c
X-Google-Smtp-Source: ADUXVKJ51irbg2ylDkOQ3yRQDKdX0aGmOWL8LHo0L4+lJwYOvH/+xZNZjCz7s11X+G3Kp7eqT/rAqg==
X-Received: by 2002:adf:b258:: with SMTP id
	y24-v6mr655080wra.168.1528817368605; 
	Tue, 12 Jun 2018 08:29:28 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v68-v6sm1131388wmd.12.2018.06.12.08.29.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 08:29:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 16:29:25 +0100
Message-Id: <20180612152925.1838-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libdrm: drop uclibc-specific patch
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
X-List-Received-Date: Tue, 12 Jun 2018 15:29:28 -0000

This patch isn't needed for musl or glibc, so drop it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../drm/libdrm/fix_O_CLOEXEC_undeclared.patch      | 24 ----------------------
 meta/recipes-graphics/drm/libdrm_2.4.92.bb         |  1 -
 2 files changed, 25 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm/fix_O_CLOEXEC_undeclared.patch

diff --git a/meta/recipes-graphics/drm/libdrm/fix_O_CLOEXEC_undeclared.patch b/meta/recipes-graphics/drm/libdrm/fix_O_CLOEXEC_undeclared.patch
deleted file mode 100644
index 4708bf1ebb8..00000000000
--- a/meta/recipes-graphics/drm/libdrm/fix_O_CLOEXEC_undeclared.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-drmdevice.c: define _GNU_SOURCE
-
-Include config.h to fix this build error with uclibc:
-
-libdrm-2.4.66/tests/drmdevice.c: In function 'main':
-libdrm-2.4.66/tests/drmdevice.c:96:60: error:
-'O_CLOEXEC' undeclared (first use in this function)
-fd = open(devices[i]->nodes[j],O_RDONLY | O_CLOEXEC, 0);
-
-Upstream-Status: Pending
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
-diff -Naur libdrm-2.4.66-orig/tests/drmdevice.c libdrm-2.4.66/tests/drmdevice.c
---- libdrm-2.4.66-orig/tests/drmdevice.c	2016-02-23 11:34:02.054904502 +0200
-+++ libdrm-2.4.66/tests/drmdevice.c	2016-02-23 11:35:34.371750383 +0200
-@@ -21,6 +21,7 @@
-  *
-  */
- 
-+#include <config.h>
- #include <errno.h>
- #include <stdio.h>
- #include <stdlib.h>
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.92.bb b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
index 8f59452a49c..2b3bf4f83d2 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.92.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
@@ -12,7 +12,6 @@ DEPENDS = "libpthread-stubs libpciaccess"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://installtests.patch \
-           file://fix_O_CLOEXEC_undeclared.patch \
            file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
           "
 
-- 
2.11.0


