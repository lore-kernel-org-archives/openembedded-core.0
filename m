Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16CF677112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 09:39:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0T9dUi0011815
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 01:39:30 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 29 Jan 2016 01:39:29 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jan 2016 17:38:06 +0800
Message-ID: <12f8c4e21c66d0272e0096600c533e3ac5cce6c2.1454060185.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1454060185.git.kai.kang@windriver.com>
References: <cover.1454060185.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] docbook-xsl-stylesheets: create a link for easy refer
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
X-List-Received-Date: Fri, 29 Jan 2016 09:39:30 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Create a link to stylesheets directory for docbook-xsl-stylesheets to
make it easy to refer.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
index 3c4ed6a..52de3ab 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
@@ -34,7 +34,8 @@ do_compile (){
 do_install () {
 	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/docbook-xsl.html
 	# for details.
-	install -v -m755 -d ${D}${datadir}/xml/docbook/xsl-stylesheets-1.78.1
+	install -v -m755 -d ${D}${datadir}/xml/docbook/xsl-stylesheets-${PV}
+	ln -s xsl-stylesheets-${PV} ${D}${datadir}/xml/docbook/xsl-stylesheets
 
 	cp -v -R VERSION common eclipse epub extensions fo highlighting html \
 		htmlhelp images javahelp lib manpages params profiling \
-- 
2.6.1


