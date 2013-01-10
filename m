Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtNb0-0007TD-G4
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 20:15:25 +0100
Received: by mail-pb0-f48.google.com with SMTP id rq13so466863pbb.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 11:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=p+qvkt9ndQQXRAwet+LXk0TUV92yYCBgAfgaPBTOXFQ=;
	b=xgNaaf7X7i1nSZ/eY6bXXbLj2SsWuS5GmKCOGQTp63VkLcpJd3Zps1dtT7JSnIVvF6
	iOrKsQKQnl8sSgTE68J5AQpkvgxZaaV+atxHcBgerjx0fRxlVj09JNDA1Tin8yNFrdrj
	ckbKmWcuoTQYEKgE0uGJ3jYarr+3g4H8GHSNWwR19YTFX/lMXbe5X6O9AI8XzjOnC258
	P/uEW4cdGJ9vYCxut1UVZ5qqw4JPWlrHuEsafZJd/CD68umTnz6L5KLXFvftGSbczo0y
	0YUmHrKG9ULIrYIlt6y/6bEv6Pl2ONru2t+7/k3cEJPFi8TcT+6yLM3zawN1v4YEBcml
	VY1Q==
X-Received: by 10.68.135.99 with SMTP id pr3mr223803302pbb.151.1357844407988; 
	Thu, 10 Jan 2013 11:00:07 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id vn2sm1240584pbc.31.2013.01.10.11.00.04
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 11:00:06 -0800 (PST)
Date: Thu, 10 Jan 2013 20:00:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Message-ID: <20130110190012.GI3722@jama.palm1.palmone.com>
References: <1357751495-28236-1-git-send-email-cristian.iorga@intel.com>
	<CAJTo0LZwxy0E-ODr61YK4T9Qn+jkqqsPeW06vm8O7pmE-cMAfg@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB161DC46C@IRSMSX102.ger.corp.intel.com>
	<7782F5CBD39246A3A6204E6FE729FD71@intel.com>
	<20130110085738.GT3722@jama.palm1.palmone.com>
	<969F26A8BAB325438E7EB80D3C3134FB161DCAA5@IRSMSX102.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB161DCAA5@IRSMSX102.ger.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: upgrade to 1.10
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
X-List-Received-Date: Thu, 10 Jan 2013 19:15:34 -0000
X-Groupsio-MsgNum: 33678
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jnCIwN96y15MEy/K"
Content-Disposition: inline

--jnCIwN96y15MEy/K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 06:47:26PM +0000, Iorga, Cristian wrote:
> Hello all,
> In SIGGEN_EXCLUDERECIPES_ABISAFE only connman-conf needs to be added, or =
connman + connman-conf? (see my V2 patch for connman 1.10 upgrade)

connman-conf only, V2 looks better

Cheers,

>=20
> Regards,
> Cristian
>=20
> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]=20
> Sent: Thursday, January 10, 2013 10:58 AM
> To: Burton, Ross
> Cc: Iorga, Cristian; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] connman: upgrade to 1.10
>=20
> On Thu, Jan 10, 2013 at 07:56:30AM +0000, Ross Burton wrote:
> > On Thursday, 10 January 2013 at 07:15, Iorga, Cristian wrote:
> > > Well, I have the prior art stand by me.
> > > The same technique is applied for netbase.
> > >=20
> > > And, in this specific case, connman should be machine specific.
> > > Can you please give me more detail?
> > >=20
> > > The configuration file will have only the interface blacklist enabled=
 in case of a qemu* machine.
> > netbase is a lot smaller than connman. =20
>=20
> and also listed in SIGGEN_EXCLUDERECIPES_ABISAFE
>=20
> >With this change you're rebuilding connman per-machine instead of sharin=
g the package between compatible machines, with the only difference being a=
 configuration file.
>=20
> And rebuilding also all stuff depending on connman.
>=20
> Cheers,
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jnCIwN96y15MEy/K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDvD7wACgkQN1Ujt2V2gBw96gCeK4Ni8ahBTnWIyGl+fjJ9CaGt
MbEAoKdMmoV/uYyHcMd4a+PMzDm37oZc
=eoG0
-----END PGP SIGNATURE-----

--jnCIwN96y15MEy/K--
