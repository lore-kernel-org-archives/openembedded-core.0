Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D79AEB64D9
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:54 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.7316.1687919446302744215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=i0kKuJx6;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-39ed11d6a50so3838981b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919445; x=1690511445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjHAMEKXAjoQzjilHcxR8Fgqgz5M16gDkZOQ4iKwyfE=;
        b=i0kKuJx67hr0Ifb3/tqB4M6+6mbkI8DSvgTBFlF6yA4/HCsWERcgDZqYfBhodk0Yhl
         dP81cRObOqYEpGOdmRS9etf/arFg82wGB94C3PRQfIz7qpdhqGV5vY4PlLTODWBdA8l6
         DaM2nSPDtdj/AO1Xtar5enx8/RNNrOaoUd3j8Bkco99AQA/lg9TbqKzGGndPYLttAOE+
         wkLK7CiUR5ppp8oWHEwWIxRHkiHbsTzuNa40OgmSWQ+AnrZnv3Uf9wc911yNpB7TIrmQ
         H6079sQ5QjK2WD8Oh1xkwJ3XQJT4buJO74xL+bvuBsJhzDAZvRXmTYxKhGP4/8EVAzp6
         +pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919445; x=1690511445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjHAMEKXAjoQzjilHcxR8Fgqgz5M16gDkZOQ4iKwyfE=;
        b=BY/4i20PadU7BUl1dpA/rk1PQ4R5qKteY9Izh+y+xme1b1QK+hJcRLDFUt3DaZKMi7
         V01rWP1L6dZtakNcl1ygejxiFOMTwPVHTQFWk6UgmjLvS4woizC51fwK5wNb87Xot34c
         yHUxq4cEm2gKvZJM/CcgTH9BPurTxCwLLfbQ9vREZZXNLT1wlOSWXB8dBy2VVs5qV/mq
         5sXSfg0LCplDQTvOZwpCqH4+lApNq+/l2eXt1UdLcduF9Mob+3cVzGH2+fFIqgPJDBPc
         FwU+mBSY7MEIXYuz2nBVrule3b1AFgntN577wgn6cor2aOlBsBdKXyEDPni2RecK5M3t
         +hcQ==
X-Gm-Message-State: AC+VfDyqzVB1VorwhT+T5bnXdthi2Bc21h4qo02OV/HjPQsJf38De5MQ
	gDJ9c1fhErnmrrOiJSvAejyivIQdJFHuqRxc7u3Icg==
X-Google-Smtp-Source: ACHHUZ5jbnmR/3hO7eN9ZrOu/pBPR1Xi4yYYLdEj86lrlIXJnwv30qhq3OMkMvTXroTbc6aBGcYcaA==
X-Received: by 2002:aca:230e:0:b0:3a1:f3d6:4e7a with SMTP id e14-20020aca230e000000b003a1f3d64e7amr3518845oie.13.1687919445166;
        Tue, 27 Jun 2023 19:30:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 30/30] maintainers.inc: update version for gcc-source
Date: Tue, 27 Jun 2023 16:29:46 -1000
Message-Id: <4df0b835fae3af1dbde4a06568a652ce46d7af7a.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183539

Resolves error:

The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
gcc-source-12.3.0 (/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools/gcc/gcc-source_12.3.bb)

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8a38f508b0..5e2206e11f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -189,7 +189,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-12.2.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-12.3.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr3 = "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
-- 
2.34.1


