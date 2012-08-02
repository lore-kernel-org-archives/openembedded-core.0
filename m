Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Swwhj-0002ih-Sy
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 16:48:47 +0200
Received: by wibhm2 with SMTP id hm2so5035703wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 07:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6szyeaY8cMZLJLK4/fhr/V3d7mkP/O8c6M+y+V8dqr4=;
	b=Ncc5pByHOZtQiZBr2fDXmPJ3QJdXAraNHUxNS4GFMpFUVt3QzOdCLYq8w9ZqBK6x4n
	BbJaDazf/qx2jluy1IuYHgJbTi/DyulYz3q+ofGk7HFWy0fRqH/xQlWUEakjsO2MxhTG
	sU4CwiFG8nO6ZhuwRDjD5+3g1fWYrz9dCf7RUMJX7Rb9YC1em2up9MuXZCdC/qpJ7OxW
	tpWPviz2uQzm6iju4q9nG3chg3hqKCc9+apxTvVTcGSPIIHbvvUyjS13lEFcnjBLmxup
	hsMqCQKSyY4niOR55FrDACPUjR6NUPDGxFhW/NighE0a83OpPM8yREKTv3qawzFyW6CF
	3uzw==
Received: by 10.217.3.7 with SMTP id q7mr4787624wes.47.1343918228382;
	Thu, 02 Aug 2012 07:37:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm17663883wiz.9.2012.08.02.07.37.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 07:37:07 -0700 (PDT)
Date: Thu, 2 Aug 2012 16:37:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120802143705.GT16306@jama.jama.net>
References: <20120801065021.GC15199@jama.jama.net>
	<20120801065401.GD15199@jama.jama.net>
	<8071B2D8-3431-4B9B-A810-0F01D4837779@gmail.com>
	<20120802115012.GO16306@jama.jama.net>
	<C496D1D2-DB12-4B52-9D3A-5BB5E663FBC3@gmail.com>
MIME-Version: 1.0
In-Reply-To: <C496D1D2-DB12-4B52-9D3A-5BB5E663FBC3@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: u-boot do_compile should be reentrant even with ld-is-gold
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
X-List-Received-Date: Thu, 02 Aug 2012 14:48:48 -0000
X-Groupsio-MsgNum: 26793
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hOmQO3H5Qmmwdmk8"
Content-Disposition: inline

--hOmQO3H5Qmmwdmk8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 02, 2012 at 07:30:38AM -0700, Khem Raj wrote:
>=20
> On Aug 2, 2012, at 4:50 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > On Wed, Aug 01, 2012 at 04:02:24PM -0700, Khem Raj wrote:
> >>=20
> >> On Jul 31, 2012, at 11:54 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> >>=20
> >>> well not exactly like this one as this is causing
> >>> /bin/sh: 1: Syntax error: Bad fd number
> >>> probably from ">&" in dash
> >>=20
> >>=20
> >> yes. I swear I have since fixed this patch this seems to be an older v=
ersion
> >> did you look into meta-ti/master ?
> >=20
> > Yes, your patch is fixed in meta-ti, but cannot be used together with
> > Otavio's patch to u-boot.inc.
> >=20
> > meta-ti is fine because it provides own u-boot.inc, but with your patch
> > and u-boot.inc from oe-core it ends like this
>=20
>=20
> so why don't you migrate the patch from meta-ti into OE-Core ? and leave =
this sed
> thing out ?

Because all layers using u-boot.inc from oe-core probably already have
this patch and adding it to oe-core too will cause do_patch to fail.

Or those layers are not using SRC_URI from u-boot.inc and then they
won't get this patch anyway.

And I don't want to introduce another kind of automagic which would
add that patch to SRC_URI only if it's not added by some .bbappend
already..=20

One character change in that regexp fixed all use-cases I can think of,
so looks like best solution to me..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hOmQO3H5Qmmwdmk8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAakJEACgkQN1Ujt2V2gByBSQCfU9vU7Nk1uJpl5zqujmvhzsHu
vQ4An2PSWYBZa0mZcbkVFZxWqx8m/7e1
=oAft
-----END PGP SIGNATURE-----

--hOmQO3H5Qmmwdmk8--
