Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0D7CFD35F
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 21:51:14 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3274.1764021067511584579
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Nov 2025 13:51:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M7VQUsIz;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477a219db05so28871335e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 13:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764021066; x=1764625866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H6aAFGeQfonUQz+DsAEgbFm5QMqIijMk7J6BB8dE8DM=;
        b=M7VQUsIz3cMI9twMldhynNZnzuBbPP/ZWBR28o+vLHuyjxXle2ABSzUi629x7oseoH
         jH4aI13bp1SBWdCdMkjavTCIqlIyfN4BG9UATXLbgYLl/lorMl7XrcxcsejMYcAUGTwI
         ZkJBALCjXu04cEb8ggOr4YStBniSb/Oz14bGZqw9We3piOkegfs62ulAx5FJVy6m7oTm
         3oWA6SH6mD5kT8X1U+9N4UoC3BU8XbCi0JgcTwURwL4fDSvj2nqZMr4L99GVuecotels
         Z/TgV4SPrdTYsBbasuEs9bOQrDwgctBl2JOCRWDjfz6oQO2GCatJw4crckKsa+Ivu1Ss
         0S2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764021066; x=1764625866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6aAFGeQfonUQz+DsAEgbFm5QMqIijMk7J6BB8dE8DM=;
        b=NY/eWeVv925ntGHQRG4et3bu9lTod0NYK8j52qRuNIB/EhJzhfbT8CyGZCuTV4PbM8
         R7neQELecUJ6lroFJ6WbHg/6UlARWh+CPeXCC+bsdT/V8ijs80yFF1O5CBMBaoOYDcHC
         DRHpRY3pploF0eqcgnUdSsfZyGnUHJN4+f9m7jSHJh+Aw7ZQd38x7GNbOZiwmNnDUsrq
         1LMQuCIgA9r1CfV7HmDatjM8Cm/rw8i0qCWQMCa1fioSLQQcA9cOhbYU3irkilIcmNaF
         V5CH/5AqdabzJ21iO3P2yE4wQz6Y5rYNxcBxnzwpQH13kZyu7FslDfORUIu/JsWPYCwT
         Hw7g==
X-Gm-Message-State: AOJu0YzcjNNGx75GsiBKmHL172DHnnVofo1s+rlV5EqmN8ZPkUFbtaAs
	SlGURYYmruL8Yg7Y3gcknzv0NHuSyzzqCnQnvFUJmGUfoKTHJ+UaoqD5YYncs0GdSRI=
X-Gm-Gg: ASbGncuFLvMD8gaCyT9bmG6WjIt0soPC0sTU3sXBvNpmbMb8CVVjmFHhYeT5CS6fwiE
	0HvdSzxAkABSW3VJu9Y13TNYwLtjujD9XZUvPvrmNA9fh4uR8Z1PJ3k4EUh5AEcb44fKCnj1uxo
	a3L/AePZAaaQSyx1EUy95g+LCINCbt0ivGRsI53SMJy9jG4CI/rnq1QRnm3iaU/s36rAqQ5pRJq
	dFCG7YqTOCagLDNwQ546vsdecbMc/KPydU9ro/d03HO9xAnjdxiQbTjrEaqvHaC8GF75pECrcX5
	OqOR8qfJx9L9Ef1WjSXkUYd8Lt/BHwz/43JpcQnqqIafcafqgQ24Et6TUx6UZ+iAW+MQYHjGSK+
	+QKevoFYLr7dCWVoVtHh8PCEpNDpqk+nu58u7oOZ0QvYDIgU/EH+tTb6LcowEbS8JwjcXtYhvpa
	ddC65rjMWbHyngB8vGeZiYUjs=
X-Google-Smtp-Source: AGHT+IECYqCEcsqYQEbhM5mdtPqGJS8UCrwLH3uhyFQlJzo//nKDtBbD92Pde43scSeKhoZyzyR3/g==
X-Received: by 2002:a05:600c:198e:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-477c1133927mr135537195e9.32.1764021065376;
        Mon, 24 Nov 2025 13:51:05 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477bf216ddasm212339765e9.0.2025.11.24.13.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 13:51:04 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: antonin.godard@bootlin.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	stefano.tondo.ext@siemens.com
Subject: [OE-core][PATCH v3] documentation: Add comprehensive SPDX variable documentation
Date: Mon, 24 Nov 2025 22:50:58 +0100
Message-ID: <20251124215058.1468645-1-stondo@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 21:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226747

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add comprehensive documentation for SPDX-related variables in the
Yocto reference manual. This includes documenting previously
undocumented variables and updating existing documentation with
SPDX 3.0.1 specific information.

New variables documented:
- SPDX_LICENSES: Path to SPDX license identifier mapping file
- SPDX_MULTILIB_SSTATE_ARCHS: Architecture list for dependency collection
- SPDX_UUID_NAMESPACE: Namespace for UUID generation in SPDX documents

Updated existing variables with SPDX 3.0.1 data:
- SPDX_INCLUDE_SOURCES: Documented distributed architecture behavior
- SPDX_INCLUDE_COMPILED_SOURCES: Updated with SPDX 3.0.1 format information

Testing on core-image-minimal for qemux86-64 with SPDX 3.0.1 shows that
the rootfs SBOM file is approximately 5-6 MB regardless of source inclusion
settings. This is due to SPDX 3.0.1's distributed architecture where
per-package SPDX documents are stored in tmp/deploy/spdx/ (~130 MB),
while the rootfs SBOM contains only relationships and references.

