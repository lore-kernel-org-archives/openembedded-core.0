Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TykQo-0000In-IJ
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 15:39:04 +0100
Received: by mail-pb0-f47.google.com with SMTP id wz17so240806pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 06:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=WR7rGiMdN440nyXIAbYGlwDA/ogiu54Vtr+bxrZxFN8=;
	b=lqweOmzb25ZNYbyDy43WQ3CqrdeJbPuesh0x13dFiGk9txLUMx/Z0L6YiY35id4ckT
	6hQjtA3mJagJO6rTKEsw2hNxmtZIim1Jldv0yS4KtBLTcw8719nGU9JsfutdNJI12bhC
	JSl1/ANQr7jiNKpY7xwKOr2EMUbh+S4TXz5+j7GKEhAQwSO4ECGqiy/4chChmCswrUsx
	9fNWq0eZP70gqpuI3DoUKVHpPvRGpZC/R+Iiqj7B9Bd7vdFcW8UK120cITPB7eAHCaBo
	dbcjMkS7wUTafVJ/LPdh7jzn5xpMHxCkHu5rn7D36P+Df6bTiGEjUUKkxAvIsezOpVpI
	1akA==
X-Received: by 10.68.203.137 with SMTP id kq9mr14372237pbc.115.1359123807561; 
	Fri, 25 Jan 2013 06:23:27 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ho4sm751913pbc.54.2013.01.25.06.23.24
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 06:23:26 -0800 (PST)
Date: Fri, 25 Jan 2013 15:23:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130125142322.GH3200@jama>
References: <20130123172748.GB14381@jama.palm1.palmone.com>
	<CABcZANkfiefEBNVAswnCrmjPFSiJeijvaJ+o++EH7qtrQfnKMA@mail.gmail.com>
	<51008153.6090800@windriver.com> <1358988079.3616.6.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1358988079.3616.6.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Matthew McClintock <msm@freescale.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: File conflicts between PN-doc packages
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
X-List-Received-Date: Fri, 25 Jan 2013 14:39:06 -0000
X-Groupsio-MsgNum: 34432
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sl5MdczEF/OU2Miu"
Content-Disposition: inline

--sl5MdczEF/OU2Miu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 24, 2013 at 12:41:19AM +0000, Richard Purdie wrote:
> On Wed, 2013-01-23 at 18:33 -0600, Mark Hatle wrote:
> > On 1/23/13 6:13 PM, Chris Larson wrote:
> > >
> > > On Wed, Jan 23, 2013 at 10:27 AM, Martin Jansa <martin.jansa@gmail.com
> > > <mailto:martin.jansa@gmail.com>> wrote:
> > >
> > >     |  * check_data_file_clashes: Package gcc-doc wants to install fi=
le
> > >     rootfs/usr/share/info/dir
> >=20
> > I missed this earlier.  Yes, the 'dir' file in an info (-doc) package s=
hould not=20
> > be included.  It's existence is an error.  This might be a sanity check=
 we=20
> > should be adding.

Good to see that world-image is useful to detect other kinds of issues
then I originally expected :).

> autotools_do_install() in autotools.bbclass actually purges those.
> Whether it should be autotools or the base class I'm not so sure but it
> was a common problem for autotools recipes...

It's removed in gcc-configure-runtime.inc but only for libgomp
RUNTIMETARGET, does someone remember why? Adding Matthew, because that
removal was added in:

commit b76a7bc8dcb7aed7d6f026e77a226837004c50af
Author: Matthew McClintock <msm@freescale.com>
Date:   Tue Jul 10 16:12:29 2012 +0000

libgomp: add libgomp (openmp) library, and build for powerpc targets by def=
ault

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sl5MdczEF/OU2Miu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEClVoACgkQN1Ujt2V2gBzNQACfU5W8PWvWTNtz/artbfRi5Cm2
gO0AnA4J7f0BRONprV6L3GH6q9X3oaCS
=3PWC
-----END PGP SIGNATURE-----

--sl5MdczEF/OU2Miu--
