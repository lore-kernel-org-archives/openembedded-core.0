Return-Path: <cristiana.voicu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 07DBC65D85
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 11:54:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Apr 2014 04:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,817,1389772800"; d="scan'208";a="516833291"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.143])
	by orsmga002.jf.intel.com with ESMTP; 08 Apr 2014 04:49:05 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Apr 2014 14:49:48 +0300
Message-Id: <065914552a7fd939fac1bb7e998a8e7187accf69.1396957462.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1396957462.git.cristiana.voicu@intel.com>
References: <cover.1396957462.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1396957462.git.cristiana.voicu@intel.com>
References: <cover.1396957462.git.cristiana.voicu@intel.com>
Subject: [PATCH 1/1] openssl: Upgrade to v1.0.1g
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
X-List-Received-Date: Tue, 08 Apr 2014 11:54:35 -0000

The trigger for the upgrade was the serious "heartbleed" vulnerability
(CVE-2014-0160). More information:
http://www.itnews.com.au/News/382068,serious-openssl-bug-renders-websites-wide-open.aspx

Dropped obsolete patches, because the new version contains them:
        0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch
        0001-Fix-DTLS-retransmission-from-previous-session.patch
        0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch

Modified 2 patches (small changes), in order to apply properly:
        initial-aarch64-bits.patch
        openssl-fix-doc.patch

