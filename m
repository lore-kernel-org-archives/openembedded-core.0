Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkJY7-0000mx-AY
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Dec 2012 20:06:55 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2720112eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Dec 2012 10:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=O04bcAh6rToAx7UBlIi6LxvDOKbGpkhq4MCvnn5u01E=;
	b=yK3zudNKV9eJa9pzj6caCh7xG/QpPM4AZubbfaWZKUDhlTi2i0bbKlaIJ7vLmQFNuy
	0dIi1tjDXcFqazaawTO+qyG52B8P+ETwyCsQFGIuaJiTnkPv8aqfQXO8yPuyUmblDgNZ
	wDOaZMV2yWFABxXUEMB7ED2r9TZF/1Ma99LsgGUDC1MWDzIjTlx+rGo5pwi9wc6I0rnI
	tG7ES/hlp9ho0DI6ypZmSxiyFtL0pOIzNptvYPDsLdz0N0lDEngtYBPzAWMjiWHj4itK
	5H7XXdslxjLwp4LIPQ3UUKm6euUU0e3eFT9uo6EUVHT36YnNjiPLExkROw1rA8lfvCvR
	9SjA==
Received: by 10.14.215.194 with SMTP id e42mr34207831eep.32.1355683936280;
	Sun, 16 Dec 2012 10:52:16 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e2sm24154096eeo.8.2012.12.16.10.52.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 10:52:15 -0800 (PST)
Date: Sun, 16 Dec 2012 19:52:15 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20121216185215.GE3448@jama>
References: <CAP9ODKoRws=EzHxyNumYnj-F2S5h_66wkCfL42-yrJK7KGYBOQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoRws=EzHxyNumYnj-F2S5h_66wkCfL42-yrJK7KGYBOQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build fail in kconfig-frontends
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
X-List-Received-Date: Sun, 16 Dec 2012 19:06:55 -0000
X-Groupsio-MsgNum: 32738
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/2994txjAzEdQwm5"
Content-Disposition: inline

--/2994txjAzEdQwm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 16, 2012 at 04:16:40PM -0200, Otavio Salvador wrote:
> Hello,
>=20
> Today I did a sync and kconfig-frontends fails to build. I submitted a
> bug report (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3610).
>=20
> I am sending it here as well so people can confirm if it is
> reproducable in some other environment?

It failed exactly the same here, but only once (on Friday) after cleansstat=
e=20
it built OK.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/2994txjAzEdQwm5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDOGF8ACgkQN1Ujt2V2gBxJXACdGXR2q4jWEnA36FE2tA7Xfko3
77wAn0V2owzfECd4EpNwcWf1Gl4q6xHI
=oZq/
-----END PGP SIGNATURE-----

--/2994txjAzEdQwm5--
