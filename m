Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31714C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:18:50 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.5130.1663078721050553349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jIC5Pnuf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id iw17so12010420plb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=zzRfnIiypUb0BwBbbfBg+1lQ9DY5EDnQ4OLYgYe9/BA=;
        b=jIC5PnufCwid6UrT86QI0zYi1KiAxYh2h/OFud731awhblv41H99t2r/oOLYbi4UPP
         jLbftHH0hBnaJbu7WnWH7M24UCQZV/XXMncTzUEllZOiNsPHOBImlOfoZC4bWyy8sU+b
         QlPFUk6jds/TmQMzRnBUaQZAONqIN17P92Wz0KpcEkacHY27KVmBe3OGsjb4Dz///8LI
         BhfcVljekFFDiyAQeAgGH6pzlcZVnfPtvxnwwU7nwJuHHx/4cH+juFYLzaOqWf70I+3r
         N3YZLT0dN9OSN9dT6zHUJmN6eA2ifFSfwR+kM059OxzdbP3OJRzgGj9hSeKXRUXJQL42
         zh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zzRfnIiypUb0BwBbbfBg+1lQ9DY5EDnQ4OLYgYe9/BA=;
        b=6GDrK/sg7yCPR6DS/QvxHKYSQ6e5+B+5VAIUJ4UfZXuKq12YZKz1o9FOUzLnHMsdEd
         gQY2jfCrPL33R4sdkx7sxM34vOpAbvEfDwOX+hXFmEYnAr7pIN2KL2KyVvwXEkbvyFK9
         v39VhWN9JW9nURPdlwoR5VAOYL6/Qi+YNO7dkBUCE9j+d0W/XUplePCsdhYy3mZfb8oZ
         SgCCfRRNlmdJO5+EHoxmq03tSHQ61C9pCaLZRGUY3GJ+pdHRy6voXLOLGiuSlPFctnt+
         gNmvzunBudn/4UHwKHDtrRTNCzZIt3udRUmQ/jFodftemb95pgr+C1tjwIDjq2unTQg9
         O0ig==
X-Gm-Message-State: ACgBeo0s7v6l9n+tKbUnM/SdRYSkpERzfowdyYPsHknZ5gwvoGN//wjW
	fVEccOEyHyuTcJIDnJRKpPdxmVYurJw/zgsq
X-Google-Smtp-Source: 
 AA6agR5AYcAnP9V9tK7say8hSyy9/VpFx5cavEEG9mOpG2LbZ5BN3HwZVBf3cd9kCM6QnfiJDHbqtQ==
X-Received: by 2002:a17:902:b08b:b0:178:48b6:f5a8 with SMTP id
 p11-20020a170902b08b00b0017848b6f5a8mr3129865plr.3.1663078719949;
        Tue, 13 Sep 2022 07:18:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g11-20020aa796ab000000b0053bf1f90188sm8086424pfk.176.2022.09.13.07.18.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:18:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/16] cairo: Adapt the license information based
 on what is being built
Date: Tue, 13 Sep 2022 04:17:53 -1000
Message-Id: 
 <654d3542afa8082ef8ec9c34e3f27bc9f22ba2b4.1663078051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663078051.git.steve@sakoman.com>
References: <cover.1663078051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 14:18:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170591

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

If the "trace" PACKAGECONFIG is removed to disable cairo-trace (the
only part of the code licensed as GPL-3.0), we can adapt the licenses
for cairo-dbg and cairo-src so that they do not include
"GPL-3.0-or-later" and thus they can be used also when, e.g., GPL-3.0
is blacklisted in INCOMPATIBLE_LICENSE. Also drop the GPL-3.0 license
text from LIC_FILES_CHKSUM in this case.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4f0ea44c80f297d00349b7d3cf9438145aec8a74)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/cairo/cairo_1.16.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index 67081bb8cb..ffb813d290 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -17,9 +17,13 @@ LICENSE:${PN}-doc = "MPL-1.1 | LGPL-2.1-only"
 LICENSE:${PN}-gobject = "MPL-1.1 | LGPL-2.1-only"
 LICENSE:${PN}-script-interpreter = "MPL-1.1 | LGPL-2.1-only"
 LICENSE:${PN}-perf-utils = "GPL-3.0-or-later"
+# Adapt the licenses for cairo-dbg and cairo-src depending on whether
+# cairo-trace is being built.
+LICENSE:${PN}-dbg = "(MPL-1.1 | LGPL-2.1-only)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPL-3.0-or-later', '', d)}"
+LICENSE:${PN}-src = "(MPL-1.1 | LGPL-2.1-only)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPL-3.0-or-later', '', d)}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77 \
-                    file://util/cairo-trace/COPYING-GPL-3;md5=d32239bcb673463ab874e80d47fae504"
+                    ${@bb.utils.contains('PACKAGECONFIG', 'trace', 'file://util/cairo-trace/COPYING-GPL-3;md5=d32239bcb673463ab874e80d47fae504', '', d)}"
 
 
 DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
-- 
2.25.1


