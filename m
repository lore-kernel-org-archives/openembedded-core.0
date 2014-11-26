Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-04.prod.phx3.secureserver.net
	(p3plsmtpa07-04.prod.phx3.secureserver.net [173.201.192.233])
	by mail.openembedded.org (Postfix) with ESMTP id 8C56D7235D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 19:46:52 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-04.prod.phx3.secureserver.net with 
	id LKmr1p00Z0BVjqb01KmtSr; Wed, 26 Nov 2014 12:46:53 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Nov 2014 13:46:38 -0600
Message-Id: <ae898954fec807b75dc96083a3aff837476dbeba.1417030958.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1417030958.git.pab@pabigot.com>
References: <cover.1417030958.git.pab@pabigot.com>
In-Reply-To: <cover.1417030958.git.pab@pabigot.com>
References: <cover.1417030958.git.pab@pabigot.com>
Subject: [RFC v2 3/9] pulseaudio: select distro preference for bluez provider
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
X-List-Received-Date: Wed, 26 Nov 2014 19:47:02 -0000

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index db144a9..277b720 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -12,7 +12,7 @@ DEPENDS = "libatomics-ops liboil libsamplerate0 libsndfile1 libtool"
 DEPENDS += "udev alsa-lib glib-2.0 dbus gconf"
 DEPENDS += "json-c gdbm speex libxml-parser-perl-native libcap"
 
-inherit autotools pkgconfig useradd gettext perlnative
+inherit autotools pkgconfig useradd gettext perlnative bluetooth
 
 # *.desktop rules wont be generated during configure and build will fail
 # if using --disable-nls
@@ -31,7 +31,7 @@ EXTRA_OECONF = "\
                 ac_cv_header_valgrind_memcheck_h=no \
 "
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-- 
1.8.5.5


