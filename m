Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD54C3ABA4
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 07:21:02 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.9734.1745479262033113031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 00:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A6Bav6Sz;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-227cf12df27so6533635ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 00:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745479261; x=1746084061; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wc/JZpb9I01WkScxZifDGeny+GfXjxdfvFxjNwbPxo=;
        b=A6Bav6SzctmTuobv+QNe0h2u1tFS1tYdk/qRpezSYJ0JxmWnfYscU/XhWtFaWVZvNl
         P2NRjAN9ORwJuXeSTBkQVl5brGqXsXNjCsY7Hjb/Cx561dx2xZwWa2M8wmlSM2KNvyS3
         Q2Ax4doudc5GJ0mtilBUf7MgYkysFZPClVjLkZb5YrQzRgIV7RP7qc3cM2bOtaNUq4E1
         h50ug1FihajUo/WWBQsd44gtiij0bvABZ3OwOZudpxMKnfc3WOwKYSOqGYVfXhDSM5/+
         QvSquT4a7yV4JC2afe3xCgYim+jHDO6bWDCv3397xfF8A0aehgSMe9oPt8xZZ9ryxZ5d
         chiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479261; x=1746084061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wc/JZpb9I01WkScxZifDGeny+GfXjxdfvFxjNwbPxo=;
        b=nhALbc+OJkBEbj8GRHpGVm8x8pG8TOmvU5lKBwoauWVpeQKnTdPZzEdM5ljXKAKOMB
         eK0tWgPNRixCbDXqyO+HGgmxNv4rao4dQ87soFtnC5ypynIyzvC+o8ddUu0ypSJzYdH1
         C692a61zdMg+Q/FeTbyO2uh7//Dpvm9clothjDFdedTXFG+bmaFDisvrOS9QHim040Fa
         9MLdgUsOyo+Q+7cMGrSfoQ+Z8ReueNACzfUhSbVVewoKv2qqYs4bfWT3kKB5lpkuDFQF
         aT/ljTvSKZ3jd9e1OBSJGumWK6bK8SBlQuPBrt2sCmuNbFbhjwuMGoejYUZXH6hL4nk0
         6aCA==
X-Gm-Message-State: AOJu0Yw74IYYFxq0LTSriOnxexQGjLqI5+F0/kZ4o6C8oxM/8i/mv/ly
	5/nG8GWCeWHZqWnN+nr6f4DjgkfNo1DvUKXRleM+c1VixJJtsw/W7hbYh1gB
X-Gm-Gg: ASbGnctqQ+5ovrhhomY3L1uPulGPSPgvQK+Ioyc/ctNPWuwMB6dj5DghjbiXsRipA9c
	g8855TR38jz/E+iphsWmImIxPPajvd5wY+Kydinzni2yp+J6nvaUE7POsFOh4Ynv+AAb/RWlQTO
	JbadLMk6AUjRxMQSt7NmO+c50XEY4tUr2J5vDOmZE6Y3fB9DyJYw5f5z+/5FPb0qfCYAicny/+3
	pJQ/Qx4/6PD0LpvR9uWXpAOlDibcpybdFbdnGRF0l35VjXRsA+vzY6mw5PjZzEhrsJfB6w8i/kP
	/k7VNZkHhtE0ALD7auMwdihDq1Ks/eFM/hhY3Z3Mjvw=
X-Google-Smtp-Source: AGHT+IFBhQGBmfkxpYTRPaWIXcME90RFZ5ywiadQY90FqhjSj8Wraqv31I6xU0fxKl6wa87zOxsSyA==
X-Received: by 2002:a17:903:184:b0:21f:6dcf:fd2b with SMTP id d9443c01a7336-22db47939aamr19375535ad.1.1745479261407;
        Thu, 24 Apr 2025 00:21:01 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5101636sm6234475ad.180.2025.04.24.00.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:21:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 00:20:44 -0700
Subject: [PATCH 10/11] sstatesig: Handle special case of
 llvm-project-source shared-workdir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-clang-merge-v1-10-5a492a8461aa@gmail.com>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
In-Reply-To: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 07:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215337

bitbake-dumpsig or bitbake-diffsig tools do not work on any of tasks
exposed by llvm-project-source recipe. This is due to it being a
shared-workdir recipe.

Fixes

bitbake-diffsigs -t llvm-project-source-20.1.2 do_preconfigure
NOTE: Starting bitbake server...
ERROR: No sigdata files found matching llvm-project-source-20.1.2 do_preconfigure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oe/sstatesig.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 1f976067631f80d637ba803f49813323d17e7c70..826549948e24571ef57acbe6bc5a2442d6c49f13 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -418,6 +418,9 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     if pn.startswith("gcc-source"):
         # gcc-source shared workdir is a special case :(
         stamp = localdata.expand("${STAMPS_DIR}/work-shared/gcc-${PV}-${PR}")
+    elif pn.startswith("llvm-project-source"):
+        # llvm-project-source shared workdir is also a special case :*(
+        stamp = localdata.expand("${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-${PR}")
 
     filespec = '%s.%s.sigdata.*' % (stamp, taskname)
     foundall = False

-- 
2.49.0


