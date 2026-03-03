Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37E5EB364F
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 00:46:03 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7687.1772498759822960365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 16:45:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b77G0mO6;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4639279c7a6so1833982b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772498759; x=1773103559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GygUv99XXYXKewxHRq+dVr3zF/qZkskkMg0YO5XWbQU=;
        b=b77G0mO6iqsHuQUZusyjtA5KiZLIlvcd7AlhO7pDrFudLW7rijLfkMYCXgmhfyaSmM
         85kFpqfJWzTZHnE2Nc0lwtLzGHouMmc8OC7MCMAxZ1TCRoNhceVevF6TF9zTbdXFqKFo
         qT6IyXMUXrUGGhOrUpOIYT3seYTmQ0TdgUW/JciOfCoAwcePiIn6q5I/d7Umj9wptARv
         tB7ukmoMbPp5B+E1YdHnga+/Frh/hxhDNVIQzMgEyqatInIxaahMA9uje+hkibKGHS9m
         KFwpCHIuyxvtAIOBOS4i9uCIxIppFy3D7LMYKLLM89CMmB/+AaDNmsVfQoa/i89ddWTD
         AuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772498759; x=1773103559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GygUv99XXYXKewxHRq+dVr3zF/qZkskkMg0YO5XWbQU=;
        b=XNZuRwcYyB8J9e3YmCx5GjTO+CehPhVOR1xb/iFuGU0/2tgsViD0T5aYPdJCvdu06c
         NoILh8uDGB5XY7KDvwOKDwjjIEXVwrSnqina6z3Wggwd50p4Ygs1boqZaR1hwuqM0h0/
         MU89QPT4nZgOEglHsNApx0ZTQBPJFOGgDDDW23FMpX5H42nMSyg41EdW2yeWRyuCDd00
         CyNDthAkzvdmraHxL55XFajl84K5z6ZPmSa7awZGpc8aAmPAB+2iLRfL9dL0fe0pmoFh
         /1x6CK1cGHI8G3/SioDZomdaBpMryKvMN2/rISCyP571AcYZ8PzJwvkc2G5aaiOY/n58
         RymA==
X-Gm-Message-State: AOJu0YzjlH6p37lsiijOlB0MmUeiy3LUB3a2SA2Y2Q8L++Jg8e7bu7rc
	pjSJBCyio2px2kVQu/vDb/kXh2NcBNG+fvlsmJ7Qw/I7LnYCJpD2+DEQESO4KQ==
X-Gm-Gg: ATEYQzzWaUxyeH8PZkawwY4vNOe6Ex0CV+Suj81hjGLwZGkFrmmmNHIglUzwuU60fNM
	qXsW+TQKzJfLjQNzUpnKLjKU1JyWNp/bDZHn9aqQJPkZlwZuOPDyzfGgx1TbvppwS3ngWFe21vf
	rMYa2S9S3RFdXLwfFVLR0rTppI5XAy9JWssoZVYIbZHlLpqjIW0ilJo9v4f34q81lEiEugJ3J72
	mh8244ZYPio06WZI7CQCzZZvQ/5FNq9mAGFW2d8QnCjJbVfNC7xzpZF3DxHv9X6FxCKool/Vx5E
	UisLZCgNyOnR/kg9dzh0sDdIxWDwtUMXJA5bQhOMEWPWJRweS6H4KW8IRGRqtBwsshViYWN6A8E
	m2N7slfFPdIpiGgP4n6Ic6Vt7N/BFVkhAwSTod8PY/fD7r030jc66ZyYq4SbV5tGUp5zRbdzcaj
	WDCuzudwj+QoUPZ9OxnTG/
X-Received: by 2002:a05:6808:e8e:b0:45c:9a93:1b9f with SMTP id 5614622812f47-464bec1d91dmr6841201b6e.53.1772498758828;
        Mon, 02 Mar 2026 16:45:58 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::ba6c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb59b66fsm8637446b6e.10.2026.03.02.16.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 16:45:58 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 6/9] spdx30: Include patch file information in VEX
Date: Mon,  2 Mar 2026 17:43:53 -0700
Message-ID: <20260303004550.650726-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303004550.650726-1-JPEWhacker@gmail.com>
References: <20260226173930.2847872-1-JPEWhacker@gmail.com>
 <20260303004550.650726-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 00:46:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232229

Modifies the SPDX VEX output to include the patches that fix a
particular vulnerability. This is done by adding a `patchedBy`
relationship from the `VexFixedVulnAssessmentRelationship` to the `File`
that provides the fix.

