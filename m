Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9644.1795748778100826955
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 19:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jQqRWNMu;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso10319181c88.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 19:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748777; x=1796353577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Co6qAIIJbbr4zrZkRpk+td4FcQu+oaf840OF5U9tapQ=;
        b=jQqRWNMuqrUSlkCrNkQ3UO0hikk1h6b36CZuPDFUZWWGZ/aut0vay9WtwBXoSynu7B
         aqvcB1X4yF8FrV+KS0z5DW4bx5AS8XMx6TCVQeTDRJOqpoLN7Mxa97l81PeRKFAlPEb4
         9c0R3rzr3BjoKpnCVL8eQRfxVGbUOYufDU1RoOcRnJQ0mZhyANBi9ouml6G0rujiOp8W
         Njw4K/eGz9oSznaOwZT9QYGsqGkwuhrlVUNH+aYXYJufgbFhOrRvz1dmSPpjAjcSN/sY
         eLbPrFYs72+lREzBxBXWmNXT5dIaJaxk5LcWeSsgzTgmBqz3sZsyiRF+g7MtNFfGXRSa
         Pnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748777; x=1796353577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Co6qAIIJbbr4zrZkRpk+td4FcQu+oaf840OF5U9tapQ=;
        b=DM0llQkZXzaGfma8hCjw6DDSOJVgMFCmoknu41rpg4YPbW37BhqDe4OBy7UaXDgshX
         zv52Icw2cXTA2hCL4HgeEcTN6N60NnBjgqGi8oqkaLDL/E1IgL0dyXB/TK4kh0XHtWVH
         yVpSQZJF9Z8BOk4Z8GSQKTciTH/Ai48CG4cJAHA+bAPoPAhBXyWFDwEeAGc5/c+u7mQI
         3rhCR6K5PFFJtXZXVS+eExhu886STwY19LDd8HA0iHBH5ZfGX4YFl9CxqlFS1MVepCDI
         Z5AWNHozULKOnj/s41ufmyBlFrIogcoqEVunewZItiDXmRyaItlPo+sioFhCKtp+Sp7a
         AprA==
X-Gm-Message-State: APuU4Z8o0aDM1pO/gX57QjT50QJ5sdmc29P2aodYDd9GUeVGSKRcnV0V
	wd5ZvNoUYGwvYH6Iq3BkMULh/HMLwyFrZPrKqy5kJUARSnmGP8r30BjUFf1Oy5Er
X-Gm-Gg: AZFdTZdJCGrpD3xcE2pXqCI8qd1n6rND5PWeAPalhSHPRO2ZIk42sbdTwLPsLVVN4nj
	yhwrVWpXkqLoKxBOy+/X+KW6pPttot2AzFcQiLMDgauGfBfpGv0aaMdz5vNIRu3jWGO7N59VMhO
	00Usz6SgZed41wcjFEY9DNlfzY0oPLvLIsNNRG+SsFsBd0xCOD4EFzFszYZSFzClXVdQeC239uR
	gbqlfpQsyd7xlllTgDtGT8VOGASkkYe2iesKxYOG8YRnTiKeSRyDVGINAZT5aRaKk+1EvEqZnKN
	wR+Uf0WB6beCyq33+o/dro7eu1Hsdlg7LWqj7THwEHInxPiVXrOXO7UylNshYPAwqI9nsjF3je4
	VLJPjfoBpf4uI2wkT0GwNebLdAN1kXJ66DSnngiX3UhgelmH79emh0pi1gCL43hY2p8m5LGLMED
	1jsZtM6d88OatFpTIg13b25c6M6Gbj2TZHjTUE/OBRWYWJDvQMolAKF5i/W55z4p8+xs5Mnoqjy
	9NOs2ha6FsoFFPUqlhUFHp+L8uNeDQ73CUKyZbtwRW3yJfHqcfmkkwtlfdDZLMjzbQJ3VloUr0I
	MrypNbxniMhOa1fwC36C/uMqiJYoxe+7U7GKz3bxaa2dytUcY/lxoXraEVS2GxA8mcOsJo94AzM
	DOu8FIJuOtVcvyp711lx69y0EM47nlQbkGs2pRvUAbwSS2L6GYyfwlBYu4X679+sXDhrmoLHsqF
	9ZfgNlH/b809eCLK6J5L+JubOhRP7Pbz25UpkABpwwscmgM/oWWHvOBSsZHypf94i0gbsiP+ocN
	2JcucC6rGXcFdh1JakuFHtMCjLZfp4vnxaWSRehUthrt0G0VRV4mKAUAvn+9jtlkS9uxouYpju8
	eWMM
X-Received: by 2002:a05:7022:f907:b0:1b2:558a:d781 with SMTP id a92af1059eb24-1b5567b5788mr20246277c88.5.1795748777130;
        Thu, 26 Nov 2026 19:06:17 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm60119828c88.6.2026.11.26.19.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:06:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] python3-cffi: Add clang to the ptest dependencies with clang toolchain
Date: Thu, 26 Nov 2026 19:06:14 -0800
Message-ID: <20261127030614.3102907-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 03:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251339
Content-Type: text/plain; charset="utf-8"

The ptests compile C code with the compiler that the target python3
sysconfig names. With TOOLCHAIN = "clang" that is ${TARGET_PREFIX}clang,
which the image does not have, since the ptest only pulls in
gcc-symlinks:

  FileNotFoundError: [Errno 2] No such file or directory: 'x86_64-yoe-linux-clang'

Add clang for the clang toolchain, as packagegroup-core-buildessential
does.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-devtools/python/python3-cffi_2.1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-cffi_2.1.1.bb b/meta/recipes-devtools/python/python3-cffi_2.1.1.bb
index 6166d644b4..919d4e8cf0 100644
--- a/meta/recipes-devtools/python/python3-cffi_2.1.1.bb
+++ b/meta/recipes-devtools/python/python3-cffi_2.1.1.bb
@@ -32,6 +32,7 @@ RDEPENDS:${PN}-ptest += " \
     gcc-symlinks \
     g++-symlinks \
 "
+RDEPENDS:${PN}-ptest:append:toolchain-clang = " clang"
 
 INSANE_SKIP:${PN}-ptest = "dev-deps"
 