Addresses CVEs:
    http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-0160
    http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-0076

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 ...DTLS-retransmission-from-previous-session.patch |   81 ------
 ...or-TLS-record-tampering-bug-CVE-2013-4353.patch |   31 ---
 ...e-version-in-SSL_METHOD-not-SSL-structure.patch |   33 ---
 meta/recipes-connectivity/openssl/openssl.inc      |    3 -
 .../configure-targets.patch                        |    0
 .../debian/c_rehash-compat.patch                   |    0
 .../{openssl-1.0.1e => openssl}/debian/ca.patch    |    0
 .../debian/debian-targets.patch                    |    0
 .../debian/make-targets.patch                      |    0
 .../debian/man-dir.patch                           |    0
 .../debian/man-section.patch                       |    0
 .../debian/no-rpath.patch                          |    0
 .../debian/no-symbolic.patch                       |    0
 .../{openssl-1.0.1e => openssl}/debian/pic.patch   |    0
 .../debian/version-script.patch                    |    0
 .../engines-install-in-libdir-ssl.patch            |    0
 .../openssl/{openssl-1.0.1e => openssl}/find.pl    |    0
 .../fix-cipher-des-ede3-cfb1.patch                 |    0
 .../initial-aarch64-bits.patch                     |  108 ++++----
 .../{openssl-1.0.1e => openssl}/oe-ldflags.patch   |    0
 ...-pointer-dereference-in-EVP_DigestInit_ex.patch |    0
 ...NULL-pointer-dereference-in-dh_pub_encode.patch |    0
 .../openssl-fix-des.pod-error.patch                |    0
 .../openssl-fix-doc.patch                          |  280 +++++++++-----------
 .../openssl-fix-link.patch                         |    0
 .../openssl_fix_for_x32.patch                      |    0
 .../{openssl-1.0.1e => openssl}/shared-libs.patch  |    0
 .../{openssl_1.0.1e.bb => openssl_1.0.1g.bb}       |    9 +-
 28 files changed, 183 insertions(+), 362 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-DTLS-retransmission-from-previous-session.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/find.pl (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/fix-cipher-des-ede3-cfb1.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/initial-aarch64-bits.patch (43%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/openssl-fix-des.pod-error.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/openssl-fix-doc.patch (47%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/openssl-fix-link.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.1e.bb => openssl_1.0.1g.bb} (81%)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-DTLS-retransmission-from-previous-session.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-DTLS-retransmission-from-previous-session.patch
deleted file mode 100644
index 39592e2..0000000
--- a/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-DTLS-retransmission-from-previous-session.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 34628967f1e65dc8f34e000f0f5518e21afbfc7b Mon Sep 17 00:00:00 2001
-From: "Dr. Stephen Henson" <steve@openssl.org>
-Date: Fri, 20 Dec 2013 15:26:50 +0000
-Subject: [PATCH] Fix DTLS retransmission from previous session.
-
-Upstream-Status: Backport
-commit 34628967f1e65dc8f34e000f0f5518e21afbfc7b upstream
-
-For DTLS we might need to retransmit messages from the previous session
-so keep a copy of write context in DTLS retransmission buffers instead
-of replacing it after sending CCS. CVE-2013-6450.
----
- ssl/d1_both.c  |    6 ++++++
- ssl/ssl_locl.h |    2 ++
- ssl/t1_enc.c   |   17 +++++++++++------
- 4 files changed, 24 insertions(+), 6 deletions(-)
-
-diff --git a/ssl/d1_both.c b/ssl/d1_both.c
-index 65ec001..7a5596a 100644
---- a/ssl/d1_both.c
-+++ b/ssl/d1_both.c
-@@ -214,6 +214,12 @@ dtls1_hm_fragment_new(unsigned long frag_len, int reassembly)
- static void
- dtls1_hm_fragment_free(hm_fragment *frag)
- 	{
-+
-+	if (frag->msg_header.is_ccs)
-+		{
-+		EVP_CIPHER_CTX_free(frag->msg_header.saved_retransmit_state.enc_write_ctx);
-+		EVP_MD_CTX_destroy(frag->msg_header.saved_retransmit_state.write_hash);
-+		}
- 	if (frag->fragment) OPENSSL_free(frag->fragment);
- 	if (frag->reassembly) OPENSSL_free(frag->reassembly);
- 	OPENSSL_free(frag);
-diff --git a/ssl/ssl_locl.h b/ssl/ssl_locl.h
-index 96ce9a7..e485907 100644
---- a/ssl/ssl_locl.h
-+++ b/ssl/ssl_locl.h
-@@ -621,6 +621,8 @@ extern SSL3_ENC_METHOD TLSv1_enc_data;
- extern SSL3_ENC_METHOD SSLv3_enc_data;
- extern SSL3_ENC_METHOD DTLSv1_enc_data;
- 
-+#define SSL_IS_DTLS(s) (s->method->version == DTLS1_VERSION)
-+
- #define IMPLEMENT_tls_meth_func(version, func_name, s_accept, s_connect, \
- 				s_get_meth) \
- const SSL_METHOD *func_name(void)  \
-diff --git a/ssl/t1_enc.c b/ssl/t1_enc.c
-index 72015f5..56db834 100644
---- a/ssl/t1_enc.c
-+++ b/ssl/t1_enc.c
-@@ -414,15 +414,20 @@ int tls1_change_cipher_state(SSL *s, int which)
- 			s->mac_flags |= SSL_MAC_FLAG_WRITE_MAC_STREAM;
- 			else
- 			s->mac_flags &= ~SSL_MAC_FLAG_WRITE_MAC_STREAM;
--		if (s->enc_write_ctx != NULL)
-+		if (s->enc_write_ctx != NULL && !SSL_IS_DTLS(s))
- 			reuse_dd = 1;
--		else if ((s->enc_write_ctx=OPENSSL_malloc(sizeof(EVP_CIPHER_CTX))) == NULL)
-+		else if ((s->enc_write_ctx=EVP_CIPHER_CTX_new()) == NULL)
- 			goto err;
--		else
--			/* make sure it's intialized in case we exit later with an error */
--			EVP_CIPHER_CTX_init(s->enc_write_ctx);
- 		dd= s->enc_write_ctx;
--		mac_ctx = ssl_replace_hash(&s->write_hash,NULL);
-+		if (SSL_IS_DTLS(s))
-+			{
-+			mac_ctx = EVP_MD_CTX_create();
-+			if (!mac_ctx)
-+				goto err;
-+			s->write_hash = mac_ctx;
-+			}
-+		else
-+			mac_ctx = ssl_replace_hash(&s->write_hash,NULL);
- #ifndef OPENSSL_NO_COMP
- 		if (s->compress != NULL)
- 			{
--- 
-1.7.5.4
-
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch
deleted file mode 100644
index d03dc06..0000000
--- a/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 197e0ea817ad64820789d86711d55ff50d71f631 Mon Sep 17 00:00:00 2001
-From: "Dr. Stephen Henson" <steve@openssl.org>
-Date: Mon, 6 Jan 2014 14:35:04 +0000
-Subject: [PATCH] Fix for TLS record tampering bug CVE-2013-4353
-
-Upstream-Status: Backport
-commit 197e0ea817ad64820789d86711d55ff50d71f631 upstream
-
- ssl/s3_both.c |    6 +++++-
- 3 files changed, 11 insertions(+), 1 deletions(-)
-
-diff --git a/ssl/s3_both.c b/ssl/s3_both.c
-index 1e5dcab..53b9390 100644
---- a/ssl/s3_both.c
-+++ b/ssl/s3_both.c
-@@ -210,7 +210,11 @@ static void ssl3_take_mac(SSL *s)
- 	{
- 	const char *sender;
- 	int slen;
--
-+	/* If no new cipher setup return immediately: other functions will
-+	 * set the appropriate error.
-+	 */
-+	if (s->s3->tmp.new_cipher == NULL)
-+		return;
- 	if (s->state & SSL_ST_CONNECT)
- 		{
- 		sender=s->method->ssl3_enc->server_finished_label;
--- 
-1.7.5.4
-
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch
deleted file mode 100644
index e5a8ade..0000000
--- a/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From ca989269a2876bae79393bd54c3e72d49975fc75 Mon Sep 17 00:00:00 2001
-From: "Dr. Stephen Henson" <steve@openssl.org>
-Date: Thu, 19 Dec 2013 14:37:39 +0000
-Subject: [PATCH] Use version in SSL_METHOD not SSL structure.
-
-Upstream-Status: Backport
-commit ca989269a2876bae79393bd54c3e72d49975fc75 upstream
-
-When deciding whether to use TLS 1.2 PRF and record hash algorithms
-use the version number in the corresponding SSL_METHOD structure
-instead of the SSL structure. The SSL structure version is sometimes
-inaccurate. Note: OpenSSL 1.0.2 and later effectively do this already.
-(CVE-2013-6449)
----
- ssl/s3_lib.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/ssl/s3_lib.c b/ssl/s3_lib.c
-index bf832bb..c4ef273 100644
---- a/ssl/s3_lib.c
-+++ b/ssl/s3_lib.c
-@@ -4286,7 +4286,7 @@ need to go to SSL_ST_ACCEPT.
- long ssl_get_algorithm2(SSL *s)
- 	{
- 	long alg2 = s->s3->tmp.new_cipher->algorithm2;
--	if (TLS1_get_version(s) >= TLS1_2_VERSION &&
-+	if (s->method->version == TLS1_2_VERSION &&
- 	    alg2 == (SSL_HANDSHAKE_MAC_DEFAULT|TLS1_PRF))
- 		return SSL_HANDSHAKE_MAC_SHA256 | TLS1_PRF_SHA256;
- 	return alg2;
--- 
-1.7.5.4
-
diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index e924914..ee02fb7 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -4,9 +4,6 @@ HOMEPAGE = "http://www.openssl.org/"
 BUGTRACKER = "http://www.openssl.org/news/vulnerabilities.html"
 SECTION = "libs/network"
 
-# Big Jump for OpenSSL 1.0 support with meta-oe
-INC_PR = "r15"
-
 # "openssl | SSLeay" dual license
 LICENSE = "openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl/configure-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl/configure-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl/debian/c_rehash-compat.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/c_rehash-compat.patch
rename to meta/recipes-connectivity/openssl/openssl/debian/c_rehash-compat.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl/debian/ca.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/ca.patch
rename to meta/recipes-connectivity/openssl/openssl/debian/ca.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl/debian/debian-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl/debian/debian-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/make-targets.patch b/meta/recipes-connectivity/openssl/openssl/debian/make-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/make-targets.patch
rename to meta/recipes-connectivity/openssl/openssl/debian/make-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl/debian/pic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl/debian/pic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl/debian/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl/debian/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/engines-install-in-libdir-ssl.patch b/meta/recipes-connectivity/openssl/openssl/engines-install-in-libdir-ssl.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/engines-install-in-libdir-ssl.patch
rename to meta/recipes-connectivity/openssl/openssl/engines-install-in-libdir-ssl.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/find.pl b/meta/recipes-connectivity/openssl/openssl/find.pl
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/find.pl
rename to meta/recipes-connectivity/openssl/openssl/find.pl
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/fix-cipher-des-ede3-cfb1.patch b/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/fix-cipher-des-ede3-cfb1.patch
rename to meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/initial-aarch64-bits.patch b/meta/recipes-connectivity/openssl/openssl/initial-aarch64-bits.patch
similarity index 43%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/initial-aarch64-bits.patch
rename to meta/recipes-connectivity/openssl/openssl/initial-aarch64-bits.patch
index 703b8c1..2185ff8 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.1e/initial-aarch64-bits.patch
+++ b/meta/recipes-connectivity/openssl/openssl/initial-aarch64-bits.patch
@@ -11,26 +11,30 @@ Initial aarch64 bits.
  crypto/sha/sha512.c      |   13 +++++++++++++
  4 files changed, 48 insertions(+)
 
---- a/crypto/bn/bn_lcl.h
-+++ b/crypto/bn/bn_lcl.h
-@@ -300,6 +300,15 @@ extern "C" {
+Index: openssl-1.0.1f/crypto/bn/bn_lcl.h
+===================================================================
+--- openssl-1.0.1f.orig/crypto/bn/bn_lcl.h	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/crypto/bn/bn_lcl.h	2014-02-28 10:37:55.495979037 +0200
+@@ -300,6 +300,15 @@
  	     : "r"(a), "r"(b));
  #    endif
  #  endif
 +# elif defined(__aarch64__) && defined(SIXTY_FOUR_BIT_LONG)
 +#  if defined(__GNUC__) && __GNUC__>=2
-+#   define BN_UMULT_HIGH(a,b)	({	\
-+	register BN_ULONG ret;		\
-+	asm ("umulh	%0,%1,%2"	\
-+	     : "=r"(ret)		\
-+	     : "r"(a), "r"(b));		\
-+	ret;			})
++#   define BN_UMULT_HIGH(a,b)  ({  \
++   register BN_ULONG ret;      \
++   asm ("umulh %0,%1,%2"   \
++        : "=r"(ret)        \
++        : "r"(a), "r"(b));     \
++   ret;            })
 +#  endif
  # endif		/* cpu */
  #endif		/* OPENSSL_NO_ASM */
  
---- a/crypto/md32_common.h
-+++ b/crypto/md32_common.h
+Index: openssl-1.0.1f/crypto/md32_common.h
+===================================================================
+--- openssl-1.0.1f.orig/crypto/md32_common.h	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/crypto/md32_common.h	2014-02-28 10:39:21.751979107 +0200
 @@ -213,6 +213,24 @@
  				   asm ("bswapl %0":"=r"(r):"0"(r));	\
  				   *((unsigned int *)(c))=r; (c)+=4; r;	})
@@ -38,51 +42,55 @@ Initial aarch64 bits.
 +#  elif defined(__aarch64__)
 +#   if defined(__BYTE_ORDER__)
 +#    if defined(__ORDER_LITTLE_ENDIAN__) && __BYTE_ORDER__==__ORDER_LITTLE_ENDIAN__
-+#     define HOST_c2l(c,l)	({ unsigned int r;		\
-+				   asm ("rev	%w0,%w1"	\
-+					:"=r"(r)		\
-+					:"r"(*((const unsigned int *)(c))));\
-+				   (c)+=4; (l)=r;		})
-+#     define HOST_l2c(l,c)	({ unsigned int r;		\
-+				   asm ("rev	%w0,%w1"	\
-+					:"=r"(r)		\
-+					:"r"((unsigned int)(l)));\
-+				   *((unsigned int *)(c))=r; (c)+=4; r;	})
++#     define HOST_c2l(c,l) ({ unsigned int r;      \
++                  asm ("rev    %w0,%w1"    \
++                   :"=r"(r)        \
++                   :"r"(*((const unsigned int *)(c))));\
++                  (c)+=4; (l)=r;       })
++#     define HOST_l2c(l,c) ({ unsigned int r;      \
++                  asm ("rev    %w0,%w1"    \
++                   :"=r"(r)        \
++                   :"r"((unsigned int)(l)));\
++                  *((unsigned int *)(c))=r; (c)+=4; r; })
 +#    elif defined(__ORDER_BIG_ENDIAN__) && __BYTE_ORDER__==__ORDER_BIG_ENDIAN__
