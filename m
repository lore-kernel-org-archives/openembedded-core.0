Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2037FC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 16:47:00 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.12730.1742489210135822026
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 09:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LPiaKu+t;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: nikhilar2410@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso7316705e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 09:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742489208; x=1743094008; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvSBF8WmeDxpUSHjSR0hMFGyksmaAxA6gzK+Ekfpb1o=;
        b=LPiaKu+t1yTK0RFDEih0RwcvP95uDtKFhrQhE7UgUKhCx8g7YmKurorz0fqGhpAShn
         pq06c2ghsLd7RYRQJrlsK1pAiAqgqUAhR5exsS/FThxVTP6GDPVMShgTxKXIKCq+s3tq
         LVwYFTnWNibWtK2wdHM4jH/lz5UBGQJuHUw9jfFZYkzFHYEPMp7ogxmNpOP+nuZJKvED
         V+NwxWN0/NmiUfVSWjy0T4+nRAu5aIwkXo3tiGb4Vttp130uFa730Ce9DMsqLzPUhp0g
         qFgrGo0SAdG3lz7ZOXLk3/OxRiH/Crxu8xW03+Csdns5nnHTzZ0lV4IULaXKPSu7DSmI
         Gfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742489208; x=1743094008;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvSBF8WmeDxpUSHjSR0hMFGyksmaAxA6gzK+Ekfpb1o=;
        b=Bogj9qqysMzshnyQo+BajksPBWAXphcUXQ4k35gHHp6wjkCVaHWxOqrbLQ502BoqR/
         w5K2phFjlrAGM2rv5ugVAH1RuZ2ayIllEgpBcUkGQyD3q9ETT5SX7Ey0fRN1Apdy0YIr
         yFjZp9zumrIpkZrutxceZrrLJIS3kVxM/PHiYi7//79U8fAXKVeCFOGQNEfAun0Dgh6D
         cR8E0itjjV13+HTVZURle3nbkfYugcdvcGK46aOG+ukLatj3/iJbHYU6jNvjPJr7hJD6
         2vM+O9OJVKBOdiPMHfw7D3nbe1A7tTDrAGlWfutbsSqJlw+9DmLMsl/aLk+E3eqMEb8A
         9T4g==
X-Gm-Message-State: AOJu0Ywcs09ecXGd93V6fnTzJm5FsVrnFDOjrvmETauqo8DXIcMRfBCi
	pkcFm+7R8U9aXRYl8qLX60Tc0j20lWYBNwqssIv6udC5DZ2Aa0W8tqCxwQK63wKU
X-Gm-Gg: ASbGncvo3MTAeAPemgSb6KPd8fGNOgrmkScXp1MQvZQGKy/pVoeL5ErynY4HA50o7+D
	XcqKq+2mwHxKrj2TUJzVOsh2suDFBUhWQfpm3Y6B+PrjypGbaRxbeyeIsVg2x6gw7Kbl8GUyJwg
	gAAoGCfBC3jN7MZgs6SshPjKRThPs12xtqzNdjJAZ7B+jsJ3aL92GB/0t0HFs5eYgaP18/rQbSi
	6paiM4gtxlMw7P1l+LM+HRnHHH7AUxGV/tusO+oNKVCfu5AlH+yIVaRdZr119ow0PUQJnB4FIaP
	ijOJeLuZOdDHp2dgnv0daNlAOejnTrVwI+jv0yLppQ1FaA2RNW2p10I6Kwu3zVQYuDKirw97
X-Google-Smtp-Source: AGHT+IGZXTDkQwUlOFdwMtzRfplKsud3V1LyKljsm/nmtk4P1D+p37KxeltFqMKKGD94OM+unV6x7A==
X-Received: by 2002:a05:600c:3b83:b0:43c:fc04:6d34 with SMTP id 5b1f17b1804b1-43d49589e66mr41870065e9.20.1742489207757;
        Thu, 20 Mar 2025 09:46:47 -0700 (PDT)
