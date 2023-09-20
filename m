Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD71C04FD0
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 18:05:38 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.2614.1695233133765325375
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 11:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=OvNmkFRs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202309201805317de1e3507e9f956794-51ekst@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202309201805317de1e3507e9f956794
        for <openembedded-core@lists.openembedded.org>;
        Wed, 20 Sep 2023 20:05:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=jyRS/4argxahlYdN9EOW1c3eORT1fnq1nNxBsC2F7hE=;
 b=OvNmkFRsz+aokf1w+tCbBn2Cnze/ZwhnzOBrRtDiyg6DpuiEVKlbGRpsLxommgyzV1ph7B
 Zdx6vEaSNaT6VGWUji0r3SpkPqRE7j1n0t77UKS3HJIEmD5CZtnLK4KzmJBLM/8A1KzPCExD
 eaJMSOWle0dhddvPBVw8YioJZII6E=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] openssl: Upgrade 3.1.2 -> 3.1.3
Date: Wed, 20 Sep 2023 20:04:51 +0200
Message-Id: <20230920180451.3208374-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 18:05:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187939

From: Peter Marko <peter.marko@siemens.com>

https://github.com/openssl/openssl/blob/openssl-3.1/NEWS.md#major-changes-between-openssl-312-and-openssl-313-19-sep-2023
Major changes between OpenSSL 3.1.2 and OpenSSL 3.1.3 [19 Sep 2023]
* Fix POLY1305 MAC implementation corrupting XMM registers on Windows (CVE-2023-4807)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/{openssl_3.1.2.bb => openssl_3.1.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.1.2.bb => openssl_3.1.3.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.2.bb b/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.1.2.bb
rename to meta/recipes-connectivity/openssl/openssl_3.1.3.bb
index 3f77c218c8..cc9452c8ab 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.2.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "a0ce69b8b97ea6a35b96875235aa453b966ba3cba8af2de23657d8b6767d6539"
+SRC_URI[sha256sum] = "f0316a2ebd89e7f2352976445458689f80302093788c466692fb2a188b2eacf6"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.30.2


