Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id ACDF66CB7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 23:18:52 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id b57so4415160eek.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 15:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=B7LR91ButTQBuRxcBvO0yj29g4Phqj76tfPokoAiWXI=;
	b=rBWQqfUU1lN2saBp5D0oh9fqHOG+/UrWy9QRH3vuTjvWFdRiw7Ik+DnbaMGvXHlqua
	mf1hKXUkr55v++NV3bn4QqS1MA+hyn+H9KiPvvyKjoBIQv3ktCFGMkx7UEpdGuP2GQ9B
	FsymKvudOt1zbpKO3H2tmznOXoPXYoNH3AaDdKQOiuUlkPAQvCK+TWFANS6dgfCCBcXu
	3MZHGghxbpb47sWp5FfwROyZGDfxsmsnQBN4v5qYRBLR2SOIuF+BriPdGablZefs3jbt
	dWuQRvN8X66pJImUy1R1qcydsgNeYH9RdJ/K70qKClq2YwnCwneN+NYpAzRW/lEW0N5K
	CJDA==
X-Received: by 10.15.52.136 with SMTP id p8mr26180550eew.11.1390346333301;
	Tue, 21 Jan 2014 15:18:53 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o47sm20050899eem.21.2014.01.21.15.18.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 15:18:52 -0800 (PST)
Date: Wed, 22 Jan 2014 00:18:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Message-ID: <20140121231852.GN4100@jama>
References: <cover.1390342768.git.dvhart@linux.intel.com>
	<c65b846c5d5882f4adcb504ca01291173bd4bcf8.1390342768.git.dvhart@linux.intel.com>
	<20140121225825.GM4100@jama>
	<1390345935.13672.13.camel@dvhart-mobl4.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1390345935.13672.13.camel@dvhart-mobl4.amr.corp.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 12/15] genericx86: Use the core2 tune file
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
X-List-Received-Date: Tue, 21 Jan 2014 23:18:53 -0000
X-Groupsio-MsgNum: 49312
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yAzUYvkKIfeS0jQX"
Content-Disposition: inline

--yAzUYvkKIfeS0jQX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2014 at 03:12:15PM -0800, Darren Hart wrote:
> On Tue, 2014-01-21 at 23:58 +0100, Martin Jansa wrote:
> > On Tue, Jan 21, 2014 at 02:39:58PM -0800, Darren Hart wrote:
> > > Aside from the movbe and specialized instruction scheduling for the l=
ack
> > > of out-of-order scheduling in the older Atom CPUs, the core2 tune cov=
ers
> > > these CPUs adequately. Since the current atom tune just uses core2
> > > anyway, go ahead and make this explicit here.
> > >=20
> > > Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> > > ---
> > >  meta-yocto-bsp/conf/machine/genericx86.conf |    3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta-yocto-bsp/conf/machine/genericx86.conf b/meta-yocto=
-bsp/conf/machine/genericx86.conf
> > > index 9d29f62..549fc8e 100644
> > > --- a/meta-yocto-bsp/conf/machine/genericx86.conf
> > > +++ b/meta-yocto-bsp/conf/machine/genericx86.conf
> >=20
> > This isn't for oe-core, is it?
> >=20
>=20
> Nope. I called this out in the cover letter. It spans oe-core and poky,
> but I felt they were best viewed as a whole, rather than splitting them
> apart and worrying about the order in which they were applied. I
> understand the desire to not cross post and generally agree and avoid it
> - on rare occasions such as this, it seems the least awful way to go
> about it...

OK, sorry I see it now, for some reason cover letter arrived to my
maildir last.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yAzUYvkKIfeS0jQX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLfAFwACgkQN1Ujt2V2gBz5+wCeOf1Z4pSlmYdpQXYdrKWYvzHH
0LUAoJ54gtvM/kxZG3jHbJUL2KIwH6M4
=cEow
-----END PGP SIGNATURE-----

--yAzUYvkKIfeS0jQX--
