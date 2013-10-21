Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 7C32A6CFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 15:36:44 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Mon, 21 Oct 2013 17:36:44 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id C30A828508B;
	Mon, 21 Oct 2013 17:36:44 +0200 (CEST)
From: <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Oct 2013 17:36:42 +0200
Message-ID: <1382369802-10200-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] dropbear: update to 2013.60 version
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
X-List-Received-Date: Mon, 21 Oct 2013 15:36:45 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

update to latest version 2013.60
Update 0006-dropbear-configuration-file.patch for 2013.60

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 .../0001-urandom-xauth-changes-to-options.h.patch  |    0
 .../0002-static_build_fix.patch                    |    0
 .../0003-configure.patch                           |    0
 .../0004-fix-2kb-keys.patch                        |    0
 .../0005-dropbear-enable-pam.patch                 |    0
 .../0006-dropbear-configuration-file.patch         |   22 +++++++-------------
 .../0007-dropbear-fix-for-x32-abi.patch            |    0
 meta/recipes-core/dropbear/dropbear.inc            |    4 ++--
 meta/recipes-core/dropbear/dropbear_2013.58.bb     |    6 ------
 meta/recipes-core/dropbear/dropbear_2013.60.bb     |    6 ++++++
 10 files changed, 16 insertions(+), 22 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear-2013.58 => dropbear-2013.60}/0001-urandom-xauth-changes-to-options.h.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.58 => dropbear-2013.60}/0002-static_build_fix.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.58 => dropbear-2013.60}/0003-configure.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.58 => dropbear-2013.60}/0004-fix-2kb-keys.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.58 => dropbear-2013.60}/0005-dropbear-enable-pam.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.58 => dropbear-2013.60}/0006-dropbear-configuration-file.patch (56%)
 rename meta/recipes-core/dropbear/{dropbear-2013.58 => dropbear-2013.60}/0007-dropbear-fix-for-x32-abi.patch (100%)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2013.58.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2013.60.bb

diff --git a/meta/recipes-core/dropbear/dropbear-2013.58/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear-2013.60/0001-urandom-xauth-changes-to-options.h.patch
similarity index 100%
rename from meta/recipes-core/dropbear/dropbear-2013.58/0001-urandom-xauth-changes-to-options.h.patch
rename to meta/recipes-core/dropbear/dropbear-2013.60/0001-urandom-xauth-changes-to-options.h.patch
diff --git a/meta/recipes-core/dropbear/dropbear-2013.58/0002-static_build_fix.patch b/meta/recipes-core/dropbear/dropbear-2013.60/0002-static_build_fix.patch
similarity index 100%
rename from meta/recipes-core/dropbear/dropbear-2013.58/0002-static_build_fix.patch
rename to meta/recipes-core/dropbear/dropbear-2013.60/0002-static_build_fix.patch
diff --git a/meta/recipes-core/dropbear/dropbear-2013.58/0003-configure.patch b/meta/recipes-core/dropbear/dropbear-2013.60/0003-configure.patch
similarity index 100%
rename from meta/recipes-core/dropbear/dropbear-2013.58/0003-configure.patch
rename to meta/recipes-core/dropbear/dropbear-2013.60/0003-configure.patch
diff --git a/meta/recipes-core/dropbear/dropbear-2013.58/0004-fix-2kb-keys.patch b/meta/recipes-core/dropbear/dropbear-2013.60/0004-fix-2kb-keys.patch
similarity index 100%
rename from meta/recipes-core/dropbear/dropbear-2013.58/0004-fix-2kb-keys.patch
rename to meta/recipes-core/dropbear/dropbear-2013.60/0004-fix-2kb-keys.patch
diff --git a/meta/recipes-core/dropbear/dropbear-2013.58/0005-dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear-2013.60/0005-dropbear-enable-pam.patch
similarity index 100%
rename from meta/recipes-core/dropbear/dropbear-2013.58/0005-dropbear-enable-pam.patch
rename to meta/recipes-core/dropbear/dropbear-2013.60/0005-dropbear-enable-pam.patch
diff --git a/meta/recipes-core/dropbear/dropbear-2013.58/0006-dropbear-configuration-file.patch b/meta/recipes-core/dropbear/dropbear-2013.60/0006-dropbear-configuration-file.patch
similarity index 56%
rename from meta/recipes-core/dropbear/dropbear-2013.58/0006-dropbear-configuration-file.patch
rename to meta/recipes-core/dropbear/dropbear-2013.60/0006-dropbear-configuration-file.patch
index 7e38663..fa4c8d0 100644
--- a/meta/recipes-core/dropbear/dropbear-2013.58/0006-dropbear-configuration-file.patch
+++ b/meta/recipes-core/dropbear/dropbear-2013.60/0006-dropbear-configuration-file.patch
@@ -1,28 +1,22 @@
 Subject: [PATCH 6/6] dropbear configuration file
 
 dropbear: Change the path ("/etc/pam.d/sshd" as default) to find a pam configuration file \
