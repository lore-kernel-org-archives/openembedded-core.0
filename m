Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web08.7277.1605780514938793935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 02:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qyRCQtbE;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: wickbergster@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id z21so7365005lfe.12
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 02:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l7RfDcex7oheV9KlumDH6JzSQ1fSiITshwiYP+AfoV4=;
        b=qyRCQtbEWQfJWrjfmKNDW3jnfi/3xk+hXf9aVKM8W6Gp6LLcLz00N66bcJzJ0sNgTZ
         Iy1DBFlLq9zvfXsMyepmyXhT1bDmXabBLs+37Zo5DLDzQNQFVCWNIUbQAvP90GYz2crS
         nZOCFsU3gfUXdt8bUil4sYCiqmdrx4Lxy7kLCOgER0aZO9oVRnK0EPw+3pk/MOfKQ9vz
         oVop6kkqmX9DnesKN3AodQ2pS+rYA6Yy9aD4GoyYFt5pyOUeMpKxQCL/2WsSv/bMTj/V
         ALSgXwGGquQso7ZDow8vokdmlgW097PQW0kt9kgW0YnBQjFB/zKuzTiASOoHR/u6YrJ8
         Hq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l7RfDcex7oheV9KlumDH6JzSQ1fSiITshwiYP+AfoV4=;
        b=TlqrrKHJm22bkY+wyI3Ewy0G7naVRGwNiH9QCe0P/UbdQMK/v0BN9rE8tg8sq2RtB2
         6q0z47jEEZggY2zE5SxCl4Xmvy/yskN0RWrqYyIKkDYT4aIpwYa/q8E1Bi0BXr5+7yoX
         qHcsF55xGr9aYx8GFBR3O2wLLeiexrdUGj24ytgNEI91vJDOhvotOTdrZaNLOTOyuF3l
         JI4B2HUcpeXqL3EnC9K77qd1uFSDi43jw9FblzuXV9pDbnwhNT5++37uAfO1EkClCi5i
         G3H/wGrieXBmI0PWGJlJcbEycIOo6TYgPJKoIVanTWm1FFuZ3aGwluWvqKkU6XaPGcOa
         Sd7g==
X-Gm-Message-State: AOAM533HFjyNOeAaF0Ngw+sZY44gM/PW6x3aPaUUxDWvCaE8vFKGqPfW
	3s2sb+fceTCb5AMNzWXNlit1NUKP3Tk=
X-Google-Smtp-Source: ABdhPJzNRmAKJfK7BxnSmEh5z6FJM39EzMEZUWnbOtD5tXxoMtlfNl3LCIxmVse+5xYEGDLAVqMb/Q==
X-Received: by 2002:ac2:456a:: with SMTP id k10mr5826912lfm.88.1605780512658;
        Thu, 19 Nov 2020 02:08:32 -0800 (PST)
Return-Path: <wickbergster@gmail.com>
Received: from localhost.localdomain (dyn-13-cust157.netit.se. [85.89.70.157])
        by smtp.gmail.com with ESMTPSA id a1sm3915223lfg.282.2020.11.19.02.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 02:08:31 -0800 (PST)
From: "Alexander Vickberg" <wickbergster@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Vickberg <wickbergster@gmail.com>
Subject: [PATCH] socat: make building with OpenSSL support optional
Date: Thu, 19 Nov 2020 11:06:14 +0100
Message-Id: <20201119100614.512998-1-wickbergster@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
---
 meta/recipes-connectivity/socat/socat_1.7.3.4.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.4.bb b/meta/recipes-connectivity/socat/socat_1.7.3.4.bb
index 9b0d4071ac..f3f569d262 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.4.bb
@@ -5,8 +5,6 @@ HOMEPAGE = "http://www.dest-unreach.org/socat/"
 
 SECTION = "console/network"
 
-DEPENDS = "openssl"
-
 LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=257;endline=287;md5=338c05eadd013872abb1d6e198e10a3f"
@@ -39,10 +37,11 @@ TERMBITS_SHIFTS_powerpc64 = "sc_cv_sys_crdly_shift=12 \
                              sc_cv_sys_tabdly_shift=10 \
                              sc_cv_sys_csize_shift=8"
 
-PACKAGECONFIG_class-target ??= "tcp-wrappers readline"
-PACKAGECONFIG ??= "readline"
+PACKAGECONFIG_class-target ??= "tcp-wrappers readline openssl"
+PACKAGECONFIG ??= "readline openssl"
 PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
+PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 
 CFLAGS += "-fcommon"
 
-- 
2.25.1

