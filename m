Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8864160214
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 09:24:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 02G9OFv8025910
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 02:24:15 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.487.0; Mon, 16 Mar 2020 02:24:14 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Mar 2020 17:24:13 +0800
Message-ID: <1584350653-141457-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] netbase: use git fetcher
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
X-List-Received-Date: Mon, 16 Mar 2020 09:24:14 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Use git repo as the the previous URL only stores
the latest source file and fails to locate the
source tar file if we don't upgrade timely.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-core/netbase/netbase_6.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/netbase/netbase_6.1.bb b/meta/recipes-core/netbase/netbase_6.1.bb
index bc0049c..c13685e 100644
--- a/meta/recipes-core/netbase/netbase_6.1.bb
+++ b/meta/recipes-core/netbase/netbase_6.1.bb
@@ -6,10 +6,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
 PE = "1"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "git://salsa.debian.org/md/netbase.git;protocol=https"
+SRCREV = "0fc1e4ce39328f7388badace0aaf7b7294d5ed61"
 
-SRC_URI[md5sum] = "e5871a3a5c8390557b8033cf19316a55"
-SRC_URI[sha256sum] = "084d743bd84d4d9380bac4c71c51e57406dce44f5a69289bb823c903e9b035d8"
+S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 do_install () {
-- 
2.7.4


