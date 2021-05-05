Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web08.9820.1620227942124264055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lxywhVIh;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id u21so3414258ejo.13
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XN1L4gE7m0OYEm/clCqQMfFSZx6wp/1HFvVUXM0QojM=;
        b=lxywhVIh2Ktk/ymReq6/nv4pkyRlyAhJqyes+yVSnsimSwGMt+mMYULoooDuIlqrbw
         IwkH/yyfT1IDUVf4MjJbY3tid0GZ9v3h9kUfFtzpkEhrKQhc1+5ija0Vx6Lf5CMg8xvw
         fq/G3u/bCXnRQ6oQjj1OKM5aa6ERciz5LX9ezFEWyzwcnPZ4hB6iwES942AbJuMkTctN
         4qhObs5cTHwfpC+lCRNU3JULKVnd2gF1qaXP6exjxsybR6mP/mXZyAmm7NCGA2wWhRd+
         244kdnffNyN6CD8/2+xHW4jNjA9MGBH01Z6vza2Bq7ifk/8C70ZWugbSoEpbEA0CLO4M
         axQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XN1L4gE7m0OYEm/clCqQMfFSZx6wp/1HFvVUXM0QojM=;
        b=q5mE2LxVhN2OR1VKPkp+4jgk/xhB3MxdvJVL+AFx/OH5NWoMpCGw4Gt8p5kkyIY1L+
         m2oNBn8zYpfxo5E3E7YdvYcZeOjquJJHbdgJ6Py6EQVtHOLwV785ZN9hXtxltP1UYW5Z
         +UVl8mp+ObpcRdjvhf+ne2q0DRCTEhMElg1D0YsNyMo7/Q1HeKO6B7RSxEAYwtY+5JbX
         GwxYr5mv7f13CGSHb3bYnSGXIRJUaJtQrAr1Dhng4JdaA+PaTJ1JtzjCkkwNfP3Xjb+l
         XO8jZmjsqExjOTg9FX0wAr/ztXuNNPzv/5ro46eVvvUp2TkLfrzAXRuguhf3I7IVIC5x
         yUkQ==
X-Gm-Message-State: AOAM530oxcuiU91QOYPyPI7z1oqNOihNm9vsWnhHvXTIOpnF9KUBVzRj
	HSEG31eSEyznQr8miuto2Nw2XhXYWcTaFw==
X-Google-Smtp-Source: ABdhPJy5uZKa2QAYTfF/Wc11niAQUm79m+EB+C80MsTf6NlJXxCprBa+qYL9c1tyB/we3h6lV14w4w==
X-Received: by 2002:a17:906:6d57:: with SMTP id a23mr26768042ejt.197.1620227940295;
        Wed, 05 May 2021 08:19:00 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:18:59 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/61] u-boot: upgrade 2021.01 -> 2021.04
