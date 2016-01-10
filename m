Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id A936D762AF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:31:07 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 65so2202334pff.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=BDKP18WXaUcW74Ax8SDvg348LeOhzdrfd0zcgOwhRRk=;
	b=eWz8SHNaP7BQJAXhqG4l93UcHaJ48bUAcWaNp5hR+0i5zQDsy2xU2xqFXnalTWYHbu
	KgPjMukTsZcJXn0OpCnxJhN4ggx8ymiXh/NlcaKzxYC1ShJngACb5BOlMQhT2ZaiL28Y
	snlp6O3dsPe20jNpQ4GsMe/cSWQf9EwV8k3xh3c2fztnQUXo0ke9rDgKtX7mMvd+8oXz
	sfWcTkqJpT9YvGR/RGt/2HRUD892IJyWemgRznxc0EEUloqP9bJl8WzsQLYvsBwSZUfA
	vh+TSqbdwQQaOacj9ElYS5JJzRDoRi/S67PxKuHwy5BVLA2A2O5NWsAYmVMlrjkxBKMT
	Cvhg==
X-Received: by 10.98.7.146 with SMTP id 18mr15657759pfh.47.1452385868418;
	Sat, 09 Jan 2016 16:31:08 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	y26sm13691735pfi.88.2016.01.09.16.31.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:31:01 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id BD13AFCC842; Sat,  9 Jan 2016 16:30:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:30:42 -0800
Message-Id: <183b006eeadbddf76eb971d101a960bb5395532f.1452385572.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 16/20] openssl: CVE-2015-3194, CVE-2015-3195
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
X-List-Received-Date: Sun, 10 Jan 2016 00:31:07 -0000
Content-Type: text/plain; charset=a
Content-Transfer-Encoding: 8bit

From: Sona Sarmadi <sona.sarmadi@enea.com>

Fixes following vulnerabilities:
Certificate verify crash with missing PSS parameter (CVE-2015-3194)
X509_ATTRIBUTE memory leak (CVE-2015-3195)

References:
https://openssl.org/news/secadv/20151203.txt
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-3194
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-3195

Upstream patches:
CVE-2015-3194:
https://git.openssl.org/?p=openssl.git;a=commit;h=
d8541d7e9e63bf5f343af24644046c8d96498c17

CVE-2015-3195:
https://git.openssl.org/?p=openssl.git;a=commit;h=
b29ffa392e839d05171206523e84909146f7a77c

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../CVE-2015-3194-Add-PSS-parameter-check.patch    | 37 +++++++++++++
 ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch | 61 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1p.bb |  2 +
 3 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-Add-PSS-parameter-check.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-Add-PSS-parameter-check.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-Add-PSS-parameter-check.patch
new file mode 100644
index 0000000..a6697ca
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-Add-PSS-parameter-check.patch
@@ -0,0 +1,37 @@
+From d8541d7e9e63bf5f343af24644046c8d96498c17 Mon Sep 17 00:00:00 2001
+From: "Dr. Stephen Henson" <steve@openssl.org>
+Date: Fri, 2 Oct 2015 13:10:29 +0100
+Subject:Add PSS parameter check.
+
+Avoid seg fault by checking mgf1 parameter is not NULL. This can be
+triggered during certificate verification so could be a DoS attack
+against a client or a server enabling client authentication.
+
+Thanks to Loïc Jonas Etienne (Qnective AG) for discovering this bug.
+
+CVE-2015-3194
+
+Upstream-Status: Backport
+
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ crypto/rsa/rsa_ameth.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/crypto/rsa/rsa_ameth.c b/crypto/rsa/rsa_ameth.c
+index 93e071d..c7f1148 100644
+--- a/crypto/rsa/rsa_ameth.c
++++ b/crypto/rsa/rsa_ameth.c
+@@ -279,7 +279,7 @@ static RSA_PSS_PARAMS *rsa_pss_decode(const X509_ALGOR *alg,
+     if (pss->maskGenAlgorithm) {
+         ASN1_TYPE *param = pss->maskGenAlgorithm->parameter;
+         if (OBJ_obj2nid(pss->maskGenAlgorithm->algorithm) == NID_mgf1
+-            && param->type == V_ASN1_SEQUENCE) {
++            && param && param->type == V_ASN1_SEQUENCE) {
+             p = param->value.sequence->data;
+             plen = param->value.sequence->length;
+             *pmaskHash = d2i_X509_ALGOR(NULL, &p, plen);
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
new file mode 100644
index 0000000..be705c0
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
@@ -0,0 +1,61 @@
+commit b29ffa392e839d05171206523e84909146f7a77c
+Author: Dr. Stephen Henson <steve@openssl.org>
+Date: Tue, 10 Nov 2015 19:03:07 +0000
+Subject: Fix leak with ASN.1 combine.
+
+When parsing a combined structure pass a flag to the decode routine
+so on error a pointer to the parent structure is not zeroed as
+this will leak any additional components in the parent.
+
+This can leak memory in any application parsing PKCS#7 or CMS structures.
+
+CVE-2015-3195.
+
+Upstream-Status: Backport
+
+Thanks to Adam Langley (Google/BoringSSL) for discovering this bug using
+libFuzzer.
+
+PR#4131
+
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ crypto/asn1/tasn_dec.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/crypto/asn1/tasn_dec.c b/crypto/asn1/tasn_dec.c
+index febf605..9256049 100644
+--- a/crypto/asn1/tasn_dec.c
++++ b/crypto/asn1/tasn_dec.c
+@@ -180,6 +180,8 @@ int ASN1_item_ex_d2i(ASN1_VALUE **pval, const unsigned char **in, long len,
+     int otag;
+     int ret = 0;
+     ASN1_VALUE **pchptr, *ptmpval;
++    int combine = aclass & ASN1_TFLG_COMBINE;
++    aclass &= ~ASN1_TFLG_COMBINE;
+     if (!pval)
+         return 0;
+     if (aux && aux->asn1_cb)
+@@ -500,7 +502,8 @@ int ASN1_item_ex_d2i(ASN1_VALUE **pval, const unsigned char **in, long len,
+  auxerr:
+     ASN1err(ASN1_F_ASN1_ITEM_EX_D2I, ASN1_R_AUX_ERROR);
+  err:
+-    ASN1_item_ex_free(pval, it);
++    if (combine == 0)
++        ASN1_item_ex_free(pval, it);
+     if (errtt)
+         ERR_add_error_data(4, "Field=", errtt->field_name,
+                            ", Type=", it->sname);
+@@ -689,7 +692,7 @@ static int asn1_template_noexp_d2i(ASN1_VALUE **val,
+     } else {
+         /* Nothing special */
+         ret = ASN1_item_ex_d2i(val, &p, len, ASN1_ITEM_ptr(tt->item),
+-                               -1, 0, opt, ctx);
++                               -1, tt->flags & ASN1_TFLG_COMBINE, opt, ctx);
+         if (!ret) {
+             ASN1err(ASN1_F_ASN1_TEMPLATE_NOEXP_D2I, ERR_R_NESTED_ASN1_ERROR);
+             goto err;
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb
index 3f61790..1d0242f 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb
@@ -34,6 +34,8 @@ SRC_URI += "file://configure-targets.patch \
             file://Makefiles-ptest.patch \
             file://ptest-deps.patch \
             file://run-ptest \
+            file://CVE-2015-3194-Add-PSS-parameter-check.patch \
+            file://CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch \
            "
 
 SRC_URI[md5sum] = "7563e92327199e0067ccd0f79f436976"
-- 
1.9.1


