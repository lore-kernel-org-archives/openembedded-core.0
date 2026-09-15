Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4387FC88E7F
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 15:14:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25475.1789485273035066862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 08:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=DHmxcokj;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E23C6153B
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 08:14:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B8E93F882
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 08:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789485272; bh=27xKnHj2oLRxWl+lm0RmZJbATqYgyjtSGgKWczhUpwE=;
	h=From:To:Subject:Date:From;
	b=DHmxcokj0njtSUTX3UkVcWaila/a/f6szYcL2RIgpZLEMISdwxwxpn9+bb7daXzUd
	 KBLmTviA47Z1UQ0RDRpRkT1LgKxqCScd2OcBc/H9DuNTvDtcguN/qpdcrR9CQRxQ7P
	 BtgHMSQ2XiGJ5ZvHQbq8NRH5go8Q4MFCTSaXZy2s=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] curl: drop WATT_ROOT from EXTRA_OECONF
Date: Tue, 15 Sep 2026 16:14:29 +0100
Message-ID: <20260915151429.811504-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 15:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245857

This variable is now only used if checking for the Watt-32 library[1],
which is a TCP/IP library for MS DOS/Windows.

[1] https://github.com/curl/curl/pull/22380

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/curl/curl_8.22.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.22.0.bb b/meta/recipes-supp=
ort/curl/curl_8.22.0.bb
index ad3e6b728f7..3ccfcf7f2dd 100644
--- a/meta/recipes-support/curl/curl_8.22.0.bb
+++ b/meta/recipes-support/curl/curl_8.22.0.bb
@@ -89,7 +89,6 @@ EXTRA_OECONF =3D " \
     --enable-optimize \
     --with-ca-bundle=3D${CURL_CA_BUNDLE_BASE_DIR}/ssl/certs/ca-certifica=
tes.crt \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbed=
tls openssl schannel', d) =3D=3D '') else ''} \
-    WATT_ROOT=3D${STAGING_DIR_TARGET}${prefix} \
 "
=20
 fix_absolute_paths () {
--=20
2.43.0


