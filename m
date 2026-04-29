Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B370DCCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:48:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.927.1777481307901315735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 09:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ZuNJ9QV7;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CBAA1BB0
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:21 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A87F73F62B
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777481307; bh=HRspzq76R9gOxQzWvTWUvbYY7y2HPBQF+s6TjOxVc6g=;
	h=From:To:Subject:Date:From;
	b=ZuNJ9QV7vBhEjtK+rJ9LpzY1utVyC1NAyRqop4A/FPDpqrWGjFxL+EO1HeQp0R9x6
	 A03kAWekrWggwFNTVzveiCSIe2vaT8IGnTrEAfMxThNFEFI8RZdrvPbA3Orf6kdIEJ
	 fj9uB6LiwzAJGcf2L4V6cUxNTYQ52g2PBKLI1Tv0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] bitbake add firmwaredir
Date: Wed, 29 Apr 2026 17:48:12 +0100
Message-ID: <20260429164821.3425757-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 16:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236113

---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 24e095632e9..181221facd6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -40,6 +40,7 @@ export systemd_unitdir =3D "${nonarch_base_libdir}/syst=
emd"
 export systemd_system_unitdir =3D "${nonarch_base_libdir}/systemd/system=
"
 export nonarch_libdir =3D "${exec_prefix}/lib"
 export systemd_user_unitdir =3D "${nonarch_libdir}/systemd/user"
+firmwaredir =3D "${nonarch_base_libdir}/firmware"
=20
 # Architecture dependent paths
 export bindir =3D "${exec_prefix}/bin"
--=20
2.43.0


