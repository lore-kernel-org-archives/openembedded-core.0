Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA06C87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 04:58:14 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.40898.1754888292012941266
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 21:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ffFTBKIu;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76bfd457607so3782472b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 21:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754888291; x=1755493091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vbkdl009MYIu5wVPS4aQ1mTFr9FnlY0rB0x0+ExiGow=;
        b=ffFTBKIuqr5yYSDfcBq6+6HbyLfoTtZkD6AYi+D3VHs0zrVOFK2+JDWCp72p2sWUkC
         YZ6rnNToazktB7nIq++a5u9qlED7ryAIr4xfOLkpzO7avWPpb2Z68nz1V/Wxxn8qEaiw
         MbuVux5wizLSaIztK5NfNirDJujfXlQhvc1ICLXxli6C3iwnAaxANrfcyj14mH0Xtk+z
         3cbn9siQWxpD+C+7YkDKeOpPsK+Z8ytnoE/zMh9YNioEl1nDRZxUix/fA24AaLQFo0OQ
         OXfYJRU3ZfaQytZNptUGLbH1kV+5yHgxPHGHWym4zo7kvI4SEtb1bCiSCOcYttr/iT4W
         tesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754888291; x=1755493091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbkdl009MYIu5wVPS4aQ1mTFr9FnlY0rB0x0+ExiGow=;
        b=VR/1fb+i98rMrC24+H47jWuhM9qDtgavbNYTBq52pECmA1cFRPgLmCC9tonm9EO2vx
         xwrYFNnffV0VHFcLblJYCit+a916SV8UGVYsR7ppIfiiF6yJ7tck5MHds1CF7mPEiXUp
         dR3IEx1TAHZqzB4Kr90/YShF/L0XmIgW2WMdrmGnzSj2r1pXKAATKCgbTidkJObH5DSL
         GcPtOLXupP7wHC+BP5qCWAP61wBpzpt3NIF6NPlYCYc5fqnhDFqj13IH2p/4OIN8f5aj
         UAPDBoMYzeWta4cAIMx92lNdiCSo6yU/DFAEl2R4i+dZpQIOs+d/dFCYmuB8B7Vf0uay
         Ps0Q==
X-Gm-Message-State: AOJu0YzfxZ8jC3DrDu8eV8Pb7VWUqtQnMp+/sfIqbg0k7BbTjNKA8Lgo
	SAmnhin1ZJBQtS4WEcAxe8oOktFyyVCiaNosgauHS0fteU7CpgfC0xnVMcWFWSiKiA==
X-Gm-Gg: ASbGncsZ09XhluEdNYP9RfqL0Wi45C6jhbJrXLdEdD0jz5mgwtZ8fH8NT84xnOZvpy3
	TfZnvFsnnhhK+V2+cO8bVBXNbi4sO6BNGQFP0Vz7XqwyBNap056VfC4ILHq8tG6v//B37GYIg3Q
	7tu+vTKklPcP5AOb+NbXhhnZeIGh64rKaixrQ9K0oAHha9/IgspdNIiEfbQWQNTjwVZNb4KjKFd
	ksIkAIwMFDQzchp9eUQvBNYCNY/nFzLvhSJEQ/xG0WnuixQ9g1i1WnKN6CcvmrBTFF1aF3wbEVX
	WPLXlmYYdwN+5PafCGYsEOkbfTUs/I/tanq3whSPmk0mPxNvQTZT6i2ZyPnoP/xDMdEhkJnff1b
	CwTLxiqMGMVTUqjD3Atp8eem7cDySQDRcvH0=
X-Google-Smtp-Source: AGHT+IEhRJTg+gpr9mE9Z3X7/amt41+cssL5iLwCjHXxNatStLevu/FJOrnYjrFhJ1WcsD6cs8S98Q==
X-Received: by 2002:a05:6a00:21cd:b0:76b:d75c:8a76 with SMTP id d2e1a72fcca58-76c4603d1bemr13009265b3a.1.1754888290744;
        Sun, 10 Aug 2025 21:58:10 -0700 (PDT)
Received: from L-16657L.kpit.com ([103.189.135.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bd733580fsm24322923b3a.7.2025.08.10.21.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 21:58:10 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-core@lists.openembedded.org,
	nikhil.r@kpit.com
Cc: Nikhil R <nikhilr5@kpit.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH] cmake: Add PACKAGECONFIG option for debugger support
Date: Mon, 11 Aug 2025 10:28:02 +0530
Message-Id: <20250811045802.41778-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 04:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221717

From: Nikhil R <nikhilr5@kpit.com>

Starting from CMake version 2.27 support for interactive debugging of CMake
scripts and configurations was added. However, by default the `nativesdk-cmake`
is compiled with debugger support turned off.

This change adds debugger support for cmake

(From OE-Core rev: 8acfca456c3502f0d097ba01a2d08f83fb75ab60)

Signed-off-by: Nikhil R <nikhilr5@kpit.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/cmake/cmake_3.28.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake_3.28.3.bb b/meta/recipes-devtools/cmake/cmake_3.28.3.bb
index 63d483801a..2d47b4c027 100644
--- a/meta/recipes-devtools/cmake/cmake_3.28.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.28.3.bb
@@ -44,9 +44,11 @@ EXTRA_OECMAKE=" \
     -DKWSYS_CHAR_IS_SIGNED=1 \
     -DBUILD_CursesDialog=0 \
     -DKWSYS_LFS_WORKS=1 \
-    -DCMake_ENABLE_DEBUGGER=0 \
 "
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[debugger] = "-DCMake_ENABLE_DEBUGGER=1,-DCMake_ENABLE_DEBUGGER=0,"
+
 do_install:append:class-nativesdk() {
     mkdir -p ${D}${datadir}/cmake
     install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
-- 
2.34.1


