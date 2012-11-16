Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gilbert_coville@mentor.com>) id 1TZVLT-0006Jk-O5
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Nov 2012 00:29:14 +0100
Received: from ghc.alm.mentorg.com ([134.86.96.237])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id qAGNC5gE019554;
	Fri, 16 Nov 2012 17:12:05 -0600
From: Gilbert Coville <gilbert_coville@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2012 17:11:02 -0600
Message-Id: <1353107462-28762-1-git-send-email-gilbert_coville@mentor.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH] pulseaudio: explicitly disable xen, rather than letting it detect
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
X-List-Received-Date: Fri, 16 Nov 2012 23:29:16 -0000

Signed-off-by: Gilbert Coville <gilbert_coville@mentor.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc    | 1 +
 meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 1708db7..5db430b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -38,6 +38,7 @@ EXTRA_OECONF = "\
 		--enable-tcpwrap=no \
 		--with-access-group=audio \
 		--disable-openssl \
+		--disable-xen \
 "
 
 PARALLEL_MAKE = ""
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index 546a80f..2468495 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r11"
+PR = "r12"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.8.0



