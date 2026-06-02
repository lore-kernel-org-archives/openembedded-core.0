Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3DFCD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 06:30:08 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18786.1780381804053412509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 23:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZCEEmB+0;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: saisneha196@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso13951505ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 23:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780381803; x=1780986603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kcw5aBv0NpXy+Rq9f7djHWCVs2nkOPFQn1bwVhFzkQ=;
        b=ZCEEmB+0QX1HgwIx9w7Vj6rjSTX8emxdUwqapj1fGvKjqNOcS8dgQlmXl2+Wi0lqta
         qTlkPE77uD+a5+5rXqK57i9EvktYS/pmevXRUQQPNF2m9F4cwPxONCHMHzE76ckliua3
         M8qlktc5DQxcMCdp1BjqczfPd7bdtk4687dR2pbbe1Cb2dU0SaGZbkT8wm0+0m3GtYzb
         Xs2OlLYKNwFbOQi56PJ8eEGzUc+nYAep6S7u395zpmGY99zjsivrjsd4nl7f/jIi3dFq
         dS01afKJlXiGMudfsSxp2akwER4ZqrJHNGsy/m3eHbRPNo9ut+IM07cOeFhSkCgo0pcv
         giKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780381803; x=1780986603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+kcw5aBv0NpXy+Rq9f7djHWCVs2nkOPFQn1bwVhFzkQ=;
        b=Acjq1nuT1stbhKzXkzeenuzBeGYXTMgRH/upO9/1ImJm6oYzVgMNJ3/nbzQOMpmPWr
         Oz2afekAAwaDtlTLou2Una8rFzG8jmHUFev8l7B4w7Od9xt2mMCtwUdeAsbn0HdrdmTx
         3mfCa68uhjB4ix+WHk87tR+MdbrLGlXTXEKGwRxaOJysxoEqvXqyjNHGrLPQez+8iZuR
         3svSOftJuIzBas0J8nkIt6kph3RIVXVXa1vGTGiFGI7JePBPxwpPIq0hmQ0dvmB7PJO7
         sfWFG/y8VUHOnsTNbakRAxnsELDOcmTLIFNykPKEdKV5M2ASO4Ul67c5tQ4GjlLewDdq
         sujA==
X-Gm-Message-State: AOJu0YyLzu91/iG6x3wrWvET1su1DmrbdSqv/ISpkYF1T6UsVx9u7Ht7
	4poRT0Aj4YnnPRbffGCyvAdHM3IkAkenxTBSRAOblBcDhE5rwVD5B7Ks7Wzrz7Xk
X-Gm-Gg: Acq92OGmSlIp4TLVMQce/z7bPDXEBNZqaovIHL7+AULlM168fP82bZN83mFLEzb1VxV
	n9n8u8HVcff2vJcr2gsU2H4lhDQtEbVFARbj+v6C5+Xc2JyD7YFkFULITd7zF6R5bJeRVy7hNOg
	uakpngqNt4Mx8+Bonl8K1JYTPWIl9dUAWPruTnEkQdUpvZsWT1/ykUgtkXCkFM7sZWKqspF96hv
	j14hYUNql6Wm5nMJ2JSI5eyscksvmicBrQe0M6j+PH/Ve1FSLDWbF1brcEZV2DBYHcbx93YMVjM
	AXG17wY8SMZf+WN+VeWB1EBxHrJray548VKPjjPXMOaXigjR41A89OeoltpTmPbsrz3xb9eot7G
	Dw9/wmCTqDo62y+mz192yK+iTfYVC+kt8gAh1mOLz4dlLVinbJSe06rSXd466izLyfkxvHJ5ybV
	LHuan3c0kMKcyaSI60r/VkkKOdajAC6we7mTNnIwtnReWlLT8/oKjysNXH
