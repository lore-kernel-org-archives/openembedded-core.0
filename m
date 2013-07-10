Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F9BC60780
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 09:56:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6A9u8p2024598
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 02:56:08 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 10 Jul 2013 02:56:08 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jul 2013 05:56:05 -0400
Message-ID: <1373450165-15022-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] matchbox-wm: correct the SRC_URI and add checksums
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
X-List-Received-Date: Wed, 10 Jul 2013 09:56:08 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../matchbox-wm/matchbox-wm_1.2.bb                 |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
index 2628326..bc43167 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
@@ -2,13 +2,16 @@ SECTION = "x11/wm"
 DESCRIPTION = "Matchbox window manager"
 LICENSE = "GPLv2.0+"
 DEPENDS = "libmatchbox virtual/libx11 libxext libxcomposite libxfixes xdamage libxrender startup-notification expat"
-PR = "r5"
+PR = "r6"
 
-SRC_URI = "http://matchbox-project.org/sources/matchbox-window-manager/1.2/matchbox-window-manager-${PV}.tar.bz2 \
+SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/matchbox-window-manager/${PV}/matchbox-window-manager-${PV}.tar.bz2 \
            file://configure_fix.patch \
            file://kbdconfig \
            file://gconf-2.m4"
 
+SRC_URI[md5sum] = "3e158dcf57823b55c926d95b245500fb"
+SRC_URI[sha256sum] = "81a23a4af797cf350759fd5ac738797015a66dd5dba2f3d9f3c6908506c1ceff"
+
 S = "${WORKDIR}/matchbox-window-manager-${PV}"
 
 inherit autotools pkgconfig
-- 
1.7.9.5


