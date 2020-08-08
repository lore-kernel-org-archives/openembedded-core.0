Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.3064.1596883307502230410
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2020 03:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d1FmxeW2;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id l4so4578352ejd.13
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2020 03:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wt20h+/N9TlD5bFbwN25UZVexnDTAgzZ2IzRsn2MAQ8=;
        b=d1FmxeW2t0JEfYQV/gUs4mL0r3q7PhcB9IC21NAuQVt4N2JFRIzpg63P38ctBz064d
         zQ1LAL0GWVymHz7+u9eX6Vr7zWQxcmkOXFt6kNmUtE1pA/afeMCVrRlwJZFlvnIBmK35
         bNaLVSXRy3J5FQZRCCTINSfK3SZMRjYcrwArbFE4roZJ583o0yRmpaH5bvya43lY96ou
         zkJdCaqCxS3ONBYUxNwoUQWfJ5Ji6JJ5Y8FoEw8LTt893HGi7w9hvMh9iRg8+xzQNSwP
         ffGUv1MffNSQ/3KTZcwVNAuj5qPDwkktylRXJiqgNvR7cIj4szcb8Ig1bUyhT+pLcSmQ
         G2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wt20h+/N9TlD5bFbwN25UZVexnDTAgzZ2IzRsn2MAQ8=;
        b=GMHUD1cd4Hh3dNaXBf7ChEJ8fT2CusdnBFwhkh/aCK06De0RxTcUEQ6eXGmtDOzQLt
         XKloKmG+1sDVJH5yNzLVC3zzGWzdlvNu84KSmfBaiGweaKAzQYIiG7JhGcGdsqs9gaFO
         B8jOMl9dEzQUgsboF8OCDLcIdMqqlUAgSWGTIW3Vo4SLbDaoSSjdZEm5u2BTO+h/+0Rx
         8QFlNH2RLcNGKkrWfDN+EkLIK1ocHHclMvk/8cWjCkiymSpiJQThNPGrhRQSccDPOPam
         jhJcVR/GuE3Kqzx3QQtiWciYY7Or6V0BaLWFfjRxuYbo07icjO7Q2teU7fwWYJnajwYw
         CxyA==
X-Gm-Message-State: AOAM532olDlYaFzVFmuglWnKS0lwAvXVawVsjhnPpZmcjvtvgAtmrzOU
	HvXgx7ygBRjrHBGPqNeWm0kGXqxF
X-Google-Smtp-Source: ABdhPJwjjbWpIdWzPwEUlEEarhAsEBJyqIY3KzNr/EJhOJg15EvoTHOm4xSv8iU4yv9J+b5jxx3hfQ==
X-Received: by 2002:a17:906:a081:: with SMTP id q1mr12815294ejy.499.1596883305852;
        Sat, 08 Aug 2020 03:41:45 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id dc12sm7808015ejb.124.2020.08.08.03.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 03:41:45 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] libhandy: upstream has moved to gnome
Date: Sat,  8 Aug 2020 12:41:28 +0200
Message-Id: <20200808104128.28523-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/libhandy/libhandy_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libhandy/libhandy_git.bb b/meta/recipes-gnome/libhandy/libhandy_git.bb
index 64258941ee..9f74014640 100644
--- a/meta/recipes-gnome/libhandy/libhandy_git.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "A library full of GTK+ widgets for mobile phones"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://source.puri.sm/Librem5/${BPN}.git;protocol=https"
+SRC_URI = "git://gitlab.gnome.org/GNOME/${BPN}.git;protocol=https"
 SRCREV = "7a193d7692c9c76a1a94f17c4d30b585f77d177c"
 S = "${WORKDIR}/git"
 PV = "0.0.13"
-- 
2.28.0

