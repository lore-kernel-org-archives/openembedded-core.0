Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TGF6g-000894-5Y; Mon, 24 Sep 2012 22:18:18 +0200
Received: by wibhn17 with SMTP id hn17so4482708wib.6
	for <multiple recipients>; Mon, 24 Sep 2012 13:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ICPB4u8W3Jru7+mk9xh230irzM6z+RjcpZC8NDIyv4Q=;
	b=KtCnpTVOJVP4wbvNsl+COfAsYkIZl3AEtJSRUMFhZvUvnUCQy4bXJUscK95M3sUSg7
	03tZor+lvIpfuqPHFpMoIoeYh7D3ktwDp1YrhhOI9rC34LDvvKACWo9Ie1GTlDFJHwDI
	0xjsnDfP+tzEtKAUKNtuxKaF+4Tv4wXfwQQ/jgZcyL2MtssV3pANv/aSebOP46xiRQpK
	gg107E0CFAgdJIcWJWLlChmG+SOgmw91h3A1N2t/+DLLXlV3BCeAgUqW86iouyaGB5ky
	0Y5SzZwgc6LyM3jYOUbqjfkc+f8tylmJI4+huDEYtkI6CVtKfCjc5s1ChjAuELlcj4G5
	w0Zg==
Received: by 10.180.78.40 with SMTP id y8mr16538518wiw.7.1348517130085;
	Mon, 24 Sep 2012 13:05:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ga2sm6588174wib.2.2012.09.24.13.05.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 13:05:29 -0700 (PDT)
Date: Mon, 24 Sep 2012 22:05:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120924200534.GG3295@jama.jama.net>
References: <20120924103553.BC0E91038B@opal>
	<20120924134810.GC3295@jama.jama.net>
	<1348494844.31293.39.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1348494844.31293.39.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Phil Blundell : libcap: respect ${base_sbindir}
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
X-List-Received-Date: Mon, 24 Sep 2012 20:18:19 -0000
X-Groupsio-MsgNum: 29800
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GV0iVqYguTV4Q9ER"
Content-Disposition: inline

--GV0iVqYguTV4Q9ER
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 02:54:03PM +0100, Phil Blundell wrote:
> On Mon, 2012-09-24 at 15:48 +0200, Martin Jansa wrote:
> > On Mon, Sep 24, 2012 at 10:35:53AM +0000, git@git.openembedded.org wrot=
e:
> > >  do_install() {
> > > -	oe_runmake install DESTDIR=3D"${D}" prefix=3D"${prefix}"
> > > +	oe_runmake install DESTDIR=3D"${D}" prefix=3D"${prefix}" SBINDIR=3D=
"${D}${base_sbindir}"
> > >  }
> >=20
> > This breaks packaging:
> >=20
> > /sbin/capsh /sbin/getcap /sbin/getpcaps /sbin/setcap
> > were moved from /usr/sbin/ and now are included in PN instead of PN-bin
>=20
> Ah, looks like that should have been ${sbindir} not ${base_sbindir}.
> Does it work for you if you make that change?

Yes, then it does work.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GV0iVqYguTV4Q9ER
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBgvQ4ACgkQN1Ujt2V2gBzs5wCeJw2ddpgn+k8/HBtWZX95pHMC
exkAnibsBn1NqL+uE+bYSgbeDLk/rFk3
=qI4o
-----END PGP SIGNATURE-----

--GV0iVqYguTV4Q9ER--
