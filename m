Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBMMO-0000Pb-72
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 10:34:38 +0100
Received: by mail-da0-f52.google.com with SMTP id x33so1312621dad.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 01:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=mcV5EIPFlQYbzT/Rg9O3nUf31sQdtyFDywAX0Tfus44=;
	b=fvzV2kbUUuu7n/fn48g8cpKty5CFHiQHRn/fHA/b952mFEMNpqK/wELygQOign4mRc
	kabnS0AyRPsrWqioooM9EwiC7Q6+oP2gXThxzu8hJd0tRl+Py28nwJruxNWPRwmC7iaL
	5w7fV5tNhAHPW5OLZ5LnViYz4PLTRxj0ybuA8XZKKiO/Iu0cjH5v/SISow6SFfLTO+a4
	zmSksm5OdaYFTA7pBzifjP8qqWY8bv3+LlhdmwQ4C4QyODHEK/0o0UR0XqJqs09wrxH6
	uEfuZ4hBwSh2+XAeWpewj/V7uqDZ42s7HM4QJ+legxws/ThrxUQGxtY4QtzzKvKpqA8e
	r6fQ==
X-Received: by 10.68.134.133 with SMTP id pk5mr8111149pbb.209.1362129492354;
	Fri, 01 Mar 2013 01:18:12 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e6sm12457114paw.16.2013.03.01.01.18.07
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Mar 2013 01:18:11 -0800 (PST)
Date: Fri, 1 Mar 2013 10:18:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130301091804.GF3279@jama>
References: <cover.1362003285.git.sgw@linux.intel.com>
	<1362093308.1055.4.camel@ted> <20130228234226.GC3279@jama>
	<1362097609.1055.35.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1362097609.1055.35.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/40] Post-ELC Patches and Updates
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
X-List-Received-Date: Fri, 01 Mar 2013 09:34:38 -0000
X-Groupsio-MsgNum: 36066
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oOB74oR0WcNeq9Zb"
Content-Disposition: inline

--oOB74oR0WcNeq9Zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2013 at 12:26:49AM +0000, Richard Purdie wrote:
> On Fri, 2013-03-01 at 00:42 +0100, Martin Jansa wrote:
> > On Thu, Feb 28, 2013 at 11:15:08PM +0000, Richard Purdie wrote:
> > > > Martin Jansa (1):
> > > >   sanity: use lsb distro_identifier
> > >=20
> > > Where are the updates this would need associated with it?
> >=20
> > It was only RFC and only Otavio said he likes it IIRC
>=20
> It seems reasonable but I need both pieces and if its going in, it needs
> to go in soon as we are starting to get into the release period.

OK, just to be sure, the other piece is poky.conf update, right?
SANITY_TESTED_DISTROS ?=3D " \
            Yocto (Built by Poky 8.0) 1.2 \n \
            Yocto (Built by Poky 7.0) 1.2 \n \
            Poky 7.0 (Yocto Project 1.2 Reference Distro) 1.2 \n \
            Poky 8.0 (Yocto Project 1.3 Reference Distro) 1.3 \n \
            Ubuntu 10.04.4 LTS \n \
            Ubuntu 11.10 \n \
            Ubuntu 12.04 LTS \n \
            Ubuntu 12.04.1 LTS \n \
            Ubuntu 12.10 \n \
            Fedora release 16 (Verne) \n \
            Fedora release 17 (Beefy Miracle) \n \
            Fedora release 18 (Spherical Cow) \n \
            CentOS release 5.6 (Final) \n \
            CentOS release 5.7 (Final) \n \
            CentOS release 5.8 (Final) \n \
            CentOS release 6.3 (Final) \n \
            Debian GNU/Linux 6.0.6 (squeeze) \n \
            openSUSE 11.4 \n \
            openSUSE 12.1 \n \
            openSUSE 12.2 \n \
            "

I'm not using poky as DISTRO and don't have access to most of those
distros to check lsb_release output.

I'm sure about Ubuntu where it's easy:
            Ubuntu-10.04 \n \
            Ubuntu-11.10 \n \
            Ubuntu-12.04 \n \
            Ubuntu-12.10 \n \
but with others I'll need some help.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oOB74oR0WcNeq9Zb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEwckwACgkQN1Ujt2V2gBxb1QCferOC1hGdSdg4xPY3nPTLC1Jv
zP4AoLj+Ie7Lk3CqYlQeEEWN7By5tQ8p
=wygz
-----END PGP SIGNATURE-----

--oOB74oR0WcNeq9Zb--
