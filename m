Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A780C07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 21:13:03 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.29676.1698181975428598857
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 14:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=C8oNpebj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202310242112502b8da3e61c974350e4-ryb_kq@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202310242112502b8da3e61c974350e4
        for <openembedded-core@lists.openembedded.org>;
        Tue, 24 Oct 2023 23:12:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=N5c4kznO4YY0j1h6F2VnWxMbXvFKeSGd1uPxcsJyXMc=;
 b=C8oNpebj4hTn0G5+40VqHxNLgyi7aJwqSmMELgdCC1FTHGmGjpQAImGYlZ1Qha9Dbystqd
 H+YTCGv1jr3py5TDnTvxTEvom37dtKBYG9vG58sTDKlwldqYDmlZc/LNxz6IIpD3kjsrGxyl
 aLTPDqYsH+knNTIT3eahPL23CcQbQ=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] openssl: Upgrade 3.0.11 -> 3.0.12
Date: Tue, 24 Oct 2023 23:12:03 +0200
Message-Id: <20231024211203.3224064-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 21:13:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189657

From: Peter Marko <peter.marko@siemens.com>

https://github.com/openssl/openssl/blob/openssl-3.0/NEWS.md#major-changes-between-openssl-3011-and-openssl-3012-24-oct-2023

Major changes between OpenSSL 3.0.11 and OpenSSL 3.0.12 [24 Oct 2023]
* Mitigate incorrect resize handling for symmetric cipher keys and IVs. (CVE-2023-5363)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/{openssl_3.0.11.bb => openssl_3.0.12.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.11.bb => openssl_3.0.12.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.11.bb b/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.0.11.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.12.bb
index 22eaa3af33..d8c9b073a2 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.11.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "b3425d3bb4a2218d0697eb41f7fc0cdede016ed19ca49d168b78e8d947887f55"
+SRC_URI[sha256sum] = "f93c9e8edde5e9166119de31755fc87b4aa34863662f67ddfcba14d0b6b69b61"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.30.2


