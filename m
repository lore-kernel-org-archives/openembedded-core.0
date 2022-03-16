Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743FBC433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 17:37:45 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.518.1647452264984413787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 10:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nmbbLlCu;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id h5so2380603plf.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 10:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q7fu4F7ASHHmqjyGaeyPxyv+eIkSoxFuP6XFmwTaz9I=;
        b=nmbbLlCu0U9Vw+lMHx0hYmFrJjneMsHAaDEIUKnlh9AJoBlggllEsQhMFH0nlYe9PX
         IAMo68mQY6TViUhiNkh5RmrkZEzlo1DmcK/FM1aBNigPqjnAbnkWkLq/IKQV+HUeIxWX
         UrCKxzwZNcFgyI1I0k+0NrQ9xfeTNp2P6E2U+c2R+en5+xLZ1LIVeDoWOoQuomn+OhVc
         zIY7g5kyuzkKFzJQBaBOwTdkTgc3uVGi8irFt2qr06lYSmbOvw9YsYP8ZEzbc5uTyqrY
         hFsCZZVqoiy59bmFBSGVr/1hLeq25Qt75ELMxYge3goDSr6g/lzvnnMX25Qz6y7TcMrO
         1qFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q7fu4F7ASHHmqjyGaeyPxyv+eIkSoxFuP6XFmwTaz9I=;
        b=y4YAUImCAdeY+r+nHydYLHGNcX6qfgYlsDZmXs33eAOB4M/ETCq4DuED6UxaFrGHuV
         tP5qRK/9qwrNWaqIb1ju/VKG9dG4U2h7MSpHlMO4sm3lBbfOIDovcLTEQhFxpI/uVO9r
         Hb+0tde5/HJDYXtaGVnremXxQ/ImPNML3MVnLjAl7oI9HvzlnPk4DhmvrlMDqXTZzcjf
         j0GVlntFDU0wM1JiFAUtGwvyBDDDZdP14LoR69ilvXe/nPjxIQEsMjbYNh7JNOD9waue
         2DyqalYzIa6XTfwHwMcsMT408NeXGDXt+HRL2PiVNNqUz8arCx8Bqv0wSkHY7kH/upAV
         M3eA==
X-Gm-Message-State: AOAM530qQTZ5aDDDsb+GvAvbViZKsS6XXYFDLFg09piLlbA1IYckMiB+
	ZAxbS49XuySUkJNT58LIvS0Ii8mrkWtgRg==
X-Google-Smtp-Source: 
 ABdhPJw1xiJhwlFNMF2L/8mJYBGyU/emBTNUw9jieVXOm9vD/b7FY8kB70NHU4fPFXH32XkG98oIig==
X-Received: by 2002:a17:902:daca:b0:151:f79a:fd07 with SMTP id
 q10-20020a170902daca00b00151f79afd07mr1056774plx.88.1647452264158;
        Wed, 16 Mar 2022 10:37:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 i8-20020a63a848000000b0037d5eac87e3sm46982pgp.18.2022.03.16.10.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 10:37:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libucontext: Upgrade to 1.2 release
Date: Wed, 16 Mar 2022 10:37:41 -0700
Message-Id: <20220316173741.3089169-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 17:37:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163346

License-Update: Copyright years changed [1]

aarch64 implements simd register save/restore

loongarch64 supported added

[1] https://github.com/kaniini/libucontext/commit/9943d4f5fc31a23a591e74caf24ce4effd887501
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-meson-Add-option-to-pass-cpu.patch   | 49 -------------------
 ...{libucontext_git.bb => libucontext_1.2.bb} |  6 +--
 2 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-core/musl/libucontext/0001-meson-Add-option-to-pass-cpu.patch
 rename meta/recipes-core/musl/{libucontext_git.bb => libucontext_1.2.bb} (89%)

diff --git a/meta/recipes-core/musl/libucontext/0001-meson-Add-option-to-pass-cpu.patch b/meta/recipes-core/musl/libucontext/0001-meson-Add-option-to-pass-cpu.patch
deleted file mode 100644
index 1fdc9f739d9..00000000000
--- a/meta/recipes-core/musl/libucontext/0001-meson-Add-option-to-pass-cpu.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From a530eed9e7e6872e10fe92efaf1e9739471c30ca Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 30 May 2021 08:30:28 -0700
-Subject: [PATCH] meson: Add option to pass cpu
-
-This helps with cross compile setups, where host_cpu != target_cpu
-therefore detecting it on the fly will end up with wrong cpu to build
-for
-
-Upstream-Status: Submitted [https://github.com/kaniini/libucontext/pull/28]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build       | 6 +++++-
- meson_options.txt | 4 +++-
- 2 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index e863780..2b4bdbd 100644
---- a/meson.build
-+++ b/meson.build
-@@ -6,7 +6,11 @@ project(
-   version : run_command('head', files('VERSION')).stdout()
- )
- 
--cpu = host_machine.cpu_family()
-+cpu = get_option('cpu')
-+if cpu == ''
-+  cpu = host_machine.cpu_family()
-+endif
-+
- if cpu == 'sh4'
-   cpu = 'sh'
- endif
-diff --git a/meson_options.txt b/meson_options.txt
-index d4201d1..864d83c 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -1,4 +1,6 @@
- option('freestanding', type : 'boolean', value : false,
-        description: 'Do not use system headers')
- option('export_unprefixed', type : 'boolean', value : true,
--       description: 'Export POSIX 2004 ucontext names as alises')
-\ No newline at end of file
-+       description: 'Export POSIX 2004 ucontext names as alises')
-+option('cpu', type : 'string', value : '',
-+       description: 'Target CPU architecture for cross compile')
--- 
-2.31.1
-
diff --git a/meta/recipes-core/musl/libucontext_git.bb b/meta/recipes-core/musl/libucontext_1.2.bb
similarity index 89%
rename from meta/recipes-core/musl/libucontext_git.bb
rename to meta/recipes-core/musl/libucontext_1.2.bb
index 9061cf0b1b5..4e34df14392 100644
--- a/meta/recipes-core/musl/libucontext_git.bb
+++ b/meta/recipes-core/musl/libucontext_1.2.bb
@@ -4,14 +4,12 @@
 SUMMARY = "ucontext implementation featuring glibc-compatible ABI"
 HOMEPAGE = "https://github.com/kaniini/libucontext"
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6eed01fa0e673c76f5a5715438f65b1d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ebea527af0602d509b7f4c49533fb1bd"
 SECTION = "libs"
 DEPENDS = ""
 
-PV = "1.1+${SRCPV}"
-SRCREV = "335ee864ef6f4a5d4b525453fd9dbfb3507cfecc"
+SRCREV = "4dde3417b4bb4b1b1545bd913be337680b5e28c3"
 SRC_URI = "git://github.com/kaniini/libucontext;branch=master;protocol=https \
-           file://0001-meson-Add-option-to-pass-cpu.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.35.1


