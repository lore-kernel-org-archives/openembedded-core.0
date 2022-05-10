Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC9AC433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:40:25 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.10881.1652193559123929739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Ms3pamCS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d22so16900040plr.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=G28c2MtQov7vpjkJmVWka9Ld+Nhwgmh5kd3nfnpeolM=;
        b=Ms3pamCSK/OV2YxYXUYntcrBrZSHqICr61zS+WMV/JnwDOWV3aOokR/ITHgLu6JyBo
         LQTtzc3gcg263oFDSQRPNwY8nune8H7xkI6tDUTY0Tizylu9Hzwa7mJPtJ9jX8UBBn5L
         pT40HNHTDOC4Zm/VoPwBt8jGFfVVsUvIXTVFnqW3oHtyb8khXxeNpE6L3v/w/ZDRpV1b
         /pifRA4owtvlBAr9TbRgSXkNUQT7+ntM0prC1slK2EFObHVKrvyNBC6WdfsfRkW6TJpZ
         7aJA3jaPDz+ILqkYJRUEFQ/fVQW0BT0l9xTu5EnV3q87+o1eEBZ41qa4f8MHV38GUKEl
         +PSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G28c2MtQov7vpjkJmVWka9Ld+Nhwgmh5kd3nfnpeolM=;
        b=c+NTrwa5J3kjoYfWISxLEdA2OK4ip5ydxb6hrQqvM6Gbj2OozBaNcS7VX6yWf9HWYH
         wzcni6ftcHLJ5uG7OBWilxUO9GeBtTWmapLG7xOeUuSJhn75EqxPlHP1PNn68fuUDp0O
         GyVUfo0Kq/7s4fJE6IBTkSJVtiMBI+MHWl1Qy7S8O3WLI5bZiy0rponCDSqiNsXpV4k6
         wDRKrzCUajDTtuEn8KeKlq/MDGh5MYjpnhOoJDZZlAHKnGYVCEWfudvrKlLWkLlAZKpZ
         H4x9teVj8UOYw+G0lf666MAdQeU0aexG4HPmSVYIIxZ3My5jeW9TyPZZFtMLMlDmYmKd
         HDZQ==
X-Gm-Message-State: AOAM531ZSzRP5L/bJIrYpcLvy3yh+ktF3Xsv/0EH9L1Efb8sll9QqEye
	BkPQnH+vXjQbGu/7A8bBzEDBq5t/mdAE7nwT
X-Google-Smtp-Source: 
 ABdhPJz8yVIZBIR5hIL17VyoStc6Dz2oEJYzoP8eFieDmdi/zNGZSL3q9C78cH1JTTYgQYxx5mIAyQ==
X-Received: by 2002:a17:902:b682:b0:15d:29:9820 with SMTP id
 c2-20020a170902b68200b0015d00299820mr20856168pls.134.1652193617618;
        Tue, 10 May 2022 07:40:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.40.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:40:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 40/40] abi_version/sstate: Bump hashequiv and
 sstate versions due to git changes
Date: Tue, 10 May 2022 04:37:19 -1000
Message-Id: 
 <69f2d0822462e77d09b4781dcec41a0747e4d387.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:40:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165457

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The autobuilder sstate was corrupted via incorrect equiavlences caused by
the security fix to git and the poor interaction that had with SCM version
checks under fakeroot/pseudo. Bump the versions to enable a clean slate
to work off.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3b6672730372e130d4d72b683fc3150911964745)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass | 2 +-
 meta/conf/abi_version.conf  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 1c0cae4893..3513269bca 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1,4 +1,4 @@
-SSTATE_VERSION = "8"
+SSTATE_VERSION = "10"
 
 SSTATE_ZSTD_CLEVEL ??= "8"
 
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index 2a08b1208b..c716bd7feb 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -12,4 +12,4 @@ OELAYOUT_ABI = "15"
 # a reset of the equivalence, for example when reproducibility issues break the
 # existing match data. Distros can also append to this value for the same effect.
 #
-HASHEQUIV_HASH_VERSION  = "12"
+HASHEQUIV_HASH_VERSION  = "14"
-- 
2.25.1


