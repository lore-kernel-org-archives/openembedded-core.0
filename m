Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1231C001DB
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:54 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.3853.1688092188736893223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=abcd0WAf;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.178, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7659dc74d91so137273885a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092187; x=1690684187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kI1vZP8WpB90rcrk5TF6C2En4L1FVxz7Dhpz0g2kq2s=;
        b=abcd0WAfqUo8r2m8th68H71AjpzX/qR035X/tQyWr9h9OdVev6a2g9gkKC24W1F4vd
         2ZY4EHYLiFt9zirRATpFmrc4bjKaS5P4gubdkyicDgIfD5cUNvfJEGBbCL3yYPndjsU0
         D9SR76djenuIMCH75Sj6DwSc04d7VDgouze238V/Sh49XrsLguWpRpiw1xJ9ryjqUUWh
         G0nRyEchejIf07oFYxkEswXwl4FOaN8XWIXH9m2d9e0la12UHxG88eJuuhcoKkFY3bvf
         dQUAoxKgs4lbWRzmzOZPfhNJ5h+BqVjkiLkA5wuW5h0Vm1FOrRwuKjsV67XF93D0v2BX
         r5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092187; x=1690684187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kI1vZP8WpB90rcrk5TF6C2En4L1FVxz7Dhpz0g2kq2s=;
        b=FnhUIgLETZOdyxSVWID6v2pdAuQjq9SVfpCTnkuUGWgO+mG6l9Bl71pz/hMhTfu7j4
         YktvX9wbunQP0TZ+h0dud9XYJ1i7MP6IdsUp9zsunBqeDPlzPPW3x6e3/LFvXx4w7SEG
         Gtdt0lP52rbul5E7u4sGRqaFCYmcKv2tTq66XEpFWen37JrYaRiYq1v//OVVlTSdbDWy
         qRnjr4lYbwTWCTLUogqaFKYazQS+8bPsXxv2DjriuIEpAap7j8q2TgGEBzxlRYs4ihkW
         SZdbfgrSDeuJSr3c95FOCKC3gPMjN79QXrWRP74WOnxF52r6U8QkBaH5YBG0iQ7u6DcM
         YzIg==
X-Gm-Message-State: AC+VfDwgbJ3JanLJNJNi3p4Mw583F6HEDpigqdEsUcYLv8lAO+FncXcc
	PCcbsvbKafyJ37F+vxQAB4VgVK9wAnGM9mrw6SCcRA==
X-Google-Smtp-Source: ACHHUZ5GzoIZ1VrIeEHGklKj8m+a6H7fuxPaolhCLrvx1wQtU4JbedIXpaaqcCVF9lBVu6bU9WzZKw==
X-Received: by 2002:a05:620a:2448:b0:765:60f4:890 with SMTP id h8-20020a05620a244800b0076560f40890mr1281187qkn.41.1688092187558;
        Thu, 29 Jun 2023 19:29:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 22/30] maintainers.inc: unassign Chase Qi from libc-test
Date: Thu, 29 Jun 2023 16:28:58 -1000
Message-Id: <20c7da2785e0e85264c2ef711b079920eb4bb26a.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183662

From: Alexander Kanavin <alex.kanavin@gmail.com>

We were not able to get a response about availability over email, and so the recipe
has to be unassigned.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5be575577d74a3cb81594392b88df74226be9192)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3c6a03a919..2319c4c5f1 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -313,7 +313,7 @@ RECIPE_MAINTAINER:pn-libarchive = "Otavio Salvador <otavio.salvador@ossystems.co
 RECIPE_MAINTAINER:pn-libassuan = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libatomic-ops = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libbsd = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-libc-test = "Chase Qi <chase.qi@linaro.org>"
+RECIPE_MAINTAINER:pn-libc-test = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libcap = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcap-ng = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcap-ng-python = "Yi Zhao <yi.zhao@windriver.com>"
-- 
2.34.1


