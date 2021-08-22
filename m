Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.9610.1629636683662132796
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QIUjcPF3;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id d26so1443206wrc.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=clVxFjv3BOb2vxpxeSrDdwODmJZvQ8M1xn0A8m2955g=;
        b=QIUjcPF36VWAPqFAqQlTPHbvgIL5UR6nFWAoWo/wLkM2n7yB0P8ZZ4OyGiqZvVohWc
         Syg5nwFdMkLCfNA4X8HLiG/5+ZIdM3U7mL1Drk5NHloB+USbzmiK8h0j8wubTFyW+LfQ
         O76LWYGdBCBDUabbVKEmLTW2UxEbuSTzZ+oXgfQwNcK3iVBMZJnVPGy+duGY43WABVGi
         bDx6r0MHOnL4cSckh3B9KaJbGR5yGTQ+QSC2vxNjjITfJzVesNS2ee0PJBrpQ0/eRWAK
         2Pha+KqAVZ3Olo/n92yfL6AwwoXcLArUQrOtF7mhu39eCwx/YBdxRLuhFdB+pRA877n1
         lD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=clVxFjv3BOb2vxpxeSrDdwODmJZvQ8M1xn0A8m2955g=;
        b=RP052r0s4JGkSbI/HGldIMv3TlpnmdzDU2PGQVXZ2omL23Zds3+PtbnNgxnFYi9uFw
         nT5I/CelG2JsXQeKXt6CEyuVOGOiaRsppTq6T6xcB2Z3dBsZyKXvJ1Q2EPtbPZszNJUY
         DQFhmJqMrUHWsXzXX/PqFjv6HdJ7gV7bktpXvR/NYovCCvLYJ9C3S7MNopVMzrCyKscX
         vfrekyWYN2+MmqPV+/qLn1YOyXHHej76xgeQO6HaPljYJ5WRcolLuIqrb9+Y5Cd+3V64
         wK9BikXwH8q99jX99kIErIXpcFmV7nyPRmoVVUyQon8SBTsIvXQpQU65bj/B29BGl+EH
         chEw==
X-Gm-Message-State: AOAM531dFEisR0Txexu8IF7Bpiet1SLII4iceI1PsJtlH4a4QJXeKP2w
	fvAuWG8+/4lPo1XLYJA7hiWZNeCjlqpPmQ==
X-Google-Smtp-Source: ABdhPJwWXp3/xUG3FW/FuiswdxIIhQxq90U+ULA1y4QymC2VlmbH3pcNojk0lW8F8qfnKdSBnNX3/A==
X-Received: by 2002:a5d:4010:: with SMTP id n16mr8376450wrp.378.1629636682339;
        Sun, 22 Aug 2021 05:51:22 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:21 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/55] inetutils: upgrade 2.0 -> 2.1
Date: Sun, 22 Aug 2021 14:50:25 +0200
Message-Id: <20210822125103.310416-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../inetutils/{inetutils_2.0.bb => inetutils_2.1.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/inetutils/{inetutils_2.0.bb => inetutils_2.1.bb} (99%)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.0.bb b/meta/recipes-connectivity/inetutils/inetutils_2.1.bb
similarity index 99%
rename from meta/recipes-connectivity/inetutils/inetutils_2.0.bb
rename to meta/recipes-connectivity/inetutils/inetutils_2.1.bb
index 4b25f9c0b5..0cf73cdb24 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.0.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.1.bb
@@ -10,6 +10,7 @@ LICENSE = "GPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
 
+SRC_URI[sha256sum] = "01b9a4bc73a47e63f6e8a07b76122d9ad2a2e46ebf14870e9c91d660b5647a22"
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch \
            file://inetutils-1.8-0003-wchar.patch \
@@ -22,8 +23,6 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
 "
 
-SRC_URI[md5sum] = "5e1018502cd131ed8e42339f6b5c98aa"
-
 inherit autotools gettext update-alternatives texinfo
 
 acpaths = "-I ./m4"
-- 
2.31.1

