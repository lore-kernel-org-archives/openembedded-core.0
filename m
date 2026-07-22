Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0F5C531CA
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5514.1784741041013538914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=X8SToto4;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso28219145e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741039; x=1785345839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y5vHr4uU8lyWWbewqVtVQk/gkousJZ1Kr3cBFou/cug=;
        b=X8SToto4msLt7UsuGTGKEj3yghlC3VQ7ozHjFi5KCfv3Lgk4chiovOb/vn7DFaXzQM
         9wp06Zeg5HLJKeDP6yCEdYPIKEBIW1iVvpTuB6Wd37YfLMfdiYrUctWmtpHqz41oMUOd
         ZmggwjXq3+Y48bTQltKCdFORwuZd2g590zay8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741039; x=1785345839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=y5vHr4uU8lyWWbewqVtVQk/gkousJZ1Kr3cBFou/cug=;
        b=g/cM4r/CguKxOPwHFJ7guDDL9Jk7osyWmQ8x1jMMoOEAOJHTDygr6AyyJHldK1hA9s
         568kVXH3L0lANSsJS5Vyz+gWhhf9fbcIIbgCUqI2lVppSQBkn0YJX9jWDuZN6dYMplJ9
         eBkGanSD+fLNsQnMP3PKss98ZgIFY1r/88fTJP5jMEp0wdsC37WLwfupP0IntSGGJrJk
         5s9VO7F5O2bfxL5Jr9P5BX7LFiFOl725X/7yaHCVGsAzBCEdWgK7zbacYU9sY3WM7alr
         bKb9XeBbTOgA/9XaSMqujanXf/qjXReQiSJZTvAqVeKjPxDyo1uHLDkJrLHW6VN//Zqq
         NE3g==
X-Gm-Message-State: AOJu0YxWRS7eOS/gQky/JGtMzMe81cCZonoQZGavaGT0EtUnVGm9EMty
	FGbgCsOYAhjF6LnmeTjbqEg67f6KuVoPJNj0tj/5q+XPmn27ojVY8n3g34dVi0/mhIbTWRbQ4Qs
	iDnxk5To=
X-Gm-Gg: AR+sD10rtyQQgv390eUTqJhstT8AGmqkVtKEcEgomUWQMexexneF2hQd7h9EP0bHHZS
	5W33JleKPHPnOf1nLUVJEW6Mq+yUedBauIJXU09xusrodVk9eM0XHUfUcUcaTcKGjYfCTs+MyMr
	u3wiwWOzzy6TivTKOGjU5ilmMi3Kl6s6eKVGLflhH1lnqR6unApv9viZWjTSQ4gRBK/3j7HbuTV
	IoG8rAM88Xi5cggia/mfIQonVjjPiT3kNwzxvtlcLho04xUDrM1AZDGNJaiiTy4wz4hYxZgpVHL
	Sf8yHB4tTBrZHfTkvyilY7OH+6QtVgqz2xFWdgz52sDpbI4RnqJ0YXJ7Px7A22o0Qj6C+CkKk6t
	gWfmPSABuVQaXRaCrAlyTWdoW1tMFa2a0rz6xXaXU85p6sG93/0WRPj9ieLrPFDn28mvDnJoeVX
	XgXtBNKOLCRn4GyMNWuXBzFgo8Sn7kdM7ytwNDS0nOpayaIMylz6S1gRQTM7bCtK8MUuWcz8oWG
	D3xFrYw8SsS
X-Received: by 2002:a05:600c:6989:b0:495:5d34:e62c with SMTP id 5b1f17b1804b1-4955d34e948mr177656115e9.10.1784741039167;
        Wed, 22 Jul 2026 10:23:59 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.23.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:23:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/27] expat: fix CVE-2026-56404
Date: Wed, 22 Jul 2026 19:23:16 +0200
Message-ID: <7b5ff0e62348954891add80448ce3c349b8af9a3.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241713

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/babfc48090977cbf7be24b2c48f6053dca75c164
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56404

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-56404.patch          | 47 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56404.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56404.patch b/meta/recipes-core/expat/expat/CVE-2026-56404.patch
new file mode 100644
index 00000000000..6bca7cf961c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56404.patch
@@ -0,0 +1,47 @@
+From 8cb4583ac3204175a03c8ea8e371adee583b0bec Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Thu, 28 May 2026 12:44:11 +0530
+Subject: [PATCH] lib: protect function addBinding from signed integer overflow
+
+CVE: CVE-2026-56404
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/babfc48090977cbf7be24b2c48f6053dca75c164]
+
+(cherry picked from commit babfc48090977cbf7be24b2c48f6053dca75c164)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 53f842d1..33b92c9c 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -4485,6 +4485,10 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+   }
+ 
+   for (len = 0; uri[len]; len++) {
++    /* Detect and prevent signed integer overflow */
++    if (len == INT_MAX) {
++      return XML_ERROR_NO_MEMORY;
++    }
+     if (isXML && (len > xmlLen || uri[len] != xmlNamespace[len]))
+       isXML = XML_FALSE;
+ 
+@@ -4525,8 +4529,13 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+   if (isXMLNS)
+     return XML_ERROR_RESERVED_NAMESPACE_URI;
+ 
+-  if (parser->m_namespaceSeparator)
++  if (parser->m_namespaceSeparator) {
++    /* Detect and prevent signed integer overflow */
++    if (len == INT_MAX) {
++      return XML_ERROR_NO_MEMORY;
++    }
+     len++;
++  }
+   if (parser->m_freeBindingList) {
+     b = parser->m_freeBindingList;
+     if (len > b->uriAlloc) {
+-- 
+2.43.7
+
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index 934cde4b1a8..d15e0232077 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56403_p1.patch;striplevel=2 \
            file://CVE-2026-56403_p2.patch;striplevel=2 \
            file://CVE-2026-56408.patch;striplevel=2 \
+           file://CVE-2026-56404.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

