Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0fyB-0005Ae-Lp
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 22:12:55 +0100
Received: by eaal10 with SMTP id l10so784916eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 13:04:34 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.101.6 as permitted sender) client-ip=10.14.101.6; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.101.6 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.101.6])
	by 10.14.101.6 with SMTP id a6mr923439eeg.27.1330031074187 (num_hops =
	1); Thu, 23 Feb 2012 13:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=K9IGtZbxkfQHa7VCT/5YOKaaPkCAzmyP8tGQvHRJlvA=;
	b=F1uB5xVbJuEcGD9Zj0nokDtWq64iuPy5bud2f+BGiSNyS5LmUkcAekE/GBIY9Vsqx5
	HxZuCd38VTAa9NYHNnnT1GuRZn6ooh4kKWIpOJ0P9jLv1FBdl6Ay4ropsWbX546NdgwO
	TxuQvntlDGhReRfA4NFcjuyy4dMfQivfgXXtY=
Received: by 10.14.101.6 with SMTP id a6mr720886eeg.27.1330031074097;
	Thu, 23 Feb 2012 13:04:34 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z47sm9509126eeh.9.2012.02.23.13.04.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 13:04:33 -0800 (PST)
Date: Thu, 23 Feb 2012 22:04:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120223210431.GC3769@jama.jama.net>
References: <11CBD2DA-EE9C-4062-AA95-7B1FAE68E82D@dominion.thruhere.net>
	<2346347.g99Y6mRhMf@helios>
	<6C81C8C1-7D50-4B8E-9E72-68E5982D3709@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <6C81C8C1-7D50-4B8E-9E72-68E5982D3709@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: libsdl patch failure
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
X-List-Received-Date: Thu, 23 Feb 2012 21:12:55 -0000
X-Groupsio-MsgNum: 17853
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mZSo2Zk6iB5ZAp9g"
Content-Disposition: inline

--mZSo2Zk6iB5ZAp9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 06:44:29PM +0100, Koen Kooi wrote:
>=20
> Op 22 feb. 2012, om 18:05 heeft Paul Eggleton het volgende geschreven:
>=20
> > On Wednesday 22 February 2012 17:40:03 Koen Kooi wrote:
> >> Is anyone else seeing this:
> >>=20
> >> OTE: package libsdl-1.2.14-r5: task do_unpack: Started
> >> NOTE: package libsdl-1.2.14-r5: task do_unpack: Succeeded
> >> NOTE: Running task 1611 of 1622 (ID: 1,
> >> /OE/tentacle/sources/openembedded-core/meta/recipes-graphics/libsdl/li=
bsdl_
> >> 1.2.14.bb, do_patch) NOTE: package libsdl-1.2.14-r5: task do_patch: St=
arted
> >> ERROR: Command Error: exit status: 1  Output:
> >> Applying patch add.XGetRequest.symbol.patch
> >> missing header for unified diff at line 11 of patch
> >> can't find file to patch at input line 11
> >=20
> > FWIW I did just build libsdl-nativesdk and did not have this problem...
>=20
> Are you using 'git' as PATCHTOOL or plain patch? 'patch' on my debian sys=
tem chokes, while 'git apply' works fine. I've sent a patch to make it work=
 with either.

I also haven't seen patch failing.

I'm not setting PATCHTOOL, but I have PATCHRESOLVE =3D "noop" if that
implies some other tool.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mZSo2Zk6iB5ZAp9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9Gqd8ACgkQN1Ujt2V2gBwoRwCgupt1v6Vw96uxaiNLf8VpJl0n
W3kAniahQ6lExWNkPRXeK0yXP6YHkH4U
=mNiH
-----END PGP SIGNATURE-----

--mZSo2Zk6iB5ZAp9g--
