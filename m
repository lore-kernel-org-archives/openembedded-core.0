Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFEFC433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 23:03:39 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.4337.1651532611775958138
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=BoSp0Eb8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so684295pjv.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=03H1F4wiOOjegbDdGlQ6MFT6/kRYzd0pRB5obBMoQvY=;
        b=BoSp0Eb8f5lz9qsDSg2Amia+a3FFjEJWKZD7480jZ7GzXBkSkD99A3swtipUFHb+Mm
         3aWqOSSLxLhrPia59Ih8fBbxLffIzAz4Zmw9wdCpjS6564toaQSr6rVdsjwTTTX0IKO0
         1HSADRt+OmqXLU/McHzEPvDdE3gss2tYpUGDUyPlKyfjCiNoQUXidwgv7X+aX+jxiuvV
         Q++JYpAgLmgH4X8+ORrE7OUN1dSwUMHcjqyynPTBfoVnrcYkIbVjUwx/SCUbibbOiWAT
         G2d2tx2fAZ7OBw1LLw0w75LplZbRn7voSkzVTJmHJdm5d/n8J/X74LF7fiL8R2R7+0xo
         g5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=03H1F4wiOOjegbDdGlQ6MFT6/kRYzd0pRB5obBMoQvY=;
        b=a+2EmJYTXr0e8EcL+C1JSi1LcVNX9cQ9rRSIDo6ryAJYKqQqesuKc0/KmdW3HyGQgX
         Fp6VWVZDbuG4AnFqWAruPO0SVsgAvpKIdI4r33HI+Ifci8cs29dw9fEv3EG1ZUyjznxC
         JGqJuCjPTDSchSlExQdIt/8Vb9C5c0JrWLIaTrqYL+3XMAa/pdpTeTRi0w5SeCTns1ha
         ZQWo/1LvRIIPWtXm0DMMcl6AMwTA9wBQQ5Zk/VQl7XgFwK6l2BZ6jdj1MlXfQX7z47ix
         qgPGL6tdbuda6WzQZHg41xXH/SJEr+1uWKFPJCpCqi9YZDM5i+43j8E62EBAbs7TmxOP
         21Zg==
X-Gm-Message-State: AOAM533+/2Mi1aEMypo6pgfgWxcZfYCwR2/YqE8gtmCIWMxKBDexGxsL
	GF2jFojYcN1TaTrdI/sLjUBSo0sIMHEahLNjf5A=
X-Google-Smtp-Source: 
 ABdhPJxybsIQ3hx/sX3zYRKhuRxSpx3bIBjd9bkzAUCVEVXKe/g2Lp4qAFsxPFieibI+D4mFKgxecg==
X-Received: by 2002:a17:903:244d:b0:15e:a3a2:5a75 with SMTP id
 l13-20020a170903244d00b0015ea3a25a75mr7527343pls.89.1651532610614;
        Mon, 02 May 2022 16:03:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0015eaa9aee50sm2002945plp.202.2022.05.02.16.03.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 16:03:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 9/9] uninative: Upgrade to 3.6 with gcc 12 support
Date: Mon,  2 May 2022 13:02:54 -1000
Message-Id: 
 <ccddad20ec7496333af15bdf7ceecf2b5c7b1738.1651531749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651531749.git.steve@sakoman.com>
References: <cover.1651531749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 23:03:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165188

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are reports of issues with the new libstdc++ from gcc 12. This upgrades
to a gcc 12 version of uninative to allow builds on those systems. Gcc 12 isn't
finalised so we may need to add a new version of this if/as appropriate when it
is.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e3da4da7e5da5bb9e1d360e2be2fdd5132e69320)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index bfe05ce1eb..411fe45a24 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.35"
-UNINATIVE_VERSION = "3.5"
+UNINATIVE_VERSION = "3.6"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "6de0771bd21e0fcb5e80388e5b561a8023b24083bcbf46e056a089982aff75d7"
-UNINATIVE_CHECKSUM[i686] ?= "8c8745becbfa1c341bae839c7eab56ddf17ce36c303bcd73d3b2f2f788b631c2"
-UNINATIVE_CHECKSUM[x86_64] ?= "e8047a5748e6f266165da141eb6d08b23674f30e477b0e5505b6403d50fbc4b2"
+UNINATIVE_CHECKSUM[aarch64] ?= "d64831cf2792c8e470c2e42230660e1a8e5de56a579cdd59978791f663c2f3ed"
+UNINATIVE_CHECKSUM[i686] ?= "2f0ee9b66b1bb2c85e2b592fb3c9c7f5d77399fa638d74961330cdb8de34ca3b"
+UNINATIVE_CHECKSUM[x86_64] ?= "9bfc4c970495b3716b2f9e52c4df9f968c02463a9a95000f6657fbc3fde1f098"
-- 
2.25.1


