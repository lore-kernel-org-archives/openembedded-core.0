Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D86C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 06:18:17 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.28753.1753856291853043638
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 23:18:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HFxmATTw;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b31e0ead80eso5230930a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 23:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753856291; x=1754461091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iUh7jZ6xvKBQFR7vF4pi54Dzws5PLWw9FcjrrLyX0Xg=;
        b=HFxmATTwXXMW7P936/M/vNe7WlYR4Rmg7M4czRCyyrMkP9k6tdYZkY93lHEtCsV7LH
         9gvCsXzJ5m+a3S4DDENGO/dQz15TolPBUQ5jnfv2ECC0/qOf5FwVRVzyZuS7dYwK5zfk
         XipNJ8hjhw983srtztoo1K+o9HsvUchqiHL5op7UAAydb8LI20GIkdRvv6OFgZhdbVKx
         Bzw0C+Kqs0qTuJgJK0fEvmeU5WTiUrIiT3ppvy47lcQoIv7PaAh+mR7iJVsoyQeST1Lc
         GH8xXaJ03z1y0xXrB70fyp08EZRln1t5m1WpdXA4RcKA3ucgxaUmp6nJo4Ihc0eCz7N3
         IhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753856291; x=1754461091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iUh7jZ6xvKBQFR7vF4pi54Dzws5PLWw9FcjrrLyX0Xg=;
        b=X2kvOtUk+sKG2ZuO1b7QiaW0LN5/N8gZ//XrRZhmqQEPxCZde2cgRItH347ltx+w5a
         KVL8Ck6aMdd5f5G3fK7Ny1V57voZqLY8ZUi2PaNa6LrfQAGP8PxqsjP1BNPr5ZsJIkOt
         G6E48HNYWIkuW9N/newgTGSGDZ/SgQBGP24nZJXl4g4dqAcrTWwUGVyDZ/Jv3inxo0QG
         upFAJEQAYvJ+6thZp5mCR0wODZSE+I3j6ddok8Me4B87QDZ1N3AiRsYjfDPSXNhF3Qyz
         Swy69cjj1EXAvOhBmGVKgqBICjI/ozROPM2XtpCLvngGm6du/wb60ObvLkMVr8jgKrgf
         KqBA==
X-Gm-Message-State: AOJu0YxKbdPmwh4WU1HgZ0YvUtA623qVneTdMn4xuqfcywBbsYViSDXg
	RZcvsz5HLcmqUvRlyNZ86pAxEqGHSaYQPZQaCKmZ7VEkC+nOhmhKo5LFxqpAtwAef3Y=
X-Gm-Gg: ASbGncvgSb7TY4sInNjRZkmgouC1DFruXsmenbziq37Kb8y2GWRGeEEEO9BptZ82GJO
	JwguNNgEMZ5bQR996/i/NDVGYH+uhwzbvCYBrD1fq+GwJorDt9NqvAEBx68YRCjLAuheUpsoU4g
	2hY5oBB9MwyQe7LpJnSQ/NKoecsAgUBjwEXbdlbTZBzrCdigFm+zHPs8QdEV7jRH8OMekAs4Le1
	MNRmzrRaoxLdqpRIUqkPX0g3/m+pkY5T6rAzytreHanPanY3lpuLZScjlhpmHQibwBmSDYdwkIw
	hGSiY2QB4wd15xdfTYPaqzr3CiQsDuqmS0M5Mbf20XQmNm0DtFGakJmytUnzoxP7xBBDlRymBw+
	zOoAtMnh2C60/QQ==
X-Google-Smtp-Source: AGHT+IH3htQya/NIuQa1W1M3gii/TbfX3dgFfcRziLSzlIGTcgHNTQ7PBXAqaAskGX9d3WCoel9/Aw==
X-Received: by 2002:a17:903:1aa3:b0:23f:6fa4:1567 with SMTP id d9443c01a7336-24096a4fab3mr28513575ad.8.1753856290724;
        Tue, 29 Jul 2025 23:18:10 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24065971c0esm35808015ad.21.2025.07.29.23.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 23:18:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] libclc: Set LDFLAGS to BUILD_LDFLAGS in do_build_prepare_builtins
Date: Tue, 29 Jul 2025 23:18:07 -0700
Message-ID: <20250730061807.1642753-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 06:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221104

This function is compiling a native binary, however its operating
largely inside a target or nativesdk shell environment. It does
tricks by passing toolchain-native.cmake to provide native
overrides for cmake, which works for most of variables of interest
besides LDFLAGS. In the toolchain.cmake files on OE we do not
override LDFLAGS but append to it via CMAKE_CXX_LINK_FLAGS  or
CMAKE_C_LINK_FLAGS, which causes problems because LDFLAGS for
nativesdk will contain --dynamic-linker option pointing into
nativesdk string and when doing target build it will use the
LDFLAGS from target environment which might work if it does
not contain conflicting flags.

Currently prepare_builtins binary durin nativesdk build ends up with

 [Requesting program interpreter: /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-yoesdk-linux/lib/ld-linux-x86-64.so.2]

 This is because LDFLAGS for nativesdk contain the --dynamic-linker
flags pointing into this path.

Target builds for musl targets also end up with similar problems

So lets pass LDFLAGS=BUILD_LDFLAGS to fix this problem

Should toolchain.cmake class define CMAKE_EXE_LINKER_FLAGS,
CMAKE_SHARED_LINKER_FLAGS, CMAKE_MODULE_LINKER_FLAGS etc. as well
is a question that deserve a separate discussion

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/libclc_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-devtools/clang/libclc_git.bb
index 7e63ce9c759..d09ea8cdb38 100644
--- a/meta/recipes-devtools/clang/libclc_git.bb
+++ b/meta/recipes-devtools/clang/libclc_git.bb
@@ -43,6 +43,7 @@ do_install:append() {
 # Need to build a native prepare_builtins binary in target builds. The easiest
 # way to do this is with a second native cmake build tree.
 do_build_prepare_builtins() {
+    export LDFLAGS="${BUILD_LDFLAGS}"
     cmake --fresh -G Ninja \
         -S ${OECMAKE_SOURCEPATH} -B ${B_NATIVE} \
         -DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain-native.cmake \

