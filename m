Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83734C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 17:52:20 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.55.1668793939158796659
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 09:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W6NsovrJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id b11so5146614pjp.2
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 09:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+zjAi8TyqB98y+UKPiS6Cy944Ajs2/Til0JOErHopCQ=;
        b=W6NsovrJrUwX5f6q52faaomqBT5hkwBDHdr8TZ+3PxDWY2iN0Bqnn0NTlpfg+ld2X7
         27MPJhdA10uRFGBqBh1FOTn3NVOPRk2KIRj79LK8rBa4aXha9F6VlmCMRIKE9T/euPFG
         FRoYuhPQXqSssbyVyTWQCAWSLSf+QgkRYfexsN7fJ5Ks2dY3NXVV1ADX0WiFDFC9XiIO
         DtBnA7QP5e8j255MxWyxak7oHcGQe52nMR7VJRBW3ItQANiZv5RxHFPTd1jf3qiZ3tYc
         x4MVhVyqZAlVW14LyxFTW/IokuEtNKJOwUAhXAtQxNWDy/Xwv5jDRkIrdP7Ply0spNas
         qpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zjAi8TyqB98y+UKPiS6Cy944Ajs2/Til0JOErHopCQ=;
        b=hge/V8GJzbKqia2JJa5Bq1N8h5CDQxFP06o3oIEtfE7XxLLIZ9599COui1QyCF4FOm
         rGtuAMBbZ/cnrqzO63x4Tmf6MgCDhKx3po6L/Otnqw+ljn/+4sM+fgtIIuE22opYRUoW
         qyMXB04cjdQXLtAnAQncTF87LPNPXowwPUbcJqBMFCS9P6Fm/s9qjlS5NSb+n/TTMekb
         aIb1Xh67n/EGNYXg7kFD3uZFv/DjqN3q8wdgUQ+5WNmGffI18sOuOWCibtdxhP5/2y8v
         JAgwUz4xdnxrCv6OsbkAuhpI7AmCuKQ65RAXt2ifAT56VhkZ/Hgm8c/hCwN0C2HE3ALV
         YsqA==
X-Gm-Message-State: ANoB5pl76pfAclHqqIMzdovA9YAsvX2L43+P5Qdfl0K/SG2CWp2FmwfF
	eLkcu7xUuT6Kgp03OPkHo9NjacSdNKmtqQ==
X-Google-Smtp-Source: AA0mqf56uE7oNAAVj4uVMeraiZHyRFFFnzO6vLFT547CanPrwjCPMSPUOIJO6jThHcd9eI+PEPI/cQ==
X-Received: by 2002:a17:90a:fa8d:b0:218:8666:e780 with SMTP id cu13-20020a17090afa8d00b002188666e780mr4218475pjb.3.1668793937830;
        Fri, 18 Nov 2022 09:52:17 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:6693:e191:c3fe:39ff])
        by smtp.gmail.com with ESMTPSA id k28-20020aa79d1c000000b0056c702a370dsm3443173pfp.117.2022.11.18.09.52.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 09:52:17 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] liburi-perl upgrade
Date: Fri, 18 Nov 2022 09:52:02 -0800
Message-Id: <cover.1668793524.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 17:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173482

AUH has been missing upgrades to liburi-perl because the author changed
back from ETHER to OALDERS, which changes the SRC_URI. In the mean time,
the dependencies for -ptest have grown a little bit, so we add two new
recipes and import one from meta-perl.

While we are at it, correct the redirects in CPAN_MIRROR.

The following changes since commit 44bb88cc869f3b42440d6f7aad000e706b739a2b:

  mesa: do not rely on native llvm-config in target sysroot (2022-11-15 09:38:38 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/git/poky-contrib timo/recipe-upgrades
  http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=timo/recipe-upgrades

Tim Orling (5):
  mirrors.bbclass: update CPAN_MIRROR
  libtry-tiny-perl: add recipe for 0.31
  libtest-fatal-perl: add recipe for 0.016
  libtest-warnings-perl: move from meta-perl
  liburi-perl: upgrade 5.08 -> 5.17

 meta/classes-global/mirrors.bbclass           |   3 +-
 meta/conf/distro/include/maintainers.inc      |   3 +
 .../distro/include/ptest-packagelists.inc     |   3 +
 .../perl/libtest-fatal-perl_0.016.bb          |  36 ++++++
 .../perl/libtest-warnings-perl_0.031.bb       |  39 +++++++
 .../perl/libtry-tiny-perl_0.31.bb             |  36 ++++++
 .../0001-Skip-TODO-test-cases-that-fail.patch | 110 ++++++++++++++++++
 ...iburi-perl_5.08.bb => liburi-perl_5.17.bb} |  34 +++---
 8 files changed, 248 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/libtest-fatal-perl_0.016.bb
 create mode 100644 meta/recipes-devtools/perl/libtest-warnings-perl_0.031.bb
 create mode 100644 meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb
 create mode 100644 meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
 rename meta/recipes-devtools/perl/{liburi-perl_5.08.bb => liburi-perl_5.17.bb} (65%)

-- 
2.30.2


