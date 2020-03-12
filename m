Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A0A361B88
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 03:21:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02C3LOXC003463
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 20:21:35 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.487.0; Wed, 11 Mar 2020 20:21:14 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Mar 2020 11:21:12 +0800
Message-ID: <1583983272-116095-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] netbase: use snapshot.debian.org
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
X-List-Received-Date: Thu, 12 Mar 2020 03:21:44 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Use snapshot.debian.org as the previous URL only
stores the latest source file and fails to locate
the source tar file if we don't upgrade timely.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-core/netbase/netbase_6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/netbase/netbase_6.1.bb b/meta/recipes-core/netbase/netbase_6.1.bb
index bc0049c..57faf3d 100644
--- a/meta/recipes-core/netbase/netbase_6.1.bb
+++ b/meta/recipes-core/netbase/netbase_6.1.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
 PE = "1"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "http://snapshot.debian.org/archive/debian/20200311T090704Z/pool/main/n/${BPN}/${BPN}_${PV}.tar.xz"
 
 SRC_URI[md5sum] = "e5871a3a5c8390557b8033cf19316a55"
 SRC_URI[sha256sum] = "084d743bd84d4d9380bac4c71c51e57406dce44f5a69289bb823c903e9b035d8"
-- 
2.7.4


