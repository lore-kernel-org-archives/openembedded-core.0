Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A7BC4167E
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 08:40:27 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.5778.1651048824233053761
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UdoYChYj;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id m20so1929218ejj.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mXcvUBy6oqVOF/ByDVVbz4wES1R7cx0RhUuNONH3qmI=;
        b=UdoYChYjePD31LaFQMXcke3G/oj8kuSckQJGEpcF7QDbW/hK+IJmPshNSuCD/KuYl4
         wMFrQkJ456t7W9MRjVhL5Oj/SY89PbiWLvPZbI15MqMk9QC1sDjXrBK5YZly6pLKh0O0
         OkxDyNPpiDoR9+d8uvdnJPZd6D9aJZfUoBF0XxSbehCDQ3kFCTd82DjDNqpmrlsPM0F/
         g8YhqjA4s/JODd/L3Hh17VaF7z7LPHyE3Tao14/sN1eksbVYSWPM1nvWjTUMCMqQQtIu
         PvCg7LQVMrdNUpC/Ec1yeVheeq8oBbeaQSOpO+emMwD7xZg2I2UgbXf4cdCMxM3u01aV
         rBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mXcvUBy6oqVOF/ByDVVbz4wES1R7cx0RhUuNONH3qmI=;
        b=6L+x7TkmlrN7VoGIariBOcH8JU2jytOmhdf9gCJbXH6J95Kn+T3sBKyFGFFmnOy0OQ
         8XwL9HvPbXshTEDPI1/95MdodkHPL9AyZ2eP2xdrXp0vYDnZFkuBz47R0NpXsP+hcZp/
         LvVB3ezXmhk/p4M7zSg1FRDXMHhvwBm+CuD24lFdu+SnLyMpOzKnXGz83z6CP0bQI/sD
         MyS77ybLRUWPDWb7Cn5gt/sRsYWNqLTnttVnVOjsF3yGNeBMpvvaafX7bZgqS4/8IGe1
         PObSiN8O2c1MWCdaai2Ty2U1hjfHgktM64uza26pfg6YdbyV7kTn5EvFFPamGeb9BmQ+
         shzA==
X-Gm-Message-State: AOAM532K7wLWDC0PfDINnGRXtQxRhD8DCL0XTszhSBw1S2j0+mlxIPBA
	KmBpCPZcdHWnfW6LnQf+46QMHZwHgr0=
X-Google-Smtp-Source: 
 ABdhPJw1O/Qo3lSmsly3Q0VZd3FV/OiKIvfX5+D5vVK+xnw8rUppihBdUmUgy6ZoMZJ5764ydZqKxQ==
X-Received: by 2002:a17:906:2652:b0:6f3:a042:6b51 with SMTP id
 i18-20020a170906265200b006f3a0426b51mr11351632ejc.565.1651048822784;
        Wed, 27 Apr 2022 01:40:22 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm7893024edu.51.2022.04.27.01.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:40:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/18] meson: update 0.61.3 -> 0.62.1
Date: Wed, 27 Apr 2022 10:40:03 +0200
Message-Id: <20220427084009.3406717-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427084009.3406717-1-alex@linutronix.de>
References: <20220427084009.3406717-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 08:40:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164903

Rebase 0001-python-module-do-not-manipulate-the-environment-when.patch

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-not-manipulate-the-environment-when.patch | 27 +++++++++----------
 .../{meson_0.61.3.bb => meson_0.62.1.bb}      |  2 +-
 2 files changed, 14 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/meson/{meson_0.61.3.bb => meson_0.62.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index 86abfa9d52..f01a667818 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From dd5b4a200cd2fdf7fef627c4b6752f90c00b863a Mon Sep 17 00:00:00 2001
+From 2e9582167bf9d3273004edb2637310531f0155ab Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -8,25 +8,24 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- mesonbuild/modules/python.py | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
+ mesonbuild/modules/python.py | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.py
-index f479ab9..b934bc6 100644
+index 3bbccd1..fda7a25 100644
 --- a/mesonbuild/modules/python.py
 +++ b/mesonbuild/modules/python.py
-@@ -239,10 +239,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
-         # If python-X.Y.pc exists in LIBPC, we will try to use it
-         def wrap_in_pythons_pc_dir(name: str, env: 'Environment', kwargs: T.Dict[str, T.Any],
-                                    installation: 'PythonInstallation') -> 'ExternalDependency':
+@@ -277,9 +277,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+                 # there is no LIBPC, so we can't search in it
+                 return NotFoundDependency('python', env)
+ 
 -            old_pkg_libdir = os.environ.pop('PKG_CONFIG_LIBDIR', None)
 -            old_pkg_path = os.environ.pop('PKG_CONFIG_PATH', None)
--            if pkg_libdir:
--                os.environ['PKG_CONFIG_LIBDIR'] = pkg_libdir
+-            os.environ['PKG_CONFIG_LIBDIR'] = pkg_libdir
              try:
-                 return PythonPkgConfigDependency(name, env, kwargs, installation)
+                 return PythonPkgConfigDependency(name, env, kwargs, installation, True)
              finally:
-@@ -251,8 +247,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -288,8 +285,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                          os.environ[name] = value
                      elif name in os.environ:
                          del os.environ[name]
@@ -34,5 +33,5 @@ index f479ab9..b934bc6 100644
 -                set_env('PKG_CONFIG_PATH', old_pkg_path)
 +                pass
  
-         candidates.extend([
-             functools.partial(wrap_in_pythons_pc_dir, pkg_name, env, kwargs, installation),
+         candidates.append(functools.partial(wrap_in_pythons_pc_dir, pkg_name, env, kwargs, installation))
+         # We only need to check both, if a python install has a LIBPC. It might point to the wrong location,
diff --git a/meta/recipes-devtools/meson/meson_0.61.3.bb b/meta/recipes-devtools/meson/meson_0.62.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_0.61.3.bb
rename to meta/recipes-devtools/meson/meson_0.62.1.bb
index 1c21493f82..dabdcaab01 100644
--- a/meta/recipes-devtools/meson/meson_0.61.3.bb
+++ b/meta/recipes-devtools/meson/meson_0.62.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-is_debianlike-always-return-False.patch \
            file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch \
            "
-SRC_URI[sha256sum] = "9c884434469471f3fe0cbbceb9b9ea0c8047f19e792940e1df6595741aae251b"
+SRC_URI[sha256sum] = "a0f5caa1e70da12d5e63aa6a9504273759b891af36c8d87de381a4ed1380e845"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.30.2


