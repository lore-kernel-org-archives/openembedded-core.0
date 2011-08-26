Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QwuiG-0002gi-LN
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 13:36:41 +0200
Received: by fxg11 with SMTP id 11so2599959fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 04:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qQ5Z4rRAAz5T0Y22VE5XB/Q6Wl2QkZneouSyCFjw7H8=;
	b=cehV10jRF51wy4g8v9Q76Yro0/5quRxK0/s8Gj28suddHcY7COSC6FeDJLVD+JDr5V
	sQD9zkRvEMiOlJmArKf+tuWkQUHpGsgRhgB3npBKEqFh7uHoukBnf6OpSV+pbj+sXlra
	veAbJDVQLw1EvhyxYWjZbRzQls4Q+uY4rvZoA=
Received: by 10.223.50.150 with SMTP id z22mr1530741faf.30.1314358312082;
	Fri, 26 Aug 2011 04:31:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r12sm1254204fam.14.2011.08.26.04.31.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 04:31:50 -0700 (PDT)
Date: Fri, 26 Aug 2011 13:31:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110826113143.GG5081@jama.jama.net>
References: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
	<cd4a85ccaa27bdd77ad06d9300ac71bd6b27e36d.1311195893.git.Martin.Jansa@gmail.com>
	<1314353564.19905.81.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1314353564.19905.81.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 02/10] eglibc-package: don't fail without localedef/gconv
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
X-List-Received-Date: Fri, 26 Aug 2011 11:36:41 -0000
X-Groupsio-MsgNum: 8830
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aYDVKSzuImP48n7V"
Content-Disposition: inline

--aYDVKSzuImP48n7V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2011 at 11:12:43AM +0100, Phil Blundell wrote:
> On Wed, 2011-07-20 at 23:06 +0200, Martin Jansa wrote:
> >-       mv ${D}${libdir}/gconv ${dest}${libdir}
> > +	if [ -f ${D}${libdir}/gconv ]; then
> > +		mv -f ${D}${libdir}/gconv ${dest}${libdir}
> > +	fi
>=20
> This can't be right: gconv will be a directory if it exists at all and
> hence "test -f gconv" will never be true.
>=20
> Since this patch was applied I'm getting a whole bunch of "installed but
> not shipped" warnings for /lib/gconv/*.  Could you please look into
> that?

You're right, sorry about that (I didn't notice that because I didn't
have them built at all and later didn't get that those not packaged
files are caused by me).

Sending patch changing it to -e in few seconds.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aYDVKSzuImP48n7V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5XhB8ACgkQN1Ujt2V2gBzJ+QCgmsfahFH6SvwOcnxnEkDuf1sW
x10AoJc++RIr4EXjCjDq1IRa+ypHRUTY
=xyGQ
-----END PGP SIGNATURE-----

--aYDVKSzuImP48n7V--
