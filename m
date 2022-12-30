Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A75C4167B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:44:34 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.22297.1672418673625441069
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:44:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=b+w4NKMF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so22175097pjd.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wZUUPDUWwjYB2N26ZiIdWErgkZrc0rOF65snY+qPLo=;
        b=b+w4NKMF4qUGQDstxKkA/08znowJF3kLxXUFAL7pSuMELJktgTqPBvXhjsH9dg8COl
         QNhE6SdDaa2u3IaYLoNjPYDFxQpdNwZFoKPyEGk2/6HN3TBDlWb1PzxPO1x8bIw3rKq+
         dMC69FojbPL5NP89gjGoZL2UCYNaPcTeTFOH6zxfwMWtsIe4cw7xfups0cuO52lw9o5H
         UeuhbDJ7H18o5xbUSIyvYrfQoBOE8E2bdZF+Hl8Xq7QO8Li5eYgh9bVLAq+0Sx5uPhpE
         7DVlMrrsIWKwLJSCrUY8M+ApAZinQimLhPMAXGoU52sfrMDcN5WwLI4XcBlzSoCkkwwV
         /jKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wZUUPDUWwjYB2N26ZiIdWErgkZrc0rOF65snY+qPLo=;
        b=5aqOGGdNnx32J02OpPeTZRCrBpq2cdu8vsrtnQlbl6JDvp67WZ6c8CNJ+M4255McLR
         31Z2qDZe+NrKhsEzm+L/SxzpnpEg8apTro/x+353TIgfjp2Om/XIFV2M0IGpMsRNUFx5
         8gjdl91AqtMHwQbtJbhhZSM8/H0oeOSsWIhSk56Wo/w9FoY/tom2JdjWXnyQEM69CHz1
         t/q4oeXfYFOEN/e9M4N/igKfcBbNmWedmTp+atqUQ01Bo2Rwz7FXR+EWdAL7QgJQ9wBB
         B29Zg3ydElB6onr2vTb5Cv7gN8nAne2MoHonOpFZXeSVD4DYJN1DaqASlxHkU1hGrM4W
         nCTQ==
X-Gm-Message-State: AFqh2koY8oTP4SHXEpINziqH0XdkU5LxJsJ9V6Glq6tbq+CpKKMrLf51
	CnQ9aH89tKjz4d6fDV0iPu616yTPZLjUoSL6N04=
X-Google-Smtp-Source: AMrXdXt9oRecakG1wkjA34B6GrNDCl4A1N/010hDTL0/k2L4zWCPwQcFdHnzaeZmZYvf0ShcYN9YMw==
X-Received: by 2002:a05:6a20:8e10:b0:a4:a73e:d1e2 with SMTP id y16-20020a056a208e1000b000a4a73ed1e2mr48969127pzj.57.1672418672653;
        Fri, 30 Dec 2022 08:44:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.44.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:44:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/22] tzdata: update 2022d -> 2022g
Date: Fri, 30 Dec 2022 06:43:58 -1000
Message-Id: <5b15e5d8c83637f88c5d0359af8732334cbf4d74.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175149

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2394a481db1b41ad4581e22ba901ac76fa7b3dcd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index d3c78e9157..1834665a1e 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2022d"
+PV = "2022g"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "d644ba0f938899374ea8cb554e35fb4afa0f7bd7b716c61777cd00500b8759e0"
-SRC_URI[tzdata.sha256sum] = "6ecdbee27fa43dcfa49f3d4fd8bb1dfef54c90da1abcd82c9abcf2dc4f321de0"
-
+SRC_URI[tzcode.sha256sum] = "9610bb0b9656ff404c361a41f3286da53064b5469d84f00c9cb2314c8614da74"
+SRC_URI[tzdata.sha256sum] = "4491db8281ae94a84d939e427bdd83dc389f26764d27d9a5c52d782c16764478"
-- 
2.25.1


