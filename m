Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcabQ-0006dT-KB
	for openembedded-core@lists.linuxtogo.org;
	Fri, 01 Jul 2011 12:05:36 +0200
Received: by wyg30 with SMTP id 30so2364119wyg.6
	for <openembedded-core@lists.linuxtogo.org>;
	Fri, 01 Jul 2011 03:01:51 -0700 (PDT)
Received: by 10.216.79.74 with SMTP id h52mr3051870wee.33.1309514511163;
	Fri, 01 Jul 2011 03:01:51 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w62sm1537782wec.42.2011.07.01.03.01.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 03:01:50 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.linuxtogo.org
Date: Fri,  1 Jul 2011 12:01:43 +0200
Message-Id: <1309514503-9364-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <y>
References: <y>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] gettext: fix ERROR: QA Issue: gettext rdepends on gettext-dev
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
X-List-Received-Date: Fri, 01 Jul 2011 10:05:36 -0000

This was fixed in 2008 already, see http://dominion.thruhere.net/koen/cms/the-testlab-strikes-again but regressed during the 0.16.x -> 0.18.x update. Strangely enough the comment was kept.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/gettext/gettext_0.18.1.1.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index b64fbdb..323346f 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,7 +5,8 @@ SECTION = "libs"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r0"
+PR = "r1"
+
 DEPENDS = "gettext-native virtual/libiconv ncurses expat git-native"
 DEPENDS_virtclass-native = "git-native"
 PROVIDES = "virtual/libintl virtual/gettext"
@@ -50,6 +51,11 @@ acpaths = '-I ${S}/gettext-runtime/m4 \
 # 1300    KiB /ep93xx/uclibc-dev_0.9.29-r8_ep93xx.ipk
 # 140     KiB /armv4t/gettext-dev_0.14.1-r6_armv4t.ipk
 # 4       KiB /ep93xx/libgcc-s-dev_4.2.2-r2_ep93xx.ipk
+
+PACKAGES =+ "libgettextlib libgettextsrc"
+FILES_libgettextlib = "${libdir}/libgettextlib-*.so*"
+FILES_libgettextsrc = "${libdir}/libgettextsrc-*.so*"
+
 PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-doc"
 
 FILES_gettext-runtime = "${bindir}/gettext \
-- 
1.6.6.1



