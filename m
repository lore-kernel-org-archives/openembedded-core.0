Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A1FC433FE
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:37 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.1144.1652811931866493872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=6bALnTAP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id n18so18095008plg.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Etu53DnXc469Gaiu2tuXJl1m7jxKqM6G1HfEP8RfNZw=;
        b=6bALnTAPToKc9cQjOM5TYkTmrUaGGgxb3Y7lCp7aGUqp6V5yDpZ69hRUNYFY7df7h0
         HpQfnbJSBg1ymZAgG5JnehAqvp8zoy9UMHR2R+dXzbZjbPztXSrNW4ML/UkmmE+Z1kAW
         PcifPIXHTrIrDnSaWJUiYoicHZNliwsdcCGZe8qGfFZVGTQxQwxUrA17VFO9yvaelVjh
         S74by6YDLRxunscEn2Dr9f5ecm5B3fyDERqWqG1f5S8wsw5UfcpaNGoxDBdkZIVznEDn
         sSkcM5Bn6EH8PXRqM6LoXCiC4yzbGjmWt6/KQoA3lpmNghZmJ5/wPl0TkCM/myXhmQ0C
         hdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Etu53DnXc469Gaiu2tuXJl1m7jxKqM6G1HfEP8RfNZw=;
        b=UFSs/wxeXOK1QnzBLhPZ8o03slNl67iltITNU9vnilanf5H9ISvfVOwgqAqkTqyw8o
         ACSqj05Pv3E6iNfmuguO3vIFpo3U8EZLN/eg0TaW9TV8gxt+EsdB+Qvl/JHQ5n7+ye2s
         32YPyxgY9nQ6cEYGrIXykvXyvOP+dX2orPqZKbpYJDZZJenbrB9hzAFCC1P6gBZD3GEZ
         uCwBVF6NCsX3lrq/sbRLZ0FauO4ccJAt4mUVdypJ/apkb3qSy9+MTUB/AWS6agOIgRuC
         HTpWBF0otVjPGxx4vGrDpeyZotCaZhqh1g9SzBVKkf9dlGJr8Tl4T35zlQ/lwLK+FmFr
         T7lQ==
X-Gm-Message-State: AOAM532fa+uJegkcV9gteAB2Hoq3M5YvCgkntS+9ew0CNb+uswuV+zjM
	LVWgIx5FEHXKQ5MogygRm7c62T+fGK6EAI2b
X-Google-Smtp-Source: 
 ABdhPJw9HnP5lObEyYwJIP4vTVQCA8ElGwmDRKIlHJQ6g2Y3fth7E8c3IN6dTF33GFRHgQdMoXZhjA==
X-Received: by 2002:a17:90a:4a0b:b0:1df:7168:9888 with SMTP id
 e11-20020a17090a4a0b00b001df71689888mr8725959pjh.16.1652811930729;
        Tue, 17 May 2022 11:25:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/31] cairo: Add missing GPLv3 license checksum
 entry
Date: Tue, 17 May 2022 08:24:08 -1000
Message-Id: 
 <a27a0c3bceedf06de7ff8cae4a8fe4d2f6f514b8.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165767

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The trace tools are licensed under GPL-3.0-or-later but this wasn't
listed in LIC_FILES_CHKSUM. Fix that.

Ultimately we could disable that license if the trace PACKAGECONFIG is
disabled but I'll leave that to someone else if they're keen.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f763b906ea10705d519c9eebb5ef1ebe87d49d7c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/cairo/cairo_1.16.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index 0b5d1d548f..67081bb8cb 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -18,7 +18,9 @@ LICENSE:${PN}-gobject = "MPL-1.1 | LGPL-2.1-only"
 LICENSE:${PN}-script-interpreter = "MPL-1.1 | LGPL-2.1-only"
 LICENSE:${PN}-perf-utils = "GPL-3.0-or-later"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77 \
+                    file://util/cairo-trace/COPYING-GPL-3;md5=d32239bcb673463ab874e80d47fae504"
+
 
 DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
 
@@ -53,6 +55,7 @@ PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
 PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
 PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
 PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
+# trace is under GPLv3
 PACKAGECONFIG[trace] = "--enable-trace,--disable-trace"
 
 EXTRA_OECONF += " \
-- 
2.25.1


