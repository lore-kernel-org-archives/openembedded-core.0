Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.8721.1596639020227469673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 07:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=n6b/6pWW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id w17so25360562ply.11
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VThXWq+BkLkXXWms4n4UMXQiWSUCYdaxYvvP/8gWXrk=;
        b=n6b/6pWWRIvypN/zfmCMtMoDe7V+IVcjSZ4lgam2Pi4GUosV2WuuCLRLE56kKOMfDi
         PReqpFI58p6qq/dJ5ice8Wm9tBwkVGx0sTZBs4C1QoHvldNqq/RKVSuAKFZ96/JdthGs
         fiA5Dw7UeXUUxjOzrBYg9NCl5QSUplWlK3VELl9jrBODUmhbyzF0P3lhPcFSZMuPB4Tt
         /vfO2hBbuj+W31/la8Lg/esNVOk9CBWHl5r2t7TBlKkoe3Lq3GsDG9AmSjoEeBgjZ9hz
         OO0qeJ0LW+M/uszNjQkTUIs5diEPB/YyV8jFJ4YEHnwa/xsPnn+O8Tit0jLdmIl+YQyB
         tnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VThXWq+BkLkXXWms4n4UMXQiWSUCYdaxYvvP/8gWXrk=;
        b=GRKc6SjU1tNJWaolkiGxLaTnD5wIkTcGezNyf1rgJh93ItU9jJJtfTIVkABIauWmP9
         c+SYwJN1o0flJPOO0X5U8RhmWRHXOkWSfsA+2xh3AzlrGS8su8tRjtbUOjNml1OYYnOy
         IgEyL/p4rK1g5+GUFTQHXyh72eHMYIU5YCzwudZebD5rfKJVJ4SNFpmlMn2y7I7ZnGhQ
         Ca2uJ62lb7A19IP/DKHWb31gFBjiqr+RGoZnimxAJjLL0RZ3Mj+WgoUG0cgAi2DffPOU
         A/XSyQqUWzVW5t/Vcrd2s2YaqcRktpWXi27vWjTC7oeL399KUO0ofXr2nvXTVOcSWLEG
         edPA==
X-Gm-Message-State: AOAM531lxpIaoWJD91ZlHWgVOX/TJYxkc+rxGs8/4txcDakRO7VHAlDU
	/tVFa1CaH8CENJwRlShZFQq58KpbNzQ=
X-Google-Smtp-Source: ABdhPJzyzOMTIG4em4pUt3y4oTfnfctqQAt4UUcnfTk0g9nENlJiK5NRVjKkjJOOZFPK0TJJPAjWHA==
X-Received: by 2002:a17:90a:87:: with SMTP id a7mr3457550pja.14.1596639019333;
        Wed, 05 Aug 2020 07:50:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d81sm3879721pfd.174.2020.08.05.07.50.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 07:50:18 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 07/11] bind: upgrade 9.11.19 -> 9.11.21
Date: Wed,  5 Aug 2020 04:49:30 -1000
Message-Id: <dc916547041b8d7636e5234f7e3150036bbbde4a.1596638643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596638643.git.steve@sakoman.com>
References: <cover.1596638643.git.steve@sakoman.com>

From: Yi Zhao <yi.zhao@windriver.com>

Bug and CVE fixes only

Detailed list of changes at:
https://gitlab.isc.org/isc-projects/bind9/-/blob/v9_11_21/CHANGES

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c6749532f94f435e6771d66d3fa225e676753478)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.11.19.bb => bind_9.11.21.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.19.bb => bind_9.11.21.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.19.bb b/meta/recipes-connectivity/bind/bind_9.11.21.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.11.19.bb
rename to meta/recipes-connectivity/bind/bind_9.11.21.bb
index 276173e09f..ee546a0a2c 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.19.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.21.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "0dee554a4caa368948b32da9a0c97b516c19103bc13ff5b3762c5d8552f52329"
+SRC_URI[sha256sum] = "668158b005b3de4328fa0dbbbb3f524b66f28f024c67538aa9412a9e69c9dfbc"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
-- 
2.17.1

