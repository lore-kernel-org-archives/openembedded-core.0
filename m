Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UR1xw-0000XR-Vc; Sat, 13 Apr 2013 17:02:09 +0200
Received: by mail-da0-f54.google.com with SMTP id p1so1497834dad.41
	for <multiple recipients>; Sat, 13 Apr 2013 07:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=yRBZD3pSIcch7Z0IVppIuwsp8iZatAxlrL/htIwpQI8=;
	b=MbA+kRrPipyU8nswescqMgcy3HwBRAQ285SyEGssIeV/2LSuOxpEKcIxWhg1Z+DeNi
	1FkGAvYFwFFMTAWPODSscuk5XnqOh9OAReYQrib3mjluFio5g9tJh6nZ1lcoV2nZA1uU
	G6ZHugb0HVSmlQ8SgWDw9XFRNCE3CxCqMv9ywlcr5gZhEWd8DAuhuCClR9qSd9c+PE/S
	PJ4UpaiN5dOO73WyibB7bA6pRE9w4CMgDxmcR5QWbR04w/Ty0hmzEJRMOOTyc0aZUAzT
	Bou7suidYnKpU92o4AzD5SvwDBidXokBZDBwAwVd1SZ4WuF4SpuG5jWwtJoZQvC1VhK3
	oCmA==
X-Received: by 10.68.236.134 with SMTP id uu6mr20223529pbc.55.1365864281934;
	Sat, 13 Apr 2013 07:44:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	ba10sm12845801pbd.21.2013.04.13.07.44.38
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 07:44:40 -0700 (PDT)
Date: Sat, 13 Apr 2013 16:44:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130413144435.GF2477@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20121223201634.GN8988@jama.palm1.palmone.com>
	<20121224091242.GS8988@jama.palm1.palmone.com>
	<20130109132813.GJ3722@jama.palm1.palmone.com>
	<CALbNGRTEiLQ8JkN1PvRc6k2rbuvnozP79ywYudMaUyXNViGpSg@mail.gmail.com>
	<CAJTo0LZT_b4mRrYJOVJzfTzgU4-ipZhswQme-=FqFNGD6q845g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZT_b4mRrYJOVJzfTzgU4-ipZhswQme-=FqFNGD6q845g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world
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
X-List-Received-Date: Sat, 13 Apr 2013 15:02:10 -0000
X-Groupsio-MsgNum: 37860
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0NUq3YI6/rBc6tSL"
Content-Disposition: inline

--0NUq3YI6/rBc6tSL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 09, 2013 at 04:25:40PM +0000, Burton, Ross wrote:
> On 9 January 2013 15:17, Andreas M=FCller <schnitzeltony@googlemail.com> =
wrote:
> > 2. bitbake libnotify3 -> Tons of: 'WARNING: The recipe libnotify3 is
> > trying to install files into a shared area when those files already
> > exist. Those files and their manifest location are:
> >    /home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/lib/libnotify.a
> >    Matched in manifest-overo-libnotify
>=20
> The current libnotify doesn't actually depend on GTK+ 2 or GTK+ 3
> (well, the tests do, but that's trivially resolved with an
> upstreamable patch to add --disable-tests), so we don't need two
> recipes.
>=20
> Speaking of GTK+ 3, I'm about to start pushing a series to add it to oe-c=
ore.

Is someone working on making libnotify and libnotify3 playing nice
together? Would be nice to fix it before branching..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0NUq3YI6/rBc6tSL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFpb1MACgkQN1Ujt2V2gBwvlwCgg85HM7xsMrKH3MiWZd2kJsYm
pi0AoI+jRfH2231GnjPy27WtidiaTdUo
=smmt
-----END PGP SIGNATURE-----

--0NUq3YI6/rBc6tSL--
