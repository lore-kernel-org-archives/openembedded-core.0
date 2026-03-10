Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7961FD4F21
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:12 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2665.1773168072114593313
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e3GDNKxQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-463a0e14abfso9432859b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773168071; x=1773772871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Wsvm7UZ+qXi5zyTV0UmCwyCSQ0eIKoDgVpDnS6yewE=;
        b=e3GDNKxQJQXGsopYiaoXA+CS+8N1pN02wKQEneUqvFncF9rnwbHdR2kpaHjzmMVk4A
         C1n0fLkLpcSl4jotLwiZkNM+4sCoeiBDIWacfw3iWyd7TQxzQqnTNo/l5t7mZ1pCw89n
         zW124/+K7wsqqcdUGMXk2fJT0X0DL6BpZtDCsC40b852JQd7ptdUO1NVWIUQ3G6Ock+p
         XOHVCnSrsvdDryZxb0GNvp5JvoUTVXoTKJnhpaIMYJzT6HRe7BUeLo3EusxhbX5/oQTl
         qteSBZUm2SDiet3RMZQnx/YGZ+ThSwSejocvpR86a9vjBTKWmelSLFKTFtkhyT+woVvT
         1fSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773168071; x=1773772871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Wsvm7UZ+qXi5zyTV0UmCwyCSQ0eIKoDgVpDnS6yewE=;
        b=DEjaweVKYwPST2y0RZZMDb782jKNWnpRMKBQhokNDsSyyoE286q+Gp5oIxjoxTwiHN
         t6c0Q2VqGcRc4Juk7sKV+Srcwm8pW5K6FgPwWK4/Q+vT9/HKiE4u03vGQZEs7/N8i1HO
         SBg9D90FDlonzGQznQ9RcFOvrYQJ77r7NtYS+/BYZ0jYSyAdN4v9nnHw1KfKEMpVNwMp
         ML1ynGBsY4LU4ykL6/iYYlLFA01wxYxPWz4R1Z8QlJWNH1jjK6BPhHi79+q+0DA1ExE/
         jYxv2jV83w9wXtEZEuy//LaxC/s1EakXFfz/HCRdQFRkP4L3NbLOP/Yd/tIUUg2re8qt
         RcAw==
X-Gm-Message-State: AOJu0Yz6bF6pQPFHCU/fWH8iePEw2zng3+XRv/wmvFSCG3o66K0Q+JWX
	bMoqP7RHU1geM0yecMdYcOSdtWSqOiwcKuF9jVBM0eJc7e86qr9GjNmQhNc2BA==
X-Gm-Gg: ATEYQzwOK7bUw6DODE9d9ciIJIZFt5vMzV8pxPA5WuoR7dFEi8E0pYQ9nzIQG+0W3AU
	i5f/CHf8WN2te7PqRTvSw7L+M2AziiKJzCZzIq+EJZzTGPsddwaX8e10ovs8es+02OcE6iSqvGO
	sMY1Ql5eaMKR6W38Nqf0jdIAKjR3KvW6BTWNYe/xFC8hS4Ay3tk3LCRrLoageG57MPHvMksZSzw
	MMa+UA1q6uYzedEoh/5QA95yfAgEmScU8kj7iLoi+oUr3m4qwr3Y0PBjD4wU4MwBDkEHp35P0H7
	DRYiQBcOFwvJot5799aL1Vi1XcbQw843pD60Ulvp6VVaWr82mdS+UBmZEdtGwurI4KwcPnzQGRm
	yVTEnz4q58xe8QlIdiAF6XlUGzcyGrDkKCqUT/rsmN+J0RWDODhTUXfp3vjihl5bJGKegIZFX29
	f2bxS1qQ451Z4bJKveAj80
X-Received: by 2002:a05:6808:13d1:b0:45f:59e:1e06 with SMTP id 5614622812f47-466dc9eeaa3mr8655639b6e.4.1773168071218;
        Tue, 10 Mar 2026 11:41:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::9891])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4671d2a7ebfsm2444524b6e.20.2026.03.10.11.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:41:10 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 09/15] spdx30: Skip install package CVE information
Date: Tue, 10 Mar 2026 12:38:29 -0600
Message-ID: <20260310184058.533343-10-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184058.533343-1-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232820

Skips adding the install package CVE information by default. This
information grows exponentially, since it ends up be N_CVES *
N_PACKAGES. The CVE information for a given installed package can be
determined by following the "generates" link between the install package
and the recipe and looking at the CVE information for the recipe,
meaning that the CVE information is only included once in the SPDX
document.

