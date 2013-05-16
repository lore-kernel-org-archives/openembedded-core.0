Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UcumO-0002ej-Q2; Thu, 16 May 2013 11:48:12 +0200
Received: by mail-pa0-f52.google.com with SMTP id bg2so2319421pad.25
	for <multiple recipients>; Thu, 16 May 2013 02:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=4VaiHp83U83s5XuGzj4Pt1WhSUTQt+zy9Q1uPj0KL9I=;
	b=eL9gfqM/biW/ShOK3B8I13JFeh/WyK4E11nsJhw6Mv6OBEXEr1Vy9NWHKCjzTV7i58
	NOfqXdRg4k+kBxVoes579V1e3vd3uVaXuQj/yXBd7nRowAl51XbQqW7gjUrtoXigxyqN
	HT47BwQz3qfVVPIw9XtVOvXkgj9stAP5vhgJm2iDMWvc2GaZ00gQ+I48CDIHKq1w4fYE
	fuSGFVCayvt6mBPPUNyIKoUjFsiNAntjZ6Vns9Ee+mpYaymPg5dGapApN6m13OkzLp2W
	kdngqzpk+/jfGCQIBA/TxgPgAAHZSLr8DC5WqxCs8r/LBP3xtgShr/zHRN1VpzVA6Wbk
	3WyQ==
X-Received: by 10.66.189.130 with SMTP id gi2mr770411pac.89.1368696546043;
	Thu, 16 May 2013 02:29:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	zo4sm6127997pbc.21.2013.05.16.02.29.03 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 16 May 2013 02:29:05 -0700 (PDT)
Date: Thu, 16 May 2013 11:29:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130516092905.GG24809@jama.dyndns-home.com>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
	<2253707.h5Yg7SAvOu@helios>
	<20130516085954.GC24809@jama.dyndns-home.com>
	<24887939.8KrA2KDk4J@helios>
MIME-Version: 1.0
In-Reply-To: <24887939.8KrA2KDk4J@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] Layers, PRINC and bbappends
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
X-List-Received-Date: Thu, 16 May 2013 09:48:50 -0000
X-Groupsio-MsgNum: 39330
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4eRLI4hEmsdu6Npr"
Content-Disposition: inline

--4eRLI4hEmsdu6Npr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2013 at 10:10:45AM +0100, Paul Eggleton wrote:
> On Thursday 16 May 2013 10:59:54 Martin Jansa wrote:
> > On Thu, May 16, 2013 at 09:29:48AM +0100, Paul Eggleton wrote:
> > > On Thursday 16 May 2013 08:31:33 Koen Kooi wrote:
> > > > Removing layers is pretty much impossible, though.
> > >=20
> > > With PRINC gone would there be any other issue that would make removi=
ng
> > > layers a problem?
> >=20
> > Does PR service really fix removing layers? I don't think so, if you add
> > layer and checksum of foo is changed AUTOPR is incremented, but then you
> > remove the layer and the checksum is unfortunately the same as what you
> > had before AUTOPR will go backwards.
>=20
> Then I would have to say if that's not the behaviour you want we should c=
hange=20
> it or at least make it optional to force it to always increment even if t=
he=20
> checksum is the same as a previous value.

That won't work with multiple builders using the same PR server (I don't
wont other builders to always increment PRAUTOs used in builds which
populate official feed).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4eRLI4hEmsdu6Npr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGUpuEACgkQN1Ujt2V2gBy6bACdFmqzSAHhCMNU4hPzVsgD/Erh
PUAAn1nhUmhZloxmCCWhNsYe4r+uK48k
=bNuW
-----END PGP SIGNATURE-----

--4eRLI4hEmsdu6Npr--
