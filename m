Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.12742.1596464861739642576
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HUvxxAyJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id p1so20741204pls.4
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 07:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VThXWq+BkLkXXWms4n4UMXQiWSUCYdaxYvvP/8gWXrk=;
        b=HUvxxAyJfDmOF8hIyQPnxoVgtLh/g6miGzoQC2M2xXEKoOoixRREoZtdtXd//aRPyE
         5qzbqoOaamsn4TZHDvP2JKZLcf5OcqzVfAnRqC724QVGTc9mvBBQAhM1CA2jpiW6lNe9
         vCvuSZQsOpyWnDk4UugUovzA+XTnnC30SXvPSV3EwmD4NdjNVlpzCdrclPedyusa8xPu
         5PgXT6naNS/EDC5AOgdmV1eCX4JSl9PazzCsruNf99iA3UoD7f+akzfm4fbuzGgbSmTk
         DBagA91tUqTh1R6uCvrFx089cK8nh050ZJE1uovdEDvKcMLPDYtFDh+aWLCCZkqmH7ff
         d8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VThXWq+BkLkXXWms4n4UMXQiWSUCYdaxYvvP/8gWXrk=;
        b=Ffegb0E+ISn+r3A13FNqaqo+yu87dvm1DrLEfd6MK3N1fU1gxcOwb+dbajrhJxmzxd
         0c8MUw5VuZkcWHh8+JZAxNboeaAHKpaRHfZQgwNqFJ+y2sefwmpcGRoEgHHJvO9J4PCy
         dji7vuR+SKSaTV79gv3y1q29rRm31t1eFEtqBr653HY5HaXXlb4PhD6kkYbxKxMpDuwK
         Kgk6sSlWv6/fTfihle/pFRSQB05ttQ9VkoZ1AcJQLRe7z3BhiHwmLwT/CF1dVaHY4YPn
         x/pPg0N6XbtzXf+/wbIOhng/77FjBhfxaPTJUyNQbOablNM1hFOLHx0XSeA4yX/abPz4
         Z+lQ==
X-Gm-Message-State: AOAM531RcZnxxrmfUMEjnpYUTAODNK6XPRQ4Vx+c/EBE3R9vD11wc7eH
	14+/JMEAQ+IEm2OpHMsgBM2d2Vf3Ylo=
X-Google-Smtp-Source: ABdhPJzbx2+1vhKmcmYFSruwCVTQgywEbeHLibNGJSGIUbUwa78g/IK8Aw2QypvBi1OPATqBwrdyiA==
X-Received: by 2002:a17:902:a3c2:: with SMTP id q2mr15320809plb.212.1596464860847;
        Mon, 03 Aug 2020 07:27:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r15sm10913729pfq.189.2020.08.03.07.27.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 07:27:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/12] bind: upgrade 9.11.19 -> 9.11.21
Date: Mon,  3 Aug 2020 04:27:01 -1000
Message-Id: <ad079ab6cce42a76eb4579c0fae1d443df3212dc.1596464561.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596464561.git.steve@sakoman.com>
References: <cover.1596464561.git.steve@sakoman.com>

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

