Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 561FC756D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 09:57:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t4S9vSJK007546
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 02:57:28 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 02:57:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 May 2015 02:57:19 -0700
Message-ID: <c48b06eaca40d1282e38a7b9c15223346e403dae.1432805258.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1432805258.git.liezhi.yang@windriver.com>
References: <cover.1432805258.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/9] debianutils: 4.4 -> 4.5
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
X-List-Received-Date: Thu, 28 May 2015 09:57:28 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{debianutils_4.4.bb => debianutils_4.5.bb}     |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_4.4.bb => debianutils_4.5.bb} (84%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.4.bb b/meta/recipes-support/debianutils/debianutils_4.5.bb
similarity index 84%
rename from meta/recipes-support/debianutils/debianutils_4.4.bb
rename to meta/recipes-support/debianutils/debianutils_4.5.bb
index 346eaf1..3593cdb 100644
--- a/meta/recipes-support/debianutils/debianutils_4.4.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.5.bb
@@ -3,9 +3,9 @@ SECTION = "base"
 LICENSE = "GPLv2 & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.gz"
-SRC_URI[md5sum] = "c0cb076754d7f4eb1e3397d00916647f"
-SRC_URI[sha256sum] = "190850cdd6b5302e0a1ba1aaed1bc7074d67d3bd8d04c613f242f7145afa53a6"
+SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI[md5sum] = "43796250e927db531cdebe80c6b925ea"
+SRC_URI[sha256sum] = "7cfaa53caaaaf36dad16fa69b30dd2b78b8dafebd766aacd53a3c7c78a9d441f"
 
 inherit autotools update-alternatives
 
-- 
1.7.9.5


