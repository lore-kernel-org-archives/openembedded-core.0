Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A108CC433FE
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:36 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.7519.1653489020710578126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=fTpzNmWa;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id a9so17018329pgv.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+HyjoU/g3csxL47V4Vyt8c3l0gLcHHiXyX9GJFGLR3I=;
        b=fTpzNmWa6F5G4OIcpgu6u51ZJVVY9dg42sbnUERgSE5sz7F96UWf5QU1Ho8KaSok3M
         OkcdWl219jeq92IpjiK9bf/cREKjVlikHmBpcGYd9HABPuqo3ZIDp+4bcMRfMjeh+vUf
         I2ghVIurD3wrBA9KCspcNKcC+R3fAE1s2LFVbusE4S6SQLPmLjcmMakptExkOIFy0TYz
         6ky5SMuXQ6NhhKlUx9GTV/qRcyCOdk1AbyCJZBECbA4hEB+Qvx1YddHb3T7TAFMyw3LU
         /00QehuIRt38dkrJB1Wvm3SyBOGh6wHM3AEhJ2yI3VF6qb8buPTK062VBhI1ltV0a9cf
         9deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+HyjoU/g3csxL47V4Vyt8c3l0gLcHHiXyX9GJFGLR3I=;
        b=UVOVuKJBxkrfN+MC+nZS6CAWilJnHIwK2YYp4nXq4sPMsxzm4qaqcxK2q4oCfPSGv0
         oY+ZP0Qg+5XKqhJ6YMjT5acGc6WrEfOD6m8q7cALUxcIbg88o3JUveLjOY3L0c++TOyB
         q2gdwrkjFwoeTIjYt09fdRyKI2o2rEsJVO9EqjivPggnalJJ9B2vSxVQn0kbFezwZqXU
         WdxHXFsK0Qw62g/T3GXmHQmUbUWZyG01vBIRusWfKCCKkBLti2tI2Xukd+0BBGvqLGL4
         UzsXALrUkQQ0D4t7REpZdx/Csu2Uz+5kFqeZrfelH8ifC4i+3+tMae22JPm/0Vf9aR0O
         cfIA==
X-Gm-Message-State: AOAM531uorllOhF0xyiOK+uau3kX0QbBeJS4vcutD5C+r+nROBu7PPMF
	PkeVQaJQ+g9LW6AY+qxrR+glJ6g89PMOhuRU
X-Google-Smtp-Source: 
 ABdhPJz5kLyHUQiVvzDBqAd3DPcnXZ2bHg+owwrWDt4Hkv8Ru+d7Qwg42uT0DbSdO3bFrliLrgL9iw==
X-Received: by 2002:a05:6a00:1acb:b0:518:99c4:aa2e with SMTP id
 f11-20020a056a001acb00b0051899c4aa2emr16409970pfv.25.1653489029207;
        Wed, 25 May 2022 07:30:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/19] gstreamer1.0-python: upgrade 1.20.1 ->
 1.20.2
Date: Wed, 25 May 2022 04:29:39 -1000
Message-Id: 
 <5ce15470ae6957bb65a63762bb9170efb85a04b3.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166137

From: Alexander Kanavin <alex.kanavin@gmail.com>

Bug fix release:

Fix build on systems without C++ compiler

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 762c930a49022ee7f56e746d3e768087eafd2ac1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...reamer1.0-python_1.20.1.bb => gstreamer1.0-python_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.1.bb => gstreamer1.0-python_1.20.2.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb
index a8ae274631..34bc4bf4f4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ba6cd59faa3db3981d8c6982351c239d823c0b8e80b1acf58d2997b050289422"
+SRC_URI[sha256sum] = "853ea35a1088c762fb703e5aea9c30031a19222b59786b6599956e154620fa2f"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.25.1


