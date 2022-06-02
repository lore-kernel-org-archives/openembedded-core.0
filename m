Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14BACCA47A
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:52:53 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.1502.1654188747732108168
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HR/ZJZSK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d22so4967583plr.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gFdJmle6sBVlNvoYJg1HU9ERoQn71czKUHC5DBYrgc0=;
        b=HR/ZJZSKhkP8/jywXE5HE5r+eBbmShikqLmaWCNq+RkiEjHP/e8NJTlggKoninPffX
         1hnuICSJ9FebRPRXWTOVcf1S89af772p/mnrfNbsG5Y9RnMurHn20naghjlbso/R0Lhj
         TSajzQ9V5+jUq7c9ocU581D3nqQrC9giMX5SYYHgm4tDWuI9JSeHnBilgCmow3znR2cI
         eLxI08bNJvWX8yAD2ETadHHTZh9ufkyr0pHCrSAUTozq0GE3ZCY8o7gFdbNHiBgDBis9
         NCJDtFUB3oXtXiWDkn2zWUL9TLUumsTE2paE/KuT0dzuKMVm3el+5TI4o+8UX1HxHGNL
         hg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gFdJmle6sBVlNvoYJg1HU9ERoQn71czKUHC5DBYrgc0=;
        b=tzyYQ4dr8IaYlKtpzIuv6nY936ke51zOc+T8+JrIjgQ5wl0JhyPcKNrU0STjwkf192
         rmDblL/xlayO51+rxkB6hAMY12NLmCIeDA/ctaKtg7qy169Emgm2OE+BaJGxTJp9OMbz
         jUnz+CD/IFZVzFyCCb96fFbHWR40mv2JK8+DL8pR4JwkSeN+3wkobZtj1Kez2Veegvya
         LAf2iyUoEapERkzaU81+T/ookZw2xwXuXUJJGf9ezRa7BJfdBB7T00081Q+5Y1zwIooC
         2n7VhwtQA7YJV0n0ifQ/QtAtOzBCqnf1wrKh+RksGWBz3wGjEweinU0UAr9MT/+bGxCy
         4HFA==
X-Gm-Message-State: AOAM5320Dwh6CqbzU7UJtAv43lZ3Wz7YKJnDyKZW+XG5o95uqlKmlbLo
	JcrGefvQh7SPwbagj1wTNx/xYktn/ZDnKbns
X-Google-Smtp-Source: 
 ABdhPJxq/cIiLftPbSC27lapfmUvhHj0U8SQ5Aj8b3S7YF1askOGMkqa8v9VPPG9nPztLadKeAzSug==
X-Received: by 2002:a17:903:240e:b0:163:e057:6cf9 with SMTP id
 e14-20020a170903240e00b00163e0576cf9mr5697351plo.29.1654188764418;
        Thu, 02 Jun 2022 09:52:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.52.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:52:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/26] ncurses: update to patchlevel 20220423
Date: Thu,  2 Jun 2022 06:51:46 -1000
Message-Id: 
 <862c1b109cf8f31522a250cc9ff4146fe526450c.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:52:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166491

From: Davide Gardenal <davidegarde2000@gmail.com>

CVE: CVE-2022-29458

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ncurses/ncurses.inc                         | 2 +-
 .../ncurses/{ncurses_6.3.bb => ncurses_6.3+20220423.bb}       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses_6.3.bb => ncurses_6.3+20220423.bb} (77%)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 7a7c7dd227..1abcfae1fe 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -2,7 +2,7 @@ SUMMARY = "The New Curses library"
 DESCRIPTION = "SVr4 and XSI-Curses compatible curses library and terminfo tools including tic, infocmp, captoinfo. Supports color, multiple highlights, forms-drawing characters, and automatic recognition of keypad and function-key sequences. Extensions include resizable windows and mouse support on both xterm and Linux console using the gpm library."
 HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9529289636145d1bf093c96af067695a;endline=27"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c5a4600fdef86384c41ca33ecc70a4b8;endline=27"
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS:class-native = ""
diff --git a/meta/recipes-core/ncurses/ncurses_6.3.bb b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
similarity index 77%
rename from meta/recipes-core/ncurses/ncurses_6.3.bb
rename to meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
index f0256dad22..f67a3f5bf4 100644
--- a/meta/recipes-core/ncurses/ncurses_6.3.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
@@ -5,10 +5,10 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            "
 # commit id corresponds to the revision in package version
-SRCREV = "51d0fd9cc3edb975f04224f29f777f8f448e8ced"
+SRCREV = "a0bc708bc6954b5d3c0a38d92b683c3ec3135260"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 # This is needed when using patchlevel versions like 6.1+20181013
-#CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
+CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
-- 
2.25.1


