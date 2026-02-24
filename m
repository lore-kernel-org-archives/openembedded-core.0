Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99463F357AD
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:41 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21288.1771943132167020663
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dNIUDWw1;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48371bb515eso69457295e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943130; x=1772547930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XoMoFuCSp60tLjWqM4zcfgX+UJI9l5EwCkIxr9IJvSE=;
        b=dNIUDWw1VAI3PER0KwS0FUc3HjmSnP5u+YNxt1KVEJekWSnsgoHWbwltGcTvWAGA5P
         rfhX6X2rivCSmZkQx5QVUGDY8o+g9qwsoxoi7fesDpd6DXk8AKeMK97Zd405U5YV/yKy
         mTVwZcPGbK4Hru9+pEvjkQhLHcDTt0VXGBcw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943130; x=1772547930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XoMoFuCSp60tLjWqM4zcfgX+UJI9l5EwCkIxr9IJvSE=;
        b=eqiGaVUlu2gybJosOwI3WrcOsUxJx5GHSpj0aLrKBGO2Kakh6ujOdPyFtj/cRx8TXG
         pY9dgIIZRdTrf91V9c+p7Bq9gUC75/aT7CtANxMv4HzBxICitSgwO2IOnr0nd+AB6bBB
         BgU8fF4waq0Dlq29fOkbNdOebXgoC5fN5J8AVT7RR2lewtD4nors2RRw7QbqlXaM1uYC
         0ktqNo4F7NScfeUj/OcP81NZFdXYPSUoeOw4eIqQ5AhCLtIVPpoM4XRShkfcUbg7h43C
         XRPbM39gpGdmlb1hcXtgW+hyBlQVMnAVX/rzQAMr5zEDEmy2CSETz34qacNwNFLZ0EOB
         zU8w==
X-Gm-Message-State: AOJu0YzFvOTC6/JjX88iml0pjP/pIpc0kms9TpFCbZTekURjkdVsbnhq
	R0VsTlBCPtRaO4hjcWyZ/k97PFxMIPNJNUlJtR/bk/Z9yvfQQZgfJ4eK0bCnaFZ/dRk82ejWbDz
	R6LL9
X-Gm-Gg: AZuq6aKizsi1+0p2adzJJyy32OrDZbhVdyClNWisBsKus0ak4I+fgr59orEPMj/1tts
	zlOzG6ATLGg+ULyXSdu5MPFzU4P1jUTMhDvS+6aGVhsTwiKqaxEyRqe9dNAqZF2PqGcmtf1XKi9
	tPbmXqjMii3L2rOuoZxz13SZxkAqPoO5ktLBulVjB5FqWktYkYet2P00/BuJ48vkL60yjRPzYuh
	LE37xkgMIn1dVzrTlTuECVnSPXUz0W/f0oeugKuyjQpLmPlRX6cPTOdu1fdni4/wSFqx4JdUKJO
	XI1j0EsN6tJddD2zXicdWKD8vIu/QcXjfMaSMjTXm2teeJYeQ2pIq5L6ITmEhrb5oNTXBvfxkzf
	0LWlVpDt8Amv9yVf4H/+sBn4qQDBOoIc0zMG4WdUpU0f4RWezf/OrAAr3hI0kAg30Onxxb/ad98
	t99nZBZKBIG/0eIK88sk6Xu9d6Qto5rAjdxdnOkHQSTRp0Z4yyFZB1wxt2Uin2SX//K/fhX+g7b
	LO1Y1ml2De8uGhQeRQoxdv2wTBb3BKDahrZBjGFnBOq
X-Received: by 2002:a05:600c:64ce:b0:483:498f:7953 with SMTP id 5b1f17b1804b1-483a9637a6cmr188467705e9.28.1771943130231;
        Tue, 24 Feb 2026 06:25:30 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:29 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 36/38] glibc: stable 2.35 branch updates
Date: Tue, 24 Feb 2026 15:24:28 +0100
Message-ID: <c51f4c6546cb61108d473ed9f206ff2ae159860a.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231802

From: Peter Marko <peter.marko@siemens.com>

git log --oneline 4e50046821f05ada5f14c76803845125ddb3ed7d..bb59339d02faebac534a87eea50c83c948f35b77
bb59339d02 (HEAD -> release/2.35/master, origin/release/2.35/master) posix: Reset wordexp_t fields with WRDE_REUSE (CVE-2025-15281 / BZ 33814)
66f0cb057c resolv: Fix NSS DNS backend for getnetbyaddr (CVE-2026-0915)
499d1ccafc memalign: reinstate alignment overflow check (CVE-2026-0861)
9e1a305028 nptl: Optimize trylock for high cache contention workloads (BZ #33704)
a94467ce05 ppc64le: Power 10 rawmemchr clobbers v20 (bug #33091)

Testing Results:
             Before     After   Diff
PASS         4774      4770     -4
XPASS        6         6         0
FAIL         149       154      +5
XFAIL        16        16        0
UNSUPPORTED  246       246       0

Changes in failed testcases:

testcase-name                                    before  after
malloc/tst-malloc-fork-deadlock-malloc-hugetlb2  FAIL    PASS
posix/tst-wait4                                  FAIL    PASS
malloc/tst-malloc-too-large                      PASS    FAIL
malloc/tst-malloc-too-large-malloc-check         PASS    FAIL
malloc/tst-malloc-too-large-malloc-hugetlb1      PASS    FAIL
malloc/tst-malloc-too-large-malloc-hugetlb2      PASS    FAIL
malloc/tst-malloc-too-large-mcheck               PASS    FAIL
malloc/tst-mallocfork2                           PASS    FAIL
malloc/tst-mallocfork3                           PASS    FAIL

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.35.bb     | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index b9f5e8fb8fb..06edbeb47f8 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "4e50046821f05ada5f14c76803845125ddb3ed7d"
+SRCREV_glibc ?= "bb59339d02faebac534a87eea50c83c948f35b77"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 1b5830699fd..97ba50bec4a 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -27,7 +27,8 @@ CVE_CHECK_IGNORE += "CVE-2023-4527"
 CVE_CHECK_IGNORE += " \
     CVE-2023-0687 CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156 \
     CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602 \
-    CVE-2025-0395 CVE-2025-4802 CVE-2025-8058 \
+    CVE-2025-0395 CVE-2025-4802 CVE-2025-8058 CVE-2025-15281 \
+    CVE-2026-0861 CVE-2026-0915 \
 "
 
 DEPENDS += "gperf-native bison-native"

