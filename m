Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC420CFB44A
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 16:24:24 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.57557.1728318262692300285
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Oct 2024 09:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J1QOhj3+;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-710f63ff31eso2300326a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 09:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728318261; x=1728923061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SvZ3t+Y5K1I9ubghl7KcHN1PcLWBCt10FBos8Ox7PSY=;
        b=J1QOhj3+TzdgQ5mkkQC80TQ7sNMOyuw1LyGbCNAvX9dGdMUWVW8rl4MtzxV6RyG0Lu
         DZsNvz3YLYG5yhAi3AZJERl+Zmv9RBj4aCS2u3B8MKakIWivXRXeHPJJQSHyIyktMk38
         TmPdhdIpmSQ2rdAYhc3qgrKGQ3nkvqa8KzLdjUZDRhluSxsNpSC9Io0zQwyqquZh7qo2
         Kvnk3sFvOOHg67mD3SwCQ8l4x1txNajGf2f33d63vyi333CNPwEpsoCOXn5MlCfyA7VT
         /85XGrAQcu/uyUhF+lUEz+TWBjJUm/lC+myalQAcsQG3zDL9PvfAE44kZg7fCJNyzFgf
         v5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728318261; x=1728923061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SvZ3t+Y5K1I9ubghl7KcHN1PcLWBCt10FBos8Ox7PSY=;
        b=J1WgnsSDQnbFJAH1uiUSrgB7WFiJgrQvDkDjbbjfqKWCK49Wzx/e58NH30yUqz0Qp9
         0+OdJIL/JiG/A4A6B4HcACOFrQK+/lDh+ZjzPm0M62GVwZRTdVSjkj8uE8OPl+SoJvgA
         SU33AsIEeGD8wejSvL4eozYVbiHsvsyVXywIOJoA/lWUlP8pmw2iT/7TPyqKwQydasj0
         JaCc7VsNURd5qfvIh6MplsKWt1lnimmlTg+yMkJtMqr883zeFn0fq57y25f5UTWjxuEa
         mm3ZA2e0zXLYdfqKp6ruRbFHWV6H2hHQWScEwB/GkeYDNF1yme6+aAhOa8VX4mI7XWmO
         bmAg==
X-Gm-Message-State: AOJu0Yxhy8enhhs9nsqJGXhSx41jKQIOjxlO+i+HwMMlY/rnDefEFZ8p
	yNh0WuX66TDbp/EGJqEOpCZGYnhj8n/kHE1i/k1KzeevaZNcUPk8JZtEig==
X-Google-Smtp-Source: AGHT+IEEGgT2TEAj1UUKgbEQI7RAT8/o4Ut/YGg8291xtbjN17p7J3Zddfph/PaKI/evJzZa65xpcg==
X-Received: by 2002:a05:6830:2692:b0:714:f738:3f90 with SMTP id 46e09a7af769-71570c15e51mr90206a34.15.1728318261277;
        Mon, 07 Oct 2024 09:24:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::a216])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7155688a33dsm1499695a34.80.2024.10.07.09.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 09:24:20 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] spdx30: Link license and build by alias
Date: Mon,  7 Oct 2024 10:24:15 -0600
Message-ID: <20241007162415.3907396-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 16:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205273

The license information and Build created by do_create_spdx are changed
to be referenced by their link alias instead of the actual SPDX ID. This
fixes a case where do_create_package_spdx would pull these from
mismatching sstate, and then the SPDX IDs would be unresolved when
assembling the final document

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py       | 43 +++++++++++++++++++++----------------
 meta/lib/oe/spdx30_tasks.py | 10 ++++++---
 2 files changed, 31 insertions(+), 22 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 7b4f78cc718..27ab5e45ac1 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -305,24 +305,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
 
     def add_aliases(self):
         for o in self.foreach_type(oe.spdx30.Element):
-            if not o._id or o._id.startswith("_:"):
-                continue
-
-            alias_ext = get_alias(o)
-            if alias_ext is None:
-                unihash = self.d.getVar("BB_UNIHASH")
-                namespace = self.get_namespace()
-                if unihash not in o._id:
-                    bb.warn(f"Unihash {unihash} not found in {o._id}")
-                elif namespace not in o._id:
-                    bb.warn(f"Namespace {namespace} not found in {o._id}")
-                else:
-                    alias_ext = set_alias(
-                        o,
-                        o._id.replace(unihash, "UNIHASH").replace(
-                            namespace, self.d.getVar("PN")
-                        ),
-                    )
+            self.set_element_alias(o)
 
     def remove_internal_extensions(self):
         def remove(o):
@@ -345,6 +328,26 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             str(uuid.uuid5(namespace_uuid, pn)),
         )
 
+    def set_element_alias(self, e):
+        if not e._id or e._id.startswith("_:"):
+            return
+
+        alias_ext = get_alias(e)
+        if alias_ext is None:
+            unihash = self.d.getVar("BB_UNIHASH")
+            namespace = self.get_namespace()
+            if unihash not in e._id:
+                bb.warn(f"Unihash {unihash} not found in {e._id}")
+            elif namespace not in e._id:
+                bb.warn(f"Namespace {namespace} not found in {e._id}")
+            else:
+                alias_ext = set_alias(
+                    e,
+                    e._id.replace(unihash, "UNIHASH").replace(
+                        namespace, self.d.getVar("PN")
+                    ),
+                )
+
     def new_spdxid(self, *suffix, include_unihash=True):
         items = [self.get_namespace()]
         if include_unihash:
@@ -557,7 +560,9 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             scope=scope,
         )
 
-    def new_license_expression(self, license_expression, license_data, license_text_map={}):
+    def new_license_expression(
+        self, license_expression, license_data, license_text_map={}
+    ):
         license_list_version = license_data["licenseListVersion"]
         # SPDX 3 requires that the license list version be a semver
         # MAJOR.MINOR.MICRO, but the actual license version might be
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index d0dd40877e2..e0b656d81f1 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -119,9 +119,11 @@ def add_license_expression(d, objset, license_expression, license_data):
     )
     spdx_license_expression = " ".join(convert(l) for l in lic_split)
 
-    return objset.new_license_expression(
+    o = objset.new_license_expression(
         spdx_license_expression, license_data, license_text_map
     )
+    objset.set_element_alias(o)
+    return o
 
 
 def add_package_files(
@@ -462,6 +464,8 @@ def create_spdx(d):
     build_objset = oe.sbom30.ObjectSet.new_objset(d, d.getVar("PN"))
 
     build = build_objset.new_task_build("recipe", "recipe")
+    build_objset.set_element_alias(build)
+
     build_objset.doc.rootElement.append(build)
 
     build_objset.set_is_native(is_native)
@@ -603,7 +607,7 @@ def create_spdx(d):
             set_var_field("DESCRIPTION", spdx_package, "description", package=package)
 
             pkg_objset.new_scoped_relationship(
-                [build._id],
+                [oe.sbom30.get_element_link_id(build)],
                 oe.spdx30.RelationshipType.hasOutput,
                 oe.spdx30.LifecycleScopeType.build,
                 [spdx_package],
@@ -650,7 +654,7 @@ def create_spdx(d):
             pkg_objset.new_relationship(
                 [spdx_package],
                 oe.spdx30.RelationshipType.hasConcludedLicense,
-                [package_spdx_license._id],
+                [oe.sbom30.get_element_link_id(package_spdx_license)],
             )
 
             # NOTE: CVE Elements live in the recipe collection
-- 
2.46.2


