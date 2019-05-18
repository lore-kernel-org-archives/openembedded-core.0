Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id D3F517BE3C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 19:03:29 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id a3so821805ybr.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 12:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9seVxwDWp/21ptybpL/s7fHtWD4fvuFjPDU0z76jF1I=;
	b=dQ7kouiDatS73rtvRM6b+8DKg6YEkEYl+xqg+cWkOhTGwqELQiHkQvemaHc5cwG1np
	30VYoS+IAN1E7t2QulBXB6vEfO0gRfq/7qor0vPqZPN+GmUnca/bq6VHHD/U4tOEotIR
	aa07Nb7fWgXCPoQ7tyQIRN9bWDP1zvx9Qz634=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9seVxwDWp/21ptybpL/s7fHtWD4fvuFjPDU0z76jF1I=;
	b=cEuMDIrrKGfE6Xo2ej18/yyjgKhFwFHrDAqzQWJM5PTAlrSLF6cv+mNZoOlGWFvya0
	XUC2zR37MyLPiEC9jiDGLjoMj0MS00wrc0FZqzzjc/jJNio7LSGDK7lU6X8J3LZGa93k
	ZVAP/jYWQgbM/PdeuwwiXgmrL92p0YLe8uNpR+YvjTVw6oOzsGHxXmZwnGFXljRxJlAw
	fTxwlHl//fQA1HGKIEb85Xqt1kHaxu/SK7pz7a8SS2UJjUHt7rz20bFuQvdWorqQyn9t
	K9DN5d1vawRYq2Udt941rE/gjufeH7FotQSDB8MGUcYldwBJVzUuQLtfyiGhx5OVMJjf
	4j8g==
X-Gm-Message-State: APjAAAVrXZzPACIRjrzEEIECR9r+a+NwO5aQtsGqgEeLZa7yNVyuwiXD
	JaoAhfQykpiEdj3E5mwfeK2Dvt+7uXuGxA==
X-Google-Smtp-Source: APXvYqzbinWLHsy+LpqBHV5gDT20mcsHBAAa4NU7uutRa5fHTJpa1k4Gtd7zRP89SiJTF+JKx/j8aA==
X-Received: by 2002:a25:8249:: with SMTP id d9mr29626010ybn.320.1558206210311; 
	Sat, 18 May 2019 12:03:30 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	u207sm4119603ywu.2.2019.05.18.12.03.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 May 2019 12:03:29 -0700 (PDT)
Date: Sat, 18 May 2019 15:03:27 -0400
From: Tom Rini <trini@konsulko.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190518190327.GL22232@bill-the-cat>
References: <20190517135309.116495-1-alex.kanavin@gmail.com>
	<1558204453-8142-1-git-send-email-trini@konsulko.com>
	<CA+chaQdA-jTDBMz_S9gMDLzSU8NWd3b4tvfyRPVdLkq46_vKSQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQdA-jTDBMz_S9gMDLzSU8NWd3b4tvfyRPVdLkq46_vKSQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vim: Rework things so vim adds features not vim-tiny removes
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
X-List-Received-Date: Sat, 18 May 2019 19:03:30 -0000
X-Groupsio-MsgNum: 124625
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P0uLJ1D0dtZMuM2h"
Content-Disposition: inline

--P0uLJ1D0dtZMuM2h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 18, 2019 at 08:57:02PM +0200, Martin Jansa wrote:
> Thanks Tom for quick update.
>=20
> ALTERNATIVE_TARGET[xxd] =3D "${bindir}/xxd"
> ALTERNATIVE_LINK_NAME[xxd] =3D "${bindir}/xxd"
> looks strange, IIRC TARGET and LINK_NAME should always point to different
> filepath, it was added in meta-oe commit:
>=20
> commit 897c10b7c17c138a85bdeb36cf72e7201daf0e0e
> Author: Dan McGregor <dan.mcgregor@usask.ca>
> Date:   Thu Oct 18 09:46:27 2018 -0600
>=20
>     vim: alternatify xxd
>=20
>     toybox also provides xxd.
>=20
> but I wonder what u-a does (or is supposed to do in this scenario). Maybe
> u-a bbclass automatically adds .${BPN} suffix to TARGET and renames the
> installed file?

I'll double check, but also toybox doesn't have anything for xxd today,
so I'll add that into my build and come up with something sane for both
if needed, thanks!

