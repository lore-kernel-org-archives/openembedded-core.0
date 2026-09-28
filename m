Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2D8CA5FA6
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 19:44:21 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67497.1790624660545669992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 12:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Scu7Voro;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260928194418ea524079bd00020708-rwau91@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260928194418ea524079bd00020708
        for <openembedded-core@lists.openembedded.org>;
        Mon, 28 Sep 2026 21:44:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=h4ui2PzkqU/UpVkC91y+NAsAaglj/wQ5BQWvPt3LQIE=;
 b=Scu7Voro7guqDyBROESzW7hUwnqBoh3o4Imnl4EoVFrqo/sb+ZoZCsOHndioXHC/JdhXpm
 T0jGbzkvuMTcJtnZ5KV0dWUWeToU5rq4mFjv6TyN5WMQ3jktyUbpKkyMQEqexHlgESkWRNiH
 0slhXiINIHvjTMsJT0aydZCyxd4zu0vr15LkZFFI18Zvb8tmoe2Ctfem/ZbLYkuzjLQi/0IO
 NeQa9MweHsuz/eVmIjldE2DauVd45OU7qzWOjtzNyPi3TTGrz0+i9R4x9gW6WOH1GlHYLY9P
 vQYlo7fkNVq2UJ2HXPQu0FIchzMH29n9lt24MbMPRqZEVEC5hsZaVvrg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 2/4] openssh: set status for CVE-2026-55655
Date: Mon, 28 Sep 2026 21:43:55 +0200
Message-ID: <20260928194357.37972-2-peter.marko@siemens.com>
In-Reply-To: <20260928194357.37972-1-peter.marko@siemens.com>
References: <20260928194357.37972-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 19:44:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246795

From: Peter Marko <peter.marko@siemens.com>

Per [1] and [2] this this is only problem in RedHet patches.

[1] https://security-tracker.debian.org/tracker/CVE-2026-55655
[2] https://ubuntu.com/security/CVE-2026-55655

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 9ea8649149e711668b85c7e35cb7c259437e8c0e)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/openssh/openssh_10.3p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index e6bc9e9a5b..9793e3fa6d 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -46,6 +46,7 @@ CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
 CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
 CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
+CVE_STATUS[CVE-2026-55655] = "not-applicable-platform: Only applies to RHEL patches."
 
 PAM_SRC_URI = "file://sshd"
 

