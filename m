Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 50DBE65CBB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 07:43:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4B7hUrh000967
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 00:43:30 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 11 May 2016 00:43:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 May 2016 00:43:28 -0700
Message-ID: <19ea0ed27b6ccf9424f34711d9267c02d4504569.1462952554.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1462952554.git.liezhi.yang@windriver.com>
References: <cover.1462952554.git.liezhi.yang@windriver.com>
Subject: [PATCH 1/1] openssl: 1.0.2d -> 1.0.2h (mainly for CVEs)
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
X-List-Received-Date: Wed, 11 May 2016 07:43:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

* CVEs:
  - CVE-2016-0705
  - CVE-2016-0798
  - CVE-2016-0797
  - CVE-2016-0799
  - CVE-2016-0702
  - CVE-2016-0703
  - CVE-2016-0704
  - CVE-2016-2105
  - CVE-2016-2106
  - CVE-2016-2109
  - CVE-2016-2176

* The LICENSE's checksum is changed because of date changes (2011 ->
  2016), the contents are the same.

* Remove backport patches
  - 0001-Add-test-for-CVE-2015-3194.patch
  - CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch
  - CVE-2015-3194-1-Add-PSS-parameter-check.patch
  - CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
  - CVE-2015-3197.patch
  - CVE-2016-0701_1.patch
  - CVE-2016-0701_2.patch
  - CVE-2016-0800.patch
  - CVE-2016-0800_2.patch
  - CVE-2016-0800_3.patch

* Update crypto_use_bigint_in_x86-64_perl.patch

* Add version-script.patch and update block_diginotar.patch (From master branch)

