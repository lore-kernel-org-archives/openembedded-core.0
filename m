Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 498C8606B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 07:41:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5S7egBI020793
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 00:40:57 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 28 Jun 2018 00:40:31 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jun 2018 15:39:48 +0800
Message-ID: <1530171589-21641-4-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530171589-21641-1-git-send-email-yi.zhao@windriver.com>
References: <1530171589-21641-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH 3/4] debianutils: update to 4.8.6
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
X-List-Received-Date: Thu, 28 Jun 2018 07:41:06 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../debianutils/{debianutils_4.8.4.bb => debianutils_4.8.6.bb}    | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_4.8.4.bb => debianutils_4.8.6.bb} (86%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.8.4.bb b/meta/recipes-support/debianutils/debianutils_4.8.6.bb
similarity index 86%
rename from meta/recipes-support/debianutils/debianutils_4.8.4.bb
rename to meta/recipes-support/debianutils/debianutils_4.8.6.bb
index 300e6f1..c37e842 100644
--- a/meta/recipes-support/debianutils/debianutils_4.8.4.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.8.6.bb
@@ -3,15 +3,13 @@ SECTION = "base"
 LICENSE = "GPLv2 & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20180129T164727Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "http://snapshot.debian.org/archive/debian/20180626T205238Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
-SRC_URI[md5sum] = "a6dcd496b4f79b3c452c3a74c2d3f89c"
-SRC_URI[sha256sum] = "c061ab99aea61f892043b7624b021ab5b193e9c6bbfd474da0fbcdd506be1eb2"
-
-S = "${WORKDIR}/${BPN}"
+SRC_URI[md5sum] = "f0f1fa39383815fb7950dcee52be4361"
+SRC_URI[sha256sum] = "db09047144dadf6a35d0f28977fbef83b0dd60ca32e6c8512cce2444a6423f73"
 
 inherit autotools update-alternatives
 
-- 
2.7.4


