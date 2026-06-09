Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D871CD98C6
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 22:23:39 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7672.1781043818587382404
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 15:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X5OtAhYW;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-43d1470491aso2015693fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 15:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043818; x=1781648618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeYF99Bpux33RKKOg7Mc272AtA7FgoMxbog0f8WPF+o=;
        b=X5OtAhYWaY1lurRpDs9viXeNY4v/x7n147hJe9J4kLWImTBvPsa8v2YglJtzbmsvu5
         XKBGI3XwvaGbZXW+lFirzmVwx/LM4Q1mh/dEXH2EPHf2U8e1tDaLPSK7o62hxr0LJlyD
         +s4ZaxfzrHZXX7RMjT2hxIkGUvi4oUx8xOLVU4Xa19mUq8GevbjAH36YjG7jmLHH3z3b
         WwIp1hY2ifqIxAzReqrVZdnfQtzY1UIEH5dhcKQxDZR/ib9zbx4AYLbkLHWuhoalDde0
         LxYQPqo6QvpTSL7hliiA+lj8KvANmpIDe99OCyhn2/S7DZlKTPZ0WV+OcIBh54qIDTYv
         dYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043818; x=1781648618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zeYF99Bpux33RKKOg7Mc272AtA7FgoMxbog0f8WPF+o=;
        b=rKgJO5K5MrL3WsRQW+j/rDPfb6718gTAzp5h87joyNuD5Z2qWkJPBLLk45XMODf+Nd
         /EtetDfUGoYydWK5kYjePZ2k1lGTBCHUcKuMTeuuZYnqwEaiRacuxWz3qgAYh0am3v/R
         pTnVIRefk1HaddhJ/k9D8fU7SwgCAf9MrXZ/briiYqAJORoLl3MTl47BBTOUmlFJ+eKP
         GVCdvn2AF+nLkF032JIGto2D/OcuZjwaGLtTzSqkD+Eh75S32U4WdJslaQoSKSJm5a/6
         +y9GciagjFmzsgLxDNJoLbEPKtnZbrrUHOiwINE+416HOkk9Axh+qq5Oo6wOQ2mhKxL4
         fZjA==
X-Gm-Message-State: AOJu0Yy/IpQRfRX/rhjG1vou5m2z6imH0ldoSUTX5SCbOO11N1ug1+4l
	Kit8pzbxY4pR8UD4fzS5THet5UMYgRAm/3TOuwA23XCu7EY8Tfbm39t3uBjpBQ==
X-Gm-Gg: Acq92OHvLm7CMjN60trwoj5ZxnkHrjQr7Pzau9FLUSlMKsiO/yXAlB2hK6MTORJ5gUT
	5SG42n5dq61NWHl3p0LVpiyhA5QmV3+ngvQE5yGEKGOPMjU4rfOrlyHYUOpYbkTidx00yOGDreG
	XbRMwDIO23YG4QpTTX8PNmg2nezuziUkfZcxUKzmKSRvwQ73kzTSGy2JHZU4FDROVz00ZX6ZBRQ
	jYNdAPQGwF8hchLRhZ6CjwGrMgWcEutApVhOxkN7ZlDfq+NhJuY75940JgxikHzQ67GWjgrCv0p
	KJw302K0ECsr+cxdvq0Ti1X2A2vTc+HqZg1woGcSIGThxk2MVx9PuIhtPH7Ldy2HWLzJjimjqYA
	odjays2URywQ00tWADqhZpiksIxBN/cQ3a/a6F5P2TcO2ilKGuGJWClhH/3ljof1KbGVH76g09q
	m6UiwsUPRfIPG7SL+B5fccLKbgQ8sPvw==
X-Received: by 2002:a05:6871:6d11:b0:43d:1689:ed9c with SMTP id 586e51a60fabf-4413d6b1a1dmr12546848fac.18.1781043817501;
        Tue, 09 Jun 2026 15:23:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::ce1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d7d4f449sm19122610fac.8.2026.06.09.15.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:23:36 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/5] spdx: Reformat
Date: Tue,  9 Jun 2026 16:15:53 -0600
Message-ID: <20260609222331.1293007-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609222331.1293007-1-JPEWhacker@gmail.com>
References: <20260609222331.1293007-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 22:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238305

