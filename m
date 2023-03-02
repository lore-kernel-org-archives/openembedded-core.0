Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23606C6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 21:48:02 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.7607.1677793677248493888
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 13:47:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kS8cT+RG;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id v16so555983wrn.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 13:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677793675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k3ElsT69Zq0bRIFE8gk+FUOqhG42xVAo1Fo17FMPmmA=;
        b=kS8cT+RGi3nQrqQKj/ncJM8jTjnVn5su8Z937Y8i3zajk73/sh/E6ZLVym6uK7JXEl
         VAgM0r0zfIpFF244p1WwganU2tTxqRE1W/lTYv7YpALd5WGGjKB1zgZJC4x5xg9Ev0BU
         53V8aKmIV0DckcKKSilI6BYN59paE2Y6VZgfbJTrneSzQbk4AoaRNmWwQX2ifmqBxefQ
         yGNOMP8tsOK0m8yyCXeYu++o8mAa4QOMP+B062PjTv97R8Y2n9WAUzYWg45rfAPsL57z
         rthzl9gDzpI+Dm2NzixLBXUnHirI2XO3JgAnV9lGK8ijvJ+iWsswknAMbm8zQSJCfKTU
         8Upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677793675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3ElsT69Zq0bRIFE8gk+FUOqhG42xVAo1Fo17FMPmmA=;
        b=ABYvhqkdC21jMN82GHxEwhftkXpMhLfvWOkeIIo+wdP32/Ga0KwuJD0DS6x/l4ROdT
         muQKAF5N3H0qug+btTMpkaTls7giM4EVimmkcn5duvx5yo5ZC8nAEGsqIc5PMP259haS
         KGp7yGXYMWxuRJQ+ZMbnxabmV+rrFZFukZDxBCNwEMayxuHg6h9FG7b0mvT+bvOeztHg
         Mj2mBVId24JjxU9ELCN37YaG3xRUhbPaN1GyCbyTy8mgcwe0IK27TOTNzJCe0xKGf5AQ
         UHeIZFVnDQ1SHgyQm4Bcs37RJ26w1FhiysUddsfCrdTZT+pwka54Q9mfSI1ghu4+aDzd
         vcwQ==
X-Gm-Message-State: AO0yUKVXTw7dS7KOrMTcVOwmiy9QyIUuUzVQaoEeJJ4+kcRFjHqjtgxQ
	Bi5pxIRxBp8cu36G/BOASwPX9FwodIY=
X-Google-Smtp-Source: AK7set+3NLvZHEeEB3xMKDk4Cvte3aX+2/xopi/mMGZwHIz1Ph/uUZWnP+hv+RM2v68jj7OwSORiPw==
X-Received: by 2002:a5d:5387:0:b0:2c7:cc8:782e with SMTP id d7-20020a5d5387000000b002c70cc8782emr2545888wrv.33.1677793675411;
        Thu, 02 Mar 2023 13:47:55 -0800 (PST)
Received: from localhost.localdomain ([63.135.72.41])
        by smtp.gmail.com with ESMTPSA id f2-20020adfdb42000000b002c54fb024b2sm402733wrj.61.2023.03.02.13.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 13:47:55 -0800 (PST)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] libgit2: update license information
Date: Thu,  2 Mar 2023 21:47:44 +0000
Message-Id: <20230302214744.1041422-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 21:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177968

The LICENSE did not have complete information.
Some examples of missing license:

Zlib: deps/zlib/
ISC: tests/clar/clar.c
LGPL-2.1-or-later: src/libgit2/xdiff/xdiffi.c
CC0-1.0: src/util/rand.c

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 meta/recipes-support/libgit2/libgit2_1.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgit2/libgit2_1.5.1.bb b/meta/recipes-support/libgit2/libgit2_1.5.1.bb
index 59866ce385..eb7b538ece 100644
--- a/meta/recipes-support/libgit2/libgit2_1.5.1.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.5.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "the Git linkable library"
 HOMEPAGE = "http://libgit2.github.com/"
-LICENSE = "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause"
+LICENSE = "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause & Zlib & ISC & LGPL-2.1-or-later & CC0-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=112e6bb421dea73cd41de09e777f2d2c"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
-- 
2.30.2


