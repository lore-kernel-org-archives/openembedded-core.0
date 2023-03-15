Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4F1C7618D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 22:18:17 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.7258.1678918688138634701
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 15:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hxb6BhcK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id l12so10362051wrm.10
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678918686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q81ts+Hnfibe+Kx5aXqzrZizffK4FXhBgXT6SxeDvb8=;
        b=hxb6BhcKFTJMT5tiNY81j9PzptAXbt/6q0gt4W6HWcYNPZIPpOa7La7QKBEUxN4P8v
         7pWC2EJ0LHL5E2EcXX29ZNs24pDNz4GDkCS48d+SDlow8v+nl7zn1Rv9rwOB/et7r/pH
         HQJsEwMYG1y0Xz3QPG/r+3WqU50f8OpcWxkcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678918686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q81ts+Hnfibe+Kx5aXqzrZizffK4FXhBgXT6SxeDvb8=;
        b=IvF9glYvUfrrY4UCS9sZXVcb1slyJW1XlTQxy9HBUAVZxmVJziT4xmPnMy+vybLImQ
         fBouHyCQDC5erPnGBTgckZ+DA9Zsh7vHATMlLlVPIzezpnmjcGx5vYb1HyDTkwd9RkvH
         H4RRfFQN6qmZYC4JUlHgDBVXj/7tml7E87rblFENJc8K9+365XX3HbDK83T0JqlnZvgj
         0HZN6mizK3wiDrIKZrILuHdS6YzBuU91licNimg4GbvNc1prDO36wpES/eBMDhR0u+WV
         fAPEV4A6orMPk3StllATn8az+DNX8l0cdc8Az5f9f3kEVSFaFlOBln1Zw4CdBqbNVqXK
         w/UQ==
X-Gm-Message-State: AO0yUKVSgUV/IdyzR/cmhuL76vqHwJpjCXsKoHaob/9yN4rVyVLgCnLW
	LBjdT7Hg/8fVcnUdHsjWoZJz0Wi961qVu+CXIhA=
X-Google-Smtp-Source: AK7set8gLkaKLpmERbtWy23GcODOFlssA5VM1aALqtPu5rFrQl00SHhUowsttBU7ya6MNNYXhfgcMQ==
X-Received: by 2002:adf:f4d0:0:b0:2cf:e445:295f with SMTP id h16-20020adff4d0000000b002cfe445295fmr3028305wrp.61.1678918686383;
        Wed, 15 Mar 2023 15:18:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4181:67:6e43:6a9])
        by smtp.gmail.com with ESMTPSA id t4-20020a5d4604000000b002cfefad9c1dsm4258160wrq.66.2023.03.15.15.18.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 15:18:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] matchbox-terminal: Update to latest SRCREV
Date: Wed, 15 Mar 2023 22:18:02 +0000
Message-Id: <20230315221803.4189345-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230315221803.4189345-1-richard.purdie@linuxfoundation.org>
References: <20230315221803.4189345-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 22:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178660

License changes were the addition of SPDX license headers and license
header fixes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
index 802ffa971bf..6b0bf8838b7 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
@@ -4,15 +4,15 @@ BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://main.c;endline=20;md5=96e39176d9e355639a0b8b1c7a840820"
+                    file://main.c;endline=20;md5=7d9d802a36298b5c74440a880e2f4817"
 
 DEPENDS = "gtk+3 vte"
 SECTION = "x11/utils"
 
-#SRCREV tagged 0.2
-SRCREV = "161276d0f5d1be8187010fd0d9581a6feca70ea5"
+SRCREV = "99e6eb7db1b5fef110973d96194eec992a2515a2"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
+PV = "0.2git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.38.1


