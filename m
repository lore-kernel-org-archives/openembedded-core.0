Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qbf0T-0000Nb-Ak
	for openembedded-core@lists.linuxtogo.org;
	Tue, 28 Jun 2011 22:35:37 +0200
Received: by wyg30 with SMTP id 30so480792wyg.6
	for <openembedded-core@lists.linuxtogo.org>;
	Tue, 28 Jun 2011 13:31:56 -0700 (PDT)
Received: by 10.216.64.15 with SMTP id b15mr1033522wed.9.1309293115883;
	Tue, 28 Jun 2011 13:31:55 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n18sm421210wbh.6.2011.06.28.13.31.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 13:31:55 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.linuxtogo.org
Date: Tue, 28 Jun 2011 22:31:50 +0200
Message-Id: <1309293110-22035-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] eglibc-locale: don't make versions go backwards after split from eglibc
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
X-List-Received-Date: Tue, 28 Jun 2011 20:35:37 -0000

eglibc was way beyond PR = "r1" at the time of the split, so increase PR to make package upgrades work

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/eglibc/eglibc-locale.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index 7c4b1d5..96f2d8a 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -26,7 +26,7 @@ BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
 # set "0" for qemu emulation of native localedef for locale generation
 LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
 
-PR = "r1"
+PR = "r16"
 
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
-- 
1.6.6.1