If the file can be located without fetching (e.g. is a file:// in
SRC_URI), the checksum will be included.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py       | 60 ++++++++++++++-------------
 meta/lib/oe/spdx30_tasks.py | 81 ++++++++++++++++++++++++++++---------
 2 files changed, 92 insertions(+), 49 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 50a72fce39..21f084dc16 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -620,37 +620,38 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         )
         spdx_file.extension.append(OELicenseScannedExtension())
 
-    def new_file(self, _id, name, path, *, purposes=[]):
-        sha256_hash = bb.utils.sha256_file(path)
+    def new_file(self, _id, name, path, *, purposes=[], hashfile=True):
+        if hashfile:
+            sha256_hash = bb.utils.sha256_file(path)
 
-        for f in self.by_sha256_hash.get(sha256_hash, []):
-            if not isinstance(f, oe.spdx30.software_File):
-                continue
+            for f in self.by_sha256_hash.get(sha256_hash, []):
+                if not isinstance(f, oe.spdx30.software_File):
+                    continue
 
-            if purposes:
-                new_primary = purposes[0]
-                new_additional = []
+                if purposes:
+                    new_primary = purposes[0]
+                    new_additional = []
 
-                if f.software_primaryPurpose:
-                    new_additional.append(f.software_primaryPurpose)
-                new_additional.extend(f.software_additionalPurpose)
+                    if f.software_primaryPurpose:
+                        new_additional.append(f.software_primaryPurpose)
+                    new_additional.extend(f.software_additionalPurpose)
 
-                new_additional = sorted(
-                    list(set(p for p in new_additional if p != new_primary))
-                )
+                    new_additional = sorted(
+                        list(set(p for p in new_additional if p != new_primary))
+                    )
 
-                f.software_primaryPurpose = new_primary
-                f.software_additionalPurpose = new_additional
+                    f.software_primaryPurpose = new_primary
+                    f.software_additionalPurpose = new_additional
 
-            if f.name != name:
-                for e in f.extension:
-                    if isinstance(e, OEFileNameAliasExtension):
-                        e.aliases.append(name)
-                        break
-                else:
-                    f.extension.append(OEFileNameAliasExtension(aliases=[name]))
+                if f.name != name:
+                    for e in f.extension:
+                        if isinstance(e, OEFileNameAliasExtension):
+                            e.aliases.append(name)
+                            break
+                    else:
+                        f.extension.append(OEFileNameAliasExtension(aliases=[name]))
 
