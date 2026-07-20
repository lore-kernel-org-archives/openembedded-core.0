Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73411C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 20:57:49 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8104.1784581064453497863
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 13:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r4SiYja4;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6a38d83a480so1834150eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 13:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784581063; x=1785185863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BSuHXxPgIsfzSD97RfgUGYUXRAmVatVUsbkRi1wN3mo=;
        b=r4SiYja407Nhtnsrx44IoTJWxwrAL82a7+3DFBtJT43Gaf4UO3Hku52ebWA87DTllk
         Z8zgjKoA+ZRl7TinwJGIVyplRV3Kw5paN5mpeqE2e2Ny7radKIe2blDAG4eRzTrx7QY/
         Jb6FZEMjMpU1EOk1aVXl29rnt98agiie4K9alC5peUoraywCbCvjJnbIkZ0F2j5BGQEg
         M+uw28wq1iliUXkFDj83b3J9dwWxbq/qRZR3cbcR6FttxaR93/oWHAJWSDHH5NLpCrCb
         x2yu+X8WTtA4MoAv5xSJBjrYJkqBXidXgomCaAgR5xkKL/xGbfPLGQ2KjqphluMm8u1j
         MUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784581063; x=1785185863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BSuHXxPgIsfzSD97RfgUGYUXRAmVatVUsbkRi1wN3mo=;
        b=EsoaA6wukuRyg2TXhvBGMS8X5/OcTi+sPt+CO6URQgn4VMYKemm6qBid69UF3JeDOH
         scrWZYIiPXmyBvTfnVomR1nXgoTdl8LfEy9CylxI4YOotGRJEpcpWlIgSsxALgHBp9RL
         /Q3i4gaW45iY4ASvwtLNUs3kF+5fbfMiF344ZExIXHCRH+QcaNPRAnc8+574MM1OZVtz
         tGLwEz4ee88JS0D8yin6kMa+5szaukstcgV74ftF/OisrPO2ye9e0Esenj2fFiSU9rl8
         48AE+RE4HEnfOIVfDKecJKfyGQoHkJCY8m1Y8TjbGRPauS3qydyECVY7ynIH1OV0yzOF
         UeBA==
X-Gm-Message-State: AOJu0Yz1PXMuIXjZ4sfj6Qmk5peCM1vvbHUZHoGhBcaOgVBfY2u6fhh8
	N1GnPV3cPsoZcmFOezx4gazby/E43LEL2/9imdTqMHjy19xZSOskLQIh257r2g==
X-Gm-Gg: AfdE7cnKNoZFxobaiqbtMCC6pv5ZyphRYAmdIyuef/MVTuTkmt/DLr5OutIKdhSUQji
	+PAqNaRDiF06VvEjw2btWl0VIfyBBDxGjcx9OCOzq5/+TPTtHq2UlMn5LNr2j+kLPtj3VkWqI9n
	ylzcyH2YsaYLHniDoA2WQAU0mDl1MgPJaGkf9PNbqeWxyTBfJetTeAaHsOxn1M3DpDpaz9Sptsf
	cLc18+r/xbnw3GvlDtP4rkWB0tMvtpmIDPOFL/Rt9Wa5butf2o3RBK59O9R4cF/JAOd/XuzIlb2
	GLEcvaxjYPOGW3w3Y4e54N3z2lMbafONEzPQAOq/sFX2phHa6ad3bCQDgAkHPdAwLTI0oDWbBV2
	PUX04PfcIviY6OJbgJB8yAw2uzlDCk4Ug86bYmL9o3Wisgt7dQTaAhvtb0SKbvZB9M4Gp6ry9f1
	8gGj9mQeAomg==
X-Received: by 2002:a05:6820:1629:b0:6a1:7c3e:f62a with SMTP id 006d021491bc7-6a51d57421amr7428832eaf.12.1784581063602;
        Mon, 20 Jul 2026 13:57:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::a8bd])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4568e6a91eesm9914672fac.13.2026.07.20.13.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:57:43 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] documentation: Update documentation for SPDX License expressions
Date: Mon, 20 Jul 2026 14:57:40 -0600
Message-ID: <20260720205740.2778448-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 20:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241491

Updates the variable documentation to indicate that they now deal with
SPDX License identifier and expressions.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/documentation.conf | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 842cf31739..1a6ec8fdd5 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -214,7 +214,8 @@ IMAGE_ROOTFS_EXTRA_SPACE[doc] = "Defines additional free disk space created in t
 IMAGE_ROOTFS_MAXSIZE[doc] = "Defines the maximum size in Kbytes for the generated image."
 IMAGE_ROOTFS_SIZE[doc] = "Defines the size in Kbytes for the generated image."
 IMAGE_TYPES[doc] = "Specifies the complete list of supported image types by default."
-INCOMPATIBLE_LICENSE[doc] = "Specifies a space-separated list of license names (as they would appear in LICENSE) that should be excluded from the build. Wildcard is supported, such as '*GPL-3.0*'"
+INCOMPATIBLE_LICENSE[doc] = "Specifies a space-separated list of SPDX Licenses or SPDX Exceptions (as they would appear in LICENSE) that should be excluded from the build. Wildcard is supported, such as '*GPL-3.0*'"
+INCOMPATIBLE_LICENSE_EXCEPTIONS[doc] = "Specifies a space-separated list of SPDX Licenses or SPDX Exceptions (as they would appear in LICENSE) that should be allowed in the build, even if they would otherwise match INCOMPATIBLE_LICENSE"
 INHIBIT_DEFAULT_DEPS[doc] = "Prevents the default dependencies, namely the C compiler and standard C library (libc), from being added to DEPENDS."
 INHIBIT_PACKAGE_STRIP[doc] = "If set to "1", causes the build to not strip binaries in resulting packages."
 INHERIT[doc] = "Causes the named class to be inherited at this point during parsing. The variable is only valid in configuration files."
@@ -254,7 +255,7 @@ LAYERDIR[doc] = "When used inside the layer.conf configuration file, this variab
 LAYERVERSION[doc] = "Optionally specifies the version of a layer as a single number. This variable is used in the conf/layer.conf file and must be suffixed with the name of the specific layer."
 LEAD_SONAME[doc] = "Specifies the lead (or primary) compiled library file (.so) that the debian class applies its naming policy to given a recipe that packages multiple libraries."
 LIC_FILES_CHKSUM[doc] = "Checksums of the license text in the recipe source code."
-LICENSE[doc] = "The list of source licenses for the recipe. Logical operators '&' or '|' and parentheses can be used."
+LICENSE[doc] = "The source license for the recipe as a SPDX License expression"
 LICENSE_FLAGS[doc] = "List of commercial or other special licensing terms which must be explicitly approved through LICENSE_FLAGS_ACCEPTED."
 LICENSE_FLAGS_ACCEPTED[doc] = "List of accepted licensing terms matching LICENSE_FLAGS."
 LICENSE_FLAGS_DETAILS[doc] = "Gives more details about a specific license found in LICENSE_FLAGS."
-- 
2.54.0


