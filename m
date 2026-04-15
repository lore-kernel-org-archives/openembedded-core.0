Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83690F428CB
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 19:46:51 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3879.1776282404342918468
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 12:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=TN0rw2zY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260415194640bd7116126e0002078a-2dg07z@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260415194640bd7116126e0002078a
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Apr 2026 21:46:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=SU4DOIRPhfM6irXMxz8xlm8tKGe7lY4eiaB50Wk+fzs=;
 b=TN0rw2zYVESeelQb7Mn8kwXhlpiFivQodEoEkfpK4JT7wmz4hlg8SC56NttyBD3eoFVL6K
 0kx1lnlNGa3C0V9dZCe/SxnOps83NOQf6KQNEBUPF5BeeEgKwIRHBp8fMz6kjN4bzWnHN35B
 qhi7t2FgblcHPzcZyXOVl0aVIC8VqNpsFCC4GRONN4o7FZPG6GMJJYbpIXa86kAKjDp+ggQX
 0LVU4cWgUbfQpPs2bcU1mIddOa3JRsz54RKHC+2BRYm8zcFEoFh+vnMmuHu1LQW04Xgjl4Ez
 luvnH2yGZSmGuEFHOlI//o2ojvUVC03UfrrSwxxFEe60Vx3UqTOx/3Ng==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] bind: upgrade 9.20.20 -> 9.20.22
Date: Wed, 15 Apr 2026 21:46:37 +0200
Message-ID: <20260415194637.2166874-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 19:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235323

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-1519, CVE-2026-3104, CVE-2026-3119 and CVE-2026-3591.

Release notes 9.20.21: [1]
Release notes 9.20.22: [2]

[1] https://bind9.readthedocs.io/en/stable/changelog.html#bind-9-20-21
[2] https://gitlab.isc.org/isc-projects/bind9/-/blob/bind-9.20/doc/changelog/changelog-9.20.22.rst?ref_type=heads

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../bind/{bind_9.20.20.bb => bind_9.20.22.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.20.bb => bind_9.20.22.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.20.bb b/meta/recipes-connectivity/bind/bind_9.20.22.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.20.bb
rename to meta/recipes-connectivity/bind/bind_9.20.22.bb
index dd51c3a808..c459cf28c9 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.20.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.22.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "19b8335d25305231d5eb8f7d924240d1ac97c4da7c93eaa6273503133aa6106a"
+SRC_URI[sha256sum] = "cba92ff631b949655f475fe4b54290f6860fd0070d399f2279f6437c0d383ec6"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2

