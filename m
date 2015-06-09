Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 445637589F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 14:52:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t59Eq12I012271
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jun 2015 07:52:01 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 07:52:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jun 2015 07:51:54 -0700
Message-ID: <b5e07c050aab935daf335f1f74a8d5a68cc4651a.1433842738.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433842738.git.liezhi.yang@windriver.com>
References: <cover.1433842738.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/12] libevdev: 1.3 -> 1.4.2
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
X-List-Received-Date: Tue, 09 Jun 2015 14:52:06 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{libevdev_1.3.bb => libevdev_1.4.2.bb}         |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.3.bb => libevdev_1.4.2.bb} (74%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.3.bb b/meta/recipes-support/libevdev/libevdev_1.4.2.bb
similarity index 74%
rename from meta/recipes-support/libevdev/libevdev_1.3.bb
rename to meta/recipes-support/libevdev/libevdev_1.4.2.bb
index 7206b30..f851305 100644
--- a/meta/recipes-support/libevdev/libevdev_1.3.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.4.2.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
                     file://libevdev/libevdev.h;endline=21;md5=7ff4f0b5113252c2f1a828e0bbad98d1"
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[md5sum] = "ab67de8f949e84ae2abb48af09eda423"
-SRC_URI[sha256sum] = "265411ce79a592b3074e9d07fb97d462745d0c7ef178254a6f720245ed253446"
+
+SRC_URI[md5sum] = "debfcd5153558eba25a8e71eb2534ae8"
+SRC_URI[sha256sum] = "7c77b213f075706d428a2af54b66bf86b03a68e9fb390e7ec48cf55065970643"
 
 inherit autotools pkgconfig
-- 
1.7.9.5


