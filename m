Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D24C5320E
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 06:22:40 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.72270.1724739756471984477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 23:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=X0mRxCNU;
 spf=pass (domain: mvista.com, ip: 209.85.215.174, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7cb3db0932cso3709278a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 23:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1724739756; x=1725344556; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0SjoEtz6HqdtHnTR9Q0AIRtEOhK8M6LRc3c8Dn2B0dg=;
        b=X0mRxCNUoSUjoR8/iJzsRIIdf1OAuMzPi8I4xLjGjw+0P7zkjCoSnwKp6locZ+TqNk
         ObL1DqzydttgJJwvU7nWe4dvGLXCIV6CMv5bM59AlV03epinSRovYUXOCt6fv3WUxQ0G
         3A5xqJ9QQltMpmw2yP05EGnw49a9Hbn8ckCVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724739756; x=1725344556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SjoEtz6HqdtHnTR9Q0AIRtEOhK8M6LRc3c8Dn2B0dg=;
        b=tdOP2GrpfsytfrMGrUVp1MlllHf/wYdjNGt8jYN/D0x6UvqFVOV0pFkeDeY/zDjG8x
         DKXBlM44JDCZ4InLdiRR8XK+nr5WB06MigV30OLDyumfrCMNr+AaljnUDXwoymUFbdEu
         drITIK3pFtphzUzLpNJdfWcNs9jKXZYeg638ub0J05kpDej+Eq11DcejpwiFADjXwlNd
         NSdk3eLGSIot5hz//vNe9FCWL2frx7FOuwAjilkJtz98aUW9Y3RoYqnHgeB3UGQICZmI
         QdvNQJYZkd6bJSADo9k59y/yivJpIOqpxCCVeNOiOmbcJTU+IAF2IE7ZLyaXy5vYVLjL
         gCvQ==
X-Gm-Message-State: AOJu0Yx1lrlYpK9UOKt4duyTrH6T4ZTD8xQTD2h1YEVEoSoV6HTfiw7w
	r3aaZsiR3FAY0g815fRQuwNXaub2xRT7MA79I2ABOcm/kLYVmRMvz/V2NxICRlkV0mxi8Xtohev
	CdhQ=
X-Google-Smtp-Source: AGHT+IEwuQLCKl9aQKFXLmdymUoVujO9LMSaQx9894UvYs6dOqOVyfF/BRZC6+2sgI7O2aelUqzL+Q==
X-Received: by 2002:a05:6300:42:b0:1c3:a63a:cf04 with SMTP id adf61e73a8af0-1cc89d4dccemr14739061637.20.1724739755675;
        Mon, 26 Aug 2024 23:22:35 -0700 (PDT)
Received: from MVIN00016.mvista.com ([43.249.234.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613af145dsm11051445a91.38.2024.08.26.23.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 23:22:35 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] vim: upgrade from 9.0.2190 -> 9.1.0114
Date: Tue, 27 Aug 2024 11:52:22 +0530
Message-Id: <20240827062222.20112-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 06:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203814

https://www.vim.org/vim-9.1-released.php

Vim 9.1 is available

The Vim project is happy to announce that Vim 9.1 has finally been released.
This release is dedicated to Bram Moolenaar, Vim's lead developer for more
than 30 years, who passed away half a year ago. The Vim project wouldn't
exist without his work!

Vim 9.1 is mainly a bug fix release, it contains hundreds of bug fixes, a
few new features and there are many minor improvements.

Changes:
https://github.com/vim/vim/compare/v9.0.2190...v9.1.0114

CVE: CVE-2024-22667
(includes commit https://github.com/vim/vim/commit/b39b240c386a5a29241415541f1c99e2e6b8ce47)

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-support/vim/{vim-tiny_9.0.bb => vim-tiny_9.1.bb} | 0
 meta/recipes-support/vim/vim.inc                              | 4 ++--
 meta/recipes-support/vim/{vim_9.0.bb => vim_9.1.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/vim/{vim-tiny_9.0.bb => vim-tiny_9.1.bb} (100%)
 rename meta/recipes-support/vim/{vim_9.0.bb => vim_9.1.bb} (100%)

diff --git a/meta/recipes-support/vim/vim-tiny_9.0.bb b/meta/recipes-support/vim/vim-tiny_9.1.bb
similarity index 100%
rename from meta/recipes-support/vim/vim-tiny_9.0.bb
rename to meta/recipes-support/vim/vim-tiny_9.1.bb
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 906aa53a16..071deed338 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2190"
-SRCREV = "6a950da86d7a6eb09d5ebeab17657986420d07ac"
+PV .= ".0114"
+SRCREV = "fcaed6a70faf73bff3e5405ada556d726024f866"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
diff --git a/meta/recipes-support/vim/vim_9.0.bb b/meta/recipes-support/vim/vim_9.1.bb
similarity index 100%
rename from meta/recipes-support/vim/vim_9.0.bb
rename to meta/recipes-support/vim/vim_9.1.bb
-- 
2.25.1


