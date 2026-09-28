Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1991CA5FA3
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 19:45:21 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66580.1790624718853522599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 12:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=RlgpIFK4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260928194517c6c35c315100020763-1vyhel@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260928194517c6c35c315100020763
        for <openembedded-core@lists.openembedded.org>;
        Mon, 28 Sep 2026 21:45:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MUmHqAaqSQdD+FxnCmOmXyGvFepSJH+u5iGFtppYyT4=;
 b=RlgpIFK4tmJ12Zkv9oLGvYUQNvHH4ZbiwpGDH/Z/XbpPlmhg5aKcqZzTEabb3AIZgndcCX
 ds+eMZME9b1wivrtq1FjQZdOO6YBW5LCfCp71wFhZSwTiWKqMudJrldoLuvqhFVuN6cDt2Ua
 0qN02PtXZI7cm8uM0kCLTpb3baAsd87aHMTPwldjJ7apvoecxcm0BuUwk72kd/lBIiGVGLQf
 zQiK9qsX8qUxl2mHa0ARyM96L1KJC1kZZYBP77JTjcJdOAmUEXuiRpdl9rcp6RwKd48nRVtG
 41JpZ1UkVPsKjvOQlJlEwdyzQoxtzkICIgy6ETmukGJaAKPw94mRVZRA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 3/3] openssh: set status for CVE-2026-55654
Date: Mon, 28 Sep 2026 21:44:45 +0200
Message-ID: <20260928194445.38129-3-peter.marko@siemens.com>
In-Reply-To: <20260928194445.38129-1-peter.marko@siemens.com>
References: <20260928194445.38129-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 19:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246800

From: Peter Marko <peter.marko@siemens.com>

Per desctiption in [1] (which is different than description in [2]),
this is RedHat patches.
Also [3] suggests this.

[1] https://github.com/CVEProject/cvelistV5/blob/main/cves/2026/55xxx/CVE-2026-55654.json
[2] https://security-tracker.debian.org/tracker/CVE-2026-55654
[3] https://ubuntu.com/security/CVE-2026-55654

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 389919ea7927962a61a5aaa7b641c5b60af560e0)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index d36d62e8f8b..30e4297ca8c 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -59,6 +59,7 @@ CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
 CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
 CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
+CVE_STATUS[CVE-2026-55654] = "not-applicable-platform: Only applies to RHEL patches."
 CVE_STATUS[CVE-2026-55655] = "not-applicable-platform: Only applies to RHEL patches."
 
 PAM_SRC_URI = "file://sshd"

