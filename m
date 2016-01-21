Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB6C731F7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 11:56:13 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u188so10341272wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 03:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bwljS1XkvzUiOvFCyUnKf5d3rIdUQb8Kaqp8ftHAn+k=;
	b=B8a9J/w0jjLZWfqxj2Gt8RabBK3zvRTayzMMwMZYV9GcdTnsdPFZAFvBq/iO0RwhIx
	icjAWpsVHcufAi3BJAsfUasRM37SoaZXZn0hMxQZhHN1kLePK7lcUvqc6wLK92XIUtjl
	cMCRHRRjEWenjma55gOi/oKHqNUCaT5J4yOn2kpXLFR/Zawv/zC86/B5TCk/9YwvPwu9
	KOeirsx1IZpEdlUxwo6tD08aLn0H+t2cMV67muPzjk8SlIr2abxm1RGuZTsdbXuUvINH
	FCgQLMSeEoMaNX0NLO4OC9hU8OuIJkYFZDlIyxlLKHHJgYt3gQUMaqBfA9v5M6hlMjST
	EOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=bwljS1XkvzUiOvFCyUnKf5d3rIdUQb8Kaqp8ftHAn+k=;
	b=Yh8swmLfWNl1fn0T835VDvh/9EfuKi2rXiG6cq/Y18l4W/hacz78MUzRIMeFwVZnaQ
	19EvPklg5+xIu73xGLDcUzfxn0taQBdLB4FNmLW9l7tfRrHOFBvVbP9pZ09oSIM+lESP
	tIHq7V1FmJphdEpRUE9zCYby2eyea9C5SNY3RAwPfj5O+zSu3Fhb02Rl3tkgVTaKTI4P
	CuR1PsAHa2kK5nIkI4wxmfvhMqhMZwfS0z3X54H4MF0yTwaWpIkyX5hQbgEJ8tWNruXs
	Tjqox4hEuI4tyxobNTNxOCxCNgQXEzAkvydx4W3ijDh5841txWaDmEHwK2XKxeb2s7SM
	+ZlA==
