Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59.1793464001558294968
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2026 09:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0W3JD690;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: vgharaee@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so9831445e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 09:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793464000; x=1794068800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fZUdUHhDqE1x6R/Utxltt/Bi/ywLA3LrGw3sck2qQo8=;
        b=0W3JD6909WZWj+sSrv/zF8UftvGMyy1xJzIqtT4Eq+l1F37WdaFSpcG1eOsTJGwpR6
         0oVHD6VNeMizM3z6yFwEpqRgx3SIp34RW8o7Bdqre7Wov+77sHF+ChPkGTDpHEP0jbLn
         u4Ao0BTmyG4R880r1/Mhp6vhd+iiMF4UBaL3EH/r/JgVTju79zuK6FhrYiRM6siUIrtC
         /0PUIYSMUPwyainY3HhsAbiuV44L4txAMUWomkBpOVsf+wHu/QUtBE1AH6FRcTcg6RHe
         UZkH+PPt8y3RvofY7mlvcVIu6bNRDioKmD6OIQFqe0FKxSWuTtw2AhrEWT1kyz9k4ca5
         IqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464000; x=1794068800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fZUdUHhDqE1x6R/Utxltt/Bi/ywLA3LrGw3sck2qQo8=;
        b=TXhiIKZ+O8nAUX+Hi/WAgpcz/+wj+Wi5CAhDzLOzszmzMSYuZ80bhe7kXjV3ZWiNfW
         UZPzwWieKwHjLj7U/2QAAkgmzmUo612u49U/zGn7Y9DcReoQYlcjUyQtrobeC+j2IDkN
         Zt60liBwAFRQhO0tHX6NrWWjfTU4yc/Z7NJdtTIegA+xffTvxvWpMTIDzJrhEz9f0sg+
         t7KXk+kl+YSFwP+5MIT2OwqIFivKivO4J0E5YNCkxoIyhlBWAzwFGOgm5fsLPuFhdm2u
         vmwW2Oa0ftL8eZiL4xwPYaPknsAVai9SCdpALi6DucJIe/qK7oAtr5tvxC22C4n8W5fQ
         fXuQ==
X-Gm-Message-State: AFq9FYISSpu1z91OG1LIL3AKv2brs3C0aaPdKtAIaMpTIHWrtikX0C/b
	uDJQC+oQwGAQZABVWRqux9zzHQ8OKQRpOOjjinsZdWnAp5hQMiQeaNY3+5tmOg==
X-Gm-Gg: AYBFou0ZVzy0pCFQYWuUbKce5Kpyi3wChJqJJ/5ydqBm1nKCJGF+9dSz9idQ7JGUT1B
	/ljsReYQt2n763bJ1WVBAhLUolI9jkGnMPNb+OI4i2unTM7d2FzjEfSWQuMqXTwli4ogUebRfX4
	uTUseHXbmvBnBvU7AxvUBotY+qHOfYXHC/bLfCAjr5+8Xv2SAYTDoI36wmzkcq/kCeAT/F3qqkn
	XYmUnP4+QWXYp6dLokWlyVIEUDaV153of/JNA73QNWqw6E+6e+4JCyGKZbVf7RuPAtBIhj5ahv2
	JW5YuRhbjOmPG8jg/siowEczmQ24iDt4+IFFQ0hN5CPZe3gkxgjRLKKSBTwRR3bY159wT5erRyh
	LcTTHcXKlF8lzdn0qe5pNUWzHU03wrRUdX5MhxNKBAsZQpBZ4R9j0AGc02KDHs3NCfk+sRnRQQh
	zeOEzPEWviUAHNezi7cdHLfc97Lw7JfblhYQrbEU4bPlydnSXjODVfgRtaR4HoOSZV10ApvUxcH
	Nh9yCD58xM8ZCVOCD3h8gRMBUPPrQkzepEUItf56HzahrDx+ZLK2WfO0XEslvTVjJ+1Xs/ejnml
	nFY9alZnGqCcNG2WSWqB16UnLixM+YiEuGg7zXMQR15+EOozLpKjIep/NRSPSEav3CFcxRHZ
X-Received: by 2002:a05:600c:1f94:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4ac1548f591mr129257275e9.3.1793463999468;
        Sat, 31 Oct 2026 09:26:39 -0700 (PDT)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.fritz.box ([2001:16e0:257:b301:9825:3e45:cd0a:824b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2640sm214214455e9.6.2026.10.31.09.26.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:26:38 -0700 (PDT)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 0/6] Add multi-kernel FIT image support
Date: Sat, 31 Oct 2026 17:26:43 +0100
Message-ID: <20261031162649.944625-1-vgharaee@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 18:41:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249158
Content-Type: text/plain; charset="utf-8"

From: Vahid Gharaee <vgharaee@gmail.com>

This patch series extends FIT image generation to support 
multiple kernel images and custom configurations. 
It allows different kernels, such as standard and real-time 
kernels, to be included in a single FIT image and 
selected at boot time.

Vahid Gharaee (6):
  oe.fitimage: Support multiple kernel nodes and configuration selection
  oe.fitimage: add metadata for multiple kernels
  oe.selftest: Add tests for multi-kernel FIT config
  oe.fitimage: Add custom configurations and harden multi-kernel
    handling
  oe.selftest: Improve FIT DTB alias validation
  kernel-fit-image: preserve vendored DTB aliases for external overrides

 .../recipes-test/ext-dtb/test-dtbs-as-ext.bb  |  11 +
 meta/classes-recipe/kernel-fit-image.bbclass  | 143 ++++++-
 meta/conf/image-fitimage.conf                 |  55 +++
 meta/lib/oe/fitimage.py                       |  95 ++++-
 meta/lib/oeqa/selftest/cases/fitimage.py      | 352 ++++++++++++++++--
 5 files changed, 604 insertions(+), 52 deletions(-)


base-commit: 5ffd9e055469165d486048cd1f505058dbc35b63
-- 
2.55.0

