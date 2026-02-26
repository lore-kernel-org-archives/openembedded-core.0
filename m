Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172A1FC593F
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:18:50 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68603.1772108319820565458
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MU8XSvoP;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48378136adcso4740775e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 04:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772108317; x=1772713117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1E3qvvnROxiWnpyJK50HtPD89ILJCBBre7Hgs6TAFs=;
        b=MU8XSvoPqj0hgl3axEzix8HslrifosQvJlLuLD0uYBBld9PFw6jHGHJc5n72jqSmP0
         Wg+Ki6bFuRSrt4aVlcLXpLLRvm9yuQC52ZbRjNnBllBXrh3Mybh7cV9MvTwsO8ZP8LGp
         ySq9CtSnE4XCKpLjdKMha9cqXzj+WsO7L4QZAacbcmm0J/RyFYXHh0FrJm6ej9XFJav6
         wnlusUaPJtVHouO5c7TLR8txfECpag9Fy/ZNbg2g5IQvf/ZR+bRJrOjck3JZuje6IEu7
         ZtoLNs4QiimdP5KCf99j/DTP0T2kWp3VIkVmzUUaU42HHN+pQtaAi1+wwZWUBcsrIN6O
         CLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772108317; x=1772713117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s1E3qvvnROxiWnpyJK50HtPD89ILJCBBre7Hgs6TAFs=;
        b=X8drYbWh0rjbXtbna7rHc01SfVL5qXZAlpkseVXPCVYUbI2beB6oMOhkD7O1ZZLEEd
         fFwqsijSdt+v/gh/ehxsYRlGuK2TuKNyFeGIJc6Hv/53N2R9TlEvUMYThB40DtoC8dPH
         61qfbZJqMHaHMXk3Szt0gD8S8gptM3uEAl0B6OJfaB3lvAM2FlUnGlkbHIcgpTmfQbIV
         l0rwFFa7oIrSpb+uqV4lfzSPwRyEKtinTES+flWmD2B2g/Sulq4pqAvQc3hmJcsiNPir
         3fERPUVoGl2VA6useH9oOuiLFyngiQiyKJKZkSj1DtWUjgZci5V9TId9KUO8D3Z0F4pw
         PsQg==
X-Gm-Message-State: AOJu0YxhVmAX0NADDfu1S4xnGbpPsJR1z+E6X+mjaVrs669MKW60n9wO
	FCcwJ5esTDy7bRWOvcfldsfK+3Det7r0hFGq1DwCee5SXoSftyNmjpBvolLJ5w==
X-Gm-Gg: ATEYQzwi6bOL0MqhAlghx+DlnECM86Z8Px+ovTQfsALIk+JTxqHpPHBjLNo3gr8Nylc
	Q8M92gyAYgVQ8Pd1C/BWjA8tgqSw8j8rY8Z5XEvtGpr3TIgBOc0RqFPYY8AaPIArXN3if3c6dCN
	Go/soo/4Z4w15JaZkC31VpAuOc4hgS3leGRxj4oQoXx5BR7Aq509d/wNJ/k4PowMqZuneo++lb6
	ZfUP1uc4zGTMEV2jjerwl7b4ZBDY3aKIrAIUOziwepJs8oY206xkWltqoaXxNELMPrF2OuKPvu7
	q5T5VgGzs/y5Ruu7rlGZpNOk0PUWdPdwts1i51nUSdMzc3pHPYGLacS9Yq3hG5c4uWHfEWpm2c+
	dLSDQ/Krndanfq/3tXchwBwBJrMuxY/P30WBET4GUonCLNnn7PZSFOCnQ48Kk4DQcAlABR+HYDq
	ls+Sq58A==
X-Received: by 2002:a05:600c:548a:b0:483:b2a8:33ff with SMTP id 5b1f17b1804b1-483c216bdefmr65139965e9.4.1772108316349;
        Thu, 26 Feb 2026 04:18:36 -0800 (PST)
