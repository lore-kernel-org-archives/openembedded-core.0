Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA010781E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 10:15:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6CAFZVe022574
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 03:15:35 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Jul 2017 03:15:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jul 2017 03:15:28 -0700
Message-ID: <184b9b8ff984dbe6cc5f84623bd3238f9abab264.1499854502.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1499854502.git.liezhi.yang@windriver.com>
References: <cover.1499854502.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] debianutils: 4.8.1 -> 4.8.1.1
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
X-List-Received-Date: Wed, 12 Jul 2017 10:15:34 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../debianutils/{debianutils_4.8.1.bb => debianutils_4.8.1.1.bb}   | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_4.8.1.bb => debianutils_4.8.1.1.bb} (86%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.8.1.bb b/meta/recipes-support/debianutils/debianutils_4.8.1.1.bb
similarity index 86%
rename from meta/recipes-support/debianutils/debianutils_4.8.1.bb
rename to meta/recipes-support/debianutils/debianutils_4.8.1.1.bb
index 54c345e..23f8421 100644
--- a/meta/recipes-support/debianutils/debianutils_4.8.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.8.1.1.bb
@@ -3,14 +3,13 @@ SECTION = "base"
 LICENSE = "GPLv2 & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20161118T033019Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "http://snapshot.debian.org/archive/debian/20170402T211732Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
-
-SRC_URI[md5sum] = "44083fc66164746880dffd30d62d054b"
-SRC_URI[sha256sum] = "2c395c0bdcfe89de30828b1d25cc5549ded5225a6d3625fbcb2cc0881ef5f026"
+SRC_URI[md5sum] = "ee5fcecaab071bd0c93e8a0cee65d6c4"
+SRC_URI[sha256sum] = "06446cd4c0d309fd31a0682c5c2f07f7613fb867f769414b9cc51f155ad73172"
 
 inherit autotools update-alternatives
 
-- 
2.10.2


