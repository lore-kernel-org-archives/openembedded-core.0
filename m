Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCA9C4321E
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:20 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.13205.1668953746438080236
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=rgSnLRyW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id t17so7677238pjo.3
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Rry59wqCucS1kUYTuByD4tU0tEsk4PxrnBwY6n5k3o=;
        b=rgSnLRyW6NPEOoOv/hZPuBPFcA4IzFmk9dK6SVzqJNvUJJlgRxqjdtOyPYcU+DaQzp
         RxAJQiChQsLu9d9Rx3j0W27vtGQHRahvMuJrEzbK6ZlaAQA+nI5ZkQG58B8DNa0+k5pP
         1HVjFoY8Rp2A4wPTjoKmuCvETh3f9NZw0sKKE6KPUgmcy8bpffb9xEgjsPW9RzDqqeXS
         L/spXYWYgA5nf6yaFE2o+VgQ6ttpHJgEgpoebtWoUYildLswly7yDsEb/YI8+F3A1OEo
         Z9kSWkWCkAW4acUQHj/pvC6091jEgiBpEBsEuZxQN0+Mn2CAL+afRo6c9Ygy8y00dIGK
         6ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Rry59wqCucS1kUYTuByD4tU0tEsk4PxrnBwY6n5k3o=;
        b=nPhsmaM5Mhv7bK+mfWGjLThyGrBXanBxiyA/7KYNGC94nXorOK96zaisZov5kv4dmf
         dhluKzd3HhWjusyBxs0ofxKH5tsXQ6l1RQuwRbSrKPr9wu8IRvCAGZZmekFsWEBSBXMG
         i3JihuUiz9CmYZSMW9Bb3YaD7Ur+HvqBGII2Nl2gv2MpyH6099/9+pSWGULKAeb08smB
         iLz7ztxm+E1Bhzz+lQW+nlyfU8liFzetZ8VHcEBEW9Jop3wtV8JIp8ioIB4rZrsbWNcO
         2oCcqn4fqiZFOFLOz/FMyV03zDa2Ue4jEmayi5fFhwYl02wFHpPxEi20So1bt4jPXWJI
         /BtQ==
X-Gm-Message-State: ANoB5pnDXrEJhQtgim7Aft+/JsaE4EfAb6qSBZdiIwS8x3gxVtp1dA51
	gug+4qmTtZbB8XRAXUD1PQLawVMMQ5YFerWKr94=
X-Google-Smtp-Source: AA0mqf5ySSIaeCG2hvivNnDYw2R1vEhLegMY4ihNyLZI79O37t3GdTna4wamiGeBF6cFtdR1u88F/g==
X-Received: by 2002:a17:90a:4c:b0:218:b187:d7da with SMTP id 12-20020a17090a004c00b00218b187d7damr1010894pjb.68.1668953773864;
        Sun, 20 Nov 2022 06:16:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/35] groff: submit patches upstream
Date: Sun, 20 Nov 2022 04:15:09 -1000
Message-Id: <ce719e45e5c5a3f05969f18af9d30edc3c200aaa.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173620

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4269cfcd6c29be05964010d0406584b80822d1d1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../groff/files/0001-Make-manpages-mulitlib-identical.patch     | 2 +-
 .../groff/files/0001-replace-perl-w-with-use-warnings.patch     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch b/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
index 9105da6457..c3cfc7cea8 100644
--- a/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
+++ b/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
@@ -3,7 +3,7 @@ From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Sat, 7 Mar 2020 00:59:13 +0000
 Subject: [PATCH] Make manpages mulitlib identical
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [by email to g.branden.robinson@gmail.com]
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
 ---
  Makefile.am | 2 +-
diff --git a/meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch b/meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch
index eda6a40f51..b028fa20aa 100644
--- a/meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch
+++ b/meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch
@@ -15,7 +15,7 @@ doesn't work:
 
 So replace "perl -w" with "use warnings" to make it work.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [by email to g.branden.robinson@gmail.com]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 
-- 
2.25.1


