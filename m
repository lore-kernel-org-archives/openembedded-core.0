Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.8851.1632493012318997783
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Fbka23Vi;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id gj8-20020a17090b108800b0019e8deab37bso1269523pjb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wyA1qSM4FKdTKkPqCz/uoskw3X1a6Uglbc2Q8dqZV9M=;
        b=Fbka23Viyr0lem/1XCrBCIpx5l5pfHWQnBpUowKimMLuAa7OS/s/ed2lGrcxOcy01b
         K0WX1r5+NheCr5Hu/RTQQ6l6LlwDQFu9PKLDi4pPaqmdMMC0qeUsyAHwdvA4klfg7Hun
         eRgh9LbdPbAO8JZz8sVuPCAbZ19HDl7IgzQO3EzbMNrtzKlxqo1qBVTpfxLQmAy9Fvp/
         0/4Zjk852wb7bIq70h+XJOkpAyq9mztBWHey1pYZGlMgwIjB1Q/YEWd6ciKykW3E4nEm
         /YoZFqQ4YNPbfIL9TTdijc/iqSWGevSQVEJHTUTHdnlSMhJQPZ/lHdXAanQnBk+Mkm5w
         TjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wyA1qSM4FKdTKkPqCz/uoskw3X1a6Uglbc2Q8dqZV9M=;
        b=ir/LSG646GTXe/TVxwp8HRPKcLYsRwCY4sTQU+h3QS4Jo6lb/Ao6IkAyWRi9nbRjUC
         0PnYD3UMI9tjWClE276MS+HNJ1mmQw6H1PlV9B1eaqzo4Pj8ucMfcHFME+dFrXmvpuig
         RFvnO4xYwIjH0j98c2ZnzLutPEs9Sf1tg7o93HMIoNYdybeTp85qu8bvdTHMLRROOIgL
         0vN7STyMbelBaC6+y+HWf8ykFYDIu0UMZx7mjBuUgQscvD/D2JZFqGZEoJAQsKUFCB6Z
         M8bmAgBDnz2IgJbDkgLkG0w7F72GHhs7VNaBjp6JfW+FH+dsdD9QeMENcoseALFnBERJ
         0xyw==
X-Gm-Message-State: AOAM532IbaV5PfnWqETg47wL7ALMCM1yHzXxaKi2fwI+Yla8m5Sf548u
	3SO8txfDzmosdacjjcDfdr/Eyvx+S38H5jhDprE=
X-Google-Smtp-Source: ABdhPJxW8HQ2gpjlAGpIkxzj2wxUz5JBP3jTe5VE3Oz7H/c2Zr9QVMUrVjmntY62RKlW7E6KEG2BEQ==
X-Received: by 2002:a17:90b:4a8b:: with SMTP id lp11mr2481172pjb.197.1632493011413;
        Fri, 24 Sep 2021 07:16:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/25] libsoup-2.4: remove obsolete intltool dependency
Date: Fri, 24 Sep 2021 04:15:28 -1000
Message-Id: <e206ee4ddfeaf0381614d635216acdc59cd8cb16.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

This hasn't been needed since libsoup 2.65.2.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 250a3f9a804917c8a9427d0209365d27b1b8fa4a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb
index 65b32557e7..e42ac30bf2 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb
@@ -7,7 +7,7 @@ SECTION = "x11/gnome/libs"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native libpsl"
+DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-- 
2.25.1

