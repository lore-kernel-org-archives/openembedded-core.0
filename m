Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6E6C4452D
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 19:00:31 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31075.1784660422173793512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 12:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Nqya2Lpd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2026072119001828dcb2b1b3000207d1-vgoz_n@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026072119001828dcb2b1b3000207d1
        for <openembedded-core@lists.openembedded.org>;
        Tue, 21 Jul 2026 21:00:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/IAj2YleLkQr9IT8mXitzxvxwes9MqsVKPz9PJ9B6jA=;
 b=Nqya2LpdmjMuR4QzlEN7Ntj7ibPap9bdvhvoJEqX59vKXQ/l9bbgb9IeiBBpAQj4o4ZUHL
 bSc8k1rxPMwJqEVcxhS3+KwJ7cs4AKUmlnJzrpUKfTt1ZmDPWXJPQsRkrtirqqKPXXu3mHAg
 MPKkzo4zRjs/4kO+jtFTDYp5Peapml1A4DIOLH/vvN9aBo0cIGo+7gRhG9cfDbB8pCMSS01Z
 90hW/4Yh/SiFMNZKB5ELoY3Pjc6bRtDFU+e5Q8VMC+8RXphO5HhtrGuCXFfYReFUjOM59yXu
 nudLLVQ7DBZPtu2cO8jp86a997vbVI2m2rwJVV1/bgXuCX988QhiFlPw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/4] openssh: set status for CVE-2026-55653
Date: Tue, 21 Jul 2026 21:00:02 +0200
Message-ID: <20260721190005.49809-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 19:00:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241568

From: Peter Marko <peter.marko@siemens.com>

Per [1] "Only an issue with FIPS patch which is not in Debian/upstream".

[1] https://security-tracker.debian.org/tracker/CVE-2026-55653

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/openssh/openssh_10.4p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.4p1.bb b/meta/recipes-connectivity/openssh/openssh_10.4p1.bb
index da08a97fca..f737fbf24d 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.4p1.bb
@@ -37,6 +37,7 @@ Red Hat Enterprise Linux 7 and when running in a Kerberos environment"
 CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distributed RHEL binaries."
 CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
+CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
 
 PAM_SRC_URI = "file://sshd"
 

