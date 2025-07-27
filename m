Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7571C87FCC
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 15:28:00 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.62118.1753630076327309961
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 08:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=dqHyl3i8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250727152747e75be172935cd45c27-5yyq_t@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250727152747e75be172935cd45c27
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Jul 2025 17:27:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=34mzm6bc67z7DSrGc6P2JoNx13f1zli19lphi8U8yvA=;
 b=dqHyl3i8KSyNSjGkAbLgRcd0C0G0M25rS6ueC0YTnaGP6yHH7fm22Lgfia0FSgnN1juxDO
 p/490G3mlaD58RZKUNo2mBlD6JWkLkIrT+OwFFSpwwqCzHkNXT+cjlRvHxdXaSbK4+K6q+3W
 xQSno69bU4Yjh67NbWlFO971akO4/YvR4s79/x4sdE75STgDDoTIjkdNPJHj1p6bujZ18+Pd
 Fd4Ml09IKE33XumG7mhCd1Hs8/tyeIBRGWrsEJSYgcXvFXTXS/t2IagLD/+W9S1D2H64Zpm4
 oNOShcaZMH8pF+WcMp+LVgMkyc8iR4jv0K4+MGfR48tSknpDFLhyaW4A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 1/6] gnutls: patch CVE-2025-32989
Date: Sun, 27 Jul 2025 17:26:53 +0200
Message-Id: <20250727152658.3852964-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 15:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220947

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from 3.8.10 release MR [1].

Binary test file was added as separate file as binary diffs are not
supported.

[1] https://gitlab.com/gnutls/gnutls/-/merge_requests/1979

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../04939b75417cc95b7372c6f208c4bda4579bdc34  | Bin 0 -> 1782 bytes
 .../gnutls/gnutls/CVE-2025-32989.patch        |  50 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   6 +++
 3 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/04939b75417cc95b7372c6f208c4bda4579bdc34
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch

diff --git a/meta/recipes-support/gnutls/gnutls/04939b75417cc95b7372c6f208c4bda4579bdc34 b/meta/recipes-support/gnutls/gnutls/04939b75417cc95b7372c6f208c4bda4579bdc34
new file mode 100644
index 0000000000000000000000000000000000000000..ffcfe23e99d4b353f07192729a86ffb5a249bbde
GIT binary patch
literal 1782
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

literal 0
HcmV?d00001

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch
new file mode 100644
index 0000000000..d8724c0d68
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch
@@ -0,0 +1,50 @@
+From 8e5ca951257202089246fa37e93a99d210ee5ca2 Mon Sep 17 00:00:00 2001
+From: Andrew Hamilton <adhamilt@gmail.com>
+Date: Mon, 7 Jul 2025 10:23:59 +0900
+Subject: [PATCH] x509: fix read buffer overrun in SCT timestamps
+
+Prevent reading beyond heap buffer in call to _gnutls_parse_ct_sct
+when processing x509 Signed Certificate Timestamps with certain
+malformed data. Spotted by oss-fuzz at:
+https://issues.oss-fuzz.com/issues/42530513
+
+Signed-off-by: Andrew Hamilton <adhamilt@gmail.com>
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+CVE:CVE-2025-6395
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/8e5ca951257202089246fa37e93a99d210ee5ca2]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ NEWS                                             |   5 +++++
+ lib/x509/x509_ext.c                              |   2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/NEWS b/NEWS
+index 85efb5680..025e05148 100644
+--- a/NEWS
++++ b/NEWS
+@@ -5,6 +5,11 @@ Copyright (C) 2000-2016 Free Software Foundation, Inc.
+ Copyright (C) 2013-2019 Nikos Mavrogiannopoulos
+ See the end for copying conditions.
+ 
++** libgnutls: Fix heap read buffer overrun in parsing X.509 SCTS timestamps
++   Spotted by oss-fuzz and reported by OpenAI Security Research Team,
++   and fix developed by Andrew Hamilton. [GNUTLS-SA-2025-07-07-1,
++   CVSS: medium] [CVE-2025-32989]
++
+ * Version 3.8.4 (released 2024-03-18)
+ 
+ ** libgnutls: RSA-OAEP encryption scheme is now supported
+diff --git a/lib/x509/x509_ext.c b/lib/x509/x509_ext.c
+index 064ca8357..05336a0c2 100644
+--- a/lib/x509/x509_ext.c
++++ b/lib/x509/x509_ext.c
+@@ -3757,7 +3757,7 @@ int gnutls_x509_ext_ct_import_scts(const gnutls_datum_t *ext,
+ 	}
+ 
+ 	length = _gnutls_read_uint16(scts_content.data);
+-	if (length < 4) {
++	if (length < 4 || length > scts_content.size) {
+ 		gnutls_free(scts_content.data);
+ 		return GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE;
+ 	}
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index e77960724b..367872d47e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -24,6 +24,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://run-ptest \
            file://Add-ptest-support.patch \
            file://CVE-2024-12243.patch \
+           file://CVE-2025-32989.patch \
+           file://04939b75417cc95b7372c6f208c4bda4579bdc34 \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
@@ -62,6 +64,10 @@ do_configure:prepend() {
 	for dir in . lib; do
 		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
 	done
+
+    # binary files cannot be delivered as diff
+    mkdir -p ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
+    cp ${WORKDIR}/04939b75417cc95b7372c6f208c4bda4579bdc34 ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
 }
 
 do_compile_ptest() {

