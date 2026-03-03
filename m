Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCDDEC1454
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 13:56:48 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18783.1772546200575760473
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 05:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm2 header.b=Hyegzv+O;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1334352-2026030313563700a74b712000020766-qtnjfm@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026030313563700a74b712000020766
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Mar 2026 14:56:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9445PHzlsuwRwvI4Wl03UalXiDl50Aure34JbUTWAoI=;
 b=Hyegzv+OlHsrl4yHfP/oN+CUMOXg1gqq29BnNm4X7XFFiDrTFETgXtkA0xymFccfNIim8X
 cOpUIU0+Hbg4kKcGImG3HfF88amOKDybDZfTD8kqWTnGYRyK+gelIg6Cumi9VYr+0bywt0Ds
 uBEF3b7+VNejOLYvrmohEnYLfOPSzB7P/fQRYoiGRMpWWLdHq5Gj2uqwdpMYoh/T5GzDDgIE
 hTU+GxdkdC4Rn87tPxI7iIrj3QN2vCan4/0grG+bqze4GbX9U5OTyw18ofN3tyrxtC/drQq/
 Oq4pt5e/GvlO2M/zgkok8fwOWcIsvTZfSLpwCRElTvIzT9JtJWF+X0jA==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [PATCH 1/6] ca-certificates: upgrade 20250419 -> 20260223
Date: Tue,  3 Mar 2026 14:36:40 +0100
Message-ID: <20260303133645.1449-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 13:56:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232316

Changelog:
 * Update Mozilla certificate authority bundle to version 2.82
    The following certificate authorities were added (+):
    + TrustAsia TLS ECC Root CA
    + TrustAsia TLS RSA Root CA
    + SwissSign RSA TLS Root CA 2022 - 1
    + OISTE Server Root ECC G1
    +  OISTE Server Root RSA G1
    The following certificate authorities were removed (-):
    - GlobalSign Root CA
    - Entrust.net Premium 2048 Secure Server CA
    - Baltimore CyberTrust Root (closes: #1121936)
    - Comodo AAA Services root
    - XRamp Global CA Root
    - Go Daddy Class 2 CA
    - Starfield Class 2 CA
    - CommScope Public Trust ECC Root-01
    - CommScope Public Trust ECC Root-02
    - CommScope Public Trust RSA Root-01
    - CommScope Public Trust RSA Root-02
  * Use dh_usrlocal to create /usr/local/share/ca-certificates

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 ...{ca-certificates_20250419.bb => ca-certificates_20260223.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20250419.bb => ca-certificates_20260223.bb} (97%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb b/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
similarity index 97%
rename from meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
index a11433c9da..41690d1d08 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "33b44ef78653ecd3f0f2f13e5bba6be466be2e7da72182f737912b81798ba5d2"
+SRC_URI[sha256sum] = "2fa2b00d4360f0d14ec51640ae8aea9e563956b95ea786e3c3c01c4eead42b56"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
-- 
2.47.3


