Return-Path: <devendra.tewari@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE68C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 22:48:20 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web08.17373.1664923699047381714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 15:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YZ2wjdWJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.173,
 mailfrom: devendra.tewari@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id r186so75819oie.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 15:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=iXEERn+aDir/Ek2gAX/gTu8w8IyI6NwfAD8myQHq12E=;
        b=YZ2wjdWJpoglsyJLpxoaHRejZ0Exf40cZHxiGQ+ApIx6NDiEC5bQO11qOAINZEJGlj
         TEuwmA6z6YA5gijXEeXngHhLFO3W/WjCkDjK4DEJE94o3tZj19+J03FUbz6+gTcn4qNm
         uuqCLkDXdfUaIOFLRadJnpS59F36TidoSU8xNC4ZinPsCYbDFteW/mzlaZRXQtDragYI
         huT/I6NCsai3EvE8ThqjbN6dDft+NYZVvIBAYVKBKBTwr9elhB6RKdBsM6wh9U4ImYjc
         nhbd3N5p79MEMYtPcxUfVav04pfpEoggW1dC+we6km4uN9JwYYnZjpXj4Kdq+yaRQWnb
         ZN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=iXEERn+aDir/Ek2gAX/gTu8w8IyI6NwfAD8myQHq12E=;
        b=kgksU93J/3X5qYAIYUVMWV3Jw29r1NM0hXI3kyoh0z9cp8xMgTYagFzvgvIBP7R30i
         kJaqk/RzuXBk05SxzDAL+zt1aKRy0Q27izskM/H4aR4jEGud3f5KGigFG7QBIt1YyosV
         vphnAuWE0fRpqgfQkChUBdliIinh8yL4YfArvZYWhYDw/46ymFx9h8d4NsZ1AL5orQ+3
         OOllTMBUAF5fv53rfaZyQ94lK8/BNlwdztld35trehB63r7kYhFu7V1+JSfkJtZx1ebC
         nag97SGkYqAOfphF0tp5SzciZWyplqLczk8EjIBKebpXozA3hWI9BKB0eIkLzHOPmNf0
         Ufhg==
X-Gm-Message-State: ACrzQf3IOAGuL3YW5l8Xu+zNka7eSvv5lKgCdWqVOrBxrTA5lhJZZMEV
	11AnuAagJ2VLwuCu/hRusEjy37jpQ8I=
X-Google-Smtp-Source: 
 AMsMyM51FOqVvrEeplxEA2OjcNcWNoHH6acRbBWVmR500CH7qzru0hpFFDdsZ0xeCI+z6wLlhlr+lg==
X-Received: by 2002:a05:6808:e8f:b0:345:7a77:2ae0 with SMTP id
 k15-20020a0568080e8f00b003457a772ae0mr959175oil.52.1664923697921;
        Tue, 04 Oct 2022 15:48:17 -0700 (PDT)
Received: from ma-mailsvcp-relay-lapp04.apple.com ([187.105.4.40])
        by smtp.gmail.com with ESMTPSA id
 a10-20020a05687073ca00b00127ebb410a4sm4112009oan.11.2022.10.04.15.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 15:48:17 -0700 (PDT)
From: Devendra Tewari <devendra.tewari@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Devendra Tewari <devendra.tewari@gmail.com>
Subject: [PATCH] libcamera: Bump SRCREV and add libyaml to DEPENDS
Date: Tue,  4 Oct 2022 19:46:30 -0300
Message-Id: <20221004224630.29185-1-devendra.tewari@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 22:48:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171435

Signed-off-by: Devendra Tewari <devendra.tewari@gmail.com>
---
 meta-multimedia/recipes-multimedia/libcamera/libcamera.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
index 0b9f3f7a5d6..2d3f5e94937 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
@@ -12,13 +12,13 @@ SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
 "
 
-SRCREV = "acf8d028edda0a59b10e15962c2606137a4940af"
+SRCREV = "ed591e705c451d0ce14988ae96829a31a2ae2f9a"
 
 PV = "202105+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls boost chrpath-native libevent"
+DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls boost chrpath-native libevent libyaml"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
 
 PACKAGES =+ "${PN}-gst"
-- 
2.37.3


