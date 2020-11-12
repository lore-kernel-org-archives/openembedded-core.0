Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.7879.1605202097662257005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 09:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=kwMluqn3;
 spf=pass (domain: blade-group.com, ip: 209.85.221.66, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f66.google.com with SMTP id 23so6845920wrc.8
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 09:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hj4o1j5jFAarGGwjYWdoWZ+m6p4blJ1Orw0MCTaAfjo=;
        b=kwMluqn3DQQRW8hdx1Y3EZpSPNcCFmvvFNj6sqsAqYoczt++WLHwFzSBleo6cqen28
         NixwOLF6hWA40qbXs298iQ3K4Hw23eyLpVgllo9LeznrcgtvC7cHUQ4J/6KF02xj2oYB
         PTMd3CSNqD3qQPVxKfXpH52D4V5Og6BfumKY+M19H0LZeCVdJvLhscMVIsxMxASt0mKJ
         eTN9bL6uXWxZu4FGp8jNpVNHcTF/LwehRWxiWv8G5fy1hq3kGDEBFBNA0y0wgQ9s9EH3
         WAzfSIlKZZ2DyrO8ci5RrJI0vuKegG86kIpCJR48oNpSkBZciTvc+X93o+cjfHnlLjv3
         KBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hj4o1j5jFAarGGwjYWdoWZ+m6p4blJ1Orw0MCTaAfjo=;
        b=dgxEaFheadiVgBIORv8ErDKSNR4PwDZ1fzGxBqly123wG6utUrAi62+YUwO+qKgw28
         LE/CIABJ+c6j08fTvBbE2eLEsIUQ4uc0JR0miqR9nP3rm1cdHIlfZrloQs4gIOvsWWPp
         R6vmvSmwuy++9Uqnflr0Rphm7jDUqTlWjGBwpFSnw3Kiqg1MoWSGC2nVNSZXTjnFzrE+
         lA4i5to5KoCio3MryP20I9K7I60s8oUJB1hzA5rmkKvOnB/u/Zw2G9pjLbpSL763Pd05
         NzJv4Vcyf3mg/5EfBjNEwC4OtMxxkvk1rG8smXEvYvPnP5rbIdLjFau7oKgYfbrCY2/9
         I1/Q==
X-Gm-Message-State: AOAM530gQwsK/uaA4+Z966Cc46No64Cxk7TiRnBsSTM5zTiAmiB29kGL
	K7sDDSxDZekkzz3SlQgkRsmxtOJFTf2CUQ==
X-Google-Smtp-Source: ABdhPJz4Ox5KMwx39wGT/ODVpJZahsb3FswvcL3aSkXO4mNujiKN9m+2vRAZJmlDTMISVvd6VpjyCw==
X-Received: by 2002:adf:8bce:: with SMTP id w14mr673710wra.242.1605202094984;
        Thu, 12 Nov 2020 09:28:14 -0800 (PST)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id j15sm8198906wrm.62.2020.11.12.09.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 09:28:14 -0800 (PST)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v2 0/5] systemtap improvements
Date: Thu, 12 Nov 2020 18:26:11 +0100
Message-Id: <20201112172616.784945-1-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

The goal of this series is to make it possible to run compiled
systemtap probes on the target without all the tools otherwise
necessary to compile them.

This series also includes unrelated fixes to the systemtap packaging,
on which I stumbled while on the main subject.

Changes from v1:

* the last 3 patches, whole goal is to provide a systemtap.bbclass
  will be rerolled into another series later and were removed
* the "split runtime material" changes the runtime test to use the
  smaller runtime package


Yann Dirson (5):
  systemtap: split examples and python scripts out of main package
  systemtap: remove extra dependencies
  systemtap: clarify the relation between exporter and python3-probes
    feature
  systemtap: fix install when python3-probes is disabled in
    PACKAGECONFIG
  systemtap: split runtime material in its own package

 meta/lib/oeqa/selftest/cases/runtime_test.py  |  2 +-
 .../recipes-kernel/systemtap/systemtap_git.bb | 38 ++++++++++++++++---
 2 files changed, 33 insertions(+), 7 deletions(-)

-- 
2.28.0

