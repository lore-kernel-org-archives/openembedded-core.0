Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8803C87FD2
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 14:04:49 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.23051.1754661882182955890
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 07:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cnJwetLa;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-af967835d0aso319301866b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 07:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754661880; x=1755266680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O7TOUl08/P5OR8ToLTUa7WGUbDmZAT87SSlbl+xuyrs=;
        b=cnJwetLat1KWcvTPthURlhGAKKN5QaMpLTWXhHvvSey3mtGkvB9Lg5w4S4KuaUtmuI
         enOmqZOtc63/hReBAlwqom7Fhipz2avjprD/MXzTxSl2jiBb0gSZrC3xP31iTq+7paFW
         7AYH8ep6/+i0C0WRAzxUwOirJa+uH6MhXjbcM7zJzVs8x4SYs+sTDJx7YNkyg0uuQIFY
         SmcPwpeWXm54euroW0PBhYKfWXXNlz8IIhG5IbTl3aQ1yo1rGyoG+nZSdYb9ZjETjH0W
         /uQ9sU4yc66DphYIuIq5z5CMOCC4XBM/DP6jwV9VRZGeLddeGsvzKKueJYXnjO6eKXsi
         sJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754661880; x=1755266680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O7TOUl08/P5OR8ToLTUa7WGUbDmZAT87SSlbl+xuyrs=;
        b=gpdgdK1Ny9IodmTyfTSZ60p/iq4Rqu2mWSkyR/ZFqDHUxGV3SBbAdEfpNarWl0QBNu
         2iW4psWNN2DywFFmVNl9iFQ0TY/2iGbPjOa3j/QvFrpeo+rI/CFRY6AMrqwKDR6dhnEj
         SofP1jRk08VM7BK5NvNXGbAKONJjcU8mJIa6N6wxhiQPudvKL/4P191Nuskifko1Krog
         qkIf0LOgVaP6tFqePeixdGb1pKaRWHOOH80sCbOxfOKtRUkkYXWuI2MrtvEkhvRD3ld8
         VvKALSlHveAjj34xxMx4YPgzETA34EDSzuQ5D5vyyTQd8PAmLOrSSxXUkEq9YkWwnQsF
         U+Bg==
X-Gm-Message-State: AOJu0YywlEq/8wvq0n4fy+FuCQSBjPX65dJG2n037aqiUuqAA+Y/Jika
	8LCY0Lx9kePWlhLAsM5t356kyA4smQbxofRva18rYYrjCo/nbfLUW+xcNI8Pdw==
X-Gm-Gg: ASbGncuboSd34owheXmhh7HwtDMrpmGkziOt4GRVT6VaDS3RlH6HEg1MS7/vK/nF/Fy
	xTkMGWTU3Cq2zi9Ee3+U7oEXYAlrWFCW54x1UPH5NbkoPGLkbnvtAEzkPtgJ65Y4ts3CL++oGkJ
	TjEzPVSfTT7Tu7iIvEcpNwCpCPt3xhJGgodw7kPGb74FZ8ZxchavamoJCO+Q+5tipczdUYttBBu
	SpgFn7ICNBRGPKwl9q63toh17BQIIH9FSNPRBxy8C+boMj991K1CZ/5D04aKzK5EJD4O4gN2SSs
	1ci+1FLkQxsNelwOU4Iy8l3kOC82oULoWDH46egZa6L9ojo8UltmNjF3K+uo3OIBPcBD1SHcP7U
	J+KJB1Z54trHLiWCz5URuLWoQIy8fGA==
X-Google-Smtp-Source: AGHT+IHXBldQQS3SVU+ZgnqM6qqEmwFOG+0c9R08BA5/pVgG5j4m7YDOnY5wjAWVYU0BqEWKAjvbtQ==
X-Received: by 2002:a17:907:e98a:b0:af9:24e7:1c85 with SMTP id a640c23a62f3a-af9c64fde5fmr269441266b.55.1754661880294;
        Fri, 08 Aug 2025 07:04:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a076aecsm1490849666b.9.2025.08.08.07.04.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 07:04:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tcf-agent: upgrade 1.8.0 -> 1.9.0
Date: Fri,  8 Aug 2025 16:04:38 +0200
Message-ID: <20250808140438.1260509-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 14:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221654

Changelog:
https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/compare/1.8...1.9

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tcf-agent/{tcf-agent_1.8.0.bb => tcf-agent_1.9.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/tcf-agent/{tcf-agent_1.8.0.bb => tcf-agent_1.9.0.bb} (96%)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
similarity index 96%
rename from meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb
rename to meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
index f008c0c6de..132b3d7dee 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
@@ -6,10 +6,10 @@ BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 LICENSE = "EPL-1.0 | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
-SRCREV = "1f11747e83ebf4f53e8d17f430136f92ec378709"
+SRCREV = "9076423f959d53aafa4000d6bb8bf2a1485971b9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI = "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=https;branch=master \
+SRC_URI = "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=https;branch=master;tag=${PV} \
            file://ldflags.patch \
            file://tcf-agent.init \
            file://tcf-agent.service \