-+#     define HOST_c2l(c,l)	((l)=*((const unsigned int *)(c)), (c)+=4, (l))
-+#     define HOST_l2c(l,c)	(*((unsigned int *)(c))=(l), (c)+=4, (l))
++#     define HOST_c2l(c,l) ((l)=*((const unsigned int *)(c)), (c)+=4, (l))
++#     define HOST_l2c(l,c) (*((unsigned int *)(c))=(l), (c)+=4, (l))
 +#    endif
 +#   endif
  #  endif
  # endif
  #endif
---- a/crypto/modes/modes_lcl.h
-+++ b/crypto/modes/modes_lcl.h
-@@ -29,6 +29,7 @@ typedef unsigned char u8;
+Index: openssl-1.0.1f/crypto/modes/modes_lcl.h
+===================================================================
+--- openssl-1.0.1f.orig/crypto/modes/modes_lcl.h	2014-02-28 10:47:48.731979011 +0200
++++ openssl-1.0.1f/crypto/modes/modes_lcl.h	2014-02-28 10:48:49.707978919 +0200
+@@ -29,6 +29,7 @@
  #if defined(__i386)	|| defined(__i386__)	|| \
      defined(__x86_64)	|| defined(__x86_64__)	|| \
      defined(_M_IX86)	|| defined(_M_AMD64)	|| defined(_M_X64) || \