Received: from GIW-21.bmw-carit.intra ([212.118.206.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd187fasm2937035e9.14.2025.03.20.09.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 09:46:47 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
To: openembedded-core@lists.openembedded.org,
	nikhil.r@kpit.com
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Nikhil R <nikhilr5@kpit.com>
Subject: [OE-core][scarthgap][PATCH] nativesdk-libtool: sanitize the script, remove buildpaths
Date: Thu, 20 Mar 2025 17:46:43 +0100
Message-Id: <20250320164643.38426-1-nikhilar2410@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 16:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213416

From: Denys Dmytriyenko <denys@konsulko.com>

Use the same sed command to sanitize libtool script for target recipe
and nativesdk one. Otherwise fails with buildpaths QA error:

ERROR: nativesdk-libtool-2.5.0-r0 do_package_qa: QA Issue: File /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/libtool in package nativesdk-libtool contains reference to TMPDIR [buildpaths]

(From OE-Core rev: f08df9adf290fb6cbebff24df6bbbbe8e5ce95e0)

Upstream-Status: Backport[https://git.yoctoproject.org/poky/commit/?id=89e184da6c9d95a99fd34334df5ac6c5ae87f13a]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 89e184da6c9d95a99fd34334df5ac6c5ae87f13a)
Signed-off-by: Nikhil R <nikhilr5@kpit.com>
---
 meta/recipes-devtools/libtool/libtool_2.4.7.bb    | 15 +--------------
 .../libtool/nativesdk-libtool_2.4.7.bb            |  1 +
 .../libtool/remove-buildpaths.inc                 | 13 +++++++++++++
 3 files changed, 15 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-devtools/libtool/remove-buildpaths.inc

diff --git a/meta/recipes-devtools/libtool/libtool_2.4.7.bb b/meta/recipes-devtools/libtool/libtool_2.4.7.bb
index 44a49505749..c1e315aece4 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.7.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.7.bb
@@ -1,4 +1,5 @@
 require libtool-${PV}.inc
+require remove-buildpaths.inc
 
 SRC_URI += "file://multilib.patch"
 
@@ -15,20 +16,6 @@ SYSROOT_DIRS_IGNORE += " \
 
 ACLOCALEXTRAPATH:class-target = ""
 
-do_install:append () {
-        sed -e 's@--sysroot=${STAGING_DIR_HOST}@@g' \
-            -e "s@${DEBUG_PREFIX_MAP}@@g" \
-            -e 's@${STAGING_DIR_HOST}@@g' \
-            -e 's@${STAGING_DIR_NATIVE}@@g' \
-            -e 's@^\(sys_lib_search_path_spec="\).*@\1${libdir} ${base_libdir}"@' \
-            -e 's@^\(compiler_lib_search_dirs="\).*@\1${libdir} ${base_libdir}"@' \
-            -e 's@^\(compiler_lib_search_path="\).*@\1${libdir} ${base_libdir}"@' \
-            -e 's@^\(predep_objects="\).*@\1"@' \
-            -e 's@^\(postdep_objects="\).*@\1"@' \
-            -e "s@${HOSTTOOLS_DIR}/@@g" \
-            -i ${D}${bindir}/libtool
-}
-
 inherit multilib_script
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/libtool"
diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.7.bb b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.7.bb
index 86c55ded7b6..ac460decf69 100644
--- a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.7.bb
+++ b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.7.bb
@@ -1,4 +1,5 @@
 require libtool-${PV}.inc
+require remove-buildpaths.inc
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/libtool:"
 
diff --git a/meta/recipes-devtools/libtool/remove-buildpaths.inc b/meta/recipes-devtools/libtool/remove-buildpaths.inc
new file mode 100644
index 00000000000..1ca95aeace7
--- /dev/null
+++ b/meta/recipes-devtools/libtool/remove-buildpaths.inc
@@ -0,0 +1,13 @@
+do_install:append () {
+        sed -e 's@--sysroot=${STAGING_DIR_HOST}@@g' \
+            -e "s@${DEBUG_PREFIX_MAP}@@g" \
+            -e 's@${STAGING_DIR_HOST}@@g' \
+            -e 's@${STAGING_DIR_NATIVE}@@g' \
+            -e 's@^\(sys_lib_search_path_spec="\).*@\1${libdir} ${base_libdir}"@' \
+            -e 's@^\(compiler_lib_search_dirs="\).*@\1${libdir} ${base_libdir}"@' \
+            -e 's@^\(compiler_lib_search_path="\).*@\1${libdir} ${base_libdir}"@' \
+            -e 's@^\(predep_objects="\).*@\1"@' \
+            -e 's@^\(postdep_objects="\).*@\1"@' \
+            -e "s@${HOSTTOOLS_DIR}/@@g" \
+            -i ${D}${bindir}/libtool
+}
-- 
2.17.1


