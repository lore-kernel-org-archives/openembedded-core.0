Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D6DC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 17:04:00 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.86661.1657040632979043694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NbXxvmQj;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id dn9so17454714ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N4bU9c4syoKek8wfUiqvGybRnS+P8wGzCLYThfykQ04=;
        b=NbXxvmQjqful4Wen2bkxJC3FQE2DKgbmVN3v98An/TMC9BX+r71onZBjcFzAkHXYAJ
         RU/GpLZjscoa/y/gV/k/68bSuJ25lCr/IlejN5SQTDm0DijPIOQatTYaovTRCdXtJqzz
         002DrSKKqngkdqvXsSafuVGO+eYxdZYtxFdMNClGiXNVXg3pFdpR+gtnYN/qDli/vPUF
         yVOCs0mw1s1S+pTDCjjDASdVFIyOZlN0BSAWFSiTqBd9aF8n5Lk8OlAsRROLHtYf3RfV
         MYxB3AgxCoBxCofxmvqTNys6zouHbY33ybG7U+6JqdBNOvKbJFOZ2n3P6vupf3V5lRy1
         0acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N4bU9c4syoKek8wfUiqvGybRnS+P8wGzCLYThfykQ04=;
        b=GM6Yc2NuHoiYyrD837CYpPSOaQY+2EWp2J1hlg72+YM0P+7gXgg5yPc6SxmttYQC0E
         FNwCumsHr7jpF574omX6o5Ux4PSSa/iLf51sKvqZVhWgixKryYZjR1P/jAzkfJ5xMV6b
         2fLjRSzTGaroTvp7eESBQxYhU7TyF+8L7+g/5zbOY+1Y8UNcvs5mXserctU2dDBPGxBc
         a885Tcf0P9ZKTpYQBLF86yEkAwSIY5wLbAZtBh258irf0SYFxEYQpmmk9becyToYQi+e
         Tv984aBE0jSaskDUGN22PQOWgiTMyRmrb5O3DOHCFKptg4Z4l066Z5PoAvswUNXt/uEi
         RSQg==
X-Gm-Message-State: AJIora/09CeQfyTGerSe+zObg6oVve6jjAqWodY4HgEnpAZ/RFzJ12tZ
	Wqqt9VXFp1nysBTRt3PHAYZmwJrAo7zNOQ==
X-Google-Smtp-Source: 
 AGRyM1sc7+hhHKGRXZIcDLcs6a1Ts1Z2ZTS0kCAOxJE2qC+piyRP+q1GB8G4F07XP+MfXpAdIyM5qA==
X-Received: by 2002:a17:907:2da3:b0:726:b031:a448 with SMTP id
 gt35-20020a1709072da300b00726b031a448mr34176547ejc.506.1657040631408;
        Tue, 05 Jul 2022 10:03:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 x2-20020a05640225c200b00435651c4a01sm23999886edb.56.2022.07.05.10.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 10:03:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/7] weston: update 10.0.0 -> 10.0.1
Date: Tue,  5 Jul 2022 19:03:37 +0200
Message-Id: <20220705170339.771017-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220705170339.771017-1-alex@linutronix.de>
References: <20220705170339.771017-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 17:04:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167674

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../wayland/{weston_10.0.0.bb => weston_10.0.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_10.0.0.bb => weston_10.0.1.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/weston_10.0.0.bb b/meta/recipes-graphics/wayland/weston_10.0.1.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/weston_10.0.0.bb
rename to meta/recipes-graphics/wayland/weston_10.0.1.bb
index 93f7b59659..e27dac164e 100644
--- a/meta/recipes-graphics/wayland/weston_10.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_10.0.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
                     file://libweston/compositor.c;endline=27;md5=eb6d5297798cabe2ddc65e2af519bcf0 \
                     "
 
-SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
@@ -15,7 +15,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
 
 SRC_URI:append:libc-musl = " file://dont-use-plane-add-prop.patch "
 
-SRC_URI[sha256sum] = "5c23964112b90238bed39e5dd1e41cd71a79398813cdc3bbb15a9fdc94e547ae"
+SRC_URI[sha256sum] = "8a9e52506a865a7410981b04f8341b89b84106db8531ab1f9fdd37b5dc034115"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.30.2


