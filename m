Return-Path: <heiko.thole@entwicklung.eq-3.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443A3EB64DA
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 04:28:51 +0000 (UTC)
Subject: [kirkstone][PATCH] wic: Add dependencies for erofs-utils
To: openembedded-core@lists.openembedded.org
From: "Heiko" <heiko.thole@entwicklung.eq-3.de>
X-Originating-Location: Papenburg, Lower Saxony, DE (84.140.29.160)
X-Originating-Platform: Windows Chrome 114
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 13 Jul 2023 21:28:50 -0700
Message-ID: <jSoT.1689308930141918532.7s80@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="x6F7iEj9S4XrLHan5nwO"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 04:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184251

--x6F7iEj9S4XrLHan5nwO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From 2d8164ac97277c344bc7c9e11f0ed78235726bda Mon Sep 17 00:00:00 2001
From: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
Date: Wed, 12 Jul 2023 07:41:59 +0200
Subject: [kirkstone][PATCH] wic: Add dependencies for erofs-utils

In order to build erofs filesystems, wic must have the erofs-utils package =
installed into its sysroot.

Signed-off-by: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
---
meta/classes/image_types_wic.bbclass | 2 +-
meta/recipes-core/meta/wic-tools.bb=C2=A0 | 2 +-
scripts/lib/wic/misc.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
 +
3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_type=
s_wic.bbclass
index 6453dd1b74..8497916d48 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -83,7 +83,7 @@ do_image_wic[recrdeptask] +=3D "do_deploy"
do_image_wic[deptask] +=3D "do_image_complete"

