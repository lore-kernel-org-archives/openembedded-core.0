Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web11.6683.1602744449398119559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 23:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nT5hniVt;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: arabishi900@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id o7so1175214pgv.6
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 23:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ytLfL3ZbPf0qS4xJ7bL+/GCDwnXQaDIUK27BKauvQG8=;
        b=nT5hniVterPAUqzuzSwO5GB2Sy9YAJ60Lx9MeJqNBoVNV0CbJnKvXBLcJvmdJyYR48
         bsQP74YHTfM3K4mjBQZ/zyaUpCjOijptrlbjHwn7Xjb0Nko79Z86byUYLUWIOa3tmakJ
         +PPUAJ8qkwRKkbJ0VFeY5ek0imIj8b8EHSyMGTdYshTR7VGza+MQXtBIjQeCjxhGe/sH
         JGjNlyjwnn3D73VAczpFbNinCTsY6n9jqwXd8U+wlIgoZXgQN2osYT4kbdUJX+0gdoyV
         ZH6dJUU0NgAHh7ezjxusGTMCWP4YvN2X6murtWSGjruQij9ll0iOMOiZzSQfX1z/41sr
         AVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ytLfL3ZbPf0qS4xJ7bL+/GCDwnXQaDIUK27BKauvQG8=;
        b=BYtnTPY8nahhi9KIFYbHcbdZwcGl8mzw4jlAQeHOCar8/tkqqiL4qh0BcKtaY11RFC
         XgKAHkWXn8KwzXe5zNO3vpWjfO9ExycFXXEAi23/OXQtTURrnsJU+j78wiqOh72vUKlb
         iMwOifp3FV3lcpy9oKXH40iBiy9IlpBiOzS2XNYTxqh3BgydoQH94U0s3NfMYUo+vH/Y
         JLk3TESDz1Bc6J4xJEyfDvJ5lTxryGSA1Huup1DnEhQgErgu6G39MLwnXWOwAqggLTcz
         ZC9u9ymkOQPwBLKXMcNcfgHZDl9D7p7SEETANw60Mq9ojwCuU9Ez+wBMbwKdlq6aMsMY
         Jm+A==
X-Gm-Message-State: AOAM533P1k6APXfsUgXMX/PblsjhvuvA1oUSgnnPwKlKd4Diuzmy8LxL
	3vyPKJoC5WY++ZdF58d7pD8hnKwSC4EKjg==
X-Google-Smtp-Source: ABdhPJz1zM0dO6VLR+rHfGsNro7PvhFhdlCAmmYK0mpi+N1Ptg06XHZ9EspokJ0yiw+EhsVysh5Fnw==
X-Received: by 2002:a63:b21e:: with SMTP id x30mr2200011pge.396.1602744448775;
        Wed, 14 Oct 2020 23:47:28 -0700 (PDT)
Return-Path: <arabishi900@gmail.com>
Received: from localhost.localdomain (116-220-34-67.rev.home.ne.jp. [116.220.34.67])
        by smtp.gmail.com with ESMTPSA id r3sm1919886pfl.67.2020.10.14.23.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 23:47:28 -0700 (PDT)
From: "Akira Shibakawa" <arabishi900@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Akira Shibakawa <arabishi900@gmail.com>
Subject: [PATCH 3/3] License-Update: gdk-pixbuf: Fix LICENSE.
Date: Wed, 14 Oct 2020 23:47:13 -0700
Message-Id: <20201015064713.4863-3-arabishi900@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201015064713.4863-1-arabishi900@gmail.com>
References: <20201015064713.4863-1-arabishi900@gmail.com>

As README.md says gdk-pixbuf is under not only LGPLv2.1 but also its
later version, I fixed LICENSE value.

Signed-off-by: Akira Shibakawa <arabishi900@gmail.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
index 0405fa78b5..3dec5ed052 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
@@ -5,7 +5,7 @@ loading (ie. animated GIFs)"
 HOMEPAGE = "https://wiki.gnome.org/Projects/GdkPixbuf"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gdk-pixbuf/issues"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://gdk-pixbuf/gdk-pixbuf.h;endline=26;md5=72b39da7cbdde2e665329fef618e1d6b \
                     "
-- 
2.17.1

