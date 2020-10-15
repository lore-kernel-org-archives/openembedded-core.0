Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.6737.1602744442112364098
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 23:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HEpd+0Aq;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: arabishi900@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id gm14so1247999pjb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 23:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=568D8qHQ42IYXPXWsfZ/kQZ94swK/nvR0GDEqJsXY/U=;
        b=HEpd+0Aqar4m6g+JAQOoNiEjwT6P4V21NviZRPgSE5y5VCTtL3kPhge0Pt+Yt2Wml0
         Dy9MVjxHxLTAke1hwGrz0qgj+uuiutlxEDDfoQMqD1t7r8kmp6DnQykaEea9JOU7aGmf
         EvmbrbMI0hNIzX1JaxCxq1zY5aWFnT08yAx4hnN1OHI/KSo/gZktVdgl696pNJ2IYpnO
         rk09kBrGb8m/hECFJLmknFtNkXmClBQHF0Ynbnwc8A4N/P9SrQusgwlUqCzU8FpoAvTw
         C3tueK5LVf5Sy+krOR65ieuBNCWNMoT5CxAdvPm7cL6KONLBKC8pBrCKxoQ8osJCrJnw
         F3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=568D8qHQ42IYXPXWsfZ/kQZ94swK/nvR0GDEqJsXY/U=;
        b=graN5NkpZnsVlK63K+As+K4uv6tAWMj2xbRRQoUp8l/UEfacVklpSxD7m/SYEqS5sN
         MOyB2PxGqwWbGTKguEh4YoQOwDJL6eLvQF2B0/rRpwxuTFAb0pSHpvMFYgm+RSBTg2B9
         A1OhA2MzXIdqvYjaApUEogZ+lGr8SbO+VWRH+ikClv5Q4pcCtlkq1+yAVQja5q4pK7w8
         2ikEUHft3lPGP2vqLL/RrNThkqszuIBB0YRkK6kFwvnSJf+xk09kT0cJOtJb7+PcuIJc
         wx/WnWRfIXGLd6gLsBH1Gfu3Zd3Wwxb0HUpwGBE67OOfu1otbFmMDG+5+e1y4rHoXVwQ
         tLaw==
X-Gm-Message-State: AOAM5321/Qpa4Cpj8Fd2q30iFEaTtyVjokHepOn1BORMdR//zOi+2vUa
	J8dulTdVXKK5rumPzeukH6A6dTQUf+Wjvg==
X-Google-Smtp-Source: ABdhPJzv4hHQCoRdUM47CedKqbGziuMZVAtEKDVJj4j/hNsXpnY11W6HLoUJBUyB1V0xVfckfEIOxg==
X-Received: by 2002:a17:90a:db91:: with SMTP id h17mr2905149pjv.94.1602744441365;
        Wed, 14 Oct 2020 23:47:21 -0700 (PDT)
Return-Path: <arabishi900@gmail.com>
Received: from localhost.localdomain (116-220-34-67.rev.home.ne.jp. [116.220.34.67])
        by smtp.gmail.com with ESMTPSA id r3sm1919886pfl.67.2020.10.14.23.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 23:47:20 -0700 (PDT)
From: arabishi900@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Akira Shibakawa <arabishi900@gmail.com>
Subject: [PATCH 1/3] License-Update: attr: Add a lucking file to LIC_FILES_CHKSUM.
Date: Wed, 14 Oct 2020 23:47:11 -0700
Message-Id: <20201015064713.4863-1-arabishi900@gmail.com>
X-Mailer: git-send-email 2.17.1

Although attr is licensed under LGPLv2.1 and GPLv2, LIC_FILES_CHKSUM
does not include license file of LGPLv2.1, COPYING.LGPL.

Signed-off-by: Akira Shibakawa <arabishi900@gmail.com>
---
 meta/recipes-support/attr/attr.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index f13a83a7b4..0c3330a686 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -8,6 +8,7 @@ LICENSE = "LGPLv2.1+ & GPLv2+"
 LICENSE_${PN} = "GPLv2+"
 LICENSE_lib${BPN} = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=2d0aa14b3fce4694e4f615e30186335f \
+                    file://doc/COPYING.LGPL;md5=b8d31f339300bc239d73461d68e77b9c \
                     file://tools/attr.c;endline=17;md5=be0403261f0847e5f43ed5b08d19593c \
                     file://libattr/libattr.c;endline=17;md5=7970f77049f8fa1199fff62a7ab724fb"
 
-- 
2.17.1

