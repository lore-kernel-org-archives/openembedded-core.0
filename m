Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.1203.1604335828863480284
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qr2u9xJJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id o18so15058806edq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MxGRil/fxOZkTWAPD304tfErvocD9vBwAQP4/c8CgQc=;
        b=Qr2u9xJJKS8HcF4xRIsLJ/83swgMHLf7X6uc/iB74TCl66jZEiHQcRW90iD0w4GnAf
         f+ns97wc54Idmw2mYS2zHs9BHzMi4RgvlsCKAxu2v0kUfH1F+0FWFfNB6078n3mE0aaV
         LSXkHjGCxZyPoKi48pC/yOnFylwVO1g/0Is6dyq3YWsFzAHM0b5DL1mXQB1/ovMzMzoG
         oiV92E92Jh9/1lxffBrKW1LnlKdQTrgNdcjyZxqMqT818kX/5KMEwt2oE7oRaoWHJjB2
         6e29s0On1KwwMuPBU8mQ810aqlkeUiEYKL0YEaZA8XFbko/Y1K6zd9yoJR9AnpFWYBJC
         rLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MxGRil/fxOZkTWAPD304tfErvocD9vBwAQP4/c8CgQc=;
        b=Pzlm1InHXsJozGxf8JBd2liAZEIdTrx05Mi1upgl+eTo5Qs9oN0oosi27KUl9L/Da4
         +NHpi2RJ+N6+YlBSLxnJ/LgNQtoS7yZEhicLPh/WphvltbMjfc8nzcgCquMhj8onN3OV
         YgMgM2xBdjmNrwJjdXPb7HfDThAPqwZrXJ6iH+sGmL6rsg/mJFbn3ik+Ct479fJO155e
         XPrbo7bfEOI2XWQm/frht6EfmJDaVs1RcE/VhmOS7VvVKhZqD2iqvTuYnXTHQ8lTNSmA
         xPeKkIiYicqV5Ra78neHamrg3ZtgaJxte71RzqV77rY1gmPVME+147JZ99OZ3LSfQxy0
         z9rw==
X-Gm-Message-State: AOAM532BzAh/hax0si9yGc05z5PwiiIRTqL9m9ezpAO6lvKDODQxvdGq
	Hux4IJB7uZ/S9X1I0m48GBOeNvY+pYYQYA==
X-Google-Smtp-Source: ABdhPJzey0tnyGw9GkdCbS0CwSz+bbpcPJrkPE5sQgZrbmf1RR4pyv0sn5Ps3vV64X79NrBbg4PQDg==
X-Received: by 2002:a05:6402:b3b:: with SMTP id bo27mr3253106edb.376.1604335827219;
        Mon, 02 Nov 2020 08:50:27 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:26 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 79/80] libsoup-2.4: upgrade 2.70.0 -> 2.72.0
Date: Mon,  2 Nov 2020 17:49:06 +0100
Message-Id: <20201102164907.27572-79-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libsoup/{libsoup-2.4_2.70.0.bb => libsoup-2.4_2.72.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.70.0.bb => libsoup-2.4_2.72.0.bb} (91%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.70.0.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb
similarity index 91%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.70.0.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb
index d6425bd941..d0bc019616 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.70.0.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb
@@ -10,8 +10,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native libpsl"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[md5sum] = "c539f5b5ab534f024dc4e6a14e6d3f54"
-SRC_URI[sha256sum] = "54b020f74aefa438918d8e53cff62e2b1e59efe2de53e06b19a4b07b1f4d5342"
+SRC_URI[sha256sum] = "170c3f8446b0f65f8e4b93603349172b1085fb8917c181d10962f02bb85f5387"
 
 CVE_PRODUCT = "libsoup"
 
-- 
2.29.0

