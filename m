Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854C4C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 23:31:57 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.4962.1635204716423230381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 16:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gXyUsIfe;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id n12so4315446plc.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 16:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7WY5qcfX2LaQwR7Al329plxs4ef58CN05n+GfNu3oAs=;
        b=gXyUsIfexeXBYkSwiFWQEZ+/9oBCXai8ZkSfh8qOR+kR3hr0ue9Jg1f+9rFzhpF26H
         eRrP9tNvOLcJE9VGnwbwBUmZaaPU1qhTYYRCuKFXstnD8FBolResFyJr3/gvVmRmnKik
         gaNQpGhiWsiGOmsdFu7QYqGpkN3D0kmFBOFApEmEceBYZ4ddPDEd8wFqXebCF1VMp2jM
         jnVfsMCzi49xb7t+Y/4ycks1UN2AvSY89OxaKyjVE3YnQDLd1porNF8riz9BLiL7DCj3
         UoPldQchFWKCh3Ix3gqstP6nOY8XjaWXjmetNZNVlOnFHTEDYpZHYJ5aB336lTj+vsE2
         4HFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7WY5qcfX2LaQwR7Al329plxs4ef58CN05n+GfNu3oAs=;
        b=Zrij9N2B7nGbNOwkDrzuWs5ihaAd9LJIe8mPhjMJUZmFHbsYldUkreb92OA9hD8Nzu
         uf08/5Pxq6YTyEvfZ4ZZ5BPSlqrdmad5ML2MpQE8DpnVlvR7hZW12DRb49jjCdpJXhwY
         mKjUHbVWMTPsNg9fPKT3a1Y+5P7buy4PKkaTdIchiiBHgAwt9QXaVBNdhT2JwRzL3bfz
         mOX8T7w+2Df6DyHL1KM4eboc0eoyIlQoPB1MYpbET1XR7vzwSWeYl6TfidB9vZsNe0N3
         512nzifTlNJuNqiXvs64sGI4xgvyWPzs0B/NS9Nzpt1keQncxXihrF1PVLW0YqhG+duS
         R69Q==
X-Gm-Message-State: AOAM531P0sVFtCjdhhgim6mgDldek9XfsR36S8y90IwlkkRkaeE5OZX3
	8XunZdm5dJK/B+/tZ8pf12aWC7l/AoG5G74WEh8=
X-Google-Smtp-Source: 
 ABdhPJyrIrpGo+g6vG63Iftq55dPkdK13kWeMtfcrbFb2d6jSkwCPYzjx627D1giXYHN5XT9LxVW1g==
X-Received: by 2002:a17:903:2306:b0:141:5162:296d with SMTP id
 d6-20020a170903230600b001415162296dmr878584plh.57.1635204715126;
        Mon, 25 Oct 2021 16:31:55 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm20383990pjt.21.2021.10.25.16.31.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 16:31:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/4] Patch review
Date: Mon, 25 Oct 2021 13:31:41 -1000
Message-Id: <cover.1635204568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 23:31:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157368

Please review this set of patches for dunfell and have comments back by end
of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2804

The following changes since commit 62cdc20a2186ecd54d3a7131ec8f6937aa0229ed:

  uninative: Upgrade to 3.4 (2021-10-25 10:23:54 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Joshua Watt (1):
  classes/reproducible_build: Use atomic rename for SDE file

Richard Purdie (2):
  rpm: Deterministically set vendor macro entry
  reproducible_build: Work around caching issues

Steve Sakoman (1):
  selftest/reproducible: adjust exclusion list for dunfell

 meta/classes/reproducible_build.bbclass      | 24 +++++++++++---------
 meta/lib/oeqa/selftest/cases/reproducible.py |  5 ----
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb    |  3 ++-
 3 files changed, 15 insertions(+), 17 deletions(-)

-- 
2.25.1


