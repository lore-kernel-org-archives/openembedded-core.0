Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1184.1795710413496352791
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 08:26:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=fVCF90U0;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEF9B1BA8
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 08:26:49 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E6593F86F
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 08:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795710412; bh=ZrEbDwSNKTzQq+ZomKQz89aGip1vgdQR1qykUy5N+dU=;
	h=From:To:Subject:Date:From;
	b=fVCF90U0NPndRBo1tJSWqkM2X+CTgky6eK3nNg/BDvynpGGPEDlv/Fd42/VR7YwW6
	 5628d96xS4aZAhBOjMp72yIaZa75KVVWjC/qVpFwejcGgBeTLwXvaYCLL8pCWmgTjz
	 erevIEzQn5hAyvQQUjt9bt5T5kTH0x6aDXBVq05c=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-kirk: depend on python3-netclient
Date: Thu, 26 Nov 2026 16:26:48 +0000
Message-ID: <20261126162648.3337393-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 16:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251321
Content-Type: text/plain; charset="utf-8"

Kirk uses the secrets module, which is part of python3-netclient.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/python3-kirk/python3-kirk_4.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/python3-kirk/python3-kirk_4.2.0.bb b/m=
eta/recipes-extended/python3-kirk/python3-kirk_4.2.0.bb
index d6128292554..1730fc69aa4 100644
--- a/meta/recipes-extended/python3-kirk/python3-kirk_4.2.0.bb
+++ b/meta/recipes-extended/python3-kirk/python3-kirk_4.2.0.bb
@@ -11,4 +11,4 @@ SRC_URI[sha256sum] =3D "92007f840a2a0af387b6f0d88f51f5c=
710853238ff3bd9d2b91a34f731
=20
 inherit pypi python_setuptools_build_meta
=20
-RDEPENDS:${PN} +=3D "python3-asyncio python3-json"
+RDEPENDS:${PN} +=3D "python3-asyncio python3-json python3-netclient"
--=20
2.43.0

