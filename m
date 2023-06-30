Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03BCC0015E
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:54 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.3862.1688092187074946586
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=LnoIwqJX;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.43, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-558a79941c6so890269eaf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092186; x=1690684186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esv/Cc65zZf41M/zdD5PrFVGmR1ScxKhguzu2oOWZxE=;
        b=LnoIwqJXMqJXmiecdTAyx79di2boGgqIWT2NBddPchU6VTekrWvpDnfI5waL4z2h8m
         JHLXbb/32TDKy1uCvMvSilOInl4AVtp4puOGeCHsjFqkn4fsSKD7ssyZyHpZ446MoS95
         /ah49wezhMAQHrMfAcH4jFkb4VHdn9MoIMgLBoRDRQKrdWHJE39cR2U/ijJ3alfTeAid
         fZvXjta9sfVTH/qRTp7NOETNaBIRVPUn/uL4aKo0KmC8QANGAervpHolvr0jOZd5lLqn
         Gtgu736tmbBIQcT0QGYNB4SF/cwyinAvWTDBOhqsunJM7Xe2wjVOaZaUtuedGHY0SrKx
         1tQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092186; x=1690684186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=esv/Cc65zZf41M/zdD5PrFVGmR1ScxKhguzu2oOWZxE=;
        b=Q1fd6klFQT/7rx+BN/h8WZ79u0LeP+XGSDi75QrWsFc5UiRKap4I3VksDqvStqRceH
         8WiVHIkf+yLbH1YsP0MAruM/v3367qJjd+FnI1/r1eN579vPRrzR+qI2RIY8GNiRSuXk
         q1CQLZ2cPKF624mSpbeLKjDz8tLODqd9lGyrRDVGGDs+lJJ7uyiQ5jgBWk2mr47PTuip
         aRzr+aFMH1qtDt/fOoseswvhVVrg8PYJ41a8tlAkUov0GybeD7sLFiEYU+hZ/TBCgzDS
         fvjDMmDYlK03V7cV6sGYEBRISOBhBSypUP73+TtJ9fhjXvtTynzVGcngvyZWHVaX4uI9
         1zqw==
X-Gm-Message-State: ABy/qLZufWOkno4+n9pi5UdOxYAwPlgSAPJt4668jvDJXOLxJlEnotd6
	+gCdx4g4L4/if+6BMALv33BuFiS8C8eLJYHafV6G9Q==
X-Google-Smtp-Source: APBJJlFQMk8PWEjaulpqIB9hPEwrNy2QoNeuhG4bTaFqjkumrKETcaCLT/QnKct042X5quMO3VDdBA==
X-Received: by 2002:a05:6358:9d81:b0:12f:2573:45b4 with SMTP id d1-20020a0563589d8100b0012f257345b4mr1364437rwo.26.1688092186012;
        Thu, 29 Jun 2023 19:29:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 21/30] maintainers.inc: unassign Alistair Francis from opensbi
Date: Thu, 29 Jun 2023 16:28:57 -1000
Message-Id: <deacda2bdccc682b845d5a909adfc172ccfcb5cf.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183661

From: Alexander Kanavin <alex.kanavin@gmail.com>

We were not able to get a response about availability over email, and so the recipe
has to be unassigned.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 60eda3dcbf96b5982a0e282fd0c3c13b0b4d7787)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 814741f324..3c6a03a919 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -555,7 +555,7 @@ RECIPE_MAINTAINER:pn-npth = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-nss-myhostname = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-numactl = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-ofono = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-opensbi = "Alistair Francis <alistair.francis@wdc.com>"
+RECIPE_MAINTAINER:pn-opensbi = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-openssh = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-openssl = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-opkg = "Alex Stewart <alex.stewart@ni.com>"
-- 
2.34.1


