Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F11BE63CA2
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 16:23:23 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41721.1769358198289901604
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 08:23:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Z1qpStA/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260125162315123631c16d000207cc-k4t4x3@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260125162315123631c16d000207cc
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Jan 2026 17:23:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=N6hMVonjRNvQ6Vpy4flkKAmOCQ9Ro5yfH3s4rT4FauI=;
 b=Z1qpStA/h7kGjv4ATE7fmmYyDbO+hsQeYFYjMpbY0B7P2aVcdRmec6QOzaVjWsHWL8JATp
 Fj9GbaYv3ydbZamEGUZSthYAyMi/r/V+X5/nwJ6fGTzqy4r+a6wD++53DhDTrDk5jZmSOk6/
 ySBEKUronzf3yjzye68EgHwXjQSheM55wJrX4TKBmY29yi/4odQTlvchK0BY6E9unH2iIK8n
 3UC+4OdAsWnbrWizKVM2UonzXjjaDe6tAkyxtIK/6sYnwthCcZTdjrk6efh0stzTNtk9t81a
 ugZqVvjOSMdS4Up/BHyLPhWvMoFTGlfCEW4zti1/oJOA3MWdcA9Yfvrw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] glibc: stable 2.39 branch updates
Date: Sun, 25 Jan 2026 17:16:23 +0100
Message-Id: <20260125161623.729884-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 16:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229937

From: Peter Marko <peter.marko@siemens.com>

git log --oneline 58cbbd43fe82910cf8ae9008351b0b0665104500..ce65d944e38a20cb70af2a48a4b8aa5d8fabe1cc
ce65d944e3 (HEAD -> release/2.39/master, origin/release/2.39/master) posix: Reset wordexp_t fields with WRDE_REUSE (CVE-2025-15281 / BZ 33814)
831f63b94c resolv: Fix NSS DNS backend for getnetbyaddr (CVE-2026-0915)
fb22fd3f5b memalign: reinstate alignment overflow check (CVE-2026-0861)
10c0bcb3d3 support: Exit on consistency check failure in resolv_response_add_name
f47dd22366 support: Fix FILE * leak in check_for_unshare_hints in test-container
4a53354eaf sprof: fix -Wformat warnings on 32-bit hosts
beb8267909 sprof: check pread size and offset for overflow
c07002038f getaddrinfo.c: Avoid uninitialized pointer access [BZ #32465]
ae5fb93559 nptl: Optimize trylock for high cache contention workloads (BZ #33704)
efff7cb659 ppc64le: Power 10 rawmemchr clobbers v20 (bug #33091)
f6becd8ae8 ppc64le: Restore optimized strncmp for power10
0daa4e46b8 ppc64le: Restore optimized strcmp for power10
28c1de6580 AArch64: Fix instability in AdvSIMD tan
03d0393343 AArch64: Optimise SVE scalar callbacks
0d05a895f1 aarch64: fix includes in SME tests
c1dc4412f8 aarch64: fix cfi directives around __libc_arm_za_disable
d60f15dc89 aarch64: tests for SME
d1d0d09e9e aarch64: clear ZA state of SME before clone and clone3 syscalls
dbe1904b7c aarch64: define macro for calling __libc_arm_za_disable
58cf4aa421 aarch64: update tests for SME
1b3bd9a9a6 aarch64: Disable ZA state of SME in setjmp and sigsetjmp
38942a336b linux: Also check pkey_get for ENOSYS on tst-pkey (BZ 31996)
c74d59a656 aarch64: Do not link conform tests with -Wl,-z,force-bti (bug 33601)
323ad087a1 x86: fix wmemset ifunc stray '!' (bug 33542)

Testing Results:
             Before    After    Diff
PASS         4926      4921     -5
XPASS        4         4         0
FAIL         223       229      +6
XFAIL        16        16        0
UNSUPPORTED  224       224       0

Changes in failed testcases:

testcase-name                                before  after
elf/tst-audit21                              PASS    FAIL
malloc/tst-malloc-too-large                  PASS    FAIL
malloc/tst-malloc-too-large-malloc-check     PASS    FAIL
malloc/tst-malloc-too-large-malloc-hugetlb1  PASS    FAIL
malloc/tst-malloc-too-large-malloc-hugetlb2  PASS    FAIL
malloc/tst-malloc-too-large-mcheck           PASS    FAIL

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.39.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 2ca15711587..03a8e5d01e3 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "58cbbd43fe82910cf8ae9008351b0b0665104500"
+SRCREV_glibc ?= "ce65d944e38a20cb70af2a48a4b8aa5d8fabe1cc"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index ff6c8f3b437..7958d64eed1 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -18,7 +18,7 @@ easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS = "CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602 CVE-2025-0395 \
-    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058"
+    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058 CVE-2025-15281 CVE-2026-0861 CVE-2026-0915"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"