-+    defined(__aarch64__)			|| \    
-     defined(__s390__)	|| defined(__s390x__)	|| \
-     ( (defined(__arm__)	|| defined(__arm)) && \
-       (defined(__ARM_ARCH_7__)	|| defined(__ARM_ARCH_7A__) || \
-@@ -53,6 +54,13 @@ typedef unsigned char u8;
++    defined(__aarch64__)           || \
+     defined(__s390__)	|| defined(__s390x__)
+ # undef STRICT_ALIGNMENT
+ #endif
+@@ -50,6 +51,13 @@
  #  define BSWAP4(x) ({	u32 ret=(x);			\
  			asm ("bswapl %0"		\
  			: "+r"(ret));	ret;		})
 +# elif defined(__aarch64__)
-+#  define BSWAP8(x) ({	u64 ret;			\
-+			asm ("rev %0,%1"		\
-+			: "=r"(ret) : "r"(x)); ret;	})
-+#  define BSWAP4(x) ({	u32 ret;			\
-+			asm ("rev %w0,%w1"		\
-+			: "=r"(ret) : "r"(x)); ret;	})
++#  define BSWAP8(x) ({ u64 ret;            \
++           asm ("rev %0,%1"        \
++           : "=r"(ret) : "r"(x)); ret; })
++#  define BSWAP4(x) ({ u32 ret;            \
++           asm ("rev %w0,%w1"      \
++           : "=r"(ret) : "r"(x)); ret; })
  # elif (defined(__arm__) || defined(__arm)) && !defined(STRICT_ALIGNMENT)
  #  define BSWAP8(x) ({	u32 lo=(u64)(x)>>32,hi=(x);	\
  			asm ("rev %0,%0; rev %1,%1"	\
---- a/crypto/sha/sha512.c
-+++ b/crypto/sha/sha512.c
-@@ -55,6 +55,7 @@ const char SHA512_version[]="SHA-512" OP
+Index: openssl-1.0.1f/crypto/sha/sha512.c
+===================================================================
+--- openssl-1.0.1f.orig/crypto/sha/sha512.c	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/crypto/sha/sha512.c	2014-02-28 10:52:14.579978981 +0200
+@@ -55,6 +55,7 @@
  #if defined(__i386) || defined(__i386__) || defined(_M_IX86) || \
      defined(__x86_64) || defined(_M_AMD64) || defined(_M_X64) || \
      defined(__s390__) || defined(__s390x__) || \
@@ -90,21 +98,21 @@ Initial aarch64 bits.
      defined(SHA512_ASM)
  #define SHA512_BLOCK_CAN_MANAGE_UNALIGNED_DATA
  #endif
-@@ -340,6 +341,18 @@ static const SHA_LONG64 K512[80] = {
+@@ -347,6 +348,18 @@
  				asm ("rotrdi %0,%1,%2"	\
  				: "=r"(ret)		\
  				: "r"(a),"K"(n)); ret;	})
 +#  elif defined(__aarch64__)
-+#   define ROTR(a,n)	({ SHA_LONG64 ret;		\
-+				asm ("ror %0,%1,%2"	\
-+				: "=r"(ret)		\
-+				: "r"(a),"I"(n)); ret;	})
++#   define ROTR(a,n)   ({ SHA_LONG64 ret;      \
++               asm ("ror %0,%1,%2" \
++               : "=r"(ret)     \
++               : "r"(a),"I"(n)); ret;  })
 +#   if  defined(__BYTE_ORDER__) && defined(__ORDER_LITTLE_ENDIAN__) && \
