Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F10EC54791
	for <webhook@archiver.kernel.org>; Sat,  9 Mar 2024 20:43:08 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.20739.1710016981509403913
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Mar 2024 12:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=daTWPVQu;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6d9f94b9186so3030919b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Mar 2024 12:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710016981; x=1710621781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CyBNCpqYXn0T0+4sPDaarbsmjfMQEBHHSLVF0AADKxc=;
        b=daTWPVQufCGqXqwbWCkTW/44nkx0v14r6R9QMAb2MbaJ/jFGErrf/p6lSC34V5zzuI
         HMjUuDBtPtQryGuUY7PL8Zq26En6vKOBkvbU9lNj4tlwwIuLFdNh6jTnC/bXv3K2G1nb
         MRokpHrfG/QUpSq1pwBZdIf35SPK17np//N6Uv6TMWbJxDKHNjeyAUFLd0N+POUGGHfe
         AmfKur4heQlJLCrdCmJr/ZCE0nmetxCn9gfMZ9aAES3N0b4rDtbtidZxADGV5J1Uddcp
         4fX9u08YAv6VIKmdZLlF74iR5IHeZeduZH4kcxutTsNAoKnWIEEcT1XswkA20r9hKFFK
         0OJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710016981; x=1710621781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CyBNCpqYXn0T0+4sPDaarbsmjfMQEBHHSLVF0AADKxc=;
        b=ojX8BvF6Q6icafHQspj8Zy+aOJ9PVA4b3ZZI6rJWFDB3QGNpErIA9grEicZ7m7ipQv
         b0U6hOTIMCKiWK78ExHE/RbuF5fLIihj0FYu+cAfydO7MbyO6UjhbY+b4DVz8/gfQGqP
         +LaivryvTneKd/8url1dPtiOc4RJMPxBTHZvMQib/P7pmOqwqpHfSJgCy46KgNl4jMR9
         fthaxhSM7u0H1bLNf+IOOZyTrX3HV7psIQkNuLQDPKYOOT+VJ0PW1dSN06iHMqst9IJ8
         6Uf97KLw3eu6bE/W2or/sl7D8Tj0QDhPrLI4XMemaP7XE+b1evE/fjdrocfaZAcu1RYN
         tIyA==
X-Gm-Message-State: AOJu0Yx8/mXLC/3zDJ4j27r5OjhA7AAy+Sj7YufembM7S8ehsv5Xg5Ir
	J6RKPAgvkSWjEBbrTAVOXnQGOX/Fh5n6saymR5Lq024VsZD2SpxZi9vhcw3t
X-Google-Smtp-Source: AGHT+IHVpfHvvj7r7yN3rOJXGJS3fXiqiz7i1u/yiZskN2t5yZUtmJ/OLW1bx8MMOXQt6WF8xe7uYQ==
X-Received: by 2002:a05:6a20:43a9:b0:1a2:d991:c020 with SMTP id i41-20020a056a2043a900b001a2d991c020mr2816411pzl.17.1710016980341;
        Sat, 09 Mar 2024 12:43:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::bc23])
        by smtp.gmail.com with ESMTPSA id f3-20020a63f103000000b005dc2ca5b667sm1605605pgi.10.2024.03.09.12.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 12:43:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Update to 18.1.1 release
Date: Sat,  9 Mar 2024 12:42:58 -0800
Message-ID: <20240309204258.3766679-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Mar 2024 20:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196872

This is final release after RC suffix is removed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 111fb07fac9..8086c9e2eb9 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -17,14 +17,14 @@ inherit cmake pkgconfig
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
-PV = "18.1.0${VER_SUFFIX}"
+PV = "18.1.1${VER_SUFFIX}"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "461274b81d8641eab64d494accddc81d7db8a09e"
+SRCREV = "dba2a75e9c7ef81fe84774ba5eee5e67e01d801a"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.44.0


