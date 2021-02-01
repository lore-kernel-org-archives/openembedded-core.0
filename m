Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web12.36683.1612196824834088781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:27:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pu2hvqUe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id h14so16861614otr.4
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8FnFy7Ut2pV1WRKoSq0qnAd/sMov54FsbsoBPf8TWos=;
        b=pu2hvqUe3o46F0biqlMJJT8i49boxoTeEucRoF3ljfaxsq0LBAXQygGeji2VmVO7aw
         Pm9aJOEe38vB3qAk/Baf9Sev+ref8FnvA14xf41U6tauLVK2nI1GhzN7chmHHyUZtxUy
         Wbmyb9APb/ljWtZtuob+kDv3wTgDU8giv58vcIjKKmglSdYI82vCH2n3cyPaqzALR5OH
         J0Fvr+msEneCL0zZhKuH6CeplVySrNuFtm3WpmKO2iVXs2Wk8/AufFTKXBwJSGnA4EI/
         bo3oXfQeTPMKnbfX80qsI4BgMA7BNEUkQ/PSOxz23br3Q8C9APFqUMr27B9WN7ZWuVLd
         P4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8FnFy7Ut2pV1WRKoSq0qnAd/sMov54FsbsoBPf8TWos=;
        b=QkGRVTmShuHKFElgtf/SEvr6uHFIeptQFZR1WbAfQChx3IBJx/ams746fv2Ll91hcq
         E2a0YiOjSxOzly6eAMVSxmvw2CmuJJxGcFqr6DGibMoS+E0Gfrwp2Lobhvg7YE6bv8CX
         zCkUe6UjTAQQNmBZ8+oSgZjW7d2p6weMDTyPhUgwhajPkT+6KEivNR37Fcg8w9f8fZGr
         gvIPcoKvqVI1aFP/rDJLoXSJHipyYjnjChWFFMlWfz+6KPpLKy92ONK4b/m1edRhiUZs
         H0Gkdb1MJeoX5jpRUyr1Cw8BSaPv5+30tJgQmWjbBkz6/eIhvFhPZIpetQtWC0zUgiir
         KlMg==
X-Gm-Message-State: AOAM5331Vnzle4JJkTH+QAMU8QTBFUpIZJglBkU0vmZ0JuSShrP3/sks
	jTQMEN4PT5kqJdcP23+QdNR/Sx+teVFgAy8rXm0=
X-Google-Smtp-Source: ABdhPJzp68ymq+DgLVzekbJN4SIp5gtF8iW9BhzuhxiU+bD5C63xRwMAv0xePpyfsuRuf/5LpcYxwg==
X-Received: by 2002:a05:6830:4006:: with SMTP id h6mr11854014ots.33.1612196823693;
        Mon, 01 Feb 2021 08:27:03 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.27.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:27:03 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/21] strace: increase ptest timeout duration 120->240s
Date: Mon,  1 Feb 2021 06:24:48 -1000
Message-Id: <09ba626c1e7c0196b17fb2239f3b3caf5c8d84db.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yi Fan Yu <yifan.yu@windriver.com>

solve qual_fault-syscall.test and qual_fault.test
failing due to timeout.

Bug 14165

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5af9f32d9b12654793289f44366251f978f6378a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/strace/strace/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes-devtools/strace/strace/run-ptest
index 4660207220..3a51fb0be9 100755
--- a/meta/recipes-devtools/strace/strace/run-ptest
+++ b/meta/recipes-devtools/strace/strace/run-ptest
@@ -1,5 +1,5 @@
 #!/bin/sh
-export TIMEOUT_DURATION=120
+export TIMEOUT_DURATION=240
 chown nobody tests
 chown nobody tests/*
 chown nobody ../ptest
-- 
2.25.1

