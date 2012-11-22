Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbXgc-0006sc-FU
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 15:23:26 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so3150538eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 06:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8jcDdmeek1DM7ZzGhqcbClvSA86PXh+F5GsIRbMhNnw=;
	b=c6yGdOiTl3Ug6gp0GfYQ7f/zAx21d38D18sQp5P30slhh8YdzdniWdZFB8OGa2rOOt
	zsKdXkd9LRlG7u0KcjsQaX12r/7keG1u/FrQl48TOrhPlE0Y4MM1kz1hRewlidcN/8Y9
	Klz+YLnM43Q/vpOGtfjgXEgWmgD9lZUI5YgmD1EaUkCtFmYIbE0ifUcPqyRkFtEBhwG7
	phD0TxfUSlUmajJ2Yc/jg8IWSEAoazLNFt2zcxp+PT7ieCNpdojuSzyo9XB8p00zNNq/
	zZ6MPFoAvhjJout2SbfcHL+Jish+jUqP5TMI2CjIUEzpMF9F3UPBTzkzye4x1RLQN7Wq
	029g==
Received: by 10.14.221.194 with SMTP id r42mr1859108eep.25.1353593360267;
	Thu, 22 Nov 2012 06:09:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm7186326eep.5.2012.11.22.06.09.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 06:09:19 -0800 (PST)
Date: Thu, 22 Nov 2012 15:09:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20121122140917.GF12637@jama.jama.net>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<7f73d8a0aee08a41e949ec7a1297f5edbf12ed57.1352898505.git.laurentiu.palcu@intel.com>
	<20121121162051.GK12637@jama.jama.net> <50ADE2F7.4070904@intel.com>
	<20121122083735.GU12637@jama.jama.net> <50ADE966.4060300@intel.com>
	<CAOT3mi+kr6mg4tPwkY9uHohFw9w2vWVnLPDNaZV2XDuyWbL52Q@mail.gmail.com>
	<CA+chaQf1MWGeSP=BsZBtTG+mOgGEL7dm51yUcBu_36co9bZz4g@mail.gmail.com>
	<CAJTo0LYTJD=QWk8pL+EEs-jsFvCPS+R_HxbD6N9tquiuCjR9=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYTJD=QWk8pL+EEs-jsFvCPS+R_HxbD6N9tquiuCjR9=A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 12/12] xf86-video-omap: add new recipe to follow the maintained repo
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
X-List-Received-Date: Thu, 22 Nov 2012 14:23:26 -0000
X-Groupsio-MsgNum: 31669
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Ohz8t0v+ZTQEWKa"
Content-Disposition: inline

--1Ohz8t0v+ZTQEWKa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 02:05:21PM +0000, Burton, Ross wrote:
> On 22 November 2012 12:43, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Well that's probably the same issue GNUtoo reported on xf86-video-omap
> > patch, before it was merged and xf86-video-omapfb removed..
> >
> > Pity that bits of red in autobuilder logs are the most important
> > quality indicator for some people...
>=20
> Bits of red that nobody is willing to fix?  If you've the hardware to
> test it on, and the need for it to work, the backporting the
> compat-api changes (which have been made to every other video driver)
> isn't *that* difficult.

As said in other thread I did that already for xf86-video-glamo in
meta-oe, so I agree that it's not *that* difficult.

But I'm not sending xf86-video-glamo change before it's tested not only
to build, but also to work in runtime.

And I cannot work on xf86-video-omapfb now, because builder is still
rebuilding armv7a after last layout changes.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1Ohz8t0v+ZTQEWKa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCuMg0ACgkQN1Ujt2V2gBxg6wCghJ14LCHjkrun9/TgeNaJz8Rz
mzQAoJLU1Z+anbind1OKDDveyScPuVMD
=fQ4G
-----END PGP SIGNATURE-----

--1Ohz8t0v+ZTQEWKa--
