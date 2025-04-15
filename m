Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83443C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 16:45:13 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.114.1744735512724064998
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 09:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XXhoq2ZQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: festevam@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736b98acaadso5326860b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 09:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744735511; x=1745340311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HadNL6vswHt4mRojV1v0TJthms7SnLtqz5l3K98gOug=;
        b=XXhoq2ZQS07+1VsW0zd2E1xfyKR7rnvxDU2hb3xZe6TgyC2C4tSYXpOZ77RKTB86v7
         Cj8fmmOGtgLS1o7h6y4gToOG2b3aNRrpvEw4dIW6f2vv6ZvlgyuigAHxRAmXp4oBksdo
         RbHlikNHkxNJfY6RNaz7CvicL9zfgURxFLRjfjzy56EG820krK4VLBxRdJ+OS2ZRB/D7
         i8ZbV1Wmxq4XuwpVa7GEvX8UR1E8dcGRxq32VACNHCiLeCoq3TeO+0IJZ88K/tEBqPoP
         ICrlAwC+zsqk5dGKT1Sl5kjYSdXN/m0bcGDM+kewq/lKjOSf45ZvoDW8FdSLNb2pzB59
         T3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744735511; x=1745340311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HadNL6vswHt4mRojV1v0TJthms7SnLtqz5l3K98gOug=;
        b=GUUgiAj3fTqwO+bWXppKrijV/6xtSWuzb3IoA7XZl0p/ndix/t06PisRs6eTDOYycG
         0PiQpl3+HOUib5g8zt7uAz9YdOMFMG5Nh++UmpVyi3WkyusYqyxeu3oCwQ7HZxGV04UF
         bHqctaRs/k35xyznGpgyD4d5biE4UwzCKRlslu+DBgPSXYjKYzt/7L203JL0zFoYYprY
         hpb5LFJ6KOMTKXGJGE9HrKjC+DqHGmRJGIk1cruFayqpiiMshwpcHXktj0JfxGQ8PHFO
         alr8SdqKAw4E8ZAN03mNz05y/p53sl4gAbOQGrrCyf+w2Ey5F6CmtUZjDMCLsdt+fpKT
         4OpQ==
X-Gm-Message-State: AOJu0YzRVlb1TRD77duTNWYtK2mxNMouwzSUx8+9NPqzUtCmSncqtyZb
	wwybTGmNltIPqzdnUwGPqakzBGdYVMeBfX8xWhXR73wLqUZ7W0jui2J+YQ==
X-Gm-Gg: ASbGncs8Iw+dy8hLIjZsxBE1zWreLZC4sXQ5u2I9FXFB5VuiIADi6YizV7b60H+kak1
	31/g1hjL8iyOYbHoHZvRU1mR4oQM1YXHzWHSQaRBL4KdPLy3+8NAYr0nqGTDP1ydgRTMDVNG0ab
	cg2Q2b5xtfp1CRERd137vOMo5J9C4LAdpTJP959ymzY28ej945RReurs0lRhE0i0dmpuWEJ+Y5c
	cqjo9S9RigFtCebH6Wj/c/qIHKRngI9udUUjfGo1rTDhoDOS2wNJ2nLoTm21LqS68tuUGQfOu5z
	rEChcrCYyS8vdt3h3kxN0iqILpn5xPHdeXDUWrI3SPRbdbK4wpeZMbfLgOKBs8q1Yg==
X-Google-Smtp-Source: AGHT+IGnFqeB1CCx2isy+dQet0ZouOgKtndELpYCoevF94JDJ+/DqtWJNX7vqRNAk/yGrnd00Zf/ng==
X-Received: by 2002:a05:6a20:3d92:b0:1f5:790c:947 with SMTP id adf61e73a8af0-201797b632dmr24451976637.19.1744735510955;
        Tue, 15 Apr 2025 09:45:10 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:bf07:f4ce:a52a:db16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0dee30asm11344684a12.32.2025.04.15.09.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 09:45:10 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] bmaptool: upgrade 3.8.0 -> 3.9.0
Date: Tue, 15 Apr 2025 13:44:44 -0300
Message-Id: <20250415164444.878070-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 16:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214958

From: Fabio Estevam <festevam@denx.de>

Update to the 3.9.0 version.

This version has switched to use hatch as the build backend, so adjust it
accordingly.

The INSANE_SKIP can now be safely removed as explained by 
commit 824009560776 ("bmaptool: temporarily silence the pep517-backend warning).

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta/recipes-support/bmaptool/bmaptool_git.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/bmaptool/bmaptool_git.bb b/meta/recipes-support/bmaptool/bmaptool_git.bb
index c38f05e1a1..0dac0c7400 100644
--- a/meta/recipes-support/bmaptool/bmaptool_git.bb
+++ b/meta/recipes-support/bmaptool/bmaptool_git.bb
@@ -10,9 +10,9 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/yoctoproject/${BPN};branch=main;protocol=https"
-SRCREV = "2ff5750b8a3e0b36a9993c20e2ea10a07bc62085"
+SRCREV = "618a7316102f6f81faa60537503012a419eafa06"
 S = "${WORKDIR}/git"
-BASEVER = "3.8.0"
+BASEVER = "3.9.0"
 PV = "${BASEVER}+git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
@@ -20,13 +20,10 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 # Need df from coreutils
 RDEPENDS:${PN} = "python3-core python3-compression python3-misc python3-mmap python3-setuptools python3-fcntl python3-six coreutils"
 
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


