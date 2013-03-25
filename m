Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UKB4w-00071q-Gv
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 18:21:18 +0100
Received: by mail-pb0-f51.google.com with SMTP id rr4so1578008pbb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 10:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=I+1wPeteVN0nnI3hI8Lhod9GO0GD4zRl7q+wrrlApcg=;
	b=Np2E4rdK+dfoBar4Sk6tnCr/1T+kQVPZk9vcRMULbTzN3m2XzhSDwk5+ldPTNIKtKS
	TSeulPNFjIkPgFLxHy+TYilww0YBikGuYthQvj543HcLmtOSbwj74d4/mguxS6jcoj3f
	G145LTjhJ/ZUSERMUTfan7p1t5q+Bf3A56jo3uEwTtMplyh84YZ3IE4kOGICgvTPlqHc
	L2IK3cwIvWbU7FrOiYZyNFQstv4R0HShMNoZqXHBww9LGiLvk4Cz4ZdFHJNr3S7arMoV
	ZXJ+1qwKPcJkciDT/sqWaV/AfORgzYD3tiZr3DhXZ5yXYFLtj1LVKzZrCrle+NxhS25C
	QS8w==
X-Received: by 10.66.14.232 with SMTP id s8mr19291675pac.13.1364231034735;
	Mon, 25 Mar 2013 10:03:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pb3sm14091931pbc.7.2013.03.25.10.03.51
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 25 Mar 2013 10:03:53 -0700 (PDT)
Date: Mon, 25 Mar 2013 18:03:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130325170346.GD7539@jama>
References: <1364216841-32600-1-git-send-email-cristian.iorga@intel.com>
	<C39A6084-A254-4AE2-A9DD-49B88EDCB164@dominion.thruhere.net>
	<CAJTo0Lb9e4j-O2R5_wvkH=2APWYMZDnFw0pxj_YheeHZfUBdig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb9e4j-O2R5_wvkH=2APWYMZDnFw0pxj_YheeHZfUBdig@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 0/2] BlueZ 5.3 new package
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
X-List-Received-Date: Mon, 25 Mar 2013 17:21:22 -0000
X-Groupsio-MsgNum: 37027
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NklN7DEeGtkPCoo3"
Content-Disposition: inline

--NklN7DEeGtkPCoo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2013 at 04:23:26PM +0000, Burton, Ross wrote:
> On 25 March 2013 16:09, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > So you say it's not an upgrade path, but...
> >
> >> - bluez5 conflicts with/replaces bluez4.
> >
> > ...  here you add RREPLACES. Why is that?
>=20
> The logic was that if a *distro* does the upgrade from bluez4 to
> bluez5, the package manager needs to be able to remove bluez4 when
> installing bluez5, as otherwise they'd just conflict and the package
> manager would error out.

But opkg will still error out because of missing RPROVIDES, no?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NklN7DEeGtkPCoo3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFQg3IACgkQN1Ujt2V2gBwcxgCeJJ/dwjyV/Qf84kU6uexlssoH
voIAoLCR2FDU3aUNaVZNyNX8pkXO5ort
=uMMO
-----END PGP SIGNATURE-----

--NklN7DEeGtkPCoo3--
