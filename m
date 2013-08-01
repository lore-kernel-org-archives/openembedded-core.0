Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id BFC926B1F0;
	Thu,  1 Aug 2013 11:37:01 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so952289ead.31
	for <multiple recipients>; Thu, 01 Aug 2013 04:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p61Us68YcyNmcBIiVpkF1g7GWE+pVk4Rn9NfRoDQvNY=;
	b=riMve4Yd9+l68XMM7Lgb0dAWfx4oqzobXRCADg6697mtrsGkJiEHI3bXYKv8GUKgDw
	UBhk82eaZBst0FcfwtUwtgeR3l7T++/p9ZBCuhhF8S+v4oiR85Ede6dL290Ergi+IJGV
	IIIAV0tDTu80wXHGaMVistfeUEfJqyOzdawalSvxwoyRUPl5EhZjNcbSXqG+Cu3B0lsQ
	vavx15RAzSBjVlUJl3Wh2BdrCt//czA0evy3Zi7Lf3ce4yWowhVrGba/rKGdaB89Tta7
	0UGdmoa2HdoxCZ5rACueYKf8a5FaV/HbAFVy8bVr/SeSqLuEnPFYmsRitCmfVQ5rPQoL
	Rsfw==
X-Received: by 10.15.109.135 with SMTP id cf7mr1187192eeb.0.1375357021782;
	Thu, 01 Aug 2013 04:37:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm3660856eeh.11.2013.08.01.04.37.00 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 04:37:01 -0700 (PDT)
Date: Thu, 1 Aug 2013 13:37:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20130801113736.GO3280@jama>
References: <51ECCF5C.2020505@dresearch-fe.de> <6366141.Q5aULPr4OG@helios>
	<51F8E0C2.3070102@dresearch-fe.de> <8337615.XrjW46moIm@helios>
	<51F9FC24.3070907@dresearch-fe.de> <20130801103622.GM3280@jama>
	<51FA3E05.2070205@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <51FA3E05.2070205@dresearch-fe.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] SRC_URI and latest HEAD revision with git (in oe-classic)
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
X-List-Received-Date: Thu, 01 Aug 2013 11:37:02 -0000
X-Groupsio-MsgNum: 42807
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Thv7PGoFpDPJ7Oar"
Content-Disposition: inline

--Thv7PGoFpDPJ7Oar
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 01, 2013 at 12:52:53PM +0200, Steffen Sledz wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 01.08.2013 12:36, Martin Jansa wrote:
> > On Thu, Aug 01, 2013 at 08:11:48AM +0200, Steffen Sledz wrote:
> >> On 31.07.2013 14:50, Paul Eggleton wrote:
> >>> On Wednesday 31 July 2013 12:02:42 Steffen Sledz wrote:
> >> ... I read something about a solution using
> >>=20
> >> BB_GIT_CLONE_FOR_SRCREV =3D "1" BB_LOCALCOUNT_OVERRIDE =3D ""
> >>=20
> >> which should be supported by the old oe-classic/bitbake-1.12.0. Could =
this be a solution for our problem? What drawbacks does it have?
> >=20
> > BB_GIT_CLONE_FOR_SRCREV will need to clone every git repository include=
d in metadata you're using (even if the recipe isn't built, because it need=
s to define AUTOREV for parsing and that needs local clone).
>=20
> Every git repo? Or every git repo used with AUTOREV only?

Every git repo with SRCPV.

> > empty BB_LOCALCOUNT_OVERRIDE should work correctly, but you need to syn=
chronize bb_persist_data.sqlite3 between multiple builders (if you have mul=
tiple builders populating the same binary feed).
>=20
> That should be OK for us.
>=20
> - --=20
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2.0.19 (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/
>=20
> iEYEARECAAYFAlH6PgUACgkQlSfCk8EgCzhRlgCgm/sRrRd945HXKRdsj8aL/+qa
> bagAnidiDoZO6PtViGA9zJfSRa+n4IcK
> =3DrQan
> -----END PGP SIGNATURE-----

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Thv7PGoFpDPJ7Oar
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlH6SIAACgkQN1Ujt2V2gByDGgCfVnrGp00OAuddcbOSwh8Ww5wg
FfMAn2+YIgAWqxXOKpoI/X0iqYbyiAlk
=pMIr
-----END PGP SIGNATURE-----

--Thv7PGoFpDPJ7Oar--
