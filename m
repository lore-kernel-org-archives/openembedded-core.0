Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 44DE96B1F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 10:40:40 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so900189eaj.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 03:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NMV/oiVLWHkcnr89ysmgYmwJDFw0g03UmfjfjQm79kw=;
	b=qIQpQD16zfGGAkd0AjdHqWfqNsotYcstAe6IRGU6hK1KN6znUZdPBLZOqjF4Q2/TR2
	O6qIso+WM6L/wl/QuKBVYZWKK9auNghjrRCvZ9vo35tUF2QDCtRwSrcR0k/mnfOVlbCx
	CZG8qeD7mP80vg97d5+4kfoKEINH4DWw9GcuAkMOviyGnl419GmM9Mo3koKQsjybyady
	mqBNxjGgE3e1p40G7GzXegloe5Anz4u8OwkdciorKDQKYtsmSAbSU7PdRUbxunzxt1yc
	NaPtvhRttJoGQHZpvGDzD+ej3qQIG+vtdWU+xbSxUUgTuJkO3cLG14Ot5DSKPknhiPwe
	sOMQ==
X-Received: by 10.15.91.69 with SMTP id r45mr881997eez.79.1375353640294;
	Thu, 01 Aug 2013 03:40:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	cg12sm3332702eeb.7.2013.08.01.03.40.39 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 03:40:39 -0700 (PDT)
Date: Thu, 1 Aug 2013 12:41:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130801104115.GN3280@jama>
References: <1375305315-22057-1-git-send-email-ronunes@gmail.com>
	<CAJTo0LYtx1fg-hicArTgeQePBO+BRH7T+AkS75+7wPTUJQj66Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYtx1fg-hicArTgeQePBO+BRH7T+AkS75+7wPTUJQj66Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Rogerio Nunes <rogerio.nunes@freescale.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [master, dylan][PATCH] packagegroup-core-tools-testapps: isolate x11 dependent tools
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
X-List-Received-Date: Thu, 01 Aug 2013 10:40:40 -0000
X-Groupsio-MsgNum: 42798
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rPgHZmYkQ+bUEpVC"
Content-Disposition: inline

--rPgHZmYkQ+bUEpVC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 01, 2013 at 10:50:28AM +0100, Burton, Ross wrote:
> On 31 July 2013 22:15,  <ronunes@gmail.com> wrote:
> > +    mesa-demos \
>=20
> If no x11 distro feature then mesa shouldn't be linking against X, so
> mesa-demos won't, so this should work, right?

mesa-demos need glew and glew needs virtual/libx11

Unfortunately mesa-demos autoconf stuff doesn't allow to disable demos
which are depending on glew, we're using ugly hacks to remove glew
dependency and build mesa-demos only with few demos available without
x11 in DISTRO_FEATURES (only egl subdir).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rPgHZmYkQ+bUEpVC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlH6O0sACgkQN1Ujt2V2gByuyQCfdYNGwfsHLyC/TTx/Kl64DGbk
dFYAn1ASTSwaexgrRKNt6l20vNyt2htg
=l7Cw
-----END PGP SIGNATURE-----

--rPgHZmYkQ+bUEpVC--
