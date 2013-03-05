Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UCwIg-0007Ux-F3
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 19:09:34 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2013 18:45:42 +0100
Message-Id: <1362505542-25853-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] qt4.inc: package keyboard drivers
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
X-List-Received-Date: Tue, 05 Mar 2013 18:09:35 -0000

* Fixes the following packaging error, if compiled with
  -plugin-kbd-linuxinput:

| WARNING: For recipe qt4-embedded, the following files/directories were installed but not shipped in any package:
| WARNING:   /usr/lib/qtopia/plugins/kbddrivers/.debug
| WARNING:   /usr/lib/qtopia/plugins/kbddrivers/.debug/libqlinuxinputkbddriver.so

* No PR bump, because -plugin-kbd-linuxinput is not enabled
  by default.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-qt/qt4/qt4.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index ab1581e..35e3003 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -314,6 +314,7 @@ python populate_packages_prepend() {
     qtopia_split('designer',      'designer',      '^lib(.*)\.so$')
     qtopia_split('gfxdrivers',    'gfxdriver',     '^libq(.*)\.so$')
     qtopia_split('graphicssystems','graphicssystems', '^libq(.*)\.so$')
+    qtopia_split('kbddrivers',    'kbddriver',     '^libq(.*)kbddriver\.so$')
     qtopia_split('mousedrivers',  'mousedriver',   '^libq(.*)mousedriver\.so$')
     qtopia_split('iconengines',   'iconengine',    '^libq(.*)\.so$')
     qtopia_split('imageformats',  'imageformat',   '^libq(.*)\.so$')
-- 
1.7.10.4