>=20
> On Sat, May 18, 2019 at 8:34 PM Tom Rini <trini@konsulko.com> wrote:
>=20
> > Now that we have a common inc file for both vim and vim-tiny move a few
> > bits of logic out of vim.inc and in to vim_$VER.bb so that vim adds
> > things rather than vim-tiny removes them.
> >
> > Suggested-by: Martin Jansa <martin.jansa@gmail.com>
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> > ---
> >  meta/recipes-support/vim/vim-tiny_8.1.1240.bb | 3 ---
> >  meta/recipes-support/vim/vim.inc              | 8 +-------
> >  meta/recipes-support/vim/vim_8.1.1240.bb      | 9 +++++++++
> >  3 files changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
> > b/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
> > index 139e626e4444..e4c26d23f69d 100644
> > --- a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
> > +++ b/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
> > @@ -2,9 +2,6 @@ require vim.inc
> >
> >  SUMMARY +=3D " (with tiny features)"
> >
> > -PROVIDES_remove =3D "xxd"
> > -ALTERNATIVE_${PN}_remove =3D "xxd"
> > -
> >  PACKAGECONFIG +=3D "tiny"
> >
> >  do_install() {
> > diff --git a/meta/recipes-support/vim/vim.inc
> > b/meta/recipes-support/vim/vim.inc
> > index f5c74684bfa7..433f23344826 100644
> > --- a/meta/recipes-support/vim/vim.inc
> > +++ b/meta/recipes-support/vim/vim.inc
> > @@ -1,7 +1,6 @@
> >  SUMMARY =3D "Vi IMproved - enhanced vi editor"
> >  SECTION =3D "console/utils"
> >
> > -PROVIDES =3D "xxd"
> >  DEPENDS =3D "ncurses gettext-native"
> >  # vimdiff doesn't like busybox diff
> >  RSUGGESTS_${PN} =3D "diffutils"
> > @@ -52,7 +51,6 @@ PACKAGECONFIG +=3D " \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d=
)} \
> >  "
> > -PACKAGECONFIG_class-native =3D ""
> >
> >  PACKAGECONFIG[gtkgui] =3D "--enable-gui=3Dgtk2,--enable-gui=3Dno,gtk+,"
> >  PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,acl,"
> > @@ -130,12 +128,8 @@ RDEPENDS_${BPN} =3D "ncurses-terminfo-base"
> >  # Recommend that runtime data is installed along with vim
> >  RRECOMMENDS_${BPN} =3D "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc
> > ${PN}-common"
> >
> > -ALTERNATIVE_${PN} =3D "vi vim xxd"
> > +ALTERNATIVE_${PN} =3D "vi vim"
> >  ALTERNATIVE_PRIORITY =3D "100"
> >  ALTERNATIVE_TARGET =3D "${bindir}/${BPN}.${BPN}"
> >  ALTERNATIVE_LINK_NAME[vi] =3D "${base_bindir}/vi"
> >  ALTERNATIVE_LINK_NAME[vim] =3D "${bindir}/vim"
> > -ALTERNATIVE_TARGET[xxd] =3D "${bindir}/xxd"
> > -ALTERNATIVE_LINK_NAME[xxd] =3D "${bindir}/xxd"
> > -
> > -BBCLASSEXTEND =3D "native"
> > diff --git a/meta/recipes-support/vim/vim_8.1.1240.bb
> > b/meta/recipes-support/vim/vim_8.1.1240.bb
> > index baaaacc0b77f..60946a181f42 100644
> > --- a/meta/recipes-support/vim/vim_8.1.1240.bb
> > +++ b/meta/recipes-support/vim/vim_8.1.1240.bb
> > @@ -1 +1,10 @@
> >  require vim.inc
> > +
> > +PROVIDES =3D "xxd"
> > +
> > +PACKAGECONFIG_class-native =3D ""
> > +BBCLASSEXTEND =3D "native"
> > +
> > +ALTERNATIVE_${PN}_append =3D " xxd"
> > +ALTERNATIVE_TARGET[xxd] =3D "${bindir}/xxd"
> > +ALTERNATIVE_LINK_NAME[xxd] =3D "${bindir}/xxd"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Tom

--P0uLJ1D0dtZMuM2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJc4Fb/AAoJEIf59jXTHXZS+OMP/iuJbGQ/qLcXEfkGrS194GH+
Hs4cNyugEpU0iShhrcjPQPqpGvJlOZfOGRv4Jda+oQW3oIe4SGqyDaw1zCCXHhVs
Xuj5bTwY00M/32N+LlDKLVxbQ05wHuZN6vM2vJB2sQfWr1jh6DVDsDi+Bj2Vo/oz
AGvqNex58I1V2b0BKX5k4hR3Z2EaIEBucwWGZ52QdqFT58I9I2I5Rn5oMv+8zskK
ZEAinzqCQeGPV6hBQSfzUZwchNEC91GXKRO2CsKlCjek137UwGKEawyUuYWK8qLP
dN/nJhXC1jbKpAvMgRVcapLLJLHka3L5PeIqwLk/St7A46vbFqFJn1IcknL1MF9X
ihmhVzvKBLPlpvTQYBqF/BQzD1SbmXid42polNkH+Qv+oRvZFot4t5IersUF8FeL
Isp4YnhSTpnuje0mGcdDiyiCjT8VZuuybpGG2zB23l4E4O769mfm9HqoUbuN+PaD
/ZNV1xIMhQUmobyQe/YjAEG5G2PYTUV2k7PdNy9xl+hCQqTtTAkyyUHEbvtD5Ysx
+MZ/zWh7XL1ttog6GHB844gtlbYS2utSN1/d5dz77GahDM+B8lDuAdLIcSQoYdtC
KVTGcVt81mdmGieK9gBNUE6D51PV9ym/jv1+3CPKaIQlC1nhn2lGCHHQ/OG7VpTI
nFwmDKDnQI+15pOXoq0j
=vRmW
-----END PGP SIGNATURE-----

--P0uLJ1D0dtZMuM2h--
