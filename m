Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF08E63C9A
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 09:46:31 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36291.1769334388127747544
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 01:46:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f7snKpYq;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-bc29d64b39dso1324579a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 01:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769334387; x=1769939187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pHaQ9irHzjMnDYBS4cGXiH95+FJJ2+IB5OyaJ7ys1so=;
        b=f7snKpYqJ9qtkIUgIQk2EqEOTDZ+29pSP76LHs7wGBeurVFjhi1lnUTqzztVmUHvBJ
         F85X7ZKo+KLB1q9s6Ktn4GTwY99uN092Q6nBk0nFCraqMFTaVF9kyB3ChWoKLnV2CauM
         Hg/pwp+C7WssUYv9K/U+gnx7miQHrQx1r6r6UQ2HBUlxpmK3yO0vL2ySGaO1+3+dyIRZ
         EHmOnRYHp3Jvxjwg1YY/ZnW5uhNBA1UT0tfRG3bAdPerNfgNE5CG5U9vGc/MPPBoSCCT
         xTbOH/LBIeJFncO7vJwR2ApP2WuoQXw+Jvsu2Fz/81pXPHMPd+1VNizplHRSRIRe83OM
         gZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769334387; x=1769939187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHaQ9irHzjMnDYBS4cGXiH95+FJJ2+IB5OyaJ7ys1so=;
        b=kTbBtoaMv781K5u1j7cB4/xGFIFiSLhDs8la4JOrrxtsAoFkqhJbvnNLI331g/t1cn
         stTTTAerPEGp87jtMm+qktvtEhx//DTnNhwF3+da4jeqSBTtw8UUvkGh68DPson3f4r1
         VMU5wUM1r+bpyKYe6TaFBw7+jY+nzC4wRXNIvLEx9LzaZONcKtxobb7TeOfVdJZCDOWc
         NGRdoRpR47HCS6qmR66sbxcz3UxIDwai/OdZiayqCYK7htQ6VFjGq3/ARpigr+LZLo1V
         Hu0K+WX4MkWjmI/tvnYjpc6hYvVBQ15rYX8qkYsvkFP8K38uXFSz49iALW7mHP9URmDD
         zDPA==
X-Gm-Message-State: AOJu0YzhPxCYlWTKSbW61igmDmKCaqW7xTYKcGr2QV5lV9V5+U4rhsTx
	MxFiALuFe4/KPQPbIzuL4mqTqJ6268gdut5J9j0CwCcY/hUKX9Dw29RhpmrddSag
X-Gm-Gg: AZuq6aICqWzkW7WcFxizl9rvotKqSTUkPEuFPLjYmGpPvDhnPKdYEbNY4w8AHqpbZWD
	U90m2dx30rgdg91RAKz7VZjR0hqMifre+9cIuiSlQTa9rSCoEEnte5rbtllGn6noJaDZZvhZ16G
	nJJXsdhUEtHRjkUGDbRk+CiX+q+Xmb5hU94/gLKPGP9JA4LLHAtRj7iqXkN4tku+RGyKPfx5sG6
	gChD23acQ1Ermo2dttreXgY2y7CBM42f9vWl3YYGSNlCY9KeqH5wyX+lTf/0VA7YXJY5YmXgfF4
	Re/iva7Nr/g69BWk4cRLVr9Xz53U25Z6SOURJwiTpbZ9XitfxcXd7+j537w49Ut0uFTe40NOhFK
	WKx3r/szrCC9PHkf/x1FwbkGrl8Lf7u0123D1Pxwt63wO62Yigs8+L32p64VoE6ZN4m/V+HaFYO
	njxtcbEjWyxkUR0PlVfmxoySo0
X-Received: by 2002:a17:902:dac7:b0:2a1:360e:53a7 with SMTP id d9443c01a7336-2a84522f78fmr10339695ad.13.1769334387285;
        Sun, 25 Jan 2026 01:46:27 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97693sm65046205ad.66.2026.01.25.01.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 01:46:26 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH v2] avahi: patch CVE-2026-24401
Date: Sun, 25 Jan 2026 22:46:20 +1300
Message-ID: <20260125094620.1239193-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 09:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229932

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2026-24401

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
changes in v2:
- fixed CVE reference in the patch
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2026-24401.patch          | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index bb20fd17cc..bf93e4c7b9 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -38,6 +38,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2024-52616.patch \
            file://CVE-2024-52615.patch \
            file://CVE-2025-68276.patch \
+           file://CVE-2026-24401.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch b/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
new file mode 100644
index 0000000000..1a442966fc
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
@@ -0,0 +1,74 @@
+From 5eea2640324928c15936b7a2bcbf8ea0de7b08f7 Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix uncontrolled recursion bug using a simple loop
+ detection algorithm
+
+Closes https://github.com/avahi/avahi/issues/501
+
+CVE: CVE-2026-24401
+Upstream-Status: Backport [https://github.com/avahi/avahi/commit/78eab31128479f06e30beb8c1cbf99dd921e2524]
+(cherry picked from commit 78eab31128479f06e30beb8c1cbf99dd921e2524)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ avahi-core/browse.c | 40 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 40 insertions(+)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index f461083..975b3e9 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -401,6 +401,40 @@ static int lookup_go(AvahiSRBLookup *l) {
+     return n;
+ }
+ 
++static int lookup_exists_in_path(AvahiSRBLookup* lookup, AvahiSRBLookup* from, AvahiSRBLookup* to) {
++    AvahiRList* rl;
++    if (from == to)
++        return 0;
++    for (rl = from->cname_lookups; rl; rl = rl->rlist_next) {
++        int r = lookup_exists_in_path(lookup, rl->data, to);
++        if (r == 1) {
++            /* loop detected, propagate result */
++            return r;
++        } else if (r == 0) {
++            /* is loop detected? */
++            return lookup == from;
++        } else {
++	        /* `to` not found, continue */
++            continue;
++        }
++    }
++    /* no path found */
++    return -1;
++}
++
++static int cname_would_create_loop(AvahiSRBLookup* l, AvahiSRBLookup* n) {
++    int ret;
++    if (l == n)
++        /* Loop to self */
++        return 1;
++
++    ret = lookup_exists_in_path(n, l->record_browser->root_lookup, l);
++
++    /* Path to n always exists */
++    assert(ret != -1);
++    return ret;
++}
++
+ static void lookup_handle_cname(AvahiSRBLookup *l, AvahiIfIndex interface, AvahiProtocol protocol, AvahiLookupFlags flags, AvahiRecord *r) {
+     AvahiKey *k;
+     AvahiSRBLookup *n;
+@@ -420,6 +454,12 @@ static void lookup_handle_cname(AvahiSRBLookup *l, AvahiIfIndex interface, Avahi
+         return;
+     }
+ 
++    if (cname_would_create_loop(l, n)) {
++        /* CNAME loops are not allowed */
++        lookup_unref(n);
++        return;
++    }
++
+     l->cname_lookups = avahi_rlist_prepend(l->cname_lookups, lookup_ref(n));
+ 
+     lookup_go(n);

