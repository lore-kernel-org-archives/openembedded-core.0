Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275C4CF649E
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:57:36 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.45273.1727661451138786792
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UffoyTvO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7db90a28cf6so3401326a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661450; x=1728266250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xONd3wE0/IRMZlAoVI/8Vvpuv7I90hBvX7SbMjC3mI=;
        b=UffoyTvOuV+7qF4DkuMjSAweVpFeQL4/ZD9KQMQsG5bOlT7V52mXH8Vj0dS05oyppX
         6KsWrbTbUfRtcOxP1d/X3RfcPFPSS5QFJ8F7JvrX/zxlzV3AIm5qTHi9rjynUkiEzhRi
         80lPnB3W7wpGdM5OQhqoKOigRcy3/8b+BCZuNjzp7NHhSFsh0MsstrdSdDDO6gz1cxTv
         U9da4wxxff5Zbk7i3OWpFCnMpguE46pGRLMG6L9Pem1Y0Bv+EVMPSl4pQesAu5amN8jV
         iSeIOYTztkKabDxsFoME1DTXrAdN9tMwib/hS5n+7hkZixck4oJP04IFzVuhFGxWkmNX
         9CHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661450; x=1728266250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xONd3wE0/IRMZlAoVI/8Vvpuv7I90hBvX7SbMjC3mI=;
        b=McD1uPYbnLuhLeN/lJH3oIvEEEqUOYpaboREI70Jr0SZ9R6LX0aGlb9HavJulcY2Cp
         CfCGTv6XgV31pf0oX/6TGiW7xNKmx7z2g8s10rOnJhcCYY9aeZbu+c+d777iWV+K7852
         YoiUZ8cO0fZmM6BCnmtK+CIdd5hBi29efcDD3+BH2KBR6l/fcbqs4hZsjGmHukQTGMNL
         Ear+fU2AA4MLML/32HExF78ejUa3HCeVe4hwdbdhgs3SJKc4EVzr2KjOQAeJ4QPKTN0m
         TE6aS/LlFw/0lYmZ6fUlDjEZyVS5xPnP9G0DB7Q1NtcxHDMCAbyIFOBlTpFDbuZb1YR9
         2OLw==
X-Gm-Message-State: AOJu0Yxg5hDXsgYuBsXuQlTWCqYaOMhM0woaXNXXBC7r6nseWYwUzCsr
	fqGtMQbZ/HVTaBQiB5J2t4F6nPrrzAhtBr2nIf364ko654g4GJT6qJhk09B8GIMdQl54nEIgsPJ
	ANhc=
X-Google-Smtp-Source: AGHT+IGrir/o+SPQPdb203lvmnh5OvMFlywStCODSTaX4fLkeohtEnPCmvquu9a/cDhZia6X92GdMg==
X-Received: by 2002:a17:90b:19ca:b0:2e0:7e80:2011 with SMTP id 98e67ed59e1d1-2e09121de91mr22169025a91.16.1727661450311;
        Sun, 29 Sep 2024 18:57:30 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.57.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:57:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/27] binutils: stable 2.42 branch updates
Date: Sun, 29 Sep 2024 18:56:57 -0700
Message-Id: <cfa318fd4a0a6bfa9899a366189ef6a75f000770.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205064

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commits on binutils-2.42 stable branch are updated.

8a6764d35e5 libctf: fix ref leak of names of newly-inserted non-root-visible types
d9ddfab9be2 ld: Move foo before delete in dl5.cc
3e92ae5088c ld: Avoid folding new and delete pairs

Results before updates as below:

No. of expected passes            302
No. of unexpected failures        2
No. of untested testcases         1
No. of unsupported tests          7

Results after updates as below:

No. of expected passes            302
No. of unexpected failures        2
No. of untested testcases         1
No. of unsupported tests          7

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 24efe495ec..5d5ba3d6dc 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "71ef12cbf140a637e4ea4e2239ee5daedc8640de"
+SRCREV ?= "8a6764d35e5c15d78de8aef8f27af3eefd9d7544"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.34.1


