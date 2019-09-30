Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A451A7F102
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 19:02:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x8UJ2X9l021706
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 12:02:33 -0700 (PDT)
Received: from yow-dellw-ag.wrs.com (128.224.56.115) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Mon, 30 Sep 2019 12:02:33 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Sep 2019 15:02:32 -0400
Message-ID: <1569870152-9415-1-git-send-email-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] opkg: remove pathfinder PACKAGECONFIG option
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
X-List-Received-Date: Mon, 30 Sep 2019 19:02:32 -0000
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

pathfinder has no recipe and its last update was in 2013
(see http://freshmeat.sourceforge.net/projects/pathfinder),
so it should be removed from the list of PACKAGECONFIG options
for opkg. --disable-pathfinder is added to EXTRA_OECONF for
good measure.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-devtools/opkg/opkg_0.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.4.1.bb b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
index 6270862..10c2628 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
@@ -37,9 +37,9 @@ PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
 PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
-PACKAGECONFIG[pathfinder] = "--enable-pathfinder,--disable-pathfinder,pathfinder"
 PACKAGECONFIG[libsolv] = "--with-libsolv,--without-libsolv,libsolv"
 
+EXTRA_OECONF += " --disable-pathfinder"
 EXTRA_OECONF_class-native = "--localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
 
 # Release tarball has unused binaries on the tests folder, automatically created by automake.
-- 
2.7.4


