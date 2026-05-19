Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C253ACD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 10:09:29 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17802.1779185363369839777
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 03:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FNTSoxOK;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: saisneha196@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ba6485d219so23212645ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 03:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779185363; x=1779790163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czoKg3Q7zWCJLdmR/QP8+RLXIZoo+mHJycOBG86st/c=;
        b=FNTSoxOK/nr9RxJaywbe+caiYT6vjKCzu+UGj/GEduyypLq5hNRhP86kKLx94BX+6B
         Hf/YY1dbkJMIWDEXWzjX+6bgdAnzHSdWM4vxvdosy663VtY5c9tQFoFmnvaIh3b3dQyW
         H32vYYYJtxOQs4WVX7DpLhn3Rtbj1F7KC4J7tAT2dG8ByLeUSzmX9FmNMBDMXwiarwFI
         xhKgfnZ2VSfhxIAbLhqZu+davwoo0NGWwJ4GVIPnGa60+lK7exIu2tiQflpEltgcJhlc
         Ty6SD2vcBQIiNGz23y6gWArHzetcTrw32RNUHEIxVnkr91GroGEcKD0BGXR9VibmBGff
         2cgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779185363; x=1779790163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=czoKg3Q7zWCJLdmR/QP8+RLXIZoo+mHJycOBG86st/c=;
        b=adDPpfO8dnsbHd4g2KckQOWtmLOB+IYfARc0gWjyUa/r6RzvKRrBX++3SVj4SfNDjc
         aE6oJHeK42w30VIPWKDo3CCs2/VUcW2cuF5z75KB4v5fD6DNe1oLKI2tvkhGiIPcoib1
         O4F4qlofdjuYPMyd+UUPp9vbuzNEp5JjTzOb5ErTeFT6jaAz3vqyRWx55iK9+RBy/C3L
         0OKJ9xH3kRjdFvjaSYhODW/wSuh0ho9n72pcxpUrEXqFcPuHnJwbdaMD6FWATtP0dpYB
         xkCyHZifJcQp5cA/rhYrpeyHEiwUVCc3IlGd+9zKXlvk2/UgbRmWT1GOuy36Fu87Ry/k
         KLvA==
X-Gm-Message-State: AOJu0YyQv6Y5l7el88eT57/kMX6IKQSbj9xGW2psX3XMbUQus0j6YCE0
	XYkYEB9UcLgz7OWrMEHvuxr/kqPHsCVs5HIB3BUOMUTxuc53KvmXrqXPA5w+hFHV
X-Gm-Gg: Acq92OE2TGnLZl7XTVqvTDhPfxMkWMLXjMe0NOKzQ3sG0EJjFBTU/FC48inSmyF5M5D
	hsJIjcESoWFwfRw+ceH0qakueX1onAM5oOgf+VMi/JIa32doS9kooTW+kYMya0U+U68BxRop2Yc
	WQutwRcLCjMuSlh+/Oe3yssjmMvrvceVDn6D/3q/jYkz5rVZztSzav9R8BQg1ZXLJGSI7xoKO63
	H1iLumEeAoBZ97f5ZY+HVZuicTx1HkQNXrAwTJ8j7P2V0ga55UGuM6by+ig6XrD/ChiHDBJahvG
	QT02rf5D7c5kiQL/4yd9gKQCnwt8toYqbwVnyaUURwkEE04AxKgXpKVtpwA0TUpNXueSXVW1afv
	EnxFj5E67VmoOpt09sRvST6rp9lXYL6tkpCRkYf0S5mY5/MvsWza38fE1SPIQhCSZJEVOWowLvv
	0ON7fSix//NWHlOu1wvfO3FmDZVmh/ZgZLuK/CVIVNkzbIcw==
X-Received: by 2002:a17:903:388d:b0:2ba:3e50:e3f5 with SMTP id d9443c01a7336-2bd7e9769e2mr193696195ad.30.1779185362724;
        Tue, 19 May 2026 03:09:22 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.112.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fc2bdsm231081355ad.63.2026.05.19.03.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:09:21 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v2 2/3] insane.bbclass: add missing-srcrev QA check for SCM URIs
Date: Tue, 19 May 2026 15:39:03 +0530
Message-Id: <20260519100904.235971-3-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519100904.235971-1-saisneha196@gmail.com>
References: <20260519100904.235971-1-saisneha196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 10:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237302

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


