Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C00C77B6F
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:14:33 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.38982.1680210868702438983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 14:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=EzXA8TFl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id s19so12228019pgi.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680210868; x=1682802868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAA47bl/7Nnx1oif0cmzdaVbaKhrJ4rdtfrAe8lv1IQ=;
        b=EzXA8TFlho7IWiRv1r0WacXkjyt8Oq3cdpqBmTbhGe3KpffkvLD7CORrLTS/w/8juX
         6/TjcubvxT09oA3ljgIvkgCCsOfOn+jnB1opq/ZQJ3UKueS6RWyfj2rpGqqoONKIbQia
         xgf4ZBKq14sEvLuG/qFPxSp0egQ0lFzLJlTJqYs71Bk1DXfPhCai4ZnHct7FMo21il9m
         FQIqKW4tfcc4P6m+uEWr035u7ca61orDHa5yFjSPQdl/D9FYW0vrDrJ4gfbwGMSOkh/V
         t48nfbDW4vg+H2+M408h7Qy3OlwKVpeJlv4autk9FK2Hu2sSvLuZYDpIp/jma38FebJV
         DTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680210868; x=1682802868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAA47bl/7Nnx1oif0cmzdaVbaKhrJ4rdtfrAe8lv1IQ=;
        b=EmmX1FeSlm30IbPguPZYZhAtbni23HE/vzQuySqNQW/0lHBsPswA+Do2awprILfI76
         2hvTHuojFhifXn5/rYTBUkQpvcFE8+8kSwro0FwxvTZHRARLVouuwtScHuFSks69NsUL
         Ty6Dsocjkn0o/3XTs8sHZjRCtIR49qy+nqdZW+IyKuO8BVWgr9udiKlE5ScCQoYBNxPe
         1UsnZoihoVExpQuwieSBSJF4inEUUsvLmVlOfXFGn5yQ+tCnrMmscisP7s0EJNaKfhoN
         MWQ8VYPswerd6Fka4iDbWyrrXfKU3b+gEMF84XDxmeJ3e68+lA+RIXDJmqHpiGgJDkav
         9HoQ==
X-Gm-Message-State: AAQBX9cWbOz7i252BFjGnE9kp0uWdQyBtXHLJeOyFHAXymFtmx/bdxKa
	vipwBXtaaGEKMvP1oVl2n54pKbsXXtJPtBPoGek=
X-Google-Smtp-Source: AK7set8ufUqMX+leuSehDj86KpgkdEM4tX7BEukXfSqCuRkHk1aBO6yt8EcJu5R1hc5xGATp65HNzA==
X-Received: by 2002:a62:1bc4:0:b0:625:d5b5:1e9d with SMTP id b187-20020a621bc4000000b00625d5b51e9dmr22507774pfb.1.1680210867762;
        Thu, 30 Mar 2023 14:14:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c30-20020a631c1e000000b0050301521335sm250661pgc.11.2023.03.30.14.14.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:14:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 11/14] bmap-tools: switch to main branch
Date: Thu, 30 Mar 2023 11:13:53 -1000
Message-Id: <8fe9e9967c47270c869347581dd5c5b31d4fa623.1680210378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680210378.git.steve@sakoman.com>
References: <cover.1680210378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 21:14:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179370

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


