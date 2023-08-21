Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0042BEE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 13:30:24 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.11025.1692624616975400279
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 06:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=dfKfV2YO;
 spf=pass (domain: snapchat.com, ip: 209.85.208.50, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-529fb04a234so2368671a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 06:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1692624615; x=1693229415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FX9CMHTJScnkgn4FEbU2fYeUYTpZs/yfSbeVE6bQ1Ls=;
        b=dfKfV2YOregu6DF6TeYYSuUyZ66JKYV5aTYUdh/KjmT770nQdZmDOVKnnDrJuYNrPm
         EEINIIqCOVLeEC3jI6TYWa+1p/xG0VOvHlcO32oVoria49EScvp38CjwwdQ01+GWldrO
         7kO1Kdbg1kjjzrvE7gq0JG+tE82GFV4mS8j/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692624615; x=1693229415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FX9CMHTJScnkgn4FEbU2fYeUYTpZs/yfSbeVE6bQ1Ls=;
        b=co/L2q/3Kin7uW9eEr8eJr53MDLbovFFfyDNiCkrc024NT9QoFDCLXovIVveZRtjdN
         IG/0Smg1WvR06HG3GvYLbWPt6Hf00V+4asUaQac9ERskjRv8km2RgxhdiSYSmK/uvbxQ
         74ka1pAYno6EazrAa08gXP09pFUEgcmTcU6eBCUxeZd9T8E9yYBS3GS3ASEaqeNZKWPv
         yTKaFm61EJu5cqFbX1a+AMaLWUxc/WDFbsDhLmTShspe4cbtdkCLzf95LLceBCSLIAHO
         E8yfBfATS6y3yToFR/EhKcOXlbqb27FTDPEncFJcm5ntGaBDjuEatVMtuJS0qsu0d+As
         M9uA==
X-Gm-Message-State: AOJu0YyR5IrE0hTFXLMPWWxcQoQ85AAzSlM6SbiUXPzIHEFi/3mVFHdD
	SfI7Z3b272MzFpdupBReSp8+jSmTfK6VSsDoWrnEDA==
X-Google-Smtp-Source: AGHT+IH+nWI9OjZ20UIx8TwltN06xy9qufWHCtACtI5FAjbSTQmRGGOWD4hVQ4tZedJk42jVdt2QMA==
X-Received: by 2002:aa7:d742:0:b0:525:4f9c:3505 with SMTP id a2-20020aa7d742000000b005254f9c3505mr5245580eds.29.1692624615147;
        Mon, 21 Aug 2023 06:30:15 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id r2-20020a056402034200b005257da6be23sm5984145edw.75.2023.08.21.06.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 06:30:14 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [meta-oe][PATCH v2] vim: update obsolete comment
Date: Mon, 21 Aug 2023 15:30:07 +0200
Message-Id: <20230821133007.219099-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 13:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186440

From: Etienne Cordonnier <ecordonnier@snap.com>

vim 8.3 has been out for a long time, so this comment is obsolete.
However we still need UPSTREAM_VERSION_UNKNOWN, since we ignore
the last digit of the upstream version number.

Test result:
$ devtool check-upgrade-status vim
  ...
  INFO: vim                       9.0.1592        UNKNOWN         Tom Rini <trini@konsulko.com> c0370529c027abc5b1698d53fcfb8c02a0c515da

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-support/vim/vim.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 33ae0d8079..83ab9ea5de 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -22,11 +22,10 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
 PV .= ".1592"
 SRCREV = "29b4c513b11deb37f0e0538df53d195f602fa42c"
 
-# Remove when 8.3 is out
-UPSTREAM_VERSION_UNKNOWN = "1"
-
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
+# Ignore that the upstream version .z in x.y.z is always newer
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
-- 
2.36.1.vfs.0.0


