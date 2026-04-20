Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792FDF36C3F
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 16:40:30 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24397.1776703185010706360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 09:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fZ2gj5xk;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: zizuzacker@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ad21f437eeso21283415ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 09:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776703184; x=1777307984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OZYwgu24bdKb/5wB+kYLqGXgXE8oW+z03WiRXHMVe+A=;
        b=fZ2gj5xkj+j+vU7bqdlXB+FEx0Dp3qyOqGsWA37KGceALfIcgPciFzTQhtWomCda79
         TsoRn3HETJYuDU2LZshKUQzCEtIk6xeTXmkEM69cmLS23gOrzE4/6z9UvzlGesvgHTwn
         o0doi5J8w7rUC4HyWWEthhWdkoETwlPT1A5lsqR8UdTuNnMk5OVqKXL6p05gOSkVg/ld
         EkURL/SRNMXV9LnHbvdkFGW6WRRR7tjXA0piIe4yiQiAb1qMTwYsXa7kcFpWVswR+zkP
         tRWS8kOLHKyKkftjwNzpM87C/w1m8vjtccs17EeNybwamI2LZN8ok7Osw0NzTHa5CB2O
         d/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776703184; x=1777307984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZYwgu24bdKb/5wB+kYLqGXgXE8oW+z03WiRXHMVe+A=;
        b=K64lHmJn+uAKRuGRHhhJoO6N0AZDLBGWK8jCsgkhWiKhtMl8eBR/TcPvSar3+5CRkL
         WQQEUpyuhZvHZ61XM/IoMNtvJt0dUVhXVYr/6M23uHTZdNe0wLg0XQyfXVJUXszmRXkk
         jFDLVd0a5nlTBdD8jK16nKthxI6biSmr2EHUzqYGHHO5nRDsr1BvBA+Vk02nAPDEleeg
         +KfUQWH5hwNtYyRMrsgmKKJeUBxsxwWY1rZQxt072AAxmsnsk3sbbqd0AK37pkF//2F3
         M1qVmPHoO2sxcE+MdTGhn8Ma9HsR/sGLgGhUvWaoAKJ/eLGmSvMZvfM49jeYr3PRaqDE
         MDog==
X-Gm-Message-State: AOJu0YzJQ/i5Z/sB/baJ5dAcpKSasF2ogB4VgYSABM+/hAJKBr1TFstd
	mtfro6JLxgYPUsjhgwoeRxCoXbHVjvI34nEbaIs/TI04IjkYtqVQrzpaFLB5Jg==
X-Gm-Gg: AeBDievUecXul7u0lI0CCZlwq/BQC9cVc6GpB8J4yLLVfrr/IaurQm0mAmJyYL13Tdd
	H2b8Mv0dEkZMbkH1GKkgt2Pk3cG+ip+LQLE+NIHHkxZPpyHnWTlngw6HF43xsSz7sKhKAj0VZ2k
	0+dTkvs5v+BWFesoz7wFe/pW+KW4dq8YXPfVqdr/ZanFuPnoarSnpF7UahuD1APhT/WIhVXesdz
	s8RaDe6hpVtydS+weoZViro5FsmSYAfxBJAa45fzGUEamwwgMTIJXY9cHZe9ZjTb6fCZDGez+Fv
	0MXVK+z4B1W/hxuHjHC2CSmfDvBeQnFruM2KJrBoSgnFpWy2xfz6hegv6+oKKG372R6WPjFh/Vu
	DC8YDcbQ0zg6WsPVuYn1ngSgiq8RPLJy7m4ExowI/QOYK23FV+GEFn4HlG6R2MHASPxp9846msa
	/7LjBvQfNyFpjaG7AWfPXWDFyISbSSGWh0TKTDo0UHvkDZ1A==
X-Received: by 2002:a17:902:ebca:b0:2ae:4d6b:b2c7 with SMTP id d9443c01a7336-2b5f9df38c9mr117282155ad.9.1776703184211;
        Mon, 20 Apr 2026 09:39:44 -0700 (PDT)
Received: from localhost.localdomain ([42.118.25.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9fedf0sm129221105ad.6.2026.04.20.09.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:39:43 -0700 (PDT)
From: "Zk47T" <zizuzacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com
Subject: [PATCH v2 0/3] useradd.bbclass: fix parse error when only USERADD_DEPENDS is set
Date: Mon, 20 Apr 2026 23:39:37 +0700
Message-Id: <20260420163940.182918-1-zizuzacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 16:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235576

When a recipe inherits useradd and only sets USERADD_DEPENDS (to depend
on users/groups created by another recipe) without creating any
users/groups itself, the parse-time sanity check in
update_useradd_after_parse() unconditionally throws a fatal error about
missing USERADD_PACKAGES.

This series fixes the issue by skipping the USERADD_PACKAGES validation
when USERADD_DEPENDS is set, adds a selftest recipe to exercise this
code path, and adds an oe-selftest case to verify the build succeeds.

Changes in v2:
- Added oe-selftest test case in usergrouptests.py (patch 3/3)
  as suggested by Ross Burton

Fixes [YOCTO #15863]

Nguyen Minh Tien (3):
  useradd.bbclass: allow inheriting with only USERADD_DEPENDS set
  meta-selftest: add usegroup-deponly recipe to test USERADD_DEPENDS
    only
  oe-selftest: add test for useradd with only USERADD_DEPENDS

 .../selftest-users/usegroup-deponly.bb        | 25 +++++++++++++++++++
 meta/classes/useradd.bbclass                  |  5 ++++
 .../lib/oeqa/selftest/cases/usergrouptests.py |  6 +++++
 3 files changed, 36 insertions(+)
 create mode 100644 meta-selftest/recipes-test/selftest-users/usegroup-deponly.bb

-- 
2.34.1


