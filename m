Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21C97607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 00:54:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAE0s3OO027253
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 16:54:03 -0800 (PST)
Received: from pek-lpg-core1.windriver.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 16:54:01 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 01:58:42 +0800
Message-ID: <5a5cb4d84589268dcb65daa80ee86ba3094f777d.1510595883.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510595883.git.liezhi.yang@windriver.com>
References: <cover.1510595883.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] debianutils: 4.8.1.1 -> 4.8.3
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
X-List-Received-Date: Tue, 14 Nov 2017 00:54:02 -0000
Content-Type: text/plain

Update LIC_FILES_CHKSUM because it changed http:// to https://.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../debianutils/{debianutils_4.8.1.1.bb => debianutils_4.8.3.bb}  | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_4.8.1.1.bb => debianutils_4.8.3.bb} (87%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.8.1.1.bb b/meta/recipes-support/debianutils/debianutils_4.8.3.bb
similarity index 87%
rename from meta/recipes-support/debianutils/debianutils_4.8.1.1.bb
rename to meta/recipes-support/debianutils/debianutils_4.8.3.bb
index 1857d4b..3b51e30 100644
--- a/meta/recipes-support/debianutils/debianutils_4.8.1.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.8.3.bb
@@ -3,13 +3,15 @@ SECTION = "base"
 LICENSE = "GPLv2 & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20170402T211732Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz"
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
-SRC_URI[md5sum] = "ee5fcecaab071bd0c93e8a0cee65d6c4"
-SRC_URI[sha256sum] = "06446cd4c0d309fd31a0682c5c2f07f7613fb867f769414b9cc51f155ad73172"
+S = "${WORKDIR}/${BPN}"
+
+SRC_URI[md5sum] = "f09fb52093f799c72de04a7ede1b7411"
+SRC_URI[sha256sum] = "7102246d1c35260ed7f0458a9886acf655c379d14908415574494cdea45e28fb"
 
 inherit autotools update-alternatives
 
-- 
2.7.4


