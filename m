Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BE7E63CA9
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 16:23:13 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41713.1769358189051560050
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 08:23:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Jh1U/kJB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260125162303d19d92f3390002078d-kujwa9@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260125162303d19d92f3390002078d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Jan 2026 17:23:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=4v97RmyK8F1+8lvHBVjR2l/Bp/tEiDl+Ye54RP1dDmw=;
 b=Jh1U/kJBfsvNDw6eqpdh60LXzYmVXekHLh352GwE89/QaJc8yfYLdfuBBY5IMO0QEZyDJ2
 W1Cu6v13GqCiZzFxgaV7xnpd5hd3H7h/BMWiPISkhViK2RpNQczjcLZWKWbi5+eF+0UY8XZf
 2F4eia55wWBwZFB9KCXwgo5ganQs3nRDHzqZ8Ey6fpo8x6AG0lOjbsHV6VqfUqOspgasSq6u
 I7PUaVP8ZKjBm/PLAQ6dGGeMexQF/UR/bQPNMzJub6O5DjA15UEKgVDznjfserVr1HgtkC3b
 mY9dbLH7u/eZQGUJKtG8iO74rZTC68Qm/UhIcpk1GOpdqrRjtg/KLkLg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH] glibc: stable 2.42 branch updates
Date: Sun, 25 Jan 2026 17:16:10 +0100
Message-Id: <20260125161610.729858-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 16:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229936

From: Peter Marko <peter.marko@siemens.com>

git log --oneline e34453cd6a8c592c325756ff3c7ac0afd3975cb4..912d89a766847649a3857985a3b5e6065c51bfd4
912d89a766 (HEAD -> release/2.42/master, origin/release/2.42/master) Switch currency symbol for the bg_BG locale to euro
cbf39c26b2 posix: Reset wordexp_t fields with WRDE_REUSE (CVE-2025-15281 / BZ 33814)
453e6b8dba resolv: Fix NSS DNS backend for getnetbyaddr (CVE-2026-0915)
b0ec8fb689 memalign: reinstate alignment overflow check (CVE-2026-0861)
f122d0b4d1 nptl: Optimize trylock for high cache contention workloads (BZ #33704)
a1d3294a5b support: Exit on consistency check failure in resolv_response_add_name
8dfb84ad4e support: Fix FILE * leak in check_for_unshare_hints in test-container
2a0873aa81 sprof: fix -Wformat warnings on 32-bit hosts
efdf4c0c87 sprof: check pread size and offset for overflow
b11411fe2e posix: Fix invalid flags test for p{write,read}v2
8aaf4b732d ppc64le: Power 10 rawmemchr clobbers v20 (bug #33091)
2dbf973fe0 ppc64le: Restore optimized strncmp for power10
6b2957cfe8 ppc64le: Restore optimized strcmp for power10
828b8d23f3 AArch64: Fix and improve SVE pow(f) special cases
710d7a2e83 AArch64: fix SVE tanpi(f) [BZ #33642]
0c9430ed97 AArch64: Fix instability in AdvSIMD sinh
ec041b1f53 AArch64: Fix instability in AdvSIMD tan
97297120ce AArch64: Optimise SVE scalar callbacks
17c3eab387 aarch64: fix includes in SME tests
de1fe81f47 aarch64: fix cfi directives around __libc_arm_za_disable
bf499c2a49 x86: fix wmemset ifunc stray '!' (bug 33542)
71874f167a aarch64: tests for SME
256030b984 aarch64: clear ZA state of SME before clone and clone3 syscalls
6de12fc9ad aarch64: define macro for calling __libc_arm_za_disable
ab8c1b5d62 x86: Detect Intel Nova Lake Processor
bf48b17a28 x86: Detect Intel Wildcat Lake Processor
18fd689cdc nptl: Fix MADV_GUARD_INSTALL logic for thread without guard page (BZ 33356)
46b4e37c9e nss: Group merge does not react to ERANGE during merge (bug 33361)
1166170d95 libio: Define AT_RENAME_* with the same tokens as Linux

Testing Results:
             Before     After   Diff
PASS         6809      6815     +6
XPASS        4         4         0
FAIL         180       173      -7
XFAIL        16        16        0
UNSUPPORTED  129       129       0

Changes in failed testcases:

testcase-name                                   before   after
malloc/tst-malloc_info                          FAIL     PASS
malloc/tst-malloc-too-large                     FAIL     PASS
malloc/tst-malloc-too-large-malloc-check        FAIL     PASS
malloc/tst-malloc-too-large-malloc-hugetlb1     FAIL     PASS
malloc/tst-malloc-too-large-malloc-largetcache  FAIL     PASS
malloc/tst-malloc-too-large-mcheck              FAIL     PASS
nptl/tst-robustpi7                              FAIL     PASS
posix/tst-wait3                                 FAIL     PASS
stdio-common/tst-read-offset                    PASS     FAIL

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.42.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index a3ce970c29..9991c02495 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.42/master"
 PV = "2.42+git"
-SRCREV_glibc ?= "e34453cd6a8c592c325756ff3c7ac0afd3975cb4"
+SRCREV_glibc ?= "912d89a766847649a3857985a3b5e6065c51bfd4"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.42.bb b/meta/recipes-core/glibc/glibc_2.42.bb
index f9c1cdc2f1..a8717c0eae 100644
--- a/meta/recipes-core/glibc/glibc_2.42.bb
+++ b/meta/recipes-core/glibc/glibc_2.42.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = ""
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"

