Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 66CD36002A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 09:57:46 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id l9so3857524eaj.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 01:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qvz1KsUe9hFyOPeptL5mhyBeDtL8hLtHRAHyjMNGfLI=;
	b=tI09B0hnaS6HcB/cdlilFeTFDseOhjyUdUbzRrCAr9wY/ZaGAaqJnzg1DU84gL+KvF
	ZwT2S9dD084FBvGVY2EzF14jZuGCn9eHSgl88W/0zeaJ9hAjDfdc5ZhNRlHG31s9RDa5
	3cGceqfFMPLsCMJ9RgpOOuO+e3r5xdjqHoyHsIOtxaueI75zQHPn/h0k4Cs/sqZmGDX4
	ABadH5SQ8Y5L6YUp0CJdqC68Ex9H4HaUlv01Q9F69/RNhwG55szFCMj+uex2P1/rU3pO
	LwZJvSg/tq6jTSXL18CysihCe66klMIB5ikbvsJ/KGUqVkQjEncrVuq2M68LlpTAqEYJ
	ZkWg==
X-Received: by 10.14.202.8 with SMTP id c8mr579476eeo.88.1390384666790;
	Wed, 22 Jan 2014 01:57:46 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id u7sm25130087eep.11.2014.01.22.01.57.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jan 2014 01:57:45 -0800 (PST)
Date: Wed, 22 Jan 2014 10:57:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20140122095745.GQ4100@jama>
References: <1390347792-24649-1-git-send-email-Martin.Jansa@gmail.com>
	<1390347792-24649-2-git-send-email-Martin.Jansa@gmail.com>
	<20140122004909.GO4100@jama>
	<D8C17D3D-12B9-41E5-AB9D-A2E916ACAB23@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <D8C17D3D-12B9-41E5-AB9D-A2E916ACAB23@dominion.thruhere.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] feature-arm-thumb: Fix missing t2 suffix for armv7a MACHINEs
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
X-List-Received-Date: Wed, 22 Jan 2014 09:57:46 -0000
X-Groupsio-MsgNum: 49365
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UJEqbsikIZBgizPR"
Content-Disposition: inline

--UJEqbsikIZBgizPR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2014 at 07:43:19AM +0100, Koen Kooi wrote:
>=20
> Op 22 jan. 2014, om 01:49 heeft Martin Jansa <martin.jansa@gmail.com> het=
 volgende geschreven:
>=20
> > On Wed, Jan 22, 2014 at 12:43:12AM +0100, Martin Jansa wrote:
> >> * unfortunatelly that note about armv7 matching also armv7a is no
> >>  longer valid since armv7 include in armv7 was replaced with
> >>  armv6+neon in this commit:
> >>=20
> >>  commit 75b8adbc042e0f65fb1286bc550d02becd3b6aea
> >>  Author: Khem Raj <raj.khem@gmail.com>
> >>  Date:   Tue Mar 27 18:37:45 2012 -0700
> >>=20
> >>    tune/armv7: Delete
> >>=20
> >>  since then thumb and arm feeds had the same architecture
> >> * be aware that this will rename lots of feeds
> >=20
> > Can someone confirm that t2 should be included for armv7m or armv7r?
>=20
> cortex-M is thumb2 only, no idea about cortex-r.

Thanks.

=46rom
http://www.arm.com/products/processors/cortex-r/cortex-r4.php

it looks like r4 should support both, I've addressed that in following
RFC/WIP.

> > It looks like armv7m definitely should include it, but it doesn't even =
have
> > thumb in TUNE_FEATURES for the only armv7m user we have in oe-core cort=
exm3:
> >=20
> > tune-cortexm3.inc:TUNE_FEATURES_tune-cortexm3 =3D "armv7m vfp cortexm3"
> > tune-cortexm3.inc:PACKAGE_EXTRA_ARCHS_tune-cortexm3 =3D "${PACKAGE_EXTR=
A_ARCHS_tune-armv7at} armv7m-vfp"
> >=20
> > tune-cortexr4.inc:TUNE_FEATURES_tune-cortexr4 =3D "armv7r vfp cortexr4"
> > tune-cortexr4.inc:PACKAGE_EXTRA_ARCHS_tune-cortexr4 =3D "${PACKAGE_EXTR=
A_ARCHS_tune-armv7at} armv7r-vfp"
> >=20
> > Anyway I'm sending a bit bigger RFC/WIP patchset to address this.
> >=20
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> ---
> >> meta/conf/machine/include/arm/feature-arm-thumb.inc | 3 +--
> >> 1 file changed, 1 insertion(+), 2 deletions(-)
> >>=20
> >> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/met=
a/conf/machine/include/arm/feature-arm-thumb.inc
> >> index bd754be..fa3a4e5 100644
> >> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> >> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> >> @@ -9,11 +9,10 @@ ARM_THUMB_M_OPT =3D "${@['-marm', '-mthumb'][d.getVa=
r('ARM_INSTRUCTION_SET', True)
> >> TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "thumb", " ${A=
RM_THUMB_M_OPT}", "", d)}"
> >> OVERRIDES .=3D "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb=
", "", d)}"
> >>=20
> >> -# Note armv7 will hit on armv7a as well
> >> ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "armv4",=
 "thumb" ], "t", "", d)}"
> >> ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "armv5",=
 "thumb" ], "t", "", d)}"
> >> ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "armv6",=
 "thumb" ], "t", "", d)}"
> >> -ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "armv7"=
, "thumb" ], "t2", "", d)}"
> >> +ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "armv7a=
", "thumb" ], "t2", "", d)}"
> >>=20
> >> # Whether to compile with code to allow interworking between the two
> >> # instruction sets. This allows thumb code to be executed on a primari=
ly
> >> --=20
> >> 1.8.5.3
> >>=20
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UJEqbsikIZBgizPR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLflhkACgkQN1Ujt2V2gBxQ+gCgp1fyJXoM8aksNc5mG1s6LbAd
DwIAn0ZufNxN8o0FNoAoKQDGKCEejjTD
=+4ip
-----END PGP SIGNATURE-----

--UJEqbsikIZBgizPR--
