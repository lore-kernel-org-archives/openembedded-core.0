Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.16622.1591198499845907165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 08:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1eOEzLhQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id o8so1983826pgm.7
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 08:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zZFfhMjt0OZIXjrPgLXXCyFh+E62TGJX25hq8t7yuGY=;
        b=1eOEzLhQ65ASIaoz6nyvuWsFci7IuXN5gXIfbfBLe7UjEcGFbPMJb+YR5OpRljGtpU
         0XEMzZrj311VkAI3ibRa0AdWQ/Rs+D5/gCkPrU4MJigq5mG5ESyvH+PRxPfjSzJIHf2r
         7b3azwpGXDDapv4ovk52A20usUXTLLn/exwolYDovFD+1Inxa144ctVZ/HK3UIMIxPTQ
         E5DC0HBD8XlY2IFwl4BGPGGv4bLxLWEU6sbuzlklB0L6J/eP1DVyD3Ta9FpsadUhiv18
         s7TdeJRhL8TvsI2EuYmWR1Rm96Y6jJdwa4CXJ0X0ietanRl6S/oMFdm0W2fbzBa9zIYf
         lZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zZFfhMjt0OZIXjrPgLXXCyFh+E62TGJX25hq8t7yuGY=;
        b=sy3pmwkWdT7XZGpIk27Qgfv7ifZnSFuryLBt+rUnBb7tfT/Wnmr+2XgsPNBIvQ2G99
         jWhBpiuQvo9VEGA6nqZKYdYQx2vNV1UQUwiahSrtD3cy0/bCOe0UWwBGIjvXyLqNIr29
         nA/gP742Mz1mubBQKqas0mMDSy7oekKf5tJzVFX0sFWR0p6XSdznehpZBiZBDhmq0hVF
         DkgHGUeW15zHyfc0CfkADoKRM08CcFWshqY7e9owFWBiJT4Lf7+NesSahaJ1xYpXFPBi
         UO7perVFAPEwXssCh00H6tZRuTGSCVVP/xv0pPh+H6GlB3YIB7PkgegX9gvG/WignB47
         LbZA==
X-Gm-Message-State: AOAM533IuusU5a6Bc2iuI2MG5trnPHzb6aLwKMu79qu2W8XGP8TjQla1
	UFwop0E1uTuU6mUNjY1om4zHl5lUvc4=
X-Google-Smtp-Source: ABdhPJyVN+xJHEmEbToju/tGuAjIFyzCvlYvSmXDjNrzrBrOJMXiuEim0IsVvEO0Kjhf0qc7+juqHg==
X-Received: by 2002:a17:90a:36aa:: with SMTP id t39mr233977pjb.185.1591198498924;
        Wed, 03 Jun 2020 08:34:58 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id np5sm3187660pjb.43.2020.06.03.08.34.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 08:34:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/5] layer.conf: Bump OE-Core layer version
Date: Wed,  3 Jun 2020 05:34:02 -1000
Message-Id: <4d4e69bc056bec4625b1cde0e1fc9d5e527c6a98.1591197295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591197295.git.steve@sakoman.com>
References: <cover.1591197295.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

The commits 910ffaf5be ("pyelftools: Import from meta-python") and
a96f815c53 ("pycryptodome: Import from meta-python") moved recipes from
meta-python to oe-core. In order for this to be communicated with users,
bump the LAYERVERSION so that meta-python can key of it in its
LAYERDEPENDS.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2d503b27e7c88cee9a37c79c4605c77b11f230b6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index f03eb485a3..43917d4c3c 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -11,7 +11,7 @@ LAYERSERIES_CORENAMES = "dunfell"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_core = "11"
+LAYERVERSION_core = "12"
 LAYERSERIES_COMPAT_core = "dunfell"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
-- 
2.17.1

