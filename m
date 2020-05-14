Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.13197.1589466117748698315
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 07:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=UAtnodrg;
 spf=neutral (domain: kynetics.com, ip: 209.85.221.67, mailfrom: diego.rondini@kynetics.com)
Received: by mail-wr1-f67.google.com with SMTP id i15so4312349wrx.10
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 07:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jV78lCgIWy79xARs3StFIIbGuFcAXFwu9pnsmdmY7mw=;
        b=UAtnodrgAB/Ciw9P85PfkqZ1WA8dv15eg/JKXTzIArfWc9sbwfn6y6TW5947cC4jd7
         4ljPxExPvB4s7PqqEWAO9axbafQNTCYdIJgkC44W8gogyUVyEVWNY+evgpQZFK1HSIX2
         Wb78boUjYMT9fYMkVj7xUYO9j45Jq1i7MkUhOYCFmH6CPcWpbV6Ubye2G3lIrLmO1LEV
         0oqIpf2+U3uZ3WbIaH9rHVWWXJtiMM0i6VHk+6DvVYi4Fs3hjHN69T/CJHvOqAEh3j0D
         a5E6zGEvjXGF3XwafwTKtg3dpszjiW1oLEGZl83yMaK8/v2UIvrOQQ2sZnzwqi85nfiU
         1bCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jV78lCgIWy79xARs3StFIIbGuFcAXFwu9pnsmdmY7mw=;
        b=Hb9Y0Z9d0y00AYtYYX5VZ/DAJyHIZAyv9craZ4XFJ4nTfWm0gtt7MXFoKKOJqJ0svx
         XQUHSdm+YmqRUsqZFkrFDjN1v0tAK4dz5oovqbUROJGTqvKmdKMb0ySweEQhSJD0Fh07
         mtaCrJwjFemuuUUyVgilktHmc6QDEGWwqD/1GgNT9ufqTSgrdO7yCgC5rXxxyMYh74hs
         akJloNBAXDl1qpL6n4C9ZJLG+fA3ANRbellZyGU5S8mX2xeeVMDOHaWRimpRLZGldSnp
         ub2/aEazL79Y11xE2JP5KlciUFpE7Ibtu/8fmrsCC8Ewt4w96Di7MoKIgxakXD1RzboM
         cYcw==
X-Gm-Message-State: AOAM532wJ5VFW91fOv7aa8NTjxrH+9n9/2DJQ8tzXoGsvOMsIRjZ75qc
	aGaO8oXGySmaTHSvKICRUtFvrRM9XVI=
X-Google-Smtp-Source: ABdhPJzljoXie/4kc1HJrhTZdNlNqvHALxbLYfjX/quiAmxjx1lO9GvLUx9um2vKcGua8mJvnPxCnw==
X-Received: by 2002:adf:9564:: with SMTP id 91mr5673598wrs.414.1589466116011;
        Thu, 14 May 2020 07:21:56 -0700 (PDT)
Return-Path: <diego.rondini@kynetics.com>
Received: from localhost.lan (217-133-17-98.static.clienti.tiscali.it. [217.133.17.98])
        by smtp.gmail.com with ESMTPSA id r11sm28935598wma.35.2020.05.14.07.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 07:21:55 -0700 (PDT)
From: "Diego" <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH] bmap-tools: update to latest git master
Date: Thu, 14 May 2020 16:21:08 +0200
Message-Id: <20200514142107.20702-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update to latest revision of git master to include, among other
improvements, support for zstd compression format.

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
index 7c4db85b32..694c5f09be 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/intel/${BPN}"
 
-SRCREV = "db7087b883bf52cbff063ad17a41cc1cbb85104d"
+SRCREV = "a17f0e3ff8669dd3b1c44a741ae4f8162155faed"
 S = "${WORKDIR}/git"
 PV .= "+git${SRCPV}"
 
-- 
2.21.3

