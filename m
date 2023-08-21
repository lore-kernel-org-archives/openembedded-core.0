Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7CBEE49AB
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 16:11:57 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.1055.1692634314392561880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 09:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rOGVbCOT;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5259cf39154so4470389a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692634312; x=1693239112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+mSuVh7iCmEtFdHyUBXG4r59rQe0KW4Z0rsULAB9NU=;
        b=rOGVbCOT3inGcfgDjmtlubhNCgcuDa5cY4l6q+izppkxeYifWtxf7oh9AoVzFyFQ8X
         4j2tZlzwF/sugJADOnW248/k2+p7DnBXh3zQBSBC5XLXrhKnK87ThycdP8Ubk83Pk6P2
         gEntHqZSgZvmB9CAgGVCNWBy8fgWbmm2Md/PTtBewzyAg90w6rwf7kzgJ89WDUlzPbuD
         Z5RMbpfvZNLsoiRfU/BsCWC2Pe+DfnFRp2TBtXgD899nteE9uSxQGTaQYo6RtN7Xviut
         cA+3V4CeZawLC5nUVEO8alRWQOfbRyV28BVfNGmY9s9tBrynJUhSk1jxh0VgD1tefrZF
         G1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692634312; x=1693239112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+mSuVh7iCmEtFdHyUBXG4r59rQe0KW4Z0rsULAB9NU=;
        b=MBxNUgLnuda8255WwuuEOjVfUyz/pEVkOw+OOqntwyn+o7TCCu3KkJ0+tXq49dQdN7
         m6Zzv6F+8CYjNcEMN014QkIXkwx/bw+KnQRwUix/IwrgssOmclF1Fa++s2z1LGuJEMhN
         1aWe9GRZEwOpx3LLp8+VwHQYrWErr1/jNNAKGpG8cwoXG2VGiUQ4AVCQblKo9uGGIlbP
         TcecYs6+yi5dJIeguAV6k7AJJckp0F2JdeDIKvxBhDi816Tyu9/vOnPFM8JjPTSXxYVX
         IV0w7jLYC36rOqFIrF9R1gKUmhRCOvyqSBdpag0wjbAIopAfPDbnG/KwtEPBYlK9uNpw
         8jEA==
X-Gm-Message-State: AOJu0Yz8HkI7lMpHIMwJ3EngudD2ilVRZwUFXiAS41D4YD/uK4ENdfpq
	XqVqcDINuyGN6yATmNsFKAuqQ/HDhpU=
X-Google-Smtp-Source: AGHT+IFSRNWYcUOlvPmiBlNjMetyfyMB/J8prz+VVqicnRomuYF/wxDJQpxHoDmv0dmlN0Y2OqFgVQ==
X-Received: by 2002:aa7:d4da:0:b0:522:40dd:74f3 with SMTP id t26-20020aa7d4da000000b0052240dd74f3mr5041019edr.39.1692634312609;
        Mon, 21 Aug 2023 09:11:52 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id x21-20020aa7dad5000000b0052284228e3bsm6175579eds.8.2023.08.21.09.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 09:11:52 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 14/14] docs: cover devtool ide
Date: Mon, 21 Aug 2023 18:07:17 +0200
Message-ID: <20230821161120.171956-15-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821161120.171956-1-adrian.freihofer@siemens.com>
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 16:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186477

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/sdk-manual/extensible.rst | 100 +++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 9e08e57a4e7..81a46c4767f 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -237,7 +237,7 @@ all the commands.
    devtool
    quick reference.
 
-Three ``devtool`` subcommands provide entry-points into
+Four ``devtool`` subcommands provide entry-points into
 development:
 
 -  *devtool add*: Assists in adding new software to be built.
@@ -245,6 +245,8 @@ development:
 -  *devtool modify*: Sets up an environment to enable you to modify
    the source of an existing component.
 
+-  *devtool ide*: Generates a configuration for an IDE.
+
 -  *devtool upgrade*: Updates an existing recipe so that you can
    build it for an updated set of source files.
 
@@ -632,6 +634,102 @@ command:
       proceed with your work. If you do use this command, realize that
       the source tree is preserved.
 
