Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 601C9756F0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 14:48:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t52EmtjK010807
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jun 2015 07:48:56 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Jun 2015 07:48:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jun 2015 07:48:51 -0700
Message-ID: <cffbf6a3dac2f6d7ba04b59ebc822b084f981730.1433256486.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433256486.git.liezhi.yang@windriver.com>
References: <cover.1433256486.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] debianutils: 4.5 -> 4.5.1
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
X-List-Received-Date: Tue, 02 Jun 2015 14:48:57 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{debianutils_4.5.bb => debianutils_4.5.1.bb}   |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_4.5.bb => debianutils_4.5.1.bb} (87%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.5.bb b/meta/recipes-support/debianutils/debianutils_4.5.1.bb
similarity index 87%
rename from meta/recipes-support/debianutils/debianutils_4.5.bb
rename to meta/recipes-support/debianutils/debianutils_4.5.1.bb
index 3593cdb..9e5dd70 100644
--- a/meta/recipes-support/debianutils/debianutils_4.5.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.5.1.bb
@@ -4,8 +4,11 @@ LICENSE = "GPLv2 & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz"
-SRC_URI[md5sum] = "43796250e927db531cdebe80c6b925ea"
-SRC_URI[sha256sum] = "7cfaa53caaaaf36dad16fa69b30dd2b78b8dafebd766aacd53a3c7c78a9d441f"
+
+SRC_URI[md5sum] = "487524518cd5833a6a4f7007b5d1bd5b"
+SRC_URI[sha256sum] = "a531c23e0105fe01cfa928457a8343a1e947e2621b3cd4d05f4e9656020c63b7"
+
+S = "${WORKDIR}/${BPN}"
 
 inherit autotools update-alternatives
 
-- 
1.7.9.5


