Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49728C52CD9
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:13:52 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.43732.1721740425609588204
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gpcMsxAs;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-656d8b346d2so431919a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721740425; x=1722345225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WPGYjMTNKNh7HAOynNrSc3qPeto3K34dPeeKc4IIMo=;
        b=gpcMsxAsSCTFcHuV9ZdE0yoRjJ0YGpIAc/94WS1168XHn4r5PIlpkvykuWpcSGWUGS
         +hR5WnzRryT0qsjclDh7OfBwFiElYXAb/hJxCXTEshiazkd6f+kJijpCLLIUgBFyVxhc
         lqig2/qJNUGcm16WFJ9gB91eqfJE72/z79VzY7LPYip5ZsehhvX/CQt1MG9aP/ykG0m+
         ha6WcHUtSw/upE4IE6EzOsVlFWdvkhidyzfq/Lbd4Wu/tpDF+H4jvy9fJb/hYbRhVJP8
         W6ERTXM7U/PgpH8t9M73AF1bdoADsAqnuMz9zzIOc3jYsF5/Rp6mNxS8sVJlat+558Tc
         0rLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740425; x=1722345225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WPGYjMTNKNh7HAOynNrSc3qPeto3K34dPeeKc4IIMo=;
        b=ghDbN5TW1scpvKGiBZT/DMHTSJ66qbf8pD988yIThBKtMQXX4vB5mQ/kfHCYxSSWxW
         aPURlpnEdahkBArt9JMJevflIbFH3flFMkj199mC0gTmkyhtUGE+LRyNkSNZPGAde1/+
         r7j6BXtYRU00LqMcEBHbmBP4JnyBMbOi+jvhXHjv0/1G5YLl2ko1UjfmTW+vnvWJkRkN
         WF+KB+wbLFEwSQGo6NlUUdFIRY3F9NEqo0GZlID3GYWqmwdG65r3EYBgvIC7fFmYwJY7
         53H+bmRlLYgihndFBWeKKSbD/YfYxJYmOfCYQsUaeKhgXVYAcmwwdtHgkSAmiq0mqQUD
         ak9A==
X-Gm-Message-State: AOJu0YxbYpz+HxTtKTKglkqGGo9AScD9E+AnxamPUiRYkX9kOsPlFypy
	lXBg5UvpIW1t24kG1FwS+4AhNhOSX6L/h+myROAFka+I7zPBGC5go+mrMnQ/pm5yLqp8+MzOPA1
	DpKA=
X-Google-Smtp-Source: AGHT+IF0lZJBUmlanxoH4euug1D4Dk9lueknCtHh/XMQFnw+naNgCnmQjJt2tIgrkLDF/8hChiHSBw==
X-Received: by 2002:a17:90b:4f44:b0:2c9:718b:2cc5 with SMTP id 98e67ed59e1d1-2cd15ebd246mr7655164a91.16.1721740424945;
        Tue, 23 Jul 2024 06:13:44 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm10091540a91.57.2024.07.23.06.13.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:13:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/17] libnl: change HOMEPAGE
Date: Tue, 23 Jul 2024 06:13:10 -0700
Message-Id: <bc68ac83d158f3f0b2f67f89f541faecb094ea43.1721740245.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721740245.git.steve@sakoman.com>
References: <cover.1721740245.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202356

From: Chen Qi <Qi.Chen@windriver.com>

http://www.infradead.org/~tgr/libnl/ stops at 2014, the
current official home page should be the github one.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cfe7659e4c553c51d39322b378ac7fb2891c2dc6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libnl/libnl_3.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libnl/libnl_3.9.0.bb b/meta/recipes-support/libnl/libnl_3.9.0.bb
index db9d93e8cb..b2825374cf 100644
--- a/meta/recipes-support/libnl/libnl_3.9.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.9.0.bb
@@ -4,7 +4,7 @@ APIs to netlink protocol based Linux kernel interfaces. libnl is the core \
 library implementing the fundamentals required to use the netlink protocol \
 such as socket handling, message construction and parsing, and sending \
 and receiving of data."
-HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
+HOMEPAGE = "https://github.com/thom311/libnl"
 SECTION = "libs/network"
 
 PE = "1"
-- 
2.34.1


