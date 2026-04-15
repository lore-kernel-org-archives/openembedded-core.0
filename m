Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5F4F428CC
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 19:47:31 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3818.1776282443926739314
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 12:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Lai1dpYo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2026041519472161f5f9393a00020721-g_at86@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2026041519472161f5f9393a00020721
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Apr 2026 21:47:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=m0ZfPl9t8BZUmwDIV40gAk0Ss5Ewh6PrtHdCT0iwwT8=;
 b=Lai1dpYoZJQ0aLxCWtXVtv7PB7WRerGOgT9aPuXPDdLG9qWVSGIreXGiwukWroJtU6HJFp
 m34DXVaoirbTN2n3NQrbSKh30Hxao+vTZhKHjqoQlYnSy1cEkAWhITKDRPWxJkmom24abaFk
 fPb1LrbnSz5+ewabtGBkZC33LUKoD+JKjnKCx4DJM1d+A0KSDwuQPoQiFEwedz3kfEjQgC7j
 nDdXO9nLKeetVLY6kus0mnxCS7dFzmf2aAu1dbdQbrPACm4r4z4o4Boq2HSf7g7h/RVys3rh
 Ie+o7UDjwwyyUjFCmaU09fTK588FC1Rg/GxsJwXzEdyYX6MT7G2Ly3Ag==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] openssh: upgrade 10.2p1 -> 10.3p1
Date: Wed, 15 Apr 2026 21:47:16 +0200
Message-ID: <20260415194716.2167032-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 19:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235324

From: Peter Marko <peter.marko@siemens.com>

Release notes: [1]

Solves CVE-2026-35385, CVE-2026-35386, CVE-2026-35387, CVE-2026-35388
   and CVE-2026-35414.

[1] https://www.openssh.org/txt/release-10.3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssh/{openssh_10.2p1.bb => openssh_10.3p1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_10.2p1.bb => openssh_10.3p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_10.2p1.bb
rename to meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 96cb09acc0..a050475532 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            "
-SRC_URI[sha256sum] = "ccc42c0419937959263fa1dbd16dafc18c56b984c03562d2937ce56a60f798b2"
+SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 

