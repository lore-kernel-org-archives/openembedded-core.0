Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E397E7D0BC
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 01:15:30 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.12250.1695345323731908689
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 18:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aeNb6fO0;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68fb85afef4so1531454b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 18:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695345323; x=1695950123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xe+p362qO26QRo2gy7lA0ErHt03P5WlQ7gM0Hjl5lJA=;
        b=aeNb6fO0/vwsHKfKafNfb7BT+elacmudMcsAZThKN1ZqVd63v/0EPrc8aAM4oPkU1v
         mwQWV6oNxEKhGY4FywofBESJOMahrfA5bpYExZ2D4/OClIwI+Uixwsq0zHBKIaDp85eh
         Xh6QafrdcQHDh7lJAXZwuWtn0qP6opkOzlH7V7CZLTVgU682Y6wdq8n9GoDpdkQYY8f9
         TkTCMsrWhF4CeJBwuXNZg+oXvJnsGlR862QwCFj/CJP/VAscVZBsOxN/DQy6850sz0Kp
         h7/KLEgZiUCYJ2NkfOHTlBqds8Gl6Yy+KQsYPHYihI8Qhyc6cr2FwSp+wfHaaOJVVki3
         qlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695345323; x=1695950123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xe+p362qO26QRo2gy7lA0ErHt03P5WlQ7gM0Hjl5lJA=;
        b=l0RTIOBXByWgwYMSw82jtauX4ysT2UgXDUhOzwlY/DBWK6w2iU5BkX2wYTVlbYr65n
         YgHDU0bTFgHLjcpFzdZzTr5F/C6iBbQHUTI/VVgY1MZ28l8Cub8educWoGaMC6UEoo5i
         5G55Ou1lKTYYX1L3sTY7iPEjIiUUPvCHrRzHUBgMujUk4mUVHZByXugjggXiZ2J/GkiH
         9CwQSbqAhUOB+w+EWigWJqjjIy7sEV6pUUilq4TFsRBW5dTkAX934cewHwUK9smHWuUp
         4TBJcREwt0d7l39e6f/K5h2YQMQj42MpFCR6EVgRZXAMUOBOQYmounaqA5SfOmI7C/nJ
         gPQg==
X-Gm-Message-State: AOJu0Yx99oJRqATtRo2hKi+2xD/tXqjN5i1qiHfglPJJu+0UqFE/8y6k
	VPkvd+v867H4JwlhmVlJEI/IRgupUtCz1Q==
X-Google-Smtp-Source: AGHT+IERR4hL8XTsmcGp8YHT1jyXCO3HrtRIWSTgjJewfFYD1espA6JAosDDtm/RCmyL7tKd6q0o5A==
X-Received: by 2002:a05:6a00:248f:b0:68f:ccea:8e14 with SMTP id c15-20020a056a00248f00b0068fccea8e14mr8364337pfv.32.1695345322776;
        Thu, 21 Sep 2023 18:15:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id i17-20020aa78b51000000b0066a4e561beesm2081788pfd.173.2023.09.21.18.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 18:15:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Drop MIRRORS
Date: Thu, 21 Sep 2023 18:15:20 -0700
Message-ID: <20230922011520.23704-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 01:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188034

When using mirrors fetcher gets into a weird state when shallow clones
are enables.

ERROR: Bitbake Fetcher Error: UnpackError('No up to date source found: clone directory not available or not up to date: /mnt/b/yoe/master/downloads/git2/git.musl-libc.org.git.musl.git; shallow clone not available: /mnt/b/yoe/master/downloads/gitshallow_git.musl-libc.org.git.musl.git_79bdacf-1_master.tar.gz', 'git://git.musl-libc.org/git/musl.git;branch=master;protocol=https')

Anyway the mirrors were added as backup when we had issues with musl git
in past.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index dbc31e1d83b..72253636dc8 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -10,15 +10,11 @@ BASEVER = "1.2.4"
 
 PV = "${BASEVER}+git"
 
-# mirror is at git://github.com/kraj/musl.git
-
-SRC_URI = "git://git.musl-libc.org/git/musl.git;branch=master;protocol=https \
+SRC_URI = "git://git.musl-libc.org/git/musl;branch=master;protocol=https \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
           "
 
-MIRRORS += "git://git.musl-libc.org/git/musl.git git://github.com/kraj/musl.git"
-
 S = "${WORKDIR}/git"
 
 PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
-- 
2.42.0


