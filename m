Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.6324.1623744778330116081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TnvTQdMy;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id k25so21078085eja.9
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ORpx1mx20R4xMsguKusOud0lSMZa7KfEV3zfJ9+Q78s=;
        b=TnvTQdMyclNlvdKQKtUWaYHBXp909Wla/fqBpvuXFZEqz0yT5Jm0vasYZhlEaGlJLE
         HtKaXm8yGxWXUjHfq4OaMy2jbgsLZReMw+rsYTi7kQA88aQBszoPAdpKC4U3kNtzQoMk
         mXiXa6mHR6hr8HhJxSxNY2Ofv/2sZVDm+ajrPYJ9Fchh8O/iAxjXgO/KChvPusxV+PlX
         eI54T8+vh0xg1jtZcvH5nEKD/5mh00ODOTBybwgLr7rFUWw/7IoYcawm57DvXuNBn34h
         5+ND9lPVhFvK583TPtvEh5tJHNN42p0ztQjA6JzJyJn3x9tdXdZP0Fh8mbt6cUCcN7vt
         T1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ORpx1mx20R4xMsguKusOud0lSMZa7KfEV3zfJ9+Q78s=;
        b=c/519zyIBm9lJk3SFl/wlrDe3A8xvm2uAK34CPTkF1hoyeRTG3GqOh2JpPJXGMv16M
         MmhpB1FplpF919yJUHicHC00+oDCeREJVW5mIKS87PSnXYXNKSBLBvk9XuNuvT+3701Y
         im2xDyz3HHu4Y7aGeTIWngJdTg+gbPgpv83CQjdzfzbqp0tpycQe5ZLAT/Z8Dh84Iewb
         NSj1LyWXSrrwszTS7u2NrbRKH0ZXoREeAK+NxxZJ7bBa+t+M5HkRgb5B9YUOk2GPok+j
         x6juEJlAOFFcfUY5CNQDsG1dwUdR7a/zN1J0rWTZ4Scg65ew0BVY2W4qpKx2asRxlxGL
         sz8A==
X-Gm-Message-State: AOAM532anHhlaQQYmjiJPyL5Wo8cXYegRspXI4HUTQr536JyFu2fGZT7
	imxm3omeN9NcGKXXosOGiZuEJRvmYvRhNQ==
X-Google-Smtp-Source: ABdhPJzLibkXUoc3/yVoYuYG4THhJ8QdxwXzU62JLPE4ACZQVp2O8WqbXSPYeUp8pEM49e9zqiQ9jA==
X-Received: by 2002:a17:907:270c:: with SMTP id w12mr19651002ejk.175.1623744771955;
        Tue, 15 Jun 2021 01:12:51 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:51 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/31] connman: update 1.39 -> 1.40
Date: Tue, 15 Jun 2021 10:12:19 +0200
Message-Id: <20210615081240.1734087-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...002-resolve-musl-does-not-implement-res_ninit.patch | 10 +++++-----
 .../connman/{connman_1.39.bb => connman_1.40.bb}       |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.39.bb => connman_1.40.bb} (85%)

diff --git a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
index 942b9c97b6..9dca21a02f 100644
--- a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
+++ b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
@@ -1,4 +1,4 @@
-From c7734e1547db967eccf242fe4b9e8a30b9ff141c Mon Sep 17 00:00:00 2001
+From 01974865e4d331eeaf25248bee1bb96539c450d9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Apr 2015 23:02:21 -0700
 Subject: [PATCH] resolve: musl does not implement res_ninit
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 13 insertions(+), 21 deletions(-)
 
 diff --git a/gweb/gresolv.c b/gweb/gresolv.c
-index 38a554e..a9e8740 100644
+index 954e7cf..2a9bc51 100644
 --- a/gweb/gresolv.c
 +++ b/gweb/gresolv.c
 @@ -36,6 +36,7 @@
@@ -26,7 +26,7 @@ index 38a554e..a9e8740 100644
  
  #include "gresolv.h"
  
-@@ -877,8 +878,6 @@ GResolv *g_resolv_new(int index)
+@@ -878,8 +879,6 @@ GResolv *g_resolv_new(int index)
  	resolv->index = index;
  	resolv->nameserver_list = NULL;
  
@@ -35,7 +35,7 @@ index 38a554e..a9e8740 100644
  	return resolv;
  }
  
-@@ -918,8 +917,6 @@ void g_resolv_unref(GResolv *resolv)
+@@ -919,8 +918,6 @@ void g_resolv_unref(GResolv *resolv)
  
  	flush_nameservers(resolv);
  
@@ -44,7 +44,7 @@ index 38a554e..a9e8740 100644
  	g_free(resolv);
  }
  
-@@ -1022,24 +1019,19 @@ guint g_resolv_lookup_hostname(GResolv *resolv, const char *hostname,
+@@ -1023,24 +1020,19 @@ guint g_resolv_lookup_hostname(GResolv *resolv, const char *hostname,
  	debug(resolv, "hostname %s", hostname);
  
  	if (!resolv->nameserver_list) {
diff --git a/meta/recipes-connectivity/connman/connman_1.39.bb b/meta/recipes-connectivity/connman/connman_1.40.bb
similarity index 85%
rename from meta/recipes-connectivity/connman/connman_1.39.bb
rename to meta/recipes-connectivity/connman/connman_1.40.bb
index df42e9ffb8..15d105e2bd 100644
--- a/meta/recipes-connectivity/connman/connman_1.39.bb
+++ b/meta/recipes-connectivity/connman/connman_1.40.bb
@@ -9,7 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
 
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
 
-SRC_URI[sha256sum] = "9f62a7169b7491c670a1ff2e335b0d966308fb2f62e285c781105eb90f181af3"
+SRC_URI[sha256sum] = "1a57ae7ce234aa3a1744aac3be5c2121d98dce999440ef8ab9cc4edfd5edcb12"
 
 RRECOMMENDS_${PN} = "connman-conf"
 RCONFLICTS_${PN} = "networkmanager"
-- 
2.31.1

