Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8218BFF885A
	for <webhook@archiver.kernel.org>; Sat, 25 Apr 2026 22:27:23 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6871.1777156036722068562
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2026 15:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Aoe5/RRy;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026042522271348148b98e90002073b-eyy_82@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026042522271348148b98e90002073b
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 00:27:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=nwCzEjYCD134OBcXvakx9RRKh+rTAXHLuammnoS183M=;
 b=Aoe5/RRyXHR2hXRtR4pVUQfFlLfOpIl9Tl4iCBUUo6RxOSq8Ugh+LHQN+z+Rrw2uob5pKO
 Sx41gRnaus/WPhJ1zb6/JbDf+IxAlmXuZMi8Is+AuwY26Y57MEBmQQG7wcR3RfLRiGqm5l1F
 96I71UxyLhe+T74scRiInMDmxZFRjPYWkNtacXr4T9R3c7u+Nx56FRLjWDT5hnPEgPluPJ+/
 Pcth4JTYlWVq8Vnp+vKO4ddQTv/JGlm+KW5RVekED5TK8KefHwWKgZfaeFbUKtMmmuKrQ/1L
 He2zg9CIRyACDKYybwowhuevWK/ULCNiBK4deYyd2Mvf3vBFZYs8sq+A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/5] shadow: set CVE_PRODUCT
Date: Sun, 26 Apr 2026 00:26:30 +0200
Message-ID: <20260425222634.44171-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2026 22:27:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235946

From: Peter Marko <peter.marko@siemens.com>

This will remove CVE-2016-15024 from open cve reports.
This CVE for is for "doomsider:shadow" [1].

It will also remove
* CVE-2018-16588 (suse:shadow, [2])
* CVE-2019-16110 (blade-group:shadow [3])
which can be verified that they don't affect Yocto shadow.

[1] https://security-tracker.debian.org/tracker/CVE-2016-15024
[2] https://security-tracker.debian.org/tracker/CVE-2018-16588
[3] https://security-tracker.debian.org/tracker/CVE-2019-16110

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/shadow/shadow_4.19.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow_4.19.4.bb b/meta/recipes-extended/shadow/shadow_4.19.4.bb
index 94f155641c..f70d1ca5f3 100644
--- a/meta/recipes-extended/shadow/shadow_4.19.4.bb
+++ b/meta/recipes-extended/shadow/shadow_4.19.4.bb
@@ -38,6 +38,8 @@ PAM_SRC_URI = "file://pam.d/chfn \
                file://pam.d/passwd \
                file://pam.d/su"
 
+CVE_PRODUCT = "debian:shadow shadow_project:shadow"
+
 inherit autotools gettext github-releases pkgconfig
 
 export CONFIG_SHELL = "/bin/sh"

