Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D128CD3447
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 22:46:11 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20864.1778366763650757579
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2026 15:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YMew6Y4I;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260509224600e4983b3a0000020799-e9rgl6@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260509224600e4983b3a0000020799
        for <openembedded-core@lists.openembedded.org>;
        Sun, 10 May 2026 00:46:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RHsn3WyendaRIU5H/XiBtEp/nuKI057samT9wEzgJh8=;
 b=YMew6Y4I0NINiKr/yQXusenf+bK/tfFp+0V2cHwsuOHDzE8bnW5lg7FKKXm6A11rosFFo7
 yfD4QnpOJewXIq9kvypZX3Fbh0fSLdqaocTAlNpSJfshEYDi3++oVqUbC8tEoNTGhv9ZtraI
 Q2+2BYxlVLFRD6nGkcHaRja1HarOoBrYrye7OdiMdgKtaCH7PmU/69aEOAAmfeSHqO6Hoezw
 Bw9SydPD/2OH9EoGgx1roPJfGiHl1Fy3kHApD0NIPfSWRG9DZHRbF2QHcZH2+G0puYVnL3nA
 I088nZkJBHKYdN5he+BLkILyCWegqI+PWGiJuIlrkHyApx3gAoWMyiUw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/4] rpm-sequoia: set status for CVE-2026-2625
Date: Sun, 10 May 2026 00:45:33 +0200
Message-ID: <20260509224536.27734-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 May 2026 22:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236762

From: Peter Marko <peter.marko@siemens.com>

This is a version-less RedHat CVE.
[1] points to [2] included in v1.10.2.

[1] https://security-tracker.debian.org/tracker/CVE-2026-2625
[2] https://github.com/rpm-software-management/rpm-sequoia/commit/fa3c60094fa853ede6b4862e936f246412d700de

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.2.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.2.bb
index d190db88b6..a6b32bb007 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.2.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.2.bb
@@ -77,3 +77,5 @@ RDEPENDS:${PN} = "rpm-sequoia-crypto-policy"
 PACKAGE_WRITE_DEPS += "rpm-sequoia-crypto-policy-native"
 
 BBCLASSEXTEND = "native"
+
+CVE_STATUS[CVE-2026-2625] = "fixed-version: fixed since v1.10.2"