X-Gm-Message-State: AG10YOR8ku5Pg/+iIFYYgOXp+F6BeULaoOpo/8glZt18rEjok1Xse6P9RnY92VZmjkktlw==
X-Received: by 10.28.0.79 with SMTP id 76mr10468272wma.27.1453377374351;
	Thu, 21 Jan 2016 03:56:14 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id i2sm1110507wjx.42.2016.01.21.03.56.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jan 2016 03:56:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 21 Jan 2016 12:57:52 +0100
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20160121115752.GA2603@jama>
References: <cover.1452385571.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/20] Dizzy-next pull request 2016-1
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
X-List-Received-Date: Thu, 21 Jan 2016 11:56:14 -0000
X-Groupsio-MsgNum: 76617
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 09, 2016 at 04:30:26PM -0800, Armin Kuster wrote:
> Please consider these changes for dizzy-next community support.
>=20
> The following changes since commit 6d34267e0a13e10ab91b60590b27a2b5ba3b7d=
a6:
>=20
>   documentation: Changed some 'intro' tags to resolve multiple mega-manua=
l warnings. (2015-11-18 16:44:05 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
>   http://git.yoctoproject.org/cgit.cgi//log/?h=3Dakuster/dizzy-next

This is for oe-core, right? So it shouldn't be in poky-contrib and the
http link doesn't work, it should be:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dakuster/dizzy-ne=
xt

>=20
> Armin Kuster (2):
>   openssh: CVE-2015-6563 CVE-2015-6564 CVE-2015-6565
>   Fixes a heap buffer overflow in glibc wscanf.

What is this 2nd patch? It doesn't follow commit summary convention and
I don't see it in master (at least not with this subject)
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Dakuster/dizzy=
-next&id=3D4807ff0ca0abf085e6b81257534a4a62fde88d16

Other changes look good to me.

> Belal, Awais (1):
>   grub2: Fix CVE-2015-8370
>=20
> Chen Qi (1):
>   image.bbclass: don't let do_rootfs depend on BUILDNAME
>=20
> Martin Jansa (3):
>   fontcache: allow to pass extra parameters and environment to fc-cache
>   texinfo: don't create dependency on INHERIT variable
>   linux-dtb.inc: drop unused DTB_NAME variable from do_install
>=20
> Mike Crowe (1):
>   allarch: Force TARGET_*FLAGS variable values
>=20
> Richard Purdie (2):
>   layer.conf: Add several allarch dependency exclusions
>   layer.conf: Add missing dependency for allarch package
>     initramfs-framework
>=20
> Sergiy Kibrik (1):
>   rsync: backport libattr checking patch
>=20
> Sona Sarmadi (7):
>   libtasn1: CVE-2015-3622
>   grep2.19: CVE-2015-1345
>   libxml2: CVE-2015-7942
>   libxml2: CVE-2015-8035
>   openssl: CVE-2015-3194, CVE-2015-3195
>   libxml2: CVE-2015-8241
>   bind: CVE-2015-8000
>=20
> Tudor Florea (2):
>   glibc: use patch for CVE-2015-1781
>   unzip: CVE-2015-7696, CVE-2015-7697
>=20
>  meta/classes/allarch.bbclass                       |   4 +
>  meta/classes/fontcache.bbclass                     |  19 +-
>  meta/classes/image.bbclass                         |   2 +-
>  meta/conf/layer.conf                               |  11 ++
>  ...E-2015-8370-Grub2-user-pass-vulnerability.patch |  50 ++++++
>  meta/recipes-bsp/grub/grub-efi_2.00.bb             |   1 +
>  meta/recipes-bsp/grub/grub_2.00.bb                 |   1 +
>  .../bind/bind/CVE-2015-8000.patch                  | 194 +++++++++++++++=
++++++
>  meta/recipes-connectivity/bind/bind_9.9.5.bb       |   1 +
>  .../openssh/openssh/CVE-2015-6563.patch            |  36 ++++
>  .../openssh/openssh/CVE-2015-6564.patch            |  34 ++++
>  .../openssh/openssh/CVE-2015-6565.patch            |  35 ++++
>  meta/recipes-connectivity/openssh/openssh_6.6p1.bb |   5 +-
>  .../CVE-2015-3194-Add-PSS-parameter-check.patch    |  37 ++++
>  ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch |  61 +++++++
>  .../recipes-connectivity/openssl/openssl_1.0.1p.bb |   2 +
>  ...5-1472-wscanf-allocates-too-little-memory.patch | 108 ++++++++++++
>  meta/recipes-core/glibc/glibc_2.20.bb              |   5 +-
>  meta/recipes-core/libxml/libxml2.inc               |   3 +
>  .../libxml/libxml2/CVE-2015-7942.patch             |  58 ++++++
>  .../libxml/libxml2/CVE-2015-8035.patch             |  35 ++++
>  .../libxml/libxml2/CVE-2015-8241.patch             |  41 +++++
>  .../rsync/files/check_libattr.patch                |  33 ++++
>  meta/recipes-devtools/rsync/rsync_3.1.0.bb         |   3 +-
>  .../grep/grep-2.19/grep2.19-CVE-2015-1345.patch    | 129 ++++++++++++++
>  meta/recipes-extended/grep/grep_2.19.bb            |   4 +-
>  meta/recipes-extended/texinfo/texinfo_5.2.bb       |   2 +-
>  .../unzip/unzip/CVE-2015-7696.patch                |  38 ++++
>  .../unzip/unzip/CVE-2015-7697.patch                |  31 ++++
>  meta/recipes-extended/unzip/unzip_6.0.bb           |   2 +
>  meta/recipes-kernel/linux/linux-dtb.inc            |   1 -
>  .../gnutls/libtasn1/libtasn1-CVE-2015-3622.patch   |  44 +++++
>  meta/recipes-support/gnutls/libtasn1_4.0.bb        |   1 +
>  scripts/postinst-intercepts/update_font_cache      |   4 +-
>  34 files changed, 1020 insertions(+), 15 deletions(-)
>  create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Gr=
ub2-user-pass-vulnerability.patch
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8000.pat=
ch
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-65=
63.patch
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-65=
64.patch
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-65=
65.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-31=
94-Add-PSS-parameter-check.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-31=
95-Fix-leak-with-ASN.1-combine.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-al=
locates-too-little-memory.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch
>  create mode 100644 meta/recipes-devtools/rsync/files/check_libattr.patch
>  create mode 100644 meta/recipes-extended/grep/grep-2.19/grep2.19-CVE-201=
5-1345.patch
>  create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2015-7696.patch
>  create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2015-7697.patch
>  create mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-201=
5-3622.patch
>=20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlagx78ACgkQN1Ujt2V2gBwUWACgkA73Fgy5fnTy8oVk2HoZHqIk
96wAnigHU5mxvrz/grDrb8TqBz28/21S
=uIZf
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
