Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68012C63697
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.8108.1650463749779980446
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JAyTNuZS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id bo5so2040049pfb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=B3hCMvJQwgLcuQIirN3EgdPymlm3h/+yBusrOLKsnro=;
        b=JAyTNuZSnphLgGbHh6bKzJDM/guR+k03w6AsTC3AtTtfOZwUzD27McR0jvyC808aMW
         1J0+mjN8dkN6e0kn7kIVPvKYB5I90s/BNm4Nr2J/cWHz4jur3nzLgX6KfUrirELem303
         Xs2T4ln44uCdcdNKsF8gxmQ9GkGJOFotyTx0UeQxzVzsQdebn1tkNCrd92rXreGmtv0h
         dbBdSeUYL3zx8TQZPgrDK8sHC2se4EEI6vYY81E0iUnYsQmOvh2M2Ao7PA3366RcBu1i
         +RxOc9QlLwAWsgYjcbuAeWYAgSj99kZuuemVlJVN84k0eIsoiih6eiceNRWTNpuSZM7B
         goXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B3hCMvJQwgLcuQIirN3EgdPymlm3h/+yBusrOLKsnro=;
        b=WRwrVez/GS/q8z0M0d2wFY9+z5+NJCQynuCN6fnHuqCh7lEfCNOGMT1U5SflBjM9w5
         tuDA36k8WsVp6Y20XYi9exzM7Zq+1mAhYZPAHbBRR2Oe7ZNJJVqRc7NT0rWRT/TmTaEm
         iuBlHMe3auL8TZdQBi1Jj6pZaqtZwhcDUamPPNr87TJ7/8+iFWL63dzqgUVf+SuU3G6X
         m1DdlqMJfkpgRW1KJovBjdpL3yWf3bJUO6OZOHbEtHAk7XhK2xE/FcJRZKJka8giBRjf
         ogzZfdb52Gyo5fEkZwjOEr42Rgi0V1CFRT16Rg0Gr4fQq241qkzrH9yoYTW5AKYKYTP4
         gBMQ==
X-Gm-Message-State: AOAM532JOnRdTT2SWnny7bSwTu27ST9vpZkUF/uSrkWbpgjH4qka260V
	SZ6LE3auzG49b1Y3jJ2lBjLFv5ciEYZe7841kyw=
X-Google-Smtp-Source: 
 ABdhPJyWoJhWkf1W7xpP6flL2cJ3CXcccvH42fS2fSDIACyLQpaGJeLAW1Jt9YzLL+rHWKeIKAjMmg==
X-Received: by 2002:a63:7c06:0:b0:398:31d5:f759 with SMTP id
 x6-20020a637c06000000b0039831d5f759mr19593550pgc.513.1650463748850;
        Wed, 20 Apr 2022 07:09:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.09.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:09:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/27] ncurses: use COPYING file
Date: Wed, 20 Apr 2022 04:08:01 -1000
Message-Id: 
 <fd9d5f865cad01e7d4c729547a66c16fbb2224b6.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164681

From: Konrad Weihmann <kweihmann@outlook.com>

which has the same info as the in-file header used in before

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8618589c10f85b7a92de01d93180751a804837ea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index a0ecd8a80b..7a7c7dd227 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -2,7 +2,7 @@ SUMMARY = "The New Curses library"
 DESCRIPTION = "SVr4 and XSI-Curses compatible curses library and terminfo tools including tic, infocmp, captoinfo. Supports color, multiple highlights, forms-drawing characters, and automatic recognition of keypad and function-key sequences. Extensions include resizable windows and mouse support on both xterm and Linux console using the gpm library."
 HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=5526f2f3a29edc95538b368a4771edda"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9529289636145d1bf093c96af067695a;endline=27"
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS:class-native = ""
-- 
2.25.1


