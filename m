Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79B2C4706E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 02:18:23 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.13139.1703038702448545297
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 18:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Db70Wdv7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6d940d14d69so579356b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703038701; x=1703643501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzI7KYQTTBbPgc4ypCIGs6vUjHzzPvoRwp7K8Is9f7E=;
        b=Db70Wdv7Z2COC3C0R4VuFxGG8chd10q4DEcZAXkttOtnNmlkBTfxZUGH3lnrW0XKxQ
         e+AQvxfa5P1ZAyQRLlmXN0Abne6HV6L0v4FUTTwtmw3650UrV+q/G8Lv0AEk64rb3FLK
         zV6pgvTP579vLEvdQxYd4fzNwq1FSxVzaym5WnyscN8p+it836YiS5Lwtxk2rBdydQpt
         nd57VFcgupHdt/TChqiCkRD3yHklE3H4NHDSzPOcXZcBLyaZCKTTkjacDrRkvGKNGz9d
         EM/1DaEq5qUFy/mHA45KLmXEZMxP5ts9yTdOSh4XI7sbJ2705cUdKh0vGOQGyUlef7XG
         fNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703038701; x=1703643501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzI7KYQTTBbPgc4ypCIGs6vUjHzzPvoRwp7K8Is9f7E=;
        b=VtN4PO6RvAUVNu6EJa2Uv2ir7IiTUKEhxJpWN8XoR9GwSrmm7+ttkCmPsmA7IQivQM
         wZy8ynvb7NCfqrD31D8Iv3oubjlKJr6gcIcWTnW5LODOerCaEySy3dE9cjkPtMi6v+CS
         6MzI+v+9tWnwYJeCRxCHKpFaDs/j8nCS8t4DFnkarAJy6sPHv2TDLjHi597fAHqBBXLK
         LFrpsDJ6PiLLbKa+0FKHKnLtgW/5Emgz9RbuEwvhQYzU8pw48nyOCrbAPsnOHPWgzJnB
         zhPjr1ClALbi3rN3aHgllaGGLA0ESDNUG3XQK1O5aZVj4quQJeSiprErBTK9lDV2SjZh
         DebQ==
X-Gm-Message-State: AOJu0YyR9Ijkt5lXpL492PVbtAFJTxdlL+manFVYq2d48z1W+98h5cgW
	8EkWauEPRmf7OIdU6b8z+mLa4QSsL41ZhZdD9HucgA==
X-Google-Smtp-Source: AGHT+IGinbhvJoU88aQQjasTSLV+Y2lXUaOF5CUtbTWYp38t7mn2+AmInCx+plwpGdp9knzUCPOqog==
X-Received: by 2002:a05:6a00:9a7:b0:6d7:affe:100d with SMTP id u39-20020a056a0009a700b006d7affe100dmr3479836pfg.13.1703038701129;
        Tue, 19 Dec 2023 18:18:21 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d6-20020aa78146000000b006d945660076sm367103pfn.59.2023.12.19.18.18.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 18:18:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 8/9] binutils: stable 2.41 branch updates
Date: Tue, 19 Dec 2023 16:17:58 -1000
Message-Id: <8408a44331a0c9e5ea86d822cebec06dcf495694.1703038443.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703038443.git.steve@sakoman.com>
References: <cover.1703038443.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 02:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192767

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

Below commits on binutils-2.41 stable branch are updated.
eb49941e7e1 Gold/MIPS: Add targ_extra_size=64 for mips32 triples
c27eff41737 Gold/MIPS: Use EM_MIPS instead of EM_MIPS_RS3_LE for little endian
7fe76f02413 x86-64: fix suffix-less PUSH of symbol address

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.41.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.41.inc b/meta/recipes-devtools/binutils/binutils-2.41.inc
index b4934c02a8..d4b239258d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.41.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.41.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_41-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "cb4c3555ac4cf8aaf0935cb6e4b09e6882436d21"
+SRCREV ?= "e13f70c7fcb2f4a39ddad4ccb83660dbfee2caeb"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.34.1


