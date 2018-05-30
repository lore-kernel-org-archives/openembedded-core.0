Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id A88177198F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 14:48:56 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w4UEmvVx012070
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 16:48:57 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w4UEmvVl023127;
	Wed, 30 May 2018 16:48:57 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id A82C89550DC;
	Wed, 30 May 2018 16:48:56 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2018 16:48:52 +0200
Message-Id: <20180530144852.25539-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] busybox: Fix zlma segfaults
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
X-List-Received-Date: Wed, 30 May 2018 14:48:58 -0000

- fix multiple lzma segmentation faults
- patch includes multiple fixing commits with tests-cases

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../busybox/busybox/busybox-fix-unlzma-segfaults.patch   | Bin 0 -> 6965 bytes
 meta/recipes-core/busybox/busybox_1.27.2.bb              |   1 +
 2 files changed, 1 insertion(+)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-fix-unlzma-segfaults.patch

diff --git a/meta/recipes-core/busybox/busybox/busybox-fix-unlzma-segfaults.patch b/meta/recipes-core/busybox/busybox/busybox-fix-unlzma-segfaults.patch
new file mode 100644
index 0000000000000000000000000000000000000000..405bfbcc58fc0cfadfb22ca2694d4a59ba9bf150
GIT binary patch
literal 6965
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
W{LcTI1|nRc&RzV|3pPQNK=mIff;bTX

literal 0
HcmV?d00001

diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-core/busybox/busybox_1.27.2.bb
index 36a6342aaf..9f0393505a 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
@@ -45,6 +45,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2011-5325.patch \
            file://CVE-2017-15873.patch \
            file://busybox-CVE-2017-16544.patch \
+           file://busybox-fix-unlzma-segfaults.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.11.0