WKS_FILE_DEPENDS_DEFAULT =3D '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86=
_64', 'i686' ], "syslinux-native", "",d)}'
-WKS_FILE_DEPENDS_DEFAULT +=3D "bmap-tools-native cdrtools-native btrfs-too=
ls-native squashfs-tools-native e2fsprogs-native"
+WKS_FILE_DEPENDS_DEFAULT +=3D "bmap-tools-native cdrtools-native btrfs-too=
ls-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
# Unified kernel images need objcopy
WKS_FILE_DEPENDS_DEFAULT +=3D "virtual/${MLPREFIX}${TARGET_PREFIX}binutils"
WKS_FILE_DEPENDS_BOOTLOADERS =3D ""
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/w=
ic-tools.bb
index daaf3ea576..9282d36a4d 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -6,7 +6,7 @@ DEPENDS =3D "\
parted-native gptfdisk-native dosfstools-native \
mtools-native bmap-tools-native grub-native cdrtools-native \
btrfs-tools-native squashfs-tools-native pseudo-native \
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e2fsprogs-native util-linux-nativ=
e tar-native \
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e2fsprogs-native util-linux-nativ=
e tar-native erofs-utils-native \
virtual/${TARGET_PREFIX}binutils \
"
DEPENDS:append:x86 =3D " syslinux-native syslinux grub-efi systemd-boot"
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index a8aab6c524..2b90821b30 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -36,6 +36,7 @@ NATIVE_RECIPES =3D {"bmaptool": "bmap-tools",
"mkdosfs": "dosfstools",
"mkisofs": "cdrtools",
"mkfs.btrfs": "btrfs-tools",
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "mkfs.erofs=
": "erofs-utils",
"mkfs.ext2": "e2fsprogs",
"mkfs.ext3": "e2fsprogs",
"mkfs.ext4": "e2fsprogs",
--
2.41.0

--x6F7iEj9S4XrLHan5nwO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>From 2d8164ac97277c344bc7c9e11f0ed78235726bda Mon Sep 17 00:00:00 2001=
</div>
<div>From: Heiko Thole &lt;heiko.thole@entwicklung.eq-3.de&gt;</div>
<div>Date: Wed, 12 Jul 2023 07:41:59 +0200</div>
<div>Subject: [kirkstone][PATCH] wic: Add dependencies for erofs-utils</div=
>
<div>&nbsp;</div>
<div>In order to build erofs filesystems, wic must have the erofs-utils pac=
kage installed into its sysroot.</div>
<div>&nbsp;</div>
<div>Signed-off-by: Heiko Thole &lt;heiko.thole@entwicklung.eq-3.de&gt;</di=
v>
<div>---</div>
<div>&nbsp;meta/classes/image_types_wic.bbclass | 2 +-</div>
<div>&nbsp;meta/recipes-core/meta/wic-tools.bb&nbsp; | 2 +-</div>
<div>&nbsp;scripts/lib/wic/misc.py&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; | 1 +</div>
<div>&nbsp;3 files changed, 3 insertions(+), 2 deletions(-)</div>
<div>&nbsp;</div>
<div>diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image=
_types_wic.bbclass</div>
<div>index 6453dd1b74..8497916d48 100644</div>
<div>--- a/meta/classes/image_types_wic.bbclass</div>
<div>+++ b/meta/classes/image_types_wic.bbclass</div>
<div>@@ -83,7 +83,7 @@ do_image_wic[recrdeptask] +=3D "do_deploy"</div>
<div>&nbsp;do_image_wic[deptask] +=3D "do_image_complete"</div>
<div>&nbsp;</div>
<div>&nbsp;WKS_FILE_DEPENDS_DEFAULT =3D '${@bb.utils.contains_any("BUILD_AR=
CH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'</div>
<div>-WKS_FILE_DEPENDS_DEFAULT +=3D "bmap-tools-native cdrtools-native btrf=
s-tools-native squashfs-tools-native e2fsprogs-native"</div>
<div>+WKS_FILE_DEPENDS_DEFAULT +=3D "bmap-tools-native cdrtools-native btrf=
s-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"</=
div>
<div>&nbsp;# Unified kernel images need objcopy</div>
<div>&nbsp;WKS_FILE_DEPENDS_DEFAULT +=3D "virtual/${MLPREFIX}${TARGET_PREFI=
X}binutils"</div>
<div>&nbsp;WKS_FILE_DEPENDS_BOOTLOADERS =3D ""</div>
<div>diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/m=
eta/wic-tools.bb</div>
<div>index daaf3ea576..9282d36a4d 100644</div>
<div>--- a/meta/recipes-core/meta/wic-tools.bb</div>
<div>+++ b/meta/recipes-core/meta/wic-tools.bb</div>
<div>@@ -6,7 +6,7 @@ DEPENDS =3D "\</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; parted-native gptfdisk-nativ=
e dosfstools-native \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mtools-native bmap-tools-nat=
ive grub-native cdrtools-native \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; btrfs-tools-native squashfs-=
tools-native pseudo-native \</div>
<div>-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;e2fsprogs-native util-linux-=
native tar-native \</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;e2fsprogs-native util-linux-=
native tar-native erofs-utils-native \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; virtual/${TARGET_PREFIX}binu=
tils \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "</div>
<div>&nbsp;DEPENDS:append:x86 =3D " syslinux-native syslinux grub-efi syste=
md-boot"</div>
<div>diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py</div>
<div>index a8aab6c524..2b90821b30 100644</div>
<div>--- a/scripts/lib/wic/misc.py</div>
<div>+++ b/scripts/lib/wic/misc.py</div>
<div>@@ -36,6 +36,7 @@ NATIVE_RECIPES =3D {"bmaptool": "bmap-tools",</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"=
mkdosfs": "dosfstools",</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"=
mkisofs": "cdrtools",</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"=
mkfs.btrfs": "btrfs-tools",</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "mkfs.=
erofs": "erofs-utils",</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"=
mkfs.ext2": "e2fsprogs",</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"=
mkfs.ext3": "e2fsprogs",</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"=
mkfs.ext4": "e2fsprogs",</div>
<div>--&nbsp;</div>
<div>2.41.0</div>
<div>&nbsp;</div>

--x6F7iEj9S4XrLHan5nwO--

