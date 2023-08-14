Return-Path: <sanjanasanju1608@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42502C04A6A
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 11:51:13 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.105695.1692013863124620194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 04:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=E0y0XAQF;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: sanjanasanju1608@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-790ba9cf42aso157736439f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 04:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692013862; x=1692618662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rwJ52cmoYF2HLJ/yQcf7UzR7lxcj4SEs0AnxdpcIr2g=;
        b=E0y0XAQF0GUN7NaYrTr8tPNZ+n7+CIz4+ryMbAS3HqK6uIuMzsgJ5AG0mB6tQrvzlt
         vWOFkwJ0QACojrWYn3pDJ86nMPWiitkjVRwJuYAHYZk14EJevAkeShSSoj0RYRC9TScE
         4yPsCgSTz0GnvvMyn6bk/ezvYz0JQ9ETz+vakwJq59wCAAdgSMMjgsbgxYrmnx5oj4xK
         vW7469kBRVJyygFazX3aSfv2IRxEv48AxUQW4V1ksuUKhlkgISQVH8m3rZVHMvAMIUXY
         ps7/VGOyDNd+oXkrXLAFs85357Mhucza5drF1n5wK18IiR9nmjDIiDQMPx3G+yMhS+oP
         QABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692013862; x=1692618662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwJ52cmoYF2HLJ/yQcf7UzR7lxcj4SEs0AnxdpcIr2g=;
        b=QDEN0+F4NE6mFUhkPixnPvBl/jZR9x6pKaTKquruSmp9ofV0woVOej9o+4KS11x6qs
         P/L6RqnPnTkfLzHPmqE1XhifQGcwCc0pcwM0KOFYHej3wYjDap0hLUOUOly/GWfKtK5l
         NjPuzdW4w90sUuwt2hXw1MSHhuYhM34W9/PVOf05ohv5sYj+7DbOwrQNcG/a1y6yZV44
         QeMDkLbl7dFQEyE4seusiAe1kxt9GsQHbIq+fnCVGzHFpK4cvQRug6Y7WOkS40aAckIu
         RIL/0RERPSwhKDLH2DrnPh8CKexFP1kyGlHyQXo67U+v+B0S7svIauN1LOLBdsRMHAPF
         fubQ==
X-Gm-Message-State: AOJu0YyvF0SvQy0L1waJmLTSYA7sWxj5cX0O2jMWAHP5bdKiloUR3LPk
	KfA4UvTLafm9KcfnrGYlMW12QYao4qKdrhPr
X-Google-Smtp-Source: AGHT+IHVKrlMhmL/UpDOGa3ujtaQkBSwuH16g70PQdgdwlJ6eykadPkxdL1hDs4V3cLFWx0iJ6ID5Q==
X-Received: by 2002:a05:6e02:b2f:b0:348:f9e7:7dc3 with SMTP id e15-20020a056e020b2f00b00348f9e77dc3mr13627612ilu.19.1692013861999;
        Mon, 14 Aug 2023 04:51:01 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id m24-20020a637d58000000b0056393a1d83asm8277506pgn.19.2023.08.14.04.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 04:51:01 -0700 (PDT)
From: sanjana <sanjanasanju1608@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com
Subject: [mickledore][PATCH] binutils: stable 2.40 branch updates
Date: Mon, 14 Aug 2023 17:20:51 +0530
Message-Id: <20230814115051.3980959-1-sanjanasanju1608@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 11:51:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185933

Below commits on binutils-2.40 stable branch are updated.

391fd4d9ee5 PR30697, ppc32 mix of local-dynamic and global-dynamic TLS
7ad52a2357f [GOLD] powerpc DT_RELACOUNT
03f49a0619c PR30536, ppc64el gold linker produces unusable clang-16 binary

Signed-off-by: sanjana <sanjanasanju1608@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.40.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/recipes-devtools/binutils/binutils-2.40.inc
index fb99d93b26..33e7f4198d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.40.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.40.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_40-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "7343182dd163d14b7e17c255515940dff67f2bbd"
+SRCREV ?= "391fd4d9ee5d2b78244cbcd57fc405738359b70b"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.34.1