Date: Wed,  5 May 2021 17:17:54 +0200
Message-Id: <20210505151850.660512-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../files/0001-add-valid-fdt-check.patch      |  36 --
 .../u-boot/files/CVE-2021-27097-1.patch       |  71 ---
 .../u-boot/files/CVE-2021-27097-2.patch       | 419 ------------------
 .../u-boot/files/CVE-2021-27097-3.patch       | 105 -----
 .../u-boot/files/CVE-2021-27097-4.patch       |  73 ---
 .../u-boot/files/CVE-2021-27138-1.patch       | 245 ----------
 .../u-boot/files/CVE-2021-27138-2.patch       | 109 -----
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   9 +-
 ...ols_2021.01.bb => u-boot-tools_2021.04.bb} |   0
 .../{u-boot_2021.01.bb => u-boot_2021.04.bb}  |   0
 10 files changed, 1 insertion(+), 1066 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-add-valid-fdt-check.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/CVE-2021-27097-1.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/CVE-2021-27097-2.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/CVE-2021-27097-3.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/CVE-2021-27097-4.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/CVE-2021-27138-1.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/CVE-2021-27138-2.patch
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2021.01.bb => u-boot-tools_2021.04.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2021.01.bb => u-boot_2021.04.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/files/0001-add-valid-fdt-check.patch b/meta/recipes-bsp/u-boot/files/0001-add-valid-fdt-check.patch
deleted file mode 100644
index d4ac9e2ed9..0000000000
--- a/meta/recipes-bsp/u-boot/files/0001-add-valid-fdt-check.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ea1a9ec5f430359720d9a0621ed1acfbba6a142a Mon Sep 17 00:00:00 2001
-From: Heinrich Schuchardt <xypron.glpk@gmx.de>
-Date: Wed, 13 Jan 2021 02:09:12 +0100
-Subject: [PATCH] image-fit: fit_check_format check for valid FDT
-
-fit_check_format() must check that the buffer contains a flattened device
-tree before calling any device tree library functions.
-
-Failure to do may cause segmentation faults.
-
-Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
-
-Upstream-Status: Backport[https://github.com/u-boot/u-boot/commit/ea1a9ec5f430359720d9a0621ed1acfbba6a142a]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
-
----
- common/image-fit.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/common/image-fit.c b/common/image-fit.c
-index 6a8787ca0a..21c44bdf69 100644
---- a/common/image-fit.c
-+++ b/common/image-fit.c
-@@ -1553,6 +1553,12 @@ int fit_image_check_comp(const void *fit, int noffset, uint8_t comp)
-  */
- int fit_check_format(const void *fit)
- {
-+	/* A FIT image must be a valid FDT */
-+	if (fdt_check_header(fit)) {
-+		debug("Wrong FIT format: not a flattened device tree\n");
-+		return 0;
-+	}
-+
- 	/* mandatory / node 'description' property */
- 	if (fdt_getprop(fit, 0, FIT_DESC_PROP, NULL) == NULL) {
- 		debug("Wrong FIT format: no description\n");
diff --git a/meta/recipes-bsp/u-boot/files/CVE-2021-27097-1.patch b/meta/recipes-bsp/u-boot/files/CVE-2021-27097-1.patch
deleted file mode 100644
index 98ec2c709d..0000000000
--- a/meta/recipes-bsp/u-boot/files/CVE-2021-27097-1.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 8a7d4cf9820ea16fabd25a6379351b4dc291204b Mon Sep 17 00:00:00 2001
-From: Simon Glass <sjg@chromium.org>
-Date: Mon, 15 Feb 2021 17:08:05 -0700
-Subject: [PATCH] fdt_region: Check for a single root node of the correct name
-
-At present fdt_find_regions() assumes that the FIT is a valid devicetree.
-If the FIT has two root nodes this is currently not detected in this
-function, nor does libfdt's fdt_check_full() notice. Also it is possible
-for the root node to have a name even though it should not.
-
-Add checks for these and return -FDT_ERR_BADSTRUCTURE if a problem is
-detected.
-
-CVE-2021-27097
-
-Signed-off-by: Simon Glass <sjg@chromium.org>
-Reported-by: Bruce Monroe <bruce.monroe@intel.com>
-Reported-by: Arie Haenel <arie.haenel@intel.com>
-Reported-by: Julien Lenoir <julien.lenoir@intel.com>
-
-CVE: CVE-2021-27097
-Upstream-Status: Backport[https://github.com/u-boot/u-boot/commit/8a7d4cf9820ea16fabd25a6379351b4dc291204b]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
-
----
- common/fdt_region.c | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/common/fdt_region.c b/common/fdt_region.c
-index ff12c518e9..e4ef0ca770 100644
---- a/common/fdt_region.c
-+++ b/common/fdt_region.c
-@@ -43,6 +43,7 @@ int fdt_find_regions(const void *fdt, char * const inc[], int inc_count,
- 	int depth = -1;
- 	int want = 0;
- 	int base = fdt_off_dt_struct(fdt);
-+	bool expect_end = false;
- 
- 	end = path;
- 	*end = '\0';
-@@ -59,6 +60,10 @@ int fdt_find_regions(const void *fdt, char * const inc[], int inc_count,
- 		tag = fdt_next_tag(fdt, offset, &nextoffset);
- 		stop_at = nextoffset;
- 
-+		/* If we see two root nodes, something is wrong */
-+		if (expect_end && tag != FDT_END)
-+			return -FDT_ERR_BADLAYOUT;
-+
- 		switch (tag) {
- 		case FDT_PROP:
- 			include = want >= 2;
-@@ -81,6 +86,10 @@ int fdt_find_regions(const void *fdt, char * const inc[], int inc_count,
- 			if (depth == FDT_MAX_DEPTH)
- 				return -FDT_ERR_BADSTRUCTURE;
- 			name = fdt_get_name(fdt, offset, &len);
-+
-+			/* The root node must have an empty name */
-+			if (!depth && *name)
-+				return -FDT_ERR_BADLAYOUT;
- 			if (end - path + 2 + len >= path_len)
- 				return -FDT_ERR_NOSPACE;
- 			if (end != path + 1)
-@@ -108,6 +117,8 @@ int fdt_find_regions(const void *fdt, char * const inc[], int inc_count,
- 			while (end > path && *--end != '/')
- 				;
- 			*end = '\0';
-+			if (depth == -1)
-+				expect_end = true;
- 			break;
- 
- 		case FDT_END:
diff --git a/meta/recipes-bsp/u-boot/files/CVE-2021-27097-2.patch b/meta/recipes-bsp/u-boot/files/CVE-2021-27097-2.patch
deleted file mode 100644
index b13c44e787..0000000000
--- a/meta/recipes-bsp/u-boot/files/CVE-2021-27097-2.patch
+++ /dev/null
@@ -1,419 +0,0 @@
-From c5819701a3de61e2ba2ef7ad0b616565b32305e5 Mon Sep 17 00:00:00 2001
-From: Simon Glass <sjg@chromium.org>
-Date: Mon, 15 Feb 2021 17:08:09 -0700
-Subject: [PATCH] image: Adjust the workings of fit_check_format()
-
-At present this function does not accept a size for the FIT. This means
-that it must be read from the FIT itself, introducing potential security
-risk. Update the function to include a size parameter, which can be
-invalid, in which case fit_check_format() calculates it.
-
-For now no callers pass the size, but this can be updated later.
-
-Also adjust the return value to an error code so that all the different
-types of problems can be distinguished by the user.
-
-Signed-off-by: Simon Glass <sjg@chromium.org>
-Reported-by: Bruce Monroe <bruce.monroe@intel.com>
-Reported-by: Arie Haenel <arie.haenel@intel.com>
-Reported-by: Julien Lenoir <julien.lenoir@intel.com>
-
-CVE: CVE-2021-27097 CVE-2021-27138
-Upstream-Status: Backport[https://github.com/u-boot/u-boot/commit/c5819701a3de61e2ba2ef7ad0b616565b32305e5]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
-
----
- arch/arm/cpu/armv8/sec_firmware.c  |  2 +-
- cmd/bootm.c                        |  6 ++---
- cmd/disk.c                         |  2 +-
- cmd/fpga.c                         |  2 +-
- cmd/nand.c                         |  2 +-
- cmd/source.c                       |  2 +-
- cmd/ximg.c                         |  2 +-
- common/image-fdt.c                 |  2 +-
- common/image-fit.c                 | 46 +++++++++++++++++---------------------
- common/splash_source.c             |  6 ++---
- common/update.c                    |  4 ++--
- drivers/fpga/socfpga_arria10.c     |  6 ++---
- drivers/net/fsl-mc/mc.c            |  2 +-
- drivers/net/pfe_eth/pfe_firmware.c |  2 +-
- include/image.h                    | 21 ++++++++++++++++-
- tools/fit_common.c                 |  3 ++-
- tools/fit_image.c                  |  2 +-
- tools/mkimage.h                    |  2 ++
- 18 files changed, 65 insertions(+), 49 deletions(-)
-
-diff --git a/arch/arm/cpu/armv8/sec_firmware.c b/arch/arm/cpu/armv8/sec_firmware.c
-index bfc0fac3ef..0561f5efd1 100644
---- a/arch/arm/cpu/armv8/sec_firmware.c
-+++ b/arch/arm/cpu/armv8/sec_firmware.c
-@@ -316,7 +316,7 @@ __weak bool sec_firmware_is_valid(const void *sec_firmware_img)
- 		return false;
- 	}
- 
--	if (!fit_check_format(sec_firmware_img)) {
-+	if (fit_check_format(sec_firmware_img, IMAGE_SIZE_INVAL)) {
- 		printf("SEC Firmware: Bad firmware image (bad FIT header)\n");
- 		return false;
- 	}
-diff --git a/cmd/bootm.c b/cmd/bootm.c
-index e6b0e04413..a0f823f968 100644
---- a/cmd/bootm.c
-+++ b/cmd/bootm.c
-@@ -291,7 +291,7 @@ static int image_info(ulong addr)
- 	case IMAGE_FORMAT_FIT:
- 		puts("   FIT image found\n");
- 
--		if (!fit_check_format(hdr)) {
-+		if (fit_check_format(hdr, IMAGE_SIZE_INVAL)) {
- 			puts("Bad FIT image format!\n");
- 			unmap_sysmem(hdr);
- 			return 1;
-@@ -368,7 +368,7 @@ static int do_imls_nor(void)
- #endif
- #if defined(CONFIG_FIT)
- 			case IMAGE_FORMAT_FIT:
--				if (!fit_check_format(hdr))
-+				if (fit_check_format(hdr, IMAGE_SIZE_INVAL))
- 					goto next_sector;
- 
- 				printf("FIT Image at %08lX:\n", (ulong)hdr);
-@@ -448,7 +448,7 @@ static int nand_imls_fitimage(struct mtd_info *mtd, int nand_dev, loff_t off,
- 		return ret;
- 	}
- 
--	if (!fit_check_format(imgdata)) {
-+	if (fit_check_format(imgdata, IMAGE_SIZE_INVAL)) {
- 		free(imgdata);
- 		return 0;
- 	}
-diff --git a/cmd/disk.c b/cmd/disk.c
-index 8060e753eb..3195db9127 100644
---- a/cmd/disk.c
-+++ b/cmd/disk.c
-@@ -114,7 +114,7 @@ int common_diskboot(struct cmd_tbl *cmdtp, const char *intf, int argc,
- 	/* This cannot be done earlier,
- 	 * we need complete FIT image in RAM first */
- 	if (genimg_get_format((void *) addr) == IMAGE_FORMAT_FIT) {
--		if (!fit_check_format(fit_hdr)) {
-+		if (fit_check_format(fit_hdr, IMAGE_SIZE_INVAL)) {
- 			bootstage_error(BOOTSTAGE_ID_IDE_FIT_READ);
- 			puts("** Bad FIT image format\n");
- 			return 1;
-diff --git a/cmd/fpga.c b/cmd/fpga.c
-index 8ae1c936fb..51410a8e42 100644
---- a/cmd/fpga.c
-+++ b/cmd/fpga.c
-@@ -330,7 +330,7 @@ static int do_fpga_loadmk(struct cmd_tbl *cmdtp, int flag, int argc,
- 			return CMD_RET_FAILURE;
- 		}
- 
--		if (!fit_check_format(fit_hdr)) {
-+		if (fit_check_format(fit_hdr, IMAGE_SIZE_INVAL)) {
- 			puts("Bad FIT image format\n");
- 			return CMD_RET_FAILURE;
- 		}
-diff --git a/cmd/nand.c b/cmd/nand.c
-index 92d039af8f..97e117a979 100644
---- a/cmd/nand.c
-+++ b/cmd/nand.c
-@@ -917,7 +917,7 @@ static int nand_load_image(struct cmd_tbl *cmdtp, struct mtd_info *mtd,
- #if defined(CONFIG_FIT)
- 	/* This cannot be done earlier, we need complete FIT image in RAM first */
- 	if (genimg_get_format ((void *)addr) == IMAGE_FORMAT_FIT) {
--		if (!fit_check_format (fit_hdr)) {
-+		if (fit_check_format(fit_hdr, IMAGE_SIZE_INVAL)) {
- 			bootstage_error(BOOTSTAGE_ID_NAND_FIT_READ);
- 			puts ("** Bad FIT image format\n");
- 			return 1;
-diff --git a/cmd/source.c b/cmd/source.c
-index b6c709a3d2..71f71528ad 100644
---- a/cmd/source.c
-+++ b/cmd/source.c
-@@ -107,7 +107,7 @@ int image_source_script(ulong addr, const char *fit_uname)
- #if defined(CONFIG_FIT)
- 	case IMAGE_FORMAT_FIT:
- 		fit_hdr = buf;
--		if (!fit_check_format (fit_hdr)) {
-+		if (fit_check_format(fit_hdr, IMAGE_SIZE_INVAL)) {
- 			puts ("Bad FIT image format\n");
- 			return 1;
- 		}
-diff --git a/cmd/ximg.c b/cmd/ximg.c
-index 159ba51648..ef738ebfa2 100644
---- a/cmd/ximg.c
-+++ b/cmd/ximg.c
-@@ -136,7 +136,7 @@ do_imgextract(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
- 			"at %08lx ...\n", uname, addr);
- 
- 		fit_hdr = (const void *)addr;
--		if (!fit_check_format(fit_hdr)) {
-+		if (fit_check_format(fit_hdr, IMAGE_SIZE_INVAL)) {
- 			puts("Bad FIT image format\n");
- 			return 1;
- 		}
-diff --git a/common/image-fdt.c b/common/image-fdt.c
-index 327a8c4c39..4105259212 100644
---- a/common/image-fdt.c
-+++ b/common/image-fdt.c
-@@ -399,7 +399,7 @@ int boot_get_fdt(int flag, int argc, char *const argv[], uint8_t arch,
- 			 */
- #if CONFIG_IS_ENABLED(FIT)
- 			/* check FDT blob vs FIT blob */
--			if (fit_check_format(buf)) {
-+			if (!fit_check_format(buf, IMAGE_SIZE_INVAL)) {
- 				ulong load, len;
- 
- 				fdt_noffset = boot_get_fdt_fit(images,
-diff --git a/common/image-fit.c b/common/image-fit.c
-index 9637d747fb..402f08fc9d 100644
---- a/common/image-fit.c
-+++ b/common/image-fit.c
-@@ -8,6 +8,8 @@
-  * Wolfgang Denk, DENX Software Engineering, wd@denx.de.
-  */
- 
-+#define LOG_CATEGORY LOGC_BOOT
-+
- #ifdef USE_HOSTCC
- #include "mkimage.h"
- #include <time.h>
-@@ -1550,49 +1552,41 @@ int fit_image_check_comp(const void *fit, int noffset, uint8_t comp)
- 	return (comp == image_comp);
- }
- 
--/**
-- * fit_check_format - sanity check FIT image format
-- * @fit: pointer to the FIT format image header
-- *
-- * fit_check_format() runs a basic sanity FIT image verification.
-- * Routine checks for mandatory properties, nodes, etc.
-- *
-- * returns:
-- *     1, on success
-- *     0, on failure
-- */
--int fit_check_format(const void *fit)
-+int fit_check_format(const void *fit, ulong size)
- {
-+	int ret;
-+
- 	/* A FIT image must be a valid FDT */
--	if (fdt_check_header(fit)) {
--		debug("Wrong FIT format: not a flattened device tree\n");
--		return 0;
-+	ret = fdt_check_header(fit);
-+	if (ret) {
-+		log_debug("Wrong FIT format: not a flattened device tree (err=%d)\n",
-+			  ret);
-+		return -ENOEXEC;
- 	}
- 
- 	/* mandatory / node 'description' property */
--	if (fdt_getprop(fit, 0, FIT_DESC_PROP, NULL) == NULL) {
--		debug("Wrong FIT format: no description\n");
--		return 0;
-+	if (!fdt_getprop(fit, 0, FIT_DESC_PROP, NULL)) {
-+		log_debug("Wrong FIT format: no description\n");
-+		return -ENOMSG;
- 	}
- 
- 	if (IMAGE_ENABLE_TIMESTAMP) {
- 		/* mandatory / node 'timestamp' property */
--		if (fdt_getprop(fit, 0, FIT_TIMESTAMP_PROP, NULL) == NULL) {
--			debug("Wrong FIT format: no timestamp\n");
--			return 0;
-+		if (!fdt_getprop(fit, 0, FIT_TIMESTAMP_PROP, NULL)) {
-+			log_debug("Wrong FIT format: no timestamp\n");
-+			return -ENODATA;
- 		}
- 	}
- 
- 	/* mandatory subimages parent '/images' node */
- 	if (fdt_path_offset(fit, FIT_IMAGES_PATH) < 0) {
--		debug("Wrong FIT format: no images parent node\n");
--		return 0;
-+		log_debug("Wrong FIT format: no images parent node\n");
-+		return -ENOENT;
- 	}
- 
--	return 1;
-+	return 0;
- }
- 
--
- /**
-  * fit_conf_find_compat
-  * @fit: pointer to the FIT format image header
-@@ -1929,7 +1923,7 @@ int fit_image_load(bootm_headers_t *images, ulong addr,
- 	printf("## Loading %s from FIT Image at %08lx ...\n", prop_name, addr);
- 
- 	bootstage_mark(bootstage_id + BOOTSTAGE_SUB_FORMAT);
--	if (!fit_check_format(fit)) {
-+	if (fit_check_format(fit, IMAGE_SIZE_INVAL)) {
- 		printf("Bad FIT %s image format!\n", prop_name);
- 		bootstage_error(bootstage_id + BOOTSTAGE_SUB_FORMAT);
- 		return -ENOEXEC;
-diff --git a/common/splash_source.c b/common/splash_source.c
-index f51ca5ddf3..bad9a7790a 100644
---- a/common/splash_source.c
-+++ b/common/splash_source.c
-@@ -336,10 +336,10 @@ static int splash_load_fit(struct splash_location *location, u32 bmp_load_addr)
- 	if (res < 0)
- 		return res;
- 
--	res = fit_check_format(fit_header);
--	if (!res) {
-+	res = fit_check_format(fit_header, IMAGE_SIZE_INVAL);
-+	if (res) {
- 		debug("Could not find valid FIT image\n");
--		return -EINVAL;
-+		return res;
- 	}
- 
- 	/* Get the splash image node */
-diff --git a/common/update.c b/common/update.c
-index a5879cb52c..f0848954e5 100644
---- a/common/update.c
-+++ b/common/update.c
-@@ -286,7 +286,7 @@ int update_tftp(ulong addr, char *interface, char *devstring)
- got_update_file:
- 	fit = map_sysmem(addr, 0);
- 
--	if (!fit_check_format((void *)fit)) {
-+	if (fit_check_format((void *)fit, IMAGE_SIZE_INVAL)) {
- 		printf("Bad FIT format of the update file, aborting "
- 							"auto-update\n");
- 		return 1;
-@@ -363,7 +363,7 @@ int fit_update(const void *fit)
- 	if (!fit)
- 		return -EINVAL;
- 
--	if (!fit_check_format((void *)fit)) {
-+	if (fit_check_format((void *)fit, IMAGE_SIZE_INVAL)) {
- 		printf("Bad FIT format of the update file, aborting auto-update\n");
- 		return -EINVAL;
- 	}
-diff --git a/drivers/fpga/socfpga_arria10.c b/drivers/fpga/socfpga_arria10.c
-index 44e1ac54c3..18f99676d2 100644
---- a/drivers/fpga/socfpga_arria10.c
-+++ b/drivers/fpga/socfpga_arria10.c
-@@ -565,10 +565,10 @@ static int first_loading_rbf_to_buffer(struct udevice *dev,
- 	if (ret < 0)
- 		return ret;
- 
--	ret = fit_check_format(buffer_p);
--	if (!ret) {
-+	ret = fit_check_format(buffer_p, IMAGE_SIZE_INVAL);
-+	if (ret) {
- 		debug("FPGA: No valid FIT image was found.\n");
--		return -EBADF;
-+		return ret;
- 	}
- 
- 	confs_noffset = fdt_path_offset(buffer_p, FIT_CONFS_PATH);
-diff --git a/drivers/net/fsl-mc/mc.c b/drivers/net/fsl-mc/mc.c
-index 84db6be624..81265ee356 100644
---- a/drivers/net/fsl-mc/mc.c
-+++ b/drivers/net/fsl-mc/mc.c
-@@ -141,7 +141,7 @@ int parse_mc_firmware_fit_image(u64 mc_fw_addr,
- 		return -EINVAL;
- 	}
- 
--	if (!fit_check_format(fit_hdr)) {
-+	if (fit_check_format(fit_hdr, IMAGE_SIZE_INVAL)) {
- 		printf("fsl-mc: ERR: Bad firmware image (bad FIT header)\n");
- 		return -EINVAL;
- 	}
-diff --git a/drivers/net/pfe_eth/pfe_firmware.c b/drivers/net/pfe_eth/pfe_firmware.c
-index 41999e176d..eee70a2e73 100644
---- a/drivers/net/pfe_eth/pfe_firmware.c
-+++ b/drivers/net/pfe_eth/pfe_firmware.c
-@@ -160,7 +160,7 @@ static int pfe_fit_check(void)
- 		return ret;
- 	}
- 
--	if (!fit_check_format(pfe_fit_addr)) {
-+	if (fit_check_format(pfe_fit_addr, IMAGE_SIZE_INVAL)) {
- 		printf("PFE Firmware: Bad firmware image (bad FIT header)\n");
- 		ret = -1;
- 		return ret;
-diff --git a/include/image.h b/include/image.h
-index 41473dbb9c..8c152c5c5f 100644
---- a/include/image.h
-+++ b/include/image.h
-@@ -134,6 +134,9 @@ extern ulong image_load_addr;		/* Default Load Address */
- extern ulong image_save_addr;		/* Default Save Address */
- extern ulong image_save_size;		/* Default Save Size */
- 
-+/* An invalid size, meaning that the image size is not known */
-+#define IMAGE_SIZE_INVAL	(-1UL)
-+
- enum ih_category {
- 	IH_ARCH,
- 	IH_COMP,
-@@ -1141,7 +1144,23 @@ int fit_image_check_os(const void *fit, int noffset, uint8_t os);
- int fit_image_check_arch(const void *fit, int noffset, uint8_t arch);
- int fit_image_check_type(const void *fit, int noffset, uint8_t type);
- int fit_image_check_comp(const void *fit, int noffset, uint8_t comp);
--int fit_check_format(const void *fit);
-+
-+/**
-+ * fit_check_format() - Check that the FIT is valid
-+ *
-+ * This performs various checks on the FIT to make sure it is suitable for
-+ * use, looking for mandatory properties, nodes, etc.
-+ *
-+ * If FIT_FULL_CHECK is enabled, it also runs it through libfdt to make
-+ * sure that there are no strange tags or broken nodes in the FIT.
-+ *
-+ * @fit: pointer to the FIT format image header
-+ * @return 0 if OK, -ENOEXEC if not an FDT file, -EINVAL if the full FDT check
-+ *	failed (e.g. due to bad structure), -ENOMSG if the description is
-+ *	missing, -ENODATA if the timestamp is missing, -ENOENT if the /images
-+ *	path is missing
-+ */
-+int fit_check_format(const void *fit, ulong size);
- 
- int fit_conf_find_compat(const void *fit, const void *fdt);
- 
-diff --git a/tools/fit_common.c b/tools/fit_common.c
-index cdf987d3c1..52b63296f8 100644
---- a/tools/fit_common.c
-+++ b/tools/fit_common.c
-@@ -26,7 +26,8 @@
- int fit_verify_header(unsigned char *ptr, int image_size,
- 			struct image_tool_params *params)
- {
--	if (fdt_check_header(ptr) != EXIT_SUCCESS || !fit_check_format(ptr))
-+	if (fdt_check_header(ptr) != EXIT_SUCCESS ||
-+	    fit_check_format(ptr, IMAGE_SIZE_INVAL))
- 		return EXIT_FAILURE;
- 
- 	return EXIT_SUCCESS;
-diff --git a/tools/fit_image.c b/tools/fit_image.c
-index 06faeda7c2..d440d143c6 100644
---- a/tools/fit_image.c
-+++ b/tools/fit_image.c
-@@ -883,7 +883,7 @@ static int fit_extract_contents(void *ptr, struct image_tool_params *params)
- 	/* Indent string is defined in header image.h */
- 	p = IMAGE_INDENT_STRING;
- 
--	if (!fit_check_format(fit)) {
-+	if (fit_check_format(fit, IMAGE_SIZE_INVAL)) {
- 		printf("Bad FIT image format\n");
- 		return -1;
- 	}
-diff --git a/tools/mkimage.h b/tools/mkimage.h
-index 5b096a545b..0d3148444c 100644
---- a/tools/mkimage.h
-+++ b/tools/mkimage.h
-@@ -29,6 +29,8 @@
- #define debug(fmt,args...)
- #endif /* MKIMAGE_DEBUG */
- 
-+#define log_debug(fmt, args...)	debug(fmt, ##args)
-+
- static inline void *map_sysmem(ulong paddr, unsigned long len)
- {
- 	return (void *)(uintptr_t)paddr;
diff --git a/meta/recipes-bsp/u-boot/files/CVE-2021-27097-3.patch b/meta/recipes-bsp/u-boot/files/CVE-2021-27097-3.patch
deleted file mode 100644
index 86f7e8ce55..0000000000
--- a/meta/recipes-bsp/u-boot/files/CVE-2021-27097-3.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 6f3c2d8aa5e6cbd80b5e869bbbddecb66c329d01 Mon Sep 17 00:00:00 2001
-From: Simon Glass <sjg@chromium.org>
-Date: Mon, 15 Feb 2021 17:08:10 -0700
-Subject: [PATCH] image: Add an option to do a full check of the FIT
-
-Some strange modifications of the FIT can introduce security risks. Add an
-option to check it thoroughly, using libfdt's fdt_check_full() function.
-
-Enable this by default if signature verification is enabled.
-
-CVE-2021-27097
-
-Signed-off-by: Simon Glass <sjg@chromium.org>
-Reported-by: Bruce Monroe <bruce.monroe@intel.com>
-Reported-by: Arie Haenel <arie.haenel@intel.com>
-Reported-by: Julien Lenoir <julien.lenoir@intel.com>
-
-CVE: CVE-2021-27097
-Upstream-Status: Backport[https://github.com/u-boot/u-boot/commit/6f3c2d8aa5e6cbd80b5e869bbbddecb66c329d01]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
-
----
- common/Kconfig.boot | 20 ++++++++++++++++++++
- common/image-fit.c  | 16 ++++++++++++++++
- 2 files changed, 36 insertions(+)
-
-diff --git a/common/Kconfig.boot b/common/Kconfig.boot
-index 5eaabdfc27..7532e55edb 100644
---- a/common/Kconfig.boot
-+++ b/common/Kconfig.boot
-@@ -63,6 +63,15 @@ config FIT_ENABLE_SHA512_SUPPORT
- 	  SHA512 checksum is a 512-bit (64-byte) hash value used to check that
- 	  the image contents have not been corrupted.
- 
-+config FIT_FULL_CHECK
-+	bool "Do a full check of the FIT before using it"
-+	default y
-+	help
-+	  Enable this do a full check of the FIT to make sure it is valid. This
-+	  helps to protect against carefully crafted FITs which take advantage
-+	  of bugs or omissions in the code. This includes a bad structure,
-+	  multiple root nodes and the like.
-+
- config FIT_SIGNATURE
- 	bool "Enable signature verification of FIT uImages"
- 	depends on DM
-@@ -70,6 +79,7 @@ config FIT_SIGNATURE
- 	select RSA
- 	select RSA_VERIFY
- 	select IMAGE_SIGN_INFO
-+	select FIT_FULL_CHECK
- 	help
- 	  This option enables signature verification of FIT uImages,
- 	  using a hash signed and verified using RSA. If
-@@ -159,6 +169,15 @@ config SPL_FIT_PRINT
- 	help
- 	  Support printing the content of the fitImage in a verbose manner in SPL.
- 
-+config SPL_FIT_FULL_CHECK
-+	bool "Do a full check of the FIT before using it"
-+	help
-+	  Enable this do a full check of the FIT to make sure it is valid. This
-+	  helps to protect against carefully crafted FITs which take advantage
-+	  of bugs or omissions in the code. This includes a bad structure,
-+	  multiple root nodes and the like.
-+
-+
- config SPL_FIT_SIGNATURE
- 	bool "Enable signature verification of FIT firmware within SPL"
- 	depends on SPL_DM
-@@ -168,6 +187,7 @@ config SPL_FIT_SIGNATURE
- 	select SPL_RSA
- 	select SPL_RSA_VERIFY
- 	select SPL_IMAGE_SIGN_INFO
-+	select SPL_FIT_FULL_CHECK
- 
- config SPL_LOAD_FIT
- 	bool "Enable SPL loading U-Boot as a FIT (basic fitImage features)"
-diff --git a/common/image-fit.c b/common/image-fit.c
-index f6c0428a96..bcf395f6a1 100644
---- a/common/image-fit.c
-+++ b/common/image-fit.c
-@@ -1580,6 +1580,22 @@ int fit_check_format(const void *fit, ulong size)
- 		return -ENOEXEC;
- 	}
- 
-+	if (CONFIG_IS_ENABLED(FIT_FULL_CHECK)) {
-+		/*
-+		 * If we are not given the size, make do wtih calculating it.
-+		 * This is not as secure, so we should consider a flag to
-+		 * control this.
-+		 */
-+		if (size == IMAGE_SIZE_INVAL)
-+			size = fdt_totalsize(fit);
-+		ret = fdt_check_full(fit, size);
-+
-+		if (ret) {
-+			log_debug("FIT check error %d\n", ret);
-+			return -EINVAL;
-+		}
-+	}
-+
- 	/* mandatory / node 'description' property */
- 	if (!fdt_getprop(fit, 0, FIT_DESC_PROP, NULL)) {
- 		log_debug("Wrong FIT format: no description\n");
diff --git a/meta/recipes-bsp/u-boot/files/CVE-2021-27097-4.patch b/meta/recipes-bsp/u-boot/files/CVE-2021-27097-4.patch
deleted file mode 100644
index 060cac1cf6..0000000000
--- a/meta/recipes-bsp/u-boot/files/CVE-2021-27097-4.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 124c255731c76a2b09587378b2bcce561bcd3f2d Mon Sep 17 00:00:00 2001
-From: Simon Glass <sjg@chromium.org>
-Date: Mon, 15 Feb 2021 17:08:11 -0700
-Subject: [PATCH] libfdt: Check for multiple/invalid root nodes
-
-It is possible to construct a devicetree blob with multiple root nodes.
-Update fdt_check_full() to check for this, along with a root node with an
-invalid name.
-
-CVE-2021-27097
-
-Signed-off-by: Simon Glass <sjg@chromium.org>
-Reported-by: Bruce Monroe <bruce.monroe@intel.com>
-Reported-by: Arie Haenel <arie.haenel@intel.com>
-Reported-by: Julien Lenoir <julien.lenoir@intel.com>
-
-CVE: CVE-2021-27097
-Upstream-Status: Backport[https://github.com/u-boot/u-boot/commit/124c255731c76a2b09587378b2bcce561bcd3f2d]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
-
----
- scripts/dtc/libfdt/fdt_ro.c | 17 +++++++++++++++++
- test/py/tests/test_vboot.py |  3 ++-
- 2 files changed, 19 insertions(+), 1 deletion(-)
-
-diff --git a/scripts/dtc/libfdt/fdt_ro.c b/scripts/dtc/libfdt/fdt_ro.c
-index d984bab036..efe7efe921 100644
---- a/scripts/dtc/libfdt/fdt_ro.c
-+++ b/scripts/dtc/libfdt/fdt_ro.c
-@@ -867,6 +867,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
- 	unsigned depth = 0;
- 	const void *prop;
- 	const char *propname;
-+	bool expect_end = false;
- 
- 	if (bufsize < FDT_V1_SIZE)
- 		return -FDT_ERR_TRUNCATED;
-@@ -887,6 +888,10 @@ int fdt_check_full(const void *fdt, size_t bufsize)
- 		if (nextoffset < 0)
- 			return nextoffset;
- 
-+		/* If we see two root nodes, something is wrong */
-+		if (expect_end && tag != FDT_END)
-+			return -FDT_ERR_BADLAYOUT;
-+
- 		switch (tag) {
- 		case FDT_NOP:
- 			break;
-@@ -900,12 +905,24 @@ int fdt_check_full(const void *fdt, size_t bufsize)
- 			depth++;
- 			if (depth > INT_MAX)
- 				return -FDT_ERR_BADSTRUCTURE;
-+
-+			/* The root node must have an empty name */
-+			if (depth == 1) {
-+				const char *name;
-+				int len;
-+
-+				name = fdt_get_name(fdt, offset, &len);
-+				if (*name || len)
-+					return -FDT_ERR_BADLAYOUT;
-+			}
- 			break;
- 
- 		case FDT_END_NODE:
- 			if (depth == 0)
- 				return -FDT_ERR_BADSTRUCTURE;
- 			depth--;
-+			if (depth == 0)
-+				expect_end = true;
- 			break;
- 
- 		case FDT_PROP:
diff --git a/meta/recipes-bsp/u-boot/files/CVE-2021-27138-1.patch b/meta/recipes-bsp/u-boot/files/CVE-2021-27138-1.patch
deleted file mode 100644
index 562f8151bb..0000000000
--- a/meta/recipes-bsp/u-boot/files/CVE-2021-27138-1.patch
+++ /dev/null
@@ -1,245 +0,0 @@
-From 79af75f7776fc20b0d7eb6afe1e27c00fdb4b9b4 Mon Sep 17 00:00:00 2001
-From: Simon Glass <sjg@chromium.org>
-Date: Mon, 15 Feb 2021 17:08:06 -0700
-Subject: [PATCH] fit: Don't allow verification of images with @ nodes
-
-When searching for a node called 'fred', any unit address appended to the
-name is ignored by libfdt, meaning that 'fred' can match 'fred@1'. This
-means that we cannot be sure that the node originally intended is the one
-that is used.
-
-Disallow use of nodes with unit addresses.
-
-Update the forge test also, since it uses @ addresses.
-
-CVE-2021-27138
-
-Signed-off-by: Simon Glass <sjg@chromium.org>
-Reported-by: Bruce Monroe <bruce.monroe@intel.com>
-Reported-by: Arie Haenel <arie.haenel@intel.com>
-Reported-by: Julien Lenoir <julien.lenoir@intel.com>
-
-CVE: CVE-2021-27138
-Upstream-Status: Backport[https://github.com/u-boot/u-boot/commit/79af75f7776fc20b0d7eb6afe1e27c00fdb4b9b4]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
-
----
- common/image-fit-sig.c       | 22 ++++++++++++++++++++--
- common/image-fit.c           | 20 +++++++++++++++-----
- test/py/tests/test_fit.py    | 24 ++++++++++++------------
- test/py/tests/vboot_forge.py | 12 ++++++------
- 4 files changed, 53 insertions(+), 25 deletions(-)
-
-diff --git a/common/image-fit-sig.c b/common/image-fit-sig.c
-index 897e04c7a3..34ebb8edfe 100644
---- a/common/image-fit-sig.c
-+++ b/common/image-fit-sig.c
-@@ -149,6 +149,14 @@ static int fit_image_verify_sig(const void *fit, int image_noffset,
- 	fdt_for_each_subnode(noffset, fit, image_noffset) {
- 		const char *name = fit_get_name(fit, noffset, NULL);
- 
-+		/*
-+		 * We don't support this since libfdt considers names with the
-+		 * name root but different @ suffix to be equal
-+		 */
-+		if (strchr(name, '@')) {
-+			err_msg = "Node name contains @";
-+			goto error;
-+		}
- 		if (!strncmp(name, FIT_SIG_NODENAME,
- 			     strlen(FIT_SIG_NODENAME))) {
- 			ret = fit_image_check_sig(fit, noffset, data,
-@@ -398,9 +406,10 @@ error:
- 	return -EPERM;
- }
- 
--int fit_config_verify_required_sigs(const void *fit, int conf_noffset,
--				    const void *sig_blob)
-+static int fit_config_verify_required_sigs(const void *fit, int conf_noffset,
-+					   const void *sig_blob)
- {
-+	const char *name = fit_get_name(fit, conf_noffset, NULL);
- 	int noffset;
- 	int sig_node;
- 	int verified = 0;
-@@ -408,6 +417,15 @@ int fit_config_verify_required_sigs(const void *fit, int conf_noffset,
- 	bool reqd_policy_all = true;
- 	const char *reqd_mode;
- 
-+	/*
-+	 * We don't support this since libfdt considers names with the
-+	 * name root but different @ suffix to be equal
-+	 */
-+	if (strchr(name, '@')) {
-+		printf("Configuration node '%s' contains '@'\n", name);
-+		return -EPERM;
-+	}
-+
- 	/* Work out what we need to verify */
- 	sig_node = fdt_subnode_offset(sig_blob, 0, FIT_SIG_NODENAME);
- 	if (sig_node < 0) {
-diff --git a/common/image-fit.c b/common/image-fit.c
-index adc3e551de..c3dc814115 100644
---- a/common/image-fit.c
-+++ b/common/image-fit.c
-@@ -1369,21 +1369,31 @@ error:
-  */
- int fit_image_verify(const void *fit, int image_noffset)
- {
-+	const char *name = fit_get_name(fit, image_noffset, NULL);
- 	const void	*data;
- 	size_t		size;
--	int		noffset = 0;
- 	char		*err_msg = "";
- 
-+	if (strchr(name, '@')) {
-+		/*
-+		 * We don't support this since libfdt considers names with the
-+		 * name root but different @ suffix to be equal
-+		 */
-+		err_msg = "Node name contains @";
-+		goto err;
-+	}
- 	/* Get image data and data length */
- 	if (fit_image_get_data_and_size(fit, image_noffset, &data, &size)) {
- 		err_msg = "Can't get image data/size";
--		printf("error!\n%s for '%s' hash node in '%s' image node\n",
--		       err_msg, fit_get_name(fit, noffset, NULL),
--		       fit_get_name(fit, image_noffset, NULL));
--		return 0;
-+		goto err;
- 	}
- 
- 	return fit_image_verify_with_data(fit, image_noffset, data, size);
-+
-+err:
-+	printf("error!\n%s in '%s' image node\n", err_msg,
-+	       fit_get_name(fit, image_noffset, NULL));
-+	return 0;
- }
- 
- /**
-diff --git a/test/py/tests/test_fit.py b/test/py/tests/test_fit.py
-index 84b3f95850..6d5b43c3ba 100755
---- a/test/py/tests/test_fit.py
-+++ b/test/py/tests/test_fit.py
-@@ -17,7 +17,7 @@ base_its = '''
-         #address-cells = <1>;
- 
-         images {
--                kernel@1 {
-+                kernel-1 {
-                         data = /incbin/("%(kernel)s");
-                         type = "kernel";
-                         arch = "sandbox";
-@@ -26,7 +26,7 @@ base_its = '''
-                         load = <0x40000>;
-                         entry = <0x8>;
-                 };
--                kernel@2 {
-+                kernel-2 {
-                         data = /incbin/("%(loadables1)s");
-                         type = "kernel";
-                         arch = "sandbox";
-@@ -35,19 +35,19 @@ base_its = '''
-                         %(loadables1_load)s
-                         entry = <0x0>;
-                 };
--                fdt@1 {
-+                fdt-1 {
-                         description = "snow";
-                         data = /incbin/("%(fdt)s");
-                         type = "flat_dt";
-                         arch = "sandbox";
-                         %(fdt_load)s
-                         compression = "%(compression)s";
--                        signature@1 {
-+                        signature-1 {
-                                 algo = "sha1,rsa2048";
-                                 key-name-hint = "dev";
-                         };
-                 };
--                ramdisk@1 {
-+                ramdisk-1 {
-                         description = "snow";
-                         data = /incbin/("%(ramdisk)s");
-                         type = "ramdisk";
-@@ -56,7 +56,7 @@ base_its = '''
-                         %(ramdisk_load)s
-                         compression = "%(compression)s";
-                 };
--                ramdisk@2 {
-+                ramdisk-2 {
-                         description = "snow";
-                         data = /incbin/("%(loadables2)s");
-                         type = "ramdisk";
-@@ -67,10 +67,10 @@ base_its = '''
-                 };
-         };
-         configurations {
--                default = "conf@1";
--                conf@1 {
--                        kernel = "kernel@1";
--                        fdt = "fdt@1";
-+                default = "conf-1";
-+                conf-1 {
-+                        kernel = "kernel-1";
-+                        fdt = "fdt-1";
-                         %(ramdisk_config)s
-                         %(loadables_config)s
-                 };
-@@ -410,7 +410,7 @@ def test_fit(u_boot_console):
- 
-         # Try a ramdisk
-         with cons.log.section('Kernel + FDT + Ramdisk load'):
--            params['ramdisk_config'] = 'ramdisk = "ramdisk@1";'
-+            params['ramdisk_config'] = 'ramdisk = "ramdisk-1";'
-             params['ramdisk_load'] = 'load = <%#x>;' % params['ramdisk_addr']
-             fit = make_fit(mkimage, params)
-             cons.restart_uboot()
-@@ -419,7 +419,7 @@ def test_fit(u_boot_console):
- 
-         # Configuration with some Loadables
-         with cons.log.section('Kernel + FDT + Ramdisk load + Loadables'):
--            params['loadables_config'] = 'loadables = "kernel@2", "ramdisk@2";'
-+            params['loadables_config'] = 'loadables = "kernel-2", "ramdisk-2";'
-             params['loadables1_load'] = ('load = <%#x>;' %
-                                          params['loadables1_addr'])
-             params['loadables2_load'] = ('load = <%#x>;' %
-diff --git a/test/py/tests/vboot_forge.py b/test/py/tests/vboot_forge.py
-index 0fb7ef4024..b41105bd0e 100644
---- a/test/py/tests/vboot_forge.py
-+++ b/test/py/tests/vboot_forge.py
-@@ -376,12 +376,12 @@ def manipulate(root, strblock):
-     """
-     Maliciously manipulates the structure to create a crafted FIT file
-     """
--    # locate /images/kernel@1 (frankly, it just expects it to be the first one)
-+    # locate /images/kernel-1 (frankly, it just expects it to be the first one)
-     kernel_node = root[0][0]
-     # clone it to save time filling all the properties
-     fake_kernel = kernel_node.clone()
-     # rename the node
--    fake_kernel.name = b'kernel@2'
-+    fake_kernel.name = b'kernel-2'
-     # get rid of signatures/hashes
-     fake_kernel.children = []
-     # NOTE: this simply replaces the first prop... either description or data
-@@ -391,13 +391,13 @@ def manipulate(root, strblock):
-     root[0].children.append(fake_kernel)
- 
-     # modify the default configuration
--    root[1].props[0].value = b'conf@2\x00'
-+    root[1].props[0].value = b'conf-2\x00'
-     # clone the first (only?) configuration
-     fake_conf = root[1][0].clone()
-     # rename and change kernel and fdt properties to select the crafted kernel
--    fake_conf.name = b'conf@2'
--    fake_conf.props[0].value = b'kernel@2\x00'
--    fake_conf.props[1].value = b'fdt@1\x00'
-+    fake_conf.name = b'conf-2'
-+    fake_conf.props[0].value = b'kernel-2\x00'
-+    fake_conf.props[1].value = b'fdt-1\x00'
-     # insert the new configuration under /configurations
-     root[1].children.append(fake_conf)
- 
diff --git a/meta/recipes-bsp/u-boot/files/CVE-2021-27138-2.patch b/meta/recipes-bsp/u-boot/files/CVE-2021-27138-2.patch
deleted file mode 100644
index 946196c378..0000000000
--- a/meta/recipes-bsp/u-boot/files/CVE-2021-27138-2.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 3f04db891a353f4b127ed57279279f851c6b4917 Mon Sep 17 00:00:00 2001
-From: Simon Glass <sjg@chromium.org>
-Date: Mon, 15 Feb 2021 17:08:12 -0700
-Subject: [PATCH] image: Check for unit addresses in FITs
-
-Using unit addresses in a FIT is a security risk. Add a check for this
-and disallow it.
-
-CVE-2021-27138
-
-Signed-off-by: Simon Glass <sjg@chromium.org>
-Reported-by: Bruce Monroe <bruce.monroe@intel.com>
-Reported-by: Arie Haenel <arie.haenel@intel.com>
-Reported-by: Julien Lenoir <julien.lenoir@intel.com>
-
-CVE: CVE-2021-27138
-Upstream-Status: Backport[https://github.com/u-boot/u-boot/commit/3f04db891a353f4b127ed57279279f851c6b4917]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
-
----
- common/image-fit.c          | 56 +++++++++++++++++++++++++++++++++++++++++----
- test/py/tests/test_vboot.py |  9 ++++----
- 2 files changed, 57 insertions(+), 8 deletions(-)
-
-diff --git a/common/image-fit.c b/common/image-fit.c
-index bcf395f6a1..28b3d2b191 100644
---- a/common/image-fit.c
-+++ b/common/image-fit.c
-@@ -1568,6 +1568,34 @@ int fit_image_check_comp(const void *fit, int noffset, uint8_t comp)
- 	return (comp == image_comp);
- }
- 
-+/**
-+ * fdt_check_no_at() - Check for nodes whose names contain '@'
-+ *
-+ * This checks the parent node and all subnodes recursively
-+ *
-+ * @fit: FIT to check
-+ * @parent: Parent node to check
-+ * @return 0 if OK, -EADDRNOTAVAIL is a node has a name containing '@'
-+ */
-+static int fdt_check_no_at(const void *fit, int parent)
-+{
-+	const char *name;
-+	int node;
-+	int ret;
-+
-+	name = fdt_get_name(fit, parent, NULL);
-+	if (!name || strchr(name, '@'))
-+		return -EADDRNOTAVAIL;
-+
-+	fdt_for_each_subnode(node, fit, parent) {
-+		ret = fdt_check_no_at(fit, node);
-+		if (ret)
-+			return ret;
-+	}
-+
-+	return 0;
-+}
-+
- int fit_check_format(const void *fit, ulong size)
- {
- 	int ret;
-@@ -1589,10 +1617,27 @@ int fit_check_format(const void *fit, ulong size)
- 		if (size == IMAGE_SIZE_INVAL)
- 			size = fdt_totalsize(fit);
- 		ret = fdt_check_full(fit, size);
-+		if (ret)
-+			ret = -EINVAL;
-+
-+		/*
-+		 * U-Boot stopped using unit addressed in 2017. Since libfdt
-+		 * can match nodes ignoring any unit address, signature
-+		 * verification can see the wrong node if one is inserted with
-+		 * the same name as a valid node but with a unit address
-+		 * attached. Protect against this by disallowing unit addresses.
-+		 */
-+		if (!ret && CONFIG_IS_ENABLED(FIT_SIGNATURE)) {
-+			ret = fdt_check_no_at(fit, 0);
- 
-+			if (ret) {
-+				log_debug("FIT check error %d\n", ret);
-+				return ret;
-+			}
-+		}
- 		if (ret) {
- 			log_debug("FIT check error %d\n", ret);
--			return -EINVAL;
-+			return ret;
- 		}
- 	}
- 
-@@ -1955,10 +2000,13 @@ int fit_image_load(bootm_headers_t *images, ulong addr,
- 	printf("## Loading %s from FIT Image at %08lx ...\n", prop_name, addr);
- 
- 	bootstage_mark(bootstage_id + BOOTSTAGE_SUB_FORMAT);
--	if (fit_check_format(fit, IMAGE_SIZE_INVAL)) {
--		printf("Bad FIT %s image format!\n", prop_name);
-+	ret = fit_check_format(fit, IMAGE_SIZE_INVAL);
-+	if (ret) {
-+		printf("Bad FIT %s image format! (err=%d)\n", prop_name, ret);
-+		if (CONFIG_IS_ENABLED(FIT_SIGNATURE) && ret == -EADDRNOTAVAIL)
-+			printf("Signature checking prevents use of unit addresses (@) in nodes\n");
- 		bootstage_error(bootstage_id + BOOTSTAGE_SUB_FORMAT);
--		return -ENOEXEC;
-+		return ret;
- 	}
- 	bootstage_mark(bootstage_id + BOOTSTAGE_SUB_FORMAT_OK);
- 	if (fit_uname) {
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 993478a73b..dbbb9ff145 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,16 +12,9 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "c4fddedc48f336eabc4ce3f74940e6aa372de18c"
+SRCREV = "b46dd116ce03e235f2a7d4843c6278e1da44b5e1"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
-           file://0001-add-valid-fdt-check.patch \
-           file://CVE-2021-27097-1.patch \
-           file://CVE-2021-27097-2.patch \
-           file://CVE-2021-27097-3.patch \
-           file://CVE-2021-27097-4.patch \
-           file://CVE-2021-27138-1.patch \
-           file://CVE-2021-27138-2.patch \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2021.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2021.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2021.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2021.04.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2021.01.bb b/meta/recipes-bsp/u-boot/u-boot_2021.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2021.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2021.04.bb
-- 
2.31.1

