Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id ABCDE71A32
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Oct 2017 09:28:26 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id b79so15027572pfk.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Oct 2017 02:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ma86aWQW7xNURb7GEYSS5NiktL5lwhjpI06KztRI7RU=;
	b=M1RmkbTBn+jC5hOvB/7aAIW6++a4s0dnK5Ihkjh8R/yWkoWPu7lh4HMr65JRvQqIJq
	xiIcWFiWiU/dmdUd4GG0EAyoqH4YWfts+HK3ecGU9OYCfryZw8uT2abwH/a9ShYVRnh+
	asSkdGcn/5JkpHWtamB6f8hRI2SFi4BYYcvedUqTFTSSbT4V8nbKKOGRmDj5VYH1Jbpb
	0OIwkHDaP9lBqPwh/3dBcPw0pXbfzkbGZc2vllNE5zdJ+NQEXsYHF4xl2BaaHgomVNVq
	allrOQisLPoeh4gFWkRGevEf1cyb9DvCaRk4NBpMcW6k4+YPf0SvkNSsnG+WvzT0CEAk
	J8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ma86aWQW7xNURb7GEYSS5NiktL5lwhjpI06KztRI7RU=;
	b=iZ4maoR8/4h9oSJ3Ovk0Ka3PVS2AhRcustD8cGjmioNtG61JCrVWaDcOkBi22mI5ko
	NvCucc9EZ3sOdbLumGr7GP+qMXMBGWdTh4+gAdMojKJSBjouTxxi4zXb0zDdgqNit+Xw
	qdyeT4+z+7xKxMG1wasmTGe0th3fnNLEqx/dEYhZNelwi20Re/PTKafBJH/PUTT+Fdg7
	l26vQAUltydU59f/UkzHDbkNjLlH9mbI1oPXBucJDPnBxJu5cYsilKUGx7IISQqIkRzu
	kTJJRlwWvJqCvF7n3j77VixxFKLYKswhX++Uv4x+85c009TUGXJm61OhTH1GaiRuhvU8
	g/bw==
X-Gm-Message-State: AMCzsaWE5zshVmyxtFndI+AKMfG3rk6+eftYyYucCNJrjEwrIWx23UIy
	lvGDh7MHALer5M6BdlDScAxxlA==
X-Google-Smtp-Source: ABhQp+T4lszCCssIYycYFzoYg6yd1B0ilRlGzKfY2EiA0hckhTCw08j3y77N5p13GS8JdApp/RO4Lw==
X-Received: by 10.98.60.23 with SMTP id j23mr9783086pfa.190.1508664507620;
	Sun, 22 Oct 2017 02:28:27 -0700 (PDT)
Received: from ip-172-31-1-64.ap-northeast-2.compute.internal
	(ec2-13-124-121-69.ap-northeast-2.compute.amazonaws.com.
	[13.124.121.69])
	by smtp.gmail.com with ESMTPSA id g24sm8674352pfk.0.2017.10.22.02.28.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 22 Oct 2017 02:28:26 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Oct 2017 09:28:16 +0000
Message-Id: <1508664496-45260-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] connman: upgrade 1.34 -> 1.35
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
X-List-Received-Date: Sun, 22 Oct 2017 09:28:26 -0000

Below two patches are applied in v1.35
- 0001-firewall-nftables-fix-build-with-libnftnl-1.0.7.patch
- CVE-2017-12865.patch

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 ...ll-nftables-fix-build-with-libnftnl-1.0.7.patch | 72 ------------------
 .../connman/connman/CVE-2017-12865.patch           | 87 ----------------------
 .../connman/{connman_1.34.bb => connman_1.35.bb}   |  6 +-
 3 files changed, 2 insertions(+), 163 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-firewall-nftables-fix-build-with-libnftnl-1.0.7.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/CVE-2017-12865.patch
 rename meta/recipes-connectivity/connman/{connman_1.34.bb => connman_1.35.bb} (67%)

