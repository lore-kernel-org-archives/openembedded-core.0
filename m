Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 861BA6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 01:37:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u671b78v019725
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2016 18:37:08 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Jul 2016 18:37:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jul 2016 18:37:00 -0700
Message-ID: <2d4975261413028d03c6ef5ef93ba91242ba5b8a.1467855356.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1467855356.git.liezhi.yang@windriver.com>
References: <cover.1467855356.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] debianutils: 4.7 -> 4.8
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
X-List-Received-Date: Thu, 07 Jul 2016 01:37:07 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../debianutils/{debianutils_4.7.bb => debianutils_4.8.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_4.7.bb => debianutils_4.8.bb} (86%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.7.bb b/meta/recipes-support/debianutils/debianutils_4.8.bb
similarity index 86%
rename from meta/recipes-support/debianutils/debianutils_4.7.bb
rename to meta/recipes-support/debianutils/debianutils_4.8.bb
index 6a1d5bf..d969fd3 100644
--- a/meta/recipes-support/debianutils/debianutils_4.7.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.8.bb
@@ -3,13 +3,13 @@ SECTION = "base"
 LICENSE = "GPLv2 & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160204T040501Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "http://snapshot.debian.org/archive/debian/20160629T224408Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
-SRC_URI[md5sum] = "00186f527b35e2cecd4db593c6d512d0"
-SRC_URI[sha256sum] = "a269cacd40f52f2fa5d5636357714a49e8538459c16d77772efaa23711fe53d9"
+SRC_URI[md5sum] = "66a37e5ff17be431319bd0b43e9a46b5"
+SRC_URI[sha256sum] = "afa95bbe6b6fd3ef3c0c838b2d7232f09fabeff593ca4b5583cffa6748567ee2"
 
 inherit autotools update-alternatives
 
-- 
2.9.0


