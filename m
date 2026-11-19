Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16190.1795099398839045146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 06:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pengutronix.de header.s=20260414 header.b=e++AmvjB;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: uol@pengutronix.de)
Received: from dude03.red.stw.pengutronix.de (dude03.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::39])
	(Authenticated sender: relay-from-dude03.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 904DD205821;
	Thu, 19 Nov 2026 15:43:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795099395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a6R8jgB892wy66cDUXrSFvzWwbmhilF/72w30FgdZnA=;
	b=e++AmvjBPkdiRC8q1sa+XyxNQJBLXQahAuMQdkELrzCgMOSx1PRVMdfwquIiwx9ObBXxDF
	7PCfaAFS955C0N4S5T/86k4ZMTqM0HS1CNcA5JKrppxwvW7zCiqE6jK1KhYYveR8hpj2ct
	5ApqP9j6bXu6lxKbLDhNPyBp1B9L39CxVWepuJNaxVxwAQ1X3kksnWOGx9uS/LD8lHRgVm
	0AzkM0cPN3P1G24M9C1lMp8DZOuwMWpLOUbI//86g/9wLV5M9MDnl5Z2ILx5I4Y622yDDe
	TrBQYPehsmeciZRnYGziODHRY4iT3WeRGUYbD/90EZPODTIJ5o4F3qkbvUUzew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795099395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a6R8jgB892wy66cDUXrSFvzWwbmhilF/72w30FgdZnA=;
	b=YDhtt/xgNd4rjpnZR0YRh0kcIMIAUsV1Zxf3oK73RtVCCfEumtju4hslzKkCpXS6dsaRc2
	31/HsrVDAXz61dRNh4evBVpGF899WSwK95PR84r4fjzkSIPbkH6sKulNs6y2xXDlAl+8Vp
	V9ti9MEtRbyqrwGf+1tV1y8ouT0aml3ITpnqkY3cDk7xN0ztBdu2pyVeIlmo4pfTlHn8+W
	Fd/+mdgg0wSW2fO0vTiZCUJ3jaQED71WLmF+ELuTgJ6CbzeCaDfWpm9sJCcUTc5SPeNYN+
	nux0Z/8j8FAXdLsuDSQVhgBMQlipXdsV9CuCm2cW12pTBbuhVFIvbUOn7pTXUg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795099395; a=rsa-sha256;
	cv=none;
	b=QhE2skSA5xQcKeaulsma8wgDEEfyATTpBEe6DXZ+J+Jnz/5KV/loLMuHYugw/1MPevhPQj
	KVFuyF7xfuRIngRY/RFw/m1l0xNXujxMi7BhaaR7CGwLVJ1SllDrBNL2y7D5BYlRiH8UNA
	WAhv1as8qsfaHB5252al4wBSQwghd52F9zVZX93Q5mEcdoPaA9/0j1Hsj5Aqdrgb6ohGIR
	OAuQDdKJR7Lh/oOtxhITQJfrKGn29q3AfsDtHN1EGPFJtojl/VIp6xBmDoex0kqLTWj6is
	4W/vkpL/pLxaLF+DZpBgKKreF0C/GIBAnd79kbzVLDRrF8MZlO9MxwYTWZoNww==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude03.red.stw.pengutronix.de smtp.mailfrom=uol@pengutronix.de
Received: by dude03.red.stw.pengutronix.de (Postfix, from userid 1052)
	id 79FA82CADB7; Thu, 19 Nov 2026 15:43:15 +0100 (CET)
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] documentation.conf: fix typo
Date: Thu, 19 Nov 2026 15:43:06 +0100
Message-ID: <20261119144306.1655505-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 14:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250680

Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
---
 meta/conf/documentation.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 08de68e0ed7e..2a3c7f80a234 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -139,7 +139,7 @@ DISTRO_EXTRA_RDEPENDS[doc] =3D "Specifies a list of d=
istro-specific packages to ad
 DISTRO_EXTRA_RRECOMMENDS[doc] =3D "Specifies a list of distro-specific p=
ackages to add to all images if the packages exist. The list of packages =
are automatically installed but you can remove them."
 DISTRO_FEATURES[doc] =3D "The features enabled for the distribution."
 DISTRO_FEATURES_DEFAULTS[doc] =3D "The default set of distribution featu=
res, prior to any filtering. Usually you should leave this alone and modi=
fy DISTRO_FEATURES and/or DISTRO_FEATURES_OPTED_OUT."
-DISTRO_FEATURES_OPTED_OUT[doc] =3D "The set of default distribtion featu=
res to disable. Prefer opting out of features using this variable instead=
 of using DISTRO_FEATURES:remove."
+DISTRO_FEATURES_OPTED_OUT[doc] =3D "The set of default distribution feat=
ures to disable. Prefer opting out of features using this variable instea=
d of using DISTRO_FEATURES:remove."
 DISTRO_NAME[doc] =3D "The long name of the distribution."
 DISTRO_PN_ALIAS[doc] =3D "Alias names used for the recipe in various Lin=
ux distributions."
 DISTRO_VERSION[doc] =3D "The version of the distribution."
--=20
2.47.3

