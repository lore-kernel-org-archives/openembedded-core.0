Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84700C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 17:51:57 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.787.1744739508189518595
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 10:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PzhsJDNv;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2243803b776so86722215ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 10:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744739507; x=1745344307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6TomEinwLbxZ1dK/vO7kVfm55m19RYl2L7ESF0e5Jak=;
        b=PzhsJDNvpBSjO/uJ8ySuthXWoaqPhAjWAbXZeKaLXt7T4dCTHaj7ss1YdVENkvvV77
         KG3wZDVI/B/M1YfnBxm3z/rM3rj/gesqKvdgKPfH6uSx6sJKQDBHEJZEK+hHpGLpYpE5
         rOLZP8tjiu1mheCiKV+3rWXmux1SXKMPfU8GSOA11mG6I35+ccVuoFLEJ+F7xPsq/+Zs
         F7T/Ebv8fFl6TqeDQdeWvsLK8VJu6PE6o3qDL/TgX8Jy92DrLFfusvIx4f+gyPB6QGLw
         /yI+h1JeJ7XlLGcXPxXpd9MvK+HLUpjb5cyJtX8OQsReZXPG1yhqSNxWUhQlItHdwwa0
         y64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744739507; x=1745344307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6TomEinwLbxZ1dK/vO7kVfm55m19RYl2L7ESF0e5Jak=;
        b=Er3QT8VKmBOs8mEC8V3KaLq2pHbxRSrQgy0aql99uhnZtO9M4hBXa74FvNMAzGOJBY
         7vTvOEdaIxFRpplzwBk9+sQBM5Hk6d9l++ZrAJv87vIuHsz6ZFWeky/5LRYLCauz6nTX
         FjKLX7aNpWmfeIBnmk2Z23XKt7unT9ibLWZ5wlXQERW3DutFaOh+wXMVduH8TznuPquQ
         eojyX7yJOd8FUhEW3Syn+bAccNyUf7kxBGfIY759KEzMcylFvO7VRWYyiHNP1ffJ1+3K
         dsF+glM+IiISg7Z/ht1EARV3a9wFQWQ9LhwfOaGq5wsu2gmKqcEYDNc73AJrHFybNtMM
         WprA==
X-Gm-Message-State: AOJu0YzWt7d5TRr+S/lNBz7G0umLWOdM9la7+77jM7njerEXM03dC+2S
	p39xmGcO9XQwOl79Jo4E2V2oMjit3YgUu7H5MlwcAJVDpYcaqBDyoIEXCQ==
X-Gm-Gg: ASbGncuK/XiED7CjLVgR/E4hFJ5Xu2HjzUZEzffVKJKzoLBaplMYMyX4cBzFuCpvOIW
	vdDJIjAigbpDu6bZITyxVGPJySikl+/2JpZF881w3iaxQB/ifu3zpWqydZGz5jUvt0QpEeTBKGz
	95e5X2au0TSwFOQdDiRwGhrI8/SE457fDOx1v9zFfS1gl3UFEDXv5RAmSwFNV5gWcEXwH6l3GU3
	+dkD5u12xsdU1JMyBRJOZT3zbmO5GrCRKy8dReqmcl+4HpCcmIVobxCIQNFkvVkSQdl0YdRalyv
	phKixdXi6453cyU9JFnlwWVErr6cO5Ws26WxBDSyTx6v8RYxWKIgdBk=
X-Google-Smtp-Source: AGHT+IGpR2pFOJ4Bht+5UmUS8nPSznKbGKAQ+BA/2B5RP/so9r/kj2PTbG63aHXDbkHQye/FcerVog==
X-Received: by 2002:a17:902:dac7:b0:224:76f:9e44 with SMTP id d9443c01a7336-22c318a9dd2mr1023185ad.8.1744739506504;
        Tue, 15 Apr 2025 10:51:46 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:bf07:f4ce:a52a:db16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b2b6sm119697115ad.65.2025.04.15.10.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:51:46 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] bmaptool: upgrade 3.8.0 -> 3.9.0
Date: Tue, 15 Apr 2025 14:51:30 -0300
Message-Id: <20250415175130.887427-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 17:51:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214959

From: Fabio Estevam <festevam@denx.de>

Update to the 3.9.0 version.

This version has switched to use hatch as the build backend, so adjust it
accordingly.

The INSANE_SKIP can now be safely removed as explained by
commit 824009560776 ("bmaptool: temporarily silence the pep517-backend warning).

python3-six is no longer a runtime dependency since bmap 
commit a67976e80daf (""Remove six from production code), so remove its
RDEPENDS entry.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Remove python3-six from RDEPENDS.

 meta/recipes-support/bmaptool/bmaptool_git.bb | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/bmaptool/bmaptool_git.bb b/meta/recipes-support/bmaptool/bmaptool_git.bb
index c38f05e1a1..155dd0ac80 100644
--- a/meta/recipes-support/bmaptool/bmaptool_git.bb
+++ b/meta/recipes-support/bmaptool/bmaptool_git.bb
@@ -10,23 +10,20 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/yoctoproject/${BPN};branch=main;protocol=https"
-SRCREV = "2ff5750b8a3e0b36a9993c20e2ea10a07bc62085"
+SRCREV = "618a7316102f6f81faa60537503012a419eafa06"
 S = "${WORKDIR}/git"
-BASEVER = "3.8.0"
+BASEVER = "3.9.0"
 PV = "${BASEVER}+git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 # Need df from coreutils
-RDEPENDS:${PN} = "python3-core python3-compression python3-misc python3-mmap python3-setuptools python3-fcntl python3-six coreutils"
+RDEPENDS:${PN} = "python3-core python3-compression python3-misc python3-mmap python3-setuptools python3-fcntl coreutils"
 
-inherit setuptools3
+inherit python_hatchling
 
 # For compatibility with layers before scarthgap
 RREPLACES:${PN} = "bmap-tools"
 RCONFLICTS:${PN} = "bmap-tools"
 
-# Poetry backend appears incomplete, upstream has moved to hatch
-INSANE_SKIP = "pep517-backend"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.40.1


