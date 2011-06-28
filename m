Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbaIj-0001Ti-O0
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 17:34:09 +0200
Received: by wwi18 with SMTP id 18so289448wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 08:30:28 -0700 (PDT)
Received: by 10.227.96.140 with SMTP id h12mr6606431wbn.95.1309275028451;
	Tue, 28 Jun 2011 08:30:28 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id et5sm231677wbb.67.2011.06.28.08.30.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 08:30:27 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2011 17:30:23 +0200
Message-Id: <1309275023-2626-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] eglibc-locale: fix localedef packaging
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
X-List-Received-Date: Tue, 28 Jun 2011 15:34:09 -0000

the ${PN} still needs some checking, since it will now inheriting the default FILES_${PN}

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/eglibc/eglibc-locale.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index ed6c099..fdc4fb4 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -26,12 +26,12 @@ BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
 # set "0" for qemu emulation of native localedef for locale generation
 LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
 
-PR = "r0"
+PR = "r1"
 
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
-PACKAGES = "eglibc-locale localedef${PKGSUFFIX}"
+PACKAGES = "localedef${PKGSUFFIX} glibc-locale"
 
 PACKAGES_DYNAMIC = "locale-base-* \
                     eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* \
-- 
1.6.6.1