Reformats SPDX files with black

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py       |  6 +--
 meta/lib/oe/spdx30_tasks.py | 76 ++++++++++++++++++++-----------------
 2 files changed, 44 insertions(+), 38 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index b379ff947c..0926266295 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -712,7 +712,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         return self.add(v)
 
     def new_vex_patched_relationship(self, from_, to, notes: None):
-        props = {'security_statusNotes': notes} if notes else {}
+        props = {"security_statusNotes": notes} if notes else {}
         return self._new_relationship(
             oe.spdx30.security_VexFixedVulnAssessmentRelationship,
             from_,
@@ -724,7 +724,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         )
 
     def new_vex_unpatched_relationship(self, from_, to, notes: None):
-        props = {'security_statusNotes': notes} if notes else {}
+        props = {"security_statusNotes": notes} if notes else {}
         return self._new_relationship(
             oe.spdx30.security_VexAffectedVulnAssessmentRelationship,
             from_,
@@ -737,7 +737,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         )
 
     def new_vex_ignored_relationship(self, from_, to, *, impact_statement, notes: None):
-        props = {'security_statusNotes': notes} if notes else {}
+        props = {"security_statusNotes": notes} if notes else {}
         return self._new_relationship(
             oe.spdx30.security_VexNotAffectedVulnAssessmentRelationship,
             from_,
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 7cc46d579b..72d17aade6 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -382,7 +382,6 @@ def collect_dep_sources(dep_objsets, dest):
             index_sources_by_hash(e.to, dest)
 
 
-
 def _generate_git_purl(d, download_location, srcrev):
     """Generate a Package URL for a Git source from its download location.
 
@@ -392,27 +391,29 @@ def _generate_git_purl(d, download_location, srcrev):
 
     Returns the PURL string or None if no mapping matches.
     """
-    if not download_location or not download_location.startswith('git+'):
+    if not download_location or not download_location.startswith("git+"):
         return None
 
     git_url = download_location[4:]  # Remove 'git+' prefix
 
     # Default handler: github.com
     git_purl_handlers = {
-        'github.com': 'pkg:github',
+        "github.com": "pkg:github",
     }
 
     # Custom PURL mappings from SPDX_GIT_PURL_MAPPINGS
     # Format: "domain1:purl_type1 domain2:purl_type2"
-    custom_mappings = d.getVar('SPDX_GIT_PURL_MAPPINGS')
+    custom_mappings = d.getVar("SPDX_GIT_PURL_MAPPINGS")
     if custom_mappings:
         for mapping in custom_mappings.split():
-            parts = mapping.split(':', 1)
+            parts = mapping.split(":", 1)
             if len(parts) == 2:
                 git_purl_handlers[parts[0]] = parts[1]
                 bb.debug(2, f"Added custom Git PURL mapping: {parts[0]} -> {parts[1]}")
             else:
-                bb.warn(f"Invalid SPDX_GIT_PURL_MAPPINGS entry: {mapping} (expected format: domain:purl_type)")
+                bb.warn(
+                    f"Invalid SPDX_GIT_PURL_MAPPINGS entry: {mapping} (expected format: domain:purl_type)"
+                )
 
     try:
         parsed = urllib.parse.urlparse(git_url)
@@ -425,11 +426,11 @@ def _generate_git_purl(d, download_location, srcrev):
 
     for domain, purl_type in git_purl_handlers.items():
         if hostname == domain:
-            path = parsed.path.strip('/')
-            path_parts = path.split('/')
+            path = parsed.path.strip("/")
+            path_parts = path.split("/")
             if len(path_parts) >= 2:
                 owner = path_parts[0]
-                repo = path_parts[1].replace('.git', '')
+                repo = path_parts[1].replace(".git", "")
                 return f"{purl_type}/{owner}/{repo}@{srcrev}"
             break
 
@@ -448,12 +449,12 @@ def _enrich_source_package(d, dl, fd, file_name, primary_purpose):
 
     if fd.type == "git":
         # Use full SHA-1 from fd.revision
-        srcrev = getattr(fd, 'revision', None)
-        if srcrev and srcrev not in {'${AUTOREV}', 'AUTOINC', 'INVALID'}:
+        srcrev = getattr(fd, "revision", None)
+        if srcrev and srcrev not in {"${AUTOREV}", "AUTOINC", "INVALID"}:
             version = srcrev
 
         # Generate PURL for Git hosting services
-        download_location = getattr(dl, 'software_downloadLocation', None)
+        download_location = getattr(dl, "software_downloadLocation", None)
         if version and download_location:
             purl = _generate_git_purl(d, download_location, version)
 
@@ -464,12 +465,12 @@ def _enrich_source_package(d, dl, fd, file_name, primary_purpose):
         dl.software_packageUrl = purl
 
     # Add VCS external reference for Git repositories
-    download_location = getattr(dl, 'software_downloadLocation', None)
+    download_location = getattr(dl, "software_downloadLocation", None)
     if download_location and isinstance(download_location, str):
-        if download_location.startswith('git+'):
+        if download_location.startswith("git+"):
             git_url = download_location[4:]
-            if '@' in git_url:
-                git_url = git_url.split('@')[0]
+            if "@" in git_url:
+                git_url = git_url.split("@")[0]
 
             dl.externalRef = dl.externalRef or []
             dl.externalRef.append(
@@ -480,7 +481,6 @@ def _enrich_source_package(d, dl, fd, file_name, primary_purpose):
             )
 
 
-
 def add_download_files(d, objset):
     inputs = set()
 
@@ -726,8 +726,9 @@ def create_recipe_spdx(d):
 
             if status == "Patched":
                 spdx_vex = recipe_objset.new_vex_patched_relationship(
-                    [spdx_cve_id], [recipe],
-                    notes=": ".join(v for v in (detail, description) if v)
+                    [spdx_cve_id],
+                    [recipe],
+                    notes=": ".join(v for v in (detail, description) if v),
                 )
                 patches = []
                 for idx, filepath in enumerate(resources):
@@ -753,8 +754,9 @@ def create_recipe_spdx(d):
 
             elif status == "Unpatched":
                 recipe_objset.new_vex_unpatched_relationship(
-                    [spdx_cve_id], [recipe],
-                    notes=": ".join(v for v in (detail, description) if v)
+                    [spdx_cve_id],
+                    [recipe],
+                    notes=": ".join(v for v in (detail, description) if v),
                 )
             elif status == "Ignored":
                 spdx_vex = recipe_objset.new_vex_ignored_relationship(
@@ -1060,7 +1062,11 @@ def create_spdx(d):
 
             if include_sources:
                 debug_sources |= get_package_sources_from_debug(
-                    d, package, package_files, dep_sources, source_hash_cache,
+                    d,
+                    package,
+                    package_files,
+                    dep_sources,
+                    source_hash_cache,
                     excluded_files=excluded_files,
                 )
 
@@ -1185,7 +1191,7 @@ def create_package_spdx(d):
             if dep not in providers:
                 continue
 
-            (dep, _) = providers[dep]
+            dep, _ = providers[dep]
 
             if not oe.packagedata.packaged(dep, localdata):
                 continue
@@ -1455,17 +1461,17 @@ def create_image_spdx(d):
             image_path = image_deploy_dir / image_filename
             if os.path.isdir(image_path):
                 a, _ = add_package_files(
-                        d,
-                        objset,
-                        image_path,
-                        lambda file_counter: objset.new_spdxid(
-                            "imagefile", str(file_counter)
-                        ),
-                        lambda filepath: [],
-                        license_data=None,
-                        ignore_dirs=[],
-                        ignore_top_level_dirs=[],
-                        archive=None,
+                    d,
+                    objset,
+                    image_path,
+                    lambda file_counter: objset.new_spdxid(
+                        "imagefile", str(file_counter)
+                    ),
+                    lambda filepath: [],
+                    license_data=None,
+                    ignore_dirs=[],
+                    ignore_top_level_dirs=[],
+                    archive=None,
                 )
                 artifacts.extend(a)
             else:
@@ -1482,7 +1488,7 @@ def create_image_spdx(d):
                             oe.spdx30.Hash(
                                 algorithm=oe.spdx30.HashAlgorithm.sha512,
                                 hashValue=bb.utils.sha512_file(image_path),
-                            )
+                            ),
                         ],
                     )
                 )
-- 
2.54.0


