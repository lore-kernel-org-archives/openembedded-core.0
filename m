Return-Path: <huangqy.fnst@cn.fujitsu.com>
X-Greylist: delayed 635 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 31 Jul 2017 01:52:06 UTC
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 3114E7836E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 01:52:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,367,1444665600"; 
   d="scan'208";a="1495066"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by song.cn.fujitsu.com with ESMTP; 31 Jul 2017 09:42:11 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 1154E46BA941
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 09:42:08 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 31 Jul 2017 09:42:09 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 31 Jul 2017 09:41:50 +0800
Message-ID: <1501465310-786-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 1154E46BA941.A3AAD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] gtk-icon-utils-native: 3.22.16 -> 3.22.17
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
X-List-Received-Date: Mon, 31 Jul 2017 01:52:08 -0000
Content-Type: text/plain

Update gtk-icon-utils-native from 3.22.16 to 3.22.17.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 ...-icon-utils-native_3.22.16.bb => gtk-icon-utils-native_3.22.17.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.16.bb => gtk-icon-utils-native_3.22.17.bb} (94%)

diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.16.bb b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.17.bb
similarity index 94%
rename from meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.16.bb
rename to meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.17.bb
index adfb928..032d82d 100644
--- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.16.bb
+++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.17.bb
@@ -10,8 +10,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
           file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
-SRC_URI[md5sum] = "71820863d5479e2c4a5b78f3164d5f15"
-SRC_URI[sha256sum] = "3e0c3ad01f3c8c5c9b1cc1ae00852bd55164c8e5a9c1f90ba5e07f14f175fe2c"
+SRC_URI[md5sum] = "29f85430cf7cfa8ca8d0703ba65dbe11"
+SRC_URI[sha256sum] = "a6c1fb8f229c626a3d9c0e1ce6ea138de7f64a5a6bc799d45fa286fe461c3437"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-- 
2.7.4




