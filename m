Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD69EB64DD
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:53 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.1237.1687401410541887660
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=5D371OLS;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-54fb3c168fcso5248322a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401410; x=1689993410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZmvKwYR5VA5kCrpk0G/wOhhFBmtNwNDHLb2H9jar54=;
        b=5D371OLSOQn6xKJMmjrGqNRra6P4hvE7ZiBI5TNXjvhIqA/Lmm4FQFGQyOZpxgULrj
         yCBToa3Pr8brnuJDAIOIVzflT95pZlNLcWuIJn2dPAgjpnHN1qSs2v95KVlNfIm8GujR
         LNR/W7U8tBzetwQ7hzAIT2IysFvoHVvPy8LcsVOvCdW+FFVIY1xEYE8rQ+fleeisSNcv
         gmKfKUS2kUwVIIrDdpFntp37JWB7KHnTr8BB3Q4+jlOOlSz+qYmtAp4QHkktD+0Klv5J
         CIj0fjaa/MvTgZo05w5rkuEP0N0O4MpmKy4nt3F+EY+StEHGQmlHCzX7tiPFge28+h3E
         xYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401410; x=1689993410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZmvKwYR5VA5kCrpk0G/wOhhFBmtNwNDHLb2H9jar54=;
        b=U5Nu84QDnxgGFxSQ83OjihYn2XzJPRjK5Xknml8KWLlxjIvEwW1clQ3+PVkXxFJeNY
         uDk7OlO9372Hrr9Y9/FpxKqKfXawINwxjxfRPwTnzlM/qy8gahBF9qZrpguFvznt2UUy
         zWZBE2JUWPD7AkAfJBBbTRSqXKtzt9AE6DFJjhauiqsT+9xOhRpNRp+/0tQDYiioPw5q
         POPqiVbzKBowW4QToYQa7AmFqDiwHqbmhODpZjogr60HJVZmRZuwfAY775ekqLpUW+ap
         DaLTwHvzGdhl1fcaIz/5Kqm7wmL9pdqiDDpgZXI/F94KB4ecOOkzWn94m3D8jGgiGfjF
         kOEw==
X-Gm-Message-State: AC+VfDwmxbMFqjRp023Nwcad4BYU7368fCNBfNKzl32Am8SKDf/tNMxe
	3ilnOhj7MpLeCpz6+LpqqDPHUwWQepN83U/aAAw=
X-Google-Smtp-Source: ACHHUZ5Yz7va065gl4S6uClU0Qbtp6y3eDwFWS9JT1hwMuUv0qR2S1+Vl+ymi+0dGvpxMYeCb/B/Qg==
X-Received: by 2002:a05:6a21:3386:b0:121:574a:ac6f with SMTP id yy6-20020a056a21338600b00121574aac6fmr15312881pzb.1.1687401409689;
        Wed, 21 Jun 2023 19:36:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 23/23] maintainers.inc: correct Carlos Rafael Giani's email address
Date: Wed, 21 Jun 2023 16:35:55 -1000
Message-Id: <677661c3e1795a1904a0d869866ea8a6442fb160.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183223

From: Alexander Kanavin <alex.kanavin@gmail.com>

As confirmed via private email.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit c7f934368d3fb3e9cf268f8237eae80b1c1665a5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d9e00bcdac..8a38f508b0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -301,7 +301,7 @@ RECIPE_MAINTAINER:pn-kernel-devsrc = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-kexec-tools = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-keymaps = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-kmod = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-kmscube = "Carlos Rafael Giani <dv@pseudoterminal.org>"
+RECIPE_MAINTAINER:pn-kmscube = "Carlos Rafael Giani <crg7475@mailbox.org>"
 RECIPE_MAINTAINER:pn-l3afpad = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-lame = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-ldconfig-native = "Khem Raj <raj.khem@gmail.com>"
-- 
2.34.1


