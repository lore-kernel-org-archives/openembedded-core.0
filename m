Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RAo90-000812-30
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 21:25:42 +0200
Received: (qmail invoked by alias); 03 Oct 2011 19:13:27 -0000
Received: from p5B0A2BEE.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.43.238]
	by mail.gmx.net (mp002) with SMTP; 03 Oct 2011 21:13:27 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/zmIx+YqbznIralaURle0csCo5GpfHj/PZ3DYxkR
	NpBYhXpfPBzo5H
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 21:17:28 +0200
Message-Id: <1317669448-26316-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [PATCH] webkit-gtk: add --enable-dependency-tracking to EXTRA_OECONF
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
X-List-Received-Date: Mon, 03 Oct 2011 19:25:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After [1] build failed with error message

| Couldn't open file ./DerivedSources/webkit/WebKitDOMCSSStyleDeclarationPrivate.h for writing at Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1122.
| Couldn't open file ./DerivedSources/webkit/WebKitDOMCSSRulePrivate.h for writing at Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1122.
| Couldn't open file ./DerivedSources/webkit/WebKitDOMCSSStyleSheetPrivate.h for writing at Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1122.
| make: *** [DerivedSources/webkit/WebKitDOMCSSStyleDeclaration.h] Error 2

Discussion on this patch see [2]

Build tested in angstrom environment

[1] http://cgit.openembedded.org/cgit.cgi/openembedded-core/commit/?id=970e0ae610804638d00b0a6b85c6e2e895778e8e
[2] http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/010590.html

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta/recipes-sato/webkit/webkit-gtk_svn.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 5eb9b2e..d655999 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -14,7 +14,7 @@ SRCREV_FORMAT = "source"
 
 SRCREV = "90727"
 PV = "1.5.1+svnr${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=Source;proto=http;name=source \
@@ -40,6 +40,7 @@ EXTRA_OECONF = "\
                 --enable-fullscreen-api \
                 --enable-image-resizer \
                 --enable-link-prefetch \
+                --enable-dependency-tracking \
                 UNICODE_CFLAGS=-D_REENTRANT \
                "
 
-- 
1.7.4.4



