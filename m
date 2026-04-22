Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487ECF9B611
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 10:36:48 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79502.1776854199040301261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 03:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=alVsMt4M;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776854199; x=1808390199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UQjyOe21v3cjJP6P31JPgAUqrsKb+A0jJa95vAbNQM4=;
  b=alVsMt4MQ3nb8BCU5SsLgXfenjS+oAu53Qc7fLsyGKmV0MmZqV11uqRP
   3WwCB8051SM2eSkiOBlm4yZP5PVJXGW/6VTWgjal4+MSM+cMkFDgdtPZH
   PtFqTzYhwJF5AGmfQENvuT7N2OI4GoNni+fUN5ES5rxLZh2zone3wqcoQ
   7WREKb3Fhvf2QPZfj0sKKSYvYeycdJeiHbg6rEslUNrHsMWj7/PcVe5Oy
   cqGpEtISh8zAQWBJ4Qg8Iga/bB7fo9ct1vXMgC8KUKEPuD66QNJGfygRl
   qTVJTgkJhdmA08vaAh4XlnoRIOigKubJDPn9QUyURVZ/Dx6aLWYzmlXDp
   Q==;
X-CSE-ConnectionGUID: lNv3a9RPSQS/HNNCt2v2kQ==
X-CSE-MsgGUID: FHrYrUzxRiymCKhT/MMGDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="238541555"
X-IronPort-AV: E=Sophos;i="6.23,192,1770562800"; 
   d="scan'208";a="238541555"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 19:36:37 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5CC388203C4
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 10:36:37 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 10562C000BE
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 10:36:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 85E671017338;
	Wed, 22 Apr 2026 10:36:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] u-boot: upgrade 2026.01 -> 2026.04
