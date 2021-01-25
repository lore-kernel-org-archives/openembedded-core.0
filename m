Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.326.1611586355360210974
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:52:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kR4klIqh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id j12so8495743pfj.12
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ymY5AsLtWQ5iN57+haV02ma5N2HcRdMeGXL49iHdaOo=;
        b=kR4klIqhvkpRJGKvTYr/wKHKoIawdEw5jb2S1GP1THYE3wDEA9KhEvzv0lFEqrnznC
         03er8iuU2y0rtM6rp8QkqOHDt0lLIupwD3ILjCLE/zrV6IgYD/cOiTuAEU2XUGH4O64A
         YfV2G9XaeFTks68B/xaTkJapkcRfjbaIGY8UlIjByK+C4m9UI4M3lH66CAYY0wdnA1ck
         Sz1W/HOx1wZMcL1lpGE6RKkVa3WAHiPLtDeN9Rob4d9zAUO7n+RctXmjaDwTHJaE2wpP
         oZ4rDPmeE/LTU5XoaY6HKnebGP8OC6pwVoc5YgJ6vQL9O+KdeXVai1Qmh6nNd+tA6Tjj
         PXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ymY5AsLtWQ5iN57+haV02ma5N2HcRdMeGXL49iHdaOo=;
        b=c1ATlOGEOZ7FRMvKP5YbMxj7gpM1MscwNdiJtob4S/MG3kdEOtYvnwYvPqtylpWVWG
         4yeH2vKeofVdO7O+7HQnPrlYiYWVxWVnzMNwi9OoSITN3mdlNtEwjZPgZHX1Tnfrd+mS
         je5WqrSYfF7wLF8syrpS1yxMb+9wp0Gv4WM9rGcqzNT5ddwHI0xeeZCy+auaJx8nST3C
         sHtUuFCqYNwAOF6zm9T3UqWk1QJexgbQxhYxuiYKntT2jPNMiT5IQU58oo3TNiRQ87WB
         BFxNVymN8iJc7XwykWkSNWV8BX5Z0mNkCMtplFW3dKGoe1k/Q+2Y5oBBBVwaUP5Tkk+R
         /EuQ==
X-Gm-Message-State: AOAM532I/97fyXN/4dLO7IQek5OhnqMrCy3GWRDQz8XgewB5mlwi7Qkm
	Fh8tBgLhUBDercqTVQ5eicsGX5hhaapQOLxo/FY=
X-Google-Smtp-Source: ABdhPJwMQv7E5vNqt+KHFLlDj708GlxrQwzP5SWKe2xhnCTv9xGQ/myzsYscY1OHz73ZMII0a+ewLQ==
X-Received: by 2002:a62:774a:0:b029:1be:ca30:53ad with SMTP id s71-20020a62774a0000b02901beca3053admr789970pfc.42.1611586354479;
        Mon, 25 Jan 2021 06:52:34 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.52.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:52:33 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/47] bitbake.conf: Extend PSEUDO_IGNORE_PATHS to ${COREBASE}/meta
Date: Mon, 25 Jan 2021 04:50:51 -1000
Message-Id: <e5963edbdc7db7f21edbd82dcd79358de0ecae41.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Unfortunately, .pyc files can be generated in meta/lib/oe which corrupt the pseudo
database so we need to extend the ignore list to cover this as well.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e0cb6dd689a362d8433caa14cc5a9fdd5eb44923)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 93a27521fd..922972967f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -686,7 +686,7 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.25.1

