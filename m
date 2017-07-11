Return-Path: <iserovil@deshawresearch.com>
X-Greylist: delayed 1078 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 11 Jul 2017 16:15:47 UTC
Received: from drdwsfe1.nyc.desres.deshaw.com (nyvpn.deshawresearch.com
	[38.109.87.242])
	by mail.openembedded.org (Postfix) with ESMTP id 4724D77DCA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 16:15:47 +0000 (UTC)
Received: from drdws0019.nyc.desres.deshaw.com
	(drdws0019.nyc.desres.deshaw.com [149.77.52.116])
	by drdwsfe1.nyc.desres.deshaw.com (Postfix) with ESMTP id 1CECFEA9FE;
	Tue, 11 Jul 2017 11:57:51 -0400 (EDT)
Received: by drdws0019.nyc.desres.deshaw.com (Postfix, from userid 11825)
	id 10D00E0042; Tue, 11 Jul 2017 11:57:51 -0400 (EDT)
From: Lev Iserovich <lev.iserovich@deshawresearch.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 11:57:51 -0400
Message-Id: <1499788671-20890-1-git-send-email-lev.iserovich@deshawresearch.com>
X-Mailer: git-send-email 2.7.1
Cc: Lev Iserovich <iserovil@deshawresearch.com>
Subject: [PATCH] gettext: Enable generation of libasprintf in gettext 0.19
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
X-List-Received-Date: Tue, 11 Jul 2017 16:15:48 -0000

From: Lev Iserovich <iserovil@deshawresearch.com>

Libasprintf was included in gettext 0.16 recipe, but omitted for some reason
in 0.19. This turns it back on.

Signed-off-by: Lev Iserovich <lev.iserovich@deshawresearch.com>
---
 meta/recipes-core/gettext/gettext_0.19.8.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
index c2059e6..c7c81ee 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -28,7 +28,6 @@ inherit autotools texinfo
 
 EXTRA_OECONF += "--without-lispdir \
                  --disable-csharp \
-                 --disable-libasprintf \
                  --disable-java \
                  --disable-native-java \
                  --disable-openmp \
@@ -81,7 +80,7 @@ FILES_gettext-runtime = "${bindir}/gettext \
                          ${bindir}/ngettext \
                          ${bindir}/envsubst \
                          ${bindir}/gettext.sh \
-                         ${libdir}/libasprintf.so* \
+                         ${libdir}/libasprintf${SODEV} \
                          ${libdir}/GNU.Gettext.dll \
                         "
 FILES_gettext-runtime-dev += "${libdir}/libasprintf.a \
-- 
2.7.1


