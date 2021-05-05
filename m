Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.10084.1620227982423259629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=InEp09gq;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id y26so2507300eds.4
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hl0McgPYRgGsRZCpYjN4yM0uP5nVF0wEylGufszPmD4=;
        b=InEp09gqC2ffcUVnbIrBwAUtD+evFWoc4DpsLOxznWWAqejaAkkfDGio2SlvqOeOg5
         FE2i+uDehJNpmNManNDFLh7oNqsNX/V1RHSZBrwzNxn3jPqvqUHgp/4jNmQqwXYJuvJF
         LOcokNVe3L/wQX63DwQq+b7pV3NYbSnwD+LuWVOOP3EPTxeJzuHMevImAyhB1sSqv08r
         ZDScIcNOSOJ07IHMk4przhoC/wjcWM7RBCxREqCKqAjfJkHhFTIgylkNlesDGBQaX20+
         uHDgr2T2et0GALqKyJKpZDNmKS9CgruiLLDGlZWBAwuYfa/4QB7d0ojYDQLNkWDTzSIF
         9C9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hl0McgPYRgGsRZCpYjN4yM0uP5nVF0wEylGufszPmD4=;
        b=CHqcm7/3HUCXX5FfhQlzcRN0I1Zn4Bxw3avRK6FVDd5f5/OQebCP71Thzkfd5UFU9s
         cU31U4aSRr1sZKG881hX5i3yvIbiQbSJh62KyN1B5GGBRls+R5fiTCF4rbplwi2cczJw
         dkNCvNM3bPjYppbCr4CJ6r8DnhhfgWogwLQufqKJ6hr+lByMOm4aKiKXWxLW9FCJelaj
         aoEikGUwfdoTsoT0XuFBYXBzYekVcIwlFBMt8C92x8oI+xLkWx6XwJb8GtqD4bR1XaMG
         GZZjdOKuEMWXhIF7nwIPZgGlFb4J2nYMrjJMx6TtitTlHczQMH9z04+tUeQXfhK4Y0UG
         c3/A==
X-Gm-Message-State: AOAM533tr/cxzZoSuVvzmy3OGA0ES9Ky+oRzgXApg/v8duacYxpKcTW4
	VteIpcr9etUsQ6Mz4JU1GcOoGRCow+0zcQ==
X-Google-Smtp-Source: ABdhPJzQC5S12vVBFyrox3ui6Gzt06rDVK4+3YMxHaYHBMOYzgN5enaNQoOyaXV6Gf0giqvkNVJ4lw==
X-Received: by 2002:a50:ed03:: with SMTP id j3mr32442975eds.334.1620227981050;
        Wed, 05 May 2021 08:19:41 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:40 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 55/61] xorgproto: upgrade 2020.1 -> 2021.3
Date: Wed,  5 May 2021 17:18:44 +0200
Message-Id: <20210505151850.660512-55-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: formatting

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-proto/{xorgproto_2020.1.bb => xorgproto_2021.3.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xorgproto_2020.1.bb => xorgproto_2021.3.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2021.3.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb
rename to meta/recipes-graphics/xorg-proto/xorgproto_2021.3.bb
index c71bc9038f..fa0c69af1f 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2021.3.bb
@@ -1,4 +1,3 @@
-
 SUMMARY = "X Window System unified protocol definitions"
 DESCRIPTION = "This package provides the headers and specification documents defining \
 the core protocol and (many) extensions for the X Window System"
@@ -7,11 +6,10 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
 
 SECTION = "x11/libs"
 LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=b9e051107d5628966739a0b2e9b32676"
+LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=dfc4bd2b0568b31725b85b0604e69b56"
 
 SRC_URI = "${XORG_MIRROR}/individual/proto/${BP}.tar.bz2"
-SRC_URI[md5sum] = "c29f4fa78f53b52b3efdc71ebd9506b6"
-SRC_URI[sha256sum] = "54a153f139035a376c075845dd058049177212da94d7a9707cf9468367b699d2"
+SRC_URI[sha256sum] = "4c732b14fc7c7db64306374d9e8386d6172edbb93f587614df1938b9d9b9d737"
 
 inherit meson
 
-- 
2.31.1