X-Received: by 2002:a17:902:e743:b0:2c0:aef8:23eb with SMTP id d9443c01a7336-2c0aef826d2mr132151175ad.25.1780381803429;
        Mon, 01 Jun 2026 23:30:03 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.118.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3f496sm128280255ad.76.2026.06.01.23.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 23:30:02 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	martin@geanix.com,
	paul@pbarker.dev,
	mathieu.dubois-briand@bootlin.com,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v5 4/4] yocto-check-layer.bbclass: enforce missing SRCREV check during layer validation
Date: Tue,  2 Jun 2026 11:59:40 +0530
Message-Id: <20260602062940.3107241-5-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602062940.3107241-1-saisneha196@gmail.com>
References: <20260602062940.3107241-1-saisneha196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 06:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238004

Add check_missing_srcrev() to yocto-check-layer.bbclass to enforce
the missing-srcrev check as an error during yocto-check-layer runs,
using the shared oe.qa.check_uri_srcrev() helper.

This ensures layer maintainers submitting layers to the Yocto
ecosystem must fix all missing SRCREVs before their layer passes
validation, even if their layer only gets WARN_QA during normal builds.

Note on design: missing-srcrev is not added to CHECKLAYER_REQUIRED_TESTS
because that would promote it to ERROR_QA for all layers globally during
normal builds, contradicting the layer-specific enforcement requested in
Bug 16051 Comment 3. This direct implementation in yocto-check-layer.bbclass
enforces it strictly during checklayer validation without affecting
normal builds.

This satisfies the requirement from Bug 16051 Comment 2:
'add a QA check outside of checklayer then add it to checklayer'

Reported-by: Yoann Congal <yoann.congal@smile.fr>
Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16051
AI-Generated: Developed with assistance from Anthropic Claude
Signed-off-by: Sai Sneha <saisneha196@gmail.com>
---

Changes in v5:
- No changes to this patch

Changes in v4:
- Refactored to use shared oe.qa.check_uri_srcrev() helper
- Eliminates duplicated URI parsing logic
- Added docstring

Changes in v3:
- Added AI-Generated disclosure and Reported-by tag

Changes in v2:
- Initial public submission
 meta/classes-global/yocto-check-layer.bbclass | 15 +++++++++++++++
 meta/lib/oe/qa.py                             |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/yocto-check-layer.bbclass b/meta/classes-global/yocto-check-layer.bbclass
index ba93085325..11b7f5d2ee 100644
--- a/meta/classes-global/yocto-check-layer.bbclass
+++ b/meta/classes-global/yocto-check-layer.bbclass
@@ -56,7 +56,22 @@ def check_network_flag(d):
         if network and not is_allowed(bpn, task):
             bb.error(f"QA Issue: task {task} has network enabled")
 
+def check_missing_srcrev(d):
+    """
+    Enforce missing-srcrev check as error during yocto-check-layer runs.
+    Uses the shared oe.qa.check_uri_srcrev() helper.
+    """
+    import oe.qa
+    src_uri = (d.getVar('SRC_URI', False) or '').split()
+    pn = d.getVar('PN')
+    for uri in src_uri:
+        rev = oe.qa.check_uri_srcrev(pn, uri, d)
+        if rev is None:
+            bb.error("QA Issue: %s: SRCREV not set for SCM URI %s [missing-srcrev]" % (pn, uri))
+            d.setVar("QA_ERRORS_FOUND", "True")
+
 python () {
     check_insane_skip(d)
     check_network_flag(d)
+    check_missing_srcrev(d)
 }
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 0987aaf2c4..3da45e33ce 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -245,7 +245,7 @@ def check_uri_srcrev(pn, uri, d):
     Check that a single SCM URI has a valid SRCREV set.
 
     Returns the resolved revision string if valid (including '${AUTOREV}').
-    Returns '' for non-SCM URIs or URIs with inline rev= parameter (skip).
+    Returns '' for non-SCM URIs or URIs with inline rev= or tag= parameter (skip).
     Returns None if SRCREV is missing or INVALID.
     """
     import bb.fetch2
-- 
2.34.1


