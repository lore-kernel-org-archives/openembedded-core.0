Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SWnZ2-0006nZ-Ka
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 13:47:44 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 13:37:26 +0200
Message-Id: <1337686647-1027-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1337686647-1027-1-git-send-email-obi@opendreambox.org>
References: <1337686647-1027-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/2] qt4.inc: package keyboard drivers
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
X-List-Received-Date: Tue, 22 May 2012 11:47:44 -0000

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
index c70b335..3a30942 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -328,6 +328,7 @@ python populate_packages_prepend() {
         qtopia_split('designer',      'designer',      '^lib(.*)\.so$')
         qtopia_split('gfxdrivers',    'gfxdriver',     '^libq(.*)\.so$')
         qtopia_split('graphicssystems','graphicssystems', '^libq(.*)\.so$')
+        qtopia_split('kbddrivers',    'kbddriver',     '^libq(.*)kbddriver\.so$')
         qtopia_split('mousedrivers',  'mousedriver',   '^libq(.*)mousedriver\.so$')
         qtopia_split('iconengines',   'iconengine',    '^libq(.*)\.so$')
         qtopia_split('imageformats',  'imageformat',   '^libq(.*)\.so$')
-- 
1.7.9.5



