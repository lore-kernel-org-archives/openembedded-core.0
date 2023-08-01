Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0098EC001DF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:37:34 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.18034.1690907850408965389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=oXLsMTSj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2023080116372706f1a69833472b7c59-1taug4@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2023080116372706f1a69833472b7c59
        for <openembedded-core@lists.openembedded.org>;
        Tue, 01 Aug 2023 18:37:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=0F6wzWQj3pFiXIlZn7h8+LNvDg8rY9rfLKNoOl1SIaw=;
 b=oXLsMTSjHJpa4LyN6N1wNCurZQCHCdXQbwxovrfMfXkxbFtg+Ix3pFaLyOunIseBaoPDw5
 xIok9fKcMMRmfE4JvEMIqO5Z6+jnkgydg2z6SCKS+GURmHhBtsS0cWFssaXqcv45v7cElZ4L
 GEqDDRufpOwga/f4n2gDsUN5Lljso=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][master][mickledore][PATCH] openssl: Upgrade 3.1.1 -> 3.1.2
Date: Tue,  1 Aug 2023 18:36:41 +0200
Message-Id: <20230801163641.1234605-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185357

From: Peter Marko <peter.marko@siemens.com>

https://github.com/openssl/openssl/blob/openssl-3.1/NEWS.md#major-changes-between-openssl-311-and-openssl-312-1-aug-2023
Major changes between OpenSSL 3.1.1 and OpenSSL 3.1.2 [1 Aug 2023]
* Fix excessive time spent checking DH q parameter value (CVE-2023-3817)
* Fix DH_check() excessive time with over sized modulus (CVE-2023-3446)
* Do not ignore empty associated data entries with AES-SIV (CVE-2023-2975)
* When building with the enable-fips option and using the resulting FIPS provider, TLS 1.2 will, by default, mandate the use of an extended master secret and the Hash and HMAC DRBGs will not operate with truncated digests.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/{openssl_3.1.1.bb => openssl_3.1.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.1.1.bb => openssl_3.1.2.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb b/meta/recipes-connectivity/openssl/openssl_3.1.2.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.1.1.bb
rename to meta/recipes-connectivity/openssl/openssl_3.1.2.bb
index c2a7173c84..817bfedee1 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.2.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "b3aa61334233b852b63ddb048df181177c2c659eb9d4376008118f9c08d07674"
+SRC_URI[sha256sum] = "a0ce69b8b97ea6a35b96875235aa453b966ba3cba8af2de23657d8b6767d6539"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.30.2