-+	__BYTE_ORDER__==__ORDER_LITTLE_ENDIAN__
-+#    define PULL64(x)	({ SHA_LONG64 ret;			\
-+				asm ("rev	%0,%1"		\
-+				: "=r"(ret)			\
-+				: "r"(*((const SHA_LONG64 *)(&(x))))); ret;		})
++   __BYTE_ORDER__==__ORDER_LITTLE_ENDIAN__
++#    define PULL64(x)  ({ SHA_LONG64 ret;          \
++               asm ("rev   %0,%1"      \
++               : "=r"(ret)         \
++               : "r"(*((const SHA_LONG64 *)(&(x))))); ret;     })
 +#   endif
  #  endif
  # elif defined(_MSC_VER)
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/oe-ldflags.patch b/meta/recipes-connectivity/openssl/openssl/oe-ldflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/oe-ldflags.patch
rename to meta/recipes-connectivity/openssl/openssl/oe-ldflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
rename to meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch
rename to meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch b/meta/recipes-connectivity/openssl/openssl/openssl-fix-des.pod-error.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch
rename to meta/recipes-connectivity/openssl/openssl/openssl-fix-des.pod-error.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-doc.patch b/meta/recipes-connectivity/openssl/openssl/openssl-fix-doc.patch
similarity index 47%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-doc.patch
rename to meta/recipes-connectivity/openssl/openssl/openssl-fix-doc.patch
index e87ed80..451256e 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-doc.patch
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-fix-doc.patch
@@ -6,11 +6,11 @@ included with Perl 5.18.
 Upstream-Status: Submitted
 Signed-off-by: Jonathan Liu
 
-diff --git a/doc/apps/cms.pod b/doc/apps/cms.pod
-index a09588a..881d387 100644
---- a/doc/apps/cms.pod
-+++ b/doc/apps/cms.pod
-@@ -450,28 +450,28 @@ remains DER.
+Index: openssl-1.0.1f/doc/apps/cms.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/apps/cms.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/apps/cms.pod	2014-02-28 10:13:51.899979213 +0200
+@@ -450,28 +450,28 @@
  
  =over 4
  
@@ -45,11 +45,11 @@ index a09588a..881d387 100644
  
  the message was verified correctly but an error occurred writing out
  the signers certificates.
-diff --git a/doc/apps/smime.pod b/doc/apps/smime.pod
-index e4e89af..ef8e8cd 100644
---- a/doc/apps/smime.pod
-+++ b/doc/apps/smime.pod
-@@ -308,28 +308,28 @@ remains DER.
+Index: openssl-1.0.1f/doc/apps/smime.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/apps/smime.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/apps/smime.pod	2014-02-28 10:16:57.795979233 +0200
+@@ -308,28 +308,28 @@
  
  =over 4
  
@@ -84,24 +84,11 @@ index e4e89af..ef8e8cd 100644
  
  the message was verified correctly but an error occurred writing out
  the signers certificates.
-diff --git a/doc/crypto/X509_STORE_CTX_get_error.pod b/doc/crypto/X509_STORE_CTX_get_error.pod
-index a883f6c..60e8332 100644
---- a/doc/crypto/X509_STORE_CTX_get_error.pod
-+++ b/doc/crypto/X509_STORE_CTX_get_error.pod
-@@ -278,6 +278,8 @@ happen if extended CRL checking is enabled.
- an application specific error. This will never be returned unless explicitly
- set by an application.
- 
-+=back
-+
- =head1 NOTES
- 
- The above functions should be used instead of directly referencing the fields
-diff --git a/doc/ssl/SSL_COMP_add_compression_method.pod b/doc/ssl/SSL_COMP_add_compression_method.pod
-index 42fa66b..f4d191c 100644
---- a/doc/ssl/SSL_COMP_add_compression_method.pod
-+++ b/doc/ssl/SSL_COMP_add_compression_method.pod
-@@ -53,11 +53,11 @@ SSL_COMP_add_compression_method() may return the following values:
+Index: openssl-1.0.1f/doc/ssl/SSL_COMP_add_compression_method.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/ssl/SSL_COMP_add_compression_method.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/ssl/SSL_COMP_add_compression_method.pod	2014-02-28 10:18:09.679979225 +0200
+@@ -53,11 +53,11 @@
  
  =over 4
  
@@ -115,11 +102,11 @@ index 42fa66b..f4d191c 100644
  
  The operation failed. Check the error queue to find out the reason.
  
-diff --git a/doc/ssl/SSL_CTX_add_session.pod b/doc/ssl/SSL_CTX_add_session.pod
-index 82676b2..8e0abd3 100644
---- a/doc/ssl/SSL_CTX_add_session.pod
-+++ b/doc/ssl/SSL_CTX_add_session.pod
-@@ -52,13 +52,13 @@ The following values are returned by all functions:
+Index: openssl-1.0.1f/doc/ssl/SSL_CTX_add_session.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/ssl/SSL_CTX_add_session.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/ssl/SSL_CTX_add_session.pod	2014-02-28 10:18:42.687979221 +0200
+@@ -52,13 +52,13 @@
  
  =over 4
  
@@ -135,11 +122,11 @@ index 82676b2..8e0abd3 100644
   
   The operation succeeded.
  
