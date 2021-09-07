Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.4602.1631057550465912878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 16:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iUPUxZGc;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id u18so575233pgf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 16:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Wr09ogwcK/pBdO+uoW3IlRWuLiJxCqsip8wFWuwKto=;
        b=iUPUxZGcwnM8A13OxIeep0WOg/JytgRYk3vb888d03PcTft4b9L4Dlij+XKzFUJunC
         f6+33LdyGLwqM5wDpLHLv9yPX3rNA0KSybaqzTcsquDK+gMzemAk7qkmuhhfXmnevDH0
         nuA1PePZLEcYhr6p72rM7ASte/hJ+lUrFpmhlMOnoCiBmaeZDBjwBpz8He3Xxh3E2CEf
         lee6ayCgqgPMjXtx7x9p5EY1AtCRYcakS7a/gw42qLzuqz9AleiBESHBJ6naJMUBqQYW
         ARq4RXKA65hgY3YfDY/EgVFk10XKO8gmEmbQkSgULmogXASXokbYLpb4tJP+Sp6AEdVS
         vQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Wr09ogwcK/pBdO+uoW3IlRWuLiJxCqsip8wFWuwKto=;
        b=pxY2GRIA9XYk8hgoMU/Oc0zg21vaRqbFviF6yDriLH1ulHEADOPmeey5q2OPKH3hgA
         k9pzdn+8iFK+RQ1HRT1csTjoiH/v9oLYxJ/zc4BjG6fZ7Ysr4xet0e3f6vQOuF3xGWt/
         VKMpjmxMbXs7otPkguKpnU3MhGFtXUV/EGKTFeeBYKp3Kij4vWdUpoHABGPVagPP02op
         iO5rUh+mYw/yFzIhIETaRjRPeK7sdPxncZR4kMpHgRJTQZ9i6YndBF9nqlPp+9r/a2H8
         12kuPDJel7EEfgur9S81+YeU2jzqe1tPLm/JrYIHmJATDHh5N4oiwMSgYQ0Pk5MOD6Iv
         g3tw==
X-Gm-Message-State: AOAM5333I6ImT6HYwG/EHljn++itswhONdu/okXXbPuKy/WeCPFKxFNd
	eqqFrMeMUpNBJIM6Vq35DThttQLICm0=
X-Google-Smtp-Source: ABdhPJxe0HXfYlcp1ggYeRXts5EHf/OTZsb2JuFmnUe3X5h5tr7vTsUUCgLldIkiwkv6B2dWvu8eMw==
X-Received: by 2002:a62:1c96:0:b0:3f5:e01a:e47 with SMTP id c144-20020a621c96000000b003f5e01a0e47mr815720pfc.76.1631057549943;
        Tue, 07 Sep 2021 16:32:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:ece:8e2f:f07e:736f])
        by smtp.gmail.com with ESMTPSA id d200sm157186pfd.127.2021.09.07.16.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 16:32:29 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 2/5] dbus-test: upgrade 1.12.16 -> 1.12.18
Date: Tue,  7 Sep 2021 16:32:24 -0700
Message-Id: <20210907233227.3265977-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907233227.3265977-1-akuster808@gmail.com>
References: <20210907233227.3265977-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Mingyu <wangmy@cn.fujitsu.com>

(From OE-Core rev: 839695e0c1b0c0fcfbb924c2b174c4a638067a32)

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5cbf053481642a820b9f4c6bed9ac79246719087)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../dbus/{dbus-test_1.12.16.bb => dbus-test_1.12.18.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.16.bb => dbus-test_1.12.18.bb} (95%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.16.bb b/meta/recipes-core/dbus/dbus-test_1.12.18.bb
similarity index 95%
rename from meta/recipes-core/dbus/dbus-test_1.12.16.bb
rename to meta/recipes-core/dbus/dbus-test_1.12.18.bb
index bea0e74ed0..0063dcce67 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.16.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.18.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "2dbeae80dfc9e3632320c6a53d5e8890"
-SRC_URI[sha256sum] = "54a22d2fa42f2eb2a871f32811c6005b531b9613b1b93a0d269b05e7549fec80"
+SRC_URI[md5sum] = "4ca570c281be35d0b30ab83436712242"
+SRC_URI[sha256sum] = "64cf4d70840230e5e9bc784d153880775ab3db19d656ead8a0cb9c0ab5a95306"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
-- 
2.25.1

