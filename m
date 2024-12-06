Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB063E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 18:26:32 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.44270.1733509589507244846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 10:26:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=IszjfEgx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20241206182627be0dbb3764697bbe6f-pa83mk@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20241206182627be0dbb3764697bbe6f
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Dec 2024 19:26:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MMmfQxp+re78CxgHAiw9eHPNFF5jy27Ph60R1cfkj2Q=;
 b=IszjfEgxjY97yRkGk0BXrwuBEDNmgo8k9PlHa6TNL06nsUgk6TpQvPMkk0jQPgp2CBZVmX
 nPUMuySKcJsRI8Wm8Cn1tWeWdyRYYNJv8J1g/d+a28UB+gQ/Gj9MRKwCwunzJXUuYAiMsULx
 x9X8Y4AGfs3prU3G4U0ChkBEyZAChPF7pZ0ma6B/LO9A7DlXyuxa4wvpKldZYoieTWihcEtp
 06m74j5Q0+VtBPngKaGd9oL9AVEhRQxdTHkmImVEs60in3leGXjeYCsCRzlOqqlYkW1Yia3j
 Di7TNTaLwfe93nkT4NKtUCQvm0IPwrrdb5pQM4TBvGyOmOMp/mr+WdGg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 3/3] tiff: set status for CVEs firx in 4.7.0
Date: Fri,  6 Dec 2024 19:25:13 +0100
Message-Id: <20241206182513.11165-4-peter.marko@siemens.com>
In-Reply-To: <20241206182513.11165-1-peter.marko@siemens.com>
References: <20241206182513.11165-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 18:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208438

From: Peter Marko <peter.marko@siemens.com>

NDV DB tracks these CVEs as version-less.
So these re-appered in CVE reports after patch files were removed during
last upgrade although the CVEs are fixed.
This seems to be a current trend with RedHat CVEs since due due to
current NVD CVE annotation situation, version-less CVEs are no longer
getting fixed-in added version when available.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.7.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
index 5b318d06219..5a6939d584f 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
@@ -16,6 +16,9 @@ SRC_URI[sha256sum] = "67160e3457365ab96c5b3286a0903aa6e78bdc44c4bc737d2e486bcecb
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
 
 CVE_STATUS[CVE-2015-7313] = "fixed-version: Tested with check from https://security-tracker.debian.org/tracker/CVE-2015-7313 and already 4.3.0 doesn't have the issue"
+CVE_STATUS[CVE-2023-52356] = "fixed-version: Fixed since 4.7.0, NVD tracks this as version-less vulnerability"
+CVE_STATUS[CVE-2023-6228] = "fixed-version: Fixed since 4.7.0, NVD tracks this as version-less vulnerability"
+CVE_STATUS[CVE-2023-6277] = "fixed-version: Fixed since 4.7.0, NVD tracks this as version-less vulnerability"
 
 inherit autotools multilib_header
 
-- 
2.30.2