-diff --git a/doc/ssl/SSL_CTX_load_verify_locations.pod b/doc/ssl/SSL_CTX_load_verify_locations.pod
-index 84a799f..d1d8977 100644
---- a/doc/ssl/SSL_CTX_load_verify_locations.pod
-+++ b/doc/ssl/SSL_CTX_load_verify_locations.pod
-@@ -100,13 +100,13 @@ The following return values can occur:
+Index: openssl-1.0.1f/doc/ssl/SSL_CTX_load_verify_locations.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/ssl/SSL_CTX_load_verify_locations.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/ssl/SSL_CTX_load_verify_locations.pod	2014-02-28 10:19:09.079979218 +0200
+@@ -100,13 +100,13 @@
  
  =over 4
  
@@ -155,29 +142,31 @@ index 84a799f..d1d8977 100644
  
  The operation succeeded.
  
-diff --git a/doc/ssl/SSL_CTX_set_client_CA_list.pod b/doc/ssl/SSL_CTX_set_client_CA_list.pod
-index 632b556..6122a02 100644
---- a/doc/ssl/SSL_CTX_set_client_CA_list.pod
-+++ b/doc/ssl/SSL_CTX_set_client_CA_list.pod
-@@ -66,11 +66,11 @@ values:
+Index: openssl-1.0.1f/doc/ssl/SSL_CTX_set_client_CA_list.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/ssl/SSL_CTX_set_client_CA_list.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/ssl/SSL_CTX_set_client_CA_list.pod	2014-02-28 10:19:42.999979220 +0200
+@@ -66,13 +66,13 @@
  
  =over 4
  
--=item 1
-+=item Z<>1
- 
- The operation succeeded.
- 
 -=item 0
 +=item Z<>0
  
  A failure while manipulating the STACK_OF(X509_NAME) object occurred or
  the X509_NAME could not be extracted from B<cacert>. Check the error stack
-diff --git a/doc/ssl/SSL_CTX_set_session_id_context.pod b/doc/ssl/SSL_CTX_set_session_id_context.pod
-index 58fc685..7c9e515 100644
---- a/doc/ssl/SSL_CTX_set_session_id_context.pod
-+++ b/doc/ssl/SSL_CTX_set_session_id_context.pod
-@@ -64,13 +64,13 @@ return the following values:
+ to find out the reason.
+ 
+-=item 1
++=item Z<>1
+ 
+ The operation succeeded.
+ 
+Index: openssl-1.0.1f/doc/ssl/SSL_CTX_set_session_id_context.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/ssl/SSL_CTX_set_session_id_context.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/ssl/SSL_CTX_set_session_id_context.pod	2014-02-28 10:20:06.495979211 +0200
+@@ -64,13 +64,13 @@
  
  =over 4
  
@@ -193,11 +182,11 @@ index 58fc685..7c9e515 100644
  
  The operation succeeded.
  
-diff --git a/doc/ssl/SSL_CTX_set_ssl_version.pod b/doc/ssl/SSL_CTX_set_ssl_version.pod
-index 254f2b4..e254f96 100644
---- a/doc/ssl/SSL_CTX_set_ssl_version.pod
-+++ b/doc/ssl/SSL_CTX_set_ssl_version.pod
-@@ -42,11 +42,11 @@ and SSL_set_ssl_method():
+Index: openssl-1.0.1f/doc/ssl/SSL_CTX_set_ssl_version.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/ssl/SSL_CTX_set_ssl_version.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/ssl/SSL_CTX_set_ssl_version.pod	2014-02-28 10:20:32.111979208 +0200
+@@ -42,11 +42,11 @@
  
  =over 4
  
@@ -211,20 +200,11 @@ index 254f2b4..e254f96 100644
  
  The operation succeeded.
  
-diff --git a/doc/ssl/SSL_CTX_use_psk_identity_hint.pod b/doc/ssl/SSL_CTX_use_psk_identity_hint.pod
-index b80e25b..31e6626 100644
---- a/doc/ssl/SSL_CTX_use_psk_identity_hint.pod
-+++ b/doc/ssl/SSL_CTX_use_psk_identity_hint.pod
-@@ -81,6 +81,8 @@ SSL_CTX_use_psk_identity_hint() and SSL_use_psk_identity_hint() return
- 
- Return values from the server callback are interpreted as follows:
- 
-+=over 4
-+
- =item > 0
- 
- PSK identity was found and the server callback has provided the PSK
-@@ -94,9 +96,11 @@ data to B<psk> and return the length of the random data, so the
+Index: openssl-1.0.1f/doc/ssl/SSL_CTX_use_psk_identity_hint.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/ssl/SSL_CTX_use_psk_identity_hint.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/ssl/SSL_CTX_use_psk_identity_hint.pod	2014-02-28 10:21:12.351979203 +0200
+@@ -96,7 +96,7 @@
  connection will fail with decryption_error before it will be finished
  completely.
  
@@ -233,34 +213,31 @@ index b80e25b..31e6626 100644
  
  PSK identity was not found. An "unknown_psk_identity" alert message
  will be sent and the connection setup fails.
- 
-+=back
-+
- =cut
-diff --git a/doc/ssl/SSL_accept.pod b/doc/ssl/SSL_accept.pod
-index cc724c0..4915e5a 100644
---- a/doc/ssl/SSL_accept.pod
-+++ b/doc/ssl/SSL_accept.pod
-@@ -44,12 +44,12 @@ The following return values can occur:
+Index: openssl-1.0.1f/doc/ssl/SSL_accept.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/ssl/SSL_accept.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/ssl/SSL_accept.pod	2014-02-28 10:21:51.535979215 +0200
+@@ -44,13 +44,13 @@
  
  =over 4
  
