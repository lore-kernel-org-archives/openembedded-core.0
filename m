Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAC1C761AF
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 16:42:59 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.48708.1680453761420653296
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 09:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=EF1zo0S5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id z19so25850235plo.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 09:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680453776; x=1683045776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAA47bl/7Nnx1oif0cmzdaVbaKhrJ4rdtfrAe8lv1IQ=;
        b=EF1zo0S5LwjwAwaAXaAkyWfQjWjjEIZlKZso9sdc4cRKN+NwPbkhIUIufTTsMXsQEN
         HcbZiHBWkauuz0Gl8c5iirxroS8LzLXDnOlU8p1G2RF5rZPYkLyZdfokdTpSv2+LAeBy
         1r8SKf+aeybF4UAP9bjMYa1FJS8r2vhL+ABDM0o1QWgtagHkSvBLjlhEdN5X2n8Jz/ip
         M8xjCMOGwRqYdDrsgz9S+6+dyYNFw6cQ1XcvT+EpALuGIP6IMzi9xsrqoxjwvmbLbLjr
         EzDcIraVeEiLc6YyfaLB8TUwHb/9QFbKG0UiHWinvnfcAzsYG27pHXJkGqgAJZpoHXhI
         SIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680453776; x=1683045776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAA47bl/7Nnx1oif0cmzdaVbaKhrJ4rdtfrAe8lv1IQ=;
        b=Vx7XMoid8i1/RoMA9m6bDg6BWuR1kQpbeq2Y0B6Ld8YLLDqKC37KkTTKuHf3rydkIZ
         N7uSdUbZfCQPXlHV3e+ReNE92R15h1SKW2VzJI9QLkb0TZMVdbncyj1qeY2lOSCWPfj6
         34filw/om3ZUHOrQ7rKHKpf+yi55pOjWA33vDKuGdOulBkwlcnYtfOEKOZPGudn2Lbti
         XWA2hft/ZWYc/7nOxPjT7m/+7Ghjdz8zb3uMTzNiMU4Kkx2ipBfc3mE68bWOG6F7KwHY
         mW8XhG66+IDV640UvucVPgx8CnXFBD4eZYtoWDtQLkpc5v3cysqaEy8BHrivdThfGMl8
         QmJA==
X-Gm-Message-State: AAQBX9eWKeMEiqfZ9HqTInlCMdKm4qwBARXXfZ3IwPVpApcgK6BZAZBA
	MDu7Rkg4ch431/PkNViSU5XB0aKzwau+jjGXPhA=
X-Google-Smtp-Source: AKy350ZJQ1r6jt9W97BbF8brvTaOfu0IkjJYMt0+NVUC+6UXWJqovr2FjuigUPZcmiTjM3oEdbekeQ==
X-Received: by 2002:a17:903:27c8:b0:1a1:460e:6a5d with SMTP id km8-20020a17090327c800b001a1460e6a5dmr29679855plb.49.1680453776112;
        Sun, 02 Apr 2023 09:42:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001a1ddd224desm5042079plb.89.2023.04.02.09.42.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 09:42:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/21] bmap-tools: switch to main branch
Date: Sun,  2 Apr 2023 06:42:12 -1000
Message-Id: <81223013571ccf4730ca1320b7ac0cd54548ec0a.1680453201.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680453201.git.steve@sakoman.com>
References: <cover.1680453201.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 16:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179598

From: Martin Jansa <Martin.Jansa@gmail.com>

* master branch was removed upstream:
  downloads/git2/github.com.intel.bmap-tools $ git remote prune origin
  Pruning origin
  URL: https://github.com/intel/bmap-tools
   * [pruned] refs/heads/master
   * [pruned] refs/pull/73/merge

* downloads/git2/github.com.intel.bmap-tools $ git branch -a --contains c0673962a8ec1624b5189dc1d24f33fe4f06785a
  main
  release-3.0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 369fee186d6916322b9be9d936b654d0c5910cb3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_git.bb b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
index 78c51e7731..89b7bf2b93 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_git.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
@@ -9,7 +9,7 @@ SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/intel/${BPN};branch=master;protocol=https"
+SRC_URI = "git://github.com/intel/${BPN};branch=main;protocol=https"
 
 SRCREV = "c0673962a8ec1624b5189dc1d24f33fe4f06785a"
 S = "${WORKDIR}/git"
-- 
2.34.1


