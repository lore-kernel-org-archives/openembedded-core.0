Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id CB7506B3A4;
	Sun, 15 Jun 2014 22:55:55 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q59so4835606wes.40
	for <multiple recipients>; Sun, 15 Jun 2014 15:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KQuhzDLkFp04UGPFTAyd4CY9Nz+/gRG3ylvn8DKF1Xw=;
	b=nKFb05yvUH4vgnsh9HOLvE9bPNght/UUrvZinfPt7A3Zyz+/2+oqzyMH8svu6MO4jc
	sEyTX8pjbzy5alteun1hc/rxgW+FVYnYChYJ8R70J5sGU4qE9oyaxOmxZx3n1TfiXVzI
	/OI8KkjUHEV/UR5/0B4QRroG24FciLDRj1/WlHY9RpxgOeev7+qcV2fR39qyldfUkwBo
	0x6vPic/3dv8MZ1Bxh2RaBzMJQanZpPij7+ubYagat+cAyb/DNG2h/SbJ8pL0vK/Wolv
	NLMbtEhnzwEzZeO93po+6NX7Dv3K9pzmdQWVDKt+lxcm9JYJdnVStkgorPWwNgaPrVPr
	nSgA==
X-Received: by 10.194.2.75 with SMTP id 11mr23344506wjs.48.1402872956166;
	Sun, 15 Jun 2014 15:55:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u7sm29691805eeo.23.2014.06.15.15.55.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jun 2014 15:55:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Jun 2014 00:56:18 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20140615225618.GL2428@jama>
References: <20140613113218.C57E750446@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140613113218.C57E750446@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Chong Lu : kexec-tools: Refine kdump device_tree sort
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Jun 2014 22:56:02 -0000
X-Groupsio-MsgNum: 54117
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9/GiYV45wF7IL3Iq"
Content-Disposition: inline

--9/GiYV45wF7IL3Iq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

FYI: this will probably break
meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb

because it doesn't have kexec-tools directory in FILESPATH

WARNING: Unable to get checksum for kexec-tools-klibc SRC_URI entry
kexec-tools-Refine-kdump-device_tree-sort.patch: file could not be found

