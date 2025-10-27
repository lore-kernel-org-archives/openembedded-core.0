Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6429CCCF9EB
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 20:22:44 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.1528.1761596563014025732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 13:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D932nc01;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47118259fd8so38890365e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761596561; x=1762201361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=khqToh7EKIg+nIQBhTzvy8QwXicGWABSud6BWiH7M4Q=;
        b=D932nc013qG7pQJ2Bh4iBkp34Fvziu6LOX9tZa0tvQzYxv0xkegIT9U8z9t7IdkDaM
         0fWUZd1YTuk/jBRobtvkQG3x5n1DsqRyIFg5e2sdnhTkoqr1tVMHZrQPFnKCifHF/GFw
         A6H5hQkN0Njb8rzBGoeBhbZEfVj0fHFa0OwwSF+Dc4NalHivJCnmI7GqO90zAhg+mROA
         Ovzs83Vy8G5iT5m6Xs+ncvVx4TO2UigOwfKepJbGTce3NQZDDASE7Wx5Qo/xhVOfcPtX
         AXaWh2YP0rtkll90+lXRbSRgIoLEx6nsE2sDvwW2JzsJeHj4HTiX0ABUYgMfFmLk/E9D
         ZhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761596561; x=1762201361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khqToh7EKIg+nIQBhTzvy8QwXicGWABSud6BWiH7M4Q=;
        b=XPgAFbhMk75KZQgZyP1S9NZ3CrRS87h2gobbDjkkNPgL48xUrGCTin/DNWA4a3cPRD
         bR/dX4igsRlfXM1sgFsk1lFJ18g8QxQGlKTwNMhg5+OldISYoPs+PZwAYYccXIkYxIVt
         bfJsWLrm187mT/v92BsEHJa5Xlbo3wgB+vP37FLLUIVWc3aawlmMaQmiD91DOG8YSn2a
         doNjYdjlBWblDq9mdd7BgN5G20OZ1XSOZFxDyi+QcrFNdPfbdU1o9SOK1PXuaaG22BnV
         Z4fFUmJOxMlS3e0Da37KB48IIT2ncpVShh+YbDXb9xevl3tnprKTi/P7JiDccYdZCNho
         FPKw==
X-Gm-Message-State: AOJu0YylB0TZTGcrRwtO/LXHqJyTntRuc2V/6teAHTXzWqxE/PIF6oTL
	dqNAVYVBORVZUPYCKltNw+Ob8tPtj9ukytdraiPA5WonEAKUDzas9o6Bt7CJ6A==
X-Gm-Gg: ASbGncsE3ce6dW/xHgCuWcr4ALQRUAGNbXwoKlVweFpVutDbVQPibl9jYD3E3UOA8eq
	3MVqjPK9dCrkR2W0Eo++7Ifl8fZcTzVf+HO1v2Xvso2rr5YMbH9zSDFOYTrikJHb2AAYmXi+Nbp
	z4F0vbS+AMGkFeq1ALeg0Mg3o5k3gURDgs5I0jXSa5S3IYM8/1Ufcrhuzy4co4nwOtQ0b/VAz31
	/1Y1bV55/JjjqgSWwTlEvW/XsJNbgs9xSGjbXiCZaSvp3n8ikJ55wbPkGkn9m1hcwmsIwZxGXWz
	MC8zreERoIDsKPL2kbIFKaAZY2dAaXSAJgNQBDsb5ivXDJJOVvJyc62IXDcqpV8YS6hq112aa2Y
	4naVDctfAp1u81Eg7KQWiEVdUuUdDsPXQq/Dk4KZof3RbBfoWjDNEOtMQQWTqEo5ZUpWBTnYcNk
	KIr6Qbr9vcwC7lvKowAe4=
X-Google-Smtp-Source: AGHT+IHaOBFQnLHyeyvE4XFXXlr+EWCHX8L1n2/hF06iMIn1q2zDAH3+tJkggLS4rxRoYdPAYMzO1w==
X-Received: by 2002:a05:600c:3b14:b0:46e:4329:a4d1 with SMTP id 5b1f17b1804b1-47717def6f8mr9469925e9.4.1761596561163;
        Mon, 27 Oct 2025 13:22:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db9d1sm15890557f8f.35.2025.10.27.13.22.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 13:22:40 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] tar: use diffutils for ptest instead of busybox
Date: Mon, 27 Oct 2025 21:22:39 +0100
Message-ID: <20251027202240.4100310-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 20:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225356

A testcase (sparse03) sometimes times out on the AB, in qemu (without kvm):
the test generates an 8GB sparse file, tars it, untars it, and then
it compares the two versions with cmp.

This process, going through 16GB of data (using one thread, with cmp) takes some
time anyway, but when there is extra load on the host machine, and qemu
can't use its core exclusively, then it can take more than 5 minutes easily
(which is the default ptest timeout).

However the full version of cmp from diffutils seems to be more efficient than
the busybox version:

When using busybox on my idle machine (w/ qemuriscv64) the test case execution
takes 150s, and it almost always times out when there is extra load.

Using diffutils, my idle machine executes the same testcase in 55s, and it
never times out even if there is high load on the host system (execution
always stayed under 3 minutes).

Due to this switch to diffutils when running ptest.

Fixes [YOCTO 15884]

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: add a comment in the recipe

 meta/recipes-extended/tar/tar_1.35.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extended/tar/tar_1.35.bb
index ea0993a909..d463eff97d 100644
--- a/meta/recipes-extended/tar/tar_1.35.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -94,3 +94,7 @@ BBCLASSEXTEND = "native nativesdk"
 # Avoid false positives from CVEs in node-tar package
 # For example CVE-2021-{32803,32804,37701,37712,37713}
 CVE_PRODUCT = "gnu:tar"
+
+# A test uses cmp to compare two 8GB files. Busybox's cmp does the job usually, but it is much slower than
+# diffutils' cmp, and the test times out when there is a high load on the host machine.
+RDEPENDS:${PN}-ptest += "diffutils"

