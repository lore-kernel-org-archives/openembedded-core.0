Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1StyIT-0004b2-A3
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 11:54:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6P9gsjc023877
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Jul 2012 02:42:54 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Wed, 25 Jul 2012 02:42:53 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <saul.wold@intel.com>
Date: Wed, 25 Jul 2012 17:42:43 +0800
Message-ID: <14b9fa1f89320d93a474298b2f80200b07befe50.1343209283.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1343209283.git.kai.kang@windriver.com>
References: <cover.1343209283.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] qmmp: update 0.6.1
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
X-List-Received-Date: Wed, 25 Jul 2012 09:54:26 -0000
Content-Type: text/plain

Update qmmp to 0.6.1
Remove spaces at end of lines.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../qt-apps/{qmmp_0.5.2.bb => qmmp_0.6.1.bb}       |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-qt/qt-apps/{qmmp_0.5.2.bb => qmmp_0.6.1.bb} (90%)

diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb b/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb
similarity index 90%
rename from meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
rename to meta/recipes-qt/qt-apps/qmmp_0.6.1.bb
index 390a826..9522d88 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb
@@ -11,8 +11,8 @@ DEPENDS = "taglib libmad libvorbis libogg alsa-lib"
 
 SRC_URI = "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "20852f3cce3471bfc5affa9b2e947dc6"
-SRC_URI[sha256sum] = "6391dec020d2a381d7f4b7890fae6c49eadf88b3c9aef571fe3c5e96140822ec"
+SRC_URI[md5sum] = "23a1a3aa924da901ebc8327ea76135d4"
+SRC_URI[sha256sum] = "b48be8c0e3882088919a77ce7b619cfc99d32af29cc688ba8749a58cbb25fb6f"
 
 
 inherit qmake2 cmake qt4x11
@@ -37,11 +37,11 @@ python populate_packages_prepend () {
     for plug_dir in plug_dirs:
         g_plug_dir = os.path.join(qmmp_libdir,plug_dir)
         do_split_packages(d, g_plug_dir, '^lib(.*)\.so$', 'qmmp-plugin-' + plug_dir.lower() + '-%s', 'Qmmp' + plug_dir  + 'plugin for %s')
-} 
+}
 
 FILES_${PN} = "\
                 ${bindir}/qmmp \
-                ${libdir}/lib*${SOLIBS} \ 
+                ${libdir}/lib*${SOLIBS} \
                 ${datadir}/icons/* \
                 ${datadir}/qmmp/images/* \
                 ${datadir}/applications/* \
-- 
1.7.5.4



