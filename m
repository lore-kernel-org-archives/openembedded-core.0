Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B41C7618D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 02:39:48 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.92081.1680575984377385803
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 19:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=sCxmtBAx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id q191so1469618pgq.7
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 19:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680575983; x=1683167983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTBablR4eaFi57CAwxamzWztO9Lj48fFx7VZihqTos0=;
        b=sCxmtBAxt7ZqyyF+l+RJWhPJgCANDji2qpDvlSNREzG9Q70QiK4tlL5yyU2pXCOV6b
         SCVzJ/Cyew33QAc5lwNQRB8q5plm3BXV/Q68Aer7HomYWeomBTGrDvxvf5cvtkpaYxay
         wOhWqhR/+/uYkdDkj67mYORv8It5aP53OENUAN+sr4Z9wcWD+wqfcotQ5VJgzY45H7+E
         gUiiPIH7mFuKiem/PT3IjkYAWrURNhkAi+PWdvXcmJNx1U9cBdTDvRf8fpw5guI+w2QN
         2A+qm8crWtjRFB1JXEfnk9iXAsW+gfItjtF6tCzF4p8kTDZHFRqOLEe2dsoZIEGaiP6c
         jsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680575983; x=1683167983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTBablR4eaFi57CAwxamzWztO9Lj48fFx7VZihqTos0=;
        b=tLUfPf9Kr5iGyRnNmS9Q70BMamFQlPVrKxtv8WPcYADGAvdJ4Xq4hkkpcle1wCMMQZ
         LCnCoT82DBjrAHd6ykB7v12YQtkh3HOq6Jgb/9BQEKwwnyCv1q5WfWqHBhKxnpMzb8+U
         YBlHUgux8qMMpPn8fpsHQxGNx7VX61wuiFITkCLpUC9dlrpZL6sAI1GfcvmT1hndLFzM
         WUaGLc/KZk6waSN2w3gr2wqAvBUK18vH550JVkc/tzx3Y+MNXBUpt2vrvw1P23r+hWwe
         ralCaQZ6BR64DzKIsOL83E4frG0u7IhR+dGSTTSB5siTZ+oArqnI2Aw57lVWh6JxQN4Z
         GSzA==
X-Gm-Message-State: AAQBX9eOC2JghU0IDNkDV+70F7LuXMm47J8fwiZWmDtF4renZyeL+dca
	q4EGaxpcAxvnfKNY0wwsWdQg8CgDiNqFPJkqvk8=
X-Google-Smtp-Source: AKy350ZzNuVBRViGxORym1TLlxus9qORn5neU6nHu2EJuNZZkMiDkfYc0Z3q88Nwk8koM45ftCc9gA==
X-Received: by 2002:aa7:9567:0:b0:62d:b7ad:8071 with SMTP id x7-20020aa79567000000b0062db7ad8071mr693683pfq.15.1680575983394;
        Mon, 03 Apr 2023 19:39:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id a14-20020aa7864e000000b0062deace7c0csm6850569pfo.190.2023.04.03.19.39.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 19:39:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/7] bmap-tools: switch to main branch
Date: Mon,  3 Apr 2023 16:39:16 -1000
Message-Id: <4045bf02bbc6e87a05ba689a63c675e49c940772.1680575792.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680575792.git.steve@sakoman.com>
References: <cover.1680575792.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 02:39:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179666

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
 meta/recipes-support/bmap-tools/bmap-tools_3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
index 97b88ec033..6a93cacc18 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
@@ -9,7 +9,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/intel/${BPN};branch=master;protocol=https"
+SRC_URI = "git://github.com/intel/${BPN};branch=main;protocol=https"
 
 SRCREV = "db7087b883bf52cbff063ad17a41cc1cbb85104d"
 S = "${WORKDIR}/git"
-- 
2.34.1


