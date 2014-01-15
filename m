Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id A7E576B4F7;
	Wed, 15 Jan 2014 10:30:39 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id f15so353383eak.25
	for <multiple recipients>; Wed, 15 Jan 2014 02:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Pm6jy16D8nQUm3Lgi+ZPQ/4aKjzaMjMj1N9kFQ9TEdw=;
	b=lVfEc5p2ZWb6PkhSsqwgvzps/39K63onAIHVsVhcHm7SX8pTWvG7V3ZPVZ0BJpLOIz
	L+hy1i5El5H74hr4XnFsygVUgmGED8y4GBorb+jH0+z+lL/VqdZv0mXKETiSY7D8WVKf
	TcUGS/g0JBSToE1I5OE5UPGWVYsKMy/u2sl4nETWIh19fO/zOk8JKQfrwDpzWQdh8i24
	igQTAuS5qgnRPVP3oYc9znN5bjdlio5cunDK0jWv9y5O1KD64lWtW0ilihuyzP4taMPb
	976XRp0/192tWlUMvtzVildQGvEjnW1g/9koG0pgeb7Uo34iSYnNRYS3Fl55xypEC1VW
	MZ6Q==
X-Received: by 10.14.210.65 with SMTP id t41mr2473714eeo.53.1389781840245;
	Wed, 15 Jan 2014 02:30:40 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 4sm9072177eed.14.2014.01.15.02.30.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 02:30:39 -0800 (PST)
Date: Wed, 15 Jan 2014 11:30:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140115103059.GH3717@jama>
References: <20140106112936.C3F0C50472@opal> <20140109144245.GF3709@jama>
	<1389763343.3092.17.camel@dvhart-mobl4.amr.corp.intel.com>
	<52D62433.8020402@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52D62433.8020402@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Darren Hart <dvhart@linux.intel.com>,
	openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : autogen-native: upgrade to 5.18.2
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
X-List-Received-Date: Wed, 15 Jan 2014 10:30:41 -0000
X-Groupsio-MsgNum: 49019
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vjQsMS/9MbKYGLq"
Content-Disposition: inline

--5vjQsMS/9MbKYGLq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2014 at 02:01:23PM +0800, Robert Yang wrote:
>=20
>=20
> On 01/15/2014 01:22 PM, Darren Hart wrote:
> > On Thu, 2014-01-09 at 15:42 +0100, Martin Jansa wrote:
> >> On Mon, Jan 06, 2014 at 11:29:36AM +0000, git@git.openembedded.org wro=
te:
> >>> Module: openembedded-core.git
> >>> Branch: master
> >>> Commit: 6bcd2dafa379badab11bff9d7b607f7f5d72fc94
> >>> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3D6bcd2dafa379badab11bff9d7b607f7f5d72fc94
> >>>
> >>> Author: Robert Yang <liezhi.yang@windriver.com>
> >>> Date:   Fri Dec 27 01:05:14 2013 +0800
> >>>
> >>> autogen-native: upgrade to 5.18.2
> >>>
> >>> * Upgrade from 5.17.4 to 5.18.2
> >>> * Rename files -> autogen
> >>>
> >>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >>
> >> Fails in world builds:
> >
> > Guessing I'm behind somewhere - seeing this as well. I thought it was an
> > sstate issue, but doesn't appear to be. Is this addressed in a MUT build
> > or something already?
> >
>=20
> Hi Darren,
>=20
> I'm trying to figure out the reason, but haven't got much progress yet.

Does autogen autodetect guile like make-4 does? RP fixed it in make
yesterday.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5vjQsMS/9MbKYGLq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLWY2MACgkQN1Ujt2V2gBxS+wCgk6CsSwU2NrD2gxucX5y5X9QH
xfIAn09G/nu13ErNy7A5Bz18BEH0H058
=6n/w
-----END PGP SIGNATURE-----

--5vjQsMS/9MbKYGLq--
