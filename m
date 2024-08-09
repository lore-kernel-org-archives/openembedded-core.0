Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626A2C52D7C
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 11:45:45 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.82192.1723203935563820045
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 04:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=L0rxbZyw;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fc6ee64512so17830015ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 04:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1723203934; x=1723808734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aPD7/cODyb8U8xtqNwQVQ4yjLbcwBNF0d+0yJrMiKsg=;
        b=L0rxbZyw/Nlzoayne1ZmERc7BSbxJd95moE2bW7i87PZJkM3lcvVyvehjHik76KwRF
         syAnGMmAdUYWfoafnuNLZ8KX6Z7g7fPycS/9KxHFbJtsn/0bRbrXRx6A5IGBu+sIQckm
         n/G5rL+98rHLcbmIlh04CX+NN0c4Sj+9b1dsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723203934; x=1723808734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPD7/cODyb8U8xtqNwQVQ4yjLbcwBNF0d+0yJrMiKsg=;
        b=BvQJWx+nXR2lXfHl2ITr0dvj3lNG57hT1Jxb3rqN0JClYvEGhApVuluWAwtAZY+eXa
         EWleewI+xQMjEvP9md2tQHKRhAI0AI3T/QFnCddv9p+P030G3s1UBrWErY02mAiiKx/u
         GIfG5Ui4SpyU1WddVWJJP0lWT3YPqSyShupfZk2jcN4xQgDfxkOhxg7weVfYB5Hinhbn
         jBJ7G0I5Uk0kCfXvC8nwwFCA8ll4zibZk4aLm7frVNcDHl/+/5m6n44dsgAvw16pcb61
         K/cuBt1B1hmdTVqsW3tyNjHaDvzONwzQU4TtxzqOkrRwqBO8w3Sz4qdHXvajJ5U1/8tR
         LRGQ==
X-Gm-Message-State: AOJu0Yz+eTT9UlMn8gCxVK6MWeKIZfk7wFVuQP6YVEkzBTuV3Y/keopO
	5x9rXmeMuQ6rAAmyI5p2+hmVspwEed4zJQ7rTT4cBQIlUVDgCZJ1w4gb2jENxpUa1Ab6Cafv98p
	hM3w=
X-Google-Smtp-Source: AGHT+IGrsoRQm2pc+AOlmYzXJPaxmMLBVFWO2u6hlRf2NbBHNPfdtbTNubgieP3cupwmEqxkroygHA==
X-Received: by 2002:a17:902:ce87:b0:1fd:a942:154d with SMTP id d9443c01a7336-200ae576063mr12873285ad.22.1723203934237;
        Fri, 09 Aug 2024 04:45:34 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882c:1983:554:9aaf:746a:a9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59058cc6sm140853545ad.123.2024.08.09.04.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 04:45:33 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] orc: upgrade 0.4.32 -> 0.4.39
Date: Fri,  9 Aug 2024 17:15:23 +0530
Message-Id: <20240809114523.621929-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 11:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203167

From: Vijay Anusuri <vanusuri@mvista.com>

Include security fix CVE-2024-40897

Ref: https://github.com/GStreamer/orc/blob/0.4.39/RELEASE

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/orc/{orc_0.4.32.bb => orc_0.4.39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.32.bb => orc_0.4.39.bb} (92%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.32.bb b/meta/recipes-devtools/orc/orc_0.4.39.bb
similarity index 92%
rename from meta/recipes-devtools/orc/orc_0.4.32.bb
rename to meta/recipes-devtools/orc/orc_0.4.39.bb
index 829255f110..320abf536a 100644
--- a/meta/recipes-devtools/orc/orc_0.4.32.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.39.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a66e3d8f2b7e65178d786a01ef61f2a0a0b4d0b8370de7ce134ba73da4af18f0"
+SRC_URI[sha256sum] = "33ed2387f49b825fa1b9c3b0072e05f259141b895474ad085ae51143d3040cc0"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.25.1


