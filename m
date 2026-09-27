Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA54C98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 19:37:50 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43482.1790537867048511050
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 12:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ahpVYasx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260927193745131168101c0002070f-ohvccs@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260927193745131168101c0002070f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 21:37:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=YYgFOonoxt93V3k5o4YD4UbyCXrt0ZnnhHmPfnKaJXI=;
 b=ahpVYasxmpbLLG7v9wmoJu5/Kvem0FNgCtENx6AyNVDUaQoks2Lgjk+rFV4ZmFjOtvNGdJ
 Sd84EGt7jXdFW2pz2nGQU+R9zY9fQzAHyvgmbzA8rjnpqUTb/asjOb4c6a6BJ15YUX4nKB+O
 NyvHIuDoutgwi1DmHQNUyCOaMw9hhYqDMmVoTggbvHxsxoqX49wgFeC3MotpGV34kOZs8fpk
 e+kjIjHs3hmMSLcQQFcXFd+iGvcCjTuTQgouTb3DRZA8+9iCjqEJEx+CXzH3Zz/mJbG5BSp2
 O3Zo3/6Y+WIQsTPWYyHi91H3XPYFXaYcOefdEKLong6r8xjzAnTHH3lQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 7/9] openssh: set status for CVE-2026-55654
Date: Sun, 27 Sep 2026 21:36:07 +0200
Message-ID: <20260927193609.359250-7-peter.marko@siemens.com>
In-Reply-To: <20260927193609.359250-1-peter.marko@siemens.com>
References: <20260927193609.359250-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 19:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246713

From: Peter Marko <peter.marko@siemens.com>

Per desctiption in [1] (which is different than description in [2]),
this is RedHat patches.
Also [3] suggests this.

[1] https://github.com/CVEProject/cvelistV5/blob/main/cves/2026/55xxx/CVE-2026-55654.json
[2] https://security-tracker.debian.org/tracker/CVE-2026-55654
[3] https://ubuntu.com/security/CVE-2026-55654

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/openssh/openssh_10.5p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
index d8b5f8bc14..052686f289 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
@@ -38,6 +38,7 @@ CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distr
 CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
 CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
+CVE_STATUS[CVE-2026-55654] = "not-applicable-platform: Only applies to RHEL patches."
 CVE_STATUS[CVE-2026-55655] = "not-applicable-platform: Only applies to RHEL patches."
 
 PAM_SRC_URI = "file://sshd"

