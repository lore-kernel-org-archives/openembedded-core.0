Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A317C77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 20:10:15 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.977.1683058206680375926
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 13:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YKvRwdb7;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-30626f4d74aso2323675f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 13:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683058205; x=1685650205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yRKlceKYtLLB139CJqxtZsfugkS3BuC9EbF2OB68RR8=;
        b=YKvRwdb7nH90UPGxZH8ldh3KAPV/ibtGlxa7fMhxyoqi7N5bvl8GDRC24G6gaK66a0
         lNHpP+kdAysQ/v96G0ePemazCotkK1ghDbJPK8hk2aD/t7Q+jaPPMiDWcXazd7ZFXUnE
         Wry6Dlak64q6Fbe5zBTpOop2tbZnUZF/HZJ+S1Gpt73pAG9XwnJ8+ImAqyPIlWq+/c67
         8vDFI4XN0ZItG8fKxrjkLs2avCjzsJnejtgzKdTnwvoDyRbpl7V3wFv5mwYSdeHHtKXt
         UjdKtZyZxRJx1OShnFcOCNLLUtMSsGqH+gtr+lfJbKoAhndSKR6jr66Q5EnGWuIdWqsO
         H6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683058205; x=1685650205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRKlceKYtLLB139CJqxtZsfugkS3BuC9EbF2OB68RR8=;
        b=ZPbCRLf31dzK2m92ymD0A/vVzJofSaV2rUll5Wo/1KJZDZQ+UxLZbs5boMQxHfmWsJ
         28J9vsDFJEuwrc+sQfJmpolaG10podKFJeKbubFsYfuPWN53iGyCekylLPVsrXhOSjkL
         TvlpZ3Z6heuYlkNz78Pfb0qgTdOWi2NT4CKSE9xd6dX8WavlqU5LfLx8by1KnQQRnE5C
         pIh/jFsgdWUbTh2iuSyftYJNMfe8h4w80AKKkuseIYhURHEr9zuO5qDeT6rWidlonTra
         pBj8cIOa8van1nsfbsbCtj42cE6AUNNmWFZMZbhh/ys8DTrLHElAR3CWjfaK4N8M7ka5
         ebsw==
X-Gm-Message-State: AC+VfDwwU6V+NrZkGpnh+62KYsDQOkNbhnruXlbCt6jtwDIStshAnOuO
	9OilAewyz/CWWyfLgGLUKGTCtk31UOQ=
X-Google-Smtp-Source: ACHHUZ4Xq2qKF1YAiiifFurWIcCIITazkN5/WkQyTpzVxOOLN3gbgtPbaBSOT3DULB0mWfcK72PQxQ==
X-Received: by 2002:adf:e70c:0:b0:306:321c:995b with SMTP id c12-20020adfe70c000000b00306321c995bmr4230758wrm.41.1683058204701;
        Tue, 02 May 2023 13:10:04 -0700 (PDT)
Received: from localhost.localdomain ([63.135.72.41])
        by smtp.gmail.com with ESMTPSA id p7-20020a5d48c7000000b00306315583ccsm4836515wrs.41.2023.05.02.13.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 13:10:04 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] libxfixes: Upgrade to v6.0.1
Date: Tue,  2 May 2023 21:10:01 +0100
Message-Id: <20230502201001.7476-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 20:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180769

Changes:
Use tar.xz: upstream has not released bz2.
Update license checksum: minor change in text.
Update sha256sum for new version.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 .../xorg-lib/{libxfixes_6.0.0.bb => libxfixes_6.0.1.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfixes_6.0.0.bb => libxfixes_6.0.1.bb} (71%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb b/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb
similarity index 71%
rename from meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb
rename to meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb
index 018138f11d..28df7bb805 100644
--- a/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb
@@ -6,16 +6,16 @@ provide the minimal server-side support necessary to eliminate problems \
 caused by these workarounds."
 
 require xorg-lib-common.inc
-SRC_URI[sha256sum] = "a7c1a24da53e0b46cac5aea79094b4b2257321c621b258729bc3139149245b4c"
+SRC_URI[sha256sum] = "b695f93cd2499421ab02d22744458e650ccc88c1d4c8130d60200213abc02d58"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3c1ce42c334a6f5cccb0277556a053e0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a5a9755c8921cc7dc08a5cfe4267d0ff"
 
 DEPENDS += "virtual/libx11 xorgproto"
 
 PE = "1"
 
 XORG_PN = "libXfixes"
-XORG_EXT = "tar.bz2"
+XORG_EXT = "tar.xz"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


