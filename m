Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web08.90.1603837786140011637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 15:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Oqn19gYN;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id o3so1593527pgr.11
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 15:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=C/1jarrWIG409O8W1NYjvTEN+HEJb+STpiFAjXNwceE=;
        b=Oqn19gYNvw5+xGNY9yWGJn3VNqN60gaU4N2SftdOn6dHynlNPen5fxILh2QSzy/1MV
         r1KbUgiAg5+BYhz7rijz6pl8OGdYPZUG+ipVtrJ1kFlfbsLqF8iERKOjmfg8Xi8hA/fs
         VAJzS4AFFh9YhTcuLHykNzpr3ZjK+kjFp8GVNGGwiHBW2BbAiC0yav6RITdROCKfox0h
         ixxfjAfFST5FtkdQYijPzPzJTMtuzAJiBqyCb0wQX53fCjh3QRpzTfMdq7n+7b1HbOvM
         +qoMhhnYCX5HUpugnA+LmWOPgYIRQHWZh+5+R0WapnNwwrlBAMXJh/UPIJo6EcVb3uwE
         yFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=C/1jarrWIG409O8W1NYjvTEN+HEJb+STpiFAjXNwceE=;
        b=DeEOdoDiqv7VeTs/zoCtASlVYT06rMIGgFHozh9JY1RPPH17EHIHaz8r0dMBElyypE
         r0qaB4nO2NTexEkNDxtAQFGk6DvawR6dC2YcvpyWyyBA5F5sohK+7nStCjMmZehnXStx
         n6xCEuj5W8txjXZIYzLozrltSlYuUSHzJZnM4fN+PuzZmOg7GBhRr5HpMKHpCP0PZUC1
         Y2sISqkd3mju83izaBx072qR6kf43z+H2J+WtIODGFV3FmhFzLw5qxE94FhCyUbXu2/o
         tE3koItfPMEBATFJJfXZiZRaSyasPu4MKgRHbW5r9nUDOTj/3Vw11ugysSkzyZumHuKr
         JvtQ==
X-Gm-Message-State: AOAM530GU1WjK2y276/nhaxMrcKoY9xX170VPv5NkiqGlflPDRYNozBK
	ciHXkji+ZXzXZbASBlWNaMCpCyqhFx3NAGiG
X-Google-Smtp-Source: ABdhPJz3vBQkjvrLMgDS555vWr/Xsg1L2K1FJjSZwAYGdULt+hm+gNmc391xOQL5NY5e/XbJ1Xm9zg==
X-Received: by 2002:a63:490e:: with SMTP id w14mr3701433pga.275.1603837785221;
        Tue, 27 Oct 2020 15:29:45 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b7sm3699000pfr.171.2020.10.27.15.29.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 15:29:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/16] gstreamer1.0-plugins-base: Update 1.16.2 -> Update 1.16.3
Date: Tue, 27 Oct 2020 12:29:10 -1000
Message-Id: <595625b70908dd28ae4f8b16a9a9756d2b3729f3.1603837524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603837524.git.steve@sakoman.com>
References: <cover.1603837524.git.steve@sakoman.com>

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ins-base_1.16.2.bb => gstreamer1.0-plugins-base_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.16.2.bb => gstreamer1.0-plugins-base_1.16.3.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
index 6563b6f738..a4f4772c1c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
             file://0005-viv-fb-Make-sure-config.h-is-included.patch \
             file://0009-glimagesink-Downrank-to-marginal.patch \
             "
-SRC_URI[md5sum] = "3fdb32823535799a748c1fc14f978e2c"
-SRC_URI[sha256sum] = "b13e73e2fe74a4166552f9577c3dcb24bed077021b9c7fa600d910ec6987816a"
+SRC_URI[md5sum] = "e3ddb1bae9fb510b49a295f212f1e6e4"
+SRC_URI[sha256sum] = "9f02678b0bbbcc9eff107d3bd89d83ce92fec2154cd607c7c8bd34dc7fee491c"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.17.1

