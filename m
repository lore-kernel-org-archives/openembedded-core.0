Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC17731E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:30:59 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p63so2770748wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 03:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EuH2NLKzqDWwfze4iiWZiKuyMgc9WJCeYKrGRwkDCcs=;
	b=F6zZBbhvZjSIugqC3j4HB/4mlN9BYkWv6BXCc19jo8bTOod6J8oLNEsmco4m8uE2X5
	UAHPIkvUd5XuFSN++wTzypv52uFILUye98W6NL3Wbn9nCwDPk1K1O6kgKzWW61wBbm2l
	pWCuFHVt0Fufg33YSxUnlqZ1qK5251vuNTFiplSXxwaLtvApG0IZsHg2BcHL4jyPNt9W
	XK/5GtIImfOy1tT6rrAewr6Fo3TYNeKB1x2GPc03LqGLVhdZcXfU7cVmdNxbTmih5rQQ
	E0xI5uxGo8tSqVxIIOb/KVV2F2cP5wN10Sx2jvoKYlJqwpH+R+i213hfo/bNi8G57vG/
	0qQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=EuH2NLKzqDWwfze4iiWZiKuyMgc9WJCeYKrGRwkDCcs=;
	b=KsqFpxuBGjFF21MIGT8IpQcKk3S7mEsCF0BCJRxLZ5BOrG0oL98H3wSzZ/RuPHUq9v
	YkrMvAIXfOFvfq1mM3dG0DjA22N2on8/DId+KUGF2SbTYAJNj4md6HfU1Q/utxELhVSW
	o2eQWUtmtgMq09DAykA/ihOj1SDBsbuGJEqXku/fDAhBXWATCLPPB9K4V0rHm2EaRaUb
	G85OCH+akHqxf263nm8rwnJZ4CqNcFnkBa6cvDf9ZWYaX5j7jtQeLW1NG7wWmbbulMyg
	VOcMbx+EyDW9juk8befpFyYfCC/ZqSONwvhqJYpLJ+cvXd0zVq54WOP5EbulZr8Is6Fv
	rEgg==
X-Gm-Message-State: AG10YOSAotpY8Ihh7DsahOargbqY1DeAH7U9NYTrwc++9RgqXPejz6FNSEgdMwAH+r0NTA==
X-Received: by 10.28.232.208 with SMTP id f77mr31009623wmi.34.1453894260179;
	Wed, 27 Jan 2016 03:31:00 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	g187sm7836353wmf.8.2016.01.27.03.30.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jan 2016 03:30:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Jan 2016 12:33:11 +0100
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20160127113311.GA2574@jama>
References: <cover.1452385571.git.akuster808@gmail.com>
	<20160121115752.GA2603@jama>
MIME-Version: 1.0
In-Reply-To: <20160121115752.GA2603@jama>
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
X-List-Received-Date: Wed, 27 Jan 2016 11:31:00 -0000
X-Groupsio-MsgNum: 76970
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2016 at 12:57:52PM +0100, Martin Jansa wrote:
> On Sat, Jan 09, 2016 at 04:30:26PM -0800, Armin Kuster wrote:
> > Please consider these changes for dizzy-next community support.
> >=20
> > The following changes since commit 6d34267e0a13e10ab91b60590b27a2b5ba3b=
7da6:
> >=20
> >   documentation: Changed some 'intro' tags to resolve multiple mega-man=
ual warnings. (2015-11-18 16:44:05 +0000)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
> >   http://git.yoctoproject.org/cgit.cgi//log/?h=3Dakuster/dizzy-next
>=20
> This is for oe-core, right? So it shouldn't be in poky-contrib and the
> http link doesn't work, it should be:
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dakuster/dizzy-=
next
>=20
> >=20
> > Armin Kuster (2):
> >   openssh: CVE-2015-6563 CVE-2015-6564 CVE-2015-6565
> >   Fixes a heap buffer overflow in glibc wscanf.
>=20
> What is this 2nd patch? It doesn't follow commit summary convention and
> I don't see it in master (at least not with this subject)
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Dakuster/diz=
zy-next&id=3D4807ff0ca0abf085e6b81257534a4a62fde88d16
>=20
> Other changes look good to me.

ping?

