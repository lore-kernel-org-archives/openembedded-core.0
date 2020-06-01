Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.38139.1591020745895900859
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 07:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zRmg8X7c;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id s88so4577407pjb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 07:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=R5JOadkZQKQZHJ7npmYYywGTnpFUfw+Ia+88UfXFxFY=;
        b=zRmg8X7cIAlgWUkf17grN42S2G6SRjAaIJn6Grx8VkQqJ4p6igwUszDn8d2apfBNyH
         tvfs3xPmzZSp5oju5AgDOQQr5ZJfIjODtuA1kVpeTC9Rvh+K99OdXtMH1nmtI5RtnHTP
         VLFSqooOnK4dtbuNvBVMJQKG4dflSHrcuHPGkbkZ16Zjog/zovrioBgjd/GolJYxN7bT
         oEaz5t7yHNSrETDr0rBpvV0lzBAAoVn6bATZz5pOOw+GH4E4sJL6wWbn7qI7IvhG/iWn
         Qw8JoOnY0a8tTXWajZ4POWBe+y/5eGB/5P9TEFS78zap2FNgsh81m5nGycgJ+rUBEvjf
         rhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=R5JOadkZQKQZHJ7npmYYywGTnpFUfw+Ia+88UfXFxFY=;
        b=PBG6MltfspgCD46fnLyzsBHWXru+wdGTyT9/zzPDFXbVYvB6vvgvDuaBSK0oZYbkqm
         GdB5OdyiSxnrdbJ3tU5AD1CwGdRrjXPqSkLn0BzrrJleX0sCZB6PYaSFe75HBIoWnvJh
         y61bv93y8008484qhEKdW1qo895B3VKEi2Oe8oIFd+TrzFzCNFyuO9Sct0Q8k3VkQ50i
         b4D92PazDqy8raGHzKSEIXMIlwH5xQm6TQkVetNXiymFfQ0mbKxGM1vFek+MjKylrvIn
         Dz2BiDlG/DiWsAo10HY/KeWDdUk5M3rNBBMN/pxQUT8Sm5AJ96Xv+WJ1+6f1wuD6L/Ma
         J2VA==
X-Gm-Message-State: AOAM531bpxRNdJFTglLt1//ACtYryCDwKNYcNEx/WMTtvzN6vQ+b7jZ8
	j+FhbEkfTI9JzxpUfwd8ghtgUTMnw5Q=
X-Google-Smtp-Source: ABdhPJzoeEx2SZTZNGBCDmwMz41uJydOkKEohyj//7UgjaSS+lc5pn2oXMJ6l44lMLLN5iLRb0H0jg==
X-Received: by 2002:a17:90a:c686:: with SMTP id n6mr24611376pjt.194.1591020744718;
        Mon, 01 Jun 2020 07:12:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u19sm5509859pfk.98.2020.06.01.07.12.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:12:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/16] bitbake.conf: Remove unused DEPLOY_DIR_TOOLS variable
Date: Mon,  1 Jun 2020 04:11:22 -1000
Message-Id: <afb301af1cc21c69d6f26f47202d399228406390.1591020366.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591020366.git.steve@sakoman.com>
References: <cover.1591020366.git.steve@sakoman.com>

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

Variable DEPLOY_DIR_TOOLS was introduced in 2007:

  commit f751a20152c651a33f08ceda0502fa1d4f11c005
  Author: Richard Purdie <richard@openedhand.com>
  Date:   Wed Aug 8 21:02:39 2007 +0000

      bitbake.conf: Sync with OE.dev

apparently never used so get rid of it.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b1f15f651461d07a8cfbd3bdcfea0e89f195212d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdade79abe..4acf235930 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -410,7 +410,6 @@ DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
 DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
 DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
 DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
-DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 
 PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"
 
-- 
2.17.1