+Use ``devtool ide`` to generate an configuration for the IDE
+------------------------------------------------------------
+
+``devtool ide`` automatically configures the IDE for cross-compiling and remote debugging.
+The IDE is configured to call for example cmake directly. This has several advantages.
+First of all it is much faster than using e.g. ``devtool build``. But it also allows to
+use the very good integration of build tools like cmake or gdb with VSCode directly.
+
+Two different use cases are supported:
+
+- Generate the IDE configuration for a workspace created by ``devtool modify``.
+
+- Generate the IDE configuration for using a cross-toolchain as provided by
+  ``bitbake meta-ide-support build-sysroots``.
+
+Assuming the development environment is set up correctly and a workspace has been created
+for the recipe using ``devtool modify recipe``, the following command can create the
+configuration for VSCode in the recipe workspace:
+
+   $ devtool ide recipe core-image-minimal --target root@192.168.7.2
+
+What this command does exactly depends on the recipe or the build tool used by the recipe.
+Currently, only CMake and Meson are supported natively.
+
+For a recipe which inherits cmake it does:
+
+- Prepare the SDK by calling bitbake core-image-minimal, gdb-cross, qemu-native...
+
+- Generate a cmake-preset with configures cmake to use exactly the same environent and
+  the same cmake-cache configuration as used by ``bitbake recipe``. The cmake-preset referres
+  to the per-recipe-sysroot of the recipe.
+
+  Currently Configure, Build and Test presets are supported. Test presets execute the test
+  binaries with Qemu.
+
+- Generates a helper script to handle the do_install with pseudo
+
+- Generates some helper scripts to start the gdbserver on the target device
+
+- Generates the ``.vscode`` folder containing the following files:
+
+  - c_ccp_properties.json: configure the code navigation
+
+  - extensions.json: Recommend the extensions which are used.
+
+  - launch.json: Provide a configuration for remote debugging with gdb-cross and gdbserver.
+    The debug-symbols are searched in the build-folder, the per-recipe-sysroot and the rootfs-dbg
+    folder which is provided by the image.
+
+  - settings.json: confgure the indexer to ignore the build folders
+
+  - tasks.json: Provide some helpers for running
+
+    - do_install and ``devtool deploy-target``
+
+    - start the gdbserver via ssh
+
+For a recipe which inherits meson a similar configuration is generated.
+Because there is nothing like a meson-preset a wrapper script for meson is generated.
+
+If there is no native support by ``devtool ide`` for the build tool used by the recipe a generic
+IDE configuration calling ``devtool build recipe`` is generated.
+
+For some special recipes and use cases a per-recipe-sysroot based SDK is not suitable.
+Therefore devtool ide also supports setting up the shared sysroots environment and generating
+a IDE configurations referring to the shared sysroots. Recipes leading to a shared sysroot
+are for example meta-ide-support or shared-sysroots. Also passing none as a recipe name leads
+to a shared sysroot SDK.
+
+   $ devtool ide none core-image-minimal
+
+In case of a shared sysroot SDK the configuration which gets generated for VSCode exposes the
+cross-tool-chain as a cmake-kit. If a cmake project is loaded into VSCode the cross-toolchain
+can be selected for compiling.
+
+The default IDE is VSCode. Some hints about using VSCode:
+
+- To work with cmake press ``Ctrl + Shift + p``, type cmake.
+  This will show some possible commands like selecting a cmake preset, compiling or running ctest.
+  A cmake kit might be activated by ``Ctrl + Shift + p``, type cmake quick start,
+  if not preset file is in the wokspace.
+
+- To work with meson press ``Ctrl + Shift + p``, type meson.
+  This will show some possible commands like compiling or executing the unit tests.
+
+- For the deployment to the target device, just press ``Ctrl + Shift + p``, type task.
+  Select the install & deploy task.
+
+- For remote debugging, switch to the debugging view by pressing the play button with the bug on the left side.
+  This will provide a green play button with a drop-down list where a debug configuration can be selected.
+  After selecting one of the generated configurations, press the play button.
+
+Additionally ``--ide=none`` is supported.
+With the none IDE some generic configurations files like .gdbinit files and some helper scripts
+are generated.
+
 Use ``devtool upgrade`` to Create a Version of the Recipe that Supports a Newer Version of the Software
 -------------------------------------------------------------------------------------------------------
 
-- 
2.41.0


