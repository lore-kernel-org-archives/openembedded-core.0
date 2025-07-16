Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66B3C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 09:05:24 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.17899.1752656723916478146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 02:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WK11v29j;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: kamel.bouhara@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8FB842E77;
	Wed, 16 Jul 2025 09:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752656721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c49cctYaui/o/+zUDgB0xdHt42YMdeB8IskmdbjNF+w=;
	b=WK11v29jiyyV20apbJvAxy4pVXrllsKfMHzMz+Z299bDU78otj0cUBiWOxzKtfOISPj0Q3
	fCoaJgsX4J4Lhvz4G+USH7wGJz/6Sdl+YIGnRF0SsRXQhywkcaCcUaKherPOUd4RB/jRXG
	1K/JszkIvsGxAfZoIBJ0hkB3Q2FIvsJfy2USyiz4/c37Se7kC9S9r87Rss8B7Jtl67l2Ds
	eAvAsQtV5cI5f1whSY4eEtJrJWK1G5yDwfynIruNfUFk6+TEgpEekmudJKl85hIkSQUkzb
	yGVUosPGAvsl1vqxeuNtP6AmtHtsBsR0T0gu6Ft9UWoIwynW6LA6AAIu7sUg0Q==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH 1/1] spdx3: Add optional kernel configuration export to build_parameter for virtual/kernel
Date: Wed, 16 Jul 2025 11:05:17 +0200
Message-ID: <20250716090517.481832-2-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250716090517.481832-1-kamel.bouhara@bootlin.com>
References: <20250716090517.481832-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehjeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfgrmhgvlhcuuehouhhhrghrrgcuoehkrghmvghlrdgsohhuhhgrrhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfhieeltdetuedvvdeuvdetfeeuuddvkeeltdeuheevfeehteekvedvledtfeenucfkphepkeekrdduiedtrddvvddvrddvvdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkeekrdduiedtrddvvddvrddvvdelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehkrghmvghlrdgsohhuhhgrrhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheplffrgfghhhgrtghkvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnr
 dhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkrghmvghlrdgsohhuhhgrrhgrsegsohhothhlihhnrdgtohhm
X-GND-Sasl: kamel.bouhara@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 09:05:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220439

Enhances SPDX Document by extracting kernel build-time configuration settings from '${B}/.config'.

Each CONFIG_* line is parsed and exported as a DictionaryEntry in the build_Build.build_parameter
section of the SPDX document. This provides better visibility into kernel build behavior and
configuration, in alignment with the SPDX3 metadata model.

The feature is gated by a new tunable variable:

    SPDX_INCLUDE_KERNEL_CONFIG (default: "1")

Setting this to "0" disables exporting the kernel configuration, which may be useful to improve
performance or reduce the size of generated SPDX documents.

Example:

    CONFIG_FOO=y  →  { key: "CONFIG_FOO", value: "y" }

This complements existing metadata export features and enables a more complete audit trail of how
the kernel is built within a given build.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 meta/classes/create-spdx-3.0.bbclass |  6 ++++++
 meta/lib/oe/spdx30_tasks.py          | 32 ++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index c0a5436ad6..cdb9422f37 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -50,6 +50,12 @@ SPDX_INCLUDE_TIMESTAMPS[doc] = "Include time stamps in SPDX output. This is \
     useful if you want to know when artifacts were produced and when builds \
     occurred, but will result in non-reproducible SPDX output"
 
+SPDX_INCLUDE_KERNEL_CONFIG ??= "1"
+SPDX_INCLUDE_KERNEL_CONFIG[doc] = "If set to '1', the .config file for the kernel will be parsed \
+and each CONFIG_* value will be included in the Build.build_parameter list as DictionaryEntry \
+items. Set to '0' to disable exporting kernel configuration to improve performance or reduce \
+SPDX document size."
+
 SPDX_IMPORTS ??= ""
 SPDX_IMPORTS[doc] = "SPDX_IMPORTS is the base variable that describes how to \
     reference external SPDX ids. Each import is defined as a key in this \
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index c352dab152..f87d079cb0 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -18,6 +18,28 @@ from contextlib import contextmanager
 from datetime import datetime, timezone
 from pathlib import Path
 
+def parse_kernel_config(config_path):
+    entries = []
+    if not os.path.exists(config_path):
+        bb.warn(f"Kernel config file not found at: {config_path}")
+        return entries
+
+    try:
+        with open(config_path, 'r') as f:
+            for line in f:
+                line = line.strip()
+                if not line or line.startswith("#"):
+                    continue
+                if "=" in line:
+                    key, value = line.split("=", 1)
+                    entries.append(oe.spdx30.DictionaryEntry(
+                        key=key,
+                        value=value.strip('"')
+                    ))
+        bb.note(f"Parsed {len(entries)} kernel config entries from {config_path}")
+    except Exception as e:
+        bb.error(f"Failed to parse kernel config file: {e}")
+    return entries
 
 def walk_error(err):
     bb.error(f"ERROR walking {err.filename}: {err}")
@@ -495,6 +517,8 @@ def create_spdx(d):
 
     build_objset.doc.rootElement.append(build)
 
+    build.build_parameter = []
+
     build_objset.set_is_native(is_native)
 
     for var in (d.getVar("SPDX_CUSTOM_ANNOTATION_VARS") or "").split():
@@ -815,6 +839,14 @@ def create_spdx(d):
             sorted(list(build_inputs)) + sorted(list(debug_source_ids)),
         )
 
+    if d.getVar("SPDX_INCLUDE_KERNEL_CONFIG", True) != "0":
+        if "virtual/kernel" in (d.getVar("PROVIDES") or "").split():
+            bb.note("Detected virtual/kernel provider, extracting kernel configuration")
+            config_path = d.expand("${B}/.config")
+            kernel_params = parse_kernel_config(config_path)
+            if kernel_params:
+                build.build_parameter.extend(kernel_params)
+
     oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "recipes", deploydir)
 
 
-- 
2.43.0


