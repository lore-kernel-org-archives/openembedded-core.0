Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.14931.1602253163888077195
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 07:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=n5wC4FDY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id i2so7279540pgh.7
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 07:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=9uxNg0jrYwL24DaCcUYhmOdEE+vVPYqc+4VgGJgkLC0=;
        b=n5wC4FDY5g1HUHPmQDp4W34iulmGwJ9xXkHtY2tLszEqFyzCTor1J8Ynw7v/Vof07n
         M1csB/s9m1hnKN/wTdN43xU0MSj+8fnNg03z087vdFbb5MX1MvC0/5BUrKjkbScrcfGT
         i88EmtHN8GfHs6+tKpeZdzU1BaOo+anvVUIg6F9ATeAnoAtE1Qo9G82TSmhnd4M4Ryzg
         dZOH1/BUjlSyB7jMEB3bWMiAOASxujimzlXkUckjOwelom/7opagSL+SZ3WYz06qcH7P
         OxLbWCeK3LKN4BE+3vtRHkOH0CxOe1FNhrX6E3bxbvQnT3Vct3qZes3iH3gHw/xYhbSf
         CAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=9uxNg0jrYwL24DaCcUYhmOdEE+vVPYqc+4VgGJgkLC0=;
        b=nHWQ6TIpcOgKyQvZ2j/lbqboCyCjMQtKJxji7iG73QvYInbsNKLSl77oBzmlBNnJk7
         HYSWZBXahiuT3Tpebr67Uq4GQwxYiZS8kovtBh7OJ+qXZ2C/1IR9Ie23sO+fUFBv7Cok
         g6Htw7LbKYiFsnHgTD+TgAzBajSZz0HUJX4U+YqratJnyJXHoVM2arzHqFE3TX5e6Vd+
         I7a5g+ghcVBmRcQFNUA9ttN8zyqnf8pYAmNYe6eLdD0Fxdxt+EI2+W5DEL3KPFTo6Tdn
         U7wTttQAihyf5SEvjvTtiTq642lyPipcCHgP+e/Hal/Bh9ZAudco9xb58ldEvC6EtnLG
         rBfg==
X-Gm-Message-State: AOAM530mQ584ccas/E5rTEmmtOcO/3ygQPZlp763zwxDE1hTLT17pkRR
	zQ19nyAcfGTn7kBjpZElkWq4Ae4KTQ+st9pn
X-Google-Smtp-Source: ABdhPJzovnbEMIopsO32XtcMI+ZkIjoFT2TYq1DVaQUK0ZPu1lrQSVeYxuTxW4dqtA78Li5MVlaRXA==
X-Received: by 2002:a17:90b:1496:: with SMTP id js22mr4953636pjb.20.1602253162988;
        Fri, 09 Oct 2020 07:19:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n127sm10736116pfn.155.2020.10.09.07.19.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:19:22 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/14] libtools-cross/shadow-sysroot: Use nopackages inherit
Date: Fri,  9 Oct 2020 04:18:42 -1000
Message-Id: <275d504b2f979901278141a4ba217d02a099f980.1602253014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602253014.git.steve@sakoman.com>
References: <cover.1602253014.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When testing pseudo changes I realised these recipes have packaging tasks
but don't generate packages. Drop the packages tasks for cleanliness.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ef9c11797b5d626bdb40b4509d8b2b0d461ff9ea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb | 2 ++
 meta/recipes-extended/shadow/shadow-sysroot_4.6.bb   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
index 522bf3a0e9..02c6e152fc 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
@@ -6,6 +6,8 @@ SRC_URI += "file://fixinstall.patch"
 
 datadir = "${STAGING_DIR_TARGET}${target_datadir}"
 
+inherit nopackages
+
 do_configure_prepend () {
 	# Remove any existing libtool m4 since old stale versions would break
 	# any upgrade
diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
index 79fc8b80b5..5f7ea00bf1 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
@@ -30,3 +30,5 @@ SYSROOT_DIRS += "${sysconfdir}"
 # otherwise: dbus-dev depends on shadow-sysroot-dev which depends on shadow-sysroot
 # and this has another copy of /etc/login.defs already provided by shadow
 PACKAGES = ""
+
+inherit nopackages
-- 
2.17.1

