Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.490.1607970713540934437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 10:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 052A5D6E
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 10:31:53 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C3513F718
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 10:31:52 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/7] wic-tools: don't build syslinux-native for targets without syslinux
Date: Mon, 14 Dec 2020 18:31:44 +0000
Message-Id: <20201214183148.2673069-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214183148.2673069-1-ross.burton@arm.com>
References: <20201214183148.2673069-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If we're not building syslinux, then there's no point building
syslinux-native.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/meta/wic-tools.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta=
/wic-tools.bb
index 3e7d0ed48d..f04f767646 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -3,14 +3,14 @@ SUMMARY =3D "A meta recipe to build native tools used b=
y wic."
 LICENSE =3D "MIT"
=20
 DEPENDS =3D "\
-           parted-native syslinux-native gptfdisk-native dosfstools-nati=
ve \
+           parted-native gptfdisk-native dosfstools-native \
            mtools-native bmap-tools-native grub-native cdrtools-native \
            btrfs-tools-native squashfs-tools-native pseudo-native \
            e2fsprogs-native util-linux-native tar-native\
            "
-DEPENDS_append_x86 =3D " syslinux grub-efi systemd-boot"
-DEPENDS_append_x86-64 =3D " syslinux grub-efi systemd-boot"
-DEPENDS_append_x86-x32 =3D " syslinux grub-efi"
+DEPENDS_append_x86 =3D " syslinux-native syslinux grub-efi systemd-boot"
+DEPENDS_append_x86-64 =3D " syslinux-native syslinux grub-efi systemd-bo=
ot"
+DEPENDS_append_x86-x32 =3D " syslinux-native syslinux grub-efi"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
--=20
2.25.1

