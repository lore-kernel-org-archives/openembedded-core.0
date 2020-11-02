Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.1230.1604335816242437676
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KNmLa7gz;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id o9so17731026ejg.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BFKNiHl79ocldcZHPHmeKjX0pGHc+oqYG9LZpUlc350=;
        b=KNmLa7gzcK2h5tkYs89gdTJBQZaGbjfwfvsHsCd1mdgQ4w0SVTQpieJVqR6nPReXcA
         1FbMyIt1unDQUJE2UF2jOCVrVve+kSM+7POtQfb7l/v1eoAJe/x1rKs9E7Wm7WNEMS9O
         2wgt2Hi3jUQ0WmfS6NfMU/IQZNaJtI7bbOoq9oEqIMaJ46prAIhTvngUbvp84zUBCU1R
         CkQVxNYcLD6Itl4aPIcNdmzKYeCfXDafBWGLHgjAoPCQWagSNGoc8bvjwdVsE64bdMvm
         YUCsW+Kc0/prRc89bH6uTqljh7qx2q9ZN6BhZ9jcMRZTBoiiUrR6oP9RPQxNMsV3BDyC
         scgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BFKNiHl79ocldcZHPHmeKjX0pGHc+oqYG9LZpUlc350=;
        b=uQdw6FP2UFUHhldwwX8ReuuM2AOVVMaD9pJ4vd3PM5u9Ns+qaYHbCEm08DsGQxB2rW
         Bas9w2kYLNe8pcpwz17Io9TJPZ80tWksFvOz3rjpP+wY1eCNSWjnV3VnCglwUFoq/Gpa
         B9LKbk4oQoBy5rkwI87kkS+VHveShFtKEsb+hKcsjU1sdjeHjSMHgjj0smVElBjL82LR
         lGw0iiWypso7WGupwLZaC6U77ZLhGcJjgF3SK9LfGsSbUqiUuU5aq/X10VcntF5Uxn6g
         MK4VqQTirG2xsr+H+yyiTlZmKiv7s9CUq+5wnT9QYmoFmmUabQ1ATyddpHkS3O5+xJx5
         UWBQ==
X-Gm-Message-State: AOAM533grL1O00+X/0oyf3A7falG3ANjTVGKBRjILnjd4dJNRRsUEy+G
	KB0ELsTUnV0elekG2rLcNIXvtS0IRiOgmA==
X-Google-Smtp-Source: ABdhPJx3Ea3ZgACCPoRP99tVfeSA+GQ5ik+T9hy/Knl/LIR431JlMsQAjx/9gaT8ee8p2VrvHiDI6g==
X-Received: by 2002:a17:906:b110:: with SMTP id u16mr15926719ejy.55.1604335814580;
        Mon, 02 Nov 2020 08:50:14 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:14 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 64/80] libhandy: upgrade 1.0.0 -> 1.0.1
Date: Mon,  2 Nov 2020 17:48:51 +0100
Message-Id: <20201102164907.27572-64-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libhandy/{libhandy_1.0.0.bb => libhandy_1.0.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libhandy/{libhandy_1.0.0.bb => libhandy_1.0.1.bb} (91%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.0.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.0.1.bb
similarity index 91%
rename from meta/recipes-gnome/libhandy/libhandy_1.0.0.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.0.1.bb
index 3cdbfc820f..146ef62f41 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.0.0.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.0.1.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/${BPN}.git;protocol=https"
-SRCREV = "94313c206258860b2428712e7ece1d02c5177857"
+SRCREV = "5cee0927b8b39dea1b2a62ec6d19169f73ba06c6"
 S = "${WORKDIR}/git"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.29.0

