Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.2895.1593155969393671054
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FjhZZVXI;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id ga4so8331929ejb.11
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4hrikHhMv5TKYc5iJv5+gOT7Yb7dIftWD30HA2apIzU=;
        b=FjhZZVXInodXZ0SQA4bm0jPHRbOfqwhlX9o7ni0xPWZj6pBSHmm21qcmK65oOUv5BW
         g8LOZm605lasg0LiC+l6n2PotPQtOG0gcGLduAkPZkbMTL9vnfoHS96iIqAnmRqGE8Ac
         SjpKwbDgLctes8N+oWSPlokkOf1N0bO56VNbHbDxfbyH3SWQN0n9n303WzMcf4jCLLt1
         83gRXYmltpIqI0bBM2qhfgbKhKszsHeXV9tx+ODUFp18z9r4Ig+Jh46fqJvu7ojMDYA8
         n4TSiQQUdNSQwM+YcyyZN+1c2DNCexfB29zcJH9a/72iqy/RK/t91gkwGYgmZVZKpbpA
         rXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4hrikHhMv5TKYc5iJv5+gOT7Yb7dIftWD30HA2apIzU=;
        b=eyoQ+PG/xZiW6t6K5ucg64ognBXKH1JJUrx9Csbeou6ZwmPHGU9JMDWXirROBt1A1k
         0XfTtkwh5yJoBco9Kp2kdFzMfNqLKzMcKLYPgOw1FXIDmyWxHOLhnwwjXODFIoYkV+Ss
         SSVYAvYmXYNgTJT7qb0p2A1c4Meu3XG+wSeThWEvIblupn/hygyl4rp4Q+YxfFcz0Gu/
         7SUJAaLzJXTSIwp6CtU5ql1Nk/at5Ciech8ugXanKoa6tv5wrj5IVVwiM1wnZac0JWec
         B8GvcuSd+aM4XlrH0OIGQN/0MM8wxGnACORFto7En8+hFvkzkG3hyw90YpwqPt/6QoLt
         NDmA==
X-Gm-Message-State: AOAM530a6j2bWkiWWikWiBUbVV1IidOjtS4//TSXGOYt0nP2LPGfk2r1
	5fKECKTaiaDAWqoZTK2pWJADcQWqjis=
X-Google-Smtp-Source: ABdhPJyyr0RgKiV+G1V/Vj+7+tdAznXI+YZZB1Kx05VdTRIXr9WdVEGIFHSwEe2vYv2L9J7+a6+YhQ==
X-Received: by 2002:a17:906:7693:: with SMTP id o19mr1300179ejm.295.1593155967590;
        Fri, 26 Jun 2020 00:19:27 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:26 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 25/30] sudo: upgrade 1.9.0 -> 1.9.1
Date: Fri, 26 Jun 2020 09:18:39 +0200
Message-Id: <20200626071844.29134-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the patch as it is merged upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...lude-sys-types.h-for-id_t-definition.patch | 34 -------------------
 .../sudo/{sudo_1.9.0.bb => sudo_1.9.1.bb}     |  8 ++---
 2 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-extended/sudo/sudo/0001-Include-sys-types.h-for-id_t-definition.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.0.bb => sudo_1.9.1.bb} (84%)

diff --git a/meta/recipes-extended/sudo/sudo/0001-Include-sys-types.h-for-id_t-definition.patch b/meta/recipes-extended/sudo/sudo/0001-Include-sys-types.h-for-id_t-definition.patch
deleted file mode 100644
index eb36cd49bb..0000000000
--- a/meta/recipes-extended/sudo/sudo/0001-Include-sys-types.h-for-id_t-definition.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 386e2c2fa2ab2e02ef71c268a57205139be329ab Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 31 Aug 2015 07:07:49 +0000
-Subject: [PATCH] Include sys/types.h for id_t definition
-
-/sudo_util.h:219:14: error: unknown type name 'id_t'
- __dso_public id_t sudo_strtoid_v1(const char *str, const char *sep,
- char **endp, const char **errstr);
-               ^
-	       make[1]: *** [preserve_fds.o] Error 1
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- include/sudo_util.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/sudo_util.h b/include/sudo_util.h
-index 89c9f89..ac0855a 100644
---- a/include/sudo_util.h
-+++ b/include/sudo_util.h
-@@ -17,6 +17,8 @@
- #ifndef SUDO_UTIL_H
- #define SUDO_UTIL_H
- 
-+#include <sys/types.h>
-+
- #ifdef HAVE_STDBOOL_H
- # include <stdbool.h>
- #else
--- 
-2.5.1
-
diff --git a/meta/recipes-extended/sudo/sudo_1.9.0.bb b/meta/recipes-extended/sudo/sudo_1.9.1.bb
similarity index 84%
rename from meta/recipes-extended/sudo/sudo_1.9.0.bb
rename to meta/recipes-extended/sudo/sudo_1.9.1.bb
index 76266537b6..aac505af60 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.0.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.1.bb
@@ -2,13 +2,11 @@ require sudo.inc
 
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           file://0001-Include-sys-types.h-for-id_t-definition.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "060b91a6b171cb7ce587222664549b2c"
-SRC_URI[sha256sum] = "ab231439c5dfdf4ecbef74f10d5f7e9686c2255c2f3887085b5c5e13281bf95c"
+SRC_URI[sha256sum] = "294116cefe10a02773917fc7440d8384b925955bc96a6e0eaa1977c83b34adff"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
@@ -39,8 +37,8 @@ do_install_append () {
 	chmod 4111 ${D}${bindir}/sudo
 	chmod 0440 ${D}${sysconfdir}/sudoers
 
-	# Explicitly remove the /run directory to avoid QA error
-	rmdir -p --ignore-fail-on-non-empty ${D}/run/sudo
+	# Explicitly remove the /sudo directory to avoid QA error
+	rmdir -p --ignore-fail-on-non-empty ${D}/sudo
 }
 
 FILES_${PN} += "${nonarch_libdir}/tmpfiles.d"
-- 
2.27.0

