Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8440771DDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 14:44:19 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k9so5167756wre.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 06:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=nOwoKitP7DkgVfPDraEZyfjIOjwQMLOCJDCsycy9Ln4=;
	b=ISI3Au/L8iqSu7bqtQTAIq9y55T7zRLlKeNZZm2UUzlHIl74qwdztd+AH02Q88UWXf
	DoHjNpN1VLi8wB1mmFHjsONGskO3djYog1/ZynTDXHn/ps1CYVfEeilO0n4vQYjdFuhW
	k+0mwJrs94QTOsOiQTXLc6lY531f8ZxCXGLuAs+65CqqmiXg/Dx+88/bjUNSRzs74CFF
	oobYwiAPQA97zuSCz0fm2no1rw4KpqmupT5Iam18MYCtZ98igIj4papJFxQiyoqHx7di
	gP4VNhwv6wtU4s2IOJrBN3tnhGPW161pU7OJT+OAH4S9sHhKpIVxd9AtZf02sfelQyJs
	qlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nOwoKitP7DkgVfPDraEZyfjIOjwQMLOCJDCsycy9Ln4=;
	b=thVQgsoJdFCNORemsDMG/QAEEURShSPBYwyaiYIjLdJkPTUS6A2zqXLUWdEl7rmwvM
	QdzZWPVFTMFAhGWeMvFV9uIldmGRYBP3hsRAogbDyUXLfC/wAqWjxXu8ImXA+mc7BWLp
	4Ejt7lf417bOWZKMipTuTnPI+1ua3KjbC7kkZJG8lO/+TSc6kV2FIGyiyGEXXqTFg7Pc
	WZG4gcpf068xjyqfh7fu+8+uYg5fpJqxoYH3tLOemfBNo8xxNo4Puh62/1uLQwhBhh/a
	D7SM0Oqbxe0d7Krsa6fAGqTOf+0jJOCa7DxX7j/j9grs3coLLfCHAJvTISTBfRtSvhZ8
	PZIg==
X-Gm-Message-State: APf1xPCYA3O4Poy/4AQEv644tH/L7tSh0xoW/QPcGG6Nj7BKBHN8Sh9Y
	v0dHQRLzNbyjIP7aYpgc91OSink+
X-Google-Smtp-Source: AH8x2240SQQ/XfeKmYzwoDIUGN5VFxjS4X6rNZosKpjwa/dK+ff3NB5y5BBBx5fcTjBLtnx5EB14lQ==
X-Received: by 10.28.1.14 with SMTP id 14mr2243204wmb.40.1519224260741;
	Wed, 21 Feb 2018 06:44:20 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b136sm22004736wme.34.2018.02.21.06.44.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Feb 2018 06:44:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Feb 2018 14:44:18 +0000
Message-Id: <20180221144418.2036-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] mpfr: merge bb/inc and fix license
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
X-List-Received-Date: Wed, 21 Feb 2018 14:44:20 -0000

Merge the bb/inc as there's no reason to split them.

Remove redundant S assignment.

Fix the LICENSE assignment to LGPLv3+.  The source of mpfr is Lesser GPL v3 or
higher, the GPL is assigned to some test data that isn't shipped.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/mpfr/mpfr.inc      |  6 ------
 meta/recipes-support/mpfr/mpfr_3.1.5.bb | 10 ++++++----
 2 files changed, 6 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-support/mpfr/mpfr.inc

diff --git a/meta/recipes-support/mpfr/mpfr.inc b/meta/recipes-support/mpfr/mpfr.inc
deleted file mode 100644
index 7f3f9175dc4..00000000000
--- a/meta/recipes-support/mpfr/mpfr.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-SUMMARY = "C library for multiple-precision floating-point computations with exact rounding"
-HOMEPAGE = "http://www.mpfr.org/"
-LICENSE = "LGPLv3+"
-SECTION = "devel"
-
-inherit autotools texinfo
diff --git a/meta/recipes-support/mpfr/mpfr_3.1.5.bb b/meta/recipes-support/mpfr/mpfr_3.1.5.bb
index 2d59c4a1be1..a78c0bd4865 100644
--- a/meta/recipes-support/mpfr/mpfr_3.1.5.bb
+++ b/meta/recipes-support/mpfr/mpfr_3.1.5.bb
@@ -1,6 +1,10 @@
-require mpfr.inc
+SUMMARY = "C library for multiple-precision floating-point computations with exact rounding"
+HOMEPAGE = "http://www.mpfr.org/"
+LICENSE = "LGPLv3+"
+SECTION = "devel"
+
+inherit autotools texinfo
 
-LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "gmp"
@@ -13,6 +17,4 @@ SRC_URI[sha256sum] = "015fde82b3979fbe5f83501986d328331ba8ddf008c1ff3da3c238f49c
 
 UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
 
-S = "${WORKDIR}/mpfr-${PV}"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


