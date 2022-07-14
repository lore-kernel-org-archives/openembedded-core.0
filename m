Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646A5CCA47B
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:49 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.4069.1657773399892023167
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=LQt8aqBL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id g4so512487pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ovv4cZ1RtfzSAHpMY2ImYZb8uw0c3iz6h9FV+aOBfMc=;
        b=LQt8aqBLEuJ4xsPvwwRD0FEZPzwcQVoYutD//OJHWHVD5QQzPiYpUuhrWbdsR6bjiJ
         TWoZfKapkUj4OFa188azE1h48Hr82bEYoxqiEYEBQ14knyTMdreHKfE5cnYRwvV3cZBv
         GOwlwyrQc/oRlMUsOUkbVZHBhJ6+SC0fvwcf0dIVSnemxRUrBO1sEvzSXHzvqNgwKuuJ
         rCzncVMdKCyIpL3Z3gpHm/YEwhroX/cyR4BQ+jG3T79Zr66bgoK2OihHfuodwvvXzh36
         da9i4/88RAUa4LmrUSsqLnBbuKQ7VvDd7WhviEx9Bt2KP7k28M+Dsn5zwxaW+McPKG+k
         Qa8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ovv4cZ1RtfzSAHpMY2ImYZb8uw0c3iz6h9FV+aOBfMc=;
        b=pYDJyIXrzQN2r4u3G2E4/YBs6A9qCljCNUfY5ZrDr17oStUs9pRJERjQbDFIhsLUIV
         da5TXGUcnF4dNZxDkZUuB88UIH1Poxj7DLx2LeFbTAzpUs9ikzMBIAFKxiLkiQTJ8BGe
         60iVoEFS2q/92ErygwhxBffiP/EgJY6fpw0eRLEHg5ki5UpX7ei0u5APNtuiOC4puzDe
         Klirv44SM+8iv5uA6o4jwSsXF4n58mE12P4uMpapoRIZX2D3/LBadledZM89pxuRU640
         T1E3Gia/8bSgmK+E2v7nliH/RWTFV5xAFDyBRQsanosGiUDZ+00gjnZ/dzv9k1wKejZO
         TjbQ==
X-Gm-Message-State: AJIora8iueo3p3Do8CSHkzC/RyR8/dza/dpu/407CTg88jazLtnKheY7
	LCA5VwOZwWztMweaQ3A+s9mRoUwR+0KrDY5o
X-Google-Smtp-Source: 
 AGRyM1sWwdw2xdiq9c2ILVTvcoEdKol08WGOOr21zJy6kImJ1A9C4l1K7bUGGBDqOMR74aiEA3dN2A==
X-Received: by 2002:a65:6a0e:0:b0:405:2310:22d0 with SMTP id
 m14-20020a656a0e000000b00405231022d0mr6099270pgu.290.1657773398836;
        Wed, 13 Jul 2022 21:36:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/27] binutils : stable 2.38 branch updates
Date: Wed, 13 Jul 2022 18:35:32 -1000
Message-Id: 
 <2023e334efa325bcd08b7bcc92455afdbf4e66d7.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168009

From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>

Below commits on Binutils-2.38 development branch are updated.

binutils:
e1ea1dafff6 x86: Properly handle IFUNC function pointer reference
ffc7aa903b9 AArch64: Enable FP16 by default for Armv9-A.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index a069071c97..742ca86379 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "134f17ef688ba4c72a6c4e57af7382882cc1a705"
+SRCREV ?= "eed56ee299b9ef8754bb4e53f2e9cf2a7c28c04d"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.25.1


