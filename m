Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.181963.1598214089417992712
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YZ68YLgA;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id b17so984789ejq.8
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h2QMPwC8PMRV1iGrImu10tZTYF1gQNoqpiTunLYkGkI=;
        b=YZ68YLgAymZ6PESCEVAPc2juTqPQWGhHmN82kcWAP9bKEz1jB+5XJUQ/PCq6ajO00a
         E0mdV6iEIBBo0OxpRei4AUy40l/0PutgSH8l69umZ84pmdl/86UDr8i0hbYK28LEdGA2
         AO9qJ5bgoOBFozmqSOQ1Me5U6FF4FJwIiSdjWpo/0WqY8GIzZa7aE4/HncehpB4QSPow
         xKNi0IFKnRqEpWHanO1tfll2cfEJqzTLezI8MAyTw7PufVm2tr2AferZnDbLvWCGIkUp
         pOsthGWujTmWVE1F/fkzaJnG7V7NBL28uDIQzehTrWpbwjw4xetF1kyy4ZSbm9dU20eC
         N63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h2QMPwC8PMRV1iGrImu10tZTYF1gQNoqpiTunLYkGkI=;
        b=TWINUdCA2/TAwjRGCBGfFlFT67lDaVJ2yQRy9JW400H+bHLGENvfBjT+T9OWtv29iU
         gonmsjo0Ppb2EMXJHKb6h15USZjIyM+9b8BWVNXXac+Za44tNO7nqTfik1QaKJTbiD8d
         5IGIA+R4aDgNXCukbLbkNX+ZnWgIBuwHYgqbVqZYxyga7r8LWihf5VzUw10x+SNkUm05
         lQMI/Zz+HMF1IAdgQh+H6zpCMjXxc3OgVWJvujy9GBbO68GxkDoMD7q9xF0gPd8E+zGw
         yuwWlj2tQIvBatmi3p66v6YQInVUH4rk4TWW0bGpcbK2c08c+hvjIyQwNUrF3GPxz8fN
         yOfw==
X-Gm-Message-State: AOAM533uLC43QOSJ+qkaP3Gl1HPzEHd2srGkzTIHZms1U7CcpeEeHnLs
	Ku4O+n1oUyT3PYqVqAEEgo2XqbKOkZo=
X-Google-Smtp-Source: ABdhPJzktjzNRlyNnS+YDvXfO5JjwxWWAzYkhy/+Q8ysn7SMZYf4kuwbhEbbGywa1xMrIxVR7vyO5g==
X-Received: by 2002:a17:906:2490:: with SMTP id e16mr2639361ejb.386.1598214087742;
        Sun, 23 Aug 2020 13:21:27 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:27 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 24/37] sysstat: upgrade 12.2.2 -> 12.4.0
Date: Sun, 23 Aug 2020 22:20:18 +0200
Message-Id: <20200823202031.24686-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../sysstat/{sysstat_12.2.2.bb => sysstat_12.4.0.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.2.2.bb => sysstat_12.4.0.bb} (54%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.2.2.bb b/meta/recipes-extended/sysstat/sysstat_12.4.0.bb
similarity index 54%
rename from meta/recipes-extended/sysstat/sysstat_12.2.2.bb
rename to meta/recipes-extended/sysstat/sysstat_12.4.0.bb
index 333d10295a..6773213a40 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.2.2.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.4.0.bb
@@ -4,5 +4,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
 
-SRC_URI[md5sum] = "1073fdf7bba58483a467a8a0681beeda"
-SRC_URI[sha256sum] = "78388b64acec81378b962e66b40e57acd4b18ff17a849bc9308f95d290248c9c"
+SRC_URI[sha256sum] = "78556c339795ecd07eb10ee09e3f5d52901d3a29f874ae92b45efd0de7b62d16"
-- 
2.28.0

