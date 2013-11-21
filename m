Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6A69C6D772
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:28:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7SVqR014192
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:28:31 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:28:30 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:28:23 -0600
Message-ID: <1385018903-24196-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [dora][PATCH] openssl: Fix pod2man des.pod error
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
X-List-Received-Date: Thu, 21 Nov 2013 07:28:32 -0000
Content-Type: text/plain

From: Baogen Shang <baogen.shang@windriver.com>

formatting fix, =back is required before =head1 on Ubuntu 12.04.

Signed-off-by: Baogen Shang <baogen.shang@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 .../openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch   | 12 ++++++++++++
 meta/recipes-connectivity/openssl/openssl_1.0.1e.bb          |  3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch
new file mode 100644
index 0000000..512cde4
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch
@@ -0,0 +1,12 @@
+diff -urpN a_origin/des.pod b_modify/des.pod
+--- a_origin/crypto/des/des.pod	2013-08-15 15:02:56.211674589 +0800
++++ b_modify/crypto/des/des.pod	2013-08-15 15:04:14.439674580 +0800
+@@ -181,6 +181,8 @@ the uuencoded file to embed in the begin
+ output.  If there is no name specified after the B<-u>, the name text.des
+ will be embedded in the header.
+ 
++=back
++
+ =head1 SEE ALSO
+ 
+ ps(1),
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index ac27dba..64ec426 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
@@ -34,6 +34,7 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
             file://openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch \
             file://find.pl \
+            file://openssl-fix-des.pod-error.patch \
            "
 
 SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
-- 
1.8.1.2.545.g2f19ada


