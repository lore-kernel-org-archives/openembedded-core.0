Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.9964.1614349551591629631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:25:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Bko2ZAoU;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.48, mailfrom: steve@sakoman.com)
Received: by mail-io1-f48.google.com with SMTP id e2so6493769iog.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yh+lKp2LgGjRxlTtjxXu1zHhS706s+6TbfOG3n4/xd8=;
        b=Bko2ZAoUC0r3VEw3ip7ngE+iV05VFi4nb17vx8EzBhJa81tt3/poi9LW4okWuLnR9R
         Xthwa5GTB0L3v6OqBnTevIHKpRA05gPeh5Wn4yn6COY/lWH+sNwIqRcFOBsLDQcAd/q1
         aXeR4L7i5uG3hnALTLftQXtPinmJHq4RTsTJlPuLSncVZcrKC/dUN3czxUcaSpDBYI1D
         +XXCzvzcO6Syo8+cfL+ztrkBWSsAP/E/kKGUZeJ6WfF3bdeyDR5srwbDX4lLVQusXZJy
         afIklr06fVbH9ZqwU7fIBgbNGQPRk61E2pHaC7pt0xu5ZbciDB2ngst0eBD5LU3xONYL
         7lYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yh+lKp2LgGjRxlTtjxXu1zHhS706s+6TbfOG3n4/xd8=;
        b=PsIsYuYY2JgoeWIovqfJg6qpPkmJiljycbZKXGyxmxCfb/LvOSzfBgSiwdb5GfKfM5
         HE4Wi3Ct9al+NKluCDR1U+KNzaclDWnQUWM7jaeJ0cJKxEmr9CRG5J5OkDN9eT9Vs1am
         Q5rXYREfgnD+JJPPUOvORU35UPQ/mvFGAzCmtVW3VUcV8B8nxNZPE2Wz5sXS1SwxYUif
         OxOMA/uFjcq0IbPojPcGe8mtw2sYpOoqIuJOsSGHlZBgkuch339JGM3mXuzdIOnXoEfe
         BemIikD0iisPppZ34swPeajSJ1COvJqvGpXOS8yzKZSNND6mjKmrvZO8Hla+ogZs8rJH
         k7cg==
X-Gm-Message-State: AOAM532RoOjYvAHeUSlX9vamJeqGnTjXkDf2qO64uMvR++PcxDmm1+Id
	+fHPJ5dp/VNEKT/p1oiEEFqkU6P1x09/oo6q
X-Google-Smtp-Source: ABdhPJwR2PaH0vnVh/l0ax3HCM1DflFx4fpXMCm+CzdqgTyWhES546AyfREzNFC08PzOJQfSYeDzmA==
X-Received: by 2002:a5e:a804:: with SMTP id c4mr2990680ioa.71.1614349550363;
        Fri, 26 Feb 2021 06:25:50 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.25.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:25:50 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/40] sudo: 1.8.31 -> 1.8.32
Date: Fri, 26 Feb 2021 04:23:53 -1000
Message-Id: <dddd33932d296d28993b13190f3886127cefb643.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

release notes:
https://www.sudo.ws/legacy.html#1.8.32

updates include fixes for
CVE-2021-23239
CVE-2021-23240
CVE-2021-3156

Also backport patch to fix build error with musl

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/sudo/sudo.inc           |  2 +-
 ...Fix-includes-when-building-with-musl.patch | 29 +++++++++++++++++++
 .../sudo/{sudo_1.8.31.bb => sudo_1.8.32.bb}   |  5 ++--
 3 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/sudo/sudo/0001-Fix-includes-when-building-with-musl.patch
 rename meta/recipes-extended/sudo/{sudo_1.8.31.bb => sudo_1.8.32.bb} (89%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 5d27d46928..aeedfc1a23 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=4d1b44b1576eea036d78b8cc961aa93d \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=07966675feaddba70cc812895b248230 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo/0001-Fix-includes-when-building-with-musl.patch b/meta/recipes-extended/sudo/sudo/0001-Fix-includes-when-building-with-musl.patch
new file mode 100644
index 0000000000..6ee2d5c11e
--- /dev/null
+++ b/meta/recipes-extended/sudo/sudo/0001-Fix-includes-when-building-with-musl.patch
@@ -0,0 +1,29 @@
+From f4e9e4337f8844d199515ff2b762c914dd254cbd Mon Sep 17 00:00:00 2001
+From: Dan Robertson <dan@dlrobertson.com>
+Date: Sat, 16 May 2020 00:12:44 +0000
+Subject: [PATCH] Fix includes when building with musl
+
+Include sys/types.h for mode_t and id_t in sudo_debug.h
+
+Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/f4e9e4337f8844d199515ff2b762c914dd254cbd]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ include/sudo_debug.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/sudo_debug.h b/include/sudo_debug.h
+index 180f2096f..0124b0b19 100644
+--- a/include/sudo_debug.h
++++ b/include/sudo_debug.h
+@@ -25,6 +25,7 @@
+ #else
+ # include "compat/stdbool.h"
+ #endif
++#include <sys/types.h>
+ #include "sudo_queue.h"
+ 
+ /*
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/sudo/sudo_1.8.31.bb b/meta/recipes-extended/sudo/sudo_1.8.32.bb
similarity index 89%
rename from meta/recipes-extended/sudo/sudo_1.8.31.bb
rename to meta/recipes-extended/sudo/sudo_1.8.32.bb
index 39d8817c32..8d16ec2538 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.31.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.32.bb
@@ -3,12 +3,13 @@ require sudo.inc
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
+           file://0001-Fix-includes-when-building-with-musl.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "ce17ff6e72a70f8d5dabba8abf3cd2de"
-SRC_URI[sha256sum] = "7ea8d97a3cee4c844e0887ea7a1bd80eb54cc98fd77966776cb1a80653ad454f"
+SRC_URI[md5sum] = "a7318202ba391079a0e32933f0fb8bd6"
+SRC_URI[sha256sum] = "5ce3c18c5efbecd5437a0945f314f1822423eaf9a2d7eb7ecf80857bc32246c5"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.25.1

