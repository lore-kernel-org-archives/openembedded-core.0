Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.1228.1604335814470323783
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vL4YtsGb;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id k3so19760986ejj.10
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4ijrzFQJquY0tD8O1skRu1KJlnVWg7TcLLbK84xUUS0=;
        b=vL4YtsGbe/AnwvOHGrzoatzqkr+7rNXk4BsqJMqeS9hxQjD4dGcEAuG3vvZnMTE/ae
         XMD8817nioy2L7afMmZPygz6ls7W8eBYx4bPsnItZwkftbmV9eBvn0unpW5qsINj0hHI
         vQqM5YtDvqDn6y5mnDY1g6HiSdHRXrS48uEgoW07aD3emOM3jEiLJ827ZoIkTlQazDtF
         MY5wASJJQv4GZQvTIxArBFBCYWU2V0GN82anpwHHH9261Me+uXq4Vr1jv2meiU5jaL1o
         Eo9WX+KcHnRwBlX74f+0sC6p7EGUiwQdDSY183gHwnUZVoZ0lYU8z8cwYiD8ZXuFxzjT
         LzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4ijrzFQJquY0tD8O1skRu1KJlnVWg7TcLLbK84xUUS0=;
        b=j06U0h8jK17Juu1qs/J6FRUn9UecRZpP07cS6XMjLwlXVg3P2IxZVhxYbnNvw+f2Gj
         P05C88B7N81VSPviZT+xaP65kjdAKkfK5ENHf0MQ2cYkNp0RjbgJlG0rcXnObnAigoeU
         RUZWHpVUk6gR9TpBsJqvQ+XkbUXT6utNDcfZQtmnlOdanLgeIKzaPLhFiaLWr9+3Yufp
         5iIx2Vdp459q/e2pTCU2G3vvB6W8kMjeBaTYKgTzXmZjd0C7hpHKKimGl7D6FUWzhb4X
         c4IljbDzoHIFoahIdbl24Z0XOgTBblEvnYcgKlt3d8LiwYADsfSJ+TY6XafYGYmljEzo
         yM8w==
X-Gm-Message-State: AOAM5328qrlL7MAEndyo+7qUdm5WtSWlrYtfoYAYPIBBYpwGXhS2YZNh
	RqfKFrustXZbS5GQiQqTIX0Fv+fWp4WAsw==
X-Google-Smtp-Source: ABdhPJzpyjm77ztckQijTpbtmeVaSK/Vphm2MMIGoyne3kRmxD2Wmv+Arx1vSkAyaG+c0wedZyEYWA==
X-Received: by 2002:a17:906:2b83:: with SMTP id m3mr16077827ejg.456.1604335812746;
        Mon, 02 Nov 2020 08:50:12 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:12 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 62/80] libsolv: upgrade 0.7.14 -> 0.7.16
Date: Mon,  2 Nov 2020 17:48:49 +0100
Message-Id: <20201102164907.27572-62-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libsolv/{libsolv_0.7.14.bb => libsolv_0.7.16.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.14.bb => libsolv_0.7.16.bb} (94%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.14.bb b/meta/recipes-extended/libsolv/libsolv_0.7.16.bb
similarity index 94%
rename from meta/recipes-extended/libsolv/libsolv_0.7.14.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.16.bb
index 5179d4565a..f7902727c4 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.14.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.16.bb
@@ -10,7 +10,7 @@ DEPENDS = "expat zlib"
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
 "
 
-SRCREV = "b264537ea43ce39d93d8d97fcca16e97825beaa0"
+SRCREV = "7046fb004987c7f1b3722628d9a4ca1c67577188"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.29.0

