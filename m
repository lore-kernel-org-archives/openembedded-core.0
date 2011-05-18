Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMh6P-0001U3-RP
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 15:47:54 +0200
Received: by wwb17 with SMTP id 17so1454236wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 06:44:58 -0700 (PDT)
Received: by 10.216.9.204 with SMTP id 54mr1884109wet.50.1305726297982;
	Wed, 18 May 2011 06:44:57 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h39sm793367wes.29.2011.05.18.06.44.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 06:44:57 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:44:46 +0200
Message-Id: <1305726289-9546-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1305726289-9546-1-git-send-email-koen@dominion.thruhere.net>
References: <1305726289-9546-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/5] findutils: fix libc overrides
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
X-List-Received-Date: Wed, 18 May 2011 13:47:54 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/findutils/findutils.inc      |    2 +-
 .../recipes-extended/findutils/findutils_4.2.31.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes-extended/findutils/findutils.inc
index 673eada..7a07ad5 100644
--- a/meta/recipes-extended/findutils/findutils.inc
+++ b/meta/recipes-extended/findutils/findutils.inc
@@ -19,4 +19,4 @@ inherit autotools gettext
 # standard functionality.  regex.c actually breaks compilation
 # because it uses __mempcpy, there are other things (TBD:
 # see diffutils.mk in buildroot)
-EXTRA_OECONF_linux-uclibc = "--without-included-regex"
+EXTRA_OECONF_libc-uclibc = "--without-included-regex"
diff --git a/meta/recipes-extended/findutils/findutils_4.2.31.bb b/meta/recipes-extended/findutils/findutils_4.2.31.bb
index 3e187b5..0889f0f 100644
--- a/meta/recipes-extended/findutils/findutils_4.2.31.bb
+++ b/meta/recipes-extended/findutils/findutils_4.2.31.bb
@@ -20,7 +20,7 @@ inherit autotools gettext
 # standard functionality.  regex.c actually breaks compilation
 # because it uses __mempcpy, there are other things (TBD:
 # see diffutils.mk in buildroot)
-EXTRA_OECONF_linux-uclibc = "--without-included-regex"
+EXTRA_OECONF_libc-uclibc = "--without-included-regex"
 
 do_install_append () {
 	if [ -e ${D}${bindir}/find ]; then
-- 
1.6.6.1



