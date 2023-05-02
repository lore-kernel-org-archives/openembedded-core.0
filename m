Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10720C77B78
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 21:57:16 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.4149.1683064629185258153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 14:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=SgmJN4sN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f178da21afso29438835e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 14:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683064627; x=1685656627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yq2/i6AXrtCVRRXj5l2jETNhQWhAk8IEMLoBZ3u5pQ0=;
        b=SgmJN4sNp7XQM51YUv+sWgOeCul5zxzJlNIY4qTIIV3etq12oH8Z7EPzvMZ36BNT3Z
         Y3YPr4l5Qc/lEcbijuOrovwv+OhPkQsNPzm8bZgal/++k3GXcNSx/85PlsWwADIc3Bb1
         aMp5e85vxo+P3hGAwb69/67iCEXj02r9/qObg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683064627; x=1685656627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yq2/i6AXrtCVRRXj5l2jETNhQWhAk8IEMLoBZ3u5pQ0=;
        b=DDycdWHz7zh3ee5kuAyaXJt/YODJVICQO1/nuyU/XBy1Dhp9T6otTBN6eVSEwweTxY
         qlnEAbKv74TCxQtnv2VpmwZJ1hUgcRKFdqMb3W4mqvdoLr+0VKREW1M1NIdhhgPfEXGI
         cWZbFkP3Tshg6WYwJxudotgNRHq7RwTFwUPzFxQ03dH47CibCQ5MAlHYal0UrVRHXhYx
         FIqrv4xLTjRiuIbaFXaZ/ItqtoLb5vHleiudrqIYv117lBAw7X7kEeEDwzeswL5KWkaf
         P9OVrRp7GTGNH1h6LChGv2P+tmLS0a3Fr52yepkKyKSF+4sUyDS7BLWqUilAs5ZMGe+f
         D1ug==
X-Gm-Message-State: AC+VfDzJqvtGQmVNZTm9WIl4W9Ca/RZgjJOu6+ql4sncFj+6uT7UGrCK
	PRL/JBnkoQTds3JObZyNNY21EyBbm2RifVzq36R/EA==
X-Google-Smtp-Source: ACHHUZ64CXB+6mZdWkZYfsWCyI9OvjYTpqGxrF8AzQSsI4e7VyCjbbYntOWtnQMH8bXB6UF6t7wX5w==
X-Received: by 2002:a7b:c391:0:b0:3f1:9391:46c with SMTP id s17-20020a7bc391000000b003f19391046cmr13578309wmj.30.1683064627493;
        Tue, 02 May 2023 14:57:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b])
        by smtp.gmail.com with ESMTPSA id n3-20020a05600c294300b003f182c11667sm36533361wmd.39.2023.05.02.14.57.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 14:57:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] maintainers.inc: Move apt/dpkg to unassigned
Date: Tue,  2 May 2023 22:57:06 +0100
Message-Id: <20230502215706.2929527-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 21:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180773

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 540683f15b8..cee01ad9642 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -41,7 +41,7 @@ RECIPE_MAINTAINER:pn-alsa-utils = "Michael Opdenacker <michael.opdenacker@bootli
 RECIPE_MAINTAINER:pn-apmd = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-apr = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-apr-util = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-apt = "Aníbal Limón <limon.anibal@gmail.com>"
+RECIPE_MAINTAINER:pn-apt = "Unassigned <unassigned@yoctoproject.org"
 RECIPE_MAINTAINER:pn-argp-standalone = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-asciidoc = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-aspell = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -151,7 +151,7 @@ RECIPE_MAINTAINER:pn-docbook-xml-dtd4 = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dos2unix = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-dosfstools = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-dpkg = "Aníbal Limón <limon.anibal@gmail.com>"
+RECIPE_MAINTAINER:pn-dpkg = "Unassigned <unassigned@yoctoproject.org"
 RECIPE_MAINTAINER:pn-dropbear = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dtc = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-dwarfsrcfiles = "Alexander Kanavin <alex.kanavin@gmail.com>"
-- 
2.39.2


