Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.9990.1614349630681321000
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:27:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0eE5Dk3e;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.42, mailfrom: steve@sakoman.com)
Received: by mail-io1-f42.google.com with SMTP id u20so9780402iot.9
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JfN201fcO0PErchMrLtBTY0Xmnt02fbc1uuBodkVPkg=;
        b=0eE5Dk3eIbVMVmcGyxjnbUmRSkMQs7vn99LEe4rUP+fQpkUDC/j0RoaTmggqWvosQc
         Zha+6wYqaZyQ65iMcraCRcWpQOWe6Q27poXfv4RGt3pRkJc3arMN5sSRDDd9wluqS5e8
         ntlhBTQyxg9+vv2BSw8krY08CmSxsKmuEjoMRxhNqXb49oYIl6QQESFgvbh75ldH7Nq0
         D4K505w0qc+FBAycqyZMlStzzi0o2Mf62/HNXv6wlbMQ+uRa85eSO42LkrlF2cxfpFJd
         vKx4AVZECsNF5bwv8RmYwy0JKRHmtH0zjllyNCtPZAjJCrEdGzY3b5GthqPh5RZcUJ3E
         m/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JfN201fcO0PErchMrLtBTY0Xmnt02fbc1uuBodkVPkg=;
        b=XNOlN86Mz8YylByx0YiJHiEoXj27WpvKGEBRXBrODAxukFZ70een8Oh5IcvkzN3img
         cMvdJkiZ6ArE47W88RsOm7RYau3QI26bvP5vAWw1MMIy/QT4raGf4pjwRDF40T8egZoi
         XWvA+1b8ORQKWQ/FIYvDJpgyXKrFU5vKYahggY1i3fXZ+p4j5fTw5VmQtnktUKyiL6z3
         0U+Xg2MSwSKcV5efioIdCJUnPkNDkY/EcrPoPzVLF2tD+aUBdv06Thv/ElmZKIgUacpk
         SZBCAOqoiWXYAA803gq4Jsh/YdbaiZc5YGMVvOMX5kwfkwMqJrpBT1++dXthx2br3TQ7
         2IaA==
X-Gm-Message-State: AOAM533v8HnXGxgbwqHHudD1/E5hycjv2LU1xRzSgHOMsOombLwsS04a
	+UTuSslBAbFpZjnBgRETv5pbf8ELqPh4WLPb
X-Google-Smtp-Source: ABdhPJyQiQAjWGs5E82VmqLEWSrRekxQAkgziMYFNRZ2y5rpDFPCIobeKokmXyuTigvLkfCoMAwE9A==
X-Received: by 2002:a05:6602:2c52:: with SMTP id x18mr3033085iov.5.1614349629454;
        Fri, 26 Feb 2021 06:27:09 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.27.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:27:09 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 26/40] xmlto: Fix reproducibility
Date: Fri, 26 Feb 2021 04:24:09 -1000
Message-Id: <2cbc9d6b150e3e21c2901454fdc121890fc925ef.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Don't hardcode the host's grep path into xmlto.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a7d78971df193c321c309481749fc30cae77788c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 7d27c43c83..5ed2709e31 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -29,7 +29,7 @@ RDEPENDS_${PN}_append_class-target = " \
                   libxslt-bin \
                   coreutils \
 "
-CACHED_CONFIGUREVARS += "ac_cv_path_TAIL=tail"
+CACHED_CONFIGUREVARS += "ac_cv_path_TAIL=tail ac_cv_path_GREP=grep"
 
 BBCLASSEXTEND = "native"
 
-- 
2.25.1

