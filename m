Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3D5CDB47E
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:28:48 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.95299.1697383727906529758
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 08:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q3uZT+W9;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6b709048d8eso1031402b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 08:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697383727; x=1697988527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pDXjUFl2LhQfYbBJCuUGNu4J50vcO7rIQoJvAenx2IM=;
        b=Q3uZT+W9PtWqiCr/aquM/B6HAS6GJjhwcZtq7hgpK/QYNNkYL9cORfwnbSFELxGHVF
         GWjl/oPQ/08a10FZdHTFjavrdTtecUWa8EYGlMHfUFlC0ZpdpFDR19cnxQtJPah6EQDg
         vur/8s44DtxRwIZcMLe5801KjJOV8hMkr9grla1pJzzl0DyLx6ebmgm5nKvBpW8UhFk1
         e/an1iECu5uBOL9zBsHSnDNN3pmdAKTaJTkidySZM4YfeiG85hRGiGI4m94eLqZVo0VJ
         8Q7Q0YBJjEOU48HsaGmtpOxglz6jQEKiw6Oz2Rs3GzL84vo5NXkNLKg5qOLNWy/z6pf1
         1IWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697383727; x=1697988527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDXjUFl2LhQfYbBJCuUGNu4J50vcO7rIQoJvAenx2IM=;
        b=FvLta9x4jQX5vyK8aBjUzcADra7uj5r+OU5ROC6y7/P2SCmAaPsk9sAaQEKDMkfmvl
         nlMb4zlGfiPc8/zfHG5jTuc7M5GfKtJeVCX20RDoE6q3ono8HJ1v2Rl6Cou2HLGLzI9j
         nrp38OAzB9/LgIaKm9njguFEWCJKUnCa1D5nwgBm2KZoum49UoptyV+1jMJPq6eqnssu
         Q9Cxwvk5r4T+qctN1AtQnub3HVqIIzbf1TLWwC80QK6pqvaSADOsrvdU0zJk9deQoBF0
         m4lTLzEmdxb2ypPEhY5dwZwOeZiPatIZRI1lv/BeS2wOFmXAtDCBqteSCUSXNAVbFtHK
         AsFw==
X-Gm-Message-State: AOJu0YxABnUxO+ZeLFQ3sLgH3pi7ZY3ai93jaxHgBlPeF5zcAU+r58ch
	wuUqxbK7i0DlPsUVHt4IwOJb3tlEhcpY2Q==
X-Google-Smtp-Source: AGHT+IGNE3WC4mmZ5Qh6I9SqhEBV5O1yIwpAOMV6Hj1loCvmd5l5py6BIcG1RwEpFSPR4TxqQ+GNKQ==
X-Received: by 2002:a05:6a21:3390:b0:16b:abad:87c5 with SMTP id yy16-20020a056a21339000b0016babad87c5mr24673443pzb.10.1697383726982;
        Sun, 15 Oct 2023 08:28:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::27bb])
        by smtp.gmail.com with ESMTPSA id 14-20020a17090a19ce00b002630c9d78aasm3498125pjj.5.2023.10.15.08.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 08:28:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-urllib3: Update to 2.0.6
Date: Sun, 15 Oct 2023 08:28:44 -0700
Message-ID: <20231015152844.2574302-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 15:28:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189157

Only changes in this release [1] fixes CVE-2023-43804 [2] on top of 2.0.5

[1] https://github.com/urllib3/urllib3/commit/644124ecd0b6e417c527191f866daa05a5a2056d
[2] https://github.com/advisories/GHSA-v845-jxx5-vc9f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-urllib3_2.0.5.bb => python3-urllib3_2.0.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.0.5.bb => python3-urllib3_2.0.6.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.0.5.bb b/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_2.0.5.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.0.6.bb
index 9c15791d34e..cd2a9dd4ef1 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.0.5.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "13abf37382ea2ce6fb744d4dad67838eec857c9f4f57009891805e0b5e123594"
+SRC_URI[sha256sum] = "b19e1a85d206b56d7df1d5e683df4a7725252a964e3993648dd0fb5a1c157564"
 
 inherit pypi python_hatchling
 
-- 
2.42.0


