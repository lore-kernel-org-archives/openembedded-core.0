Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAF5E63FFD
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 21:37:50 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24907.1775338669223517294
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2026 14:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S5tJPl4X;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2cbdd9852aaso2350108eec.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 14:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775338668; x=1775943468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xr1b5rcUwu21IXXvs4LRA4xxvi4L5/MRG0BgckCPak=;
        b=S5tJPl4XUNYjAMUq33Ra2rp9wy66lFwrWqmyuYDViyyKCyO2aTEImbJa05NZ9NLNtW
         9hLK+RZni9oWRrXrLlxEy8FIDA5UwoNqvFeXm/bCZvoJ3feUtY2YGb8HIFA24N76yM34
         eOe9b3Ewc/xRWjGlxsRqalb+Nhj8YhkA1TcsV87ekf6DssWoHvMEHZakJ3Sn4cGMS2Y/
         ZEK+QtQL2Gu/FByCXHYzyfPYlyqjwMqmcSV09mIOGCpegPWsYSWYj7d1Y+/aIc2o+jgp
         oKYUw0GMdpYFI/WmaMiDzPTtvHXix9fj0EY419ijMi6ZFpQZ0CNchBWb/PU+p2QlbFuJ
         uJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775338668; x=1775943468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8xr1b5rcUwu21IXXvs4LRA4xxvi4L5/MRG0BgckCPak=;
        b=h6nT54/NZ5ZohPUHRBAhwwE7quCpeREy1s0vePTCg3zQWOsWLHThWgdXfMvBOI5HsH
         B4CjfM21P7uT6EkKOlYkmC0/NEfukxkgnuN57TFY6yBL3auTtvkbb0NaXk6CsyBkpExb
         32UPAQ+x3Itww9vy0b5jzOdVwvJlPqSKeZySlhh7daVF5lpO9wWov+2Zlz9LS9yqbttM
         KkzRyGq+T99KTFyQQIIUzNbIpwyVnGSghBL2hJ1ss1+bvIcP9XGhKjrkjPOu3/7WBrgn
         wFMwsMNVlIBlgZmSA3fAteUFVNoMHlyHC2FTLfDzl0gUEbJyiGmgzECBiZTNkpadSbop
         UZiQ==
X-Gm-Message-State: AOJu0Ywf1Hzr8tVfQmnndL+maksqxneP0acGFEYI+H+dspbx7oC4E+Y5
	oWPek+hOLTM2PDaE/hHtS/34kQbAuiafFOL3m8fDu91YW4UxRbhJLhLKvRUTwuwe
X-Gm-Gg: AeBDievOVo17FnggkCZgbYp5fJcVnh3LHlmxtmI9NwkcctCLk+ephhyPcbKDdy2Yl/s
	QdCMRfd3BIt/sSDIk5LdfXOG6EVGSZkemur2AnZIfLNVcf6yMVDtoHeyTY6feNM4kC/CKhUiP59
	6WJYIZMiHacJRX6fgcVI341vo5m6JBUbuUPAdumwuxiG2m1rop+Ri2tlLey+iynUrq+hwTwz0Lt
	6BrxOtW47x6IORTWqPzAYRW5Y1x3Uv8BWbwUvET+Lf87AWcs2YN9jxpDZbFvP/4mCohQp0LWX+1
	qYjdsILBB8kiCQiyWOpGAdTd6PhXwbMPU9R+yaN1KC+RhQXXTAt1o8aXQjAr2GJZ4rvrD9NmOwK
	HxYJp+XGgKkF50ZXhC+jN0dPXOTBN+D9zmdF1AkG3GQzw8eZvkF9HEi4swFjC108XfUGm3gm2JT
	NPzNY9Bdo62pSWH3azL+u6adJxJg7PH/knxcMrgLes7nOIG84FNbfShiEVeMS2kGUJtdVtUuMSM
	xvZ92IeOb69KslkQtW8rvsDSe91Ros7lcU14Zi5bZJvkCBo34exehk9KPeu7Po5tYxt9us=
X-Received: by 2002:a05:7300:571e:b0:2c1:7afc:df06 with SMTP id 5a478bee46e88-2cbf9afc9eemr3610432eec.5.1775338668310;
        Sat, 04 Apr 2026 14:37:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c3010e9sm11855740eec.14.2026.04.04.14.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:37:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 2/2] libxcrypt: Use configure knob to disable warnings as errors
Date: Sat,  4 Apr 2026 14:37:44 -0700
Message-ID: <20260404213744.3245076-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404213744.3245076-1-khem.raj@oss.qualcomm.com>
References: <20260404213744.3245076-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 21:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234623

Passing Wno-error via environment flags for target and nativesdk
is intended but is not effective due to command line ordering and
as a result some patches have been added to disable particular kind
of warning as error. Given the scenario, warnings as errors should
be disabled for all builds, this makes it portable across hosts and
across compilers ( gcc, clang ) and glibc versions.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 834f6e0c7a..a86735255f 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -17,9 +17,9 @@ SRCREV = "db70b42bd7b2a5b00a8580c8dec0aa66791c950a"
 PROVIDES = "virtual/crypt"
 
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
-TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
-CPPFLAGS:append:class-nativesdk = " -Wno-error"
-CFLAGS:append:class-nativesdk = " -Wno-error=discarded-qualifiers"
+TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
+
+EXTRA_OECONF += "--disable-werror"
 
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"

