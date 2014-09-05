Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id AE1F67135C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 14:19:51 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Fri, 5 Sep 2014
	16:19:48 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id A492F288E2C;
	Fri,  5 Sep 2014 16:19:48 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Sep 2014 16:19:45 +0200
Message-ID: <1409926785-5157-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] ltp: upgrade to 20140828
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
X-List-Received-Date: Fri, 05 Sep 2014 14:19:56 -0000
Content-Type: text/plain

Upgrade to *August 2014* release
Removed "automake-foreign.patch" as it has been merged

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-extended/ltp/ltp/automake-foreign.patch | 20 --------------------
 .../ltp/{ltp_20140422.bb => ltp_20140828.bb}         |  3 +--
 2 files changed, 1 insertion(+), 22 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/automake-foreign.patch
 rename meta/recipes-extended/ltp/{ltp_20140422.bb => ltp_20140828.bb} (97%)

diff --git a/meta/recipes-extended/ltp/ltp/automake-foreign.patch b/meta/recipes-extended/ltp/ltp/automake-foreign.patch
deleted file mode 100644
index c3dd891..0000000
--- a/meta/recipes-extended/ltp/ltp/automake-foreign.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Use foreign strictness to avoid automake errors.
-
-Upstream-Status: Submitted (https://github.com/linux-test-project/ltp/issues/16)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index 9f397e7..fc57957 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4 +4 @@
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([foreign])
---- a/utils/ffsb-6.0-rc2/configure.in
-+++ b/utils/ffsb-6.0-rc2/configure.in
-@@ -2,2 +2,3 @@ dnl Process this file with autoconf to produce a configure script.
--AC_INIT(main.c)
--AM_INIT_AUTOMAKE(ffsb, 6.0-RC2)
-+AC_INIT([ffsb], [6.0-RC2])
-+AC_CONFIG_SRCDIR([main.c])
-+AM_INIT_AUTOMAKE([foreign])
diff --git a/meta/recipes-extended/ltp/ltp_20140422.bb b/meta/recipes-extended/ltp/ltp_20140828.bb
similarity index 97%
rename from meta/recipes-extended/ltp/ltp_20140422.bb
rename to meta/recipes-extended/ltp/ltp_20140828.bb
index c658bc0..de1929d 100644
--- a/meta/recipes-extended/ltp/ltp_20140422.bb
+++ b/meta/recipes-extended/ltp/ltp_20140828.bb
@@ -20,12 +20,11 @@ LIC_FILES_CHKSUM = "\
 "
 
 DEPENDS = "attr libaio libcap acl openssl"
-SRCREV = "f4c3bfe1eab51eb72caeb0f3336d2790c9a8bd1b"
+SRCREV = "2c341ad9177f36d9b953e84dee8cf88498286fe5"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
     file://ltp-Do-not-link-against-libfl.patch \
-    file://automake-foreign.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


