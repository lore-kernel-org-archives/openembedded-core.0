Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD5AF357B3
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:41 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21494.1771943138899149442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fQ+Le7eM;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4398d9a12c6so17524f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943137; x=1772547937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNz43UGFsp7zhe/JIBR+0gImg0v1WTfM8pun2AuvZ2c=;
        b=fQ+Le7eMZvvWG+bBlD5CCd/ft9VjMlkGl8A+5L2Ac5uRH0QPESUKSlCvrcPMIGNlrh
         R+wb39VpmMBUHOmd/dNio7gmWEV4DQhLQe5vNbX3BpnVkfErBjPmmCeL5mMehJ/Qj8yN
         0w4oXj3fo99Sj7Flca8WkqjQ7NXRBVzJlzMDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943137; x=1772547937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VNz43UGFsp7zhe/JIBR+0gImg0v1WTfM8pun2AuvZ2c=;
        b=a6QwkelMnu/hqXcWUy3w0FHCoPn9oTR7sTRpZlaR4TuezN5Sto1gNg+Tkrg/Vj62Ny
         jrAYFny58n/LjqS6jQXN7psgHwQuvsIc8wf2I9O4I6BI3hZMT/9coJEyeev9DjMjgmAl
         4ZXk43O0GpkpebzcilhHJ5yr6UTCoxEuDbxYPFrvcoBdvvWZVMHTH+jxgL/SeIEa03ca
         5+cLdZwhXXPDISZhwx1nAdwia/BUrzsHRcnHm0MHEPZrdBChZpclulaykvOhRjew5ZKZ
         8oCFIUhJaYPTurBIRUYoBMhg+tg5uNi2lUcE7S4qkKcq3LmtnerIVMst4j+6ppLK9IfK
         pUDQ==
X-Gm-Message-State: AOJu0YxpOxT4hlsQA1TEPXiNtej/2q8DvaFT1nq5dQmrms4PK+u1+K6l
	SqjmYFYVM2gA7bB6x43r8nIkwK1556nC6wbYa1t0l5kMmQ2x/nL7J2yetmp2OI3ZS2+nw56XjAG
	MvOTZ
X-Gm-Gg: AZuq6aK5+0Ce4Z/eubXJoYtf9zoQo2AOj2pYi1cl3+5/FHRijh+lGD0IGyX3tHQk/fi
	Fqx6MMmPAJMVvt3CQQSl/O0vCnaWA3gEwBMB5rmjsO9sWRy7quPQlPx97eBK5qhQDb1/ZHfMsX+
	9LgN2PHPpNd6PFPSybGOmDspLhQABU1ctRNs6ZaLAdwK/36BT0glkn/2OMOI9NnwMiKrVC9KBsT
	zrC4UrKjHaw0il9yiCvKlG6VdWqgrbeFKnxq4tjQBLO9jibkrJeNObGRn4JHA2Qf8ofFortQ7EZ
	jyuapNMot+ra4h6Qkf9LkKt0z4GnoZ/JG82O+9PfSX6TN+DiPaILhIamaWH6UPVMRJ/7D6KCySq
	6zNsjcNv3WFxv068liYZ7++1ULMz7QdflVOxuo+ZJMLP4kbcVhbHLtQVTv5+sHhT4Nrt1scKCM7
	xFPkYNYz1XEGdfLYA7GC8uox0WI9MueyLCuG0vSTzlrkjBJyx9CGEI9W1a9Lqlr3FX+qGERJDUx
	HbxatdhJpoQiXoM7YP9NLivaygkE/LQYw==
X-Received: by 2002:a05:600c:46c9:b0:483:a21:774c with SMTP id 5b1f17b1804b1-483a95eab7cmr214129555e9.25.1771943136989;
        Tue, 24 Feb 2026 06:25:36 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:36 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 37/38] libtasn1: Fix CVE-2025-13151
Date: Tue, 24 Feb 2026 15:24:29 +0100
Message-ID: <70b4b85f62125e179ab55e2f659b5505fd77011b.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231803

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport from https://gitlab.com/gnutls/libtasn1/-/commit/d276cc495a2a32b182c3c39851f1ba58f2d9f9b8

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
[YC: pick the merged commit from the MR linked from the NVD report]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/libtasn1/CVE-2025-13151.patch      | 30 +++++++++++++++++++
 .../recipes-support/gnutls/libtasn1_4.20.0.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch

diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch b/meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch
new file mode 100644
index 00000000000..5047d679840
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch
@@ -0,0 +1,30 @@
+From ff7aa7ef2b9ba41df8f2d1e71b05bf2c2ad868dd Mon Sep 17 00:00:00 2001
+From: Vijay Sarvepalli <vssarvepalli@cert.org>
+Date: Mon, 22 Dec 2025 12:24:27 -0500
+Subject: [PATCH] Fix for CVE-2025-13151 Buffer overflow
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/libtasn1/-/commit/d276cc495a2a32b182c3c39851f1ba58f2d9f9b8]
+CVE: CVE-2025-13151
+
+Signed-off-by: Simon Josefsson <simon@josefsson.org>
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ lib/decoding.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/decoding.c b/lib/decoding.c
+index 1e0fcb3..abcb49f 100644
+--- a/lib/decoding.c
++++ b/lib/decoding.c
+@@ -1983,7 +1983,7 @@ int
+ asn1_expand_octet_string (asn1_node_const definitions, asn1_node *element,
+ 			  const char *octetName, const char *objectName)
+ {
+-  char name[2 * ASN1_MAX_NAME_SIZE + 1], value[ASN1_MAX_NAME_SIZE];
++  char name[2 * ASN1_MAX_NAME_SIZE + 2], value[ASN1_MAX_NAME_SIZE];
+   int retCode = ASN1_SUCCESS, result;
+   int len, len2, len3;
+   asn1_node_const p2;
+-- 
+2.47.1
+
diff --git a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb b/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
index 8127ba5b1db..bfc011a2f17 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
+           file://CVE-2025-13151.patch \
            "
 
 DEPENDS = "bison-native"

