Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC04C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 09:34:50 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.38802.1669887286150702016
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 01:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ia6kZtUD;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: yashinde145@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so1434295pjm.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 01:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oMuSoqNOph0Q6r+CtokMN0AP13xYgn+aSUV01lCgOC8=;
        b=Ia6kZtUD6CaUl1L5P3EqItNVTT/+WBNN1pKZwqprvBWGxkhUCJ83V2s1vNjrO98fk9
         ECnBA7skqnYUgrmcZcV2QLsZ21+dFZIzKeAcLdIJI8ROkH5sCq1pDWdkypARHMQtPPDY
         Imp7mNQstxjBPnGz97UIwzUhaX2dOVX6d7Kz/vsxlcpjEJ4lpu9xW3vVnBoVhZ6GPydM
         yucBfwjhvw/riidFCXBFHDKGCEX6LooQDI6goKcPeRLLdPZZMkkj9ooA5wOmfqa3DM4G
         SCLYJ51DOucyLgkErlaxi7Ca8sNXRRFRLCBIzQMgBbDfCJrvM7R3ZzueI9+0wBLhrtUV
         8O3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMuSoqNOph0Q6r+CtokMN0AP13xYgn+aSUV01lCgOC8=;
        b=sa+SBKZqYXcGv+aXhYtQ5F2lbHHHYxtXkEsTmExRNdPYfBDYaKL/eFecx4y4/JRKr+
         pEeiZgP2pEvqATqt0GnnY7x6SxE8Fy5gGZepAaWGjs1kkF/kP2cdVmyJCykPkFnJLJji
         HyXoke607WPybVsSsrc3ctMVPQCK3ZSdXqR3nIFwq02L8w89Kxu/g9mLni+29CxHmWB3
         D01XTppCkw525tugxKwjK8FsYVyKTB2oAOSJBaResVaq4hEif4tD+B2wk8ZEc/fG0fE3
         FZR3yNdF4R2rsoCorbDeVkrBVNsT+Hxbjk5g1/JlbVgfQlxXEcRJzixdnkNYm+FyobTZ
         SrRQ==
X-Gm-Message-State: ANoB5pnI3jR1lx2L+QOOibc9SDLekxIexaOHTupLDAOnZVJ+unVSk3Cg
	9YdfgNZvmmAXIcStgSOdeXQ1qhphYD4=
X-Google-Smtp-Source: AA0mqf7FJZmLqzDLvIid4I8byONdY1YIrIYMK7HoMfCZWHn6H9asvtIvipOXgxUXtYLKNj2oSi2NSQ==
X-Received: by 2002:a17:90a:73c2:b0:200:a7b4:6511 with SMTP id n2-20020a17090a73c200b00200a7b46511mr67481595pjk.101.1669887285353;
        Thu, 01 Dec 2022 01:34:45 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id s3-20020a625e03000000b0056bf29c9ba3sm2869089pfb.146.2022.12.01.01.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 01:34:44 -0800 (PST)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	sundeep.kokkonda@gmail.com,
	shivams@gmail.com,
	Yash Shinde <yashinde145@gmail.com>
Subject: [kirkstone] glibc: stable 2.35 branch updates.
Date: Thu,  1 Dec 2022 15:04:29 +0530
Message-Id: <20221201093429.2216830-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 09:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174045

Below commits on glibc-2.35 stable branch are updated.

8263cbfc11 Linux: Support __IPC_64 in sysvctl *ctl command arguments (bug 29771)
f6d4c1ac64 mktime: improve heuristic for ca-1986 Indiana DST
ef82619da2 Makerules: fix MAKEFLAGS assignment for upcoming make-4.4 [BZ# 29564]
cbfe89a675 linux: Fix fstatat on MIPSn64 (BZ #29730)
3362566e84 linux: Fix generic struct_stat for 64 bit time (BZ# 29657)

Signed-off-by: Yash Shinde <yashinde145@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 7d7db46c2f..60509174fe 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "8d125a1f9145ad90c94e438858d6b5b7578686f2"
+SRCREV_glibc ?= "8263cbfc1155f2ed5ee304bd7ff7fc6ad44c6152"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.25.1