On Fri, Jun 13, 2014 at 11:32:18AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: c8722b510f779cd20757477a7f7a7a2a35b9a9c5
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dc8722b510f779cd20757477a7f7a7a2a35b9a9c5
>=20
> Author: Chong Lu <Chong.Lu@windriver.com>
> Date:   Tue Jun 10 18:13:39 2014 +0800
>=20
> kexec-tools: Refine kdump device_tree sort
>=20
> The commit b02d735bf was to rearrange the device-tree entries, and
> assumed that these entries are sorted in the ascending order. but
> acctually when I was validating kexec and kdump, the order of
> serial node still is changed. So the patch is to sort these entries
> by the directory name in ascending order.
>=20
> Signed-off-by: Yang Wei <Wei.Yang@windriver.com>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-kernel/kexec/kexec-tools.inc          |  3 +-
>  ...kexec-tools-Refine-kdump-device_tree-sort.patch | 82 ++++++++++++++++=
++++++
>  2 files changed, 84 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-kernel/kexec/kexec-tools.inc b/meta/recipes-ker=
nel/kexec/kexec-tools.inc
> index 50b448c..6a690c6 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools.inc
> +++ b/meta/recipes-kernel/kexec/kexec-tools.inc
> @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dea5bed2f60d357=
618ca161ad539f7c0a \
>                      file://kexec/kexec.c;beginline=3D1;endline=3D20;md5=
=3Daf10f6ae4a8715965e648aa687ad3e09"
>  DEPENDS =3D "zlib xz"
> =20
> -SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${=
PV}.tar.gz"
> +SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${=
PV}.tar.gz \
> +           file://kexec-tools-Refine-kdump-device_tree-sort.patch"
> =20
>  inherit autotools-brokensep
> =20
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/kexec-tools-Refine-kdu=
mp-device_tree-sort.patch b/meta/recipes-kernel/kexec/kexec-tools/kexec-too=
ls-Refine-kdump-device_tree-sort.patch
> new file mode 100644
> index 0000000..ab1fe96
> --- /dev/null
> +++ b/meta/recipes-kernel/kexec/kexec-tools/kexec-tools-Refine-kdump-devi=
ce_tree-sort.patch
> @@ -0,0 +1,82 @@
> +kexec-tools: Refine kdump device_tree sort
> +
> +The commit b02d735bf was to rearrange the device-tree entries, and
> +assumed that these entries are sorted in the ascending order. but
> +acctually when I was validating kexec and kdump, the order of
> +serial node still is changed. So the patch is to sort these entries
> +by the directory name in ascending order.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Yang Wei <Wei.Yang@windriver.com>
> +Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> +---
> + kexec/arch/ppc/fs2dt.c |   13 ++++++++++---
> + kexec/fs2dt.c          |   13 ++++++++++---
> + 2 files changed, 20 insertions(+), 6 deletions(-)
> +
> +diff --git a/kexec/arch/ppc/fs2dt.c b/kexec/arch/ppc/fs2dt.c
> +index 4121c7d..cc04b04 100644
> +--- a/kexec/arch/ppc/fs2dt.c
> ++++ b/kexec/arch/ppc/fs2dt.c
> +@@ -296,6 +296,9 @@ static int comparefunc(const void *dentry1, const vo=
id *dentry2)
> + {
> + 	char *str1 =3D (*(struct dirent **)dentry1)->d_name;
> + 	char *str2 =3D (*(struct dirent **)dentry2)->d_name;
> ++	char* ptr1 =3D strchr(str1, '@');
> ++	char* ptr2 =3D strchr(str2, '@');
> ++	int len1, len2;
> +=20
> + 	/*
> + 	 * strcmp scans from left to right and fails to idetify for some
> +@@ -303,9 +306,13 @@ static int comparefunc(const void *dentry1, const v=
oid *dentry2)
> + 	 * Therefore, we get the wrong sorted order like memory@10000000 and
> + 	 * memory@f000000.
> + 	 */
> +-	if (strchr(str1, '@') && strchr(str2, '@') &&
> +-		(strlen(str1) > strlen(str2)))
> +-		return 1;
> ++	if (ptr1 && ptr2) {
> ++		len1 =3D ptr1 - str1;
> ++		len2 =3D ptr2 - str2;
> ++		if (!strncmp(str1, str2, len1 >len2 ? len1: len2) &&
> ++					(strlen(str1) > strlen(str2)))
> ++				return 1;
> ++	}
> +=20
> + 	return strcmp(str1, str2);
> + }
> +diff --git a/kexec/fs2dt.c b/kexec/fs2dt.c
> +index 5e6b98d..1c0345b 100644
> +--- a/kexec/fs2dt.c
> ++++ b/kexec/fs2dt.c
> +@@ -475,6 +475,9 @@ static int comparefunc(const struct dirent **dentry1,
> + {
> + 	char *str1 =3D (*(struct dirent **)dentry1)->d_name;
> + 	char *str2 =3D (*(struct dirent **)dentry2)->d_name;
> ++	char* ptr1 =3D strchr(str1, '@');
> ++	char* ptr2 =3D strchr(str2, '@');
> ++	int len1, len2;
> +=20
> + 	/*
> + 	 * strcmp scans from left to right and fails to idetify for some
> +@@ -482,9 +485,13 @@ static int comparefunc(const struct dirent **dentry=
1,
> + 	 * Therefore, we get the wrong sorted order like memory@10000000 and
> + 	 * memory@f000000.
> + 	 */
> +-	if (strchr(str1, '@') && strchr(str2, '@') &&
> +-		(strlen(str1) > strlen(str2)))
> +-		return 1;
> ++	if (ptr1 && ptr2) {
> ++		len1 =3D ptr1 - str1;
> ++		len2 =3D ptr2 - str2;
> ++		if (!strncmp(str1, str2, len1 >len2 ? len1: len2) &&
> ++					(strlen(str1) > strlen(str2)))
> ++				return 1;
> ++	}
> +=20
> + 	return strcmp(str1, str2);
> + }
> +--=20
> +1.7.9.5
> +
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9/GiYV45wF7IL3Iq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOeJJIACgkQN1Ujt2V2gByvPwCgsVTfqNr2Pp1QHhpcC7Zz7Ejn
4D0AnReGDOt1RceCgi+/IjU540XuSUJF
=ah/z
-----END PGP SIGNATURE-----

--9/GiYV45wF7IL3Iq--
