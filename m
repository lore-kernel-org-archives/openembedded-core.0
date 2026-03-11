Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BAE103E2E7
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 20:56:52 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7087.1773262604456849077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 13:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NFPhdtNI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260311205641a2db8d4af600020750-af0ptn@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260311205641a2db8d4af600020750
        for <openembedded-core@lists.openembedded.org>;
        Wed, 11 Mar 2026 21:56:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=nAyTx71zqbs7HvEiM4JUhe8nt/pw/tDtJoBi+nHB+3w=;
 b=NFPhdtNIqSVkX56fCsZOtfEA203Az5D90dYH3P5BNSWFt2p7UsQgmkTCaHBFg9tQJOw0Fe
 HHHv15bxzmFV43xGZgPVSXrI3qMyw1yVBl9a21ye89G7E1jXN1SXeK36SujFdnbwE1m1hRs4
 F0ay+6eY7HKQ8DYtMPF+fXy/gwfy0N3lkFvCgR8buW0h6Xe8I7NxFrfi55DZA3fzJlKieCDa
 eq6CwbzCDqORp8zmpnozihnkt2KaY59CfCOZ3UcB9wahoUm4jK36ouexbXENjgwc2AWHvXYM
 f8pOOPavYhY1vp5fbCQEl7PgIYq6DPp/JAmJCOClconzTeVsOBkT+31A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] libuv: upgrade 1.52.0 -> 1.52.1
Date: Wed, 11 Mar 2026 21:56:38 +0100
Message-Id: <20260311205638.735249-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 20:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232913

From: Peter Marko <peter.marko@siemens.com>

Release info [1]:

Changes since version 1.52.0:
* misc: add simple clang-tidy setup (Jameson Nash)
* unix: check RLIMIT_AS and RLIMIT_DATA in uv_get_constrained_memory
  (Jameson Nash)
* win: add fs-fd-hash-inl.h to tarball (tobil4sk)
* unix,win: support NULL loop for sync uv_getaddrinfo (Saúl Ibarra
  Corretgé)
* Fix const-correctness warning in linux.c (Quaylyn Rimer)
* build(deps): bump actions/upload-artifact from 6 to 7
  (dependabot[bot])
* build(deps): bump actions/download-artifact from 7 to 8
  (dependabot[bot])
* unix: fix compilation warnings with GCC 15 (Saúl Ibarra Corretgé)
* test: remove conditionals from `uv_thread_self` usage (Yasser
  Nascimento)
* unix: fix discard const (Rudi Heitbaum)
* unix: do not cast to char variables that are const char (Rudi
  Heitbaum)
* linux: fix crash if poll callback closes handle before `POLLERR` (Juan
  José Arboleda)

[1] https://github.com/libuv/libuv/releases/tag/v1.52.1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libuv/{libuv_1.52.0.bb => libuv_1.52.1.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.52.0.bb => libuv_1.52.1.bb} (94%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.52.0.bb b/meta/recipes-connectivity/libuv/libuv_1.52.1.bb
similarity index 94%
rename from meta/recipes-connectivity/libuv/libuv_1.52.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.52.1.bb
index 25177bc05d..08f0755911 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.52.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.52.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
                     file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
-SRCREV = "b556c0629d0fd250b5feefbc91b84c6f5e3dae48"
+SRCREV = "1cfa32ff59c076ffb6ed735bbc8c18361558661f"
 SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 

