Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA419CD4F24
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 15:03:45 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9835.1778684618427559682
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 08:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hTRVCJYf;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-439c3cc76deso825092fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778684617; x=1779289417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZmB0BFogLS6yxRoPa7VdLip39g55OvIfQUMf5+fmYg=;
        b=hTRVCJYfywvVdPapOVMQ3TZy0ytoK4CWMHx10WF50Gg/mT0TY82WiFLqw78o88dcWb
         4Hd+W40CcZNQeHzw0QaY9PzEkZsFvWJZXLwYYY4UU/aKdc6md7V1/99n1fIJOBs8zXlk
         7iI38ZaSVLo5bCY+QPsjpLaQm4tDFYcg7edyXDdydfQjYBKQg3dtEgwbHuQAtjzJEOEf
         +s0Zu7jEllU3nQFimviXJro6M3j/VvKbgC0fEp1v86AuLVaV4am8YgwbpUMTUthwqv+d
         VCB70RMuktRQGpZdOwCdb1kKlldir8DSu4Fcn9WdbMKR13KdM7J8Gw50DIXnXFJmsQhw
         wCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684617; x=1779289417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZmB0BFogLS6yxRoPa7VdLip39g55OvIfQUMf5+fmYg=;
        b=cW7/+IOdsgS2t4BVRs0/So/VtP/njg2YNdM2Daj6/2c4fDFv+X4LP0p4bGLQv1QPpa
         uOKUrLh27/Jt2N8SkRot8A7D1e/phW1U6ma3oWoe7MgQiau/AZJfr2zaZyB5ctjWdMrm
         myVA56qb7YgIpccH9xdsWu7KUcbTVKgvQ8oc3Zc/xkAkOMk1ZM6tKWyP/FBiqndJ/Vpu
         vkuf1d3Dd0Sz/hXWf+s0EOKOEBRdLnOPW+hiAPE/hNhzY5gpzDDEoSHPtJtbLuh+jtqb
         Mss+pbtZMh5V6EpRLpYr2uYjJK6lDC6jr83eQVaw4u9Uokm9U+zipmrt+NgsBGTNJieu
         vQiw==
X-Gm-Message-State: AOJu0YyuKF9SbVyNwikNw5BVu4ciDGl4dnnAVzBkSKdYVKiLPtCOEqBb
	P133E+tZpEIa+uSIbTBZSS2OAWdXWfPZSCsetn4700CqJIwLZajoK9H7ooMSO6uh
X-Gm-Gg: Acq92OFmOSJk0kvqps6m/hQIRe9aUWYp1qM5gTvk4iueivHTwTxYVtNBA5Zhw4LTmMD
	/bAwwu8Qz8fIwnCRI8OInrvRcm9w1JK+WY/NieVyqpZApZaGkh/6EqFTx6oIZe+CO2xWf3pOmGY
	JBnDX+QAfsGsJnBJiLBGfg3IIJBa6KcAmZNKbvbh+2OmROhOnDVF8z6AzP+wYS+Pt650s4v++K/
	eZ3IEvQR0crLzp0xXCjSuK8LXJMXaN2dwJANKf5Y/wEEQWaSYiLosLguNTVqaY3DL5eWg/M4lQ0
	NgBZvARuQVRN6xyqLiCFVIXFGOqucSmGxQjEnxT/yTMjAIRLr+l7VPGAOG1WaD87Ey1mi48lvvh
	jD8/Xh2U54cDYMj4oSFjxTPo5PactLvgITr1mkPJFF1yXpg7UGBNmnrfApAofFnzk4luckHTX+s
	cfLDYq3UAOAA77GJ0gpkpwqbkNp1X33zk=
X-Received: by 2002:a05:6870:96a5:b0:439:c04c:3898 with SMTP id 586e51a60fabf-439ce5fef5amr2057644fac.37.1778684617255;
        Wed, 13 May 2026 08:03:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::c552])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-435573e7254sm14765400fac.14.2026.05.13.08.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:03:36 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 0/2] spdx: SHA 512 support
Date: Wed, 13 May 2026 09:00:56 -0600
Message-ID: <20260513150334.925178-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 15:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236987

Add SHA 512 support for compliance with BSI TR-03183

Joshua Watt (2):
  spdx: Use checksum list from bitbake
  spdx: Add SHA 512 support

 meta/lib/oe/sbom30.py       |  7 +++++++
 meta/lib/oe/spdx30_tasks.py | 10 ++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.54.0


