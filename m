Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD12EF9005
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:48:46 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22979.1772642923907398085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 08:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kz5ejx1d;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-463208653d6so5349468b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 08:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772642923; x=1773247723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgZWWYUETcp+KAK54Y1gHYnk1xGLeXOCGllecsNhDhw=;
        b=kz5ejx1dN1vAvHvuT3u7bqbvo9UDRg3EOrSAe+hhl1LUehiJb9XP1ACePhgRfywsqL
         hMc32RNgKTo8uN2fx8n0hvHNWRc5q1rpWuG8RhLB5OiYKtxMdh9zhLBefUREBngYAvKU
         8WaGyRLD4aAUhibmXD39zFeNZ8Nn+sxupQamPnpo0CTHnJ3PY+PunJGsb9Gex140EOW+
         0kWLfSKPxrdZY5tPFy2abPflK70xMi9BamMiAU2CIowpA8k2+0K1hXl2rs1aqlB3NDpb
         VfcsiZD95Ud7arq1xQl8FEBn4TglF5DHUNjYbnikp8fOAudCeT7PXK5CCVgaHDVvuGqJ
         1S+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642923; x=1773247723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RgZWWYUETcp+KAK54Y1gHYnk1xGLeXOCGllecsNhDhw=;
        b=mCUSPKNlhovNwqUcF18BuGW47HuzTwBUAQINgnsm++rc6QE2jOEi5kc38f/P1F2TE4
         yhwDJ2Kia4opX1ICYfk7ducUKLhX9MNsAB6YkvsvbTshBOKKcL/qIl2h6gvaT8A5U2tB
         9x0+gEa0H4cKpDZhxu0hefjbNHr9QeqkixDs8aSCapEfl05LOmyxOAEVRg4V+otCRax4
         g77lDAJYDA7OcqBSU5Cpnx24XP1KCFds5D19wMfJS21hP2eXo6rpMVfxDxrRlvfMoSSL
         r06rAWniH3r+vdxDSrfdiTKUryAhdM1HPA6eHQlHEpVw1oDW1PPx4WRygl8xyGsmdG0O
         +HSg==
X-Gm-Message-State: AOJu0YzSoTEMRHJACqVpzugCJE6qgrWE6yGjDrJCvzEihAuKwBaGpqnQ
	/jn9GjVAW3SiKgMspE1bGrCs+mVGG1VjC4uiKswaO3tOu+oLWMpUBR1NYQzI+w==
X-Gm-Gg: ATEYQzx0mZZ2jGprN03wMFY72QPD9CRCria3NY7HqJ89SGmS9BKiXfLV87qK/JeWVyB
	uojxuksU7JN46a/sRND2mvxHHiYzU/CFKe8IVwVN5dUibEd0bz1mBEHZHb90jw2+FKf0oxFUskF
	Cv9Whz/UJLSxG8K5/1rIMh6Dj4XY+k88uAeGv4qsKS33SOOqvom6yqfRlZUlj7sBcF6WX8/loHf
	adtKxoBKtC0S4ocfW6Zp1IbaZj3zHn20rfOx8r+YoHZPuViC081qsEB3qhUCo3LxUnDQRWsnm8d
	1CniOPIh0+EtO01VVY2vNTj2lJ7l4oLb63wElEAIJoLVNV/yamVZnjpU3i3ly2fcNAP9gONPTmK
	067j61VcgdLIiaop1XYuumorPZ4vwc3vQZ/rZK2m991cqBef57cOWiCjZ+6CfYPRVCvq0N6UI0o
	sUptT4KlTRA2HKyeHa7Ymu
X-Received: by 2002:a05:6808:4f62:b0:463:8fba:5e0e with SMTP id 5614622812f47-4651ab392b3mr1217133b6e.12.1772642922923;
        Wed, 04 Mar 2026 08:48:42 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::f681])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d2c9fc2sm18466442fac.18.2026.03.04.08.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:48:42 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 07/13] spdx: De-duplicate CreationInfo
Date: Wed,  4 Mar 2026 09:44:18 -0700
Message-ID: <20260304164835.3072507-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304164835.3072507-1-JPEWhacker@gmail.com>
References: <20260303004550.650726-1-JPEWhacker@gmail.com>
 <20260304164835.3072507-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 16:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232396

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


