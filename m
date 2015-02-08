Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-07.prod.phx3.secureserver.net
	(p3plsmtpa07-07.prod.phx3.secureserver.net [173.201.192.236])
	by mail.openembedded.org (Postfix) with ESMTP id 9A35860089
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 18:42:52 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-07.prod.phx3.secureserver.net with 
	id puin1p00C0BVjqb01uitVv; Sun, 08 Feb 2015 11:42:54 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Feb 2015 12:42:16 -0600
Message-Id: <de642cc54c8931ec0e5ad32e604be3d3c629d1ff.1423420390.git.pab@pabigot.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1423420390.git.pab@pabigot.com>
References: <cover.1423420390.git.pab@pabigot.com>
In-Reply-To: <cover.1423420390.git.pab@pabigot.com>
References: <cover.1423420390.git.pab@pabigot.com>
Subject: [PATCHv3 04/10] pulseaudio: select distro preference for bluez provider
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
X-List-Received-Date: Sun, 08 Feb 2015 18:42:58 -0000

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 99cad76..b73576e 100644
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
1.9.1


