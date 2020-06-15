Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.26494.1592249779647601828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=2CRbMc7D;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id u8so265801pje.4
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zYm1kpFv7tQIrDGn7Kn6OTcAQcT440JksllHZoEWZMU=;
        b=2CRbMc7DY4kDyYhLEBkEKR+ypBJOQTx1ezxViB63ek7JEnehYQrF35yEu6tPJesxS5
         WfOwastYGuVdAw/SQsMkdQKZXnIe60BjVTYn0+FVY0+BhJKbBMT6DV4ZoNd/e0Fnvuxo
         hF+Dk2cStVrJTdou8Vhm/AgE3nzCrxE0rlhzMFZ3L3t509mmlvxdxEcOklY30+gk/BOl
         +MBIwBt7m08H7JKp2xLqVaT6fE8Hn8LuDPpixq/rzGu6VvtAP0laAEnKews03b3Ma9EL
         vma4BzEJx3nx83pWVtzjxs2IfiGH9Jk28KuTxbh6q/s32lCzv6/vZ8PTWKmY3W3bmBph
         xRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zYm1kpFv7tQIrDGn7Kn6OTcAQcT440JksllHZoEWZMU=;
        b=nIOy4Eoze04XsSCKCFfUm+mPW4H+EQ8uUsbchalR5LIxNAs/xOczmthb3pj8nY21We
         hzPIIYbUK29Rav3casX3wRytRU0udGzzOaubNHYoFkWBws53QCyVibhNEdV9/98hW/9W
         1f3cWAxunJWDwuLq0PWAkMEOCMCISiOURBUPfh0CXg5mZYN+A1pa5Fti1Zj0ii2c8/8U
         yDaO9+9VvPwJlThcvkJTMT/YihnLYFjtqdt5toLA0IR9YBE41TpByGNjEweNKXy3INVO
         3E6dzsZPxwmUYKq7fkJSyXuAbcbRz+nGg5S3XqeiMvoW+orRUE0N2ZefyEArSES8qe01
         dNvw==
X-Gm-Message-State: AOAM530914nlYGF/rLCDV9X+iYA1w9oDEMmqVCQmhEL+KBbvuw5hlEgE
	9xTS17jB543yBYHhpd/hlaLcej92H4k=
X-Google-Smtp-Source: ABdhPJyB1gbQatDmEe7mezJFIHN6gp+6Bhv4Inxb5pQcSXuoWYGfPqZFZyybWkx49oZkrvsduLQUpw==
X-Received: by 2002:a17:90a:ae04:: with SMTP id t4mr746085pjq.131.1592249778553;
        Mon, 15 Jun 2020 12:36:18 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/21] logrotate: Drop obsolete setting/comment
Date: Mon, 15 Jun 2020 09:35:26 -1000
Message-Id: <3f8f1385428a2057610dca71e9f122c922df5202.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The comment applies to an old version and the WORKDIR setting matches
the default so drop it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7cc4c0e7665111616c7e8a1dc512b8d9022ca664)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/logrotate/logrotate_3.15.1.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.15.1.bb b/meta/recipes-extended/logrotate/logrotate_3.15.1.bb
index 7c7d51b39e..17f4bf4617 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.15.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.15.1.bb
@@ -9,13 +9,6 @@ DEPENDS="coreutils popt"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-# When updating logrotate to latest upstream, SRC_URI should point to
-# a proper release tarball from https://github.com/logrotate/logrotate/releases
-# and we have to take the snapshot for now because there is no such
-# tarball available for 3.9.1.
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "logrotate-(?P<pver>\d+(\.\d+)+).tar"
 
-- 
2.17.1