-to "/etc/pam.d/dropbear for dropbear when enabling pam supporting" 
+to "/etc/pam.d/dropbear for dropbear when enabling pam supporting"
 
-Upstream-Status: Inappropriate [configuration] 
+Upstream-Status: Inappropriate [configuration]
 
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 ---
- svr-authpam.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/svr-authpam.c b/svr-authpam.c
-index e84f076..e28be7d 100644
---- a/svr-authpam.c
-+++ b/svr-authpam.c
-@@ -195,7 +195,7 @@ void svr_auth_pam() {
+diff -Naur dropbear-2013.60-orig/svr-authpam.c dropbear-2013.60/svr-authpam.c
+--- dropbear-2013.60-orig/svr-authpam.c	2013-10-16 16:34:53.000000000 +0200
++++ dropbear-2013.60/svr-authpam.c	2013-10-21 17:04:04.969416055 +0200
+@@ -211,7 +211,7 @@
  	userData.passwd = password;
  
  	/* Init pam */
 -	if ((rc = pam_start("sshd", NULL, &pamConv, &pamHandlep)) != PAM_SUCCESS) {
 +	if ((rc = pam_start("dropbear", NULL, &pamConv, &pamHandlep)) != PAM_SUCCESS) {
- 		dropbear_log(LOG_WARNING, "pam_start() failed, rc=%d, %s\n", 
+ 		dropbear_log(LOG_WARNING, "pam_start() failed, rc=%d, %s", 
  				rc, pam_strerror(pamHandlep, rc));
  		goto cleanup;
--- 
-1.7.11.7
-
diff --git a/meta/recipes-core/dropbear/dropbear-2013.58/0007-dropbear-fix-for-x32-abi.patch b/meta/recipes-core/dropbear/dropbear-2013.60/0007-dropbear-fix-for-x32-abi.patch
similarity index 100%
rename from meta/recipes-core/dropbear/dropbear-2013.58/0007-dropbear-fix-for-x32-abi.patch
rename to meta/recipes-core/dropbear/dropbear-2013.60/0007-dropbear-fix-for-x32-abi.patch
diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 9498bf8..f71f190 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -2,12 +2,12 @@ DESCRIPTION = "Dropbear is a lightweight SSH and SCP implementation"
 HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
 SECTION = "console/network"
 
-INC_PR = "r1"
+INC_PR = "r0"
 
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3a5b0c2f0d0c49dfde9558ae2036683c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=de74413ba7e05b7a37c4722e75f436cd"
 
 DEPENDS = "zlib"
 RPROVIDES_${PN} = "ssh sshd" 
diff --git a/meta/recipes-core/dropbear/dropbear_2013.58.bb b/meta/recipes-core/dropbear/dropbear_2013.58.bb
deleted file mode 100644
index 99a24a7..0000000
--- a/meta/recipes-core/dropbear/dropbear_2013.58.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "8d3579bbbfcea48404a3219643076450"
-SRC_URI[sha256sum] = "d866189b1d14e15353aeb4feb616f6132a63ea7c25ca8aa12b63a3a397822e55"
-
-PR = "${INC_PR}.0"
diff --git a/meta/recipes-core/dropbear/dropbear_2013.60.bb b/meta/recipes-core/dropbear/dropbear_2013.60.bb
new file mode 100644
index 0000000..f95c3b5
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2013.60.bb
@@ -0,0 +1,6 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "fffa2fec0c887201bed3a3cc6df7fa35"
+SRC_URI[sha256sum] = "4c0c52453b4dd96ef79e5968ed3676de008ee0cf133632acae12bbad588681bb"
+
+PR = "${INC_PR}.0"
-- 
1.7.10.4


