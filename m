Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8419C87FDA
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 19:06:21 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.30566.1754679971556706440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 12:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=EHkz0mgU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202508081906076fe50b7104f52863e2-cgewqx@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202508081906076fe50b7104f52863e2
        for <openembedded-core@lists.openembedded.org>;
        Fri, 08 Aug 2025 21:06:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gZQmjOc9xGlj8TGSVzAqdZOtab5B7sa3sFymnSh+8+Q=;
 b=EHkz0mgU2pErv/4rKB7sg3Y5WfIGGxAgnrb8odm2uClALTfqvg/4qr6uxcTui10HtAlQM4
 OOLc0l6ngvqjHelhxtbTjmxM/7zM0RfwyvHFhOFM8l2KYXPfrYTym7jk/aeH6bIkgwxiaxNj
 pGjsN/CyvgWBbajrQ5OfKn3zrovANVprzgivEwzyhCfXpbbazQ4lUVyp1zGcs1rnVkQoge+L
 X0qxZGTojPkYpOAI1GLu8l2aK6CzwBEI2ckPdAPdf88eYkMafifLDQC2VZc2c2EV+h8fz0b+
 X28LLFcs0NfOgtQa/Ujjfw0OfP7Jps7Hry+KVEIVVzJSwO6chCzWwqMQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] openssl: upgrade 3.5.1 -> 3.5.2
Date: Fri,  8 Aug 2025 21:05:20 +0200
Message-Id: <20250808190520.3174881-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 19:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221667

From: Peter Marko <peter.marko@siemens.com>

Release information:
https://github.com/openssl/openssl/blob/openssl-3.5/NEWS.md#major-changes-between-openssl-351-and-openssl-352-5-aug-2025

OpenSSL 3.5.2 is a bug fix release.

This release incorporates the following bug fixes and mitigations:
* Miscellaneous minor bug fixes.
* The FIPS provider now performs a PCT on key import for RSA, EC and ECX.
  This is mandated by FIPS 140-3 IG 10.3.A additional comment 1.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/{openssl_3.5.1.bb => openssl_3.5.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.1.bb => openssl_3.5.2.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.1.bb b/meta/recipes-connectivity/openssl/openssl_3.5.2.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.1.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.2.bb
index 7c40b6cf52..396e69d7e7 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.2.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "529043b15cffa5f36077a4d0af83f3de399807181d607441d734196d889b641f"
+SRC_URI[sha256sum] = "c53a47e5e441c930c3928cf7bf6fb00e5d129b630e0aa873b08258656e7345ec"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

