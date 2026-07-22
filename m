Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7C1C531CE
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:10 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5520.1784741043244001071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mBaUQBqw;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso48879855e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741041; x=1785345841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3GgEg8TdPXSkd1YBU5G1GH/7KLdouzPpl1d5WWFEdS8=;
        b=mBaUQBqwsRPG/pL7XRbA66psqmiZxgypZ+0k3kgYEXoJKpDCapvnugYvTL0Y+VpPKG
         HJnAqCyTJkkuPZgvJ8hpmHYygXFem7ba8sNt5Pqj5U/E6n7Ipi0OFpBdbpBsEXNdpjO5
         SK4sdlC784GEd0UkhyT9mJUhKft5hC5BNLXlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741041; x=1785345841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3GgEg8TdPXSkd1YBU5G1GH/7KLdouzPpl1d5WWFEdS8=;
        b=qrlfnUijmSENZ5RgHaNUcR5j2Cv9dSg1xTqe5RdF+/47/X4/3BmrZS2tzlUvF25Vln
         c+n64Ve1b7Gta0G29u1JVfknn4chkL7hLWYcQaK/cFINtuagptAPCKJEuNHT/Joh6aYJ
         heDx1N587eTJCwpa+5lkANFSWghj1m+1XqxcvvitcujxP0Xmfi5XnJSvttAQpPKktj9d
         HLZSPAzmoFAAGGDJWb64UkkWGtKYXE7AxNys9RuW8kFhU5M4VfuMyDrTlFvFA9n3imN1
         OFaqhQFPT/8VpraZ1RtUUuLLVMv5/LhDHbV3BER8KqgCE2VUV1HXdc4peUliq57hhOqH
         wRMw==
X-Gm-Message-State: AOJu0YzmFQhB97/R4w1k8hCZyGJoihihDDKcXbHKgJi4hdvSyA90GdJ6
	xud6HM0a3z5Pr/KGx9EBzLPBhMtBTsUWOL8ccWLVgNyvk5IXcw7Kkhd2hKOKYBY45awgdfdpmim
	Pn2kdeVQ=
X-Gm-Gg: AR+sD10dA/l7cjb0t9dpnyAJImXTxWCXtMZeIt62peuU0WJC6Yc9YLedDIBQ1uZFGC6
	wBEnWCS4u28qPvLm20R2L9rfA7tEQGcB8yP7xpZWsuOJU+wCRK/rHUaFJAkdPmmchDTvabwy1Qo
	MIe7uveMEewBJCgOhKWyhAn+c1wlD6vKA79w6rJyoT1Pz1oXuiLcuqztaaNxOrK43oM8hs5CpLj
	l0kKhxegUrjn/tSGNcpDkC4/BHbPvf58oTxWV33MIP4yaBG3KEHrOI4BXC9AAUzvpCpDQFr/vdp
	wivixf9VEbAsxq82zgfHTyzRxZv7g+fV1PeO/FZxPZizorNrAJJqFFEaGEWRV95scyMn/ZE+Ams
	H+YsC1RKpRLJsaMdWzcBKLwEEW2basdSCoI+1sxnY0FQL9xAD6MxGBjG5E9ZQ737/TGntq7ZgTj
	PpVE4CC0KDp28oERIxggJ+1HwGofCFMFMSt/mx4aoqrVVH9P1xrli3fSzgYB2luRnlz12bqsYVH
	rXCRPbLRBmJiKoj09B53Xo=
X-Received: by 2002:a05:600c:8284:b0:495:5d6d:d4f7 with SMTP id 5b1f17b1804b1-4955d6dd523mr177623365e9.24.1784741041428;
        Wed, 22 Jul 2026 10:24:01 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/27] expat: fix CVE-2026-56409
Date: Wed, 22 Jul 2026 19:23:20 +0200
Message-ID: <00ba44abd083f009274ba0cebbd2b1fbcde83879.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241717

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56409

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-56409.patch          | 53 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56409.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56409.patch b/meta/recipes-core/expat/expat/CVE-2026-56409.patch
new file mode 100644
index 00000000000..ff0e650a2ab
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56409.patch
@@ -0,0 +1,53 @@
+From 10938bc2cef7573087566b5b1c948061baa68b98 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Mon, 1 Jun 2026 11:53:19 +0530
+Subject: [PATCH] xmlwf: protect output path join from integer overflow
+
+CVE: CVE-2026-56409
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e]
+
+Backport Changes:
+- Adapt the allocation hunk to the explicit cast used by Expat 2.7.5.
+
+(cherry picked from commit 61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlwf.c | 22 ++++++++++++++++++++--
+ 1 file changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
+index 06416454..6a0a707a 100644
+--- a/expat/xmlwf/xmlwf.c
++++ b/expat/xmlwf/xmlwf.c
+@@ -1236,8 +1236,26 @@ tmain(int argc, XML_Char **argv) {
+         }
+ #endif
+       }
+-      outName = (XML_Char *)malloc((tcslen(outputDir) + tcslen(file) + 2)
+-                                   * sizeof(XML_Char));
++      const size_t outputDirLen = tcslen(outputDir);
++      const size_t fileLen = tcslen(file);
++
++      /* Detect and prevent integer overflow in the addition (without
++         risking underflow) and the multiplication, mirroring the guards
++         in xcsdup() and resolveSystemId() */
++      if (outputDirLen > SIZE_MAX - fileLen
++          || outputDirLen > SIZE_MAX - fileLen - 2) {
++        tperror(T("Could not allocate memory"));
++        exit(XMLWF_EXIT_INTERNAL_ERROR);
++      }
++
++      const size_t charsRequired = outputDirLen + fileLen + 2;
++
++      if (charsRequired > SIZE_MAX / sizeof(XML_Char)) {
++        tperror(T("Could not allocate memory"));
++        exit(XMLWF_EXIT_INTERNAL_ERROR);
++      }
++
++      outName = malloc(charsRequired * sizeof(XML_Char));
+       if (! outName) {
+         tperror(T("Could not allocate memory"));
+         exit(XMLWF_EXIT_INTERNAL_ERROR);
+-- 
+2.43.7
+
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index f14e39c00b3..cb8f9dd1acd 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -28,6 +28,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56410_p2.patch;striplevel=2 \
            file://CVE-2026-56406-dependent.patch;striplevel=2 \
            file://CVE-2026-56406.patch;striplevel=2 \
+           file://CVE-2026-56409.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

