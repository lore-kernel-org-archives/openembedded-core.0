Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC9DC48BF6
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 16:58:13 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.21682.1708275487484330685
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 08:58:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZY6bF82R;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-365220a2c3dso4770985ab.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 08:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708275486; x=1708880286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EFME92mCB96gRKojzYyIzM6CNBOPhLiH6XMy4kkzboY=;
        b=ZY6bF82RUOcKkOr88pOI8ZYQEcOKhTDEg36/KbGnr+klsqwUx4PYwA/wCf0IcDo2gQ
         1fMzkPlX7Df41qgz/Za+2ISQPBZu8ZeCfgS95XWhoYLVnYwUee/VCxNC4tsNWQLDk0Zf
         1o6vC5dfrSSWyMA9VPYQ7AkPENbRfQEvq4GsrjV1CvO0VvL0S2uxqoWIqvdWrGd2L3oH
         AMcPvjCXHUbCY3srSJD3jG7dOSe4tSk2Br0Pr/9ygVyfhrT+pjspmCdk8gPhvoHfO666
         GiZCuBNCKr19ou0yu+dg7TcGVsVICY1glvewlLIuY+YSjHoy8vP5OTJ1WVv0jLqxlOO/
         hZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708275486; x=1708880286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EFME92mCB96gRKojzYyIzM6CNBOPhLiH6XMy4kkzboY=;
        b=g8cCSp7Ej6W7+7xN2HKRvno7n6YV54uXMzcAq0Gve39TIQ7yauLPyJxVxZzRQFImOl
         CFe9QoYlLmrwHuRer03XvTUYD57Xd+yMQVgONkGgvFCDh/tdGba1cevONXDWxR5YubCj
         czuckIjy/jM65Hcc9EAj6X0MpyBbtLk92qp/3607oyCg06ll6Njxg7Halyn+WFQJpeme
         9fjhhqG2rbLfTtdYHMkqarTYkyqYEdZq2CC1/PIyYwA7CIOo68+mlqf3ykukeYmcrq6l
         La5tEwZJwJquC6YpVm8WD2FdCcCX4fDVVgpPLZEJzFH6vjZ+uCfuIwBfbL4jPIYA6Dgc
         bnDw==
X-Gm-Message-State: AOJu0YwRhPRLEoVqrqIfemndwl/cCrXc0q5aOjeeWPXXMaNOHkrt0UwK
	W3/kGhdkzbXyMux8CqtKePVyzRt/Mql+YwX01wpmn/+1SEfqqKfwhJL1dbPx
X-Google-Smtp-Source: AGHT+IE5W6dLIi57gLWTE77zgzzLjjln56XBgj5sUOnes5niqT4knl882um+r5ygyi+RJ6UtKgXIYg==
X-Received: by 2002:a92:d78b:0:b0:363:e573:da77 with SMTP id d11-20020a92d78b000000b00363e573da77mr8367323iln.18.1708275486384;
        Sun, 18 Feb 2024 08:58:06 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:b5ac:91fa:12f2:46aa])
        by smtp.gmail.com with ESMTPSA id p11-20020a63fe0b000000b005c6617b52e6sm3199820pgh.5.2024.02.18.08.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 08:58:05 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] vim: upgrade from 9.0.2130 -> 9.1.0114
Date: Sun, 18 Feb 2024 08:57:38 -0800
Message-Id: <20240218165738.269220-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 16:58:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195838

https://www.vim.org/vim-9.1-released.php

Vim 9.1 is available

The Vim project is happy to announce that Vim 9.1 has finally been released.
This release is dedicated to Bram Moolenaar, Vim's lead developer for more
than 30 years, who passed away half a year ago. The Vim project wouldn't
exist without his work!

Vim 9.1 is mainly a bug fix release, it contains hundreds of bug fixes, a
few new features and there are many minor improvements.

Changes:
https://github.com/vim/vim/compare/v9.0.2130...v9.1.0114

CVE: CVE-2024-22667
(includes commit https://github.com/vim/vim/commit/b39b240c386a5a29241415541f1c99e2e6b8ce47)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
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
index 6b440d89472..071deed338b 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2130"
-SRCREV = "075ad7047457debfeef13442c01e74088b461092"
+PV .= ".0114"
+SRCREV = "fcaed6a70faf73bff3e5405ada556d726024f866"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
diff --git a/meta/recipes-support/vim/vim_9.0.bb b/meta/recipes-support/vim/vim_9.1.bb
similarity index 100%
rename from meta/recipes-support/vim/vim_9.0.bb
rename to meta/recipes-support/vim/vim_9.1.bb
-- 
2.34.1


