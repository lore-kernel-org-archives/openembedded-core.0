Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28DCC61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 21:30:48 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32691.1787693444823580939
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 14:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=aH1iF94M;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260825213042b9e4756e6700020736-jm4bfr@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260825213042b9e4756e6700020736
        for <openembedded-core@lists.openembedded.org>;
        Tue, 25 Aug 2026 23:30:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=WAz4M4vQuQbclZwoI8VsgliYMiwKYbnvzYkKqKlki/o=;
 b=aH1iF94McV2/uoSX4nq8+tl5gB8WTwDULEgrcMQu53wVcnqcYvQophFbBEbeKe91WTd7ey
 kV30ioCE8O6aRaNxTQkcMIqsHT05dWNLYotau3xUuJ/i8Sxrmx84Nw/PdIwS9vewlGFKU0/4
 JOR06c2Zzu1/wpkdtaD50BzDMcgPaW57Es4sWuR1WaOITDsjqAsV9TzL9cyleZdr54rR7KhF
 WohQMlJSMQHgjYbVR5HArLEbxOsu99DAsTs8efn9KbUPCme102seZ4RCSmyNqvgji58Fw1xh
 3LFltwqATg4IvGqmBQ+SBc2N9bmurxPWroKhP4YQoaWfKf+ic6z8iuaA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] openssl: upgrade 3.5.7 -> 3.5.8
Date: Tue, 25 Aug 2026 23:28:46 +0200
Message-ID: <20260825212846.1758471-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 21:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244283

From: Peter Marko <peter.marko@siemens.com>

Release information [1]:

OpenSSL 3.5.8 is a security patch release. The most severe CVE fixed in this release is Moderate.
This release incorporates the following bug fixes and mitigations:
* Fixed QUIC server being able to trigger double free when processing INITIAL packet. (CVE-2026-18798)
* Fixed heap buffer overflow in CMS key unwrapping. (CVE-2026-63072)
* Fixed invalid pointer dereference in CMP server via crafted protectionAlg. (CVE-2026-63076)
* Fixed unbounded memory growth in QUIC server incoming channel queue. (CVE-2026-14456)
* Fixed RPK server signature algorithm selection being able to dereference a missing certificate. (CVE-2026-14457)
* Fixed excessive memory use buffering DTLS records for a future epoch. (CVE-2026-54874)
* Fixed untrusted Sender DN being used as a format string in CMP response validation. (CVE-2026-63073)
* Fixed CMP indefinite cache growth of extraCerts. (CVE-2026-63074)
* Fixed QUIC ACK-only packet retention being able to cause memory exhaustion. (CVE-2026-63075)
* Fixed possibility of AEAD forgeries with empty ciphertext when using EVP_Cipher(). (CVE-2026-75803)
* Fixed checking of authentication tags for empty ciphertexts for AEAD ciphers in CCM cipher mode.

[1] https://github.com/openssl/openssl/blob/openssl-3.5/NEWS.md#major-changes-between-openssl-357-and-openssl-358-25-aug-2026

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/{openssl_3.5.7.bb => openssl_3.5.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.7.bb => openssl_3.5.8.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb b/meta/recipes-connectivity/openssl/openssl_3.5.8.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.7.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.8.bb
index 0b8e8afec81..be52e228f10 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.8.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a24aa31aeac98e8"
+SRC_URI[sha256sum] = "a8f84a39918ec6415ce765d9b429d313ba97b8143169c172e734b9514464f5b2"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

