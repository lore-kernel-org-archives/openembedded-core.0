Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9ABA160721
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 09:19:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 09 Feb 2016 01:19:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,420,1449561600"; d="scan'208";a="880249353"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 09 Feb 2016 01:19:52 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org,
	nicolas.dechesne@linaro.org
Date: Tue,  9 Feb 2016 11:24:52 +0200
Message-Id: <aae55470a8d782e166fc6135ceb03631e1346429.1455008560.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455008560.git.jussi.kukkonen@intel.com>
References: <cover.1455008560.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/4] systemd: Don't depend on gcrypt unnecessarily
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
X-List-Received-Date: Tue, 09 Feb 2016 09:19:53 -0000

Since upstream commit 79e8bde40 it's no longer necessary to depend
on gcrypt when --disable-gcrypt is used.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-core/systemd/systemd_228.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
index a110f0c..73338e3 100644
--- a/meta/recipes-core/systemd/systemd_228.bb
+++ b/meta/recipes-core/systemd/systemd_228.bb
@@ -68,9 +68,6 @@ PACKAGECONFIG ??= "compat xz ldconfig \
 PACKAGECONFIG[journal-upload] = "--enable-libcurl,--disable-libcurl,curl"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
-# regardless of PACKAGECONFIG, libgcrypt is always required to expand
-# the AM_PATH_LIBGCRYPT autoconf macro
-DEPENDS += "libgcrypt"
 PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
 PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"
 PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"
-- 
2.1.4


