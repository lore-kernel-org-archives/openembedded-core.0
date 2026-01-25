Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D598E63C98
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 09:40:51 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36247.1769334034621424861
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 01:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S8ZrorN8;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a07fac8aa1so27272335ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 01:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769334034; x=1769938834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0en+eBUXI4KYsJ9Jat9KUxvC8bVx1+pfIf/RAcB0IQ=;
        b=S8ZrorN8JiWuW9tcwZGhy3L+tTICnXvmuKmG7qsz2tbsFKIodZHDY+Ketyudj+7obQ
         uOSMFQG7B59tTxtigZq3uVKhLCtPEzDdGHBdA9ZcB4/CN5XPpfbpluLMBtDc20LnOrVN
         QLL/Y4mtHK8zeL6+SW+/6ZheirEsi1SL2mFxGruLdwaGEWCHGQWwdAx9S+sm0shzxdGx
         mhbbIhuy0NaiYLacFf2TOf61F4/WR16bai1+KbCSuVUWxIN+hIO+6+AVsEUi2dYvXcmK
         Ow/1ifj2wpWukJ8uHV6MxmhVTCZeaNrZmpktQ0wJ/eIfQFn41Dzohp3gxN8Z/7hDCjtC
         uh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769334034; x=1769938834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x0en+eBUXI4KYsJ9Jat9KUxvC8bVx1+pfIf/RAcB0IQ=;
        b=bXKi3f/QLwCzDwGQ4FPIwVQ4SR3WJ4YOwWcKuSX866ezjy8jPPqc57z2fxE20whPRn
         NLlJEjOnVS5SoFsahag/26p6nQhKvL5uFSNez8Sk4yeYM1A0Si8b6wmBUPqGXU+JQe08
         M5gGj0DQAD7UzdUcX3wGRvp7XP4RbwK8i3Te0DcEeBlm+RRNlnVQAuIY9F38ik7sN0AM
         Xpi+9tgkAiq/8NKUSCu+DEWeKEbkq38sOaVCdPFmaVz/KRs+9ukhWCN4hEVNOVsOGNAf
         NQLvoch1FXUBZCEckORaYzR5oW801C5sEiBMXvuzvX9BVL5Q6jIy87KJY54Ml80bH+ZR
         4UNw==
X-Gm-Message-State: AOJu0YzMFMmtTWUuiuVfOWqGBrjkv+VlBPGsoXq4wuvWNRT+Q6ueFKg3
	aEz4DLgKm6pTBqlsDwp0ir7MXBxyhawWM5m/i01UE3MEi1AWSYHr7TM7xWaJ/4Xe
X-Gm-Gg: AZuq6aILhqEndhA1lpcTb+vC1pDuuJH8UU2bF+C2DDLq37pwLGwLJLYgy6j0te2YsU3
	PGfpWt75epFxqnz8pn4Bj6qlj1+ulgg/6Eekg7oTGYICmZJSw4PcVPGFYwH4H+4KmF+fyaehrU5
	vKffOQi16AGZPyutHPok2S38QSjpqRhbtcFlsXsVmHv+qmvOw8mAkx3endvJknmDhHvScb1Zz5z
	SMEdMj78cF1yknX2tgPYYa2HiIJ+rcy5hDogvXtxc6yeytxAKmixSaoOb8iLBu6oEEE/30xaCaT
	exUH09AVjO0pNBfStXKvDWkg4yIdjBnMnF2lnJeUr6pV4UaGL/5dJXdft/I0vPyFolxhMhBpz5L
	lbRyhDso9oQWyeAXyK3UVzthFz1DWz8yCxajis2rpiotyJWEk+ZK2fsHBtpT0y0AD3BtWW3LfDS
	SfhUeNkCV8OrfmMFvhjwc6itpJKwAuJg+HfhU=
X-Received: by 2002:a17:903:2291:b0:2a0:d05c:7dde with SMTP id d9443c01a7336-2a8452e11aamr11309195ad.44.1769334033765;
        Sun, 25 Jan 2026 01:40:33 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97623sm64606095ad.61.2026.01.25.01.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 01:40:33 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 2/2] avahi: patch CVE-2026-24401
Date: Sun, 25 Jan 2026 22:40:20 +1300
Message-ID: <20260125094020.1232242-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260125094020.1232242-1-ankur.tyagi85@gmail.com>
References: <20260125094020.1232242-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 09:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229930

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2026-24401

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
index 0000000000..47efbdd70c
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
+CVE: CVE-2025-68468
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

