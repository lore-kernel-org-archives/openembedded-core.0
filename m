Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1StExO-0005st-Gd; Mon, 23 Jul 2012 11:29:38 +0200
Received: by bkcik5 with SMTP id ik5so3855327bkc.6
	for <multiple recipients>; Mon, 23 Jul 2012 02:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BtdoQYvFlzX4kqM3MPKQE9y39Ov/C4liVbv4ChAXyi4=;
	b=sS/UkK8qjcJVaDl4HbK2MHefkzg/lHi4qFWxPiDiFs/nzPGzrvVZtx3jPuyvdOX/g9
	dN8FTlqwkfcWxdkvRe7EVsghNXy0mmHf+z2On04zQIjatfKlhZ7E6ygyrpfrB8FS62Lf
	CATLl8CURl86GixqIoctwwgiK2D7t9c1IDzDD8ZkKGu1LuvpRrgCIAVbPt/UcEFXLm25
	2cigWT5clhF4i1+iBghjVW0D0lsWuOzhI+0YC0UMS174AU0ouPwXEscBX18yFYsRmf8z
	YppKUgSGpV8WDBCYdKBcbdZYBo1wE+7q1OuEQ5Ke8a2Pq9UmZbMNwmfVs9V+orSDirq+
	6N4Q==
Received: by 10.204.39.73 with SMTP id f9mr7171467bke.110.1343035091820;
	Mon, 23 Jul 2012 02:18:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 25sm6568995bkx.9.2012.07.23.02.18.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 02:18:10 -0700 (PDT)
Date: Mon, 23 Jul 2012 11:18:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120723091809.GC3271@jama.jama.net>
References: <20120722104320.C057610218@opal>
	<20120723081543.GA3271@jama.jama.net>
	<CAJTo0LYK43FiO-iJ3wQf3Dsid14ckSkW9cAGhKtBUV8sDACd2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYK43FiO-iJ3wQf3Dsid14ckSkW9cAGhKtBUV8sDACd2Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : Add gtk-doc-stub
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2012 09:29:38 -0000
X-Groupsio-MsgNum: 25977
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline

--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2012 at 10:06:54AM +0100, Burton, Ross wrote:
> On 23 July 2012 09:15, Martin Jansa <martin.jansa@gmail.com> wrote:
> > This has couple of unpackaged files:
> >
> > NOTE: package gtk-doc-stub-0.0+git1+3dfd0a09de696ec8c544762747f8a0f7715=
3622e-r0: task do_package: Started
> > WARNING: QA Issue: gtk-doc-stub: Files/directories were installed but n=
ot shipped
> >   /usr/share/gtk-doc-devel
> >   /usr/share/gobject-introspection-1.0
> >   /usr/share/gtk-doc-devel/gtk-doc.make
> >   /usr/share/gobject-introspection-1.0/Makefile.introspection
> > NOTE: package gtk-doc-stub-0.0+git1+3dfd0a09de696ec8c544762747f8a0f7715=
3622e-r0: task do_package: Succeeded
>=20
> Good point, I never tested the non-native package because it's
> generally going to be used in a native context.

For some reason non-native gtk-doc-stub is pulled to image dependency
tree for me after last oe-core changes. I'll check dep graph.. if that's
not expected.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlANFtEACgkQN1Ujt2V2gBxTkgCgmB6n4YYJFZjklnKvB+r0zy2q
nr0An0UVI3zuCOF6FZaELYmuQ6dG2TEJ
=hphS
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--
