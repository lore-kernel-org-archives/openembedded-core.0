Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B935C4453C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5513.1784741040402550656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lnqvsTst;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso34198745e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741039; x=1785345839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8F1r9PMhHafkKhyHGvxsEyt3tI1QI5kkGilOcDEhjDY=;
        b=lnqvsTstd2OI44N3WNQIclWvNCMS9zV8HEJBa9YoHxa9oRFs9cOVAbjWpSNLX8xqVr
         4yW/ChPvQd5oxRkGRN8veiPTHhWnqwaZKDQ4YioK+ifYggeIalK9nVRUry9VrbCNGg6T
         6Fz4iRgCDgCobKUYuML5xwLi3P7uyyT+LuKhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741039; x=1785345839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8F1r9PMhHafkKhyHGvxsEyt3tI1QI5kkGilOcDEhjDY=;
        b=H70W3vAe7U5GcLTKcpy9yt2lOUVhzwxydhkrn6N3aZSJUhq3AINXFl5OAyvkbpydmq
         5l9NzqKmCjd0ZK8My/IipQHugS/mHmmNDaVOFSM/hU0UN+Vmk4ez8hakFFxHuTZDQUIA
         Ev3CxkxVfSIa5Xt4aBPE0DeMbsMRpK3YKSiBAJhxS/dsQKmvTLtMLbSDC5nqNZSLqFI0
         bOo0SDdICfFzk8tuOVjwjP5H/NgZ/qnxYfvRw0A7MYaLNnxI+e94Y93OEwWaQd5jiwQF
         b9lF21YPE5sqNuP8fwiogzTGXGjOqQXf2sEiDTEuw2L0b9c0MuNNyJd7tQePM3Q/8CUZ
         mHcw==
X-Gm-Message-State: AOJu0Yy//XFym9VJwDwpMC4ws9Jsiyzuv3DQGHAQC3+aieQiMOsmP6ZI
	JD5eBDMuBEWQWxwC6Hn3TWzLEgSwJmzZgOHm8ADYbcKRNs3AdZQAWor2sGybzy/6LU6kTYpRRbx
	cTp/QnSU=
X-Gm-Gg: AR+sD10fqr6Fz+4f1JXVjq0KB+EuKOOGf6NUhhhCRoEp8lESMB8gk3UZv/C9twEp9Xp
	FEQgKm5qRDf5xGWrSEzw5ujen6tJEBg4x6xN1UKkUMbHuHFZbpL/eGapc2idUv8xYLVVkdcvqvC
	d77dZTzO9PYH5IIth05vgZe+kjWI9CIlXLwIhjIQ/w/GI1DNhH9iRBpkTbnJG2Rty7wiZKOcXZS
	nDWVruLXLpH1NwE6Fi+/iIyS39QEAB7uMQtyp5w3VSsOVGbCQw5bG0vzuGjwgOB1xlyC4D7OPdL
	jlsT40UiRXuPkl90iZznoU2t48Jo9OtOp8L4yw9yh0tHR8wIhVMROYyC5iMEMIDj9tLzPmon2gP
	x4NE6OBsPUVDMHT63qYHZBDL9GErzrah0XioQNk5sMwo/eGys/SIEmyRRcNBWY/L2RLGddklbZy
	jKjNFp9ojiiNQm2hG5ukfvoVTwxGIugGI1UyOGQPuy8qI1qWqdlXgTfrpSUDCHnK49R5sGBeCEe
	AM/kzCM0ETt
X-Received: by 2002:a05:600c:4585:b0:492:45a0:dcef with SMTP id 5b1f17b1804b1-4954a3eeb63mr276102885e9.5.1784741038612;
        Wed, 22 Jul 2026 10:23:58 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.23.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:23:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/27] expat: fix CVE-2026-56408
Date: Wed, 22 Jul 2026 19:23:15 +0200
Message-ID: <34dd4a797ba9600bba27d817702cfc59c69563ea.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241712

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].
The fix is adapted to the existing Expat 2.7.5 copyString implementation.

[1] https://github.com/libexpat/libexpat/commit/16e2efd867ea8567ffa012210b52ef5918e20817
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56408

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-56408.patch          | 36 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56408.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56408.patch b/meta/recipes-core/expat/expat/CVE-2026-56408.patch
new file mode 100644
index 00000000000..b8c43636cc0
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56408.patch
@@ -0,0 +1,36 @@
+From b0cf9e9b0f5dfdd938148931a4605a0fd6b917a7 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 23 Apr 2026 10:31:45 +0200
+Subject: [PATCH] lib: Waterproof `copyString` from integer overflow
+
+CVE: CVE-2026-56408
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/16e2efd867ea8567ffa012210b52ef5918e20817]
+
+Backport Changes:
+- Adapt the fix to Expat 2.7.5, which calculates charsRequired using
+  an existing loop instead of xcslen. The upstream string helper
+  refactoring is not required for the overflow guard.
+
+(cherry picked from commit 16e2efd867ea8567ffa012210b52ef5918e20817)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index e441ff7f..4ff5e33b 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -8505,6 +8505,10 @@ copyString(const XML_Char *s, XML_Parser parser) {
+   /* Include the terminator */
+   charsRequired++;
+ 
++  /* Detect and prevent integer overflow */
++  if (charsRequired > SIZE_MAX / sizeof(XML_Char))
++    return NULL;
++
+   /* Now allocate space for the copy */
+   result = MALLOC(parser, charsRequired * sizeof(XML_Char));
+   if (result == NULL)
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index 423219c726f..934cde4b1a8 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-41080-2.patch \
            file://CVE-2026-56403_p1.patch;striplevel=2 \
            file://CVE-2026-56403_p2.patch;striplevel=2 \
+           file://CVE-2026-56408.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

