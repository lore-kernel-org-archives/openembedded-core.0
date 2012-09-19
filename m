Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TEOM4-00033v-VL
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 19:46:33 +0200
Received: by bkvi18 with SMTP id i18so377368bkv.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 10:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qfdbOQ4MSt0xmJsjgTMvF9t0qisjagdibxCqWXSwcbw=;
	b=XkEIJhyTda/2xDeuq9cvHVrSLhxBl7NfeOTXBSciyFVOWf66OE6fKVd1XeY67/j8B7
	KWWdPrxb02gZS1wduwimQTSI8JYBJa/3COgSuM4cq1h6GD1TMTmhJObpPKW4QSaw7Cu3
	6LJsYGgm7ONtUyZh7AAo8Hm2dC5ule8lzkPbUR0ezaYApLvjNUBa3n7NASAfq2B8Rb8N
	ZBb7DmkIx4ZJP5fxIHyaNNl/oo/xYjowtQC1uysA+4LLMOvTqS/LZS4ucLWZNAwcOePx
	0yRULZq+7i0iitr/wSYIHbcBQ83QTF579auYPpqiMs91d8r/h0T295ja7QuNuoj+yrMe
	VBag==
Received: by 10.205.137.8 with SMTP id im8mr1523928bkc.135.1348076031448;
	Wed, 19 Sep 2012 10:33:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t23sm2645520bks.4.2012.09.19.10.33.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Sep 2012 10:33:49 -0700 (PDT)
Date: Wed, 19 Sep 2012 19:33:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120919173340.GB10268@jama.jama.net>
References: <cover.1348074403.git.Martin.Jansa@gmail.com>
	<505A010F.6080104@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <505A010F.6080104@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Opkg patch upstreaming and SIGSEGV fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 17:46:33 -0000
X-Groupsio-MsgNum: 29567
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Content-Disposition: inline

--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 19, 2012 at 10:29:51AM -0700, Saul Wold wrote:
> On 09/19/2012 10:16 AM, Martin Jansa wrote:
> > This depends on
> > http://patchwork.openembedded.org/patch/36893/
> > otherwise warning about missing SRC_URI entries will be shown
> >
> > The following changes since commit f06097f4581e4c728c2950a86e025384e4bd=
cdf0:
> >
> >    eglibc: Do not use fsqrt in libm when building for fsl ppc with fpu =
(2012-09-18 07:44:13 -0700)
> >
> > are available in the git repository at:
> >
> >    git://git.openembedded.org/openembedded-core-contrib jansa/opkg
> >    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/=
?h=3Djansa/opkg
> >
> > Martin Jansa (3):
> >    opkg: replace local patches with git patches submitted upstream
> >    opkg: add patch to fix SIGSEGV when printing status file
> >    opkg-nogpg: drop SRCREV
> >
> >   meta/recipes-devtools/opkg/opkg-nogpg_svn.bb       |  2 -
> >   .../0001-add-opkg_compare_versions-function.patch  | 51 ++++++++++++++
> >   ...e-the-uname-gname-fields-when-extracting.patch} | 30 +++++---
> >   ...ix-dependency-issues-for-preinst-scripts.patch} | 65 ++++++++++---=
-----
> >   ...nst-script-is-not-fatal-with-conf-offlin.patch} | 75 +++++++++++--=
-------
> >   ...ot-read-etc-opkg-.conf-if-f-is-specified.patch} | 11 ++-
> >   ...tch =3D> 0006-detect-circular-dependencies.patch} | 79 +++++++++++=
++---------
> >   ...g-provides-even-when-oldpkg-provides-exis.patch | 46 +++++++++++++
> >   meta/recipes-devtools/opkg/opkg/add_vercmp.patch   | 36 ----------
>=20
> These patches do not have Upstream-Status in the local version, I guess=
=20
> you are trying to preserve the original state?  How soon will they be=20
> accepted into the upstream?

No idea, but Graham was usually quick.
=20
> They should still have Upstream-Status: Submitted added.

Ah sorry, I've sent wrong version of this patch, yes I had them with=20
Upstream-Status: Submitted

Sending v2 in few minutes.

>=20
> Thanks
> 	Sau!
>=20
> >   meta/recipes-devtools/opkg/opkg_svn.bb             | 15 ++--
> >   10 files changed, 258 insertions(+), 152 deletions(-)
> >   create mode 100644 meta/recipes-devtools/opkg/opkg/0001-add-opkg_comp=
are_versions-function.patch
> >   rename meta/recipes-devtools/opkg/opkg/{add_uname_support.patch =3D> =
0002-Ensure-we-use-the-uname-gname-fields-when-extracting.patch} (71%)
> >   rename meta/recipes-devtools/opkg/opkg/{fix_installorder.patch =3D> 0=
003-Fix-dependency-issues-for-preinst-scripts.patch} (82%)
> >   rename meta/recipes-devtools/opkg/opkg/{offline_postinstall.patch =3D=
> 0004-Failed-postinst-script-is-not-fatal-with-conf-offlin.patch} (52%)
> >   rename meta/recipes-devtools/opkg/opkg/{conf_override.patch =3D> 0005=
-Do-not-read-etc-opkg-.conf-if-f-is-specified.patch} (91%)
> >   rename meta/recipes-devtools/opkg/opkg/{track_parents.patch =3D> 0006=
-detect-circular-dependencies.patch} (59%)
> >   create mode 100644 meta/recipes-devtools/opkg/opkg/0007-merge-newpkg-=
provides-even-when-oldpkg-provides-exis.patch
> >   delete mode 100644 meta/recipes-devtools/opkg/opkg/add_vercmp.patch
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBaAfQACgkQN1Ujt2V2gBxclgCfQDqygjyJ1dhJ0p3OIoXL6B4p
clcAn3LbeNxW/QQvQfrA/EaLumdIFa99
=inuI
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