* Update openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
  (From Armin)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../openssl/0001-Add-test-for-CVE-2015-3194.patch  |  66 ---
 ...64-mont5.pl-fix-carry-propagating-bug-CVE.patch | 101 ----
 .../CVE-2015-3194-1-Add-PSS-parameter-check.patch  |  45 --
 ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch |  66 ---
 .../openssl/openssl/CVE-2015-3197.patch            |  63 ---
 .../openssl/openssl/CVE-2016-0701_1.patch          | 102 ----
 .../openssl/openssl/CVE-2016-0701_2.patch          | 156 ------
 .../openssl/openssl/CVE-2016-0800.patch            | 198 -------
 .../openssl/openssl/CVE-2016-0800_2.patch          | 592 ---------------------
 .../openssl/openssl/CVE-2016-0800_3.patch          | 503 -----------------
 .../openssl/crypto_use_bigint_in_x86-64_perl.patch |  14 +-
 .../openssl/debian1.0.2/block_diginotar.patch      |  17 +-
 .../{debian => debian1.0.2}/version-script.patch   |  35 +-
 ...-pointer-dereference-in-EVP_DigestInit_ex.patch |  14 +-
 .../{openssl_1.0.2d.bb => openssl_1.0.2h.bb}       |  18 +-
 15 files changed, 40 insertions(+), 1950 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Add-test-for-CVE-2015-3194.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-1-Add-PSS-parameter-check.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3197.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_1.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_2.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_2.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_3.patch
 rename meta/recipes-connectivity/openssl/openssl/{debian => debian1.0.2}/version-script.patch (99%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2d.bb => openssl_1.0.2h.bb} (73%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Add-test-for-CVE-2015-3194.patch b/meta/recipes-connectivity/openssl/openssl/0001-Add-test-for-CVE-2015-3194.patch
deleted file mode 100644
index 39a2e5a..0000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-Add-test-for-CVE-2015-3194.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 00456fded43eadd4bb94bf675ae4ea5d158a764f Mon Sep 17 00:00:00 2001
-From: "Dr. Stephen Henson" <steve@openssl.org>
-Date: Wed, 4 Nov 2015 13:30:03 +0000
-Subject: [PATCH] Add test for CVE-2015-3194
-
-Reviewed-by: Richard Levitte <levitte@openssl.org>
-
-Upstream-Status: Backport
-
-This patch was imported from 
-https://git.openssl.org/?p=openssl.git;a=commit;h=00456fded43eadd4bb94bf675ae4ea5d158a764f
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- test/certs/pss1.pem | 21 +++++++++++++++++++++
- test/tx509          |  7 +++++++
- 2 files changed, 28 insertions(+)
- create mode 100644 test/certs/pss1.pem
-
-diff --git a/test/certs/pss1.pem b/test/certs/pss1.pem
-new file mode 100644
-index 0000000..29da71d
---- /dev/null
-+++ b/test/certs/pss1.pem
-@@ -0,0 +1,21 @@
-+-----BEGIN CERTIFICATE-----
-+MIIDdjCCAjqgAwIBAgIJANcwZLyfEv7DMD4GCSqGSIb3DQEBCjAxoA0wCwYJYIZI
-+AWUDBAIBoRowGAYJKoZIhvcNAQEIMAsGCWCGSAFlAwQCAaIEAgIA3jAnMSUwIwYD
-+VQQDDBxUZXN0IEludmFsaWQgUFNTIGNlcnRpZmljYXRlMB4XDTE1MTEwNDE2MDIz
-+NVoXDTE1MTIwNDE2MDIzNVowJzElMCMGA1UEAwwcVGVzdCBJbnZhbGlkIFBTUyBj
-+ZXJ0aWZpY2F0ZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMTaM7WH
-+qVCAGAIA+zL1KWvvASTrhlq+1ePdO7wsrWX2KiYoTYrJYTnxhLnn0wrHqApt79nL
-+IBG7cfShyZqFHOY/IzlYPMVt+gPo293gw96Fds5JBsjhjkyGnOyr9OUntFqvxDbT
-+IIFU7o9IdxD4edaqjRv+fegVE+B79pDk4s0ujsk6dULtCg9Rst0ucGFo19mr+b7k
-+dbfn8pZ72ZNDJPueVdrUAWw9oll61UcYfk75XdrLk6JlL41GrYHc8KlfXf43gGQq
-+QfrpHkg4Ih2cI6Wt2nhFGAzrlcorzLliQIUJRIhM8h4IgDfpBpaPdVQLqS2pFbXa
-+5eQjqiyJwak2vJ8CAwEAAaNQME4wHQYDVR0OBBYEFCt180N4oGUt5LbzBwQ4Ia+2
-+4V97MB8GA1UdIwQYMBaAFCt180N4oGUt5LbzBwQ4Ia+24V97MAwGA1UdEwQFMAMB
-+Af8wMQYJKoZIhvcNAQEKMCSgDTALBglghkgBZQMEAgGhDTALBgkqhkiG9w0BAQii
-+BAICAN4DggEBAAjBtm90lGxgddjc4Xu/nbXXFHVs2zVcHv/mqOZoQkGB9r/BVgLb
-+xhHrFZ2pHGElbUYPfifdS9ztB73e1d4J+P29o0yBqfd4/wGAc/JA8qgn6AAEO/Xn
-+plhFeTRJQtLZVl75CkHXgUGUd3h+ADvKtcBuW9dSUncaUrgNKR8u/h/2sMG38RWY
-+DzBddC/66YTa3r7KkVUfW7yqRQfELiGKdcm+bjlTEMsvS+EhHup9CzbpoCx2Fx9p
-+NPtFY3yEObQhmL1JyoCRWqBE75GzFPbRaiux5UpEkns+i3trkGssZzsOuVqHNTNZ
-+lC9+9hPHIoc9UMmAQNo1vGIW3NWVoeGbaJ8=
-+-----END CERTIFICATE-----
-diff --git a/test/tx509 b/test/tx509
-index 0ce3b52..77f5cac 100644
---- a/test/tx509
-+++ b/test/tx509
-@@ -74,5 +74,12 @@ if [ $? != 0 ]; then exit 1; fi
- cmp x509-f.p x509-ff.p3
- if [ $? != 0 ]; then exit 1; fi
- 
-+echo "Parsing test certificates"
-+
-+$cmd -in certs/pss1.pem -text -noout >/dev/null
-+if [ $? != 0 ]; then exit 1; fi
-+
-+echo OK
-+
- /bin/rm -f x509-f.* x509-ff.* x509-fff.*
- exit 0
--- 
-2.3.5
-
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch
deleted file mode 100644
index 125016a..0000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From d73cc256c8e256c32ed959456101b73ba9842f72 Mon Sep 17 00:00:00 2001
-From: Andy Polyakov <appro@openssl.org>
-Date: Tue, 1 Dec 2015 09:00:32 +0100
-Subject: [PATCH] bn/asm/x86_64-mont5.pl: fix carry propagating bug
- (CVE-2015-3193).
-
-Reviewed-by: Richard Levitte <levitte@openssl.org>
-(cherry picked from commit e7c078db57908cbf16074c68034977565ffaf107)
-
-Upstream-Status: Backport
-
-This patch was imported from 
-https://git.openssl.org/?p=openssl.git;a=commit;h=d73cc256c8e256c32ed959456101b73ba9842f72
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- crypto/bn/asm/x86_64-mont5.pl | 22 +++++++++++++++++++---
- crypto/bn/bntest.c            | 18 ++++++++++++++++++
- 2 files changed, 37 insertions(+), 3 deletions(-)
-
-Index: openssl-1.0.2d/crypto/bn/asm/x86_64-mont5.pl
-===================================================================
---- openssl-1.0.2d.orig/crypto/bn/asm/x86_64-mont5.pl
-+++ openssl-1.0.2d/crypto/bn/asm/x86_64-mont5.pl
-@@ -1779,6 +1779,15 @@ sqr8x_reduction:
- .align	32
- .L8x_tail_done:
- 	add	(%rdx),%r8		# can this overflow?
-+	adc	\$0,%r9
-+	adc	\$0,%r10
-+	adc	\$0,%r11
-+	adc	\$0,%r12
-+	adc	\$0,%r13
-+	adc	\$0,%r14
-+	adc	\$0,%r15		# can't overflow, because we
-+					# started with "overhung" part
-+					# of multiplication
- 	xor	%rax,%rax
- 
- 	neg	$carry
-@@ -3125,6 +3134,15 @@ sqrx8x_reduction:
- .align	32
- .Lsqrx8x_tail_done:
- 	add	24+8(%rsp),%r8		# can this overflow?
-+	adc	\$0,%r9
-+	adc	\$0,%r10
-+	adc	\$0,%r11
-+	adc	\$0,%r12
-+	adc	\$0,%r13
-+	adc	\$0,%r14
-+	adc	\$0,%r15		# can't overflow, because we
-+					# started with "overhung" part
-+					# of multiplication
- 	mov	$carry,%rax		# xor	%rax,%rax
- 
- 	sub	16+8(%rsp),$carry	# mov 16(%rsp),%cf
-@@ -3168,13 +3186,11 @@ my ($rptr,$nptr)=("%rdx","%rbp");
- my @ri=map("%r$_",(10..13));
- my @ni=map("%r$_",(14..15));
- $code.=<<___;
--	xor	%rbx,%rbx
-+	xor	%ebx,%ebx
- 	sub	%r15,%rsi		# compare top-most words
- 	adc	%rbx,%rbx
- 	mov	%rcx,%r10		# -$num
--	.byte	0x67
- 	or	%rbx,%rax
--	.byte	0x67
- 	mov	%rcx,%r9		# -$num
- 	xor	\$1,%rax
- 	sar	\$3+2,%rcx		# cf=0
-Index: openssl-1.0.2d/crypto/bn/bntest.c
-===================================================================
---- openssl-1.0.2d.orig/crypto/bn/bntest.c
-+++ openssl-1.0.2d/crypto/bn/bntest.c
-@@ -1027,6 +1027,24 @@ int test_mod_exp_mont_consttime(BIO *bp,
-             return 0;
-         }
-     }
-+
-+    /* Regression test for carry propagation bug in sqr8x_reduction */
-+    BN_hex2bn(&a, "050505050505");
-+    BN_hex2bn(&b, "02");
-+    BN_hex2bn(&c,
-+        "4141414141414141414141274141414141414141414141414141414141414141"
-+        "4141414141414141414141414141414141414141414141414141414141414141"
-+        "4141414141414141414141800000000000000000000000000000000000000000"
-+        "0000000000000000000000000000000000000000000000000000000000000000"
-+        "0000000000000000000000000000000000000000000000000000000000000000"
-+        "0000000000000000000000000000000000000000000000000000000001");
-+    BN_mod_exp(d, a, b, c, ctx);
-+    BN_mul(e, a, a, ctx);
-+    if (BN_cmp(d, e)) {
-+        fprintf(stderr, "BN_mod_exp and BN_mul produce different results!\n");
-+        return 0;
-+    }
-+
-     BN_free(a);
-     BN_free(b);
-     BN_free(c);
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-1-Add-PSS-parameter-check.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-1-Add-PSS-parameter-check.patch
deleted file mode 100644
index 13d4891..0000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-1-Add-PSS-parameter-check.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From c394a488942387246653833359a5c94b5832674e Mon Sep 17 00:00:00 2001
-From: "Dr. Stephen Henson" <steve@openssl.org>
-Date: Fri, 2 Oct 2015 12:35:19 +0100
-Subject: [PATCH] Add PSS parameter check.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Avoid seg fault by checking mgf1 parameter is not NULL. This can be
-triggered during certificate verification so could be a DoS attack
-against a client or a server enabling client authentication.
-
-Thanks to Loïc Jonas Etienne (Qnective AG) for discovering this bug.
-
-CVE-2015-3194
-
-Reviewed-by: Richard Levitte <levitte@openssl.org>
-
-Upstream-Status: Backport
-
-This patch was imported from 
-https://git.openssl.org/?p=openssl.git;a=commit;h=c394a488942387246653833359a5c94b5832674e
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- crypto/rsa/rsa_ameth.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/crypto/rsa/rsa_ameth.c b/crypto/rsa/rsa_ameth.c
-index ca3922e..4e06218 100644
---- a/crypto/rsa/rsa_ameth.c
-+++ b/crypto/rsa/rsa_ameth.c
-@@ -268,7 +268,7 @@ static X509_ALGOR *rsa_mgf1_decode(X509_ALGOR *alg)
- {
-     const unsigned char *p;
-     int plen;
--    if (alg == NULL)
-+    if (alg == NULL || alg->parameter == NULL)
-         return NULL;
-     if (OBJ_obj2nid(alg->algorithm) != NID_mgf1)
-         return NULL;
--- 
-2.3.5
-
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
deleted file mode 100644
index 6fc4d0e..0000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From cc598f321fbac9c04da5766243ed55d55948637d Mon Sep 17 00:00:00 2001
-From: "Dr. Stephen Henson" <steve@openssl.org>
-Date: Tue, 10 Nov 2015 19:03:07 +0000
-Subject: [PATCH] Fix leak with ASN.1 combine.
-
-When parsing a combined structure pass a flag to the decode routine
-so on error a pointer to the parent structure is not zeroed as
-this will leak any additional components in the parent.
-
-This can leak memory in any application parsing PKCS#7 or CMS structures.
-
-CVE-2015-3195.
-
-Thanks to Adam Langley (Google/BoringSSL) for discovering this bug using
-libFuzzer.
-
-PR#4131
-
-Reviewed-by: Richard Levitte <levitte@openssl.org>
-
-Upstream-Status: Backport
-
-This patch was imported from
-https://git.openssl.org/?p=openssl.git;a=commit;h=cc598f321fbac9c04da5766243ed55d55948637d
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- crypto/asn1/tasn_dec.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/crypto/asn1/tasn_dec.c b/crypto/asn1/tasn_dec.c
-index febf605..9256049 100644
---- a/crypto/asn1/tasn_dec.c
-+++ b/crypto/asn1/tasn_dec.c
-@@ -180,6 +180,8 @@ int ASN1_item_ex_d2i(ASN1_VALUE **pval, const unsigned char **in, long len,
-     int otag;
-     int ret = 0;
-     ASN1_VALUE **pchptr, *ptmpval;
-+    int combine = aclass & ASN1_TFLG_COMBINE;
-+    aclass &= ~ASN1_TFLG_COMBINE;
-     if (!pval)
-         return 0;
-     if (aux && aux->asn1_cb)
-@@ -500,7 +502,8 @@ int ASN1_item_ex_d2i(ASN1_VALUE **pval, const unsigned char **in, long len,
-  auxerr:
-     ASN1err(ASN1_F_ASN1_ITEM_EX_D2I, ASN1_R_AUX_ERROR);
-  err:
--    ASN1_item_ex_free(pval, it);
-+    if (combine == 0)
-+        ASN1_item_ex_free(pval, it);
-     if (errtt)
-         ERR_add_error_data(4, "Field=", errtt->field_name,
-                            ", Type=", it->sname);
-@@ -689,7 +692,7 @@ static int asn1_template_noexp_d2i(ASN1_VALUE **val,
-     } else {
-         /* Nothing special */
-         ret = ASN1_item_ex_d2i(val, &p, len, ASN1_ITEM_ptr(tt->item),
--                               -1, 0, opt, ctx);
-+                               -1, tt->flags & ASN1_TFLG_COMBINE, opt, ctx);
-         if (!ret) {
-             ASN1err(ASN1_F_ASN1_TEMPLATE_NOEXP_D2I, ERR_R_NESTED_ASN1_ERROR);
-             goto err;
--- 
-2.3.5
-
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3197.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3197.patch
deleted file mode 100644
index dd288c9..0000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3197.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From d81a1600588b726c2bdccda7efad3cc7a87d6245 Mon Sep 17 00:00:00 2001
-From: Viktor Dukhovni <openssl-users@dukhovni.org>
-Date: Wed, 30 Dec 2015 22:44:51 -0500
-Subject: [PATCH] Better SSLv2 cipher-suite enforcement
-
-Based on patch by: Nimrod Aviram <nimrod.aviram@gmail.com>
-
-CVE-2015-3197
-
-Reviewed-by: Tim Hudson <tjh@openssl.org>
-Reviewed-by: Richard Levitte <levitte@openssl.org>
-
-Upstream-Status: Backport
-https://github.com/openssl/openssl/commit/d81a1600588b726c2bdccda7efad3cc7a87d6245
-
-CVE: CVE-2015-3197
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- ssl/s2_srvr.c | 15 +++++++++++++--
- 1 file changed, 13 insertions(+), 2 deletions(-)
-
-Index: openssl-1.0.2d/ssl/s2_srvr.c
-===================================================================
---- openssl-1.0.2d.orig/ssl/s2_srvr.c
-+++ openssl-1.0.2d/ssl/s2_srvr.c
-@@ -402,7 +402,7 @@ static int get_client_master_key(SSL *s)
-         }
- 
-         cp = ssl2_get_cipher_by_char(p);
--        if (cp == NULL) {
-+        if (cp == NULL || sk_SSL_CIPHER_find(s->session->ciphers, cp) < 0) {
-             ssl2_return_error(s, SSL2_PE_NO_CIPHER);
-             SSLerr(SSL_F_GET_CLIENT_MASTER_KEY, SSL_R_NO_CIPHER_MATCH);
-             return (-1);
-@@ -687,8 +687,12 @@ static int get_client_hello(SSL *s)
-             prio = cs;
-             allow = cl;
-         }
-+
-+        /* Generate list of SSLv2 ciphers shared between client and server */
-         for (z = 0; z < sk_SSL_CIPHER_num(prio); z++) {
--            if (sk_SSL_CIPHER_find(allow, sk_SSL_CIPHER_value(prio, z)) < 0) {
-+            const SSL_CIPHER *cp = sk_SSL_CIPHER_value(prio, z);
-+            if ((cp->algorithm_ssl & SSL_SSLV2) == 0 ||
-+                sk_SSL_CIPHER_find(allow, cp) < 0) {
-                 (void)sk_SSL_CIPHER_delete(prio, z);
-                 z--;
-             }
-@@ -697,6 +701,13 @@ static int get_client_hello(SSL *s)
-             sk_SSL_CIPHER_free(s->session->ciphers);
-             s->session->ciphers = prio;
-         }
-+
-+        /* Make sure we have at least one cipher in common */
-+        if (sk_SSL_CIPHER_num(s->session->ciphers) == 0) {
-+            ssl2_return_error(s, SSL2_PE_NO_CIPHER);
-+            SSLerr(SSL_F_GET_CLIENT_HELLO, SSL_R_NO_CIPHER_MATCH);
-+            return -1;
-+        }
-         /*
-          * s->session->ciphers should now have a list of ciphers that are on
-          * both the client and server. This list is ordered by the order the
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_1.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_1.patch
deleted file mode 100644
index cf2d9a7..0000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_1.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 878e2c5b13010329c203f309ed0c8f2113f85648 Mon Sep 17 00:00:00 2001
-From: Matt Caswell <matt@openssl.org>
-Date: Mon, 18 Jan 2016 11:31:58 +0000
-Subject: [PATCH] Prevent small subgroup attacks on DH/DHE
-
-Historically OpenSSL only ever generated DH parameters based on "safe"
-primes. More recently (in version 1.0.2) support was provided for
-generating X9.42 style parameter files such as those required for RFC
-5114 support. The primes used in such files may not be "safe". Where an
-application is using DH configured with parameters based on primes that
-are not "safe" then an attacker could use this fact to find a peer's
-private DH exponent. This attack requires that the attacker complete
-multiple handshakes in which the peer uses the same DH exponent.
-
-A simple mitigation is to ensure that y^q (mod p) == 1
-
-CVE-2016-0701 (fix part 1 of 2)
-
-Issue reported by Antonio Sanso.
-
-Reviewed-by: Viktor Dukhovni <viktor@openssl.org>
-
-Upstream-Status: Backport
-
-https://github.com/openssl/openssl/commit/878e2c5b13010329c203f309ed0c8f2113f85648
-
-CVE: CVE-2016-0701
-Signed-of-by: Armin Kuster <akuster@mvisa.com>
-
----
- crypto/dh/dh.h       |  1 +
- crypto/dh/dh_check.c | 35 +++++++++++++++++++++++++----------
- 2 files changed, 26 insertions(+), 10 deletions(-)
-
-diff --git a/crypto/dh/dh.h b/crypto/dh/dh.h
-index b177673..5498a9d 100644
---- a/crypto/dh/dh.h
-+++ b/crypto/dh/dh.h
-@@ -174,6 +174,7 @@ struct dh_st {
- /* DH_check_pub_key error codes */
- # define DH_CHECK_PUBKEY_TOO_SMALL       0x01
- # define DH_CHECK_PUBKEY_TOO_LARGE       0x02
-+# define DH_CHECK_PUBKEY_INVALID         0x03
- 
- /*
-  * primes p where (p-1)/2 is prime too are called "safe"; we define this for
-diff --git a/crypto/dh/dh_check.c b/crypto/dh/dh_check.c
-index 347467c..5adedc0 100644
---- a/crypto/dh/dh_check.c
-+++ b/crypto/dh/dh_check.c
-@@ -151,23 +151,38 @@ int DH_check(const DH *dh, int *ret)
- int DH_check_pub_key(const DH *dh, const BIGNUM *pub_key, int *ret)
- {
-     int ok = 0;
--    BIGNUM *q = NULL;
-+    BIGNUM *tmp = NULL;
-+    BN_CTX *ctx = NULL;
- 
-     *ret = 0;
--    q = BN_new();
--    if (q == NULL)
-+    ctx = BN_CTX_new();
-+    if (ctx == NULL)
-         goto err;
--    BN_set_word(q, 1);
--    if (BN_cmp(pub_key, q) <= 0)
-+    BN_CTX_start(ctx);
-+    tmp = BN_CTX_get(ctx);
-+    if (tmp == NULL)
-+        goto err;
-+    BN_set_word(tmp, 1);
-+    if (BN_cmp(pub_key, tmp) <= 0)
-         *ret |= DH_CHECK_PUBKEY_TOO_SMALL;
--    BN_copy(q, dh->p);
--    BN_sub_word(q, 1);
--    if (BN_cmp(pub_key, q) >= 0)
-+    BN_copy(tmp, dh->p);
-+    BN_sub_word(tmp, 1);
-+    if (BN_cmp(pub_key, tmp) >= 0)
-         *ret |= DH_CHECK_PUBKEY_TOO_LARGE;
- 
-+    if (dh->q != NULL) {
-+        /* Check pub_key^q == 1 mod p */
-+        if (!BN_mod_exp(tmp, pub_key, dh->q, dh->p, ctx))
-+            goto err;
-+        if (!BN_is_one(tmp))
-+            *ret |= DH_CHECK_PUBKEY_INVALID;
-+    }
-+
-     ok = 1;
-  err:
--    if (q != NULL)
--        BN_free(q);
-+    if (ctx != NULL) {
-+        BN_CTX_end(ctx);
-+        BN_CTX_free(ctx);
-+    }
-     return (ok);
- }
--- 
-2.3.5
-
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_2.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_2.patch
deleted file mode 100644
index 05caf0a..0000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_2.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-From c5b831f21d0d29d1e517d139d9d101763f60c9a2 Mon Sep 17 00:00:00 2001
-From: Matt Caswell <matt@openssl.org>
-Date: Thu, 17 Dec 2015 02:57:20 +0000
-Subject: [PATCH] Always generate DH keys for ephemeral DH cipher suites
-
-Modified version of the commit ffaef3f15 in the master branch by Stephen
-Henson. This makes the SSL_OP_SINGLE_DH_USE option a no-op and always
-generates a new DH key for every handshake regardless.
-
-CVE-2016-0701 (fix part 2 or 2)
-
-Issue reported by Antonio Sanso
-
-Reviewed-by: Viktor Dukhovni <viktor@openssl.org>
-
-Upstream-Status: Backport
-
-https://github.com/openssl/openssl/commit/c5b831f21d0d29d1e517d139d9d101763f60c9a2
-
-CVE: CVE-2016-0701 #2
-Signed-of-by: Armin Kuster <akuster@mvisa.com>
-
----
- doc/ssl/SSL_CTX_set_tmp_dh_callback.pod | 29 +++++------------------------
- ssl/s3_lib.c                            | 14 --------------
- ssl/s3_srvr.c                           | 17 +++--------------
- ssl/ssl.h                               |  2 +-
- 4 files changed, 9 insertions(+), 53 deletions(-)
-
-Index: openssl-1.0.2d/doc/ssl/SSL_CTX_set_tmp_dh_callback.pod
-===================================================================
---- openssl-1.0.2d.orig/doc/ssl/SSL_CTX_set_tmp_dh_callback.pod
-+++ openssl-1.0.2d/doc/ssl/SSL_CTX_set_tmp_dh_callback.pod
-@@ -48,25 +48,8 @@ even if he gets hold of the normal (cert
- only used for signing.
- 
- In order to perform a DH key exchange the server must use a DH group
--(DH parameters) and generate a DH key.
--The server will always generate a new DH key during the negotiation
--if either the DH parameters are supplied via callback or the
--SSL_OP_SINGLE_DH_USE option of SSL_CTX_set_options(3) is set (or both).
--It will  immediately create a DH key if DH parameters are supplied via
--SSL_CTX_set_tmp_dh() and SSL_OP_SINGLE_DH_USE is not set.
--In this case,
--it may happen that a key is generated on initialization without later
--being needed, while on the other hand the computer time during the
--negotiation is being saved.
--
--If "strong" primes were used to generate the DH parameters, it is not strictly
--necessary to generate a new key for each handshake but it does improve forward
--secrecy. If it is not assured that "strong" primes were used,
--SSL_OP_SINGLE_DH_USE must be used in order to prevent small subgroup
--attacks. Always using SSL_OP_SINGLE_DH_USE has an impact on the
--computer time needed during negotiation, but it is not very large, so
--application authors/users should consider always enabling this option.
--The option is required to implement perfect forward secrecy (PFS).
-+(DH parameters) and generate a DH key. The server will always generate
-+a new DH key during the negotiation.
- 
- As generating DH parameters is extremely time consuming, an application
- should not generate the parameters on the fly but supply the parameters.
-@@ -93,10 +76,9 @@ can supply the DH parameters via a callb
- Previous versions of the callback used B<is_export> and B<keylength>
- parameters to control parameter generation for export and non-export
- cipher suites. Modern servers that do not support export ciphersuites
--are advised to either use SSL_CTX_set_tmp_dh() in combination with
--SSL_OP_SINGLE_DH_USE, or alternatively, use the callback but ignore
--B<keylength> and B<is_export> and simply supply at least 2048-bit
--parameters in the callback.
-+are advised to either use SSL_CTX_set_tmp_dh() or alternatively, use
-+the callback but ignore B<keylength> and B<is_export> and simply
-+supply at least 2048-bit parameters in the callback.
- 
- =head1 EXAMPLES
- 
-@@ -128,7 +110,6 @@ partly left out.)
-  if (SSL_CTX_set_tmp_dh(ctx, dh_2048) != 1) {
-    /* Error. */
-  }
-- SSL_CTX_set_options(ctx, SSL_OP_SINGLE_DH_USE);
-  ...
- 
- =head1 RETURN VALUES
-Index: openssl-1.0.2d/ssl/s3_lib.c
-===================================================================
---- openssl-1.0.2d.orig/ssl/s3_lib.c
-+++ openssl-1.0.2d/ssl/s3_lib.c
-@@ -3206,13 +3206,6 @@ long ssl3_ctrl(SSL *s, int cmd, long lar
-                 SSLerr(SSL_F_SSL3_CTRL, ERR_R_DH_LIB);
-                 return (ret);
-             }
--            if (!(s->options & SSL_OP_SINGLE_DH_USE)) {
--                if (!DH_generate_key(dh)) {
--                    DH_free(dh);
--                    SSLerr(SSL_F_SSL3_CTRL, ERR_R_DH_LIB);
--                    return (ret);
--                }
--            }
-             if (s->cert->dh_tmp != NULL)
-                 DH_free(s->cert->dh_tmp);
-             s->cert->dh_tmp = dh;
-@@ -3710,13 +3703,6 @@ long ssl3_ctx_ctrl(SSL_CTX *ctx, int cmd
-                 SSLerr(SSL_F_SSL3_CTX_CTRL, ERR_R_DH_LIB);
-                 return 0;
-             }
--            if (!(ctx->options & SSL_OP_SINGLE_DH_USE)) {
--                if (!DH_generate_key(new)) {
--                    SSLerr(SSL_F_SSL3_CTX_CTRL, ERR_R_DH_LIB);
--                    DH_free(new);
--                    return 0;
--                }
--            }
-             if (cert->dh_tmp != NULL)
-                 DH_free(cert->dh_tmp);
-             cert->dh_tmp = new;
-Index: openssl-1.0.2d/ssl/s3_srvr.c
-===================================================================
---- openssl-1.0.2d.orig/ssl/s3_srvr.c
-+++ openssl-1.0.2d/ssl/s3_srvr.c
-@@ -1684,20 +1684,9 @@ int ssl3_send_server_key_exchange(SSL *s
-             }
- 
-             s->s3->tmp.dh = dh;
--            if ((dhp->pub_key == NULL ||
--                 dhp->priv_key == NULL ||
--                 (s->options & SSL_OP_SINGLE_DH_USE))) {
--                if (!DH_generate_key(dh)) {
--                    SSLerr(SSL_F_SSL3_SEND_SERVER_KEY_EXCHANGE, ERR_R_DH_LIB);
--                    goto err;
--                }
--            } else {
--                dh->pub_key = BN_dup(dhp->pub_key);
--                dh->priv_key = BN_dup(dhp->priv_key);
--                if ((dh->pub_key == NULL) || (dh->priv_key == NULL)) {
--                    SSLerr(SSL_F_SSL3_SEND_SERVER_KEY_EXCHANGE, ERR_R_DH_LIB);
--                    goto err;
--                }
-+            if (!DH_generate_key(dh)) {
-+                SSLerr(SSL_F_SSL3_SEND_SERVER_KEY_EXCHANGE, ERR_R_DH_LIB);
-+                goto err;
-             }
-             r[0] = dh->p;
-             r[1] = dh->g;
-Index: openssl-1.0.2d/ssl/ssl.h
-===================================================================
---- openssl-1.0.2d.orig/ssl/ssl.h
-+++ openssl-1.0.2d/ssl/ssl.h
-@@ -625,7 +625,7 @@ struct ssl_session_st {
- # define SSL_OP_ALLOW_UNSAFE_LEGACY_RENEGOTIATION        0x00040000L
- /* If set, always create a new key when using tmp_ecdh parameters */
- # define SSL_OP_SINGLE_ECDH_USE                          0x00080000L
--/* If set, always create a new key when using tmp_dh parameters */
-+/* Does nothing: retained for compatibility */
- # define SSL_OP_SINGLE_DH_USE                            0x00100000L
- /* Does nothing: retained for compatibiity */
- # define SSL_OP_EPHEMERAL_RSA                            0x0
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800.patch
deleted file mode 100644
index e5635fe..0000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800.patch
+++ /dev/null
@@ -1,198 +0,0 @@
-From 9dfd2be8a1761fffd152a92d8f1b356ad667eea7 Mon Sep 17 00:00:00 2001
-From: Viktor Dukhovni <openssl-users@dukhovni.org>
-Date: Wed, 17 Feb 2016 21:07:48 -0500
-Subject: [PATCH] Disable SSLv2 default build, default negotiation and weak
- ciphers.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-SSLv2 is by default disabled at build-time.  Builds that are not
-configured with "enable-ssl2" will not support SSLv2.  Even if
-"enable-ssl2" is used, users who want to negotiate SSLv2 via the
-version-flexible SSLv23_method() will need to explicitly call either
-of:
-
-    SSL_CTX_clear_options(ctx, SSL_OP_NO_SSLv2);
-or
-    SSL_clear_options(ssl, SSL_OP_NO_SSLv2);
-
-as appropriate.  Even if either of those is used, or the application
-explicitly uses the version-specific SSLv2_method() or its client
-or server variants, SSLv2 ciphers vulnerable to exhaustive search
-key recovery have been removed.  Specifically, the SSLv2 40-bit
-EXPORT ciphers, and SSLv2 56-bit DES are no longer available.
-
-Mitigation for CVE-2016-0800
-
-Reviewed-by: Emilia Käsper <emilia@openssl.org>
-
-Upstream-Status: Backport
-
-https://git.openssl.org/?p=openssl.git;a=commit;h=9dfd2be8a1761fffd152a92d8f1b356ad667eea7
-
-CVE: CVE-2016-0800
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- CHANGES        | 17 +++++++++++++++++
- Configure      |  3 ++-
- NEWS           |  2 +-
- ssl/s2_lib.c   |  6 ++++++
- ssl/ssl_conf.c | 10 +++++++++-
- ssl/ssl_lib.c  |  7 +++++++
- 6 files changed, 42 insertions(+), 3 deletions(-)
-
-Index: openssl-1.0.2d/Configure
-===================================================================
---- openssl-1.0.2d.orig/Configure
-+++ openssl-1.0.2d/Configure
-@@ -847,9 +847,10 @@ my %disabled = ( # "what"         => "co
- 		 "md2"            => "default",
- 		 "rc5"            => "default",
- 		 "rfc3779"	  => "default",
--		 "sctp"       => "default",
-+		 "sctp"           => "default",
- 		 "shared"         => "default",
- 		 "ssl-trace"	  => "default",
-+		 "ssl2"           => "default",
- 		 "store"	  => "experimental",
- 		 "unit-test"	  => "default",
- 		 "zlib"           => "default",
-Index: openssl-1.0.2d/ssl/s2_lib.c
-===================================================================
---- openssl-1.0.2d.orig/ssl/s2_lib.c
-+++ openssl-1.0.2d/ssl/s2_lib.c
-@@ -156,6 +156,7 @@ OPENSSL_GLOBAL const SSL_CIPHER ssl2_cip
-      128,
-      },
- 
-+# if 0
- /* RC4_128_EXPORT40_WITH_MD5 */
-     {
-      1,
-@@ -171,6 +172,7 @@ OPENSSL_GLOBAL const SSL_CIPHER ssl2_cip
-      40,
-      128,
-      },
-+# endif
- 
- /* RC2_128_CBC_WITH_MD5 */
-     {
-@@ -188,6 +190,7 @@ OPENSSL_GLOBAL const SSL_CIPHER ssl2_cip
-      128,
-      },
- 
-+# if 0
- /* RC2_128_CBC_EXPORT40_WITH_MD5 */
-     {
-      1,
-@@ -203,6 +206,7 @@ OPENSSL_GLOBAL const SSL_CIPHER ssl2_cip
-      40,
-      128,
-      },
-+# endif
- 
- # ifndef OPENSSL_NO_IDEA
- /* IDEA_128_CBC_WITH_MD5 */
-@@ -222,6 +226,7 @@ OPENSSL_GLOBAL const SSL_CIPHER ssl2_cip
-      },
- # endif
- 
-+# if 0
- /* DES_64_CBC_WITH_MD5 */
-     {
-      1,
-@@ -237,6 +242,7 @@ OPENSSL_GLOBAL const SSL_CIPHER ssl2_cip
-      56,
-      56,
-      },
-+# endif
- 
- /* DES_192_EDE3_CBC_WITH_MD5 */
-     {
-Index: openssl-1.0.2d/ssl/ssl_conf.c
-===================================================================
---- openssl-1.0.2d.orig/ssl/ssl_conf.c
-+++ openssl-1.0.2d/ssl/ssl_conf.c
-@@ -330,11 +330,19 @@ static int cmd_Protocol(SSL_CONF_CTX *cc
-         SSL_FLAG_TBL_INV("TLSv1.1", SSL_OP_NO_TLSv1_1),
-         SSL_FLAG_TBL_INV("TLSv1.2", SSL_OP_NO_TLSv1_2)
-     };
-+    int ret;
-+    int sslv2off;
-+
-     if (!(cctx->flags & SSL_CONF_FLAG_FILE))
-         return -2;
-     cctx->tbl = ssl_protocol_list;
-     cctx->ntbl = sizeof(ssl_protocol_list) / sizeof(ssl_flag_tbl);
--    return CONF_parse_list(value, ',', 1, ssl_set_option_list, cctx);
-+
-+    sslv2off = *cctx->poptions & SSL_OP_NO_SSLv2;
-+    ret = CONF_parse_list(value, ',', 1, ssl_set_option_list, cctx);
-+    /* Never turn on SSLv2 through configuration */
-+    *cctx->poptions |= sslv2off;
-+    return ret;
- }
- 
- static int cmd_Options(SSL_CONF_CTX *cctx, const char *value)
-Index: openssl-1.0.2d/ssl/ssl_lib.c
-===================================================================
---- openssl-1.0.2d.orig/ssl/ssl_lib.c
-+++ openssl-1.0.2d/ssl/ssl_lib.c
-@@ -2052,6 +2052,13 @@ SSL_CTX *SSL_CTX_new(const SSL_METHOD *m
-      */
-     ret->options |= SSL_OP_LEGACY_SERVER_CONNECT;
- 
-+    /*
-+     * Disable SSLv2 by default, callers that want to enable SSLv2 will have to
-+     * explicitly clear this option via either of SSL_CTX_clear_options() or
-+     * SSL_clear_options().
-+     */
-+    ret->options |= SSL_OP_NO_SSLv2;
-+
-     return (ret);
-  err:
-     SSLerr(SSL_F_SSL_CTX_NEW, ERR_R_MALLOC_FAILURE);
-Index: openssl-1.0.2d/CHANGES
-===================================================================
---- openssl-1.0.2d.orig/CHANGES
-+++ openssl-1.0.2d/CHANGES
-@@ -2,6 +2,25 @@
-  OpenSSL CHANGES
-  _______________
- 
-+ 
-+  * Disable SSLv2 default build, default negotiation and weak ciphers.  SSLv2
-+    is by default disabled at build-time.  Builds that are not configured with
-+    "enable-ssl2" will not support SSLv2.  Even if "enable-ssl2" is used,
-+    users who want to negotiate SSLv2 via the version-flexible SSLv23_method()
-+    will need to explicitly call either of:
-+
-+        SSL_CTX_clear_options(ctx, SSL_OP_NO_SSLv2);
-+    or
-+        SSL_clear_options(ssl, SSL_OP_NO_SSLv2);
-+
-+    as appropriate.  Even if either of those is used, or the application
-+    explicitly uses the version-specific SSLv2_method() or its client and
-+    server variants, SSLv2 ciphers vulnerable to exhaustive search key
-+    recovery have been removed.  Specifically, the SSLv2 40-bit EXPORT
-+    ciphers, and SSLv2 56-bit DES are no longer available.
-+    [Viktor Dukhovni]
-+    
-+
-  Changes between 1.0.2c and 1.0.2d [9 Jul 2015]
- 
-   *) Alternate chains certificate forgery
-Index: openssl-1.0.2d/NEWS
-===================================================================
---- openssl-1.0.2d.orig/NEWS
-+++ openssl-1.0.2d/NEWS
-@@ -1,6 +1,7 @@
- 
-   NEWS
-   ====
-+  Disable SSLv2 default build, default negotiation and weak ciphers.
- 
-   This file gives a brief overview of the major changes between each OpenSSL
-   release. For more details please read the CHANGES file.
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_2.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_2.patch
deleted file mode 100644
index de89d08..0000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_2.patch
+++ /dev/null
@@ -1,592 +0,0 @@
-From 021fb42dd0cf2bf985b0e26ca50418eb42c00d09 Mon Sep 17 00:00:00 2001
-From: Viktor Dukhovni <openssl-users@dukhovni.org>
-Date: Wed, 17 Feb 2016 23:38:55 -0500
-Subject: [PATCH] Bring SSL method documentation up to date
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Reviewed-by: Emilia Käsper <emilia@openssl.org>
-
-Upstream-Status: Backport
-
-https://git.openssl.org/?p=openssl.git;a=commit;h=021fb42dd0cf2bf985b0e26ca50418eb42c00d09
-
-CVE: CVE-2016-0800 #2 patch
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- doc/apps/ciphers.pod            |  29 ++++---
- doc/apps/s_client.pod           |  12 +--
- doc/apps/s_server.pod           |   8 +-
- doc/ssl/SSL_CONF_cmd.pod        |  33 ++++----
- doc/ssl/SSL_CTX_new.pod         | 168 ++++++++++++++++++++++++++++------------
- doc/ssl/SSL_CTX_set_options.pod |  10 +++
- doc/ssl/ssl.pod                 |  77 ++++++++++++++----
- 7 files changed, 226 insertions(+), 111 deletions(-)
-
-diff --git a/doc/apps/ciphers.pod b/doc/apps/ciphers.pod
-index 1c26e3b..8038b05 100644
---- a/doc/apps/ciphers.pod
-+++ b/doc/apps/ciphers.pod
-@@ -38,25 +38,21 @@ SSL v2 and for SSL v3/TLS v1.
- 
- Like B<-v>, but include cipher suite codes in output (hex format).
- 
--=item B<-ssl3>
-+=item B<-ssl3>, B<-tls1>
- 
--only include SSL v3 ciphers.
-+This lists ciphers compatible with any of SSLv3, TLSv1, TLSv1.1 or TLSv1.2.
- 
- =item B<-ssl2>
- 
--only include SSL v2 ciphers.
--
--=item B<-tls1>
--
--only include TLS v1 ciphers.
-+Only include SSLv2 ciphers.
- 
- =item B<-h>, B<-?>
- 
--print a brief usage message.
-+Print a brief usage message.
- 
- =item B<cipherlist>
- 
--a cipher list to convert to a cipher preference list. If it is not included
-+A cipher list to convert to a cipher preference list. If it is not included
- then the default cipher list will be used. The format is described below.
- 
- =back
-@@ -109,9 +105,10 @@ The following is a list of all permitted cipher strings and their meanings.
- 
- =item B<DEFAULT>
- 
--the default cipher list. This is determined at compile time and
--is normally B<ALL:!EXPORT:!aNULL:!eNULL:!SSLv2>. This must be the firstcipher string
--specified.
-+The default cipher list.
-+This is determined at compile time and is normally
-+B<ALL:!EXPORT:!aNULL:!eNULL:!SSLv2>.
-+When used, this must be the first cipherstring specified.
- 
- =item B<COMPLEMENTOFDEFAULT>
- 
-@@ -582,11 +579,11 @@ Note: these ciphers can also be used in SSL v3.
- =head2 Deprecated SSL v2.0 cipher suites.
- 
-  SSL_CK_RC4_128_WITH_MD5                 RC4-MD5
-- SSL_CK_RC4_128_EXPORT40_WITH_MD5        EXP-RC4-MD5
-- SSL_CK_RC2_128_CBC_WITH_MD5             RC2-MD5
-- SSL_CK_RC2_128_CBC_EXPORT40_WITH_MD5    EXP-RC2-MD5
-+ SSL_CK_RC4_128_EXPORT40_WITH_MD5        Not implemented.
-+ SSL_CK_RC2_128_CBC_WITH_MD5             RC2-CBC-MD5
-+ SSL_CK_RC2_128_CBC_EXPORT40_WITH_MD5    Not implemented.
-  SSL_CK_IDEA_128_CBC_WITH_MD5            IDEA-CBC-MD5
-- SSL_CK_DES_64_CBC_WITH_MD5              DES-CBC-MD5
-+ SSL_CK_DES_64_CBC_WITH_MD5              Not implemented.
-  SSL_CK_DES_192_EDE3_CBC_WITH_MD5        DES-CBC3-MD5
- 
- =head1 NOTES
-diff --git a/doc/apps/s_client.pod b/doc/apps/s_client.pod
-index 84d0527..618df96 100644
---- a/doc/apps/s_client.pod
-+++ b/doc/apps/s_client.pod
-@@ -201,15 +201,11 @@ Use the PSK key B<key> when using a PSK cipher suite. The key is
- given as a hexadecimal number without leading 0x, for example -psk
- 1a2b3c4d.
- 
--=item B<-ssl2>, B<-ssl3>, B<-tls1>, B<-no_ssl2>, B<-no_ssl3>, B<-no_tls1>, B<-no_tls1_1>, B<-no_tls1_2>
-+=item B<-ssl2>, B<-ssl3>, B<-tls1>, B<-tls1_1>, B<-tls1_2>, B<-no_ssl2>, B<-no_ssl3>, B<-no_tls1>, B<-no_tls1_1>, B<-no_tls1_2>
- 
--these options disable the use of certain SSL or TLS protocols. By default
--the initial handshake uses a method which should be compatible with all
--servers and permit them to use SSL v3, SSL v2 or TLS as appropriate.
--
--Unfortunately there are still ancient and broken servers in use which
--cannot handle this technique and will fail to connect. Some servers only
--work if TLS is turned off.
-+These options require or disable the use of the specified SSL or TLS protocols.
-+By default the initial handshake uses a I<version-flexible> method which will
-+negotiate the highest mutually supported protocol version.
- 
- =item B<-fallback_scsv>
- 
-diff --git a/doc/apps/s_server.pod b/doc/apps/s_server.pod
-index baca779..6f4acb7 100644
---- a/doc/apps/s_server.pod
-+++ b/doc/apps/s_server.pod
-@@ -217,11 +217,11 @@ Use the PSK key B<key> when using a PSK cipher suite. The key is
- given as a hexadecimal number without leading 0x, for example -psk
- 1a2b3c4d.
- 
--=item B<-ssl2>, B<-ssl3>, B<-tls1>, B<-no_ssl2>, B<-no_ssl3>, B<-no_tls1>
-+=item B<-ssl2>, B<-ssl3>, B<-tls1>, B<-tls1_1>, B<-tls1_2>, B<-no_ssl2>, B<-no_ssl3>, B<-no_tls1>, B<-no_tls1_1>, B<-no_tls1_2>
- 
--these options disable the use of certain SSL or TLS protocols. By default
--the initial handshake uses a method which should be compatible with all
--servers and permit them to use SSL v3, SSL v2 or TLS as appropriate.
-+These options require or disable the use of the specified SSL or TLS protocols.
-+By default the initial handshake uses a I<version-flexible> method which will
-+negotiate the highest mutually supported protocol version.
- 
- =item B<-bugs>
- 
-diff --git a/doc/ssl/SSL_CONF_cmd.pod b/doc/ssl/SSL_CONF_cmd.pod
-index 2bf1a60..e81d76a 100644
---- a/doc/ssl/SSL_CONF_cmd.pod
-+++ b/doc/ssl/SSL_CONF_cmd.pod
-@@ -74,7 +74,7 @@ B<prime256v1>). Curve names are case sensitive.
- 
- =item B<-named_curve>
- 
--This sets the temporary curve used for ephemeral ECDH modes. Only used by 
-+This sets the temporary curve used for ephemeral ECDH modes. Only used by
- servers
- 
- The B<value> argument is a curve name or the special value B<auto> which
-@@ -85,7 +85,7 @@ can be either the B<NIST> name (e.g. B<P-256>) or an OpenSSL OID name
- =item B<-cipher>
- 
- Sets the cipher suite list to B<value>. Note: syntax checking of B<value> is
--currently not performed unless a B<SSL> or B<SSL_CTX> structure is 
-+currently not performed unless a B<SSL> or B<SSL_CTX> structure is
- associated with B<cctx>.
- 
- =item B<-cert>
-@@ -111,9 +111,9 @@ operations are permitted.
- 
- =item B<-no_ssl2>, B<-no_ssl3>, B<-no_tls1>, B<-no_tls1_1>, B<-no_tls1_2>
- 
--Disables protocol support for SSLv2, SSLv3, TLS 1.0, TLS 1.1 or TLS 1.2 
--by setting the corresponding options B<SSL_OP_NO_SSL2>, B<SSL_OP_NO_SSL3>,
--B<SSL_OP_NO_TLS1>, B<SSL_OP_NO_TLS1_1> and B<SSL_OP_NO_TLS1_2> respectively.
-+Disables protocol support for SSLv2, SSLv3, TLSv1.0, TLSv1.1 or TLSv1.2
-+by setting the corresponding options B<SSL_OP_NO_SSLv2>, B<SSL_OP_NO_SSLv3>,
-+B<SSL_OP_NO_TLSv1>, B<SSL_OP_NO_TLSv1_1> and B<SSL_OP_NO_TLSv1_2> respectively.
- 
- =item B<-bugs>
- 
-@@ -177,7 +177,7 @@ Note: the command prefix (if set) alters the recognised B<cmd> values.
- =item B<CipherString>
- 
- Sets the cipher suite list to B<value>. Note: syntax checking of B<value> is
--currently not performed unless an B<SSL> or B<SSL_CTX> structure is 
-+currently not performed unless an B<SSL> or B<SSL_CTX> structure is
- associated with B<cctx>.
- 
- =item B<Certificate>
-@@ -244,7 +244,7 @@ B<prime256v1>). Curve names are case sensitive.
- 
- =item B<ECDHParameters>
- 
--This sets the temporary curve used for ephemeral ECDH modes. Only used by 
-+This sets the temporary curve used for ephemeral ECDH modes. Only used by
- servers
- 
- The B<value> argument is a curve name or the special value B<Automatic> which
-@@ -258,10 +258,11 @@ The supported versions of the SSL or TLS protocol.
- 
- The B<value> argument is a comma separated list of supported protocols to
- enable or disable. If an protocol is preceded by B<-> that version is disabled.
--All versions are enabled by default, though applications may choose to
--explicitly disable some. Currently supported protocol values are B<SSLv2>,
--B<SSLv3>, B<TLSv1>, B<TLSv1.1> and B<TLSv1.2>. The special value B<ALL> refers
--to all supported versions.
-+Currently supported protocol values are B<SSLv2>, B<SSLv3>, B<TLSv1>,
-+B<TLSv1.1> and B<TLSv1.2>.
-+All protocol versions other than B<SSLv2> are enabled by default.
-+To avoid inadvertent enabling of B<SSLv2>, when SSLv2 is disabled, it is not
-+possible to enable it via the B<Protocol> command.
- 
- =item B<Options>
- 
-@@ -339,16 +340,16 @@ The value is a directory name.
- The order of operations is significant. This can be used to set either defaults
- or values which cannot be overridden. For example if an application calls:
- 
-- SSL_CONF_cmd(ctx, "Protocol", "-SSLv2");
-+ SSL_CONF_cmd(ctx, "Protocol", "-SSLv3");
-  SSL_CONF_cmd(ctx, userparam, uservalue);
- 
--it will disable SSLv2 support by default but the user can override it. If 
-+it will disable SSLv3 support by default but the user can override it. If
- however the call sequence is:
- 
-  SSL_CONF_cmd(ctx, userparam, uservalue);
-- SSL_CONF_cmd(ctx, "Protocol", "-SSLv2");
-+ SSL_CONF_cmd(ctx, "Protocol", "-SSLv3");
- 
--SSLv2 is B<always> disabled and attempt to override this by the user are
-+then SSLv3 is B<always> disabled and attempt to override this by the user are
- ignored.
- 
- By checking the return code of SSL_CTX_cmd() it is possible to query if a
-@@ -372,7 +373,7 @@ can be checked instead. If -3 is returned a required argument is missing
- and an error is indicated. If 0 is returned some other error occurred and
- this can be reported back to the user.
- 
--The function SSL_CONF_cmd_value_type() can be used by applications to 
-+The function SSL_CONF_cmd_value_type() can be used by applications to
- check for the existence of a command or to perform additional syntax
- checking or translation of the command value. For example if the return
- value is B<SSL_CONF_TYPE_FILE> an application could translate a relative
-diff --git a/doc/ssl/SSL_CTX_new.pod b/doc/ssl/SSL_CTX_new.pod
-index 491ac8c..b8cc879 100644
---- a/doc/ssl/SSL_CTX_new.pod
-+++ b/doc/ssl/SSL_CTX_new.pod
-@@ -2,13 +2,55 @@
- 
- =head1 NAME
- 
--SSL_CTX_new - create a new SSL_CTX object as framework for TLS/SSL enabled functions
-+SSL_CTX_new,
-+SSLv23_method, SSLv23_server_method, SSLv23_client_method,
-+TLSv1_2_method, TLSv1_2_server_method, TLSv1_2_client_method,
-+TLSv1_1_method, TLSv1_1_server_method, TLSv1_1_client_method,
-+TLSv1_method, TLSv1_server_method, TLSv1_client_method,
-+SSLv3_method, SSLv3_server_method, SSLv3_client_method,
-+SSLv2_method, SSLv2_server_method, SSLv2_client_method,
-+DTLS_method, DTLS_server_method, DTLS_client_method,
-+DTLSv1_2_method, DTLSv1_2_server_method, DTLSv1_2_client_method,
-+DTLSv1_method, DTLSv1_server_method, DTLSv1_client_method -
-+create a new SSL_CTX object as framework for TLS/SSL enabled functions
- 
- =head1 SYNOPSIS
- 
-  #include <openssl/ssl.h>
- 
-  SSL_CTX *SSL_CTX_new(const SSL_METHOD *method);
-+ const SSL_METHOD *SSLv23_method(void);
-+ const SSL_METHOD *SSLv23_server_method(void);
-+ const SSL_METHOD *SSLv23_client_method(void);
-+ const SSL_METHOD *TLSv1_2_method(void);
-+ const SSL_METHOD *TLSv1_2_server_method(void);
-+ const SSL_METHOD *TLSv1_2_client_method(void);
-+ const SSL_METHOD *TLSv1_1_method(void);
-+ const SSL_METHOD *TLSv1_1_server_method(void);
-+ const SSL_METHOD *TLSv1_1_client_method(void);
-+ const SSL_METHOD *TLSv1_method(void);
-+ const SSL_METHOD *TLSv1_server_method(void);
-+ const SSL_METHOD *TLSv1_client_method(void);
-+ #ifndef OPENSSL_NO_SSL3_METHOD
-+ const SSL_METHOD *SSLv3_method(void);
-+ const SSL_METHOD *SSLv3_server_method(void);
-+ const SSL_METHOD *SSLv3_client_method(void);
-+ #endif
-+ #ifndef OPENSSL_NO_SSL2
-+ const SSL_METHOD *SSLv2_method(void);
-+ const SSL_METHOD *SSLv2_server_method(void);
-+ const SSL_METHOD *SSLv2_client_method(void);
-+ #endif
-+
-+ const SSL_METHOD *DTLS_method(void);
-+ const SSL_METHOD *DTLS_server_method(void);
-+ const SSL_METHOD *DTLS_client_method(void);
-+ const SSL_METHOD *DTLSv1_2_method(void);
-+ const SSL_METHOD *DTLSv1_2_server_method(void);
-+ const SSL_METHOD *DTLSv1_2_client_method(void);
-+ const SSL_METHOD *DTLSv1_method(void);
-+ const SSL_METHOD *DTLSv1_server_method(void);
-+ const SSL_METHOD *DTLSv1_client_method(void);
- 
- =head1 DESCRIPTION
- 
-@@ -23,65 +65,88 @@ client only type. B<method> can be of the following types:
- 
- =over 4
- 
--=item SSLv2_method(void), SSLv2_server_method(void), SSLv2_client_method(void)
-+=item SSLv23_method(), SSLv23_server_method(), SSLv23_client_method()
-+
-+These are the general-purpose I<version-flexible> SSL/TLS methods.
-+The actual protocol version used will be negotiated to the highest version
-+mutually supported by the client and the server.
-+The supported protocols are SSLv2, SSLv3, TLSv1, TLSv1.1 and TLSv1.2.
-+Most applications should use these method, and avoid the version specific
-+methods described below.
-+
-+The list of protocols available can be further limited using the
-+B<SSL_OP_NO_SSLv2>, B<SSL_OP_NO_SSLv3>, B<SSL_OP_NO_TLSv1>,
-+B<SSL_OP_NO_TLSv1_1> and B<SSL_OP_NO_TLSv1_2> options of the
-+L<SSL_CTX_set_options(3)> or L<SSL_set_options(3)> functions.
-+Clients should avoid creating "holes" in the set of protocols they support,
-+when disabling a protocol, make sure that you also disable either all previous
-+or all subsequent protocol versions.
-+In clients, when a protocol version is disabled without disabling I<all>
-+previous protocol versions, the effect is to also disable all subsequent
-+protocol versions.
-+
-+The SSLv2 and SSLv3 protocols are deprecated and should generally not be used.
-+Applications should typically use L<SSL_CTX_set_options(3)> in combination with
-+the B<SSL_OP_NO_SSLv3> flag to disable negotiation of SSLv3 via the above
-+I<version-flexible> SSL/TLS methods.
-+The B<SSL_OP_NO_SSLv2> option is set by default, and would need to be cleared
-+via L<SSL_CTX_clear_options(3)> in order to enable negotiation of SSLv2.
-+
-+=item TLSv1_2_method(), TLSv1_2_server_method(), TLSv1_2_client_method()
- 
--A TLS/SSL connection established with these methods will only understand
--the SSLv2 protocol. A client will send out SSLv2 client hello messages
--and will also indicate that it only understand SSLv2. A server will only
--understand SSLv2 client hello messages.
-+A TLS/SSL connection established with these methods will only understand the
-+TLSv1.2 protocol.  A client will send out TLSv1.2 client hello messages and
-+will also indicate that it only understand TLSv1.2.  A server will only
-+understand TLSv1.2 client hello messages.
- 
--=item SSLv3_method(void), SSLv3_server_method(void), SSLv3_client_method(void)
-+=item TLSv1_1_method(), TLSv1_1_server_method(), TLSv1_1_client_method()
- 
- A TLS/SSL connection established with these methods will only understand the
--SSLv3 protocol. A client will send out SSLv3 client hello messages
--and will indicate that it only understands SSLv3. A server will only understand
--SSLv3 client hello messages. This especially means, that it will
--not understand SSLv2 client hello messages which are widely used for
--compatibility reasons, see SSLv23_*_method().
-+TLSv1.1 protocol.  A client will send out TLSv1.1 client hello messages and
-+will also indicate that it only understand TLSv1.1.  A server will only
-+understand TLSv1.1 client hello messages.
- 
--=item TLSv1_method(void), TLSv1_server_method(void), TLSv1_client_method(void)
-+=item TLSv1_method(), TLSv1_server_method(), TLSv1_client_method()
- 
- A TLS/SSL connection established with these methods will only understand the
--TLSv1 protocol. A client will send out TLSv1 client hello messages
--and will indicate that it only understands TLSv1. A server will only understand
--TLSv1 client hello messages. This especially means, that it will
--not understand SSLv2 client hello messages which are widely used for
--compatibility reasons, see SSLv23_*_method(). It will also not understand
--SSLv3 client hello messages.
--
--=item SSLv23_method(void), SSLv23_server_method(void), SSLv23_client_method(void)
--
--A TLS/SSL connection established with these methods may understand the SSLv2,
--SSLv3, TLSv1, TLSv1.1 and TLSv1.2 protocols.
--
--If the cipher list does not contain any SSLv2 ciphersuites (the default
--cipher list does not) or extensions are required (for example server name)
--a client will send out TLSv1 client hello messages including extensions and
--will indicate that it also understands TLSv1.1, TLSv1.2 and permits a
--fallback to SSLv3. A server will support SSLv3, TLSv1, TLSv1.1 and TLSv1.2
--protocols. This is the best choice when compatibility is a concern.
--
--If any SSLv2 ciphersuites are included in the cipher list and no extensions
--are required then SSLv2 compatible client hellos will be used by clients and
--SSLv2 will be accepted by servers. This is B<not> recommended due to the
--insecurity of SSLv2 and the limited nature of the SSLv2 client hello
--prohibiting the use of extensions.
-+TLSv1 protocol.  A client will send out TLSv1 client hello messages and will
-+indicate that it only understands TLSv1.  A server will only understand TLSv1
-+client hello messages.
- 
--=back
-+=item SSLv3_method(), SSLv3_server_method(), SSLv3_client_method()
-+
-+A TLS/SSL connection established with these methods will only understand the
-+SSLv3 protocol.  A client will send out SSLv3 client hello messages and will
-+indicate that it only understands SSLv3.  A server will only understand SSLv3
-+client hello messages.  The SSLv3 protocol is deprecated and should not be
-+used.
-+
-+=item SSLv2_method(), SSLv2_server_method(), SSLv2_client_method()
-+
-+A TLS/SSL connection established with these methods will only understand the
-+SSLv2 protocol.  A client will send out SSLv2 client hello messages and will
-+also indicate that it only understand SSLv2.  A server will only understand
-+SSLv2 client hello messages.  The SSLv2 protocol offers little to no security
-+and should not be used.
-+As of OpenSSL 1.0.2g, EXPORT ciphers and 56-bit DES are no longer available
-+with SSLv2.
- 
--The list of protocols available can later be limited using the SSL_OP_NO_SSLv2,
--SSL_OP_NO_SSLv3, SSL_OP_NO_TLSv1, SSL_OP_NO_TLSv1_1 and SSL_OP_NO_TLSv1_2
--options of the SSL_CTX_set_options() or SSL_set_options() functions.
--Using these options it is possible to choose e.g. SSLv23_server_method() and
--be able to negotiate with all possible clients, but to only allow newer
--protocols like TLSv1, TLSv1.1 or TLS v1.2.
-+=item DTLS_method(), DTLS_server_method(), DTLS_client_method()
- 
--Applications which never want to support SSLv2 (even is the cipher string
--is configured to use SSLv2 ciphersuites) can set SSL_OP_NO_SSLv2.
-+These are the version-flexible DTLS methods.
-+
-+=item DTLSv1_2_method(), DTLSv1_2_server_method(), DTLSv1_2_client_method()
-+
-+These are the version-specific methods for DTLSv1.2.
-+
-+=item DTLSv1_method(), DTLSv1_server_method(), DTLSv1_client_method()
-+
-+These are the version-specific methods for DTLSv1.
-+
-+=back
- 
--SSL_CTX_new() initializes the list of ciphers, the session cache setting,
--the callbacks, the keys and certificates and the options to its default
--values.
-+SSL_CTX_new() initializes the list of ciphers, the session cache setting, the
-+callbacks, the keys and certificates and the options to its default values.
- 
- =head1 RETURN VALUES
- 
-@@ -91,8 +156,8 @@ The following return values can occur:
- 
- =item NULL
- 
--The creation of a new SSL_CTX object failed. Check the error stack to
--find out the reason.
-+The creation of a new SSL_CTX object failed. Check the error stack to find out
-+the reason.
- 
- =item Pointer to an SSL_CTX object
- 
-@@ -102,6 +167,7 @@ The return value points to an allocated SSL_CTX object.
- 
- =head1 SEE ALSO
- 
-+L<SSL_CTX_set_options(3)>, L<SSL_CTX_clear_options(3)>, L<SSL_set_options(3)>,
- L<SSL_CTX_free(3)|SSL_CTX_free(3)>, L<SSL_accept(3)|SSL_accept(3)>,
- L<ssl(3)|ssl(3)>,  L<SSL_set_connect_state(3)|SSL_set_connect_state(3)>
- 
-diff --git a/doc/ssl/SSL_CTX_set_options.pod b/doc/ssl/SSL_CTX_set_options.pod
-index e80a72c..9a7e98c 100644
---- a/doc/ssl/SSL_CTX_set_options.pod
-+++ b/doc/ssl/SSL_CTX_set_options.pod
-@@ -189,15 +189,25 @@ browser has a cert, it will crash/hang.  Works for 3.x and 4.xbeta
- =item SSL_OP_NO_SSLv2
- 
- Do not use the SSLv2 protocol.
-+As of OpenSSL 1.0.2g the B<SSL_OP_NO_SSLv2> option is set by default.
- 
- =item SSL_OP_NO_SSLv3
- 
- Do not use the SSLv3 protocol.
-+It is recommended that applications should set this option.
- 
- =item SSL_OP_NO_TLSv1
- 
- Do not use the TLSv1 protocol.
- 
-+=item SSL_OP_NO_TLSv1_1
-+
-+Do not use the TLSv1.1 protocol.
-+
-+=item SSL_OP_NO_TLSv1_2
-+
-+Do not use the TLSv1.2 protocol.
-+
- =item SSL_OP_NO_SESSION_RESUMPTION_ON_RENEGOTIATION
- 
- When performing renegotiation as a server, always start a new session
-diff --git a/doc/ssl/ssl.pod b/doc/ssl/ssl.pod
-index 242087e..70cca17 100644
---- a/doc/ssl/ssl.pod
-+++ b/doc/ssl/ssl.pod
-@@ -130,41 +130,86 @@ protocol methods defined in B<SSL_METHOD> structures.
- 
- =over 4
- 
--=item const SSL_METHOD *B<SSLv2_client_method>(void);
-+=item const SSL_METHOD *B<SSLv23_method>(void);
- 
--Constructor for the SSLv2 SSL_METHOD structure for a dedicated client.
-+Constructor for the I<version-flexible> SSL_METHOD structure for
-+clients, servers or both.
-+See L<SSL_CTX_new(3)> for details.
- 
--=item const SSL_METHOD *B<SSLv2_server_method>(void);
-+=item const SSL_METHOD *B<SSLv23_client_method>(void);
- 
--Constructor for the SSLv2 SSL_METHOD structure for a dedicated server.
-+Constructor for the I<version-flexible> SSL_METHOD structure for
-+clients.
- 
--=item const SSL_METHOD *B<SSLv2_method>(void);
-+=item const SSL_METHOD *B<SSLv23_client_method>(void);
- 
--Constructor for the SSLv2 SSL_METHOD structure for combined client and server.
-+Constructor for the I<version-flexible> SSL_METHOD structure for
-+servers.
- 
--=item const SSL_METHOD *B<SSLv3_client_method>(void);
-+=item const SSL_METHOD *B<TLSv1_2_method>(void);
- 
--Constructor for the SSLv3 SSL_METHOD structure for a dedicated client.
-+Constructor for the TLSv1.2 SSL_METHOD structure for clients, servers
-+or both.
- 
--=item const SSL_METHOD *B<SSLv3_server_method>(void);
-+=item const SSL_METHOD *B<TLSv1_2_client_method>(void);
- 
--Constructor for the SSLv3 SSL_METHOD structure for a dedicated server.
-+Constructor for the TLSv1.2 SSL_METHOD structure for clients.
- 
--=item const SSL_METHOD *B<SSLv3_method>(void);
-+=item const SSL_METHOD *B<TLSv1_2_server_method>(void);
-+
-+Constructor for the TLSv1.2 SSL_METHOD structure for servers.
-+
-+=item const SSL_METHOD *B<TLSv1_1_method>(void);
- 
--Constructor for the SSLv3 SSL_METHOD structure for combined client and server.
-+Constructor for the TLSv1.1 SSL_METHOD structure for clients, servers
-+or both.
-+
-+=item const SSL_METHOD *B<TLSv1_1_client_method>(void);
-+
-+Constructor for the TLSv1.1 SSL_METHOD structure for clients.
-+
-+=item const SSL_METHOD *B<TLSv1_1_server_method>(void);
-+
-+Constructor for the TLSv1.1 SSL_METHOD structure for servers.
-+
-+=item const SSL_METHOD *B<TLSv1_method>(void);
-+
-+Constructor for the TLSv1 SSL_METHOD structure for clients, servers
-+or both.
- 
- =item const SSL_METHOD *B<TLSv1_client_method>(void);
- 
--Constructor for the TLSv1 SSL_METHOD structure for a dedicated client.
-+Constructor for the TLSv1 SSL_METHOD structure for clients.
- 
- =item const SSL_METHOD *B<TLSv1_server_method>(void);
- 
--Constructor for the TLSv1 SSL_METHOD structure for a dedicated server.
-+Constructor for the TLSv1 SSL_METHOD structure for servers.
- 
--=item const SSL_METHOD *B<TLSv1_method>(void);
-+=item const SSL_METHOD *B<SSLv3_method>(void);
-+
-+Constructor for the SSLv3 SSL_METHOD structure for clients, servers
-+or both.
-+
-+=item const SSL_METHOD *B<SSLv3_client_method>(void);
-+
-+Constructor for the SSLv3 SSL_METHOD structure for clients.
-+
-+=item const SSL_METHOD *B<SSLv3_server_method>(void);
-+
-+Constructor for the SSLv3 SSL_METHOD structure for servers.
-+
-+=item const SSL_METHOD *B<SSLv2_method>(void);
-+
-+Constructor for the SSLv2 SSL_METHOD structure for clients, servers
-+or both.
-+
-+=item const SSL_METHOD *B<SSLv2_client_method>(void);
-+
-+Constructor for the SSLv2 SSL_METHOD structure for clients.
-+
-+=item const SSL_METHOD *B<SSLv2_server_method>(void);
- 
--Constructor for the TLSv1 SSL_METHOD structure for combined client and server.
-+Constructor for the SSLv2 SSL_METHOD structure for servers.
- 
- =back
- 
--- 
-2.3.5
-
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_3.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_3.patch
deleted file mode 100644
index d260244..0000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_3.patch
+++ /dev/null
@@ -1,503 +0,0 @@
-From bc38a7d2d3c6082163c50ddf99464736110f2000 Mon Sep 17 00:00:00 2001
-From: Viktor Dukhovni <openssl-users@dukhovni.org>
-Date: Fri, 19 Feb 2016 13:05:11 -0500
-Subject: [PATCH] Disable EXPORT and LOW SSLv3+ ciphers by default
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Reviewed-by: Emilia Käsper <emilia@openssl.org>
-
-Upstream-Status: Backport
-
-https://git.openssl.org/?p=openssl.git;a=commit;h=bc38a7d2d3c6082163c50ddf99464736110f2000
-
-CVE: CVE-2016-0800 #3 patch
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- CHANGES              |  5 +++++
- Configure            |  5 +++++
- NEWS                 |  1 +
- doc/apps/ciphers.pod | 30 ++++++++++++++++++++---------
- ssl/s3_lib.c         | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++
- 5 files changed, 86 insertions(+), 9 deletions(-)
-
-Index: openssl-1.0.2d/Configure
-===================================================================
---- openssl-1.0.2d.orig/Configure
-+++ openssl-1.0.2d/Configure
-@@ -58,6 +58,10 @@ my $usage="Usage: Configure [no-<cipher>
- #		library and will be loaded in run-time by the OpenSSL library.
- # sctp          include SCTP support
- # 386           generate 80386 code
-+# enable-weak-ssl-ciphers
-+#		Enable EXPORT and LOW SSLv3 ciphers that are disabled by
-+#		default.  Note, weak SSLv2 ciphers are unconditionally
-+#		disabled.
- # no-sse2	disables IA-32 SSE2 code, above option implies no-sse2
- # no-<cipher>   build without specified algorithm (rsa, idea, rc5, ...)
- # -<xxx> +<xxx> compiler options are passed through 
-@@ -853,6 +857,7 @@ my %disabled = ( # "what"         => "co
- 		 "ssl2"           => "default",
- 		 "store"	  => "experimental",
- 		 "unit-test"	  => "default",
-+		 "weak-ssl-ciphers" => "default",
- 		 "zlib"           => "default",
- 		 "zlib-dynamic"   => "default"
- 	       );
-Index: openssl-1.0.2d/doc/apps/ciphers.pod
-===================================================================
---- openssl-1.0.2d.orig/doc/apps/ciphers.pod
-+++ openssl-1.0.2d/doc/apps/ciphers.pod
-@@ -136,34 +136,46 @@ than 128 bits, and some cipher suites wi
- 
- =item B<LOW>
- 
--"low" encryption cipher suites, currently those using 64 or 56 bit encryption algorithms
--but excluding export cipher suites.
-+Low strength encryption cipher suites, currently those using 64 or 56 bit
-+encryption algorithms but excluding export cipher suites.
-+As of OpenSSL 1.0.2g, these are disabled in default builds.
- 
- =item B<EXP>, B<EXPORT>
- 
--export encryption algorithms. Including 40 and 56 bits algorithms.
-+Export strength encryption algorithms. Including 40 and 56 bits algorithms.
-+As of OpenSSL 1.0.2g, these are disabled in default builds.
- 
- =item B<EXPORT40>
- 
--40 bit export encryption algorithms
-+40-bit export encryption algorithms
-+As of OpenSSL 1.0.2g, these are disabled in default builds.
- 
- =item B<EXPORT56>
- 
--56 bit export encryption algorithms. In OpenSSL 0.9.8c and later the set of
-+56-bit export encryption algorithms. In OpenSSL 0.9.8c and later the set of
- 56 bit export ciphers is empty unless OpenSSL has been explicitly configured
- with support for experimental ciphers.
-+As of OpenSSL 1.0.2g, these are disabled in default builds.
- 
- =item B<eNULL>, B<NULL>
- 
--the "NULL" ciphers that is those offering no encryption. Because these offer no
--encryption at all and are a security risk they are disabled unless explicitly
--included.
-+The "NULL" ciphers that is those offering no encryption. Because these offer no
-+encryption at all and are a security risk they are not enabled via either the
-+B<DEFAULT> or B<ALL> cipher strings.
-+Be careful when building cipherlists out of lower-level primitives such as
-+B<kRSA> or B<aECDSA> as these do overlap with the B<eNULL> ciphers.
-+When in doubt, include B<!eNULL> in your cipherlist.
- 
- =item B<aNULL>
- 
--the cipher suites offering no authentication. This is currently the anonymous
-+The cipher suites offering no authentication. This is currently the anonymous
- DH algorithms and anonymous ECDH algorithms. These cipher suites are vulnerable
- to a "man in the middle" attack and so their use is normally discouraged.
-+These are excluded from the B<DEFAULT> ciphers, but included in the B<ALL>
-+ciphers.
-+Be careful when building cipherlists out of lower-level primitives such as
-+B<kDHE> or B<AES> as these do overlap with the B<aNULL> ciphers.
-+When in doubt, include B<!aNULL> in your cipherlist.
- 
- =item B<kRSA>, B<RSA>
- 
-Index: openssl-1.0.2d/ssl/s3_lib.c
-===================================================================
---- openssl-1.0.2d.orig/ssl/s3_lib.c
-+++ openssl-1.0.2d/ssl/s3_lib.c
-@@ -198,6 +198,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      },
- 
- /* Cipher 03 */
-+#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_RSA_RC4_40_MD5,
-@@ -212,6 +213,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      40,
-      128,
-      },
-+#endif
- 
- /* Cipher 04 */
-     {
-@@ -246,6 +248,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      },
- 
- /* Cipher 06 */
-+#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_RSA_RC2_40_MD5,
-@@ -260,6 +263,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      40,
-      128,
-      },
-+#endif
- 
- /* Cipher 07 */
- #ifndef OPENSSL_NO_IDEA
-@@ -280,6 +284,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
- #endif
- 
- /* Cipher 08 */
-+#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_RSA_DES_40_CBC_SHA,
-@@ -294,8 +299,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      40,
-      56,
-      },
-+#endif
- 
- /* Cipher 09 */
-+#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_RSA_DES_64_CBC_SHA,
-@@ -310,6 +317,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      56,
-      56,
-      },
-+#endif
- 
- /* Cipher 0A */
-     {
-@@ -329,6 +337,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
- 
- /* The DH ciphers */
- /* Cipher 0B */
-+#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      0,
-      SSL3_TXT_DH_DSS_DES_40_CBC_SHA,
-@@ -343,8 +352,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      40,
-      56,
-      },
-+#endif
- 
- /* Cipher 0C */
-+#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_DH_DSS_DES_64_CBC_SHA,
-@@ -359,6 +370,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      56,
-      56,
-      },
-+#endif
- 
- /* Cipher 0D */
-     {
-@@ -377,6 +389,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      },
- 
- /* Cipher 0E */
-+#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      0,
-      SSL3_TXT_DH_RSA_DES_40_CBC_SHA,
-@@ -391,8 +404,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      40,
-      56,
-      },
-+#endif
- 
- /* Cipher 0F */
-+#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_DH_RSA_DES_64_CBC_SHA,
-@@ -407,6 +422,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      56,
-      56,
-      },
-+#endif
- 
- /* Cipher 10 */
-     {
-@@ -426,6 +442,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
- 
- /* The Ephemeral DH ciphers */
- /* Cipher 11 */
-+#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_EDH_DSS_DES_40_CBC_SHA,
-@@ -440,8 +457,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      40,
-      56,
-      },
-+#endif
- 
- /* Cipher 12 */
-+#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_EDH_DSS_DES_64_CBC_SHA,
-@@ -456,6 +475,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      56,
-      56,
-      },
-+#endif
- 
- /* Cipher 13 */
-     {
-@@ -474,6 +494,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      },
- 
- /* Cipher 14 */
-+#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_EDH_RSA_DES_40_CBC_SHA,
-@@ -488,8 +509,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      40,
-      56,
-      },
-+#endif
- 
- /* Cipher 15 */
-+#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_EDH_RSA_DES_64_CBC_SHA,
-@@ -504,6 +527,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      56,
-      56,
-      },
-+#endif
- 
- /* Cipher 16 */
-     {
-@@ -522,6 +546,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      },
- 
- /* Cipher 17 */
-+#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_ADH_RC4_40_MD5,
-@@ -536,6 +561,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      40,
-      128,
-      },
-+#endif
- 
- /* Cipher 18 */
-     {
-@@ -554,6 +580,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      },
- 
- /* Cipher 19 */
-+#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_ADH_DES_40_CBC_SHA,
-@@ -568,8 +595,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      40,
-      128,
-      },
-+#endif
- 
- /* Cipher 1A */
-+#ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_ADH_DES_64_CBC_SHA,
-@@ -584,6 +613,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      56,
-      56,
-      },
-+#endif
- 
- /* Cipher 1B */
-     {
-@@ -655,6 +685,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
- #ifndef OPENSSL_NO_KRB5
- /* The Kerberos ciphers*/
- /* Cipher 1E */
-+# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_KRB5_DES_64_CBC_SHA,
-@@ -669,6 +700,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      56,
-      56,
-      },
-+# endif
- 
- /* Cipher 1F */
-     {
-@@ -719,6 +751,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      },
- 
- /* Cipher 22 */
-+# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_KRB5_DES_64_CBC_MD5,
-@@ -733,6 +766,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      56,
-      56,
-      },
-+# endif
- 
- /* Cipher 23 */
-     {
-@@ -783,6 +817,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      },
- 
- /* Cipher 26 */
-+# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_KRB5_DES_40_CBC_SHA,
-@@ -797,8 +832,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      40,
-      56,
-      },
-+# endif
- 
- /* Cipher 27 */
-+# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_KRB5_RC2_40_CBC_SHA,
-@@ -813,8 +850,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      40,
-      128,
-      },
-+# endif
- 
- /* Cipher 28 */
-+# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_KRB5_RC4_40_SHA,
-@@ -829,8 +868,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      40,
-      128,
-      },
-+# endif
- 
- /* Cipher 29 */
-+# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_KRB5_DES_40_CBC_MD5,
-@@ -845,8 +886,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      40,
-      56,
-      },
-+# endif
- 
- /* Cipher 2A */
-+# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_KRB5_RC2_40_CBC_MD5,
-@@ -861,8 +904,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      40,
-      128,
-      },
-+# endif
- 
- /* Cipher 2B */
-+# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      SSL3_TXT_KRB5_RC4_40_MD5,
-@@ -877,6 +922,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      40,
-      128,
-      },
-+# endif
- #endif                          /* OPENSSL_NO_KRB5 */
- 
- /* New AES ciphersuites */
-@@ -1300,6 +1346,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
- # endif
- 
-     /* Cipher 62 */
-+# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      TLS1_TXT_RSA_EXPORT1024_WITH_DES_CBC_SHA,
-@@ -1314,8 +1361,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      56,
-      56,
-      },
-+# endif
- 
-     /* Cipher 63 */
-+# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      TLS1_TXT_DHE_DSS_EXPORT1024_WITH_DES_CBC_SHA,
-@@ -1330,8 +1379,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      56,
-      56,
-      },
-+# endif
- 
-     /* Cipher 64 */
-+# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      TLS1_TXT_RSA_EXPORT1024_WITH_RC4_56_SHA,
-@@ -1346,8 +1397,10 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      56,
-      128,
-      },
-+# endif
- 
-     /* Cipher 65 */
-+# ifndef OPENSSL_NO_WEAK_SSL_CIPHERS
-     {
-      1,
-      TLS1_TXT_DHE_DSS_EXPORT1024_WITH_RC4_56_SHA,
-@@ -1362,6 +1415,7 @@ OPENSSL_GLOBAL SSL_CIPHER ssl3_ciphers[]
-      56,
-      128,
-      },
-+# endif
- 
-     /* Cipher 66 */
-     {
-Index: openssl-1.0.2d/CHANGES
-===================================================================
---- openssl-1.0.2d.orig/CHANGES
-+++ openssl-1.0.2d/CHANGES
-@@ -2,7 +2,11 @@
-  OpenSSL CHANGES
-  _______________
- 
-- 
-+  * Disable weak ciphers in SSLv3 and up in default builds of OpenSSL.
-+    Builds that are not configured with "enable-weak-ssl-ciphers" will not
-+    provide any "EXPORT" or "LOW" strength ciphers.
-+    [Viktor Dukhovni]
-+
-   * Disable SSLv2 default build, default negotiation and weak ciphers.  SSLv2
-     is by default disabled at build-time.  Builds that are not configured with
-     "enable-ssl2" will not support SSLv2.  Even if "enable-ssl2" is used,
-Index: openssl-1.0.2d/NEWS
-===================================================================
---- openssl-1.0.2d.orig/NEWS
-+++ openssl-1.0.2d/NEWS
-@@ -1,6 +1,7 @@
- 
-   NEWS
-   ====
-+  Disable weak ciphers in SSLv3 and up in default builds of OpenSSL.
-   Disable SSLv2 default build, default negotiation and weak ciphers.
- 
-   This file gives a brief overview of the major changes between each OpenSSL
diff --git a/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch b/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch
index c397af2..7ba9eab 100644
--- a/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch
+++ b/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch
@@ -17,15 +17,13 @@ URL: https://bugs.gentoo.org/542618
 
 Signed-off-By: Armin Kuster <akuster@mvista.com>
 
-Index: openssl-1.0.2a/crypto/perlasm/x86_64-xlate.pl
-===================================================================
---- openssl-1.0.2a.orig/crypto/perlasm/x86_64-xlate.pl
-+++ openssl-1.0.2a/crypto/perlasm/x86_64-xlate.pl
-@@ -194,7 +194,10 @@ my %globals;
-     }
-     sub out {
+diff --git a/crypto/perlasm/x86_64-xlate.pl b/crypto/perlasm/x86_64-xlate.pl
+--- a/crypto/perlasm/x86_64-xlate.pl
++++ b/crypto/perlasm/x86_64-xlate.pl
+@@ -196,6 +196,10 @@ my %globals;
      	my $self = shift;
--
+ 
+ 	$self->{value} =~ s/\b(0b[0-1]+)/oct($1)/eig;
 +	# When building on x32 ABIs, the expanded hex value might be too
 +	# big to fit into 32bits. Enable transparent 64bit support here
 +	# so we can safely print it out.
diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_diginotar.patch b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_diginotar.patch
index 0c1a0b6..d81e22c 100644
--- a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_diginotar.patch
+++ b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_diginotar.patch
@@ -9,14 +9,15 @@ Reviewed-by: Kurt Roeckx <kurt@roeckx.be>
 Reviewed-by: Dr Stephen N Henson <shenson@drh-consultancy.co.uk>
 
 This is not meant as final patch.  
- 
+
 Upstream-Status: Backport [debian]
 
+Signed-off-by: Armin Kuster <akuster@mvista.com>
 
-Index: openssl-1.0.2/crypto/x509/x509_vfy.c
+Index: openssl-1.0.2g/crypto/x509/x509_vfy.c
 ===================================================================
---- openssl-1.0.2.orig/crypto/x509/x509_vfy.c
-+++ openssl-1.0.2/crypto/x509/x509_vfy.c
+--- openssl-1.0.2g.orig/crypto/x509/x509_vfy.c
++++ openssl-1.0.2g/crypto/x509/x509_vfy.c
 @@ -119,6 +119,7 @@ static int check_trust(X509_STORE_CTX *c
  static int check_revocation(X509_STORE_CTX *ctx);
  static int check_cert(X509_STORE_CTX *ctx);
@@ -25,17 +26,17 @@ Index: openssl-1.0.2/crypto/x509/x509_vfy.c
  
  static int get_crl_score(X509_STORE_CTX *ctx, X509 **pissuer,
                           unsigned int *preasons, X509_CRL *crl, X509 *x);
-@@ -438,6 +439,9 @@ int X509_verify_cert(X509_STORE_CTX *ctx
+@@ -489,6 +490,9 @@ int X509_verify_cert(X509_STORE_CTX *ctx
      if (!ok)
-         goto end;
+         goto err;
  
 +	ok = check_ca_blacklist(ctx);
-+	if(!ok) goto end;
++	if(!ok) goto err;
 +
  #ifndef OPENSSL_NO_RFC3779
      /* RFC 3779 path validation, now that CRL check has been done */
      ok = v3_asid_validate_path(ctx);
-@@ -938,6 +942,29 @@ static int check_crl_time(X509_STORE_CTX
+@@ -996,6 +1000,29 @@ static int check_crl_time(X509_STORE_CTX
      return 1;
  }
  
diff --git a/meta/recipes-connectivity/openssl/openssl/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl/debian/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
index a249180..29f11a2 100644
--- a/meta/recipes-connectivity/openssl/openssl/debian/version-script.patch
+++ b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
@@ -15,8 +15,8 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
 +++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld	2014-02-24 22:19:08.601827266 +0100
-@@ -0,0 +1,4615 @@
-+OPENSSL_1.0.0 {
+@@ -0,0 +1,4608 @@
++OPENSSL_1.0.2d {
 +	global:
 +		BIO_f_ssl;
 +		BIO_new_buffer_ssl_connect;
@@ -4314,14 +4314,6 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
 +		CRYPTO_cbc128_decrypt;
 +		CRYPTO_cfb128_encrypt;
 +		CRYPTO_cfb128_8_encrypt;
-+
-+	local:
-+		*;
-+};
-+
-+
-+OPENSSL_1.0.1 {
-+	global:
 +		SSL_renegotiate_abbreviated;
 +		TLSv1_1_method;
 +		TLSv1_1_client_method;
@@ -4483,15 +4475,7 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
 +		BIO_s_datagram_sctp;
 +		BIO_dgram_is_sctp;
 +		BIO_dgram_sctp_notification_cb;
-+} OPENSSL_1.0.0;
-+
-+OPENSSL_1.0.1d {
-+	global:
 +		CRYPTO_memcmp;
-+} OPENSSL_1.0.1;
-+
-+OPENSSL_1.0.2 {
-+	global:
 +		SSL_CTX_set_alpn_protos;
 +		SSL_set_alpn_protos;
 +		SSL_CTX_set_alpn_select_cb;
@@ -4629,14 +4613,23 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
 +		BUF_strnlen;
 +		sk_deep_copy;
 +		SSL_test_functions;
-+} OPENSSL_1.0.1d;
++
++	local:
++		*;
++};
++
++OPENSSL_1.0.2g {
++       global:
++               SRP_VBASE_get1_by_user;
++               SRP_user_pwd_free;
++} OPENSSL_1.0.2d;
 +
 Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/openssl.ld
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
 +++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/openssl.ld	2014-02-24 21:02:30.000000000 +0100
 @@ -0,0 +1,10 @@
-+OPENSSL_1.0.0 {
++OPENSSL_1.0.2 {
 +	global:
 +		bind_engine;
 +		v_check;
@@ -4651,7 +4644,7 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/ccgost/openssl.ld
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
 +++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/ccgost/openssl.ld	2014-02-24 21:02:30.000000000 +0100
 @@ -0,0 +1,10 @@
-+OPENSSL_1.0.0 {
++OPENSSL_1.0.2 {
 +	global:
 +		bind_engine;
 +		v_check;
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
index cebc8cf..f736e5c 100644
--- a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
@@ -8,16 +8,16 @@ http://www.mail-archive.com/openssl-dev@openssl.org/msg32860.html
 
 Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
 ---
-Index: openssl-1.0.2/crypto/evp/digest.c
+Index: openssl-1.0.2h/crypto/evp/digest.c
 ===================================================================
---- openssl-1.0.2.orig/crypto/evp/digest.c
-+++ openssl-1.0.2/crypto/evp/digest.c
-@@ -208,7 +208,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
-         return 0;
+--- openssl-1.0.2h.orig/crypto/evp/digest.c
++++ openssl-1.0.2h/crypto/evp/digest.c
+@@ -211,7 +211,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
+         type = ctx->digest;
      }
  #endif
 -    if (ctx->digest != type) {
 +    if (type && (ctx->digest != type)) {
-         if (ctx->digest && ctx->digest->ctx_size)
+         if (ctx->digest && ctx->digest->ctx_size) {
              OPENSSL_free(ctx->md_data);
-         ctx->digest = type;
+             ctx->md_data = NULL;
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
similarity index 73%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
index f900bf6..3f8fb72 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
@@ -6,7 +6,7 @@ DEPENDS += "cryptodev-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
 
 export DIRS = "crypto ssl apps engines"
 export OE_LDFLAGS="${LDFLAGS}"
@@ -25,7 +25,7 @@ SRC_URI += "file://configure-targets.patch \
             file://debian/no-rpath.patch \
             file://debian/no-symbolic.patch \
             file://debian/pic.patch \
-            file://debian/version-script.patch \
+            file://debian1.0.2/version-script.patch \
             file://openssl_fix_for_x32.patch \
             file://fix-cipher-des-ede3-cfb1.patch \
             file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
@@ -37,20 +37,10 @@ SRC_URI += "file://configure-targets.patch \
             file://crypto_use_bigint_in_x86-64_perl.patch \
             file://openssl-1.0.2a-x32-asm.patch \
             file://ptest_makefile_deps.patch  \
-            file://CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch \
-            file://CVE-2015-3194-1-Add-PSS-parameter-check.patch \
-            file://0001-Add-test-for-CVE-2015-3194.patch \
-            file://CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch \
-            file://CVE-2015-3197.patch \
-            file://CVE-2016-0701_1.patch \
-            file://CVE-2016-0701_2.patch \
-            file://CVE-2016-0800.patch \
-            file://CVE-2016-0800_2.patch \
-            file://CVE-2016-0800_3.patch \
            "
 
-SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
-SRC_URI[sha256sum] = "671c36487785628a703374c652ad2cebea45fa920ae5681515df25d9f2c9a8c8"
+SRC_URI[md5sum] = "9392e65072ce4b614c1392eefc1f23d0"
+SRC_URI[sha256sum] = "1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919"
 
 PACKAGES =+ " \
 	${PN}-engines \
-- 
2.8.0


