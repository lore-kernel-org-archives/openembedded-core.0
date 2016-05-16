Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 788A5731C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 01:42:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4G1gNFN010756
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2016 18:42:23 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 15 May 2016 18:42:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 15 May 2016 18:42:21 -0700
Message-ID: <025e05d0f0f9b84ee1695bb1648ce78acdaa276b.1463362879.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1463362879.git.liezhi.yang@windriver.com>
References: <cover.1463362879.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] eudev: remove eudev-hwdb from RRECOMMENDS_eudev
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
X-List-Received-Date: Mon, 16 May 2016 01:42:23 -0000
Content-Type: text/plain

The eudev-hwdb needs 12M after install, this made small images like
core-image-minimal much biggher than before, and may also hurt the
devices which use udev, so remove it RRECOMMENDS_eudev by default.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/udev/eudev_3.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/eudev_3.1.5.bb b/meta/recipes-core/udev/eudev_3.1.5.bb
index e42630f..60f4a85 100644
--- a/meta/recipes-core/udev/eudev_3.1.5.bb
+++ b/meta/recipes-core/udev/eudev_3.1.5.bb
@@ -86,7 +86,7 @@ FILES_eudev-hwdb = "${sysconfdir}/udev/hwdb.d"
 
 RDEPENDS_eudev-hwdb += "eudev"
 
-RRECOMMENDS_${PN} += "udev-cache eudev-hwdb"
+RRECOMMENDS_${PN} += "udev-cache"
 
 RPROVIDES_${PN} = "hotplug udev"
 
-- 
2.7.4


