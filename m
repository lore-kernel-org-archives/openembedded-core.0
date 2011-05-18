Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMh6M-0001Ts-7e
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 15:47:50 +0200
Received: by wwb17 with SMTP id 17so1454186wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 06:44:55 -0700 (PDT)
Received: by 10.216.150.153 with SMTP id z25mr1789713wej.89.1305726295578;
	Wed, 18 May 2011 06:44:55 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id t58sm794339weq.16.2011.05.18.06.44.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 06:44:55 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:44:45 +0200
Message-Id: <1305726289-9546-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/5] diffutils: fix libc overrides
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
X-List-Received-Date: Wed, 18 May 2011 13:47:50 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/diffutils/diffutils_2.8.1.bb |    2 +-
 meta/recipes-extended/diffutils/diffutils_3.0.bb   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/diffutils/diffutils_2.8.1.bb b/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
index 9489b35..0fb3a31 100644
--- a/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
+++ b/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
@@ -20,7 +20,7 @@ inherit autotools update-alternatives gettext
 # standard functionality.  regex.c actually breaks compilation
 # because it uses __mempcpy, there are other things (TBD:
 # see diffutils.mk in buildroot)
-EXTRA_OECONF_linux-uclibc = "--without-included-regex"
+EXTRA_OECONF_libc-uclibc = "--without-included-regex"
 
 ALTERNATIVE_LINKS = "${bindir}/diff ${bindir}/cmp"
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-extended/diffutils/diffutils_3.0.bb b/meta/recipes-extended/diffutils/diffutils_3.0.bb
index 427efdf..ecff5cc 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.0.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.0.bb
@@ -16,7 +16,7 @@ inherit autotools update-alternatives gettext
 # standard functionality.  regex.c actually breaks compilation
 # because it uses __mempcpy, there are other things (TBD:
 # see diffutils.mk in buildroot)
-EXTRA_OECONF_linux-uclibc = "--without-included-regex"
+EXTRA_OECONF_libc-uclibc = "--without-included-regex"
 
 ALTERNATIVE_LINKS = "${bindir}/diff ${bindir}/cmp"
 ALTERNATIVE_PRIORITY = "100"
-- 
1.6.6.1



