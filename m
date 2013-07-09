Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC2B6B004
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 02:34:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r692Y270006466
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jul 2013 19:34:02 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 8 Jul 2013 19:34:02 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jul 2013 10:33:59 +0800
Message-ID: <e683f1ce730dcdbf0acb280ebe53673c415e1454.1373337192.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1373337192.git.rongqing.li@windriver.com>
References: <cover.1373337192.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pango: remove pango-module-basic-x RRECOMMENDS
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
X-List-Received-Date: Tue, 09 Jul 2013 02:34:01 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

pango-module-basic-x has been removed from pango-1.31.0 and we're using
pango-1.32.5, so we should not refer pango-module-basic-x.
    Commit 194b6ee552318ec6c494f34ed9f0979d0460fe4f
    Author: Behdad Esfahbod <behdad@behdad.org>
    Date:   Thu Aug 16 21:48:50 2012 -0400

        Remove PangoX

        Been overdue...

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-graphics/pango/pango.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 52dd064..43be570 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -20,7 +20,7 @@ DEPENDS_class-native = "glib-2.0-native cairo-native harfbuzz-native"
 
 PACKAGES_DYNAMIC += "^pango-module-.*"
 
-RRECOMMENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'x11', 'pango-module-basic-x', '', d)} pango-module-basic-fc" 
+RRECOMMENDS_${PN} = "pango-module-basic-fc"
 
 inherit gnomebase gtk-doc qemu
 # Create a pango-modules package
-- 
1.7.10.4


