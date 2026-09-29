Return-Path: <jason.stasiak@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D60ACA5FA7
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 20:51:11 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6787.1790715070917895013
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 13:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c8tCpQQr;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: jason.stasiak@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3115c4451c8so1041715eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 13:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790715070; x=1791319870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fENSBuI6Qq4x4zND7skr+wb0FxwmhYYPLsmuVICpDEM=;
        b=c8tCpQQrLrq0t9wGMbyG+7NGEdvC/WYJ0F7VkogL+F7zHNjdOOrcyQOZoLMay5prht
         aKD8AdFPTwsX6yjWz+8h9u0JZNHDnqMdTKxCup4/T1bEhpZ9WozsB2irlSh90uNVEgwj
         9pZxWm3rEfB3wM0o2K9vqedVshLtnXLc4fT5Ut44kQ9u/tgikLNHSbroxC8wQosaDokx
         EomFbaaMckOfibSU/0XPn5LhnL1ZMnzpgKQMWr9zi01jnd+oW15NwptKA+cVMM/gMDmq
         1dAZ0AixR6p5lV+vj5Zo7w7NzG6KuVVwnFBiJIJ5D1wPXziE14xA33zWYBaCpQy8IqCC
         Stlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790715070; x=1791319870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fENSBuI6Qq4x4zND7skr+wb0FxwmhYYPLsmuVICpDEM=;
        b=T7mklP+tUW0qXUHgbaJmohcyzEtnUfDMywpVLR9Duzh5ObitFhCDIGROnskbTpw9YG
         vp+cIdOi9MOaPPC+jNxQngsgSkpX3ZS0YwvWEHMRndQzi+IDoiz0IHXq9HH3JVZBMZon
         vxpWvWzT7drem3dXdS4HUQ3J0RQKANi0R9wIqruuNB+ABp0HyYp1NsExahLni9lG4V2j
         1pqvZpp2D2lY3wpXevjrABENBuJ4qgAc2Cx1ajnk0hfF96ffn8ss/pXQ0aPL1qPogJcd
         mJ2lTcIEhtz7OrxXFaA5Q+GfGgpQNedhi3feXmcDKBxwNExS3pg7JFXCueYTbMH5JAck
         eaZw==
X-Gm-Message-State: AFq9FYJPYfprwjMb/SRVAidAq78zJCS7GVhAAhXqHhaIaWFuEcSocF/X
	hgN8RpjeuUhmBxe+D89ajljWm26eMAfjCJUKSf6mQGGlAG83im8LJ19Q3/ictg==
X-Gm-Gg: AYBFou0IdLh+hc19vzVQTs+tRKERKz5bqyi7QgwRwH8t9luXkflhrt+5fn6fC+trl1X
	R1cKKRYpYSXoYH9vb2OBgc2mEN2hBndCJcdZRKSk/dxgE+t1NRJOIixhw3TWFDIJ1zL4Zb9IjTr
	8dFT/LxOa/hSlzPcjS/Z8p4wDdy/+E8ZVb/1HNN88p6goj5PA4kFInMFkA6x0LQLLKG3UfiitEE
	IHt6qF0ghj+jkB299Oq+iGy+1ZvOjSeFUUfmRn6NBYNxKsdxtiXGSiA8YA1c+tDfoEc0OPKzaBu
	hdgf1rUU4xC8auRTGeSTpr5BrF1XeDFzpXKyTN2ceIVAfWGHS9LvR3F4uY2DaiiPiRxDLsKcpRP
	RZwtMbPPbgjyoXCzulpdDmXuUjGbgNKBgl2abIjtApdgTbELfXffRgfLzZxY0HS0rsnVFkpDM7l
	8VMtMLlRjk7ILt6woGcG+9Q7Sie0f/iBtJP0Bga/COoxH7PIQR1oHkouRn/EU9OL5h38XoqG+cr
	xgvoc8QcoOoe55oLPru
X-Received: by 2002:a05:7300:ff44:b0:33b:ecf4:7f80 with SMTP id 5a478bee46e88-34af9409d53mr3983374eec.22.1790715069952;
        Tue, 29 Sep 2026 13:51:09 -0700 (PDT)
Received: from CHA-FQKPM83.ad.garmin.com ([65.175.40.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c378c9b64sm2655843eec.6.2026.09.29.13.51.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 13:51:09 -0700 (PDT)
From: Jason Stasiak <jason.stasiak@gmail.com>
X-Google-Original-From: Jason Stasiak <jason.stasiak@garmin.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 0/5] libsoup-2.4: Fix several CVEs
Date: Tue, 29 Sep 2026 13:50:50 -0700
Message-ID: <20260929205055.2403390-1-jason.stasiak@garmin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 20:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246893

Backport CVE fixes from both the upstream Yocto Wrynose branch and Libsoup3
repository.

Jason Stasiak (5):
  libsoup-2.4: fix CVE-2026-1539
  libsoup-2.4: fix CVE-2026-1801
  libsoup-2.4: fix CVE-2026-2443
  libsoup-2.4: fix CVE-2026-5119
  libsoup-2.4: fix CVE-2026-3633

 .../libsoup/libsoup-2.4/CVE-2026-1539.patch   | 104 +++++
 .../libsoup/libsoup-2.4/CVE-2026-1801.patch   | 217 ++++++++++
 .../libsoup/libsoup-2.4/CVE-2026-2443.patch   | 390 ++++++++++++++++++
 .../libsoup/libsoup-2.4/CVE-2026-3633-1.patch |  51 +++
 .../libsoup/libsoup-2.4/CVE-2026-3633-2.patch |  53 +++
 .../libsoup/libsoup-2.4/CVE-2026-3633-3.patch |  49 +++
 .../libsoup/libsoup-2.4/CVE-2026-3633-4.patch | 113 +++++
 .../libsoup/libsoup-2.4/CVE-2026-5119.patch   | 129 ++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   8 +
 9 files changed, 1114 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-2443.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-4.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-5119.patch

-- 
2.55.0