Note: SPDX 3.0.1 JSON files are not compressed by default,
unlike the tar.zst compression used in SPDX 2.2. Manual compression
with zstd typically achieves 94-97% file size reduction.

These variables are defined in meta/classes/spdx-common.bbclass.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---

Changes in v3:
- Fixed terminology: Changed "JSON-LD" to "JSON" throughout for clarity
- Removed untested SPDX_INCLUDE_COMPILED_SOURCES size claims for SPDX 3.0.1
- Converted note paragraphs to proper RST ".. note::" blocks
- Added concrete compression instructions with zstd command
- Replaced hardcoded variable values with generic descriptions
- Added compression ratio data (94-97% reduction with zstd)
- Linked SPDX_LICENSES to upstream SPDX license-list-data repository

Changes in v2:
- Fixed unintended removal of non-SPDX variables (CCACHE_DISABLE,
  IMAGE_EXTRA_PARTITION_FILES, REQUIRED_*_FEATURES)
- Fixed unintended change to LAYERDEPENDS description
- Only SPDX-related variables are now modified

 documentation/ref-manual/variables.rst | 77 ++++++++++++++++++++++----
 1 file changed, 67 insertions(+), 10 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index a80ef364e..f2c8a1d9a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8962,10 +8962,18 @@ system and gives an overview of their function and contents.
 
           SPDX_INCLUDE_COMPILED_SOURCES = "1"
 
-      According to our tests, building ``core-image-minimal`` for the
-      ``qemux86-64`` machine, enabling this option compared with the
-      :term:`SPDX_INCLUDE_SOURCES` reduces the size of the  ``tmp/deploy/spdx``
-      directory from 2GB to 1.6GB.
+      According to our tests on release 4.1 "langdale", building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling this
+      option compared with the :term:`SPDX_INCLUDE_SOURCES` reduced the size
+      of the ``tmp/deploy/spdx`` directory from 2GB to 1.6GB.
+
+      .. note::
+
+         The above measurements are for SPDX 2.2 format. Size characteristics
+         may differ with SPDX 3.0.1 JSON format. The key benefit of this option
+         is including only compiled files (object files, binaries) rather than
+         all source code, which reduces the amount of data while still providing
+         information about build artifacts.
 
    :term:`SPDX_INCLUDE_SOURCES`
       This option allows to add a description of the source files used to build
@@ -8979,8 +8987,8 @@ system and gives an overview of their function and contents.
 
           SPDX_INCLUDE_SOURCES = "1"
 
-      According to our tests on release 4.1 "langdale", building
-      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
+      According to our tests on release 4.1 "langdale" (SPDX 2.2 format),
+      building ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
       this option multiplied the total size of the ``tmp/deploy/spdx``
       directory by a factor of 3  (+291 MiB for this image),
       and the size of the ``IMAGE-MACHINE.spdx.tar.zst`` in
@@ -8988,6 +8996,55 @@ system and gives an overview of their function and contents.
       image), compared to just using the :ref:`ref-classes-create-spdx` class
       with no option.
 
+      With SPDX 3.0.1 JSON format, the uncompressed rootfs SBOM file
+      (``core-image-minimal-qemux86-64.rootfs.spdx.json``) is approximately
+      **5-6 MB regardless of source inclusion settings**. Unlike SPDX 2.2,
+      the SPDX 3.0.1 implementation uses a distributed architecture where
+      per-package SPDX documents are stored in ``tmp/deploy/spdx/`` 
+      (~130 MB for core-image-minimal), while the rootfs SBOM contains
+      only relationships and references to these package documents.
+
+      .. note::
+
+         SPDX 3.0.1 JSON files are not compressed by default, unlike the
+         tar.zst format used in SPDX 2.2. To reduce file size, compress the
+         files manually using ``zstd``::
+
+            zstd core-image-minimal-qemux86-64.rootfs.spdx.json
+
+         This typically reduces file size by 94-97%. For example, a 5.4 MB
+         SBOM compresses to ~350 KB.
+
+   :term:`SPDX_LICENSES`
+      Path to the JSON file containing SPDX license identifier mappings. This
+      file maps common license names to official SPDX license identifiers used
+      during SBOM generation.
+
+      The default value points to a copy of the license mappings defined by
+      SPDX (https://github.com/spdx/license-list-data) stored in
+      :term:`OpenEmbedded-Core (OE-Core)`.
+
+      For additional information, see the :term:`LICENSE` and
+      :term:`SPDXLICENSEMAP` variables.
+
+   :term:`SPDX_MULTILIB_SSTATE_ARCHS`
+      The list of sstate architectures to consider when collecting SPDX
+      dependencies. This includes multilib architectures when multilib is
+      enabled.
+
+      The default value is set to :term:`SSTATE_ARCHS`, which automatically
+      includes all relevant architectures for the current build configuration.
+
+      This variable is used internally by the SPDX generation process and
+      typically does not need to be modified.
+
+   :term:`SPDX_UUID_NAMESPACE`
+      The namespace used for generating UUIDs in SPDX documents. This should
+      be a domain name or unique identifier for your organization to ensure
+      globally unique SPDX IDs.
+
+      The default value is set to the OpenEmbedded project namespace. If you
+      are generating SBOMs for your own organization, set this to your own
+      domain name (e.g., ``SPDX_UUID_NAMESPACE = "sbom.example.com"``).
+
    :term:`SPDX_NAMESPACE_PREFIX`
       This variable allows to set a custom namespace prefix in the SPDX
       output. The default is "http://spdx.org/spdxdocs".
-- 
2.51.1

