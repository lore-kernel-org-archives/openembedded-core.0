Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE106D46BF3
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 19:07:13 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2658.1769627227756780886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 11:07:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=aEJhh4cI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202601281907041028d4a88c00020723-t7qgjs@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202601281907041028d4a88c00020723
        for <openembedded-core@lists.openembedded.org>;
        Wed, 28 Jan 2026 20:07:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=+Ac+cpISJuSYPkS0pi0LAZXC/PDVcJy1CD4iPoCC0nY=;
 b=aEJhh4cINJTL2uYhGbYp3avPLQd8aEnkJEYum0GnuUy4lWyyQAjzYb4q+HXnhJvkLnqZB8
 Kq7nT5Cc+stGY6hxxjraUc2PdZLcSv6GdQSPQZF8w65wY8E761F4AG2TTMvKpgVHpaKkEAKa
 JIj6ykqDGYr6hMz9bK99tVjMP51MJPB6tlK31FvqR4xY8cugyLXiAS55kQqs16ouYsf4sB8O
 qTiN3VE2qzzsM++32OFfpulHB2izMh6i7awS65Vb9Ld54oWmtjJjDH/YXsMuOkd3SN+HwFv5
 kBp/On2As9x/z35FNLhY42+LCN3qOygyx/0hqs/rwG7PSmL153S5xpSg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] glibc: stable 2.42 branch updates
Date: Wed, 28 Jan 2026 20:06:57 +0100
Message-Id: <20260128190657.2497731-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 19:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230107

From: Peter Marko <peter.marko@siemens.com>

$ git log --oneline 453e6b8dbab935257eb0802b0c97bca6b67ba30e..912d89a766847649a3857985a3b5e6065c51bfd4
912d89a766 (HEAD, origin/release/2.42/master) Switch currency symbol for the bg_BG locale to euro
cbf39c26b2 posix: Reset wordexp_t fields with WRDE_REUSE (CVE-2025-15281 / BZ 33814)

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6814   | 6818   | +4   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 139    | 136    | -3   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 164    | 164    |  0   |
+--------------+--------+--------+------+

Changes in failed testcases:
malloc/tst-malloc-fork-deadlock-malloc-check  FAIL  PASS
malloc/tst-malloc_info                        FAIL  PASS
malloc/tst-malloc_info-malloc-largetcache     FAIL  PASS
nptl/tst-getpid3                              FAIL  PASS
posix/tst-wait3                               PASS  FAIL

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 89596a0527..9991c02495 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.42/master"
 PV = "2.42+git"
-SRCREV_glibc ?= "453e6b8dbab935257eb0802b0c97bca6b67ba30e"
+SRCREV_glibc ?= "912d89a766847649a3857985a3b5e6065c51bfd4"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"

