Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3B9D116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 13:54:50 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22018.1764597281322843311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 05:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ft8/28hn;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so3013189f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764597280; x=1765202080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8qqVOVm7zh8N6gcm3j39XgpeU+tQ36LDzFFATcTxYe4=;
        b=ft8/28hnBSyM+Rpej0iKHH/XOuFKF+yPum8EYDdB9bnC58znwxPqk9YPvRb3xUfv1c
         pWIk7mbybeBLWY9SVI/1Q3MCaQVh1d3KQvBX8IVEILS0pR5EeHpt9FWf7AHMf2kV7yUa
         F6GNkVN+NljNrnktvlRpzxwbJVKgiZELkBx5hjCQHjKEe0/omp+wSymwoxKNowP83DXL
         U+Wzl14a4mpbPVQR8ZmTsyimjp6MEGG59Gh0VRpaauvu+xoEzqy14ZAe+2+qgH/kPSKx
         A2xp8+HyYLENWGPb/Mk3u+R81h+V4rSRh9snTUFbHm97ZNmp12NvTDge7tTy+d4nWA50
         yOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764597280; x=1765202080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qqVOVm7zh8N6gcm3j39XgpeU+tQ36LDzFFATcTxYe4=;
        b=oFHFvyosVPPYLy9ATRZ9b0zn7T+GiiNQhj2vW081pwkEMT1K2aE793VLBApfFZvDAx
         LNTyHBb1FUDyKsBpz9e79+o6GbZRyI+4cIG7GsdUvTpJcWy1R34kHNfM15N4OAvGSyG3
         Ba4aCc4LHcfHO6rlciXM1U2E1t4gx0xsTwTkEN7t4LaVqWfS3C0s5eUEfAL39+MgVoiH
         fDn6ugCLidxupDqCxWRCQY4fQ6urtGRpWDCq4312uq7ixMrH/x4CQOiAbvuKoJGgdicC
         4aOxLVnGXg2vz91xbXqn6dAWJLHD2YYpD++LuMaAGFs6lmVwID22Qw0qKwHQEtsSDFup
         VEwQ==
X-Gm-Message-State: AOJu0Yw05OFaNkIEPK9h0LJIr66JmjWPiDz8oCenJSeXPie0mLvWVNh1
	pzougcuoCDLab15B+9XxBWH4oG9trywtV466qdUXwi3lEylQpmBcfrah1vPiJw==
X-Gm-Gg: ASbGncsWogkWld279cZBO37kmQQCxwM6bCDChBlgoecBpSZBXdpJPg8NtjI3XVaQlpg
	7scoR3OEM64VBFWJf8CJs9fGCH2tkKJfToyZsi1jgBQ+eBAM7irg9rCE6lGTTooT4kRilkaF5J/
	/xE0yYFnnk1SLGyfDVAULMld61kNZ7iO+rSLCu2RF50N7/xwV+F3GbUII/Zi3j8EhczDmk7aSSn
	m9iyUsKrxob8MrLOj+R21FC0hj3c6Ce4KNurv2GXSfPHCX2B/tn3mvd/VdxC1xVKHgMVQP+75VD
	+TNMfuk+yxKMCypn2QPcroy3evdLKxvZCMgCdZnZTGKHYJowazxTr3cP+V/fI9ERWpWncUSf7U3
	Cilhu0bDkvYnTMIz5qkTRvq7593/OmnrVKHavCpqIsZ+Ub5rWfdHzNGs7plDNtzcqboTF//jWQq
	v33HHhw6F+
X-Google-Smtp-Source: AGHT+IF5lrVoMyqKa8AyC7Uzk3pRQ4YO/0sd68V4Y8o/xhvwwORkAZrT6JOU+vZ8p6atHXHHZ5chWg==
X-Received: by 2002:a05:6000:2410:b0:42b:396e:2817 with SMTP id ffacd0b85a97d-42cc1d199cdmr39257378f8f.40.1764597279432;
        Mon, 01 Dec 2025 05:54:39 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c81sm26835917f8f.3.2025.12.01.05.54.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 05:54:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] systemd-bootchart: update SRC_URI branch
Date: Mon,  1 Dec 2025 14:54:38 +0100
Message-ID: <20251201135438.2596961-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 13:54:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227126

The branch was renamed from master to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
index bc3eee2093..98237aba65 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-only & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https;branch=main \
            file://0001-architecture-Recognise-RISCV-32-RISCV-64.patch \
            file://mips64.patch \
            file://no_lto.patch \