--=item 1
-+=item Z<>1
- 
- The TLS/SSL handshake was successfully completed, a TLS/SSL connection has been
- established.
- 
 -=item 0
 +=item Z<>0
  
  The TLS/SSL handshake was not successful but was shut down controlled and
  by the specifications of the TLS/SSL protocol. Call SSL_get_error() with the
-diff --git a/doc/ssl/SSL_clear.pod b/doc/ssl/SSL_clear.pod
-index d4df1bf..ba192bd 100644
---- a/doc/ssl/SSL_clear.pod
-+++ b/doc/ssl/SSL_clear.pod
-@@ -56,12 +56,12 @@ The following return values can occur:
+ return value B<ret> to find out the reason.
+ 
+-=item 1
++=item Z<>1
+ 
+ The TLS/SSL handshake was successfully completed, a TLS/SSL connection has been
+ established.
+Index: openssl-1.0.1f/doc/ssl/SSL_clear.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/ssl/SSL_clear.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/ssl/SSL_clear.pod	2014-02-28 10:22:13.087979196 +0200
+@@ -56,12 +56,12 @@
  
  =over 4
  
@@ -275,49 +252,51 @@ index d4df1bf..ba192bd 100644
  
  The SSL_clear() operation was successful.
  
-diff --git a/doc/ssl/SSL_connect.pod b/doc/ssl/SSL_connect.pod
-index cc56ebb..61cabb7 100644
---- a/doc/ssl/SSL_connect.pod
-+++ b/doc/ssl/SSL_connect.pod
-@@ -41,12 +41,12 @@ The following return values can occur:
+Index: openssl-1.0.1f/doc/ssl/SSL_connect.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/ssl/SSL_connect.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/ssl/SSL_connect.pod	2014-02-28 10:22:33.991979193 +0200
+@@ -41,13 +41,13 @@
  
  =over 4
  
--=item 1
-+=item Z<>1
- 
- The TLS/SSL handshake was successfully completed, a TLS/SSL connection has been
- established.
- 
 -=item 0
 +=item Z<>0
  
  The TLS/SSL handshake was not successful but was shut down controlled and
  by the specifications of the TLS/SSL protocol. Call SSL_get_error() with the
-diff --git a/doc/ssl/SSL_do_handshake.pod b/doc/ssl/SSL_do_handshake.pod
-index 2435764..beb0dd1 100644
---- a/doc/ssl/SSL_do_handshake.pod
-+++ b/doc/ssl/SSL_do_handshake.pod
-@@ -45,12 +45,12 @@ The following return values can occur:
- 
- =over 4
+ return value B<ret> to find out the reason.
  
 -=item 1
 +=item Z<>1
  
  The TLS/SSL handshake was successfully completed, a TLS/SSL connection has been
  established.
+Index: openssl-1.0.1f/doc/ssl/SSL_do_handshake.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/ssl/SSL_do_handshake.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/ssl/SSL_do_handshake.pod	2014-02-28 10:22:56.887979159 +0200
+@@ -45,13 +45,13 @@
+ 
+ =over 4
  
 -=item 0
 +=item Z<>0
  
  The TLS/SSL handshake was not successful but was shut down controlled and
  by the specifications of the TLS/SSL protocol. Call SSL_get_error() with the
-diff --git a/doc/ssl/SSL_read.pod b/doc/ssl/SSL_read.pod
-index 7038cd2..8ca0ce5 100644
---- a/doc/ssl/SSL_read.pod
-+++ b/doc/ssl/SSL_read.pod
-@@ -86,7 +86,7 @@ The following return values can occur:
+ return value B<ret> to find out the reason.
+ 
+-=item 1
++=item Z<>1
+ 
+ The TLS/SSL handshake was successfully completed, a TLS/SSL connection has been
+ established.
+Index: openssl-1.0.1f/doc/ssl/SSL_read.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/ssl/SSL_read.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/ssl/SSL_read.pod	2014-02-28 10:23:15.303979188 +0200
+@@ -86,7 +86,7 @@
  The read operation was successful; the return value is the number of
  bytes actually read from the TLS/SSL connection.
  
