Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF222C3DA41
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:54 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.3863.1688092191612569550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Hfz12D7t;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6687466137bso1218333b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092191; x=1690684191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXSzgQItog34PkvBnKayad9JFAU8JoXLpRJRuFy9wKU=;
        b=Hfz12D7tekPDJqwrb8lkZM8iglkncKXaRD/Q4Q5atmWYJp+mlzTz6VnHuXxO9xI8au
         bNVOtj+jZ74O9FkqgTlv8bJvTdw23mlVr0obFxm+KdoP1XTaiMstMNmCYiXzY3AGtJNk
         p0vMDKdbOw+ht8CW6L8YKBoKkW3wlxDklPlw+2yjY0t99xX00GGVjG7JRXORMMvfp18c
         4SCy4Ym3uUMg9VnHczy2wVbqIexGsBN1i1R3Caz4yVptXPfR80GEHjy2fMFaZPKtyqIN
         8hgIBOgYO9puH3+rzGjKNhouYEpYpXWunujJbxPYQLcMXTtg1HUJ+GbewmYAApUnh6q8
         1aeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092191; x=1690684191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXSzgQItog34PkvBnKayad9JFAU8JoXLpRJRuFy9wKU=;
        b=hNTLFhTQJu6x3JsWgai3Br+yVtHXdclMKe6jF/gFQUb3fT1vur8O0gdP28KsyDCkGY
         cv/atUrUz/oOfvJthODyxmwtTYu34rlRafzDWu6RVQQ0ZBE88g8uZQd6dVp5hQx8dsnK
         /WjmekIug6507JzAVjDQZcGo5Ohc+mNOohl112NhWlM5LlmABCaES3+QPD+o5T9s1jZf
         VAK282wSKOfn/Nz08W2d9sb3utXqf4QGqJyQhPuNW9w/DC/G3q4+yrJQ5UC/pyBe1C4R
         gEhwHNYxnf3AhXP3VF6NtXivO7BPxOFi1vJsAq9s71gP/58ptKvRENiU242Gd1NY5sE2
         +9Hg==
X-Gm-Message-State: ABy/qLbJl9iD1GWFJMTAH4ltAXM3O3LeACz06S8XFGf6Y7LeYtab+H8t
	cfW+5BMKIPHuX2/2A4JeZA+V0/+8m/OB8rkxQyeqeg==
X-Google-Smtp-Source: APBJJlF6w1y/nAAemdisqzbNkAC4oihiVIe8qXRcPP94AlQv7M1V86CxWHV8g5Kssi/T4z+0Vd5YlA==
X-Received: by 2002:a05:6a00:2309:b0:666:afc1:1f4b with SMTP id h9-20020a056a00230900b00666afc11f4bmr1674916pfh.30.1688092190675;
        Thu, 29 Jun 2023 19:29:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 24/30] maintainers.inc: unassign Ricardo Neri from ovmf
Date: Thu, 29 Jun 2023 16:29:00 -1000
Message-Id: <8bd8ea8293a75ffa0e850513c3c15be6bc8c8692.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183664

From: Alexander Kanavin <alex.kanavin@gmail.com>

We were not able to get a response about availability over email, and so the recipe
has to be unassigned.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 56f1af6d5b3019dccbc27bb0a9692a5f1a32f87b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 865c09852a..d58ff99a03 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -564,8 +564,8 @@ RECIPE_MAINTAINER:pn-opkg-keyrings = "Alex Stewart <alex.stewart@ni.com>"
 RECIPE_MAINTAINER:pn-opkg-utils = "Alex Stewart <alex.stewart@ni.com>"
 RECIPE_MAINTAINER:pn-orc = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-os-release = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-ovmf = "Ricardo Neri <ricardo.neri-calderon@linux.intel.com>"
-RECIPE_MAINTAINER:pn-ovmf-shell-image = "Ricardo Neri <ricardo.neri-calderon@linux.intel.com>"
+RECIPE_MAINTAINER:pn-ovmf = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-ovmf-shell-image = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-p11-kit = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-package-index = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pango = "Ross Burton <ross.burton@arm.com>"
-- 
2.34.1


