Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LEI-0000rV-TN
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:41:15 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 17:32:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139657325"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2012 17:32:28 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:06 +0800
Message-Id: <924cdfe1a0069ff53526afe67b11cbd9405472de.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 09/60] alsa-utils: upgrade to 1.0.25
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
X-List-Received-Date: Fri, 16 Mar 2012 00:41:15 -0000

The license change is because:

--- alsa-utils-1.0.25/COPYING   2012-01-25 17:43:38.000000000 +0800
+++ alsa-utils-1.0.24.2/COPYING 2011-01-31 22:19:55.000000000 +0800
@@ -2,7 +2,7 @@
                       Version 2, June 1991

  Copyright (C) 1989, 1991 Free Software Foundation, Inc.
-     51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+                       59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  Everyone is permitted to copy and distribute verbatim copies
  of this license document, but changing it is not allowed.

@@ -305,7 +305,7 @@

     You should have received a copy of the GNU General Public License
     along with this program; if not, write to the Free Software
-    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

 Also add information on how to contact you by electronic and paper mail.
@@ -313,7 +313,7 @@
 If the program is interactive, make it output a short notice like this
 when it starts in an interactive mode:

-    Gnomovision version 69, Copyright (C) year  name of author
+    Gnomovision version 69, Copyright (C) year name of author
     Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
     This is free software, and you are welcome to redistribute it
     under certain conditions; type `show c' for details.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 ...-t-let-systemd-unit-restore-the-volume-wh.patch |   27 +++++++++-----------
 .../ncursesfix.patch                               |    0
 .../uclibc-exp10-replacement.patch                 |    0
 ...alsa-utils_1.0.24.2.bb => alsa-utils_1.0.25.bb} |    8 +++---
 4 files changed, 16 insertions(+), 19 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.24.2 => alsa-utils-1.0.25}/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch (57%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.24.2 => alsa-utils-1.0.25}/ncursesfix.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.24.2 => alsa-utils-1.0.25}/uclibc-exp10-replacement.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.0.24.2.bb => alsa-utils_1.0.25.bb} (93%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch b/meta/recipes-multimedia/alsa/alsa-utils-1.0.25/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
similarity index 57%
rename from meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
rename to meta/recipes-multimedia/alsa/alsa-utils-1.0.25/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
index 55e180a..48e35eb 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
+++ b/meta/recipes-multimedia/alsa/alsa-utils-1.0.25/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] alsactl: don't let systemd unit restore the volume when asound.
 This avoids an error on bootup
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+Signed-off-by: Shane Wang <shane.wang@intel.com>
 ---
 
 Filed as https://bugtrack.alsa-project.org/alsa-bug/view.php?id=5459
@@ -16,24 +17,23 @@ Upstream-Status: Pending
  alsactl/alsa-restore.service.in |    1 +
  2 files changed, 2 insertions(+), 1 deletions(-)
 
-diff --git a/alsactl/Makefile.am b/alsactl/Makefile.am
-index 5cfc415..c3768c4 100644
---- a/alsactl/Makefile.am
-+++ b/alsactl/Makefile.am
-@@ -34,7 +34,7 @@ install-data-hook:
+diff -r 6f4209c9b022 alsactl/Makefile.am
+--- a/alsactl/Makefile.am	Wed Mar 14 12:30:42 2012 +0800
++++ b/alsactl/Makefile.am	Wed Mar 14 12:33:27 2012 +0800
+@@ -34,7 +34,8 @@
  endif
  
  edit = \
--	sed $(SED) -r 's,@sbindir\@,$(sbindir),g' < $< > $@ || rm $@
-+	sed $(SED) -e 's,@localstatedir\@,$(localstatedir),g' -e 's,@sbindir\@,$(sbindir),g' < $< > $@ || rm $@
+-	$(SED) -r 's,@sbindir\@,$(sbindir),g' < $< > $@ || rm $@
++	$(SED) -e 's,@localstatedir\@,$(localstatedir),g' -e 's,@sbindir\@,$(sbindir),g' < $< > $@ || rm $@
++
  
  alsa-store.service: alsa-store.service.in
  	$(edit)
-diff --git a/alsactl/alsa-restore.service.in b/alsactl/alsa-restore.service.in
-index e97d196..3b76710 100644
---- a/alsactl/alsa-restore.service.in
-+++ b/alsactl/alsa-restore.service.in
-@@ -4,6 +4,7 @@ DefaultDependencies=no
+diff -r 6f4209c9b022 alsactl/alsa-restore.service.in
+--- a/alsactl/alsa-restore.service.in	Wed Mar 14 12:30:42 2012 +0800
++++ b/alsactl/alsa-restore.service.in	Wed Mar 14 12:33:27 2012 +0800
+@@ -4,6 +4,7 @@
  After=sysinit.target
  Before=shutdown.target
  Conflicts=shutdown.target
@@ -41,6 +41,3 @@ index e97d196..3b76710 100644
  
  [Service]
  Type=oneshot
--- 
-1.6.6.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/ncursesfix.patch b/meta/recipes-multimedia/alsa/alsa-utils-1.0.25/ncursesfix.patch
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/ncursesfix.patch
rename to meta/recipes-multimedia/alsa/alsa-utils-1.0.25/ncursesfix.patch
diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/uclibc-exp10-replacement.patch b/meta/recipes-multimedia/alsa/alsa-utils-1.0.25/uclibc-exp10-replacement.patch
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/uclibc-exp10-replacement.patch
rename to meta/recipes-multimedia/alsa/alsa-utils-1.0.25/uclibc-exp10-replacement.patch
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
similarity index 93%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
index e62a0f3..e8ebef1 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
 SECTION = "console/utils"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
 DEPENDS = "alsa-lib ncurses libsamplerate0"
-PR = "r5"
+PR = "r0"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://ncursesfix.patch \
@@ -14,8 +14,8 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
           "
 
-SRC_URI[md5sum] = "8238cd57cb301d1c36bcf0ecb59ce6b2"
-SRC_URI[sha256sum] = "95127f740291086486c06c28118cabca0814bde48fd14dac041a9812a5ac1be2"
+SRC_URI[md5sum] = "f81f9dcb9a014fd32cb3a70066a5b9a9"
+SRC_URI[sha256sum] = "2e676a2f634bbfe279b260e10a96f617cb72ee63c5bbf6c5f96bb615705b302c"
 
 # lazy hack. needs proper fixing in gettext.m4, see
 # http://bugs.openembedded.org/show_bug.cgi?id=2348
-- 
1.7.6