@@ -326,11 +305,11 @@ index 7038cd2..8ca0ce5 100644
  
  The read operation was not successful. The reason may either be a clean
  shutdown due to a "close notify" alert sent by the peer (in which case
-diff --git a/doc/ssl/SSL_session_reused.pod b/doc/ssl/SSL_session_reused.pod
-index da7d062..b09d8a7 100644
---- a/doc/ssl/SSL_session_reused.pod
-+++ b/doc/ssl/SSL_session_reused.pod
-@@ -27,11 +27,11 @@ The following return values can occur:
+Index: openssl-1.0.1f/doc/ssl/SSL_session_reused.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/ssl/SSL_session_reused.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/ssl/SSL_session_reused.pod	2014-02-28 10:23:36.615979186 +0200
+@@ -27,11 +27,11 @@
  
  =over 4
  
@@ -344,11 +323,11 @@ index da7d062..b09d8a7 100644
  
  A session was reused.
  
-diff --git a/doc/ssl/SSL_set_fd.pod b/doc/ssl/SSL_set_fd.pod
-index 7029112..1480871 100644
---- a/doc/ssl/SSL_set_fd.pod
-+++ b/doc/ssl/SSL_set_fd.pod
-@@ -35,11 +35,11 @@ The following return values can occur:
+Index: openssl-1.0.1f/doc/ssl/SSL_set_fd.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/ssl/SSL_set_fd.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/ssl/SSL_set_fd.pod	2014-02-28 10:23:57.599979183 +0200
+@@ -35,11 +35,11 @@
  
  =over 4
  
@@ -362,11 +341,11 @@ index 7029112..1480871 100644
  
  The operation succeeded.
  
-diff --git a/doc/ssl/SSL_set_session.pod b/doc/ssl/SSL_set_session.pod
-index 5f54714..197b521 100644
---- a/doc/ssl/SSL_set_session.pod
-+++ b/doc/ssl/SSL_set_session.pod
-@@ -37,11 +37,11 @@ The following return values can occur:
+Index: openssl-1.0.1f/doc/ssl/SSL_set_session.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/ssl/SSL_set_session.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/ssl/SSL_set_session.pod	2014-02-28 10:24:16.943979181 +0200
+@@ -37,11 +37,11 @@
  
  =over 4
  
@@ -380,26 +359,21 @@ index 5f54714..197b521 100644
  
  The operation succeeded.
  
-diff --git a/doc/ssl/SSL_set_shutdown.pod b/doc/ssl/SSL_set_shutdown.pod
-index 011a022..fe01308 100644
---- a/doc/ssl/SSL_set_shutdown.pod
-+++ b/doc/ssl/SSL_set_shutdown.pod
-@@ -24,7 +24,7 @@ The shutdown state of an ssl connection is a bitmask of:
+Index: openssl-1.0.1f/doc/ssl/SSL_shutdown.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/ssl/SSL_shutdown.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/ssl/SSL_shutdown.pod	2014-02-28 10:25:03.623979175 +0200
+@@ -92,19 +92,19 @@
  
  =over 4
  
 -=item 0
 +=item Z<>0
  
- No shutdown setting, yet.
- 
-diff --git a/doc/ssl/SSL_shutdown.pod b/doc/ssl/SSL_shutdown.pod
-index 89911ac..132ebc5 100644
---- a/doc/ssl/SSL_shutdown.pod
-+++ b/doc/ssl/SSL_shutdown.pod
-@@ -92,19 +92,19 @@ The following return values can occur:
- 
- =over 4
+ The shutdown is not yet finished. Call SSL_shutdown() for a second time,
+ if a bidirectional shutdown shall be performed.
+ The output of L<SSL_get_error(3)|SSL_get_error(3)> may be misleading, as an
+ erroneous SSL_ERROR_SYSCALL may be flagged even though no error occurred.
  
 -=item 1
 +=item Z<>1
@@ -407,24 +381,16 @@ index 89911ac..132ebc5 100644
  The shutdown was successfully completed. The "close notify" alert was sent
  and the peer's "close notify" alert was received.
  
--=item 0
-+=item Z<>0
- 
- The shutdown is not yet finished. Call SSL_shutdown() for a second time,
- if a bidirectional shutdown shall be performed.
- The output of L<SSL_get_error(3)|SSL_get_error(3)> may be misleading, as an
- erroneous SSL_ERROR_SYSCALL may be flagged even though no error occurred.
- 
 -=item -1
 +=item Z<>-1
  
  The shutdown was not successful because a fatal error occurred either
  at the protocol level or a connection failure occurred. It can also occur if
-diff --git a/doc/ssl/SSL_write.pod b/doc/ssl/SSL_write.pod
-index e013c12..a57617f 100644
---- a/doc/ssl/SSL_write.pod
-+++ b/doc/ssl/SSL_write.pod
-@@ -79,7 +79,7 @@ The following return values can occur:
+Index: openssl-1.0.1f/doc/ssl/SSL_write.pod
+===================================================================
+--- openssl-1.0.1f.orig/doc/ssl/SSL_write.pod	2014-01-06 15:47:42.000000000 +0200
++++ openssl-1.0.1f/doc/ssl/SSL_write.pod	2014-02-28 10:25:36.031979168 +0200
+@@ -79,7 +79,7 @@
  The write operation was successful, the return value is the number of
  bytes actually written to the TLS/SSL connection.
  
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-link.patch b/meta/recipes-connectivity/openssl/openssl/openssl-fix-link.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-link.patch
rename to meta/recipes-connectivity/openssl/openssl/openssl-fix-link.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl_fix_for_x32.patch
rename to meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl/shared-libs.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.1e/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl/shared-libs.patch
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
similarity index 81%
rename from meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
index 618ba68..f3c20e8 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
@@ -6,8 +6,6 @@ DEPENDS += "cryptodev-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.0"
-
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
 export DIRS = "crypto ssl apps engines"
@@ -36,13 +34,10 @@ SRC_URI += "file://configure-targets.patch \
             file://initial-aarch64-bits.patch \
             file://find.pl \
             file://openssl-fix-des.pod-error.patch \
-            file://0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch \
-            file://0001-Fix-DTLS-retransmission-from-previous-session.patch \
-            file://0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch \
            "
 
-SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
-SRC_URI[sha256sum] = "f74f15e8c8ff11aa3d5bb5f276d202ec18d7246e95f961db76054199c69c1ae3"
+SRC_URI[md5sum] = "de62b43dfcd858e66a74bee1c834e959"
+SRC_URI[sha256sum] = "53cb818c3b90e507a8348f4f5eaedb05d8bfe5358aabb508b7263cc670c3e028"
 
 PACKAGES =+ " \
 	${PN}-engines \
-- 
1.7.9.5


