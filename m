Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.4587.1596317033944725192
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2020 14:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Olr3USeU;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id qc22so20051861ejb.4
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2020 14:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qjOO+2v+nJhCcNqmWbHrirUhMbmJlhlmlOQ9lpldvX0=;
        b=Olr3USeU6BmBkFAE+BDackqUmVYrf24XpCeN49ksgiMU0DODX8A0fKwjXaCb82nUTe
         Ved7TcWtRStUNduRYec3Cu7Vjy9qCCnVfNZ1EMIKuXje0e5TAfFHXnVdkzv6CPa9tNPB
         a4Fvrknyflnxmuyb5Jo3dCNKF/ymvQnghd+v2wN5RwjjZdmJrBQF/llqgpbhBUWr0TDs
         3gimRLlS05i/cuXkq6ydzg9EfvOrp+GPEPlW0eqKnL1HkBR8ZyWgzUOLjbQvRZIwoOhp
         gf6qlZ2zTq1JgS4Cv6kr9xLJBERjtfITmtghhC1psICC95XYvXeyh8YpMGmdNjv/e3Lr
         gbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qjOO+2v+nJhCcNqmWbHrirUhMbmJlhlmlOQ9lpldvX0=;
        b=dDP2A5RU8yb8czfUrB0Za3fLvHSdWH/Zih3lwAQLM8rs82rNkmnKk8OyDZaXjvaW77
         aFszGliABVbebOIEB7RZBZs5kW8e/qzf9bhC0pePEBBDWQBEFk13bAj0ybr9vQZUZv5o
         +gwhG153Zy/syHiDcA/0pvsOc0GGbrRCt81QQAyzisMz7jcZvTYZACTVWrVinT5NCDmf
         potq9zEryfoG2y4QoKjon6DyQDLX4Kzmt52czteOtwF1Dd/9zIZ7y4oOQOjXd+xYrC35
         OoI7bctc1NhgWatcVuboQrjug56VJvnHiJvZ2wkmQZ/9jMsLmKAYH8bxtBpj8CvJRxaD
         MSNA==
X-Gm-Message-State: AOAM530wn9mz0cVecN4zpwyL57jCd66/UCAa11X/c8L9UOaFlQNwYlam
	5fLDKIFC9WEnPoSy2nRIY2QDOLN8tMA=
X-Google-Smtp-Source: ABdhPJx+R9dKNOpfKvXBNV+dfTVHwmTSTGblmZPO7HmVEuKJN64wa4aHOBwzOYRzyiYP5BYj4/hk5g==
X-Received: by 2002:a17:906:5812:: with SMTP id m18mr10169173ejq.66.1596317032300;
        Sat, 01 Aug 2020 14:23:52 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id cm22sm12168803edb.44.2020.08.01.14.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 14:23:51 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/13] mesa: update 20.1.2 -> 20.1.4
Date: Sat,  1 Aug 2020 23:23:33 +0200
Message-Id: <20200801212335.14922-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200801212335.14922-1-alex.kanavin@gmail.com>
References: <20200801212335.14922-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../files/0002-meson.build-make-TLS-ELF-optional.patch    | 8 ++++----
 .../mesa/{mesa-gl_20.1.2.bb => mesa-gl_20.1.4.bb}         | 0
 meta/recipes-graphics/mesa/mesa.inc                       | 2 +-
 .../mesa/{mesa_20.1.2.bb => mesa_20.1.4.bb}               | 0
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_20.1.2.bb => mesa-gl_20.1.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_20.1.2.bb => mesa_20.1.4.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
index 91e59d14ed..ee171ad1c8 100644
--- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
@@ -1,4 +1,4 @@
-From dd1d15c75f6ff8ee96cf1e7b74e582bff3183ef6 Mon Sep 17 00:00:00 2001
+From 65857eaee12a21a631750ffcd9e64e0afbbc3af0 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:08:31 -0800
 Subject: [PATCH] meson.build: make TLS ELF optional
@@ -15,15 +15,15 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 261b588..311436e 100644
+index c51dde9..c16f78f 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -392,7 +392,7 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless or with_plat
  endif
  
  # Android uses emutls for versions <= P/28. For USE_ELF_TLS we need ELF TLS.
--if host_machine.system() != 'windows' and (not with_platform_android or get_option('platform-sdk-version') >= 29)
-+if (not with_platform_android or get_option('platform-sdk-version') >= 29) and get_option('elf-tls')
+-if not ['windows', 'freebsd'].contains(host_machine.system()) and (not with_platform_android or get_option('platform-sdk-version') >= 29)
++if not ['windows', 'freebsd'].contains(host_machine.system()) and (not with_platform_android or get_option('platform-sdk-version') >= 29) and get_option('elf-tls')
    pre_args += '-DUSE_ELF_TLS'
  endif
  
diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.1.2.bb b/meta/recipes-graphics/mesa/mesa-gl_20.1.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_20.1.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_20.1.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6fd92035f0..8d8e5288a9 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,7 +23,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[sha256sum] = "283dff72814c8a80ce1ff8271e3f055895d26f4da3f4362acc49193e635780cb"
+SRC_URI[sha256sum] = "6800271c2be2a0447510eb4e9b67edd9521859a4d565310617c4b359eb6799fe"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_20.1.2.bb b/meta/recipes-graphics/mesa/mesa_20.1.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_20.1.2.bb
rename to meta/recipes-graphics/mesa/mesa_20.1.4.bb
-- 
2.27.0

