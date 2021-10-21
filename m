Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B57C433FE
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 07:02:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.5907.1634799766865387163
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 00:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YemSb2FW;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 l38-20020a05600c1d2600b0030d80c3667aso13232489wms.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 00:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JMBWoNKXtfWJdlX19UCGCMz3oqRbTpBt0EFSTq6Rqy4=;
        b=YemSb2FWUa4phJhR/ftez18YvtOKhHEICwndyJxhputPg5dQBzySR7D4WbR/giG3Wm
         bY+AcfaOM9buq95QJ+VK1tK6KA2vCJgOI8Q6Ebs1GIa2Tb2RwQsNIPbvArIsdXmCV9JQ
         +KLnkVlzNWQqy91CFbKybeX7xAcc5vTNOXb7V2vJ8cKVI3LrSGFiNlnllS1ooiviqBRA
         EVRmBvOC6v2h6+tQZfI87m2JagowPETJCeoqltvPjumAY4ZjvI6G/DBQhOMLrNlTZ7W7
         +9Qm7jL2KPL5MgkDJTlQsQs1+HVAGJVsLJ7Ek6wy1lFb1UpSbyDF8rD1eoSjmTDu7sZC
         bhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JMBWoNKXtfWJdlX19UCGCMz3oqRbTpBt0EFSTq6Rqy4=;
        b=EsGi4NsBFVzdKJa3TTPHmYBxvTC0wT2SNibvzme5q++KR2Bt/n6zzVaLr8rPaQ/3cA
         Qevjy11ttI1WS7s50778+YTw5J6+UJUQH38uJxY/K5C5HXTrpodkr6GBsW3NVGiCkoWa
         /JjbInpwCMY4+uJQ/ep8lFef1elkFy5u+QsNw/W4s0h4IDME6wlGpWpkadwE4QAvEQc8
         T3IN/1Qg17fU2SM4n4nIa/Hi4Q3pvObkEsf9H2MBnv4xwBGE3+EUvCnZuUlku+UPgYDx
         UD+aaIYSrBzlajW7FKbd3L6qQCMjBn/RXyMo9HEj6VZFDPDVnXuRft/pd7ZyAsIk/ZCY
         URAQ==
X-Gm-Message-State: AOAM533sIi8E5kn3I33totCEoj4R6H6exem1xsXyPhFQ9QxPB0AbuOl7
	N5TezoOB5LmiUBoyGHHWDt9M5i43mhs=
X-Google-Smtp-Source: 
 ABdhPJw3hN+0IjUskWJwah1WiqrfarEU1Cxxp0/UQSdPUnpU0LofKZJwYMQrePfn4RpUs9rxFf9g3A==
X-Received: by 2002:a1c:1dcb:: with SMTP id
 d194mr4581521wmd.156.1634799765348;
        Thu, 21 Oct 2021 00:02:45 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f15sm3980274wrt.38.2021.10.21.00.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 00:02:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] waffle: convert to git, website is down
Date: Thu, 21 Oct 2021 09:02:41 +0200
Message-Id: <20211021070242.16025-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 07:02:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157272

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/waffle/waffle_1.6.1.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/waffle/waffle_1.6.1.bb b/meta/recipes-graphics/waffle/waffle_1.6.1.bb
index 395494018a..12984f5068 100644
--- a/meta/recipes-graphics/waffle/waffle_1.6.1.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.6.1.bb
@@ -9,11 +9,9 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
-SRC_URI = "http://waffle-gl.org/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "c91529e579483f44fb330052872b9c73"
-SRC_URI[sha256sum] = "31565649ff0e2d8dff1b8f7f2264ab7a78452063c7e04adfc4ce03e64b655080"
-
-UPSTREAM_CHECK_URI = "http://www.waffle-gl.org/releases.html"
+SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=maint-1.6"
+SRCREV = "d7e8c4759704b3c571fa3697c716279c26fd05eb"
+S = "${WORKDIR}/git"
 
 inherit meson features_check lib_package bash-completion pkgconfig
 
-- 
2.20.1


