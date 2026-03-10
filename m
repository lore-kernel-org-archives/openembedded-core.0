Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C555FFD4F2E
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:13 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2598.1773168070193413725
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MbWwcSK5;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4648447e29bso4944823b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773168069; x=1773772869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgZWWYUETcp+KAK54Y1gHYnk1xGLeXOCGllecsNhDhw=;
        b=MbWwcSK5rLmuau7f6BXPolyL0RsSqJbSf6rczXrI+Zz0vTHsI8rVlYjWD2v/hulh+3
         1f36YRhAE+yrM3vh8xqlGUbx9vqhi3dOfucBFf5wbaeIoBNWB71kyU1HjrxmDB6aINRk
         8q4dXJr8GtBlxdZZ1qsbiPtRqJ+llTVKdyJDCMiAC+Tvpuc1+7AN1rEhIkfBXjZv64Cg
         cBLcapRrMSyCsKsT0aZ0oLMnH04pA7Q2J+v2KniamEte0migq1c60geFJWvu6Ja3QtXI
         fdo/ts7TOinODxMwBrVSV/sBscuzIZUxtELcwyszm7uY2ImdwUTDFmnahDPFJskKIyeU
         LmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773168069; x=1773772869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RgZWWYUETcp+KAK54Y1gHYnk1xGLeXOCGllecsNhDhw=;
        b=QPuRz4BGvsflc1qsHd2GmDawBmTOVPkNmXFbv/yx9nnOI2AADaAJVABdKJAvO9Jt5r
         3btIFXq2JVv9WXn11uYuyS9JSoHbnGRhoXVXen88jGre+1kekY9xpR4iI4NqYUVSm7NO
         xGCXVvY2Di/kvl9MQwlePvm99LrK3GwpTYmwGUAvMN2UmgW2fWAebogcWYtP/HOj0DuN
         TXpxLiLogIrTJozziKEEywoHOPYo0jTugeeYf3U/oveORflLo6+TqJH845Hj9CetQ/md
         xLdtZGLVVtk65FFtCrQBnGFhwRaG9ZPgVmL/feg3TMUfrNvOQsMF9yEPUyyU1zX4RoQk
         qBmA==
X-Gm-Message-State: AOJu0YzsQ6z1JyhAdknvv809utuLETsxU2GmaLJZ+WYQu8sxsS+TH9A4
	epBsGd22dv2a4sBHlEfZKZdn3nfGkTQiEfxZuwE1dh09+WLciAvipMmsNeD/+A==
X-Gm-Gg: ATEYQzw0Mj4cDbkg9bWwI7WGkDKO6CJKSVO2RKq33m/h2qHG3uLVyovI6rC7LB9o+Wa
	BsX3a5AtnDufSUVBqh+D/VcZc5TBaPtZltcB1APotKkvjiEtbFPFxzVUJPLmCa+bFs1N7fQTJjQ
	luQxoDopQSXsYX/5iwfWDuXfyrKUFhgO8UsWTfBFiGEonQV3WhdAo5aM1jTKpJw89WZ9j3ckQbj
	t+bqkfMzH4k8SCmFB3WPguQ9Gg35dXMyrPW2fLzZyNXQbQbiBhVTI7cHXlyO8zsdwYhH2lO1S0O
	Qny5wikrUZvny219IEmAMu9wtAHUZUcrCJzpQWdzf/BoU0kePgU7tlMPc7ugkTkQNhfdWl9nMfr
	E96z2Te3o4cC4Mt9dTY6RdsQZyyDrXH5nctIXHny7o8NKE9l5rOD/c8AUSUiBtiZxLcoZ8GSaI1
	5IhcdPtE0zD06N8aUDCNtd
X-Received: by 2002:a05:6808:c3c4:b0:450:471:b9ba with SMTP id 5614622812f47-466dcaa9ffdmr8591224b6e.14.1773168069157;
        Tue, 10 Mar 2026 11:41:09 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::9891])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4671d2a7ebfsm2444524b6e.20.2026.03.10.11.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:41:08 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 07/15] spdx: De-duplicate CreationInfo
Date: Tue, 10 Mar 2026 12:38:27 -0600
Message-ID: <20260310184058.533343-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184058.533343-1-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232818

De-duplicates CreationInfo objects that are identical (except for ID)
when writing out an SBoM. This significantly reduces the number of
CreationInfo objects that end up in the final document.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py | 112 ++++++++++++++++++++++++++++++------------
 meta/lib/oe/spdx30.py |   2 +-
 2 files changed, 81 insertions(+), 33 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 21f084dc16..55a2863d2d 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -14,6 +14,7 @@ import uuid
 import os
 import oe.spdx_common
 from datetime import datetime, timezone
+from contextlib import contextmanager
 
 OE_SPDX_BASE = "https://rdf.openembedded.org/spdx/3.0/"
 
