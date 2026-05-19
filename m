Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2361CCD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:22:40 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17505.1779182218158205173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 02:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AznFtxxn;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: saisneha196@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso3313148eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 02:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779182217; x=1779787017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czoKg3Q7zWCJLdmR/QP8+RLXIZoo+mHJycOBG86st/c=;
        b=AznFtxxnq9vaHoXtcD+NUgS781G2fak4RzcE9mqIITdBxBMrZHhJvqu/sXgjcTbVEi
         7nUy17KjsVVYx2+ZoXyKvG9N6s8PTe8C6srehb2EqVp0pnIW7utRkMzR0BJS76brfTBd
         EOdkiZE5txUQjhu98X6YVy+bXeDgD3eMXwL5KILM8wXjG8Y5cQmwKsNXZ3G0CfezY4u4
         Z8ov2UHoVr3+UpPvQo7rcDotBbZI9jq0qoafyDcpIsvhiHWU0Zw3cYlAQJMURUO3wQFA
         HQGWZyJcNYwH5Plm8rxDgnXjko0cS2yH8iZKp7JtpxhpIYCsHq1AiRwetEOb0ivhitF4
         Cd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779182217; x=1779787017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=czoKg3Q7zWCJLdmR/QP8+RLXIZoo+mHJycOBG86st/c=;
        b=nt0QBV+ymofHXp9if2KVIbzfxdyGJibucdXCiAuyeE/uSjGFz/fYqDgCi6xrRCl39y
         cUncU1HdQyeMqxmhIOW1QqgYkRfm0opIVKi0ImFOWn94A9f3Fnm/n9guXmWD3rTnN5eP
         GAdappvYaIG1RuIrmpO+VzUiiF1FYv4Q3jdRWzexKrxqkyhkHM8125al5aBzHH5PLXFw
         Ny9UAblLEWFNaGGaJkWGzWy8Nwy7jqIpIO2uIARfyqxd7q9vBuETm5yb8AIv179sQ52k
         Rdpv0Nhc/ixj9dUA8IiL5panZHfcttOCp8v8tYSIsGmxXadUX6hAH4pq3x9fhNPiqtEt
         5KjA==
X-Gm-Message-State: AOJu0YzFCosf/0FaUISmifivnVcAKZKaNeErUAf4C+4cv7b+qnOklWaZ
	yXGee5/oEU7OuAPPuNr0q8yAVfjqh/fkLYA4nuVqUGVwL4cQ4MmHhzlEnDnpt9zh
X-Gm-Gg: Acq92OH/bUmzsXaWx4bY7nNylmESBk/C/4wnpK/ObD1FoUllSIZGcXGQvtvAkaWNmAK
	vTUAn5b7S9Miat1OBuuWlRsqg+D+MRfI4K4MzJEsEhSObM8HBiCSCMCi1KDH+S5HU8yBlRf+J4g
	EqEb80GF2gN8c14YNh0T6WIVttAW27GMpfY34+R1wYmLtAm/zCHYFsQcmOZzkQOsKZGDC6mZpbp
	mWhuX37ie5xlyDSxhRXQMCeKikcQJmAGvx0p6FZJ40Pv3OKH4FPJDqC+ZULqiZLOytPFS6uVmDR
	tf7rha4zQrpB7l3ttPycPFMH+UOZDa9pm8cc4HxPV6eZ+wYBIq/PTPPKhD/nPUD7fc0iuxrMGDQ
	Do+RndVR4wVIqy5iy1sGEuGo20t1dok7g1rt5V/4X0AcsqArCyQl+uML64DYoa/w8AOWRl4HYjx
	0DYV1SjBpoyylecfm73gx/cc9lbs0AXDg1iV9nTn1jdiqv5TXhI8cnpWyOsg==
X-Received: by 2002:a17:902:f788:b0:2bc:f1ef:2e64 with SMTP id d9443c01a7336-2bd7e7d683amr214115725ad.12.1779181772596;
        Tue, 19 May 2026 02:09:32 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.112.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe4935sm187342225ad.42.2026.05.19.02.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:09:31 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH 2/3] insane.bbclass: add missing-srcrev QA check for SCM URIs
Date: Tue, 19 May 2026 14:39:17 +0530
Message-Id: <20260519090918.235880-3-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519090918.235880-1-saisneha196@gmail.com>
References: <20260519090918.235880-1-saisneha196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 11:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237314

Add a proper QA check test_missing_srcrev() in do_recipe_qa that
fires at build time via oe.qa.handle_error(), complementing the
parse-time check in base.bbclass.

The check uses unexpanded getVar() calls (False flag) to safely
inspect SRCREV without triggering AUTOREV expansion, and mirrors
BitBake's full SRCREV resolution fallback chain.

Severity is controlled per layer:
- WARN_QA:append = " missing-srcrev" for all layers (warning by default)
- ERROR_QA:append:layer-core = " missing-srcrev" for oe-core (strict)

This follows the same pattern as missing-metadata and missing-maintainer
which are warnings globally but errors for oe-core.

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16051
Signed-off-by: Sai Sneha <saisneha196@gmail.com>
---
 meta/classes-global/insane.bbclass | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 04700be71c..296cfba0fe 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -49,6 +49,9 @@ ERROR_QA ?= "\
 ERROR_QA:append = " ${@bb.utils.filter('DISTRO_FEATURES', 'usrmerge', d)}"
 WARN_QA:append:layer-core = " missing-metadata missing-maintainer"
 
+WARN_QA:append = " missing-srcrev"
+ERROR_QA:append:layer-core = " missing-srcrev"
+
 FAKEROOT_QA = "host-user-contaminated"
 FAKEROOT_QA[doc] = "QA tests which need to run under fakeroot. If any \
 enabled tests are listed here, the do_package_qa task will run under fakeroot."
@@ -1455,6 +1458,34 @@ python do_qa_unpack() {
 python do_recipe_qa() {
     import re
 
+    def test_missing_srcrev(pn, d):
+        import bb.fetch2
+        src_uri = (d.getVar('SRC_URI', False) or '').split()
+        for uri in src_uri:
+            try:
+                (scheme, _, _, _, _, params) = bb.fetch2.decodeurl(uri)
+            except Exception:
+                continue
+            if scheme not in ('git', 'gitsm', 'hg', 'svn'):
+                continue
+            if params.get('rev', ''):
+                continue
+            name = params.get('name', '') or 'default'
+            candidates = [
+                'SRCREV_%s:pn-%s' % (name, pn),
+                'SRCREV_%s' % name,
+                'SRCREV:pn-%s' % pn,
+                'SRCREV',
+            ]
+            raw = None
+            for candidate in candidates:
+                raw = d.getVar(candidate, False)
+                if raw:
+                    break
+            if not raw or raw == 'INVALID':
+                oe.qa.handle_error("missing-srcrev",
+                    "%s: %s not set for SCM URI %s" % (pn, candidates[-1], uri), d)
+
     def test_naming(pn, d):
         if pn.endswith("-native") and not bb.data.inherits_class("native", d):
             oe.qa.handle_error("recipe-naming", "Recipe %s appears native but is not, should inherit native" % pn, d)
@@ -1497,6 +1528,7 @@ python do_recipe_qa() {
 
     pn = d.getVar('PN')
     test_naming(pn, d)
+    test_missing_srcrev(pn, d)
     test_missing_metadata(pn, d)
     test_missing_maintainer(pn, d)
     test_srcuri(pn, d)
-- 
2.34.1


