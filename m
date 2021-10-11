Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CFFC4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:16 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.9554.1633945275324216008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KQbnTSPO;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id u18so54270745wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D+sx3pEtEcN8h4qvdmEt4ip1gI/Vz3EwbNHjB+Ko7FQ=;
        b=KQbnTSPOhJh2z3QJ0p0SI6SMqSA/83UwQKjJlgt4LikQLhsvnr0AOUYP9Oma7wZltB
         4WdIId6Q5BvS0QgEcjXJaFv0f3iGIwZwYNgt3O1izaHnlckP5Jdx8bK9hB/V2xNYiF6U
         98PfbcTDPUwZ6WltLIdECX0Hx86xgmIF+TFVD5jhlkScZRwt4aFKmAyRu9kmJfhGO6qy
         Q+Z3IJzgEjzH2ISfWA/Mkh1ILiTJu6QeXaCTXUSRiUKkPZ65EYafUHB+lYr1MwSYMccd
         Ypvrvvc0iyp1uwOTaA1L/8rtaHqt4RlaXsdRHnXjK8oQqqCEDer1Kxk1xGyHQgCAsiON
         CqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D+sx3pEtEcN8h4qvdmEt4ip1gI/Vz3EwbNHjB+Ko7FQ=;
        b=Xmprp9jkYje2uoH5d40yXSBW1FdGKLeLztJZDqfNLV+7GSBDBnfDuPxMJOdSV6nPpK
         A9Y2XMBUTspfubU0cPwbktajhhFbFRZHpcfz81wGqGBlQ4kyUsNN4oB2SegRuwv/m2ny
         vn+2T3YHNJAwN9j/Xe9P3XHR8LcAHXa6CSei4ydNAGRjep/+VOIT52Ya2zwVJ51A/cNb
         O8TBt9xIdgsLeGYCQlU8ef8r6nZXLSKyi1u8a0SPz4W7TeESv6jZ6ReR9Dp5JdIYy/YK
         yUHjG/91xld8nEtZkR/R2YxhLUYwwxYQ8YZVDIM0+BWswyXn7tIcajoSHqQ1Djkx1wjH
         o9uw==
X-Gm-Message-State: AOAM531uqr1fxpgePIj4XfFS0/YnoLXbqFG/m46xZLs6qqtfJnZ+9RNb
	ie/ktX47HoWjVDDVKDhDwqwQzb7B3Q8=
X-Google-Smtp-Source: 
 ABdhPJxKMcCv2m68mdaBUqKs5t+uK6wtAFNOuxNHJXmfnR4grF+we2qPVZkNFZ1RolJFDe9Hw4WD1g==
X-Received: by 2002:a5d:6c6a:: with SMTP id
 r10mr23072882wrz.389.1633945273710;
        Mon, 11 Oct 2021 02:41:13 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k17sm7180758wrc.93.2021.10.11.02.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:41:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/25] sudo: update 1.9.7p2 -> 1.9.8p1
Date: Mon, 11 Oct 2021 11:40:50 +0200
Message-Id: <20211011094059.4184654-16-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:41:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156829

Drop specialhandling for mksig items; issue fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...me.c-correctly-include-header-for-ou.patch | 25 +++++++++++++++++++
 meta/recipes-extended/sudo/sudo.inc           | 16 ++++++------
 .../sudo/{sudo_1.9.7p2.bb => sudo_1.9.8p1.bb} |  3 ++-
 3 files changed, 34 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.7p2.bb => sudo_1.9.8p1.bb} (92%)

diff --git a/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch b/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
new file mode 100644
index 00000000000..e7875c96f7c
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
@@ -0,0 +1,25 @@
+From f993c5c88faacc43971899aae2168ffb3e34dc80 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 24 Sep 2021 13:36:24 +0200
+Subject: [PATCH] lib/util/mksigname.c: correctly include header for out of
+ tree builds
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ lib/util/mksigname.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/util/mksigname.c b/lib/util/mksigname.c
+index de8b1ad..0a69e7e 100644
+--- a/lib/util/mksigname.c
++++ b/lib/util/mksigname.c
+@@ -36,7 +36,7 @@ main(int argc, char *argv[])
+ {
+     unsigned int i;
+ 
+-#include "mksigname.h"
++#include "lib/util/mksigname.h"
+ 
+     printf("const char *const sudo_sys_signame[] = {\n");
+     for (i = 0; i < nitems(sudo_sys_signame); i++) {
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 6a18609adcb..82040de8aa1 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=fdff64d4fd19126330aa81b94d167173 \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=b969d389e79703121cbffc9f3ea18a8b \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
@@ -30,15 +30,13 @@ EXTRA_OECONF = "--with-editor=${base_bindir}/vi --with-env-editor"
 
 EXTRA_OECONF:append:libc-musl = " --disable-hardening "
 
-# mksigname/mksiglist are used on build host to generate source files
 do_compile:prepend () {
-	# Remove build host references from sudo_usage.h
-	sed -i  \
-	    -e 's,--with-libtool-sysroot=${STAGING_DIR_TARGET},,g' \
-	    -e 's,--build=${BUILD_SYS},,g' \
-	    -e 's,--host=${HOST_SYS},,g' \
-	    ${B}/src/sudo_usage.h
-	oe_runmake SSP_CFLAGS="" SSP_LDFLAGS="" CC="$BUILD_CC" CFLAGS="$BUILD_CFLAGS" CPPFLAGS="$BUILD_CPPFLAGS -I${S}/include -I${S} -I${B}"  -C lib/util mksigname mksiglist
+       # Remove build host references from sudo_usage.h
+       sed -i  \
+           -e 's,--with-libtool-sysroot=${STAGING_DIR_TARGET},,g' \
+           -e 's,--build=${BUILD_SYS},,g' \
+           -e 's,--host=${HOST_SYS},,g' \
+           ${B}/src/sudo_usage.h
 }
 
 # Explicitly create ${localstatedir}/lib before do_install to ensure
diff --git a/meta/recipes-extended/sudo/sudo_1.9.7p2.bb b/meta/recipes-extended/sudo/sudo_1.9.8p1.bb
similarity index 92%
rename from meta/recipes-extended/sudo/sudo_1.9.7p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.8p1.bb
index 9b5b2f3c694..4545d8766e9 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.7p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.8p1.bb
@@ -3,11 +3,12 @@ require sudo.inc
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
+           file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "28b5ee725dbf89a7852f42f309ca877d2810a9531b4eecfe59f3a84b6b4afca8"
+SRC_URI[sha256sum] = "0939ee24df7095a92e0ca4aa3bd53b2a10965a7b921d51a26ab70cdd24388d69"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.20.1


