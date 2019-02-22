Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9EF847CB4E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 01:55:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1M1tC6I019914
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 17:55:43 -0800
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.435.0;
	Thu, 21 Feb 2019 17:55:17 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Feb 2019 09:55:15 +0800
Message-ID: <1550800515-3587-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH] debianutils: update to 4.8.6.1
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
X-List-Received-Date: Fri, 22 Feb 2019 01:55:52 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../debianutils/{debianutils_4.8.6.bb => debianutils_4.8.6.1.bb}  | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_4.8.6.bb => debianutils_4.8.6.1.bb} (86%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.8.6.bb b/meta/recipes-support/debianutils/debianutils_4.8.6.1.bb
similarity index 86%
rename from meta/recipes-support/debianutils/debianutils_4.8.6.bb
rename to meta/recipes-support/debianutils/debianutils_4.8.6.1.bb
index c37e842..7cc78a6 100644
--- a/meta/recipes-support/debianutils/debianutils_4.8.6.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.8.6.1.bb
@@ -3,13 +3,15 @@ SECTION = "base"
 LICENSE = "GPLv2 & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20180626T205238Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "http://snapshot.debian.org/archive/debian/20190217T160716Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
-SRC_URI[md5sum] = "f0f1fa39383815fb7950dcee52be4361"
-SRC_URI[sha256sum] = "db09047144dadf6a35d0f28977fbef83b0dd60ca32e6c8512cce2444a6423f73"
+SRC_URI[md5sum] = "80e2e670d8f6c0036770e971237f1f5c"
+SRC_URI[sha256sum] = "099f1e8a7278b26145a2ba2dda84c4118403bfab38c8d7070a6235a7ffcb55ed"
+
+S = "${WORKDIR}/${BPN}"
 
 inherit autotools update-alternatives
 
-- 
2.7.4