If users still need the legacy method of including CVE information for
each package, then then can set SPDX_PACKAGE_INCLUDE_VEX = "1"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass | 11 ++++++++
 meta/lib/oe/spdx30_tasks.py          | 39 ++++++++++++++--------------
 meta/lib/oeqa/selftest/cases/spdx.py | 12 +++++++++
 3 files changed, 43 insertions(+), 19 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index c3ea95b8bc..88b7ef9f42 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -45,6 +45,17 @@ SPDX_INCLUDE_VEX[doc] = "Controls what VEX information is in the output. Set to
     including those already fixed upstream (warning: This can be large and \
     slow)."
 
+SPDX_PACKAGE_INCLUDE_VEX ?= "0"
+SPDX_PACKAGE_INCLUDE_VEX[doc] = "Link VEX information to the binary package outputs. \
+    Normally, VEX information is only linked to the common recipe that `generates` the \
+    binary packages, but setting this to '1' will cause it to also be linked into the \
+    generated binary packages. This is off by default because linking the VEX data to \
+    each package causes the SPDX output to grow very large, and the same information \
+    can be determined by following the `generates` relationship back to the recipe. \
+    Before recipe packages were introduced, this was the only way VEX data was \
+    expressed; you may need to enable this if your downstream tools do not \
+    understand how to trace back to the recipe to find VEX information."
+
 SPDX_INCLUDE_TIMESTAMPS ?= "0"
 SPDX_INCLUDE_TIMESTAMPS[doc] = "Include time stamps in SPDX output. This is \
     useful if you want to know when artifacts were produced and when builds \
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index aec47d4f81..887fac813a 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -771,27 +771,28 @@ def create_spdx(d):
     # Collect all VEX statements from the recipe
     vex_statements = {}
     vex_patches = {}
-    for rel in recipe_objset.foreach_filter(
-        oe.spdx30.Relationship,
-        relationshipType=oe.spdx30.RelationshipType.hasAssociatedVulnerability,
-    ):
-        for cve in rel.to:
-            vex_statements[cve] = []
-            vex_patches[cve] = []
-
-    for cve in vex_statements.keys():
+    if (d.getVar("SPDX_PACKAGE_INCLUDE_VEX") or "") == "1":
         for rel in recipe_objset.foreach_filter(
-            oe.spdx30.security_VexVulnAssessmentRelationship,
-            from_=cve,
+            oe.spdx30.Relationship,
+            relationshipType=oe.spdx30.RelationshipType.hasAssociatedVulnerability,
         ):
-            vex_statements[cve].append(rel)
-            if rel.relationshipType == oe.spdx30.RelationshipType.fixedIn:
-                for patch_rel in recipe_objset.foreach_filter(
-                    oe.spdx30.Relationship,
-                    relationshipType=oe.spdx30.RelationshipType.patchedBy,
-                    from_=rel,
-                ):
-                    vex_patches[cve].extend(patch_rel.to)
+            for cve in rel.to:
+                vex_statements[cve] = []
+                vex_patches[cve] = []
+
+        for cve in vex_statements.keys():
+            for rel in recipe_objset.foreach_filter(
+                oe.spdx30.security_VexVulnAssessmentRelationship,
+                from_=cve,
+            ):
+                vex_statements[cve].append(rel)
+                if rel.relationshipType == oe.spdx30.RelationshipType.fixedIn:
+                    for patch_rel in recipe_objset.foreach_filter(
+                        oe.spdx30.Relationship,
+                        relationshipType=oe.spdx30.RelationshipType.patchedBy,
+                        from_=rel,
+                    ):
+                        vex_patches[cve].extend(patch_rel.to)
 
     # Write out the package SPDX data now. It is not complete as we cannot
     # write the runtime data, so write it to a staging area and a later task
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index efee0214fc..f1ea2694cf 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -429,3 +429,15 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
                 value, ["enabled", "disabled"],
                 f"Unexpected PACKAGECONFIG value '{value}' for {key}"
             )
+
+    def test_package_vex(self):
+        objset = self.check_recipe_spdx(
+            "core-image-minimal",
+            "{DEPLOY_DIR_IMAGE}/core-image-minimal-{MACHINE}.rootfs.spdx.json",
+            extraconf="""\
+                SPDX_PACKAGE_INCLUDE_VEX = "1"
+                """,
+        )
+
+        # Document should be fully linked
+        self.check_objset_missing_ids(objset)
-- 
2.53.0


