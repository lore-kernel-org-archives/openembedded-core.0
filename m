Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9171CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 19:45:01 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67510.1790624694254926412
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 12:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=QRFKpokF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260928194452d48c33e31700020721-jjmkv_@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260928194452d48c33e31700020721
        for <openembedded-core@lists.openembedded.org>;
        Mon, 28 Sep 2026 21:44:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=LyYfB7WJi4Mq+hMxFvhHGLSWxQcG+LJ/vTAdIdpV7T4=;
 b=QRFKpokF5JQNOl7BTOKndTNsN+Vzj6jwpPLteaaEfDJbLCfl/OChO3b0dnwsga/P09k3vo
 Fdv5FYvnaH+NNGED76Vom4Fi/C9PEzNWwkq8zFhBlTK6D1KZI4MxoGo3Jh5Ty6lgyl1mnBzS
 vW1CQHQlaiL4S5WhaeKeJJzlUDc3Q8gDeyt1Ol0hxESceW4ogSeLCgnAB+pnM/6xMAUlc74C
 9D6wSGgxMjdUIk/6hxBkPXQQC2mzeUncAi6U6rtgfXe1rQoKot6ytjddQOlYZtWOsO0JVEPp
 ZGB4qpZYY49/SqS7uX/Uh2eNZcHJbDCl9wtuzedVd6SWSyTg9IB0QVPA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 1/3] openssh: set status for CVE-2026-55653
Date: Mon, 28 Sep 2026 21:44:43 +0200
Message-ID: <20260928194445.38129-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 19:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246798

From: Peter Marko <peter.marko@siemens.com>

Per [1] "Only an issue with FIPS patch which is not in Debian/upstream".

[1] https://security-tracker.debian.org/tracker/CVE-2026-55653

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: aabb2b44eba6cbf658eec7850e1ca3a806e0ad9a)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index b48e262c725..ac8b60049bb 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -58,6 +58,7 @@ CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distr
 CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
 CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
+CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
 
 PAM_SRC_URI = "file://sshd"
 

