Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S65Sk-0007jH-Ga
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 20:26:50 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2012 18:00:38 +0100
Message-Id: <1331312438-4582-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] util-linux: explicitly disable udev
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
X-List-Received-Date: Fri, 09 Mar 2012 19:26:50 -0000

* util-linux auto-detects libudev for lsblk, so
  disable it, because it's not listed in DEPENDS.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-core/util-linux/util-linux.inc     |    2 +-
 meta/recipes-core/util-linux/util-linux_2.21.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1a3d293..e2d354f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -38,7 +38,7 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
                 --enable-kill --enable-last --enable-mesg --enable-partx \
                 --enable-raw --enable-rdev --enable-reset --disable-login-utils \
                 --enable-write --enable-arch --enable-mount --with-fsprobe=builtin \
-                --enable-libuuid --enable-libblkid --enable-fsck"
+                --enable-libuuid --enable-libblkid --enable-fsck --without-udev"
 
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
diff --git a/meta/recipes-core/util-linux/util-linux_2.21.bb b/meta/recipes-core/util-linux/util-linux_2.21.bb
index 744dbaf..bcf92e0 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.21.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.21"
-PR = "r2"
+PR = "r3"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.5.4



