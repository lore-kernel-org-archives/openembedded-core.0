Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF3FC07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 18:16:22 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.155089.1698171377901628064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 11:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Mn714IP0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20231024181613e3da4c8cdf1bc6e3de-dtez0d@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20231024181613e3da4c8cdf1bc6e3de
        for <openembedded-core@lists.openembedded.org>;
        Tue, 24 Oct 2023 20:16:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=6zLcmbCo0mqSRY1dn+E6kLHO2oxUz4wy4f6isjE4UF4=;
 b=Mn714IP0/DNun2m0SqoRrbg7xFCwpZMIhOOAuzDbYZCBiZaJlNnCUSuhxk10ABYJb0rB1u
 AuGuSlWZ7TxkbEzDPGk4yI36bVZPM5op12Ji0lCmqFGLXkC10/AURbl+z5zwllwNEhBQB2hJ
 z22mpomeGZT0nsxxOYpK+5wwWBSfk=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][master][mickledore][PATCH] openssl: Upgrade 3.1.3 -> 3.1.4
Date: Tue, 24 Oct 2023 20:15:29 +0200
Message-Id: <20231024181529.913933-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 18:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189655

From: Peter Marko <peter.marko@siemens.com>

https://github.com/openssl/openssl/blob/openssl-3.1/NEWS.md#major-changes-between-openssl-313-and-openssl-314-24-oct-2023

Major changes between OpenSSL 3.1.3 and OpenSSL 3.1.4 [24 Oct 2023]
* Mitigate incorrect resize handling for symmetric cipher keys and IVs. (CVE-2023-5363)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/{openssl_3.1.3.bb => openssl_3.1.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.1.3.bb => openssl_3.1.4.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.3.bb b/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.1.3.bb
rename to meta/recipes-connectivity/openssl/openssl_3.1.4.bb
index 9fd8a205c6..01d477f506 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "f0316a2ebd89e7f2352976445458689f80302093788c466692fb2a188b2eacf6"
+SRC_URI[sha256sum] = "840af5366ab9b522bde525826be3ef0fb0af81c6a9ebd84caa600fea1731eee3"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.30.2


