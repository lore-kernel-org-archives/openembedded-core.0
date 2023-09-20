Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDABBC04EB5
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 18:04:48 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.2410.1695233081581337027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 11:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=dq5Beq1Q;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20230920180438a2d38fde253284356f-tjmwyf@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20230920180438a2d38fde253284356f
        for <openembedded-core@lists.openembedded.org>;
        Wed, 20 Sep 2023 20:04:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=oKSyrivKhdNIa5jqc+0AeNrwlIY9GqV3MMw1q+5xvRk=;
 b=dq5Beq1QU6MWA7mHkHtkZZri+AdM2aTBFl7XKfpKqlBtrWTLoI4B2ggZVwYMjxsZzHx44H
 KAff96CqsSEfXfXMuN7TJ6+G65mNsef5Jk1UscasRyrcg8G4lBvyiGC1MNCIFZlPlhsjKkFX
 PAhimizvSP4TzeqPF4VwY3rbOcv9E=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] openssl: Upgrade 3.0.10 -> 3.0.11
Date: Wed, 20 Sep 2023 20:03:45 +0200
Message-Id: <20230920180345.3208310-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 18:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187938

From: Peter Marko <peter.marko@siemens.com>

https://github.com/openssl/openssl/blob/openssl-3.0/NEWS.md#major-changes-between-openssl-3010-and-openssl-3011-19-sep-2023
Major changes between OpenSSL 3.0.10 and OpenSSL 3.0.11 [19 Sep 2023]
* Fix POLY1305 MAC implementation corrupting XMM registers on Windows (CVE-2023-4807)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/{openssl_3.0.10.bb => openssl_3.0.11.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.10.bb => openssl_3.0.11.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.10.bb b/meta/recipes-connectivity/openssl/openssl_3.0.11.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.0.10.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.11.bb
index c770f1c712..22eaa3af33 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.10.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.11.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "1761d4f5b13a1028b9b6f3d4b8e17feb0cedc9370f6afe61d7193d2cdce83323"
+SRC_URI[sha256sum] = "b3425d3bb4a2218d0697eb41f7fc0cdede016ed19ca49d168b78e8d947887f55"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.30.2