@@ -191,6 +192,25 @@ def to_list(l):
     return l
 
 
+class Dedup(object):
+    def __init__(self, objset):
+        self.unique = set()
+        self.dedup = {}
+        self.objset = objset
+
+    def find_duplicates(self, cmp, typ, **kwargs):
+        for o in self.objset.foreach_filter(typ, **kwargs):
+            for u in self.unique:
+                if cmp(u, o):
+                    self.dedup[o] = u
+                    break
+            else:
+                self.unique.add(o)
+
+    def get(self, o):
+        return self.dedup.get(o, o)
+
+
 class ObjectSet(oe.spdx30.SHACLObjectSet):
     def __init__(self, d):
         super().__init__()
@@ -895,6 +915,45 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         self.missing_ids -= set(imports.keys())
         return self.missing_ids
 
+    @contextmanager
+    def deduplicate(self):
+        d = Dedup(self)
+
+        yield d
+
+        visited = set()
+
+        def visit(o, path):
+            if isinstance(o, oe.spdx30.SHACLObject):
+                if o in visited:
+                    return False
+                visited.add(o)
+
+                for k in o:
+                    v = o[k]
+                    if isinstance(v, oe.spdx30.SHACLObject):
+                        o[k] = d.get(v)
+
+            elif isinstance(o, oe.spdx30.ListProxy):
+                for idx, v in enumerate(o):
+                    if isinstance(v, oe.spdx30.SHACLObject):
+                        o[idx] = d.get(v)
+
+            return True
+
+        if d.dedup:
+            for o in self.objects:
+                o.walk(visit)
+
+            for k, v in d.dedup.items():
+                bb.debug(
+                    1,
+                    f"Removing duplicate {k.__class__.__name__} {k._id or id(k)} -> {v._id or id(v)}",
+                )
+                self.objects.discard(k)
+
+            self.create_index()
+
 
 def load_jsonld(d, path, required=False):
     deserializer = oe.spdx30.JSONLDDeserializer()
@@ -1080,39 +1139,28 @@ def create_sbom(d, name, root_elements, add_objectsets=[]):
     # SBoM should be the only root element of the document
     objset.doc.rootElement = [sbom]
 
-    # De-duplicate licenses
-    unique = set()
-    dedup = {}
-    for lic in objset.foreach_type(oe.spdx30.simplelicensing_LicenseExpression):
-        for u in unique:
-            if (
-                u.simplelicensing_licenseExpression
-                == lic.simplelicensing_licenseExpression
-                and u.simplelicensing_licenseListVersion
-                == lic.simplelicensing_licenseListVersion
-            ):
-                dedup[lic] = u
-                break
-        else:
-            unique.add(lic)
-
-    if dedup:
-        for rel in objset.foreach_filter(
-            oe.spdx30.Relationship,
-            relationshipType=oe.spdx30.RelationshipType.hasDeclaredLicense,
-        ):
-            rel.to = [dedup.get(to, to) for to in rel.to]
-
-        for rel in objset.foreach_filter(
-            oe.spdx30.Relationship,
-            relationshipType=oe.spdx30.RelationshipType.hasConcludedLicense,
-        ):
-            rel.to = [dedup.get(to, to) for to in rel.to]
+    def cmp_license_expression(a, b):
+        return (
+            a.simplelicensing_licenseExpression == b.simplelicensing_licenseExpression
+            and a.simplelicensing_licenseListVersion
+            == b.simplelicensing_licenseListVersion
+        )
 
-        for k, v in dedup.items():
-            bb.debug(1, f"Removing duplicate License {k._id} -> {v._id}")
-            objset.objects.remove(k)
+    def cmp_creation_info(a, b):
+        data_a = {k: a[k] for k in a}
+        data_b = {k: b[k] for k in b}
+        data_a["@id"] = ""
+        data_b["@id"] = ""
+        return data_a == data_b
+
+    with objset.deduplicate() as dedup:
+        # De-duplicate licenses
+        dedup.find_duplicates(
+            cmp_license_expression,
+            oe.spdx30.simplelicensing_LicenseExpression,
+        )
 
-        objset.create_index()
+        # Deduplicate creation info
+        dedup.find_duplicates(cmp_creation_info, oe.spdx30.CreationInfo)
 
     return objset, sbom
diff --git a/meta/lib/oe/spdx30.py b/meta/lib/oe/spdx30.py
index cd97eebd18..1f58402ffc 100644
--- a/meta/lib/oe/spdx30.py
+++ b/meta/lib/oe/spdx30.py
@@ -701,7 +701,7 @@ class SHACLObject(object):
         self.__dict__["_obj_data"][iri] = prop.init()
 
     def __iter__(self):
-        return self._OBJ_PROPERTIES.keys()
+        return iter(self._OBJ_PROPERTIES.keys())
 
     def walk(self, callback, path=None):
         """
-- 
2.53.0


