Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 12F6A6076F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:17:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBL6HDQb008380
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 22:17:14 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Dec 2016 22:17:13 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Dec 2016 22:17:08 -0800
Message-ID: <a6ce13f44ad9c2d5c51540be2fbd37c35e325517.1482300982.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1482300982.git.liezhi.yang@windriver.com>
References: <cover.1482300982.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] debianutils: 4.8 -> 4.8.1
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
X-List-Received-Date: Wed, 21 Dec 2016 06:17:13 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../debianutils/{debianutils_4.8.bb => debianutils_4.8.1.bb}       | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_4.8.bb => debianutils_4.8.1.bb} (86%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.8.bb b/meta/recipes-support/debianutils/debianutils_4.8.1.bb
similarity index 86%
rename from meta/recipes-support/debianutils/debianutils_4.8.bb
rename to meta/recipes-support/debianutils/debianutils_4.8.1.bb
index d969fd3c9af..54c74e097c0 100644
--- a/meta/recipes-support/debianutils/debianutils_4.8.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.8.1.bb
@@ -3,13 +3,14 @@ SECTION = "base"
 LICENSE = "GPLv2 & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160629T224408Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "http://snapshot.debian.org/archive/debian/20161118T033019Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
-SRC_URI[md5sum] = "66a37e5ff17be431319bd0b43e9a46b5"
-SRC_URI[sha256sum] = "afa95bbe6b6fd3ef3c0c838b2d7232f09fabeff593ca4b5583cffa6748567ee2"
+
+SRC_URI[md5sum] = "44083fc66164746880dffd30d62d054b"
+SRC_URI[sha256sum] = "2c395c0bdcfe89de30828b1d25cc5549ded5225a6d3625fbcb2cc0881ef5f026"
 
 inherit autotools update-alternatives
 
-- 
2.11.0.rc2.dirty


