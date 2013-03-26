Received: from mail-pd0-f181.google.com ([209.85.192.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UKYM8-00023Z-Rm
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 19:12:55 +0100
Received: by mail-pd0-f181.google.com with SMTP id q10so3151285pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 10:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=fZBaIFoqBgPNO1/vri+EqHRibBZecIaf4lhofn1t3fs=;
	b=0fiaVZYfhqC9HKJagzGUXcaS8j0HtCtR/y5CdMOWi84aTpG5gnqvzWxPCLrE7ZjKkZ
	4AzG2YiqiOL/lTA9ygQ5c8+Q7RMSRxus6kO8YH2p8ojg3NuQZ/5egonaE+PzNR2Oiadu
	mV3GBAylQjuJsDH6UTy8+nW7ixKo3oTFx4JlRe18BKHKv3LD77egRHgTercuZMdlSzce
	2sPrb+D05VvX0L5KP+scgew/ka8Glv6pF4rAG87jGpqSwnPlHNutInhgeTr1Jxf+ZTcB
	tcdiM8MXUIuJPZv6YVQpH+Fw09LeBj/Zhw1p/T9Z+wom6pSNWfnGh1FmQKvOPmAGUo8t
	ACew==
X-Received: by 10.66.197.136 with SMTP id iu8mr3616081pac.0.1364320520255;
	Tue, 26 Mar 2013 10:55:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id to7sm4981499pab.0.2013.03.26.10.55.17
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 10:55:18 -0700 (PDT)
Date: Tue, 26 Mar 2013 18:55:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130326175514.GK7539@jama>
References: <cover.1363156578.git.Qi.Chen@windriver.com>
	<ab888a7abe849f3170d5386b577f8a92e8ff5385.1363156578.git.Qi.Chen@windriver.com>
	<5482882.4phbAeRO1n@helios>
MIME-Version: 1.0
In-Reply-To: <5482882.4phbAeRO1n@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rm_work.bbclass: inhibit rm_work per recipe
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
X-List-Received-Date: Tue, 26 Mar 2013 18:13:00 -0000
X-Groupsio-MsgNum: 37127
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W2ydbIOJmkm74tJ2"
Content-Disposition: inline

--W2ydbIOJmkm74tJ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2013 at 05:12:16PM +0000, Paul Eggleton wrote:
> On Wednesday 13 March 2013 15:01:33 Qi.Chen@windriver.com wrote:
> > From: Chen Qi <Qi.Chen@windriver.com>
> >=20
> > Use RM_WORK_WHITELIST to inhibit rm_work per recipe. In this way,
> > one can use rm_work for the most of the recipes but still keep the
> > work area for the recipe(s) one is working on.
> >=20
> > As an example, the following settings in local.conf will inhibit
> > rm_work for icu-native, icu and busybox.
> >     INHERIT +=3D "rm_work"
> >     RM_WORK_WHITELIST +=3D "icu-native icu busybox"
> >=20
> > If we comment out the RM_WORK_WHITELIST line and do a rebuild, the
> > working area of these recipes will be cleaned up.
>=20
> This is a great feature, but I just looked at it and realised that the te=
rm=20
> "whitelist" isn't really correct - this is more of a blacklist.
>=20
> The question is does it matter? If so we should probably change it now be=
fore=20
> it becomes too hard to change...

I got similar question yesterday about BB_HASHBASE_WHITELIST:

'And why is it called "WHITELIST"? Shouldn't things that are excluded be
in a "BLACKLIST"?'

Maybe term WHITELIST isn't correct in both of them, at least they are
consistent as it is now :).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W2ydbIOJmkm74tJ2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFR4QIACgkQN1Ujt2V2gBx3SwCfb6j5vbft7wIsb4/eVH3hYRpX
dEQAoI6Yiu4tHSKolphR2EwCFbvT/RB5
=I2aq
-----END PGP SIGNATURE-----

--W2ydbIOJmkm74tJ2--
