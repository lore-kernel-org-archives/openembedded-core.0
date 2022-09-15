Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED489ECAAD3
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 11:15:11 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.8579.1663240510941387074
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 04:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G/IenIvC;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 o70-20020a17090a0a4c00b00202f898fa86so7763851pjo.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 04:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=TNOJuzVriKbrX/4gtRubz8WSxGc7H7ZZ7HHAsePm+oE=;
        b=G/IenIvC1sPnmuuiBsXPC5dH9ndy7/wDFb3wnXC//lQsu2vRDifrmc1cLVr/c9I3sj
         wMHIT7FWSt/laITKW507os+7n0ZcmRZTryk0BP3qAwUu9Id6D8Ks67KhrDvgE3H+ChGI
         HqZjuRT0oFlKohA3MIomqHUz1uOj3YeTdLt78KyRDPGBGwedN6Neckd/6TnrDKOU1Ltk
         JG0IGqI5/y+Wb/uyvwDFdC9RJhzJdR3VYMmiM7J5WxfpA+hRAQeR8+UMkYTYEn5Dh9fU
         begyzDv9iNFGYnFJNbFQXzDo9mTQGQaZn3xN7KOVqrnF6QJO5NplmT+iziQNTsZ8yZ9G
         ErlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=TNOJuzVriKbrX/4gtRubz8WSxGc7H7ZZ7HHAsePm+oE=;
        b=c8U1VsT2j98BU5H13rJ1kWPvQQ/VmqUxlgp+9qxhfXbOD6d1jysTUzPAc0bZ2eGb3N
         vC8gPTsEeYU6EiyAG3uVmz1bih2fne/xh4ABCRARkVMVwCV+Ivz9+bmEH2G0OMc7ix1h
         IGUNExtm2JdQWFeFBp7+CsMsV/aFwvvhV1T8d5LYre7gL5SXfCX8o8JF/Mb2rb5gzqbh
         fgNZnape28a5FZmCEg/BwsZXR/EPlFWueC4TXrFM0IG6dcjCNIy102TspPRV9GNmfW3G
         xj5hiE+iSDVLvLqh+HaM7IypmSe39fYLt5034q24oIes6YnXTs7bQ6MlyJBrc9ZeeWxt
         j31Q==
X-Gm-Message-State: ACrzQf36/Pt28ujX4HmI0vUBYN9NnwpJD+4iW5m833QTt7SFLjwAN+1L
	fseFpViMubyuxs3U0ZvdWF4cf4w2Xus=
X-Google-Smtp-Source: 
 AMsMyM4cd35OKURabRJWfNIBUiN+4rnXh/ffYqRS0OiR8VtkaG3FOw+WmaBNTyoAH3i7TIhFZj8Tyg==
X-Received: by 2002:a17:90a:a60b:b0:200:919a:55a1 with SMTP id
 c11-20020a17090aa60b00b00200919a55a1mr10158484pjq.194.1663240509853;
        Thu, 15 Sep 2022 04:15:09 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 k8-20020a170902c40800b00176a715653dsm12872187plk.145.2022.09.15.04.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 04:15:09 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [kirkstone] glibc : stable 2.35 branch updates.
Date: Thu, 15 Sep 2022 16:44:40 +0530
Message-Id: <20220915111440.2121310-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 11:15:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170687

Below commits on glibc-2.35 development branch are updated.

f8ad66a4ca nscd: Fix netlink cache invalidation if epoll is used [BZ #29415]
9e960717e1 Apply asm redirections in wchar.h before first use
577c2fc7f3 elf: Call __libc_early_init for reused namespaces (bug 29528)
83f1d9851e NEWS: Add entry for bug 28846
cbd8685e82 socket: Check lengths before advancing pointer in CMSG_NXTHDR
4bafc4001d alpha: Fix generic brk system call emulation in __brk_call (bug 29490)
37fd2ac665 stdlib: Fixup mbstowcs NULL __dst handling. [BZ #29279]
a1ec4157bc stdlib: Remove attr_write from mbstows if dst is NULL [BZ: 29265]
813a8d0171 Update syscall lists for Linux 5.19
e200127c6c riscv: Update rv64 libm test ulps
8c172a6cb0 dlfcn: Pass caller pointer to static dlopen implementation (bug 29446)

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index ccb41e5af6..d3cea19f9c 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "0e5b239f45992e4b54c6f946ecb0c410afc8bb08"
+SRCREV_glibc ?= "f8ad66a4cab14ed294bf50e7a9eddb73da6cf307"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.25.1


