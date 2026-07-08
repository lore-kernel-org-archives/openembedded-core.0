Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6556DC43602
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:56:53 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4856.1783504611406189201
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U9mZhJH6;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3811f512167so612175a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 02:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783504611; x=1784109411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TLj0LtmMWX2ges6bKfqaBGL2etah+ve+FxbS36tdRFA=;
        b=U9mZhJH6ZoiYzDHgMt9KM5mwsaBwQHwfEnzN7Kr6Td2KvGwdv5d5TEwoTQylNk0p28
         BgFDSpayaMOlE43D4rHiK1vszpsIeEKU5ga0PNXxyhjeKzHUtTiaOztME4fmUuO0EzsL
         b2oSQAgUwXIirohHmV7IFOHnj0zcSFfYZUcZqQX877B2cFdqQHJpyMWFi9ExFw1Rhm0y
         zy0UPcgzRnYfRAFv1Di8WaVjhYiKnT0ZLwKPbBofowSoJcCujON8fYhDlvjtK1T5nYY7
         bYI10duVvp6dmLlZ0vUcBfOaErZ4LD65Zfvo5EQcOCHTuDNqPeuZOlnyKtV2iW/Kg+n1
         hMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504611; x=1784109411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLj0LtmMWX2ges6bKfqaBGL2etah+ve+FxbS36tdRFA=;
        b=Udd2QoNXkSdjBLPZmclrccW9YZ7ldacHnMocaNUe4D8I3WSgJy00baCmjyt4u/fiHS
         ZDfACJ3BUromUITryf63mVO11UidOV8sTnOSie6TmNEy3ctMF5SO2XbnYblrG8jq2VB7
         lSMe39Z/7kkhNxPtXjulcb4MbntMiNmz4YCzgPc6ePPU+3CJWKbgsxm3QkPLaYUCRQ33
         aWY5iXhYrKM2t8lvd/pcJWgdKwBwVuxBf4R50G8POX7IoHaNTplTs8su01EAW6PqnBm8
         nbaLOaGFKbS5sYs4iuD2H7t2OMs7yWC27737TT9ih3ONSFe6myBXlMFKzwN3yZPSJbbp
         RrQA==
X-Gm-Message-State: AOJu0Yw2cTXHfGNFxSX6PVB6bUb271f0mRHiM6rOgrT2sB31VubeoLgm
	FMvv20max9kV7RXwLDCyr+UJj6/xY0ZM6PpFTF9qY7LJNatv/aI3iUifFe+5dA==
X-Gm-Gg: AfdE7ckjg65f/sGYMY1EkpvvMsbdAqHy8LSBn3jggbPNOIMNbNKF9YCxio+NOcS3eiI
	ItBTVP6zkg4bZDvqk+XEmk0KdJRtWd2O9Ov46Ozh5InvMQdVLV8NrJNxDioS0aiE6iXG0AqNA/f
	2kzfPvOb6qQrNQZoDhkE5eEfwDSmIudQ0zqds1kvL3N5o2lsd9mwc47XBqXdgDLPA16oMnVMYlf
	SC+l0IEEH0dJ5SxlF8yTkAl2/EwMUE593P4Hio5spRW0UGsNWaIY+6cI77wOoJzcYWBWVJVK73d
	iEDfsU5maJepyUMeVKHTzYRK2SX9tJ5ANGSyT1XIPmFa4v4pEaNFO4xUyhbKIT7pXVUmyWshodp
	RK2cIqUGDfKvv5WG+NMNpdc2l6oCC2jEtQ7QfhwJHINcQlCyxLg0tCekOVFE6UzEx/sE6aYPjhA
	pxxvEM+fMPSHrcsZBdNx1UX2nfiXAP0w==
X-Received: by 2002:a05:6a20:7287:b0:3bf:9fe1:c27 with SMTP id adf61e73a8af0-3c0bce9cc2emr2082000637.40.1783504610536;
        Wed, 08 Jul 2026 02:56:50 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:12b:e084:b12d:799f:5636:b5bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c4ddsm20036214c88.1.2026.07.08.02.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:56:50 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [PATCH] package.bbclass: add PACKAGE_POSTPROCESS_FUNCS hook
Date: Wed,  8 Jul 2026 15:26:02 +0530
Message-ID: <20260708095602.12427-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 09:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240454

This patch hardcode the emit_pkgdata to run last and adds a new hook
PACKAGE_POSTPROCESS_FUNCS to package.bbclass which

PACKAGE_PREPROCESS_FUNCS comes in picture before the per-package file split,
so at that point the final file lists are not yet available.
There is no existing hook that fires after the split with the ability to still
modify package scripts postinst

One of use case driving this patch is SELinux context labeling
There can be other user defined usage if the hook is available

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta/classes-global/package.bbclass | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 30accaeaa9..c53b5c2d3d 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -460,6 +460,7 @@ def gen_packagevar(d, pkgvars="PACKAGEVARS"):
 
 # Functions for setting up PKGD
 PACKAGE_PREPROCESS_FUNCS ?= ""
+PACKAGE_POSTPROCESS_FUNCS ?= ""
 # Functions which split PKGD up into separate packages
 PACKAGESPLITFUNCS ?= " \
                 package_do_split_locales \
@@ -472,8 +473,7 @@ PACKAGEFUNCS += " \
                 package_do_shlibs \
                 package_do_pkgconfig \
                 read_shlibdeps \
-                package_depchains \
-                emit_pkgdata"
+                package_depchains"
 
 python do_package () {
     # Change the following version to cause sstate to invalidate the package
@@ -564,14 +564,24 @@ python do_package () {
             for file in files:
                 pkgfiles[pkg].append(walkroot + os.sep + file)
 
+    #
+    # We want emit_pkgdata to run last, after everything
+    # This is becuase any layer which adds its custom function
+    # to PACKAGEFUNCS using +=  would get executed after emit_pkgdata
+    #
     for f in (d.getVar('PACKAGEFUNCS') or '').split():
         bb.build.exec_func(f, d)
 
+    for f in (d.getVar('PACKAGE_POSTPROCESS_FUNCS') or '').split():
+        bb.build.exec_func(f, d)
+
+    bb.build.exec_func("emit_pkgdata", d)
+
     oe.qa.exit_if_errors(d)
 }
 
 do_package[dirs] = "${SHLIBSWORKDIR} ${D}"
-do_package[vardeps] += "${PACKAGE_PREPROCESS_FUNCS} ${PACKAGESPLITFUNCS} ${PACKAGEFUNCS} ${@gen_packagevar(d)}"
+do_package[vardeps] += "${PACKAGE_PREPROCESS_FUNCS} ${PACKAGESPLITFUNCS} ${PACKAGEFUNCS} ${PACKAGE_POSTPROCESS_FUNCS} ${@gen_packagevar(d)}"
 addtask package after do_install
 
 SSTATETASKS += "do_package"
-- 
2.43.0


