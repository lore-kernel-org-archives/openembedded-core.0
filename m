Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.499.1607970715767615671
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 10:31:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7611231B
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 10:31:55 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 168583F718
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 10:31:54 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 7/7] wic-tools: add grub-efi and systemd-boot on arm64
Date: Mon, 14 Dec 2020 18:31:48 +0000
Message-Id: <20201214183148.2673069-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214183148.2673069-1-ross.burton@arm.com>
References: <20201214183148.2673069-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These both now work on arm64, so add them to the dependencies.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/meta/wic-tools.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta=
/wic-tools.bb
index f04f767646..bc6cc0d183 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -11,6 +11,7 @@ DEPENDS =3D "\
 DEPENDS_append_x86 =3D " syslinux-native syslinux grub-efi systemd-boot"
 DEPENDS_append_x86-64 =3D " syslinux-native syslinux grub-efi systemd-bo=
ot"
 DEPENDS_append_x86-x32 =3D " syslinux-native syslinux grub-efi"
+DEPENDS_append_aarch64 =3D " grub-efi systemd-boot"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
--=20
2.25.1

