Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29877C0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:14:31 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.17208.1690906462107764572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=iAEFml5y;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202308011614180d81ce3fe12385f896-yw7ebo@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202308011614180d81ce3fe12385f896
        for <openembedded-core@lists.openembedded.org>;
        Tue, 01 Aug 2023 18:14:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=XNxb3SGZXxL/6epe+F+91Rfn1LhnNxlmCOLCD1gerIk=;
 b=iAEFml5yB0EI9Y/JvwMBW45ZM6KQYu51eP0oxLqr6aeGetkXvKKwO5PpS+8qNDA9yTf9/c
 tPUQ0hjczRtgRf2nDOmIEL/xoIGOeoD4HjDE/LKuBfZqR0lqgGECJ/Q+h12u9CAaMWiXXtYF
 R2RcvKIpxASlPHRmbgSOC/zDvudJA=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] openssl: Upgrade 3.0.9 -> 3.0.10
Date: Tue,  1 Aug 2023 18:13:10 +0200
Message-Id: <20230801161310.624858-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185255

From: Peter Marko <peter.marko@siemens.com>

https://github.com/openssl/openssl/blob/openssl-3.0/NEWS.md#major-changes-between-openssl-309-and-openssl-3010-1-aug-2023
Major changes between OpenSSL 3.0.9 and OpenSSL 3.0.10 [1 Aug 2023]
* Fix excessive time spent checking DH q parameter value (CVE-2023-3817)
* Fix DH_check() excessive time with over sized modulus (CVE-2023-3446)
* Do not ignore empty associated data entries with AES-SIV (CVE-2023-2975)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/{openssl_3.0.9.bb => openssl_3.0.10.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.9.bb => openssl_3.0.10.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.9.bb b/meta/recipes-connectivity/openssl/openssl_3.0.10.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.0.9.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.10.bb
index 849bd7e5a6..ea4ba6cb88 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.9.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.10.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "eb1ab04781474360f77c318ab89d8c5a03abc38e63d65a603cabbf1b00a1dc90"
+SRC_URI[sha256sum] = "1761d4f5b13a1028b9b6f3d4b8e17feb0cedc9370f6afe61d7193d2cdce83323"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.30.2


