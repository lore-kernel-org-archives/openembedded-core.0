Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BE0CD5BA4
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:23:00 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17513.1779182252435060548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 02:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PK1M0Idk;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: saisneha196@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-90fbf21d9d3so610712785a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 02:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779182251; x=1779787051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPkJWDQFJp/4U8GVa5Un2SoUehIl1YUMQsIBS+tLq14=;
        b=PK1M0IdkwvX9t4NDpIXnrJZf4DJoytUtx75rla+qhgiyewHPZXQ1DBUQ0ablweR7vv
         wHJFVVT0masl7rt942N/9Q17wfhXvXirNrH34lsQ/vgDyBMv2cZvolurGiQ3KiQFH7pp
         +EGasA7PHIrnICv1mf0EtEHfUfdctBx0cziZEg93tyhBPuThFvTAqcRXNnmoKkKBJ/ib
         iIBUSyx+4Nym+TJ0qkIVpO1hV9LToQTLrKbpn4aYZVC+gvEKjikhdR2CQS2lHGOJxiCQ
         UMGaqqnWqhxdsH/Eismkl2CzPw3QrZNMEu85ucyY4UBs9r7fWSposiSH4LN0+QJk3Pjy
         xubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779182251; x=1779787051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qPkJWDQFJp/4U8GVa5Un2SoUehIl1YUMQsIBS+tLq14=;
        b=nrwwxVfvinQVRsd//5NSSNJJHrhbKo/ex0JaytzI2nAmOHJ0K2zMEZqbNnfyvTi5QH
         9/tQ+Ba06Tw1fBDhVos+s2nV9FdL+zRDVAVyp1CpEsWZQMxp4G5E2NOeq+5w45LhqRh6
         9XTAx67UC+1lZ8mBaS3njbDZn+7XGgJt0opttWiBs/deY6SnBY4fIVqMyFVDc1D5JGbq
         v6svgc6MYLDjvt9b+lJreCeuN+zJ7NJ8lxJxWCJhPJKM1m0GLJ9VVAPvpg9MuBBjGI7x
         ikEqHhhCgf/Z7jQSSghm1cxWjxc5mBH0eBFlfK7+aZ4Ow46GRprpfcQkPMpzVnGopDIy
         ACnw==
X-Gm-Message-State: AOJu0YzziwbAQMURxH0x1Z0fX6VWTa1DB9gb2AAFkI6jqyYsLJXg4N2H
	y80SG375CSGv15nEW+97CakQhXaSHXJ1nWeRCbYyYTApFf2AgitROATcVq3kjppN
X-Gm-Gg: Acq92OFO2IIftc1+3M6DjGhLEnWBjUO0DV1hCHmUoCeYbnhkju+hHkjOMtw3xR/8UbS
	Sw5ojdt/qy7v4qNMP+HXHgBWmHqM096jN596nQ6PISpjkVjLf2wzT2E2vRpxGeTl2Y3fmZcePBw
	OGQ023XCYr7mNhw5M1exUuLQtbHCUONRXDspokbFgpYsXqiM8/yQtYYymRh4tENrTAek/qsC+Ms
	vpW1ZHDI8gz7SK1Q3TqIrLNWE3q8tLJz37F9KZe9xy6XafMFLf+aW0W8ErzfhxEUT/XtmBUrnrv
	Hqp+SRDnWkagM0/V1L5nGOEry10r9Ranaf6YfwJpgW703oIhQHNUXDi/0Agi9ZepIP1g4Nb0gqj
	DpmJ0EiY6YmdYNmjzCD3p+HgACyrmCfSJu8KsJsdMNLRhgjVUVsrQ0WlcMVNap0t5iq3qtq4fNi
	2lNSkStUP/91DlX2GrsOMJKRGM3qfxTtGyhvVPORVMrX2degs=
X-Received: by 2002:a17:903:2ecf:b0:2ba:b643:1f81 with SMTP id d9443c01a7336-2bd7e84407dmr197948325ad.15.1779181776106;
        Tue, 19 May 2026 02:09:36 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.112.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe4935sm187342225ad.42.2026.05.19.02.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:09:35 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH 3/3] yocto-check-layer.bbclass: enforce missing SRCREV check during layer validation
Date: Tue, 19 May 2026 14:39:18 +0530
Message-Id: <20260519090918.235880-4-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519090918.235880-1-saisneha196@gmail.com>
References: <20260519090918.235880-1-saisneha196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 11:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237316

Add check_missing_srcrev() to yocto-check-layer.bbclass to enforce
the missing-srcrev check as an error during yocto-check-layer runs.

This ensures layer maintainers submitting layers to the Yocto
ecosystem must fix all missing SRCREVs before their layer passes
validation, even if their layer only gets WARN_QA during normal builds.

This satisfies the requirement from Bug 16051 Comment 2:
'add a QA check outside of checklayer then add it to checklayer'

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16051
Signed-off-by: Sai Sneha <saisneha196@gmail.com>
---
 meta/classes-global/yocto-check-layer.bbclass | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/classes-global/yocto-check-layer.bbclass b/meta/classes-global/yocto-check-layer.bbclass
index ba93085325..1ef5424083 100644
--- a/meta/classes-global/yocto-check-layer.bbclass
+++ b/meta/classes-global/yocto-check-layer.bbclass
@@ -56,7 +56,39 @@ def check_network_flag(d):
         if network and not is_allowed(bpn, task):
             bb.error(f"QA Issue: task {task} has network enabled")
 
+def check_missing_srcrev(d):
+    import bb.fetch2
+    src_uri = (d.getVar('SRC_URI', False) or '').split()
+    pn = d.getVar('PN')
+    for uri in src_uri:
+        try:
+            (scheme, _, _, _, _, params) = bb.fetch2.decodeurl(uri)
+        except Exception:
+            continue
+        if scheme not in ('git', 'gitsm', 'hg', 'svn'):
+            continue
+        if params.get('rev', ''):
+            continue
+        name = params.get('name', '') or 'default'
+        candidates = [
+            'SRCREV_%s:pn-%s' % (name, pn),
+            'SRCREV_%s' % name,
+            'SRCREV:pn-%s' % pn,
+            'SRCREV',
+        ]
+        raw = None
+        for candidate in candidates:
+            raw = d.getVar(candidate, False)
+            if raw:
+                break
+        if not raw or raw == 'INVALID':
+            bb.error("QA Issue: %s: %s not set for SCM URI %s [missing-srcrev]" % (
+                d.getVar('PN'), candidates[-1], uri))
+            d.setVar("QA_ERRORS_FOUND", "True")
+
+
 python () {
     check_insane_skip(d)
     check_network_flag(d)
+    check_missing_srcrev(d)
 }
-- 
2.34.1


