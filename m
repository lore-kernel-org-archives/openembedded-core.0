Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19BAC4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 19:00:51 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31085.1784660447599725063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 12:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=dgXYxQcp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2026072119004599c7a6e75c000207fe-xeh_oe@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026072119004599c7a6e75c000207fe
        for <openembedded-core@lists.openembedded.org>;
        Tue, 21 Jul 2026 21:00:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=oRta4qFDS6/OFdueQN+9a54Mr76Pk0K4LxrIBGXP2so=;
 b=dgXYxQcpjeSnCSbxWSyPaQkYZcxwFPjQH96QWFuRf13Z1V1QmVQwILL/m7J48UenDjfttq
 c2GGrU1mPzcFN4KJk8L6P2tcRF+9BX+Uj6esZUZCJTizmCu7AcCq9Sx7vwIxheKGrH9JG/UE
 5QTyhFzS8Z0i6R9I/aYOtOa8J4WByYuQQWQ5nEYGmXEuT+uDnDoS36/4ktx+d68q+1B9Zv3z
 bl18ulClFXP9+tLJSpfbGomqLIyxGA3WbhN3CmKqMhhPUUMUEf/wH0XQoFzrcwL3GOGOEHM1
 4hyBWlHa77ZU8boqkCQ2LgvHrNXUu81CQhTxZFYCv2KnVRmiOrnejkRA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 1/2] openssh: set status for CVE-2026-55653
Date: Tue, 21 Jul 2026 21:00:36 +0200
Message-ID: <20260721190037.49841-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 19:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241572

From: Peter Marko <peter.marko@siemens.com>

Per [1] "Only an issue with FIPS patch which is not in Debian/upstream".

[1] https://security-tracker.debian.org/tracker/CVE-2026-55653

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/openssh/openssh_10.3p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index a050475532..acc6c54f38 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -36,6 +36,7 @@ Red Hat Enterprise Linux 7 and when running in a Kerberos environment"
 
 CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distributed RHEL binaries."
 CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
+CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
 
 PAM_SRC_URI = "file://sshd"
 

