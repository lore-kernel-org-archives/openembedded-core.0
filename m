Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16805C433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 20:15:53 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.14156.1645301752239516961
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XLEY3QAs;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso10954317wme.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VJxr4/qTOh4goacKcAb9fbQl0kspJueycgg8XLMH2zM=;
        b=XLEY3QAsRRoiN8cripSYN2AGgxCmLCn9xBnlosK7iMTLvv2vtT7DyCx9MRt+y5SDAM
         /YkxOt412JSeenJJV1AHjjsEaN60QX9CAxYco+yCbLYwYzm4ulzkoOkL4SbvInNx2gj5
         ipV2WI0sulz8nWQKjEoP5diM9x4fASlAkBAAaZFej17xUokk9TS52qBvQEYLKk6X0tP3
         jo4MSoJdbFQYaXcJeY8KmDZCd9ObEnmlA7es9t/mkIC+2vsWKNmIQpOR/c6EyjMZWzHx
         AykuSAX6LFaMv2CjvHB4zpExdHo8eN82RDwXr7mVSdUG8dAZZexbRJVv34Wb8ODHrVNR
         a+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VJxr4/qTOh4goacKcAb9fbQl0kspJueycgg8XLMH2zM=;
        b=uUNoU1ZrTdq239W+PJF40IOZazMwIh655oiHp/dXCgjgqpEbQgBybbo68oQhA4u+Yx
         JgdUHuFRep0zhr/nhuYQem1I8qDY+WMI5dSSse5+gXaSfmlrAHBznuHOwEeXD+hxFzjV
         s5DX0weFdNI2n7Gu2JPbdbMAK095HiIwOK8O3P4i4OOCEjTKFTeMlRkLrb2CSlMHMz5t
         I1Y3ZILd3U4+9dEtR2SifQtdBmRB6RQNllA1aUGgJn8XAhALzB7uqDbgiVk7QtSN6ogp
         4x+CsYwtCyp9GgzFt5vFaX3iSpwS736CIyMlZPLWKCGijjrqKe5XSPv7btY03BHOxSdk
         1FCA==
X-Gm-Message-State: AOAM5319YyAi7vs8fYu92QwbCwJSK1C7wVGz7NAXXCe5E+N0wpH9HV3P
	mfroFuHttjI2rgQgeowNwG4Rje0MW2k=
X-Google-Smtp-Source: 
 ABdhPJyj41eI2geT/V2ZVvMgJpUZ5eOlEeJnMlsmTYqF/FAU/6Vvp17cZ7vz/j7sYxTTe/dZeRPCrA==
X-Received: by 2002:a7b:c24e:0:b0:37c:4e9:6d03 with SMTP id
 b14-20020a7bc24e000000b0037c04e96d03mr15425626wmj.115.1645301750385;
        Sat, 19 Feb 2022 12:15:50 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c410500b0037bc3e4b526sm3081065wmi.7.2022.02.19.12.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 12:15:49 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [OE-core][hardknott][PATCH 06/12] gstreamer1.0-vaapi: 1.18.5 ->
 1.18.6
Date: Sat, 19 Feb 2022 20:15:08 +0000
Message-Id: <20220219201514.1551306-6-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220219201514.1551306-1-quaresma.jose@gmail.com>
References: <20220219201514.1551306-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 20:15:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161970

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...streamer1.0-vaapi_1.18.5.bb => gstreamer1.0-vaapi_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.5.bb => gstreamer1.0-vaapi_1.18.6.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.6.bb
index 9a68a3fadf..f3255e5554 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "4a460fb95559f41444eb24864ad2d9e37922b6eea941510310319fc3e0ba727b"
+SRC_URI[sha256sum] = "ab6270f1e5e4546fbe6f5ea246d86ca3d196282eb863d46e6cdcc96f867449e0"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.35.1


