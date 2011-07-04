Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QdmMD-0005V4-0P
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 18:50:49 +0200
Received: by rex (Postfix, from userid 1000)
	id 2298830C05; Mon,  4 Jul 2011 17:46:32 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2011 17:46:26 +0100
Message-Id: <87367459b96bea09e1a322521a9a86437dc8240f.1309797628.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <d9a975fe45667bec7ec11697106d5975ffe9b835.1309797628.git.richard.purdie@linuxfoundation.org>
References: <d9a975fe45667bec7ec11697106d5975ffe9b835.1309797628.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309797628.git.richard.purdie@linuxfoundation.org>
References: <cover.1309797628.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/8] gettext: Disable both git and cvs for autopoint's archive format.
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
X-List-Received-Date: Mon, 04 Jul 2011 16:50:49 -0000

From: Richard  Purdie <richard.purdie@linuxfoundation.org>

The git-native dependency is about a 10% build performance hit for a small
reduction in autopoint's archive size (500kb vs 3.5MB). We could always
enable this for the target version only I guess.

Signed-off-by: Richard  Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/gettext/gettext_0.18.1.1.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index b64fbdb..174180e 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -6,8 +6,8 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 PR = "r0"
-DEPENDS = "gettext-native virtual/libiconv ncurses expat git-native"
-DEPENDS_virtclass-native = "git-native"
+DEPENDS = "gettext-native virtual/libiconv ncurses expat"
+DEPENDS_virtclass-native = ""
 PROVIDES = "virtual/libintl virtual/gettext"
 PROVIDES_virtclass-native = ""
 CONFLICTS_${PN} = "proxy-libintl"
@@ -34,7 +34,8 @@ EXTRA_OECONF += "--without-lispdir \
                  --with-included-glib \
                  --with-libncurses-prefix=${STAGING_LIBDIR}/.. \
                  --without-emacs \
-                 --with-git \
+                 --without-cvs \
+                 --without-git \
                 "
 
 acpaths = '-I ${S}/gettext-runtime/m4 \
-- 
1.7.4.1



