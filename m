Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C737CCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 11:16:47 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12527.1762427805390575799
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 03:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GONS7A9y;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2951a817541so10847575ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 03:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762427805; x=1763032605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j7uQcAh3v92rt494CXOeE8Zttw47KYa6ty7EAg2AeiU=;
        b=GONS7A9yy/u11he5Z/PQQXcgX22Aal0RVKW6vAK+GDC416mhBxqlu1oL3ccAvHItzl
         WiOFif3jwqgaBdGiKitwiAN4H9rETvIn8R5sLYIyfBD4rtxN18RSzdXty1UgxmriRGLy
         9n4ocBhPvp6l/+x2x0PSukjYGBFqmr12HLhfU5CK+gQ9plRxLMtgztY3qmLHrnEdI266
         a51nE5NysMerveTPviuhPgzdVO8aP2w0TxTSCwK59EF1Kq8hPjgxwvS6nLWf9JoisyTB
         RkON8C/mW2YttDLd/2KmFYzyFqyfsrx6P4Lgcz9JtC9byCni5/XqPqj74PnRicSAlZBs
         JOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762427805; x=1763032605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7uQcAh3v92rt494CXOeE8Zttw47KYa6ty7EAg2AeiU=;
        b=gUM+McP0zFFgHrNQLrEPzVA5XcXqucH4QMQA4C/xPATJsOuvzvbIlQ87TFnrZPKWoG
         +X3BafXJrBUb7YuKbLAr3pA5velX6G3vFOsEJo8gXzTWulv7+4DDozM4tGkXsd2z9+qk
         lu9t0a9nMqynKIUSyY8yrSal89yDMeJb+bZAbWhdlJ6JkZmgXZKIScAha9yHbP14jMtb
         hCr3PH8LJlO+ZsYkZr794MwyAhcMnTIKKjVh75PRUSSLudFWoTWRyKh/SwyIT0vDbCBx
         1yHdvpwV0lAMBGCJYVOsS47v12JAuA58PWdkowBC7oMeDy9n9xgA03+7GryUIn4SbDjV
         ACkw==
X-Gm-Message-State: AOJu0Yy5FMu+il6sjv0Phln3XaNzZ0w73FrRp2NW2A5PqLgBDdlQpANP
	0Qq5zmmE7+H93+FNNmD736Yggxx7PbPhGFqZGcF0rzIip+6FCECPqdPwdRfLAw==
X-Gm-Gg: ASbGncsvN2L9dkvacjpXu1UhFxs7iBcfLzR+8Z30HZgjRnuw4X0GJl7vIZ+eIPf1HN2
	LM3CHjL1GFCAwqehtvYxcfKidKfqEcYvp16F5ggIBy1AS4sPUyFdrG5s4bIoF2GZFLcapqAGaTJ
	U+ar3JqUeEEmJkWmkuh1myVk7acEQPB61miW3IDtF1dkcwbyDhPpOYenbG3xPcbG+1vNdNZryTb
	LVpYCDWJDok4AoB6Hev9/WbDcEm5ZFlpCLnJp2WVX+Uf4lg0r4n0BkpNOjwzCx5jlBZKr/tZdWw
	TKeSmZ1XRKpRPBF2ZpUPvoK2JqOC04z2InWjTT223NWBtZPx9hE2LcEVEQ3eXy+OSRYQkLOReKw
	hMxCL/rMdbIOSKt+kVuuTBQzmRdUxcilyBXEt8F4jBAU1s95DWsXo5S4T0cEipf/3zRwrnhR9PC
	4jAefxF/RYrCQtCQ==
X-Google-Smtp-Source: AGHT+IEVxPZKIJPbs/WPURR0w9JJrUfaoZ2vTzFSNJaJeZjWtn+dePaaKbjA8cTzICCR8oH9W7CEDw==
X-Received: by 2002:a17:902:e550:b0:258:f033:3ff9 with SMTP id d9443c01a7336-2962adb6444mr101706475ad.48.1762427804551;
        Thu, 06 Nov 2025 03:16:44 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c6f201sm25235425ad.55.2025.11.06.03.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:16:44 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 1/5] python3-markupsafe: upgrade 3.0.2 -> 3.0.3
Date: Fri,  7 Nov 2025 00:16:23 +1300
Message-ID: <20251106111627.1264723-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 11:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225971

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pallets/markupsafe/releases/tag/3.0.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...{python3-markupsafe_3.0.2.bb => python3-markupsafe_3.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_3.0.2.bb => python3-markupsafe_3.0.3.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb b/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
rename to meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
index b90dd84f48..dace235bb8 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "ee55d3edf80167e48ea11a923c7386f4669df67d7994554387f84e7d8b0a2bf0"
+SRC_URI[sha256sum] = "722695808f4b6457b320fdc131280796bdceb04ab50fe1795cd540799ebe1698"
 
 PYPI_PACKAGE = "markupsafe"
 inherit pypi python_setuptools_build_meta ptest-python-pytest

