Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q4uqv-0007t5-6a
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Mar 2011 14:50:25 +0200
Received: by wwb17 with SMTP id 17so1275409wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2011 05:48:26 -0700 (PDT)
Received: by 10.227.178.14 with SMTP id bk14mr1198416wbb.102.1301489305958;
	Wed, 30 Mar 2011 05:48:25 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id x1sm36764wbh.2.2011.03.30.05.48.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2011 05:48:25 -0700 (PDT)
From: koen@dominion.thruhere.net
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Mar 2011 14:48:20 +0200
Message-Id: <1301489300-9174-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] qemu: there is no glflags.patch in the repo, so remove it from SRC_URI
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
X-List-Received-Date: Wed, 30 Mar 2011 12:50:25 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Probably not the best solution, but I couldn't locate a matching glflags.patch

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-devtools/qemu/qemu.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f41b49c..83d7407 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,7 +31,6 @@ do_configure() {
     chmod a+x ${S}/target-i386/beginend_funcs.sh
 }
 
-SRC_URI_append_virtclass-nativesdk = " file://glflags.patch;patch=1"
 DEPENDS_virtclass-nativesdk = "zlib-nativesdk libsdl-nativesdk qemugl-nativesdk"
 RDEPENDS_virtclass-nativesdk = "libsdl-nativesdk"
 EXTRA_OECONF_virtclass-nativesdk = "--target-list=arm-linux-user,arm-softmmu,i386-softmmu,x86_64-softmmu,mips-linux-user,mipsel-linux-user,mips-softmmu,ppc-softmmu --disable-vnc-tls --cross-prefix=${TARGET_PREFIX}"
-- 
1.6.6.1



