Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF09C636FA
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.8166.1650463786901087408
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YgAAeuAp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id bg24so2060887pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GvaEbjQQHqdMf8gqlM3FKhzsJw2zGvEp0bB3CSnZ9x0=;
        b=YgAAeuAp4ArRCFRKm3Pi32oYezSavUtOIMijQbXZq/PbIqp5nJFmDLwMrT0SMk8F+q
         jTIrYChKuROh/18jgVKW558W/iNQcu4zetcfNIX/5z+I0lFDaEgoTPSCbF6irfhndmdM
         yvsj4VXD/q3pxE6GHUu4LLKBLOljnr0i4S62B8FjYg7xqQfpTFXOLpIHS+kCUDI4LtbE
         cCTd0onaTxvqFMhZuRawbyoCOS6lhM/1Wm30RRIPC3ZE+MHpK3IFjmhPSuxalUKH3pls
         Cflfts7P6stwTY901KMIEsvmrwnitF2klFeWT+2seWvnjUFxRBYMGRhyq9M2poE/jZsm
         306w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GvaEbjQQHqdMf8gqlM3FKhzsJw2zGvEp0bB3CSnZ9x0=;
        b=qrr0Uu9woUwBxVIrKCpzEPClsGcqguHYpR5syFN1yCG8RZwEEXlV7P5TQZNXoQXwto
         a6NGPirzJMGJyNIE36q9/DAvjYh0T9sxUXl/N3PTbczHB+ZH6dgRlj0UQL3EdSKsU28F
         W7G8KioRgu1lSCNjQpcIf+/uXs/5KGRduIBeErUNn5mVh8dfFwUBYdGTOrSU0v0bEGns
         a8P9Qrr3PY4R8c//K7MSmt+caRjJiFCl6Y/KkLZvHsG4bScE3YYyVv+0cjElngsmP8th
         5TnQTzfqszE5YOqd0whutu6ZgXTaqEM9HV/l95RbUxaIBW47QoohP+xqBbSkPdytTnDo
         17Hw==
X-Gm-Message-State: AOAM530b+cJ09KaIDKoeR6x7NrSZKKMU6C7KpR0efVcsisxAomQX1r+k
	B/l5OljGHL1SBT1UxjIEtCeTTbUPz+QQ5bRSYt4=
X-Google-Smtp-Source: 
 ABdhPJyGyhqCW39FAWreinowZZQsXw/mtQ7K2s5+eFgJXxydB1z5EAWxt8UU4tFBm5kmVYIvE21JNQ==
X-Received: by 2002:a17:903:11d0:b0:156:6c35:9588 with SMTP id
 q16-20020a17090311d000b001566c359588mr20548984plh.50.1650463786032;
        Wed, 20 Apr 2022 07:09:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.09.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:09:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/27] git: upgrade 2.35.2 -> 2.35.3
Date: Wed, 20 Apr 2022 04:08:14 -1000
Message-Id: 
 <02a238208accc35a7a7882435fd6e2c6e04b7d91.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164694

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

Bug fix release:

0f85c4a30b setup: opt-out of check with safe.directory=*
bb50ec3cc3 setup: fix safe.directory key not being checked
e47363e5a8 t0033: add tests for safe.directory

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 457b5d4dad3e6fa77e80bed66666c36caa452380)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/{git_2.35.2.bb => git_2.35.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.35.2.bb => git_2.35.3.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.35.2.bb b/meta/recipes-devtools/git/git_2.35.3.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.35.2.bb
rename to meta/recipes-devtools/git/git_2.35.3.bb
index fe137d94af..68981d4fde 100644
--- a/meta/recipes-devtools/git/git_2.35.2.bb
+++ b/meta/recipes-devtools/git/git_2.35.3.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "0decc02a47e792f522df3183c38a61ad8fbb38927502ca6781467a6599a888cb"
+SRC_URI[tarball.sha256sum] = "cad708072d5c0b390c71651f5edb44143f00b357766973470bf9adebc0944c03"
-- 
2.25.1


