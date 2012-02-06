Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RuOoV-0000pH-DL
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 14:40:59 +0100
Received: by eekd41 with SMTP id d41so1845123eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 05:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0BRKvdNp5p88ud3kwllqTR8RYWlUjGkTD1PBIwjBdAg=;
	b=PmPJuaA8TkLNmXd5gCWk+03ph8EhgNJkb3ZYGct9egiz51BdVLj13szG7MEIVdhXeO
	DaNLoarHgt5gCcL6vEXm3x7PLu8IGtz0N0+ub6S/S3igS1iKXAOITms/GTGnAyWPQTJs
	16x+xN/COUqAxBEOtI2OL/8G2QamESEZKooDQ=
Received: by 10.14.13.196 with SMTP id b44mr1483914eeb.54.1328535178418;
	Mon, 06 Feb 2012 05:32:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm61115096eei.3.2012.02.06.05.32.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 05:32:57 -0800 (PST)
Date: Mon, 6 Feb 2012 14:32:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120206133254.GE3872@jama.jama.net>
References: <1328533275.24049.16.camel@ted> <20120206142830.79e73ef1@eb-e6520>
MIME-Version: 1.0
In-Reply-To: <20120206142830.79e73ef1@eb-e6520>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Performance numbers
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
X-List-Received-Date: Mon, 06 Feb 2012 13:40:59 -0000
X-Groupsio-MsgNum: 17091
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qz2CZ664xQdCRdPu"
Content-Disposition: inline

--Qz2CZ664xQdCRdPu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2012 at 02:28:30PM +0100, Eric B=E9nard wrote:
> Hi Richard,
>=20
> Le Mon, 06 Feb 2012 13:01:15 +0000,
> Richard Purdie <richard.purdie@linuxfoundation.org> a =E9crit :
>=20
> > Its been a while since we had some performance numbers and there were
> > recently some questions about how current build time compared to
> > previous numbers.
> >=20
> > On my 12 core system, build time for qemux86 from scratch is ~42
> > minutes. This compares favourably with previous numbers from that
> > system. Interestingly, switching to qemumips resulted in a build time of
> > 43 minutes in the same tmpdir suggesting that the native part of the
> > bootstrap process isn't the bottleneck.
> >=20
> > On the quad core (the system used for many of the previous numbers I'd
> > provided), build time for qemux86 was 105 minutes which again is roughly
> > consistent with where things were for 1.1.
> >=20
> what are your settings (PARALLEL_MAKE & BB_NUMBER_THREADS) used in
> both cases ?

And what's the target in your tests?

My quad core does core-image-minimal-mtdutils for qemux86* from scratch=20
in ~ 100 minutes.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Qz2CZ664xQdCRdPu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8v1oYACgkQN1Ujt2V2gByYEgCfeLqMS7AN0qjV0lJW8KSCZ9pg
gDoAmQF7XDwXQb0WcqL7ANETzHtbJjQa
=wLjG
-----END PGP SIGNATURE-----

--Qz2CZ664xQdCRdPu--
