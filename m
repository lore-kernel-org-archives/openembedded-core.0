Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.12798.1614955689079636269
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:48:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0N7df0zd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id o6so2152713pjf.5
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aWl4LKv5ktadRuJYEemO1l3na1br65so6Neeyj8mIWk=;
        b=0N7df0zdMtZiy4vt3Do26h3BKgVbQuu6S+4FHLDyLxWz59Cb1C4uEbGPpASp/BNClq
         xeN6jb5CAE8k6blJMFaSCXOirMYeJJgbHKLW56R3xhDl9YF8OXf4PverrxiuJLtmAo6l
         rShfL2N6S4z29KpSwc10YJNO8n/AZmCPX/tD0t8aFsVuIWfB25oPKQiFcWGVnrAU05X3
         TVyXeKrjKet1PYWYqE41rENDqrIc2iDbeAewwJNAyfKIadXqYy7ipoKfOQgTxV92wuNR
         aYtiht4uLKDOkRFTpRXLjL3wWx5yShHXyVScJrS3zO1qSmHRK5LL2KHN4N1vRXcaUrdf
         Vkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aWl4LKv5ktadRuJYEemO1l3na1br65so6Neeyj8mIWk=;
        b=LtNiFFBTcZ2djEBlqj4nTJqNWPfr7fz4YrbcY91dUcUeYHSSTz7G2cYrK97IGNA0Ab
         KP6pbpgfQ0u5JBVUUSMpIfiGgyIXypIn/T3VnL1NqQvLGX1IpHc1Uw5Zco/4qZ+F9qFt
         8iTwqU4r94vgaai09haRWepKmnzL5w0Gb84jMmHOdHLwdvMZBWFnroBRmWjOZTbyX+dM
         L2izau5qv8zLRhjY1tnzMJdaiIUB0/VFsuwFVWdgznpNJew3RzIOsTYGMR6ZOsid+ydV
         zLMEoLox1iNOw0p24QhY8b1amRyGeUWHACrHdfStkg++1mrfeVL6lYbfsjlQn8JAFudV
         EVRg==
X-Gm-Message-State: AOAM531+y+stVR+ypmcj/kDbJgRZX4XIIQuf8Ya1dAFem4Afvmcw7t8K
	VfQjlvd4lBOUb5IveH62nEXvSG+rcHMXCx6l
X-Google-Smtp-Source: ABdhPJzu4Xmsepr3eW2pwEuhgNTV7EJdOwznHSEpLCVHcL7aOaXzsdKXfYoglW2on0/FENJDHhLAfw==
X-Received: by 2002:a17:90a:ce82:: with SMTP id g2mr10749473pju.193.1614955688035;
        Fri, 05 Mar 2021 06:48:08 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.48.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:48:07 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/27] bitbake.conf: Split PSEUDO_IGNORE_PATHS to be more readable
Date: Fri,  5 Mar 2021 04:46:22 -1000
Message-Id: <eb8985c7192c4f0266297135e47622ab5e885700.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We've had a lot of concern about the readability of diffs of this
path setting, refactor to avoid long line length.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f3930cba16ccbc4b76ed14187d5586d6479bc59e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6ada0099eb..697956eb49 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -687,7 +687,10 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR}"
+PSEUDO_IGNORE_PATHS .= ",${TMPDIR}/sstate-control,${TMPDIR}/buildstats,${TMPDIR}/sysroots-components,${TMPDIR}/pkgdata"
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/deploy-,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/pkgdata-sysroot"
+PSEUDO_IGNORE_PATHS .= ",${DEPLOY_DIR},${BUILDHISTORY_DIR},${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.25.1

