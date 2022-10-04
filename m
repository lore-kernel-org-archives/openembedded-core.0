Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E889DC433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 19:31:49 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.15117.1664911899724179057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 12:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GcuM14or;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id y136so13973676pfb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 12:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=iMsXKtn8ZoZC4Ts5LInza1iJ2NA2GH2GTs+pr0lZbfY=;
        b=GcuM14or1twmIivUXTtBDD7xvmmeGr+FhQPkRULyJTA8jyr16LhEbkO0zfsHwAujOF
         +9RakJ4rj+ENLg9mytgqbPNn7Nkq8aRpSL4vyh47agHvvcLvfSM0C9QVDXuRuzh26pyS
         4QYFFz7T75O9YLzdY3b56gZTjEk2zfeyQOM8KfiXSbIOEF57Bfv7Z9mEWMQwUIOQMSV2
         DYf75q66fjnEcRGATmbYkd13Tf8acxak5vCloulOabg8W0LbPm4tgGHpNd7UL7uBm14M
         +8qAUCq5nu4wGLMgpN3JL3GkKsRgUVsjS87QhV3uTSfXSpxLUpB1sq3JMseEAD7GKqAJ
         ZeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=iMsXKtn8ZoZC4Ts5LInza1iJ2NA2GH2GTs+pr0lZbfY=;
        b=FfDMmHPzO0QNlSEkXcjjnVbpzTsPOtW3D556H3gFpQUfYO2Scyy6kcWNGznACnMccA
         qxIDhQZuAf78fG/JE02FCjYfo6ntkDB0Gk096b+BP5fKufpoVS/MjRy7NhtB+k2BwSeb
         knF1CK3aEsVc06oSavL0UC2zWjBEkrvbCv8n2RuG05ulo4kC5DJuQiSyp6NyFDnfYfoF
         RkUWD+HloPQOvm347Zdf9497I0pheld8Y4E5W7PbxiXf3x6NAXMlLSrtYhZZsp872elY
         bM4TfFr+LdtDVMMCngAEdwNo2wqhm4ESaD1Y/Z1aHKBQWTr/Qmtfq4rEV6MftpdppAmn
         NT9g==
X-Gm-Message-State: ACrzQf3ubzBzoax+g5Ao+YM58xMoOHDOeofFULOPscW3zBz2Cqnprm2h
	OSfQu+VfKLfdXff6N60LIyH6zwNRNGYlSbk4
X-Google-Smtp-Source: 
 AMsMyM6bJ5xf8coxOb5NP5YEbQFEWmHwfWZaISayPxyRFijfuesKBkhDZDcBcYT6q29G3dDNM7ySug==
X-Received: by 2002:a63:1165:0:b0:44d:e5ba:5603 with SMTP id
 37-20020a631165000000b0044de5ba5603mr10731835pgr.68.1664911898591;
        Tue, 04 Oct 2022 12:31:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a17090302c600b0017828ae6310sm9291353plk.2.2022.10.04.12.31.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 12:31:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/2] Pull request (cover letter only)
Date: Tue,  4 Oct 2022 09:31:28 -1000
Message-Id: <cover.1664911788.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 19:31:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171432

This should be the final pull request for the upcoming 3.1.20 build.

The following changes since commit 7a08f2ae1c12e3511b409c4535d2eab83a27b64a:

  create-pull-request: don't switch the git remote protocol to git:// (2022-09-29 06:45:30 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Mathieu Dubois-Briand (1):
  bind: Fix CVEs 2022-2795, 2022-38177, 2022-38178

Paul Barker (1):
  licenses: Handle newer SPDX license names

 meta/conf/licenses.conf                       |  7 ++
 .../bind/bind/CVE-2022-2795.patch             | 67 +++++++++++++++++++
 .../bind/bind/CVE-2022-38177.patch            | 31 +++++++++
 .../bind/bind/CVE-2022-38178.patch            | 33 +++++++++
 .../recipes-connectivity/bind/bind_9.11.37.bb |  3 +
 5 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2022-2795.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2022-38177.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2022-38178.patch

-- 
2.25.1