Received: from fedora ([165.225.94.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm48483955e9.5.2026.02.26.04.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:18:33 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu@bootlin.com,
	Ross.Burton@arm.com
Subject: [PATCH v4 01/11] spdx30: Add configurable file filtering support
Date: Thu, 26 Feb 2026 13:18:13 +0100
Message-ID: <20260226121823.149327-2-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226121823.149327-1-stondo@gmail.com>
References: <20260226121823.149327-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 12:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232006

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This commit adds file filtering capabilities to SPDX 3.0 SBOM generation
to reduce SBOM size and focus on relevant files.

New configuration variables (in spdx-common.bbclass):

  SPDX_FILE_FILTER (default: "all"):
    - "all": Include all files (current behavior)
    - "essential": Include only LICENSE/README/NOTICE files
    - "none": Skip all files

  SPDX_FILE_ESSENTIAL_PATTERNS (extensible):
    - Space-separated patterns for essential files
    - Default: LICENSE COPYING README NOTICE COPYRIGHT etc.
    - Recipes can extend: SPDX_FILE_ESSENTIAL_PATTERNS += "MANIFEST"

  SPDX_FILE_EXCLUDE_PATTERNS (extensible):
    - Patterns to exclude in 'essential' mode
    - Default: .patch .diff test_ /tests/ .pyc .o etc.
    - Recipes can extend: SPDX_FILE_EXCLUDE_PATTERNS += ".tmp"

Implementation (in spdx30_tasks.py):

  - add_package_files(): Apply filtering during file walk
  - get_package_sources_from_debug(): Skip debug source lookup for
    filtered files instead of failing

Impact:

  - Essential mode reduces file components by ~96% (2,376 → ~90 files)
  - Filters out patches, test files, and build artifacts
  - Configurable per-recipe via variable extension
  - No impact when SPDX_FILE_FILTER="all" (default)

This is useful for creating compact SBOMs for compliance and distribution
where only license-relevant files are needed.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/spdx-common.bbclass | 37 +++++++++++++++++++++++++++
 meta/lib/oe/spdx30_tasks.py      | 44 +++++++++++++++++++++++++++++---
 2 files changed, 77 insertions(+), 4 deletions(-)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 3110230c9e..81c61e10dc 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -54,6 +54,43 @@ SPDX_CONCLUDED_LICENSE[doc] = "The license concluded by manual or external \
 
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 
+SPDX_FILES_INCLUDED ??= "all"
+SPDX_FILES_INCLUDED[doc] = "Controls which files are included in SPDX output. \
+    Values: 'all' (include all files), 'essential' (only LICENSE/README/NOTICE files), \
+    'none' (no files). The 'essential' mode reduces SBOM size by excluding patches, \
+    tests, and build artifacts."
+
+SPDX_FILE_ESSENTIAL_PATTERNS ??= "LICENSE COPYING README NOTICE COPYRIGHT PATENTS ACKNOWLEDGEMENTS THIRD-PARTY-NOTICES"
+SPDX_FILE_ESSENTIAL_PATTERNS[doc] = "Space-separated list of file name patterns to \
+    include when SPDX_FILES_INCLUDED='essential'. Recipes can extend this to add their \
+    own essential files (e.g., 'SPDX_FILE_ESSENTIAL_PATTERNS += \"MANIFEST\"')."
+
+SPDX_FILE_EXCLUDE_PATTERNS ??= ".patch .diff test_ _test. /test/ /tests/ .pyc .pyo .o .a .la"
+SPDX_FILE_EXCLUDE_PATTERNS[doc] = "Space-separated list of patterns to exclude when \
+    SPDX_FILES_INCLUDED='essential'. Files matching these patterns are filtered out. \
+    Recipes can extend this to exclude additional file types."
+
+SBOM_COMPONENT_NAME ??= ""
+SBOM_COMPONENT_NAME[doc] = "Name of the SBOM metadata component. If set, creates a \
+    software_Package element in the SBOM with image/product information. Typically \
+    set to IMAGE_BASENAME or product name."
+
+SBOM_COMPONENT_VERSION ??= "${DISTRO_VERSION}"
+SBOM_COMPONENT_VERSION[doc] = "Version of the SBOM metadata component. Used when \
+    SBOM_COMPONENT_NAME is set. Defaults to DISTRO_VERSION."
+
+SBOM_COMPONENT_SUMMARY ??= ""
+SBOM_COMPONENT_SUMMARY[doc] = "Description of the SBOM metadata component. Used when \
+    SBOM_COMPONENT_NAME is set. Typically set to IMAGE_SUMMARY or product description."
+
+SBOM_SUPPLIER_NAME ??= ""
+SBOM_SUPPLIER_NAME[doc] = "Name of the organization supplying the SBOM. If set, \
+    creates an Organization element in the SBOM with supplier information."
+
+SBOM_SUPPLIER_URL ??= ""
+SBOM_SUPPLIER_URL[doc] = "URL of the organization supplying the SBOM. Used when \
+    SBOM_SUPPLIER_NAME is set. Adds an external identifier with the organization URL."
+
 python () {
     from oe.cve_check import extend_cve_status
     extend_cve_status(d)
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 99f2892dfb..bd703b5bec 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -161,6 +161,11 @@ def add_package_files(
         compiled_sources, types = oe.spdx_common.get_compiled_sources(d)
         bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
 
+    # File filtering configuration
+    spdx_file_filter = (d.getVar("SPDX_FILE_FILTER") or "all").lower()
+    essential_patterns = (d.getVar("SPDX_FILE_ESSENTIAL_PATTERNS") or "").split()
+    exclude_patterns = (d.getVar("SPDX_FILE_EXCLUDE_PATTERNS") or "").split()
+
     for subdir, dirs, files in os.walk(topdir, onerror=walk_error):
         dirs[:] = [d for d in dirs if d not in ignore_dirs]
         if subdir == str(topdir):
@@ -174,6 +179,26 @@ def add_package_files(
                 continue
 
             filename = str(filepath.relative_to(topdir))
+
+            # Apply file filtering if enabled
+            if spdx_file_filter == "essential":
+                file_upper = file.upper()
+                filename_lower = filename.lower()
+
+                # Skip if matches exclude patterns
+                skip_file = any(pattern in filename_lower for pattern in exclude_patterns)
+                if skip_file:
+                    continue
+
+                # Keep only essential files (license/readme/etc)
+                is_essential = any(pattern in file_upper for pattern in essential_patterns)
+                if not is_essential:
+                    continue
+            elif spdx_file_filter == "none":
+                # Skip all files
+                continue
+            # else: spdx_file_filter == "all" or any other value - include all files
+
             file_purposes = get_purposes(filepath)
 
             # Check if file is compiled
@@ -219,6 +244,8 @@ def add_package_files(
 def get_package_sources_from_debug(
     d, package, package_files, sources, source_hash_cache
 ):
+    spdx_file_filter = (d.getVar("SPDX_FILE_FILTER") or "all").lower()
+
     def file_path_match(file_path, pkg_file):
         if file_path.lstrip("/") == pkg_file.name.lstrip("/"):
             return True
@@ -251,10 +278,19 @@ def get_package_sources_from_debug(
             continue
 
         if not any(file_path_match(file_path, pkg_file) for pkg_file in package_files):
-            bb.fatal(
-                "No package file found for %s in %s; SPDX found: %s"
-                % (str(file_path), package, " ".join(p.name for p in package_files))
-            )
+            # When file filtering is active, some files may be filtered out
+            # Skip debug source lookup instead of failing
+            if spdx_file_filter in ("none", "essential"):
+                bb.debug(
+                    1,
+                    f"Skipping debug source lookup for {file_path} in {package} (filtered by SPDX_FILE_FILTER={spdx_file_filter})",
+                )
+                continue
+            else:
+                bb.fatal(
+                    "No package file found for %s in %s; SPDX found: %s"
+                    % (str(file_path), package, " ".join(p.name for p in package_files))
+                )
             continue
 
         for debugsrc in file_data["debugsrc"]:
-- 
2.53.0


