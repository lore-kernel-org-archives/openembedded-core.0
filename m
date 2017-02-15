Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 61BA67723E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 06:25:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1F6PL8v007609
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 22:25:21 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Feb 2017 22:25:21 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Feb 2017 22:25:09 -0800
Message-ID: <919896572a4b00981602d274e8ff704c3ce2ba13.1487139819.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1487139819.git.liezhi.yang@windriver.com>
References: <cover.1487139819.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] gawk/json-glib/libcheck: extend to nativesdk
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
X-List-Received-Date: Wed, 15 Feb 2017 06:25:29 -0000
Content-Type: text/plain

They are required by nativesdk-cve-check-tool.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/gawk/gawk_4.1.4.bb         | 2 ++
 meta/recipes-gnome/json-glib/json-glib_1.2.2.bb  | 2 +-
 meta/recipes-support/libcheck/libcheck_0.10.0.bb | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk_4.1.4.bb b/meta/recipes-extended/gawk/gawk_4.1.4.bb
index b888df1..dda38ef 100644
--- a/meta/recipes-extended/gawk/gawk_4.1.4.bb
+++ b/meta/recipes-extended/gawk/gawk_4.1.4.bb
@@ -45,3 +45,5 @@ do_install_ptest() {
 	  do cp ${S}/test/$i* ${D}${PTEST_PATH}/test; \
 	done
 }
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.2.2.bb b/meta/recipes-gnome/json-glib/json-glib_1.2.2.bb
index 4e272be..6869ba9 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.2.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.2.2.bb
@@ -17,4 +17,4 @@ inherit gnomebase gettext lib_package gobject-introspection gtk-doc manpages
 
 PACKAGECONFIG[manpages] = "--enable-man --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog.xml, --disable-man, libxslt-native xmlto-native"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libcheck/libcheck_0.10.0.bb b/meta/recipes-support/libcheck/libcheck_0.10.0.bb
index c0b459f..9d34198 100644
--- a/meta/recipes-support/libcheck/libcheck_0.10.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.10.0.bb
@@ -21,4 +21,4 @@ RREPLACES_${PN} = "check (<= 0.9.5)"
 RDEPENDS_${PN} += "gawk"
 RDEPENDS_${PN}_class-native = ""
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.10.2


