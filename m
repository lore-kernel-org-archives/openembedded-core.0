Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F51C531C9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 23:09:49 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19819.1785107383160843952
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 16:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Am0CYumO;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so2110285a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 16:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785107382; x=1785712182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jELFdnSYggkbQ8biiOxqtsyoUSqcbUug2dRpTLfCNU=;
        b=Am0CYumOCMy3KoCHMVrZBLsvGpLo+tBwmiXEV58n3/i0kXrNX/T7B+54gGJFBp5gux
         gfHj/9pBPVdqFLCN/cj5PFif38WomSEm5GHgTtjNv6y/+sQFjl5w3ujyoi6LpUKSLaIG
         r5LnYoZjFEOkwa2QAOXfdiANM5q5pRmr+P2V5q2VarsCJ6wZDehHNgnU3xDifRg1JFL6
         /pappgsxn4EOsct6VeCOWxR3e9L6pYkvYlrSeLp6lFLxbu/4lvxOTnkypToWAL7De2bD
         O3YD5T9G8tTICW7pDBQJfEY0hBslQAapRCVIuz8S5EwQm0HxkQ6p8qXMta9ukm3fb2EN
         GfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785107382; x=1785712182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jELFdnSYggkbQ8biiOxqtsyoUSqcbUug2dRpTLfCNU=;
        b=jx6QcJAJt9ukK9wIC2+7uQ46mhrDilpd5jtGnU1x7aHe2uKfSutkhqtWM9GYOBFQ6i
         M/PEN8mSuy+NcaqVYWu09+FdCr0XIOVHzpd/ne8kqcdCxNQVj1u/q0tufDOcCmCu+axA
         Vw/3YO7ZeTfHxy73H0S52LwWBMuHlusLiMLriCTB58rao2PK95cMmG62rz/PvNS15f5n
         cR2v3JNYciPpN75M6VY9vXwQe8yv+bTtHNodLnrAvui/27L8Hr4FpdkVRB66ORM3tCPw
         njJnoN3gtLnt3PLOoM7NkcWZV30fQZ2PmAO62R6tQ/yrTtFUM73o+UfIgBrj8XFCr7fS
         AjsA==
X-Gm-Message-State: AOJu0Yw35gjR6qPbkikfweFFOcDbNtXLn7YIW/RaCX49ToHwerqT2Adt
	GiSUjPenM6jYCNc+4H8Ro5+L+XKBFm75ha+ctMBQ7v/szw/W2ZWnre/PeVRg7DhyYoo=
X-Gm-Gg: AR+sD10qZc0WEiW2GgDmuNr61ucAtXnYRT2PIeYC53LjZl/kNsBsutDOvBQE569rW89
	G5l8i88JoxIhBfpQtru20lGEXkTrQKV5vKK5Ac2wecP6g/XK4Kwi7KVBLugwbSWLUi6cpupmaiQ
	itzAm/NseonNhv9jBMQkw0A13sdjkkW3OL6A1ne41gvDtgBrBg0BiRh6NQvKJHA+dyB14GMQjuj
	Eq67h+hdNgg+KVhJ91kDCOdQHaOBBBIB2YzVW7F3WhykU8YDQj4xTV0BTOWUYV7yujvkv1Vd+D7
	eML5GwFmWw3+tYlC/NKmRXwPfOuwFIR4YlmTxU4P7MF1XT00LxH1iWiLgDjz+X/egHndOTJwoYE
	IoZCbuI8/JcMGE4qnREM70e88D+VfXiYuXcw4DChhbd2erU/v1NREzExahUSqRUIJPxg4syItoJ
	2XZFTZtfpKIfp+wZk=
X-Received: by 2002:a05:6a21:3381:b0:3c3:821e:1f84 with SMTP id adf61e73a8af0-3c67df11405mr7208260637.41.1785107382568;
        Sun, 26 Jul 2026 16:09:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548e63sm24908492eec.19.2026.07.26.16.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 16:09:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 2/2] stress-ng: upgrade 0.21.03 -> 0.21.04
Date: Mon, 27 Jul 2026 11:09:32 +1200
Message-ID: <20260726230932.1400569-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260726230932.1400569-1-ankur.tyagi85@gmail.com>
References: <20260726230932.1400569-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 23:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242028

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Note:
https://github.com/ColinIanKing/stress-ng/releases/tag/V0.21.04

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../stress-ng/{stress-ng_0.21.03.bb => stress-ng_0.21.04.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.21.03.bb => stress-ng_0.21.04.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.21.03.bb b/meta/recipes-extended/stress-ng/stress-ng_0.21.04.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.21.03.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.21.04.bb
index cc563f636f..79717d3018 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.21.03.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.21.04.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV}"
-SRCREV = "f882a7540accdaa38f15474594b7f0339d5f7472"
+SRCREV = "62993352975ec4efbd27ee3627ae6ff776f5cf6c"
 
 DEPENDS = "coreutils-native libbsd"
 

