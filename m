Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.14755.1601360421690015912
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 23:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08T6KKb6014742
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 23:20:20 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Mon, 28 Sep 2020 23:20:13 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] debianutils: update the debian snapshot version
Date: Tue, 29 Sep 2020 14:19:20 +0800
Message-ID: <20200929061920.25379-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

After debianutils upgrades to 4.11.1 in [1], there is no
4.11.1 source in the old debian snapshot. Update the snapshot
version to fix the gap.

[1] https://git.openembedded.org/openembedded-core/commit/?id=0c492a0768cd15ff40db35f459853e69c55f8cc6

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-support/debianutils/debianutils_4.11.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/debianutils/debianutils_4.11.1.bb b/meta/recipes-support/debianutils/debianutils_4.11.1.bb
index ef7aa50408..3b1767e5ed 100644
--- a/meta/recipes-support/debianutils/debianutils_4.11.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.11.1.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 LICENSE = "GPLv2 & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=9b912cd0cc654134c0ef3424a0705b94"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "http://snapshot.debian.org/archive/debian/20200929T025235Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
-- 
2.26.2