-            return f
+                return f
 
         spdx_file = oe.spdx30.software_File(
             _id=_id,
@@ -661,12 +662,13 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             spdx_file.software_primaryPurpose = purposes[0]
             spdx_file.software_additionalPurpose = purposes[1:]
 
-        spdx_file.verifiedUsing.append(
-            oe.spdx30.Hash(
-                algorithm=oe.spdx30.HashAlgorithm.sha256,
-                hashValue=sha256_hash,
+        if hashfile:
+            spdx_file.verifiedUsing.append(
+                oe.spdx30.Hash(
+                    algorithm=oe.spdx30.HashAlgorithm.sha256,
+                    hashValue=sha256_hash,
+                )
             )
-        )
 
         return self.add(spdx_file)
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index a8fffbb085..aec47d4f81 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -568,44 +568,63 @@ def create_recipe_spdx(d):
     if include_vex != "none":
         patched_cves = oe.cve_check.get_patched_cves(d)
         for cve, patched_cve in patched_cves.items():
-            decoded_status = {
-                "mapping": patched_cve["abbrev-status"],
-                "detail": patched_cve["status"],
-                "description": patched_cve.get("justification", None),
-            }
+            mapping = patched_cve["abbrev-status"]
+            detail = patched_cve["status"]
+            description = patched_cve.get("justification", None)
+            resources = patched_cve.get("resource", [])
 
             # If this CVE is fixed upstream, skip it unless all CVEs are
             # specified.
-            if (
-                include_vex != "all"
-                and "detail" in decoded_status
-                and decoded_status["detail"]
-                in (
-                    "fixed-version",
-                    "cpe-stable-backport",
-                )
+            if include_vex != "all" and detail in (
+                "fixed-version",
+                "cpe-stable-backport",
             ):
                 bb.debug(1, "Skipping %s since it is already fixed upstream" % cve)
                 continue
 
             spdx_cve = recipe_objset.new_cve_vuln(cve)
 
-            cve_by_status.setdefault(decoded_status["mapping"], {})[cve] = (
+            cve_by_status.setdefault(mapping, {})[cve] = (
                 spdx_cve,
-                decoded_status["detail"],
-                decoded_status["description"],
+                detail,
+                description,
+                resources,
             )
 
     all_cves = set()
     for status, cves in cve_by_status.items():
         for cve, items in cves.items():
-            spdx_cve, detail, description = items
+            spdx_cve, detail, description, resources = items
             spdx_cve_id = oe.sbom30.get_element_link_id(spdx_cve)
 
             all_cves.add(spdx_cve)
 
             if status == "Patched":
-                recipe_objset.new_vex_patched_relationship([spdx_cve_id], [recipe])
+                spdx_vex = recipe_objset.new_vex_patched_relationship(
+                    [spdx_cve_id], [recipe]
+                )
+                patches = []
+                for idx, filepath in enumerate(resources):
+                    patches.append(
+                        recipe_objset.new_file(
+                            recipe_objset.new_spdxid(
+                                "patch", str(idx), os.path.basename(filepath)
+                            ),
+                            os.path.basename(filepath),
+                            filepath,
+                            purposes=[oe.spdx30.software_SoftwarePurpose.patch],
+                            hashfile=os.path.isfile(filepath),
+                        )
+                    )
+
+                if patches:
+                    recipe_objset.new_scoped_relationship(
+                        spdx_vex,
+                        oe.spdx30.RelationshipType.patchedBy,
+                        oe.spdx30.LifecycleScopeType.build,
+                        patches,
+                    )
+
             elif status == "Unpatched":
                 recipe_objset.new_vex_unpatched_relationship([spdx_cve_id], [recipe])
             elif status == "Ignored":
@@ -751,12 +770,14 @@ def create_spdx(d):
 
     # Collect all VEX statements from the recipe
     vex_statements = {}
+    vex_patches = {}
     for rel in recipe_objset.foreach_filter(
         oe.spdx30.Relationship,
         relationshipType=oe.spdx30.RelationshipType.hasAssociatedVulnerability,
     ):
         for cve in rel.to:
             vex_statements[cve] = []
+            vex_patches[cve] = []
 
     for cve in vex_statements.keys():
         for rel in recipe_objset.foreach_filter(
@@ -764,6 +785,13 @@ def create_spdx(d):
             from_=cve,
         ):
             vex_statements[cve].append(rel)
+            if rel.relationshipType == oe.spdx30.RelationshipType.fixedIn:
+                for patch_rel in recipe_objset.foreach_filter(
+                    oe.spdx30.Relationship,
+                    relationshipType=oe.spdx30.RelationshipType.patchedBy,
+                    from_=rel,
+                ):
+                    vex_patches[cve].extend(patch_rel.to)
 
     # Write out the package SPDX data now. It is not complete as we cannot
     # write the runtime data, so write it to a staging area and a later task
@@ -889,7 +917,9 @@ def create_spdx(d):
 
             # Add concluded license relationship if manually set
             # Only add when license analysis has been explicitly performed
-            concluded_license_str = d.getVar("SPDX_CONCLUDED_LICENSE:%s" % package) or d.getVar("SPDX_CONCLUDED_LICENSE")
+            concluded_license_str = d.getVar(
+                "SPDX_CONCLUDED_LICENSE:%s" % package
+            ) or d.getVar("SPDX_CONCLUDED_LICENSE")
             if concluded_license_str:
                 concluded_spdx_license = add_license_expression(
                     d, build_objset, concluded_license_str, license_data
@@ -915,9 +945,20 @@ def create_spdx(d):
             for cve, vexes in vex_statements.items():
                 for vex in vexes:
                     if vex.relationshipType == oe.spdx30.RelationshipType.fixedIn:
-                        pkg_objset.new_vex_patched_relationship(
+                        spdx_vex = pkg_objset.new_vex_patched_relationship(
                             [oe.sbom30.get_element_link_id(cve)], [spdx_package]
                         )
+                        if vex_patches[cve]:
+                            pkg_objset.new_scoped_relationship(
+                                spdx_vex,
+                                oe.spdx30.RelationshipType.patchedBy,
+                                oe.spdx30.LifecycleScopeType.build,
+                                [
+                                    oe.sbom30.get_element_link_id(p)
+                                    for p in vex_patches[cve]
+                                ],
+                            )
+
                     elif vex.relationshipType == oe.spdx30.RelationshipType.affects:
                         pkg_objset.new_vex_unpatched_relationship(
                             [oe.sbom30.get_element_link_id(cve)], [spdx_package]
-- 
2.53.0


