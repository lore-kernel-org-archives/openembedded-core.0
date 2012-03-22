Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SAc0H-0000QT-LA
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 08:00:10 +0100
Received: by wibhj13 with SMTP id hj13so280030wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 23:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VVQ1iUHY8nAZ0xwZyAK1YjGO80AzsyrPtpVQE1rK4Rk=;
	b=PnIseymxAXrBIVn2pJ2F+rjsL7pJPb/ogS0bupqvJwfYNyVWncFR6zlXQ03LVgYOLa
	Os8wauftxxedQVzUXBiIchF1ASVoBkKN8XQneuVQQhrY4QJY6rc2EzsmLw/9lqoHjtOr
	d8xSyy4ZrXanUczkp1RJI0sKbUFmFmA5eOJ9h65hNM5qyLCAt/106/Pd4uYMUdSWmQqn
	7fzZqP+Xhnx6fBKz/UczxIp3MErHVXqTqjoaZvWcFIwuupHXYAkvf8aNojCvQ3NNt456
	Y8Bby67eEwVTdJtDB3TAP0+QnuqnacP9FJttU7ahEZynslYFS6VTQisuvy98m7D94xx4
	db/w==
Received: by 10.180.84.164 with SMTP id a4mr2420528wiz.2.1332399075083;
	Wed, 21 Mar 2012 23:51:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id df3sm2902235wib.1.2012.03.21.23.51.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 23:51:14 -0700 (PDT)
Date: Thu, 22 Mar 2012 07:51:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120322065113.GB4010@jama.jama.net>
References: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
	<f21ffad75e377042ebb9d59a01d6b424c6bba711.1332365336.git.Martin.Jansa@gmail.com>
	<1332371476.9740.218.camel@ted>
	<20120321235049.GA4010@jama.jama.net>
	<1332374564.9740.228.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1332374564.9740.228.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 06/13] gtk+: import native support from meta-oe
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
X-List-Received-Date: Thu, 22 Mar 2012 07:00:11 -0000
X-Groupsio-MsgNum: 19390
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Content-Disposition: inline

--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 12:02:44AM +0000, Richard Purdie wrote:
> On Thu, 2012-03-22 at 00:50 +0100, Martin Jansa wrote:
> > On Wed, Mar 21, 2012 at 11:11:16PM +0000, Richard Purdie wrote:
> > > On Wed, 2012-03-21 at 22:36 +0100, Martin Jansa wrote:
> > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > ---
> > > >  meta/recipes-gnome/gtk+/gtk+.inc |    4 ++++
> > > >  1 files changed, 4 insertions(+), 0 deletions(-)
> > >=20
> > > I really don't like the message having a gtk+-native around sends out.
> > > Why do we need this?
> >=20
> > See cover letter if you haven't already.
>=20
> Sorry, I'd looked at it but I'd missed the key bit. I think I thought
> the URL was a pull URL and my eyes skimmed it.

No problem,

> To be honest I don't think the update-icon-cache is good enough reason
> to build a full gtk+-native. If we let these pieces in the dependencies
> have a tendency to grow and people have no incentive to try and fix
> these issues.

Well agreed, but most of those natives are needed for librsvg-native
which in turn is used in navit build to generate icons (which I can
hardly replace with something thiner then librsvg and using e.g.
autodetected ksvgtopng from host is even worse for reproducible builds).

So for minimal gtk+-native I only need libx11-native and
libxrander-native, but the problem is that PACKAGECONFIG without that
fix ignores all -native depends and with fix it correctly adds -native
to all non-native deps added by PACKAGECONFIG
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019348.ht=
ml

> I'd like to better understand why there is no other way to avoid this.

I can look into gtk+3 build what else we need to provide to be able to
build without --enable-gtk2-dependency or how to disable
update-icon-cache during build so that people with gtk+ installed on
host and without get the same result package, but I'm not really
interested in gtk+3 so I was just fixing another build failure :/ so it=20
can take some time...

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9qy+EACgkQN1Ujt2V2gBziTQCfepPHiUIyab1wwj+LKzwmPzXG
OqQAoKHM2dC/m9deXuSMDqWmJSd2qHSc
=LvNd
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
