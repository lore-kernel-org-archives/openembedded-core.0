Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.6052.1626265578750372834
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PXaNeRZS;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id k32so1454405wms.4
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3nvDX4TY1Pe8Kn+2n8z98K6DuXLS8IjVc1zOaWVT8Qw=;
        b=PXaNeRZSl895iepIYxrdaIyU/Q4gZwSUQrdk1afyJhkvnOv6t1eR/bgBj4d4hq96uW
         uTLTwhpY1MWH2UQOC3yS1CKRcX2qmO2/eGN85YcUF2AUIHMSqVeNDgufuvLJ/wcu+l+7
         BCvoWH5W5fan/8YVBkM67tu9JyOMckgIYA5Sor6nMVT47GtUFFf9k9Wj7EshFJgkk9c4
         UseUgIkEdH7bnkMXOm77x/1p9EtXhSOC/2bxUL3bJSWJjfkFEs1oTPHdHh2Rl+M4/aIP
         teQu1hWdIKjVaPoNQogdwca3elHi7gbu7YCn6Hf2r67f0zm/CYxCXvOTSUlCsvFuP7PS
         pIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3nvDX4TY1Pe8Kn+2n8z98K6DuXLS8IjVc1zOaWVT8Qw=;
        b=a4+Nw7+DmolljPahRqBEO4tmyFEGbroV6UurcGmLYhAzRlRSNoWyrr0CnYRS1iyYID
         IN+4tM9n/nsX+HSpbfKlkRetB1O1YspGnAQySAvuqags+QvYcf/s+sAeh61gO2DK0cla
         MkZ1y1ICPsz+PHaXZIjQfERhPQnzm1t6sNIon/rIt4pCDLb90SIwtPrgUEDUtRrm+WvY
         57Xt0rNQDQTQn5/FYjdXk2RVYpCHfPLJ6TscFRZzaVM5ceblc2ePn5y212HcIKDxTKut
         SxTDd4SrntYSmxTiZJTIgN7zb4UNk3d7sdKsCe9ta26cXyfX2UAYRhYlVv4ly8JBvIKf
         7PBw==
X-Gm-Message-State: AOAM5300J9JveUmoKJ5vcGxZ4WkPG+kmYEkbRs23zE/3ZR+IjehQu1ZV
	SWo3ngQWae6Dnzvs1Yivse47mFxTOvo=
X-Google-Smtp-Source: ABdhPJz8gD8lYGA2HQbAOxdPyKtYq3QoaZuWPOZNYFE1AR2JrmfVdNnRINc6kCbyEQm0qenAh1v6Uw==
X-Received: by 2002:a05:600c:6d8:: with SMTP id b24mr3797480wmn.111.1626265577385;
        Wed, 14 Jul 2021 05:26:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/21] libmodulemd: update 2.12.1 -> 2.13.0
Date: Wed, 14 Jul 2021 14:25:52 +0200
Message-Id: <20210714122606.605142-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete patch, as the issue is fixed upstream.

Disable python bindings as they're not used anywhere,
and require functional gobject introspection.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...e-the-manpage-only-if-the-feature-is.patch | 28 -------------------
 .../libmodulemd/libmodulemd_git.bb            | 16 ++++-------
 2 files changed, 6 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd/0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd/0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch b/meta/recipes-devtools/libmodulemd/libmodulemd/0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch
deleted file mode 100644
index d5c87a1154..0000000000
--- a/meta/recipes-devtools/libmodulemd/libmodulemd/0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a04fd2c8ac9e0f7a6fc17f02b2a95227b3d0aae4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 31 Mar 2020 16:06:39 +0200
-Subject: [PATCH] modulemd: generate the manpage only if the feature is enabled
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- modulemd/meson.build | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/modulemd/meson.build b/modulemd/meson.build
-index 9ef1902..9f71e72 100644
---- a/modulemd/meson.build
-+++ b/modulemd/meson.build
-@@ -494,6 +494,7 @@ if with_docs
-     )
- endif
- 
-+if with_manpages == 'enabled'
- help2man_opts = [
-   '--no-info',
-   '--section=1',
-@@ -506,3 +507,4 @@ custom_target(
-     ],
-     install: true,
-     install_dir: join_paths(get_option('mandir'), 'man1'))
-+endif
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 771b2c094f..963e881d6c 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -4,25 +4,21 @@ DESCRIPTION = "${SUMMARY}"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
 
-SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main \
-           file://0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch \
-           "
+SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main"
 
-PV = "2.12.1"
-SRCREV = "c0897fa0e9d7d1305fd4813b1010c1d4cca42346"
+PV = "2.13.0"
+SRCREV = "1a032da198333ee77bdbe4be65e60eb4115ea73f"
 
 S = "${WORKDIR}/git"
 
-inherit meson gobject-introspection python3-dir
+inherit meson gobject-introspection
 
-EXTRA_OEMESON = "-Dwith_docs=false -Drpmio=disabled -Dlibmagic=disabled -Dwith_manpages=disabled -Dgobject_overrides_dir_py3=${PYTHON_SITEPACKAGES_DIR}/gi/overrides"
+EXTRA_OEMESON = "-Dwith_py3=false -Dwith_docs=false -Drpmio=disabled -Dlibmagic=disabled -Dwith_manpages=disabled -Dgobject_overrides_dir_py3=${PYTHON_SITEPACKAGES_DIR}/gi/overrides"
 
-DEPENDS += "glib-2.0 libyaml glib-2.0-native python3"
+DEPENDS += "glib-2.0 libyaml glib-2.0-native"
 
 BBCLASSEXTEND = "native nativesdk"
 
 GIR_MESON_OPTION = 'skip_introspection'
 GIR_MESON_ENABLE_FLAG = 'false'
 GIR_MESON_DISABLE_FLAG = 'true'
-
-FILES_${PN} += "${libdir}/${PYTHON_DIR}/*"
-- 
2.31.1