> > Belal, Awais (1):
> >   grub2: Fix CVE-2015-8370
> >=20
> > Chen Qi (1):
> >   image.bbclass: don't let do_rootfs depend on BUILDNAME
> >=20
> > Martin Jansa (3):
> >   fontcache: allow to pass extra parameters and environment to fc-cache
> >   texinfo: don't create dependency on INHERIT variable
> >   linux-dtb.inc: drop unused DTB_NAME variable from do_install
> >=20
> > Mike Crowe (1):
> >   allarch: Force TARGET_*FLAGS variable values
> >=20
> > Richard Purdie (2):
> >   layer.conf: Add several allarch dependency exclusions
> >   layer.conf: Add missing dependency for allarch package
> >     initramfs-framework
> >=20
> > Sergiy Kibrik (1):
> >   rsync: backport libattr checking patch
> >=20
> > Sona Sarmadi (7):
> >   libtasn1: CVE-2015-3622
> >   grep2.19: CVE-2015-1345
> >   libxml2: CVE-2015-7942
> >   libxml2: CVE-2015-8035
> >   openssl: CVE-2015-3194, CVE-2015-3195
> >   libxml2: CVE-2015-8241
> >   bind: CVE-2015-8000
> >=20
> > Tudor Florea (2):
> >   glibc: use patch for CVE-2015-1781
> >   unzip: CVE-2015-7696, CVE-2015-7697
> >=20
> >  meta/classes/allarch.bbclass                       |   4 +
> >  meta/classes/fontcache.bbclass                     |  19 +-
> >  meta/classes/image.bbclass                         |   2 +-
> >  meta/conf/layer.conf                               |  11 ++
> >  ...E-2015-8370-Grub2-user-pass-vulnerability.patch |  50 ++++++
> >  meta/recipes-bsp/grub/grub-efi_2.00.bb             |   1 +
> >  meta/recipes-bsp/grub/grub_2.00.bb                 |   1 +
> >  .../bind/bind/CVE-2015-8000.patch                  | 194 +++++++++++++=
++++++++
> >  meta/recipes-connectivity/bind/bind_9.9.5.bb       |   1 +
> >  .../openssh/openssh/CVE-2015-6563.patch            |  36 ++++
> >  .../openssh/openssh/CVE-2015-6564.patch            |  34 ++++
> >  .../openssh/openssh/CVE-2015-6565.patch            |  35 ++++
> >  meta/recipes-connectivity/openssh/openssh_6.6p1.bb |   5 +-
> >  .../CVE-2015-3194-Add-PSS-parameter-check.patch    |  37 ++++
> >  ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch |  61 +++++++
> >  .../recipes-connectivity/openssl/openssl_1.0.1p.bb |   2 +
> >  ...5-1472-wscanf-allocates-too-little-memory.patch | 108 ++++++++++++
> >  meta/recipes-core/glibc/glibc_2.20.bb              |   5 +-
> >  meta/recipes-core/libxml/libxml2.inc               |   3 +
> >  .../libxml/libxml2/CVE-2015-7942.patch             |  58 ++++++
> >  .../libxml/libxml2/CVE-2015-8035.patch             |  35 ++++
> >  .../libxml/libxml2/CVE-2015-8241.patch             |  41 +++++
> >  .../rsync/files/check_libattr.patch                |  33 ++++
> >  meta/recipes-devtools/rsync/rsync_3.1.0.bb         |   3 +-
> >  .../grep/grep-2.19/grep2.19-CVE-2015-1345.patch    | 129 ++++++++++++++
> >  meta/recipes-extended/grep/grep_2.19.bb            |   4 +-
> >  meta/recipes-extended/texinfo/texinfo_5.2.bb       |   2 +-
> >  .../unzip/unzip/CVE-2015-7696.patch                |  38 ++++
> >  .../unzip/unzip/CVE-2015-7697.patch                |  31 ++++
> >  meta/recipes-extended/unzip/unzip_6.0.bb           |   2 +
> >  meta/recipes-kernel/linux/linux-dtb.inc            |   1 -
> >  .../gnutls/libtasn1/libtasn1-CVE-2015-3622.patch   |  44 +++++
> >  meta/recipes-support/gnutls/libtasn1_4.0.bb        |   1 +
> >  scripts/postinst-intercepts/update_font_cache      |   4 +-
> >  34 files changed, 1020 insertions(+), 15 deletions(-)
> >  create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-=
Grub2-user-pass-vulnerability.patch
> >  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8000.p=
atch
> >  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-=
6563.patch
> >  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-=
6564.patch
> >  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-=
6565.patch
> >  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-=
3194-Add-PSS-parameter-check.patch
> >  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-=
3195-Fix-leak-with-ASN.1-combine.patch
> >  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-=
allocates-too-little-memory.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch
> >  create mode 100644 meta/recipes-devtools/rsync/files/check_libattr.pat=
ch
> >  create mode 100644 meta/recipes-extended/grep/grep-2.19/grep2.19-CVE-2=
015-1345.patch
> >  create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2015-7696.pat=
ch
> >  create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2015-7697.pat=
ch
> >  create mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-2=
015-3622.patch
> >=20
> > --=20
> > 1.9.1
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaoqvYACgkQN1Ujt2V2gBy92ACgiwJj/3LJWbiToPhyOarQexX9
TxgAn3oo7q8sCsifofjANPabE/pTL1hB
=yDj5
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
