Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F39816EFCE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:43:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9hBWT004530
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:43:11 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:43:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:42:45 +0800
Message-ID: <a9a8a96fbbf68a9f9be9f4a036ac135939eddb07.1395996041.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395996041.git.hongxu.jia@windriver.com>
References: <cover.1395996041.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 6/6] openssl: Fix pod2man des.pod error on Ubuntu 12.04
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
X-List-Received-Date: Fri, 28 Mar 2014 09:43:17 -0000
Content-Type: text/plain

From: Baogen Shang <baogen.shang@windriver.com>

This is a formatting fix, '=back' is required before
'=head1' on Ubuntu 12.04.

Signed-off-by: Baogen Shang <baogen.shang@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../openssl-1.0.1e/openssl-fix-des.pod-error.patch    | 19 +++++++++++++++++++
 meta/recipes-connectivity/openssl/openssl_1.0.1e.bb   |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch
new file mode 100644
index 0000000..de49729
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch
@@ -0,0 +1,19 @@
+openssl: Fix pod2man des.pod error on Ubuntu 12.04
+
+This is a formatting fix, '=back' is required before
+'=head1' on Ubuntu 12.04.
+
+Upstream-Status: Pending
+Signed-off-by: Baogen Shang <baogen.shang@windriver.com>
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
index 2c3885c..618ba68 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -35,6 +35,7 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch \
             file://initial-aarch64-bits.patch \
             file://find.pl \
+            file://openssl-fix-des.pod-error.patch \
             file://0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch \
             file://0001-Fix-DTLS-retransmission-from-previous-session.patch \
             file://0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch \
-- 
1.8.1.2


