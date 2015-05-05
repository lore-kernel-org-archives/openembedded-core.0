Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id D413071144
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 14:14:44 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2; Tue, 5 May 2015
	16:14:39 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 6A11128BA1D;
	Tue,  5 May 2015 16:14:39 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 May 2015 16:14:37 +0200
Message-ID: <1430835277-21526-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] serf: update SRC_URI to use debian mirrors instead of googlecode
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
X-List-Received-Date: Tue, 05 May 2015 14:14:47 -0000
Content-Type: text/plain

Update SRC_URI to use debian mirrors as googlecode will be closed
in near future. Also added a summary to the recipe.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-support/serf/serf_1.3.8.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/serf/serf_1.3.8.bb b/meta/recipes-support/serf/serf_1.3.8.bb
index aa7918b..b5059d5 100644
--- a/meta/recipes-support/serf/serf_1.3.8.bb
+++ b/meta/recipes-support/serf/serf_1.3.8.bb
@@ -1,10 +1,10 @@
-
-SRC_URI = "http://serf.googlecode.com/svn/src_releases/serf-${PV}.tar.bz2 \
+SUMMARY = "High-Performance Asynchronous HTTP Client Library"
+SRC_URI = "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://norpath.patch \
            file://env.patch"
 
-SRC_URI[md5sum] = "2e4efe57ff28cb3202a112e90f0c2889"
-SRC_URI[sha256sum] = "e0500be065dbbce490449837bb2ab624e46d64fc0b090474d9acaa87c82b2590"
+SRC_URI[md5sum] = "713beaf05d7f3329de121e218e2fcb93"
+SRC_URI[sha256sum] = "77134cd5010664ca023585bce50978bd4005906ed280ff889f591f86df7c59e4"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-- 
1.9.1


