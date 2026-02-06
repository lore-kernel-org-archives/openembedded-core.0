Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E0CEE2088
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 10:43:42 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8682.1770374618830400050
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 02:43:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j5jyts4o;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82311f4070cso1434860b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 02:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770374618; x=1770979418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KT3scYQ3EaMxvZ04IWacINzRfC97WqGBOwRnQdUDD1g=;
        b=j5jyts4oRad2jdALwXPsOPdp04M087R8hIIPMRRZyTbZ3IEDu4faLcYptIw/+UgZK/
         wLt1YTF/KL6ZelLUtA3yuk9EpCtCtsZYqiUE1GTWp84JMG2J6LzOs8pkoPMxWP9OCvAZ
         njS19+702ArTNYy8kOb3UfNmQjZ8TgIMRFiQpZvrpyBpcylV4X2qNZqoUpoH46VfdN0W
         Y06rRNOECymq3A2rF+S8r06aVzzN2uK0HhzVQFH/8+gEJZaMZ/xUSotnosItUMNDOGeV
         oAeu/hM4KugmtbWH2J55HK1A0hSxosfJKo4vE+6TmWQYs7qIlYJlferoU8mQIAgGyqOi
         KA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770374618; x=1770979418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KT3scYQ3EaMxvZ04IWacINzRfC97WqGBOwRnQdUDD1g=;
        b=sk18fuqvvRf+tIELNi57z9STy5Wkp+cKDrST0R0HxJxX07GQZE3yYbc/hmS4BN+EKv
         zPpg6yJqP/cBILWVemOGmrmC/GzWdOw9r440oGjkndMVECTop32drifg2pTMroGbvPOy
         MQspkCaJ9GulVpd2HRQX7CzMfhxOanTdyfXUD3BEwlMXAbBx5cp+e1zDBTXWvk8uA5vx
         Ixe1IV6oGn6ceDN6ZcwZ76tUpLlMHjPXOrQ7LsGKJitCkMU8ie9geljW6dIcYZlRyoex
         PvCkuKFe25m8r9O60/SslPq6D2NVmObNEVjcvXFT0i3JeXlRIK7bp4CVylarEoxLwR+0
         xkFQ==
X-Gm-Message-State: AOJu0YzVvibVD+VM1Z14E4750unSZBQa0bVicBGdEBgzRzz2w+92p+FQ
	MYgFuj/H8wU9gFQLvJBA1owV8rYXzeE91R1H6hL78rJ7roAYkjEVhrf6zUwLGg==
X-Gm-Gg: AZuq6aL2f5SjcZl8kGUF26rqiHWfK57VOhWuxc0gyz7rmbeRk7VyrQ5JMPZj7pP7oeU
	3OFx8I08WThiv5smpgSCmtGzgNW6nqvE158RLXQLRQgwlS269PpuFgYklynFTuoGSToBQMWpDph
	45Ik1fOsK++aUho8x9SsnQ8g/Uly7aVtPatzScrp69CoVDMR0VOUTNuXvbMUtO/tf0+v97yzIre
	GR+uleSxL+LHoPlSIJ9VLl0q4nblPwNybuJvITOEl6owfmb3a/e3Zrt/DSR7/q3T70P+IZKKlw6
	8Qh2kITCBKpx0WcYYDh5HWNPj1zWNTY8EDE8IikWR5mu1hYLM753Mzqk3VBToG5ZoQfuqBFXxN6
	vYxZx3gopsrNOcPgLeysYvA+avzeDxYFA8PgmfDQVg2lNFr0nAgH6DAjixiHGwrcsVe+OnydbKw
	QK+9F/YOl2BDwkrRBPju1cFnc=
X-Received: by 2002:a05:6a00:32c7:b0:81f:32cc:b1fc with SMTP id d2e1a72fcca58-8242d3d1890mr5874717b3a.3.1770374617849;
        Fri, 06 Feb 2026 02:43:37 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418ff231sm2374434b3a.69.2026.02.06.02.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:43:37 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 1/5] avahi: patch CVE-2026-24401
Date: Fri,  6 Feb 2026 23:43:18 +1300
Message-ID: <20260206104322.2604271-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 10:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230603

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2026-24401

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2026-24401.patch          | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index bd61c39dbf..35f779c914 100644
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

