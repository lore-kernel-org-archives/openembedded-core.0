Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id C22F06C227
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 09:23:57 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id n18so11273206lfh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 01:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iDQWhJYAxZSdEASagvlpaZvCVD/auF4mJSWhlPwPuWA=;
	b=XLimoUI0xlRgxYmrXeaRR6yGtLIGeOMMZDjE3V1v6UlHHID5Ju8WyryKKklhLLfH8G
	Ly3DfrnflAM6B+VAcOvRKOO9OnPVCQqCJUPqan3OkWzF/8To38nBJeOOgQB3WgvASsSK
	45dg6aVwJ3V7fzOak4q1YXjr32YQXvge0Uxz1W7WpP5jyP+puO82+jpMEIokoikYiaKy
	R3SP+UON+qElAL9MLKVD1uarbbDCOvuOCz2GclOK+YdzZg85O61IWAsl2rnlyh1h7LDH
	XyRU3py1K9wjYUcwJizLp4/iio+KK1YmgDN3t8OaUQF2g7kg1twMOVzo7EjJIR0n5UVk
	X95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iDQWhJYAxZSdEASagvlpaZvCVD/auF4mJSWhlPwPuWA=;
	b=bYbseGp40Xm4QUOa8pUuXfnoh3znFtOkbYxyuAYBwC7stWulzniC0CLxPncX2g0ZD4
	rgDB0ez70IdNavc6OuymhPB0fHFacXTZj8TVn5RztnExBp+wDEwtoIiXyUmhY0bOSKjm
	3+Fwa9rAIEFrGt3zBIHfg+jLguATN6176Z9QB1inPO+jlLy5D78fP+OYxxFg/nz2Jsbl
	oAdpl863vNGhwQky6tx0oQXLO3QyIwT+rPPrqQA78WXyOHFwte6+H0vFWDR6OzFZbpw0
	WUxTMRxbuQGmopOj1g1jNbXnAUk37P32gX+JJWL1rwWP0GZdx65wpx29LV1xELoMT2mE
	D5pQ==
X-Gm-Message-State: AJcUukdCmxa1pIewLGZW7Wv6BdFUoNwqU2HiGn8uIC+yP/m0/rNSWCTM
	wYZoo09hGA7NrerqVXquV6x8tsqgz8w=
X-Google-Smtp-Source: ALg8bN42JTxP/5lSfShDUadHSKhe9heV5kMk+bsM6Kl/aEtkLmYib3qcCELjtSiYBmAOW5n6PkeH2g==
X-Received: by 2002:a19:a86:: with SMTP id 128mr16450794lfk.139.1548667437827; 
	Mon, 28 Jan 2019 01:23:57 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	(m77-218-252-226.cust.tele2.se. [77.218.252.226])
	by smtp.gmail.com with ESMTPSA id
	w16-v6sm2966151ljw.11.2019.01.28.01.23.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Jan 2019 01:23:57 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 09:23:50 +0000
Message-Id: <1548667430-2086-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] kernel-fitimage.bbclass: introduce OVERLAY_FDT_DEFAULT_BOOT
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2019 09:23:58 -0000

From: Ming Liu <liu.ming50@gmail.com>

The FDT overlays can be applied to a base DT configuration by setting
this variable.

The FDT overlays set in this variable must be available in
KERNEL_DEVICETREE.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 718162a..71771dc 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -36,11 +36,23 @@ python __anonymous () {
         if d.getVar('UBOOT_SIGN_ENABLE') == "1":
             uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_populate_sysroot' % uboot_pn)
+
+        # Verified any FDT listed in OVERLAY_FDT_DEFAULT_BOOT must be availabe
+        # in KERNEL_DEVICETREE.
+        kernel_devicetree = set((d.getVar('KERNEL_DEVICETREE') or '').split())
+        fdt_default_boot = set((d.getVar('OVERLAY_FDT_DEFAULT_BOOT') or '').split())
+        if fdt_default_boot:
+            missing = set.difference(fdt_default_boot, kernel_devicetree)
+            if missing:
+                bb.fatal("Any FDT set in OVERLAY_FDT_DEFAULT_BOOT must be available in KERNEL_DEVICETREE.")
 }
 
 # Options for the device tree compiler passed to mkimage '-D' feature:
 UBOOT_MKIMAGE_DTCOPTS ??= ""
 
+# FDT Overlay to be set in the default boot configuration
+OVERLAY_FDT_DEFAULT_BOOT ??= ""
+
 #
 # Emit the fitImage ITS header
 #
@@ -291,6 +303,12 @@ fitimage_emit_section_config() {
 
 	if [ "${6}" = "1" ]; then
 		default_line="default = \"conf@${3}\";"
+
+		for dtbo in ${OVERLAY_FDT_DEFAULT_BOOT}; do
+			dbto=$(echo "${dtbo}" | tr '/' '_')
+			dtbos="$dtbos, \"fdt@$dbto\""
+		done
+		fdt_line=$(echo $fdt_line | sed "s/;/$dtbos;/")
 	fi
 
 	cat << EOF >> ${1}
-- 
2.7.4


