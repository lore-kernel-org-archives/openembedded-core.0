Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.4523.1588176705776979731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=aR2+k2hJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d184so1290838pfd.4
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Wtecnff2d4gEVHe3SJsvuWq472bRT3jS/LiLVFwh5O8=;
        b=aR2+k2hJ8OeEJhY75BVSsjlQxNuEPPqn5CG/FxvAsyEzrEgwvr62nvVEueFhTM027G
         ZPVfIv4yXx3RPNptuxhmY+1cnpYCdrOvc05LgSpVPiMkeo8FHhugzZBKR8Lxhj2B6V/n
         uM+afjoR+IQb9ERGqzLqzWPrtTuKfmkaEuqOBgDjV7onZ7qZq5AvjUf/1A0jy2LB4fT6
         NWcBiekWsaaFAfen4H8OneBQpR/PuZ1ZJSPQ5+JSo0tKbZwO2rotELQzkgX3yhflZXGp
         kadlZL8DySavS2vuqhTTgsocNS9BUyi7wItbMuIZS07R9vpc2iNGTYCDG/TLQFhMcF4w
         iQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Wtecnff2d4gEVHe3SJsvuWq472bRT3jS/LiLVFwh5O8=;
        b=EWPiEbSbOzC3lnionubJezTYrcINmxpyvrrlfiHeyCcW/whzdnuURUN+MFuegIoJW/
         aPqMRE7NaahQmZ90JPDEtVRnqeORdWiSGJC2TsfsPSg9Uhnq7w5y5HJrCzAimIZdSDnk
         84P+3ddZRqQpPAWePGiW/qrn6SwVD1PpQnbNPWgVBmYrD8PH0joYv5DF6FPiN7pY8n/Y
         6ktEDbJuWwXn/gqVVt33Vwardld3JLo0obVurd/r4z8I0bqPPsXisBbh3ODqkn7xENV6
         0W9sWYKzfUOfEBL4WkIuUnubOmcz76a9hxzAjOKlj4TuI7EY2gn5+Le7aVzLzaME9aCf
         J4LA==
X-Gm-Message-State: AGi0PuZyx2oFVuAwW3ThCgtWMbkQ+9eKgZWUv+zvi7BOEOstTsiR/nFb
	hhHWe2rnpjn1s1QZg39t/O460hc6jfl7HA==
X-Google-Smtp-Source: APiQypLGgaWp4N0VDikZ1r0aoFwYeu5TZawC8AkdfCgoO2JXmlYjMWkZHP1etFsA/YB/3urQxYBIKw==
X-Received: by 2002:a63:1d4:: with SMTP id 203mr32643367pgb.74.1588176704715;
        Wed, 29 Apr 2020 09:11:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o1sm4833062pjs.39.2020.04.29.09.11.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:11:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/16] nativesdk-gcc-runtime: enable building libstdc++.a
Date: Wed, 29 Apr 2020 06:10:50 -1000
Message-Id: <2a26e77320fc0ddb5aada8b939af00953204aeaa.1588175775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588175775.git.steve@sakoman.com>
References: <cover.1588175775.git.steve@sakoman.com>

From: Jeremy Puhlman <jpuhlman@mvista.com>

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 771f344ac0..ace706dbf4 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -22,6 +22,8 @@ EXTRA_OECONF_append_libc-newlib = " --with-newlib"
 EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
 EXTRA_OECONF_append_armeb = " libat_cv_have_ifunc=no "
 
+DISABLE_STATIC_class-nativesdk ?= ""
+
 # Newlib does not support symbol versioning on libsdtcc++
 SYMVERS_CONF_libc-newlib = ""
 
-- 
2.17.1

