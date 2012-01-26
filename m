Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RqRig-0001QL-II
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 16:58:38 +0100
Received: by bkaq10 with SMTP id q10so568515bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 07:50:50 -0800 (PST)
Received: by 10.204.141.14 with SMTP id k14mr1222087bku.67.1327593050322;
	Thu, 26 Jan 2012 07:50:50 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id cz3sm9753612bkb.3.2012.01.26.07.50.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 07:50:49 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2012 17:50:42 +0200
Message-Id: <1327593042-1252-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
Cc: flocirel@gmail.com, Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH] bzip2-full-native: Remove PROVIDES_append_virtclass-native and modify python-native DEPENDS.
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
X-List-Received-Date: Thu, 26 Jan 2012 15:58:38 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

There are no more -full-native virtclass-native in yocto. The only dependency for this is in
python where DEPENDS was changed accordingly.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../recipes-devtools/python/python-native_2.7.2.bb |    2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |    1 -
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native_2.7.2.bb b/meta/recipes-devtools/python/python-native_2.7.2.bb
index 8bf0af0..5e99a42 100644
--- a/meta/recipes-devtools/python/python-native_2.7.2.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.2.bb
@@ -1,5 +1,5 @@
 require python.inc
-DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
+DEPENDS = "openssl-native bzip2-native zlib-native readline-native sqlite3-native"
 PR = "${INC_PR}.3"
 
 SRC_URI += "file://04-default-is-optimized.patch \
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index 14cd240..23b2bdb 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -28,5 +28,4 @@ do_configure_prepend () {
 	cp ${STAGING_DATADIR_NATIVE}/automake*/install-sh ${S}/
 }
 
-PROVIDES_append_virtclass-native = " bzip2-full-native"
 BBCLASSEXTEND = "native"
-- 
1.7.5.4



