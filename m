Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AE4C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 17:11:03 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by mx.groups.io with SMTP id smtpd.web10.19698.1678381726387096886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 09:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@pm.me header.s=protonmail3 header.b=FE3if333;
 spf=pass (domain: pm.me, ip: 185.70.43.16, mailfrom: antoningodard@pm.me)
Date: Thu, 09 Mar 2023 17:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1678381722; x=1678640922;
	bh=IwyVNxw0DnYJjQtJ8Fe3qSYjkEn+btQI9KMyz/TeQZ8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FE3if333pbjuGw+4fF7Z1nXU5wNPQWCawYIE4RG0A11Cgiun4ppIT46wKQFHAOPJ8
	 9405PXDifm9FealEPy+Vw+LQIzLKkZPc5tUdqDh4WTHjcgLYY+FZ/W3CU88i9a5tOd
	 pukK7o/2aCgabV9lCirmPIYCLoYZmx2Rqko6Ymg9uAI30axGkja2kDY4nn/vJ+igxn
	 qlbIGSO9/upap+pfXB/yt5oObLhFvLaB5DuAmGDxFemJuaClF+s89ksHHAM58DCghM
	 qaXH7HLLkUBL9hCuBFQBPlxyq2nIa+gZO421c58WfNLQ7JQ51v1Qi9A7t/NeGRC3N+
	 v0FXeGHKgiOBQ==
To: openembedded-core@lists.openembedded.org
From: "Antonin Godard" <antoningodard@pm.me>
Cc: steve@sakoman.com, Antonin Godard <antoningodard@pm.me>
Subject: [dunfell][PATCH] openssl: upgrade 1.1.1s to 1.1.1t
Message-ID: <20230309170808.1994216-1-antoningodard@pm.me>
Feedback-ID: 17651652:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 17:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178260

Changes between 1.1.1s and 1.1.1t:

* Fixed X.400 address type confusion in X.509 GeneralName (CVE-2023-0286).
* Fixed Use-after-free following BIO_new_NDEF (CVE-2023-0215).
* Fixed Double free after calling PEM_read_bio_ex (CVE-2022-4450).
* Fixed Timing Oracle in RSA Decryption (CVE-2022-4304).

Signed-off-by: Antonin Godard <antoningodard@pm.me>
---
 .../openssl/{openssl_1.1.1s.bb =3D> openssl_1.1.1t.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1s.bb =3D> openssl_1=
.1.1t.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1s.bb b/meta/rec=
ipes-connectivity/openssl/openssl_1.1.1t.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
index 6c8f2859961..a1956ad8c2a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk =3D " \
            file://environment.d-openssl.sh \
            "

-SRC_URI[sha256sum] =3D "c5ac01e760ee6ff0dab61d6b2bbd30146724d063eb322180c6=
f18a6f74e4b6aa"
+SRC_URI[sha256sum] =3D "8dee9b24bdb1dcbf0c3d1e9b02fb8f6bf22165e807f45adeb7=
c9677536859d3b"

 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
--
2.25.1


