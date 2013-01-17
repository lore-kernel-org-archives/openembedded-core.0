Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tvp2J-0002wr-C4
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 13:57:40 +0100
Received: by mail-pb0-f42.google.com with SMTP id rp2so1391509pbb.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 04:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=l3q+L+/2yg+VreQzCP2l0bW4DOyzYKWrveGSzOGUFdI=;
	b=UTbMGAxm4YGrokdi76v/na5DJGPmp3kDmfKtJNiaeX1/ubGxJ+sSNNhvfGhaJmpJXi
	SAmHWQ0FaPuDzhosdRDc/9gY2Me2EhilSe5slVozdzZ0p331FFNPmarxxuGq5Q6w98JR
	Fc0y8iEJNHkiftLhR4eZax79lzoiNyWVciHr8qkd5HealTENnjva1L9r7N8Aqje7MGky
	wUqBjxlhRjkoegXDVm5ITplHmjDaDeOwSjupsdBIBzaKGDIawCYfbTT8NQEdzq4+241g
	fs4HNhNUBfY028bgqUAgkKH/314Xh3pfrUmW4nTuzoqJUFXex7EOYpxA2LROliCABv/T
	6FHg==
X-Received: by 10.66.89.199 with SMTP id bq7mr13353382pab.26.1358426535674;
	Thu, 17 Jan 2013 04:42:15 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bi8sm1287802pab.15.2013.01.17.04.42.12
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 04:42:14 -0800 (PST)
Date: Thu, 17 Jan 2013 13:42:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Message-ID: <20130117124209.GE3067@jama>
References: <1358345647-13274-1-git-send-email-giuseppe.condorelli@st.com>
	<20130116150205.GE3002@jama>
	<CAOHjBZsXebja8FB4GbQNwm5zxBCoEOPh40rE9b71EzXG5fGWdA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOHjBZsXebja8FB4GbQNwm5zxBCoEOPh40rE9b71EzXG5fGWdA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: fix as and ld check in libc dir
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
X-List-Received-Date: Thu, 17 Jan 2013 12:57:40 -0000
X-Groupsio-MsgNum: 33953
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="orO6xySwJI16pVnm"
Content-Disposition: inline

--orO6xySwJI16pVnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2013 at 04:07:39PM +0100, Giuseppe Condorelli wrote:
> 2013/1/16 Martin Jansa <martin.jansa@gmail.com>
>=20
> > On Wed, Jan 16, 2013 at 03:14:07PM +0100, Giuseppe CONDORELLI wrote:
> > > Fix routine to check as and ld version check in the configure, to all=
ow
> > system
> > > to correctly check for version 2.1x.
> >
> > Does it build with gold now?
> >
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/02031=
0.html

does it?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--orO6xySwJI16pVnm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD38aEACgkQN1Ujt2V2gBy/0wCeLeOfkwsIllV4LK9k1r0IEftN
jbUAnA+zizUW5jBviCLttE0+MfW7JpLa
=9kB/
-----END PGP SIGNATURE-----

--orO6xySwJI16pVnm--
