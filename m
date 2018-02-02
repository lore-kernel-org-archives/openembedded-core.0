Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1537278869
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 02:18:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w122IBFK004975
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Feb 2018 18:18:12 -0800
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 1 Feb 2018 18:18:10 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Feb 2018 10:16:08 +0800
Message-ID: <1517537774-12847-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517537774-12847-1-git-send-email-yi.zhao@windriver.com>
References: <1517537774-12847-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH 1/7] debianutils: update to 4.8.4
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
X-List-Received-Date: Fri, 02 Feb 2018 02:18:11 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../debianutils/{debianutils_4.8.1.1.bb => debianutils_4.8.4.bb}  | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_4.8.1.1.bb => debianutils_4.8.4.bb} (86%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.8.1.1.bb b/meta/recipes-support/debianutils/debianutils_4.8.4.bb
similarity index 86%
rename from meta/recipes-support/debianutils/debianutils_4.8.1.1.bb
rename to meta/recipes-support/debianutils/debianutils_4.8.4.bb
index 1857d4b..300e6f1 100644
--- a/meta/recipes-support/debianutils/debianutils_4.8.1.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.8.4.bb
@@ -3,13 +3,15 @@ SECTION = "base"
 LICENSE = "GPLv2 & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20170402T211732Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "http://snapshot.debian.org/archive/debian/20180129T164727Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
-SRC_URI[md5sum] = "ee5fcecaab071bd0c93e8a0cee65d6c4"
-SRC_URI[sha256sum] = "06446cd4c0d309fd31a0682c5c2f07f7613fb867f769414b9cc51f155ad73172"
+SRC_URI[md5sum] = "a6dcd496b4f79b3c452c3a74c2d3f89c"
+SRC_URI[sha256sum] = "c061ab99aea61f892043b7624b021ab5b193e9c6bbfd474da0fbcdd506be1eb2"
+
+S = "${WORKDIR}/${BPN}"
 
 inherit autotools update-alternatives
 
-- 
2.7.4


