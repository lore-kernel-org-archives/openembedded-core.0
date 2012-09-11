Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TBSLc-0000OW-V8
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 17:25:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8BFDP6O003764
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 08:13:25 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 11 Sep 2012 08:13:24 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Sep 2012 23:13:22 +0800
Message-ID: <7b84cadc9083744019230f510e46b7e4afcc17ce.1347355729.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1347355729.git.jackie.huang@windriver.com>
References: <cover.1347355729.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libgnome-keyring: add missing DEPENDS on intltool-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 15:25:57 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

libgnome-keyring requires command 'intltoolize' in configure,
so add DEPENDS intltool-native.

[YOCTO #3081]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb b/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
index cf18732..8ed44f3 100644
--- a/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
+++ b/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
@@ -9,11 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0914b9d3ebaba41ef2e3e0ae16f296cf \
                     file://egg/egg-dh.h;endline=22;md5=1626c16af2a8da1f88324cf3ced33f08"
 
 SECTION = "x11/gnome/libs"
-PR = "r2"
+PR = "r3"
 
 inherit gnome gtk-doc
 
-DEPENDS = "dbus libgcrypt glib-2.0"
+DEPENDS = "dbus libgcrypt glib-2.0 intltool-native"
 
 SRC_URI[archive.md5sum] = "c42b2ca66204835d901d3dbfc1fa5ae6"
 SRC_URI[archive.sha256sum] = "56388c0d81ddfdb57d30e4963c83ecc1c18498aab99395420e0fff69929a0f0c"
-- 
1.7.4



