Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CD6C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 20:39:52 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.85057.1679603988520126634
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 13:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z3ymHNy2;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso1995754wms.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 13:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679603986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CPjPiBCkJvyzZPEJcO5rglI99GZgOxZlJuf4tGlBWKM=;
        b=Z3ymHNy27vkWPPltuEW0Et+ZDkBZh+9RRrh6W0ccgEKpiZ+6Es52chmbA0VIbxOb4Q
         fULkJZgCFb5yd3F/ngKmqWD8W2bHW4pYNCa0jkl+Cau5rIezMc3jrxLYMefqK0xnPWd2
         gkY7z6Oysvcd9IZgbGXRvyCRC5NQwEeZo8cKytc9YpQSq+sS/fI6Op3G+l4uEi67Jgqo
         m0lp+t8aeKqT1zDYmlJnQ8saG0Tpt9NCct5eSZ09yc2ljGkFGi9zQQmocm39UN6uVylX
         b4BqOzIBMQG7XjpVuFNZpgGGsb4P4z863FtGB6bpBlqSTOlyw33xWFxLYPcdcFIg/z0P
         cb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679603986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPjPiBCkJvyzZPEJcO5rglI99GZgOxZlJuf4tGlBWKM=;
        b=nc9jUXSa81QaC3eEg0rLLZwjyY019/bklmlvbcw9C6sqT22ULhXdiBDTH6bUvZHc1W
         xZWsOW0InSljJu89WibqS+U/E9Ci+DjIwu65G4+Q84yL04JlNCLkWFTNPNuxSP80XDz7
         iGMyv7tvFCKUVFt54cm1VAVQbEFw/INpDegn9wiJBXLDXQlGw8QNCqwWmLnFe2f3kB/D
         2H59JtIzzbNI1QidWrmyM4Vx4BK2gQ+C5vbwJs2/WldLzNa5doGHSWxSnqfrXxqIceDE
         CgApPsS9p3sVwiG4wzEvdwHrlMoX0Sdywrrunt8hXkuB4+MQdiw0dD7yacDYymEYep6x
         fcIA==
X-Gm-Message-State: AO0yUKUO8p6rshGZKj1WKN/iALTAyw4WHab+joJuEiUDNAmLB0ntFm6h
	dIHCgAY6LqzFYIVSmuKYRwzrWWzvjic=
X-Google-Smtp-Source: AK7set+gB3a5kdeBeVEm1Ig2z2L1Wtfk3C2hRpMiyt92WdNvdJO4UMAEwojBWJMdZU1ujJ8F0YXQZQ==
X-Received: by 2002:a05:600c:282:b0:3ed:b094:3c93 with SMTP id 2-20020a05600c028200b003edb0943c93mr628231wmk.23.1679603986464;
        Thu, 23 Mar 2023 13:39:46 -0700 (PDT)
Received: from localhost.localdomain ([63.135.72.41])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d4e84000000b002ceac2ccc4asm16930549wru.23.2023.03.23.13.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 13:39:46 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] libgit2: upgrade to v1.6.3
Date: Thu, 23 Mar 2023 20:39:42 +0000
Message-Id: <20230323203942.143368-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 20:39:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178992

Upgrade libgit2 to v1.6.3.
The new version now has git_fs_path_basename_r() which is based
on BSD-2-Clause.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 .../libgit2/{libgit2_1.5.1.bb => libgit2_1.6.3.bb}        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.5.1.bb => libgit2_1.6.3.bb} (69%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.5.1.bb b/meta/recipes-support/libgit2/libgit2_1.6.3.bb
similarity index 69%
rename from meta/recipes-support/libgit2/libgit2_1.5.1.bb
rename to meta/recipes-support/libgit2/libgit2_1.6.3.bb
index eb7b538ece..554e18e4da 100644
--- a/meta/recipes-support/libgit2/libgit2_1.5.1.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.6.3.bb
@@ -1,12 +1,12 @@
 SUMMARY = "the Git linkable library"
 HOMEPAGE = "http://libgit2.github.com/"
-LICENSE = "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause & Zlib & ISC & LGPL-2.1-or-later & CC0-1.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=112e6bb421dea73cd41de09e777f2d2c"
+LICENSE = "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause & Zlib & ISC & LGPL-2.1-or-later & CC0-1.0 & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5bdf47bbc9a39dc6ce076d59e322dc17"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.5;protocol=https"
-SRCREV = "42e5db98b963ae503229c63e44e06e439df50e56"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.6;protocol=https"
+SRCREV = "c058aa87dce4c67a3b86b3349beebd64b7bedcd3"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