Date: Wed, 22 Apr 2026 18:36:26 +0800
Message-ID: <20260422103626.817-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260422103626.817-1-wangmy@fujitsu.com>
References: <20260422103626.817-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 10:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235712

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2026-33243.patch
removed since it's included 2026.04

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../u-boot/files/CVE-2026-33243.patch         | 374 ------------------
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   2 +-
 ...ols_2026.01.bb => u-boot-tools_2026.04.bb} |   0
 .../{u-boot_2026.01.bb => u-boot_2026.04.bb}  |   2 -
 4 files changed, 1 insertion(+), 377 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-33243.patch
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2026.01.bb => u-boot-tools_2026.04.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2026.01.bb => u-boot_2026.04.bb} (95%)

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2026-33243.patch b/meta/recipes-bsp/u-boot/files/CVE-2026-33243.patch
deleted file mode 100644
index c7086e183f..0000000000
--- a/meta/recipes-bsp/u-boot/files/CVE-2026-33243.patch
+++ /dev/null
@@ -1,374 +0,0 @@
-From 1e0e1520761a62488d10b486f6e5df0ccb82a74a Mon Sep 17 00:00:00 2001
-From: Simon Glass <simon.glass@canonical.com>
-Date: Thu, 5 Mar 2026 18:20:09 -0700
-Subject: [PATCH] boot: Add fit_config_get_hash_list() to build signed node
- list
-
-The hashed-nodes property in a FIT signature node lists which FDT paths
-are included in the signature hash. It is intended as a hint so should
-not be used for verification.
-
-Add a function to build the node list from scratch by iterating the
-configuration's image references. Skip properties known not to be image
-references. For each image, collect the path plus all hash and cipher
-subnodes.
-
-Use the new function in fit_config_check_sig() instead of reading
-'hashed-nodes'.
-
-Update the test_vboot kernel@ test case: fit_check_sign now catches the
-attack at signature-verification time (the @-suffixed node is hashed
-instead of the real one, causing a mismatch) rather than at
-fit_check_format() time.
-
-Update the docs to cover this. The FIT spec can be updated separately.
-
-Signed-off-by: Simon Glass <simon.glass@canonical.com>
-Closes: https://lore.kernel.org/u-boot/20260302220937.3682128-1-trini@konsulko.com/
-Reported-by: Apple Security Engineering and Architecture (SEAR)
-Tested-by: Tom Rini <trini@konsulko.com>
-
-[YB: Removed a skippable condition in fit_config_get_hash_list.
-	This flag is not available in this version]
-CVE: CVE-2026-33243
-Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/2092322b31cc8b1f8c9e2e238d1043ae0637b241]
-Signed-off-by: Yanis Binard <yanis.binard@smile.fr>
----
- boot/image-fit-sig.c        | 226 +++++++++++++++++++++++++++++-------
- doc/usage/fit/signature.rst |  19 ++-
- test/py/tests/test_vboot.py |   8 +-
- 3 files changed, 200 insertions(+), 53 deletions(-)
-
-diff --git a/boot/image-fit-sig.c b/boot/image-fit-sig.c
-index f23e9d5d0b0..d13df7d6153 100644
---- a/boot/image-fit-sig.c
-+++ b/boot/image-fit-sig.c
-@@ -18,6 +18,7 @@ DECLARE_GLOBAL_DATA_PTR;
- #include <u-boot/hash-checksum.h>
- 
- #define IMAGE_MAX_HASHED_NODES		100
-+#define FIT_MAX_HASH_PATH_BUF		4096
- 
- /**
-  * fit_region_make_list() - Make a list of image regions
-@@ -229,6 +230,178 @@ int fit_image_verify_required_sigs(const void *fit, int image_noffset,
- 	return 0;
- }
- 
-+/**
-+ * fit_config_add_hash() - Add hash nodes for one image to the node list
-+ *
-+ * Adds the image path, all its hash-* subnode paths, and its cipher
-+ * subnode path (if present) to the packed buffer.
-+ *
-+ * @fit:		FIT blob
-+ * @image_noffset:	Image node offset (e.g. /images/kernel-1)
-+ * @node_inc:		Array of path pointers to fill
-+ * @count:		Pointer to current count (updated on return)
-+ * @max_nodes:		Maximum entries in @node_inc
-+ * @buf:		Buffer for packed path strings
-+ * @buf_used:		Pointer to bytes used in @buf (updated on return)
-+ * @buf_len:		Total size of @buf
-+ * Return: 0 on success, -ve on error
-+ */
-+static int fit_config_add_hash(const void *fit, int image_noffset,
-+			       char **node_inc, int *count, int max_nodes,
-+			       char *buf, int *buf_used, int buf_len)
-+{
-+	int noffset, hash_count, ret, len;
-+
-+	if (*count >= max_nodes)
-+		return -ENOSPC;
-+
-+	ret = fdt_get_path(fit, image_noffset, buf + *buf_used,
-+			   buf_len - *buf_used);
-+	if (ret < 0)
-+		return -ENOENT;
-+	len = strlen(buf + *buf_used) + 1;
-+	node_inc[(*count)++] = buf + *buf_used;
-+	*buf_used += len;
-+
-+	/* Add all this image's hash subnodes */
-+	hash_count = 0;
-+	for (noffset = fdt_first_subnode(fit, image_noffset);
-+	     noffset >= 0;
-+	     noffset = fdt_next_subnode(fit, noffset)) {
-+		const char *name = fit_get_name(fit, noffset, NULL);
-+
-+		if (strncmp(name, FIT_HASH_NODENAME,
-+			    strlen(FIT_HASH_NODENAME)))
-+			continue;
-+		if (*count >= max_nodes)
-+			return -ENOSPC;
-+		ret = fdt_get_path(fit, noffset, buf + *buf_used,
-+				   buf_len - *buf_used);
-+		if (ret < 0)
-+			return -ENOENT;
-+		len = strlen(buf + *buf_used) + 1;
-+		node_inc[(*count)++] = buf + *buf_used;
-+		*buf_used += len;
-+		hash_count++;
-+	}
-+
-+	if (!hash_count) {
-+		printf("No hash nodes in image '%s'\n",
-+		       fdt_get_name(fit, image_noffset, NULL));
-+		return -ENOMSG;
-+	}
-+
-+	/* Add this image's cipher node if present */
-+	noffset = fdt_subnode_offset(fit, image_noffset, FIT_CIPHER_NODENAME);
-+	if (noffset != -FDT_ERR_NOTFOUND) {
-+		if (noffset < 0)
-+			return -EIO;
-+		if (*count >= max_nodes)
-+			return -ENOSPC;
-+		ret = fdt_get_path(fit, noffset, buf + *buf_used,
-+				   buf_len - *buf_used);
-+		if (ret < 0)
-+			return -ENOENT;
-+		len = strlen(buf + *buf_used) + 1;
-+		node_inc[(*count)++] = buf + *buf_used;
-+		*buf_used += len;
-+	}
-+
-+	return 0;
-+}
-+
-+/**
-+ * fit_config_get_hash_list() - Build the list of nodes to hash
-+ *
-+ * Works through every image referenced by the configuration and collects the
-+ * node paths: root + config + all referenced images with their hash and
-+ * cipher subnodes.
-+ *
-+ * Properties known not to be image references (description, compatible,
-+ * default, load-only) are skipped, so any new image type is covered by default.
-+ *
-+ * @fit:	FIT blob
-+ * @conf_noffset: Configuration node offset
-+ * @node_inc:	Array to fill with path string pointers
-+ * @max_nodes:	Size of @node_inc array
-+ * @buf:	Buffer for packed null-terminated path strings
-+ * @buf_len:	Size of @buf
-+ * Return: number of entries in @node_inc, or -ve on error
-+ */
-+static int fit_config_get_hash_list(const void *fit, int conf_noffset,
-+				    char **node_inc, int max_nodes,
-+				    char *buf, int buf_len)
-+{
-+	const char *conf_name;
-+	int image_count;
-+	int prop_offset;
-+	int used = 0;
-+	int count = 0;
-+	int ret, len;
-+
-+	conf_name = fit_get_name(fit, conf_noffset, NULL);
-+
-+	/* Always include the root node and the configuration node */
-+	if (max_nodes < 2)
-+		return -ENOSPC;
-+
-+	len = 2;  /* "/" + nul */
-+	if (len > buf_len)
-+		return -ENOSPC;
-+	strcpy(buf, "/");
-+	node_inc[count++] = buf;
-+	used += len;
-+
-+	len = snprintf(buf + used, buf_len - used, "%s/%s", FIT_CONFS_PATH,
-+		       conf_name) + 1;
-+	if (used + len > buf_len)
-+		return -ENOSPC;
-+	node_inc[count++] = buf + used;
-+	used += len;
-+
-+	/* Process each image referenced by the config */
-+	image_count = 0;
-+	fdt_for_each_property_offset(prop_offset, fit, conf_noffset) {
-+		const char *prop_name;
-+		int img_count, i;
-+
-+		fdt_getprop_by_offset(fit, prop_offset, &prop_name, NULL);
-+		if (!prop_name)
-+			continue;
-+
-+		/* Skip properties that are not image references */
-+		if (!strcmp(prop_name, FIT_DESC_PROP) ||
-+		    !strcmp(prop_name, FIT_DEFAULT_PROP))
-+			continue;
-+
-+		img_count = fdt_stringlist_count(fit, conf_noffset, prop_name);
-+		for (i = 0; i < img_count; i++) {
-+			int noffset;
-+
-+			noffset = fit_conf_get_prop_node_index(fit,
-+							       conf_noffset,
-+							       prop_name, i);
-+			if (noffset < 0)
-+				continue;
-+
-+			ret = fit_config_add_hash(fit, noffset, node_inc,
-+						  &count, max_nodes, buf, &used,
-+						  buf_len);
-+			if (ret < 0)
-+				return ret;
-+
-+			image_count++;
-+		}
-+	}
-+
-+	if (!image_count) {
-+		printf("No images in config '%s'\n", conf_name);
-+		return -ENOMSG;
-+	}
-+
-+	return count;
-+}
-+
- /**
-  * fit_config_check_sig() - Check the signature of a config
-  *
-@@ -269,20 +442,16 @@ static int fit_config_check_sig(const void *fit, int noffset, int conf_noffset,
- 		FIT_DATA_POSITION_PROP,
- 		FIT_DATA_OFFSET_PROP,
- 	};
--
--	const char *prop, *end, *name;
-+	char *node_inc[IMAGE_MAX_HASHED_NODES];
-+	char hash_buf[FIT_MAX_HASH_PATH_BUF];
- 	struct image_sign_info info;
- 	const uint32_t *strings;
--	const char *config_name;
- 	uint8_t *fit_value;
- 	int fit_value_len;
--	bool found_config;
- 	int max_regions;
--	int i, prop_len;
- 	char path[200];
- 	int count;
- 
--	config_name = fit_get_name(fit, conf_noffset, NULL);
- 	debug("%s: fdt=%p, conf='%s', sig='%s'\n", __func__, key_blob,
- 	      fit_get_name(fit, noffset, NULL),
- 	      fit_get_name(key_blob, required_keynode, NULL));
-@@ -297,45 +466,12 @@ static int fit_config_check_sig(const void *fit, int noffset, int conf_noffset,
- 		return -1;
- 	}
- 
--	/* Count the number of strings in the property */
--	prop = fdt_getprop(fit, noffset, "hashed-nodes", &prop_len);
--	end = prop ? prop + prop_len : prop;
--	for (name = prop, count = 0; name < end; name++)
--		if (!*name)
--			count++;
--	if (!count) {
--		*err_msgp = "Can't get hashed-nodes property";
--		return -1;
--	}
--
--	if (prop && prop_len > 0 && prop[prop_len - 1] != '\0') {
--		*err_msgp = "hashed-nodes property must be null-terminated";
--		return -1;
--	}
--
--	/* Add a sanity check here since we are using the stack */
--	if (count > IMAGE_MAX_HASHED_NODES) {
--		*err_msgp = "Number of hashed nodes exceeds maximum";
--		return -1;
--	}
--
--	/* Create a list of node names from those strings */
--	char *node_inc[count];
--
--	debug("Hash nodes (%d):\n", count);
--	found_config = false;
--	for (name = prop, i = 0; name < end; name += strlen(name) + 1, i++) {
--		debug("   '%s'\n", name);
--		node_inc[i] = (char *)name;
--		if (!strncmp(FIT_CONFS_PATH, name, strlen(FIT_CONFS_PATH)) &&
--		    name[sizeof(FIT_CONFS_PATH) - 1] == '/' &&
--		    !strcmp(name + sizeof(FIT_CONFS_PATH), config_name)) {
--			debug("      (found config node %s)", config_name);
--			found_config = true;
--		}
--	}
--	if (!found_config) {
--		*err_msgp = "Selected config not in hashed nodes";
-+	/* Build the node list from the config, ignoring hashed-nodes */
-+	count = fit_config_get_hash_list(fit, conf_noffset,
-+					 node_inc, IMAGE_MAX_HASHED_NODES,
-+					 hash_buf, sizeof(hash_buf));
-+	if (count < 0) {
-+		*err_msgp = "Failed to build hash node list";
- 		return -1;
- 	}
- 
-diff --git a/doc/usage/fit/signature.rst b/doc/usage/fit/signature.rst
-index e5b5a8432e9..da08cc75c3a 100644
---- a/doc/usage/fit/signature.rst
-+++ b/doc/usage/fit/signature.rst
-@@ -353,20 +353,27 @@ meantime.
- Details
- -------
- The signature node contains a property ('hashed-nodes') which lists all the
--nodes that the signature was made over.  The image is walked in order and each
--tag processed as follows:
-+nodes that the signature was made over.  The signer (mkimage) writes this
-+property as a record of what was included in the hash.  During verification,
-+however, U-Boot does not read 'hashed-nodes'. Instead it rebuilds the node
-+list from the configuration's own image references (kernel, fdt, ramdisk,
-+etc.), since 'hashed-nodes' is not itself covered by the signature. The
-+rebuilt list always includes the root node, the configuration node, each
-+referenced image node and its hash/cipher subnodes.
-+
-+The image is walked in order and each tag processed as follows:
- 
- DTB_BEGIN_NODE
-     The tag and the following name are included in the signature
--    if the node or its parent are present in 'hashed-nodes'
-+    if the node or its parent are present in the node list
- 
- DTB_END_NODE
-     The tag is included in the signature if the node or its parent
--    are present in 'hashed-nodes'
-+    are present in the node list
- 
- DTB_PROPERTY
-     The tag, the length word, the offset in the string table, and
--    the data are all included if the current node is present in 'hashed-nodes'
-+    the data are all included if the current node is present in the node list
-     and the property name is not 'data'.
- 
- DTB_END
-@@ -374,7 +381,7 @@ DTB_END
- 
- DTB_NOP
-     The tag is included in the signature if the current node is present
--    in 'hashed-nodes'
-+    in the node list
- 
- In addition, the signature contains a property 'hashed-strings' which contains
- the offset and length in the string table of the strings that are to be
-diff --git a/test/py/tests/test_vboot.py b/test/py/tests/test_vboot.py
-index 7a7f9c379de..19f3f981379 100644
---- a/test/py/tests/test_vboot.py
-+++ b/test/py/tests/test_vboot.py
-@@ -362,10 +362,14 @@ def test_vboot(ubman, name, sha_algo, padding, sign_options, required,
-             shutil.copyfile(fit, efit)
-             vboot_evil.add_evil_node(fit, efit, evil_kernel, 'kernel@')
- 
--            msg = 'Signature checking prevents use of unit addresses (@) in nodes'
-+            # fit_check_sign catches this via signature mismatch (the @
-+            # node is hashed instead of the real one)
-             utils.run_and_log_expect_exception(
-                 ubman, [fit_check_sign, '-f', efit, '-k', dtb],
--                1, msg)
-+                1, 'Failed to verify required signature')
-+
-+            # bootm catches it earlier, at fit_check_format() time
-+            msg = 'Signature checking prevents use of unit addresses (@) in nodes'
-             run_bootm(sha_algo, 'evil kernel@', msg, False, efit)
- 
-         # Create a new properly signed fit and replace header bytes
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 5e2ec08c30..574768b9f8 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3"
+SRCREV = "88dc2788777babfd6322fa655df549a019aa1e69"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot_2026.04.bb
similarity index 95%
rename from meta/recipes-bsp/u-boot/u-boot_2026.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2026.04.bb
index ac1b0b9b2b..5259fd5832 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2026.04.bb
@@ -3,8 +3,6 @@ require u-boot.inc
 
 DEPENDS += "bc-native dtc-native gnutls-native python3-pyelftools-native"
 
-SRC_URI += "file://CVE-2026-33243.patch"
-
 # workarounds for aarch64 kvm qemu boot regressions
 SRC_URI:append:qemuarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
 SRC_URI:append:genericarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
-- 
2.43.0