diff --git a/meta/recipes-connectivity/connman/connman/0001-firewall-nftables-fix-build-with-libnftnl-1.0.7.patch b/meta/recipes-connectivity/connman/connman/0001-firewall-nftables-fix-build-with-libnftnl-1.0.7.patch
deleted file mode 100644
index cfafbd1..0000000
--- a/meta/recipes-connectivity/connman/connman/0001-firewall-nftables-fix-build-with-libnftnl-1.0.7.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 4058ce3186a99fd5f03350fc11a7fc8d38b6a381 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Mon, 8 May 2017 10:53:18 +0300
-Subject: [PATCH] firewall-nftables: fix build with libnftnl-1.0.7
-
-We need these updates to accommodate the changes caused by the following
-commit in libnftnl-1.0.7
-
-commit 907a9f8e5a93f5bcd449643eb3916a656d634758
-Author: Pablo Neira Ayuso <pablo@netfilter.org>
-Date:   Tue Dec 20 13:47:11 2016 +0100
-
-src: get rid of aliases and compat
-
-This machinery was introduced to avoid sudden compilation breakage of
-old nftables releases. With the upcoming release of 0.7 (and 0.6 which
-is now 6 months old) this is not required anymore.
-
-Moreover, users gain nothing from older releases since they are
-half-boiled and buggy.
-
-So let's get rid of aliases now. Bump LIBVERSION and update map file.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- src/firewall-nftables.c | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/src/firewall-nftables.c b/src/firewall-nftables.c
-index 583d1c4..83b137b 100644
---- a/src/firewall-nftables.c
-+++ b/src/firewall-nftables.c
-@@ -387,9 +387,9 @@ static int add_cmp(struct nftnl_rule *rule, uint32_t sreg, uint32_t op,
-         if (!expr)
-                 return -ENOMEM;
- 
--        nftnl_expr_set_u32(expr, NFT_EXPR_CMP_SREG, sreg);
--        nftnl_expr_set_u32(expr, NFT_EXPR_CMP_OP, op);
--        nftnl_expr_set(expr, NFT_EXPR_CMP_DATA, data, data_len);
-+        nftnl_expr_set_u32(expr, NFTNL_EXPR_CMP_SREG, sreg);
-+        nftnl_expr_set_u32(expr, NFTNL_EXPR_CMP_OP, op);
-+        nftnl_expr_set(expr, NFTNL_EXPR_CMP_DATA, data, data_len);
- 
-         nftnl_rule_add_expr(rule, expr);
- 
-@@ -575,8 +575,8 @@ static int build_rule_nat(const char *address, unsigned char prefixlen,
- 	expr = nftnl_expr_alloc("meta");
- 	if (!expr)
- 		goto err;
--	nftnl_expr_set_u32(expr, NFT_EXPR_META_KEY, NFT_META_OIFNAME);
--	nftnl_expr_set_u32(expr, NFT_EXPR_META_DREG, NFT_REG_1);
-+	nftnl_expr_set_u32(expr, NFTNL_EXPR_META_KEY, NFT_META_OIFNAME);
-+	nftnl_expr_set_u32(expr, NFTNL_EXPR_META_DREG, NFT_REG_1);
- 	nftnl_rule_add_expr(rule, expr);
- 	err = add_cmp(rule, NFT_REG_1, NFT_CMP_EQ, interface,
- 			strlen(interface) + 1);
-@@ -677,8 +677,8 @@ static int build_rule_snat(int index, const char *address,
- 	expr = nftnl_expr_alloc("meta");
- 	if (!expr)
- 		goto err;
--	nftnl_expr_set_u32(expr, NFT_EXPR_META_KEY, NFT_META_OIF);
--	nftnl_expr_set_u32(expr, NFT_EXPR_META_DREG, NFT_REG_1);
-+	nftnl_expr_set_u32(expr, NFTNL_EXPR_META_KEY, NFT_META_OIF);
-+	nftnl_expr_set_u32(expr, NFTNL_EXPR_META_DREG, NFT_REG_1);
- 	nftnl_rule_add_expr(rule, expr);
- 	err = add_cmp(rule, NFT_REG_1, NFT_CMP_EQ, &index, sizeof(index));
- 	if (err < 0)
--- 
-2.4.0
-
diff --git a/meta/recipes-connectivity/connman/connman/CVE-2017-12865.patch b/meta/recipes-connectivity/connman/connman/CVE-2017-12865.patch
deleted file mode 100644
index 45f78f1..0000000
--- a/meta/recipes-connectivity/connman/connman/CVE-2017-12865.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 5c281d182ecdd0a424b64f7698f32467f8f67b71 Mon Sep 17 00:00:00 2001
-From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
-Date: Wed, 9 Aug 2017 10:16:46 +0300
-Subject: dnsproxy: Fix crash on malformed DNS response
-
-If the response query string is malformed, we might access memory
-pass the end of "name" variable in parse_response().
-
-CVE: CVE-2017-12865
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/patch/?id=5c281d182ecdd0a424b64f7698f32467f8f67b71]
-
-Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
----
- src/dnsproxy.c | 16 ++++++++++------
- 1 file changed, 10 insertions(+), 6 deletions(-)
-
-diff --git a/src/dnsproxy.c b/src/dnsproxy.c
-index 38ac5bf..40b4f15 100644
---- a/src/dnsproxy.c
-+++ b/src/dnsproxy.c
-@@ -838,7 +838,7 @@ static struct cache_entry *cache_check(gpointer request, int *qtype, int proto)
- static int get_name(int counter,
- 		unsigned char *pkt, unsigned char *start, unsigned char *max,
- 		unsigned char *output, int output_max, int *output_len,
--		unsigned char **end, char *name, int *name_len)
-+		unsigned char **end, char *name, size_t max_name, int *name_len)
- {
- 	unsigned char *p;
- 
-@@ -859,7 +859,7 @@ static int get_name(int counter,
- 
- 			return get_name(counter + 1, pkt, pkt + offset, max,
- 					output, output_max, output_len, end,
--					name, name_len);
-+					name, max_name, name_len);
- 		} else {
- 			unsigned label_len = *p;
- 
-@@ -869,6 +869,9 @@ static int get_name(int counter,
- 			if (*output_len > output_max)
- 				return -ENOBUFS;
- 
-+			if ((*name_len + 1 + label_len + 1) > max_name)
-+				return -ENOBUFS;
-+
- 			/*
- 			 * We need the original name in order to check
- 			 * if this answer is the correct one.
-@@ -900,14 +903,14 @@ static int parse_rr(unsigned char *buf, unsigned char *start,
- 			unsigned char *response, unsigned int *response_size,
- 			uint16_t *type, uint16_t *class, int *ttl, int *rdlen,
- 			unsigned char **end,
--			char *name)
-+			char *name, size_t max_name)
- {
- 	struct domain_rr *rr;
- 	int err, offset;
- 	int name_len = 0, output_len = 0, max_rsp = *response_size;
- 
- 	err = get_name(0, buf, start, max, response, max_rsp,
--		&output_len, end, name, &name_len);
-+			&output_len, end, name, max_name, &name_len);
- 	if (err < 0)
- 		return err;
- 
-@@ -1033,7 +1036,8 @@ static int parse_response(unsigned char *buf, int buflen,
- 		memset(rsp, 0, sizeof(rsp));
- 
- 		ret = parse_rr(buf, ptr, buf + buflen, rsp, &rsp_len,
--			type, class, ttl, &rdlen, &next, name);
-+			type, class, ttl, &rdlen, &next, name,
-+			sizeof(name) - 1);
- 		if (ret != 0) {
- 			err = ret;
- 			goto out;
-@@ -1099,7 +1103,7 @@ static int parse_response(unsigned char *buf, int buflen,
- 			 */
- 			ret = get_name(0, buf, next - rdlen, buf + buflen,
- 					rsp, rsp_len, &output_len, &end,
--					name, &name_len);
-+					name, sizeof(name) - 1, &name_len);
- 			if (ret != 0) {
- 				/* just ignore the error at this point */
- 				ptr = next;
--- 
-cgit v1.1
-
diff --git a/meta/recipes-connectivity/connman/connman_1.34.bb b/meta/recipes-connectivity/connman/connman_1.35.bb
similarity index 67%
rename from meta/recipes-connectivity/connman/connman_1.34.bb
rename to meta/recipes-connectivity/connman/connman_1.35.bb
index dc2c688..950946f 100644
--- a/meta/recipes-connectivity/connman/connman_1.34.bb
+++ b/meta/recipes-connectivity/connman/connman_1.35.bb
@@ -2,17 +2,15 @@ require connman.inc
 
 SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
-            file://0001-firewall-nftables-fix-build-with-libnftnl-1.0.7.patch \
             file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
             file://connman \
             file://no-version-scripts.patch \
             file://includes.patch \
-            file://CVE-2017-12865.patch \
             "
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch \
                              "
 
-SRC_URI[md5sum] = "e200028702c831d5f535d20d61e608ef"
-SRC_URI[sha256sum] = "a9a0808c729c1f348fc36d8cecb52d19b72bc34cb411c502608cb0e0190fc71e"
+SRC_URI[md5sum] = "bae37b45ee9b3db5ec8115188f8a7652"
+SRC_URI[sha256sum] = "66d7deb98371545c6e417239a9b3b3e3201c1529d08eedf40afbc859842cf2aa"
 
 RRECOMMENDS_${PN} = "connman-conf"
-- 
2.7.4


