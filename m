Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RT6km-00060A-G7
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 07:56:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAN6nmTU013596
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 22:49:48 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 22 Nov 2011 22:49:48 -0800
Message-ID: <0c281dce183f31c167b398a39c23e7e5fe1f3012.1322028165.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1322028165.git.xiaofeng.yan@windriver.com>
References: <cover.1322028165.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 23 Nov 2011 13:29:51 +0800
Date: Wed, 23 Nov 2011 14:47:56 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] gtk+: add demos to the configuation of gtk+
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Nov 2011 06:56:20 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add demos for checking whether gtk+ run over directfb successfully or not.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-gnome/gtk+/gtk+_2.24.6.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
index cd5c8cb..4ef0bc8 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
@@ -8,12 +8,15 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
            file://xsettings.patch \
            file://run-iconcache.patch \
            file://hardcoded_libtool.patch \
-           file://no-demos.patch \
+		   ${@base_contains('DISTRO_FEATURES', 'directfb', '','${NODEMOS_SRC_URI}', d)} \
            file://cellrenderer-cairo.patch;striplevel=0 \
            file://toggle-font.diff;striplevel=0 \
            file://0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch \
            file://doc-fixes.patch \
 	  "
+
+NODEMOS_SRC_URI = "file://no-demos.patch"
+
 # TO MERGE
 #           file://entry-cairo.patch;striplevel=0
 #           file://filesystem-volumes.patch
@@ -26,7 +29,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "421100f6597e613234f8dead6091a9fe"
 SRC_URI[sha256sum] = "6f45bdbf9ea27eb3b5f977d7ee2365dede0d0ce454985680c26e5210163bbf37"
-- 
1.7.0.4



