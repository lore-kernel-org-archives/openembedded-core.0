Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A283C4321E
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:12 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.6552.1635842591854978987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o8r2xa3v;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso1191528wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uii+NVvuRe6UI/O9l9FpbSSfyLKnqtEy/j8JjZ2Cw74=;
        b=o8r2xa3vF57cm659Sdkp9po6ktJkCOGmho7/FiADRR9/D+d+/BKNAnbf+hBg9iNQCJ
         b+UUsXsaZ5roVa4iUdPtuCUXeGNm19CwICyS7PUe9+IkQPvAMIKasytxDMufCJXeXUqQ
         spdHiJjk8L7DvtqzfsDmwvrT22kHt1vVvhX6zf2ezYXLQwLrIyyuKAgNMZhzVnQyYKz7
         nI3oL5qRo3PYzQOmQfeZiLjr9W5g2Q3wbbkKyb7FkhWwAKktz0MWUGBOXwoz5/8XgS9J
         12gu7QFNYpXfryFdUG1z/GUI2jivZM6LFOinT4NvoGSJVcSZ9VdPCCFe5pqOoYquDvpw
         AT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uii+NVvuRe6UI/O9l9FpbSSfyLKnqtEy/j8JjZ2Cw74=;
        b=AV0dRMDhewFQkcuc6TR8SopaE9CoZwWVHudwUUgzhp3OWTbj2wwUCnhr6D5hgTA5Mr
         DVp39CvNa4bZer7H20ArB2K6HEqz+D9g+w6zYOWeynewImgHSM5nZ8pLWZ3rfEThSNuc
         8DR0F/QQU4yIzD2DTKhW4b9pU7LIcNxOP0Wm+oSt6doDGjoJTIRgcySVOEYAVL+IaFPd
         cp6Uo0tlVpQI3qAd3ntr/oQfKsC/7bWRYdDMHDoIqnR2KXBZUHyWMvVwmnlfwYIt2uO1
         s9lWfoUlVlmOKmUeV7e6i9or9buVItF4Vc0AII4OBvetszp3yyHIO8RtpKZC2N4mKO7m
         ed/w==
X-Gm-Message-State: AOAM532jfColDZ8qU9MwzCaV4N7TgkX+zhmwPyKT/SKbwne4WZtvL7iC
	MqSqPENCVL7wU5n4Mlab/c5hJRbQ69M=
X-Google-Smtp-Source: 
 ABdhPJxckRsOQxERHEc9lMlrcK0fd2+HOOow1R+kmlO4RbPy/w7PXLvqizcghwDF4QZj8ll+fdmQhg==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr5383206wmc.126.1635842590436;
        Tue, 02 Nov 2021 01:43:10 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/33] python3-pyparsing: upgrade 3.0.0 -> 3.0.4
Date: Tue,  2 Nov 2021 09:42:39 +0100
Message-Id: <20211102084303.2974802-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157747

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{python3-pyparsing_3.0.0.bb => python3-pyparsing_3.0.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.0.0.bb => python3-pyparsing_3.0.4.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.0.0.bb b/meta/recipes-devtools/python/python3-pyparsing_3.0.4.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyparsing_3.0.0.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.0.4.bb
index f1f6b0df14..a862345e09 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyparsing.wikispaces.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "001cad8d467e7a9248ef9fd513f5c0d39afcbcb9a43684101853bd0ab962e479"
+SRC_URI[sha256sum] = "e0df773d7fa2240322daae7805626dfc5f2d5effb34e1a7be2702c99cfb9f6b1"
 
 UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
 
-- 
2.20.1


