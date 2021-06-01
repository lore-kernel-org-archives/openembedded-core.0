Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web08.58662.1622557164673033815
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=AhqiZgXL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 29so10800640pgu.11
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FyVPAdZ6Zajpc9ob3Vnqe/VV/yD2QxWJR7U852Auk78=;
        b=AhqiZgXL2AbBAHlnp1M627Plhw6v43XN4a4C/CQCjjeUVnH0DjFGc1DmH+j/m53fCu
         3cO+70hRnS3K/b5YvYWahkwu8BdL5uc85d6R0ciKdKYMzOJtKtqt1xDTQbYcMfZHY00E
         Qg2JLaCHUI6W+EwBN8FHUx1g72oAlmTVbjBa8QpeM/KgwLibvt0o98+AiWQhHb8btz1v
         9FLCXHMi2wi5bwBjPC0KAjJXaBrdgQb2B3/th9gxJ/kushMbXnamJLDK+ATiop92Z2Uk
         d+xybMIyEk6PCMc2pHvmicb9F37b5LCP1/zqTASkLC51pjfySweDZVOA8hsDfdnW08+2
         XXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FyVPAdZ6Zajpc9ob3Vnqe/VV/yD2QxWJR7U852Auk78=;
        b=rKuYgeR52tWJzIWLceCT35Ec1ANb1Lqyj6ruJXLrVZSJql7r6IWYM2zO4k0p7OqXpY
         HIr9T1G6WoxaZ3lN04fAW30TU5VSnORzBA+UcOnynpTAZ0He/qa4qKw21CZsxz6bEmFX
         z37z7BXlNwmnxUP3njqsQ6iBrzfS4X0b9AymELBQBDdsq/8Cv/7fW4g8HqPom450ct+c
         Kx45VapwctA2myWBeyWlWzTJgKJ5Uz6lHe6OzUbBIx6FokxSk7bz4/W55YnGUJU9+3Ps
         5Ozx/RmklOzX8xJ668uhE14VD5o/yEbe81bnv97OFuToMqXO1m0aOYjr0bO2HsfPitI7
         zk4Q==
X-Gm-Message-State: AOAM531g/MI7LzPXy83wVTDxNBHP83aN6xBEx5+apCOZA31mrg2+vicH
	1/DPaOPhtxyxGZD6DLWiBVRYqJg6pxGLKogq490=
X-Google-Smtp-Source: ABdhPJwbg44o3N/0ZKJHNVR4yDMJMIorDTiy8yOrW+O7Bh3x3GWdSHqZGi7htBMRHtPQNU1/t21GiQ==
X-Received: by 2002:a63:d213:: with SMTP id a19mr28592493pgg.28.1622557163783;
        Tue, 01 Jun 2021 07:19:23 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.19.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:19:23 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/26] pkgconfig: update SRC_URI
Date: Tue,  1 Jun 2021 04:18:13 -1000
Message-Id: <9f67246e62aa9e8b0c4a790605c5417336fef70c.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

The git repo for pkg-config was changed, so update the
SRC_URI accordingly with the new link.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9fd1b9b8282d68213b187ab42fae27e6a3c95b2e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index 52ef2a9779..7bf68082b2 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRCREV = "edf8e6f0ea77ede073f07bff0d2ae1fc7a38103b"
 PV = "0.29.2+git${SRCPV}"
 
-SRC_URI = "git://anongit.freedesktop.org/pkg-config \
+SRC_URI = "git://gitlab.freedesktop.org/pkg-config/pkg-config.git;branch=master;protocol=https \
            file://pkg-config-esdk.in \
            file://pkg-config-native.in \
            file://fix-glib-configure-libtool-usage.patch \
-- 
2.25.1

