Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6315.1793052476904414937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 15:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XOgIh2IC;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8479f46ecd8so1634021a34.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 15:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793052476; x=1793657276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VT7Mk6kEJY8XQfY27OulkxgDbinx+8UdpU5Euvt0id8=;
        b=XOgIh2ICD/8clQs1vbdB+K/Hcr7cFKO4unxKnVNek0GVIQNv5DHb7lYuw3zGzRMVvw
         iB1+x05Me2NxoYuHLRiL81lZKwHg/+upeE8tPMCjt5CHSMHYMCWRGkhKXBgW1AbSfA/b
         xQf0F7Jq2SW8zVQensZlGWx9p9Tle+RLZoQv0+Jb3M/fqFss+E3AA5nRlE/RF/tkk2jP
         Xnj2uCswRvGP+naKULgUABfpdkt8DMUNcCoylocqYMN7h4C2oHp5ETwPBysAGI+F52qU
         yrn4Y2z6JS0e8kleHs8KIixU1zSyPv1EJHRV7k28JQ1WVXV5bBQgiKt/1H8zcOTFLPJQ
         dLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793052476; x=1793657276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VT7Mk6kEJY8XQfY27OulkxgDbinx+8UdpU5Euvt0id8=;
        b=z8CND7he7K61iReT6JE6joFoyf7Saxndx8ev6TGRMo0O+zK9Odkg9kG01DaC8zQr7a
         SfXuKZviBBOMt2ZduUlJ37UW1acmx/slqMt4wfUGYFq5vfh/e+3YlN31r3rFo2Ujm1BX
         KgI0YsAtRcX1ci4h0fNpCiCmCKY83iXxgU2XRvX9ER3xImJyiTbys8tKT6/R/5CVI5XX
         bfwx2bWCvpNm7tBJ5V4Csuclv+puyjD+Y6RVG6Burs0NSxfPoVitV5ASVtR5JkMoIHoP
         5/aB9y5pa3o/4GQfzb/O8lgV7bhFoGH3HJDyGjugQ2cCr2Gnihn6ohBsS7BlgmdG5q2h
         ge5Q==
X-Gm-Message-State: AFq9FYIRpcR+NVDwzMsjaLeEaHSCXqUm2uvrHrl+l6+KQRVLCxbShYqJ
	V20pULe9ZeKgKmio+pU6MwAkL64jc7JmzgMpOF8MhZUnVoVgMKL87jsdvAVHzw==
X-Gm-Gg: AYBFou3xFuCMU+Ft3u1k7yxEvYY6e1gtkavI4AUA6CuUAAHmonvYLQEIXFwf7rBmJe8
	pTH3DXFUrmn5FDJPRu5u37PQrwmWx71U6LKJi7G7snftU1+GFwwV5o8dY2Ax/HaudsA2jxQA4mW
	NS55f14JKsav1q5GDJ0ERy1SZmG8mbE8L/wqBmcGbmZ7DaQQ/zD7eQ46FWjjvKy+7/gspOcYx5X
	oFyUYV00mKfSQx/ORuvCu5lAf5y8AXBmFut25h/2t+lveY4GMeIBmPOJ/Uh+AMJt4l07VHltlnv
	MLw3sUDSZ7plMR7HfbjIyTLjPJ9j4YqvVlpcZt0rhl83Pt9NfZ8R25ucfjli6J7hhmtu1zRati3
	0S+uIRQca5xasojoVUSEAmU9LxbKJKw4280JmFnLANbRLLjfGYxMobiHrpa2OE94vXVFivWwmfR
	/embu93SXZ8Lg2pRXyiTsDycwLkWE5Wwjtl/VV1/ZDCqE78R5bzu4edanZryxJDCbDY6ZJpv0It
	Lfk9r1QpL9H3aJYe7AcLtRMoBPfZTv5utCbB9hRoZn+MOV8sUq/4oVX4cqBp3YK46PABpz/GQk=
X-Received: by 2002:a05:6830:3e04:b0:81f:92c9:1f80 with SMTP id 46e09a7af769-850fd950254mr7561165a34.16.1793052476046;
        Mon, 26 Oct 2026 15:07:56 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::283f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0763easm9025237a34.13.2026.10.26.15.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:07:55 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/3] lib/oe/sbom.py: Fix partial licenses masking complete ones
Date: Mon, 26 Oct 2026 16:06:34 -0600
Message-ID: <20261026220751.2480577-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026220751.2480577-1-JPEWhacker@gmail.com>
References: <20261026220751.2480577-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 22:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248703
Content-Type: text/plain; charset="utf-8"

When scanning files for license expressions, an "incomplete" (or
partial) license object can be created, in that if the Licenses
Expression contains a LicenseRef- license, the text for the license will
is not linked. This usually happens when parsing recipe License
expressions, since the license files are not always present until
do_fetch/do_unpack.

Since license expressions are matched based on the expression, it is
possible for the partial license to be used instead of the complete one.
It is also possible for the partial license to be preferred when
de-duplicating license expressions while generating the final SBoM.

Fix this by identifying when a partial license is provided (that is, a
license with no text map and a LicenseRef-), and tagging them with an
internal extension that causes it to be less preferred than an complete
license.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py | 106 +++++++++++++++++++++++++++++++++---------
 1 file changed, 85 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index b33860e4aa..713eec92d4 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -97,6 +97,32 @@ class OELicenseScannedExtension(oe.spdx30.extension_Extension):
     INTERNAL = True
 
 
