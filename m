Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E67CD5BA3
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 10:09:29 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18097.1779185367127337403
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 03:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ltAfsdeD;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: saisneha196@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2baef9f5ecdso26896185ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 03:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779185366; x=1779790166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPkJWDQFJp/4U8GVa5Un2SoUehIl1YUMQsIBS+tLq14=;
        b=ltAfsdeDX/40gp+pgAKiMEDRhB7Vp4fhawD2x0ot254hWs75E/IIbZ+/bJYSkquHLh
         9E9oAvCS1nw0yMG+UmeEuHdyUscl5o6J+KjKxUhzDGOl1fNnQeg1ED8xhzAGV8Z7aDF3
         hKMDD/OD7ItUM0GSGxqAPjs1CuERl23IP729XjKRDliEOrr0TcWOygsXZAx/qrT3PvyJ
         jZVeHZkpPoQUyLzQHJpIwU8pAkmgGL1M958W+UikMMJhX1wxsMZ8PIdLp/Yrve9yGr+D
         jhm0LPhwGLxfLFhHWpj83EIhaJH/Z/Zu2+6EBA434CKIrw2bIDpHJ+0VjzxqiZj1GE6e
         tBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779185366; x=1779790166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qPkJWDQFJp/4U8GVa5Un2SoUehIl1YUMQsIBS+tLq14=;
        b=iolk98Yl9XFFgL2rEJrMzT6ppfCK775LcienHshnoxDjWlOr/UmiAGCIr2VV8HI9g1
         qDrtSYpyZjqHOAd+r+r7hhtS+FfIdPrF8/cLjyEulD6PSh/2oc4nKt3CQX/f+6W6G0fK
         QH/9QEIylr87BTpqwb3V+BqmjD+PVl+3wNtRMVvrVXASYTh5njNmVT/ixKrxoJANQ2MT
         VRZsHXH6AcUi2cB1EzaayQxhxRsTypEyZMXgFwcPCBi62f8NvPqRAOEVxFEsPgVc2mAo
         xJ05v94wRve6k2mARJz4cXB/NKC1DwrgaIjvRt2VmM4kWzEIfg4+l5KdJzSAqWHOWWBo
         vcgA==
X-Gm-Message-State: AOJu0YyOq3Nir2znS9yIONl3NMzQmUj+w8mvQ+KwClQ93g/tLliYZyGZ
	zSZZ/oNFPn2EHxnE89hRAbwI5YDkKwflAfy49JxwusL/BMDoR29unxv2Nk2YWBiQ
X-Gm-Gg: Acq92OEAD8dbol4ZfYWp+R9SmXBi1c4cqU0hLGuLmB8Yic2Xn3QFP4TEf+FyhXcsxE4
	ggkVzBtG20Yiywo3CJEcLq7T5AvmX2UHUGWcoE9RLMDDqmJms0ZKvzp6HlwdEE/H83sDvD+ITr2
	ffl9OXI8yk3oFmyXnBMOYvP8k05EEaG5hXsgAER5YyFJgT0DNJTYhSlugTvZH0P/eE3MC38z3T5
	wmdpyZ2doI72rl+YTT/iw/4lA+zs9QFghqsUkfApjDpvoLlUrD9LzKbZx9Y3W1StibJTias41RO
	fmGLYVpjsjGlfSJfsgQ5N+ry/7RYK7lMtMmtIjZOBdWVhFCFm8uiL4Rl0Z2Tl26QNgee425zIbx
	KhkQrwAvxuk1ebxS+8dQUxiIZRs9gvvVxlrxvIcm8NGpSTTc1qPxBs8VbsDgcUJep2mwtHPhchf
	fVTE0+3flubs9fSw4hpVFIF6EPlT9AP6V4ZWfyIRUFsc5NNA==
X-Received: by 2002:a17:902:7892:b0:2ba:6518:a6d4 with SMTP id d9443c01a7336-2bd7e87d577mr149151115ad.20.1779185366111;
        Tue, 19 May 2026 03:09:26 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.112.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fc2bdsm231081355ad.63.2026.05.19.03.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:09:25 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v2 3/3] yocto-check-layer.bbclass: enforce missing SRCREV check during layer validation
Date: Tue, 19 May 2026 15:39:04 +0530
Message-Id: <20260519100904.235971-4-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519100904.235971-1-saisneha196@gmail.com>
References: <20260519100904.235971-1-saisneha196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 10:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237303

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


