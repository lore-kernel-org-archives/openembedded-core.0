Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 178757390D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 12:49:09 +0000 (UTC)
Received: by widdi4 with SMTP id di4so25245955wid.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 05:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=z0B2JhpPTUDXqk56dDIxFLNS3GLMHDLzdKUWz0HBmGg=;
	b=Ca5oHppLJ2A1ixtFbhpsvVolJuCqRrtTskz+X29z4LJvJm0X2GF02HhoLK53XhMhlr
	RMhZzhK+xixBWdOLGPl4Be+CBLy+Z+6ImNnJ6jSeC/jvvY2X9NQ5DEZWPiR2+VFbCcli
	6x5mWKOK9H3mUieu2MQqbNL6yRlLxsCkLXX2jopgkrVNl6K2hpAAVdcpXzNAEZcY677e
	u7BpLU0rG4OJnEW5HD3B6cRBVK0cZQpAFUA+O82sn9PkxPvXlJZIT58sfTVVHZlnPIrx
	2/fRtAJzaxuslOkFR8H1kadPRKr+WstwTjwCdswRqKesb3ExPhQD8ckrmDXJl0a65lhv
	p+/w==
X-Received: by 10.194.192.167 with SMTP id hh7mr19131846wjc.151.1428842950067; 
	Sun, 12 Apr 2015 05:49:10 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id xy2sm6907918wjc.14.2015.04.12.05.49.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Apr 2015 05:49:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 12 Apr 2015 14:49:12 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150412124912.GA2328@jama>
References: <1428828331.6976.14.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1428828331.6976.14.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Performance regression (binutils and gold)
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
X-List-Received-Date: Sun, 12 Apr 2015 12:49:10 -0000
X-Groupsio-MsgNum: 64279
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2015 at 09:45:31AM +0100, Richard Purdie wrote:
> To allow us to upgrade to the latest binutils we ended up enabling
> building of gold. Unfortunately this is clearly visible on our
> performance benchmarks, it leads to a 3-4 minute speed loss in overall
> build time :(.
>=20
> Locally, benchmarks for building binutils-cross show:
>=20
> Just ld:
>=20
> 95.87user 48.36system 1:05.66elapsed 219%CPU (0avgtext+0avgdata
> 162480maxresident)k
> 0inputs+1030184outputs (0major+7753895minor)pagefaults 0swaps
>=20
> with gold:
>=20
> 366.22user 67.25system 1:14.29elapsed 583%CPU (0avgtext+0avgdata
> 435488maxresident)k
> 248inputs+1205792outputs (1major+12572236minor)pagefaults 0swaps
> richard@dax:/media/build1/poky/build2$=20
>=20
> So whilst it only takes 10 seconds longer overall for me on what is a
> pretty powerful machine, you can see a huge increase in user time and
> CPU usage. I believe that on our slower quad core performance benchmark
> machine, this equates to a few minutes.
>=20
> The question is therefore, do we have a better way to fix things? Is
> this performance drop acceptable?

It's acceptable for me, I think most people with slower machines (with
less ram) are already using ls-is-gold, so it won't make any difference
for them.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUqacgACgkQN1Ujt2V2gByuGwCeN5r1+YJY/ECZaOBfLjlQ2mR4
VlUAoIbKbxVy7JjHCB5L2BHTb6gEn09q
=K9yP
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
