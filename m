Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4B2C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 07:18:06 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.16652.1666595881264002968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 00:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eQGsaGTz;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: yashinde145@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso3141898pjg.5
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 00:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n3/7A41/TkRnrttfSMpTerBXMCZJOAUzrBJybOv56do=;
        b=eQGsaGTzidvU23mtoSrtDW0kK6ftrkD7gNL/mUK9q4RPzbjiDbVdfOXQXxrctLl+ZE
         PzZsBXrN0O312wXlqcVwuQNcguyCavDLi5ALYyB0etxq2L50kAK+b6rhx6w8aePXI3zK
         pR6lEzgY+DjxeI5laTTyVrfKJfPARotUbe2mxdosW2DlslElBkVLYlJeFwbelT6B6gsY
         tn3APXcPlDmLvjwHOkynnMLakRPcsZDphvuzQLd6rBnStPtLNFynnpMKS0wqEV1uzlHV
         hv2iyVP5COiywJqpxJcfgEbhGcTtOhoA0u6UBBHeJukifB/VuExTX799UdQHH0nNOabb
         DhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3/7A41/TkRnrttfSMpTerBXMCZJOAUzrBJybOv56do=;
        b=MHN2kmUZkb1nEfpPodR/MLOMKrbZFA2vJx0vhj2sJ4qcLU3fCIl3IXQ/iqDhj5xk6q
         uiSyf0wYE1UnVI0X+DMKa+AOQJVFlb8GO5dMjL12X6qx3VFKIrfXXxRYwrRzZ4UqJ0Nm
         vewd7Z3QDslTEWT3mCjA39bYDEGAmFI0ksmvz8Zl+VZqk8f3k+99djM2TkNHxJSDHlCf
         N9CpqhaMGKEy4qTQC5B68EK9m+EWR/KEBq35EHlRq+6dnbP5IlLWbtXGnbrt0AFa1ccc
         kyMBSntQB+Cy3GXqouq7DifyZ5zd+SWMgWCM5XpynmR/fwLXQKLMXnokyQM4HvPaWgIE
         IAEA==
X-Gm-Message-State: ACrzQf0KA9uIebGwKR/aQPyp9nYWqqK+smMgCswlPv3U4bC0egXYonCm
	32kom4iDaLi+anvKd0r8qLvk3CsxswWuaQ==
X-Google-Smtp-Source: AMsMyM5yKdtEv2MBjc41INIGZOxit6xw+oKafPDVijAfYZUT5eKEnDED7PX0/UJNFikqd0JCtHIWuA==
X-Received: by 2002:a17:902:e5c7:b0:186:a076:361d with SMTP id u7-20020a170902e5c700b00186a076361dmr5550229plf.9.1666595880558;
        Mon, 24 Oct 2022 00:18:00 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id jc11-20020a17090325cb00b00174f61a7d09sm8288903plb.247.2022.10.24.00.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 00:18:00 -0700 (PDT)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com,
	Yash Shinde <yashinde145@gmail.com>
Subject: [kirkstone] binutils: stable 2.38 branch updates
Date: Mon, 24 Oct 2022 12:47:47 +0530
Message-Id: <20221024071747.1998470-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 07:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172074

Below commits on binutils-2.38 stable branch are updated.
dc2474e7d20 (HEAD -> binutils-2_38-branch, origin/binutils-2_38-branch) elf: Reset alignment for each PT_LOAD segment
f184ba116ed Re: PowerPC64 pcrel got relocs against local symbols
737e29d05eb PowerPC64 pcrel got relocs against local symbols

Signed-off-by: Yash Shinde <yashinde145@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index fc88d4a79e..acb2de04f9 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "5c0b4ee406035917d0e50aa138194fab57ae6bf8"
+SRCREV ?= "dc2474e7d204c124ab5a21b4490aa46eb7e1d4c3"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.25.1


