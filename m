Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71E4C433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 14:41:31 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.6359.1636123290952481005
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 07:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=EGJyrICs;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id r28so8580400pga.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 07:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+yWwCRCCsz4mDWq7UyxKKJjGDJEAQqUFY0cu6DS+Frw=;
        b=EGJyrICsHjijQPn4O52PPe/P1CzgQsWttRWFS6mVzx5aoq4w35Lz3oYIi/GL/yW9zb
         8SJ9k5CmElhmZLKNbR4zdtbNLKm/PRkiyQSU548/qjYjyKrZsW6Z2edBumwH3S6JS/eZ
         qJf8+wN2ZxD+lccyGvItv6ZCNJbTOSmfy6f8NX34HgRb3VuBtvCUpRFvL5I/HZnKqNYp
         6VpFIkx90C3mDUPkObFwTSn1c9G7693ZFfFkfkDhvaW9uncjMeCVm5gXbdMF3KaCbRrU
         PzW+hiDVR9qQipuaFD4U5T1CEpAl5wWWF+3scoUcGEnb3W4oorPCaErldcgPOU8JML4i
         PYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+yWwCRCCsz4mDWq7UyxKKJjGDJEAQqUFY0cu6DS+Frw=;
        b=jLUl7k18ni9yHYtunCWTaqUqH9ZFWmzU4wRx5V3ajCijrKHiL9fCmt/syj6f04EmJu
         uJVBPWpFFAsoDUS5DdprrrIlLSUpdRRhQiE5bWNb7YkQrN/Tl1+MYs/wkjPZcqP3DDrn
         xuSLvF9gU7Wy3V9yCKfP9G1xKdk/cRtEFH76FQhJWQXyV7drs67X9A9RLaub05/OQyPB
         IYQASTYSq+9DogRurVbUD2IHj9SOVLeKnSAeS/MkuH63aOPx9eQsvnnB72GL1W3+VsD2
         6C9sboIQylNEgvE8AcG8A3ImL7PhK45Rj2Hn0EeU5XoXvsTFxwi7Mlt5BizKZqzFFyvT
         6JKw==
X-Gm-Message-State: AOAM531Q+3QXS7LmSzfQitio7GjFVypFboCFIPw/AzpMW0CMRqQoTbtA
	MA7UUNm24Dzkc6jUqZmom9pL1B83WDDYXzL+LpU=
X-Google-Smtp-Source: 
 ABdhPJxiTaIcm4Iuorq2FuFqfKKNFE8TTp5+rS35ff4WOMScXm3QbJS1UgYecuAB/4N/q741tQrs8w==
X-Received: by 2002:aa7:8755:0:b0:494:67a6:1c84 with SMTP id
 g21-20020aa78755000000b0049467a61c84mr10834918pfo.26.1636123289481;
        Fri, 05 Nov 2021 07:41:29 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 k20sm7931840pfc.83.2021.11.05.07.41.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 07:41:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-magic: add missing DEPENDS
Date: Fri,  5 Nov 2021 04:41:10 -1000
Message-Id: <20211105144110.2322295-1-steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 14:41:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157901

Since file-native is ASSUME_PROVIDED magic.mgc is not being staged.  As
a result diffoscope-native is failing with:

magic.MagicException: b'could not find any valid magic files!

Fix this by adding dependency on file-replacement-native

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-magic_0.4.24.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-magic_0.4.24.bb b/meta/recipes-devtools/python/python3-magic_0.4.24.bb
index ae895fbd53..fd5825dbd1 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.24.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.24.bb
@@ -13,6 +13,8 @@ inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "de800df9fb50f8ec5974761054a708af6e4246b03b4bdaee993f948947b0ebcf"
 
+DEPENDS:append:class-native = " file-replacement-native"
+
 RDEPENDS:${PN} += "file \
                    ${PYTHON_PN}-ctypes \
                    ${PYTHON_PN}-io \
-- 
2.25.1