+class OEIncompleteExtension(oe.spdx30.extension_Extension):
+    """
+    The presence of this extension means that the Element is incomplete, and
+    should not be preferred over a completely defined Element
+    """
+
+    TYPE = OE_SPDX_BASE + "incomplete"
+    CLOSED = True
+    INTERNAL = True
+
+    @classmethod
+    def is_incomplete(cls, obj):
+        for e in obj.extension:
+            if isinstance(e, cls):
+                return True
+        return False
+
+    @classmethod
+    def is_complete(cls, obj):
+        return not cls.is_incomplete(obj)
+
+    @classmethod
+    def set(cls, obj):
+        obj.extension.append(cls())
+
+
 class OEDocumentExtension(oe.spdx30.extension_Extension):
     """
     This extension is added to a SpdxDocument to indicate various useful bits
@@ -194,21 +220,35 @@ def to_list(l):
 
 class Dedup(object):
     def __init__(self, objset):
-        self.unique = set()
-        self.dedup = {}
+        self.unique = []
+        self.dup_idx = {}
         self.objset = objset
+        self.has_duplicates = False
 
-    def find_duplicates(self, cmp, typ, **kwargs):
+    def find_duplicates(self, cmp, typ, choose=None, **kwargs):
         for o in self.objset.foreach_filter(typ, **kwargs):
-            for u in self.unique:
+            for idx, u in enumerate(self.unique):
                 if cmp(u, o):
-                    self.dedup[o] = u
+                    self.has_duplicates = True
+                    self.dup_idx[o] = idx
+                    if choose:
+                        self.unique[idx] = choose(u, o)
                     break
             else:
-                self.unique.add(o)
+                self.dup_idx[o] = len(self.unique)
+                self.unique.append(o)
 
     def get(self, o):
-        return self.dedup.get(o, o)
+        idx = self.dup_idx.get(o, -1)
+        if idx < 0:
+            return o
+        return self.unique[idx]
+
+    def duplicates(self):
+        for o, idx in self.dup_idx.items():
+            d = self.unique[idx]
+            if d is not o:
+                yield o, d
 
 
 class ObjectSet(oe.spdx30.SHACLObjectSet):
@@ -582,23 +622,34 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         if license_list_version.count(".") < 2:
             license_list_version += ".0"
 
+        license_text = sorted(license_text_map.items(), key=lambda t: t[0])
+
+        incomplete = not license_text and "licenseref-" in license_expression.lower()
+
         spdxid = [
-            "license",
+            "license" if not incomplete else "partial-license",
             license_list_version,
             re.sub(r"[^a-zA-Z0-9_-]", "_", license_expression),
         ]
 
-        license_text = sorted(license_text_map.items(), key=lambda t: t[0])
-
         if not license_text:
-            lic = self.find_filter(
+            incomplete_lic = None
+            for lic in self.foreach_filter(
                 oe.spdx30.simplelicensing_LicenseExpression,
                 simplelicensing_licenseExpression=license_expression,
                 simplelicensing_licenseListVersion=license_list_version,
-            )
-            if lic is not None:
-                return lic
+            ):
+                if OEIncompleteExtension.is_complete(lic):
+                    return lic
+
+                if not incomplete_lic:
+                    incomplete_lic = lic
+
+            if incomplete and incomplete_lic:
+                return incomplete_lic
+
         else:
+            # Note: This branch will never be entered for incomplete licenses
             spdxid.append(spdxid_hash(*(v for _, v in license_text)))
             lic = self.find_by_id(self.new_spdxid(*spdxid))
             if lic is not None:
@@ -618,6 +669,9 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
                 oe.spdx30.DictionaryEntry(key=key, value=value._id)
             )
 
+        if incomplete:
+            OEIncompleteExtension.set(lic)
+
         return lic
 
     def scan_declared_licenses(self, spdx_file, filepath, license_data):
@@ -953,16 +1007,16 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
 
             return True
 
-        if d.dedup:
+        if d.has_duplicates:
             for o in self.objects:
                 o.walk(visit)
 
-            for k, v in d.dedup.items():
+            for dup, replacement in d.duplicates():
                 bb.debug(
                     1,
-                    f"Removing duplicate {k.__class__.__name__} {k._id or id(k)} -> {v._id or id(v)}",
+                    f"Removing duplicate {dup.__class__.__name__} {dup._id or id(dup)} -> {replacement._id or id(replacement)}",
                 )
-                self.objects.discard(k)
+                self.objects.discard(dup)
 
             self.create_index()
 
@@ -1148,9 +1202,6 @@ def create_sbom(d, name, root_elements, add_objectsets=[]):
             + "\n  ".join(sorted(list(missing_spdxids)))
         )
 
-    # Filter out internal extensions from final SBoMs
-    objset.remove_internal_extensions()
-
     # SBoM should be the only root element of the document
     objset.doc.rootElement = [sbom]
 
@@ -1161,6 +1212,15 @@ def create_sbom(d, name, root_elements, add_objectsets=[]):
             == b.simplelicensing_licenseListVersion
         )
 
+    def choose_license_expressions(current, new):
+        if OEIncompleteExtension.is_complete(current):
+            return current
+
+        if OEIncompleteExtension.is_incomplete(new):
+            return current
+
+        return new
+
     def cmp_creation_info(a, b):
         data_a = {k: a[k] for k in a}
         data_b = {k: b[k] for k in b}
@@ -1173,9 +1233,13 @@ def create_sbom(d, name, root_elements, add_objectsets=[]):
         dedup.find_duplicates(
             cmp_license_expression,
             oe.spdx30.simplelicensing_LicenseExpression,
+            choose=choose_license_expressions,
         )
 
         # Deduplicate creation info
         dedup.find_duplicates(cmp_creation_info, oe.spdx30.CreationInfo)
 
+    # Filter out internal extensions from final SBoMs
+    objset.remove_internal_extensions()
+
     return objset, sbom
-- 
2.56.0

