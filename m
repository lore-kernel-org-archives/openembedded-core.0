Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVu37-0004qu-DQ
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:58:49 +0100
Received: by bkbzv15 with SMTP id zv15so900639bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 15:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tL5ixIzNpH//Xs6N5ghMYM+ttNDko/5sPvpn8yuvxX4=;
	b=PVLA5MBNDpIOdmUmoyoApT5bbUmtipKM43wxUb7edYVzQZ0xUHrN8BRlMmNAMeBf++
	b4kLCvW2xUn0UHT61JcyzxhrsUPqwgyh1XJYShmKw6jqEVl8dwhcN/nVO//BW+6+L3a4
	QMHX0C5bZm+uyd32Js2qBw+kRZ696j5S2MEyM=
Received: by 10.205.129.148 with SMTP id hi20mr4118703bkc.25.1322697128153;
	Wed, 30 Nov 2011 15:52:08 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h7sm7394666bkw.12.2011.11.30.15.52.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 15:52:07 -0800 (PST)
Date: Thu, 1 Dec 2011 00:51:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111130235154.GC29875@jama.jama.net>
References: <cover.1322693708.git.Martin.Jansa@gmail.com>
	<6d1a17a6a97b72caa8790538af19ba2c942c91ff.1322693708.git.Martin.Jansa@gmail.com>
	<1322696033.17484.84.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1322696033.17484.84.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][oe-core 1/3] sysstat: don't run populate-volatile.sh update in do_rootfs or without populate-volatile.sh
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
X-List-Received-Date: Wed, 30 Nov 2011 23:58:49 -0000
X-Groupsio-MsgNum: 13373
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sHrvAb52M6C8blB9"
Content-Disposition: inline

--sHrvAb52M6C8blB9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2011 at 11:33:53PM +0000, Richard Purdie wrote:
> On Wed, 2011-11-30 at 23:56 +0100, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-extended/sysstat/sysstat.inc       |    6 +++++-
> >  meta/recipes-extended/sysstat/sysstat_10.0.2.bb |    2 +-
> >  2 files changed, 6 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-e=
xtended/sysstat/sysstat.inc
> > index 2936f96..5e0f7af 100644
> > --- a/meta/recipes-extended/sysstat/sysstat.inc
> > +++ b/meta/recipes-extended/sysstat/sysstat.inc
> > @@ -22,7 +22,11 @@ do_install() {
> >  }
> > =20
> >  pkg_postinst_${PN} () {
> > -        /etc/init.d/populate-volatile.sh update
> > +        if [ "x$D" !=3D "x" ]; then
>=20
> Is that really what you mean?

Ah, sorry, you're right. Fixed in branch and sent here.

>=20
> > +                if [ -e /etc/init.d/populate-volatile.sh ]; then
> > +                        /etc/init.d/populate-volatile.sh update
> > +                fi
> > +        fi
> >  }
> > =20
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sHrvAb52M6C8blB9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7WwZoACgkQN1Ujt2V2gBxK1ACcC4VTPoCAvGkAHcTUYG2WPrKa
tU8An3pnJc9rsgZMTO5MwrNp6ydgNJkX
=4cIw
-----END PGP SIGNATURE-----

--sHrvAb52M6C8blB9--
