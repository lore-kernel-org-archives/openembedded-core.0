Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBEBF55429
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 23:02:57 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33597.1771974170479411133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 15:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lvBFP7IE;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-463d81452abso3898684b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 15:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771974169; x=1772578969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgZWWYUETcp+KAK54Y1gHYnk1xGLeXOCGllecsNhDhw=;
        b=lvBFP7IEdprvke3pEGLe6PCl5+5P0xdyigPbYz4CRz2W2p92JB+5H1NDo7ToqSVxgX
         WMovmWo/0wegSvOvi4PxEGeBO1vr+E7asFxjbQn+rh3HBfEmRYc16phrxVTbyn8Rzfpc
         mXb2+GlfitLJwr7C4UZ0j6jMKNigP+a4ylD5+aJv6WMY8DDOqchMPbt1x32lLUqiv/dX
         tfSme4b2ikmMjZEwGsqUlsr9Eo/M3oGBAyFAzD0d/03xqxIOQrx9T7OlvsTaW0+rK51v
         +M7yvFRwyMN4jy8ZDDoFH32CSTy3WfcrC6LXSk013lwQiPxrVcBQ/h6Is9TVpgvHQGRR
         pC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771974169; x=1772578969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RgZWWYUETcp+KAK54Y1gHYnk1xGLeXOCGllecsNhDhw=;
        b=I/u6htYtm9HXHhdm9O9Bkq7XAh+3jC3tdFCYvJxx0XuhGRUVoqdRRx0jtN15cvy+hW
         mc9b2UqsROXZVivg1GLI9oLQoycIQw9DL4hDXFfJJCxcVJlSLjvkbAR3kkqMlJLXimKi
         FuYswPndsdscL+CcNZO5WQcxZxnYuchpflXKOo8QebW2R8HN9NcTcCb3H96Aquj82e1Z
         KYCm71WE2BY7obWtSgJDKHEKIx3yaIU8xt26f4sWucPYMahNMeIFuc8v8gf9BfNjOBVf
         KeE6ktwhL6LFm53GkfELP3rCfsL2+c+4A0ucZp8D1UmS+4LWASjeR71xzOIOmv2bzrhx
         UC4g==
X-Gm-Message-State: AOJu0YyDyWllaBh1MVQp+0siZ51qG2ItOsUKSXXSclMbHNKpDYnc1Hrz
	dZV9mMB8Z/b7BC4ARqVRaH4FK1U06wHoLadqclu8mqJj2zhDsCiwxX7cOWVXNw==
X-Gm-Gg: AZuq6aI6pybtk8L6dA8zHwskH3Dl3peZXsX2+H2PbXpwV4FAuVfviZytF530gTvr0wm
	kR5dcMoCz8jZnor2slOJJJWfwv/lNP+Q+EVVK3SX5fMV016GoPoCA69p0fZN0WQhk1i4v+5QgER
	WNYbI1G2VfOrJWAWeXAG90e4LHLAB7kY+LOQn/n7D49VtjGwShRbC5WdV7+t99qxl/+E9HHRsQY
	HbHZHbozaZl/gFY0R7vIX2/Ji05chUc3Y45Q3RWVEI1OA1XoaOI3U7XZJk6ycE8GM3e9BoBiS0x
	nBw24QRwfnb9zjdWl/ipX8RnE00dAs1DUKPTh5ma/o5wf5dQEL3PMNSwlI9mAv9E39o97E/zXEX
	S1Q6CMRXdTXpy9hpR0txRSpOJFk1zECsh4HglTgXM/Gz2BRTl+UDusQzO+L2RYWdY8cCt+Lm5px
	NzLJsUss0l4d7tDkcGDJ+5
X-Received: by 2002:a05:6808:4f07:b0:45c:8bc0:fcdf with SMTP id 5614622812f47-4644616cb87mr7362730b6e.10.1771974169615;
        Tue, 24 Feb 2026 15:02:49 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::ba6c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4644a1efc76sm7912024b6e.18.2026.02.24.15.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 15:02:48 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 7/8] spdx: De-duplicate CreationInfo
Date: Tue, 24 Feb 2026 16:00:20 -0700
Message-ID: <20260224230234.679049-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224230234.679049-1-JPEWhacker@gmail.com>
References: <20260220154123.376880-1-JPEWhacker@gmail.com>
 <20260224230234.679049-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 23:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231916

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


