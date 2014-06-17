Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id E091A6FDA6;
	Tue, 17 Jun 2014 17:42:31 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id x48so6937342wes.9
	for <multiple recipients>; Tue, 17 Jun 2014 10:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aViEQTzNs4T3dS1L+LNemL3V0mRs0+VdYjmDJHu6WVQ=;
	b=zEM/vFmZ6+F9sQiDvd3WOLrQ/41CFCL6RmR42HAKWZXTdXfIRfRjK68j9ufpaJ5Ekh
	q3YvoPvQ4WyfWU93RboYh6F6yijguTMhkwiMJX+bbwz6dboU86Q26WmHwlHaqfBBcRL+
	89AU00vts6Y+U1WRyF91AHwbTpoyVNvVJk8cRxUJpOgKvnLiqvdAnt4CBWhDFPFLFw//
	f5thpdM1gEn8d8+uT2snIp1cO7zl+lFTpLmHICdt78FMXZC2MduXp1FZ//9iNck4lCSu
	+eczAnUsJaM3apu3JGhmXsmiLbJp+o2nOnpdp++2BGhgGNEl6yd8sWPKYt/qlHOKn5ic
	7iWw==
X-Received: by 10.194.61.193 with SMTP id s1mr40818170wjr.36.1403026951930;
	Tue, 17 Jun 2014 10:42:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	d43sm42450030eep.0.2014.06.17.10.42.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jun 2014 10:42:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 17 Jun 2014 19:42:28 +0200
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20140617174228.GB2117@jama>
References: <1402775049-3165-1-git-send-email-sledz@dresearch-fe.de>
	<539E8F97.3070508@dresearch-fe.de>
	<6076930.voh3DpIb8j@peggleto-mobl5.ger.corp.intel.com>
	<539EBCA8.3000709@dresearch-fe.de> <20140616105942.GO2428@jama>
	<539EDD0F.8020505@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <539EDD0F.8020505@dresearch-fe.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][daisy][PATCH] live555: fix fetch problem
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
X-List-Received-Date: Tue, 17 Jun 2014 17:42:39 -0000
X-Groupsio-MsgNum: 54218
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Content-Disposition: inline

--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2014 at 02:03:27PM +0200, Steffen Sledz wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 16.06.2014 12:59, Martin Jansa wrote:
> > On Mon, Jun 16, 2014 at 11:45:12AM +0200, Steffen Sledz wrote:
> >> On 16.06.2014 10:48, Paul Eggleton wrote:
> >>> On Monday 16 June 2014 08:32:55 Steffen Sledz wrote:
> >>>> What is the right ML address for patches in this area?
> >>>>=20
> >>>> The meta-multimedia/README in git://git.openembedded.org/meta-openem=
bedded (daisy branch) says:
> >>>>=20
> >>>> "Send pull requests to openembedded-devel@lists.openembedded.org"
> >>>>=20
> >>>> But i believe this should be openembedded-core@lists.openembedded.or=
g.
> >>>=20
> >>> No, for all layers in the meta-openembedded repository it should be o=
penembedded-devel as listed.
> >>=20
> >> OK, thx for this info.
> >>=20
> >> So i hope the patch will make it into the daisy branch in the next tim=
e, because our build is broken meanwhile (OK, we have a workaround, but thi=
s is unendearing).
> >=20
> > We still don't have meta-oe daisy maintainer :/ (and update to READMEs =
in daisy branch)..
>=20
> How should i interpret this answer?
>=20
> There is nobody who can push my patch (about the live555 fetch problem, n=
othing about READMEs) to the daisy branch?

That there can be longer delay, before we find daisy maintainer which
will ACK your patch (and include it in consolidated pull request) to get
it merged. (README update just should be first change in daisy branch
which isn't included in master)

> - --=20
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2.0.22 (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/
>=20
> iEYEARECAAYFAlOe3Q8ACgkQlSfCk8EgCzhdlQCgjMhmzGAk6sacNllCwiP/+Gd2
> jxIAoONeZ+a1EwuBT8Dfg0cbmfXM0Lte
> =3DTnT1
> -----END PGP SIGNATURE-----

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOgfgQACgkQN1Ujt2V2gBwqvgCghs/aDf1Z2YLx3kSS/4DCFmSc
Iz4An2zSOKi8qARi3Hxv7So+tpsTKqn6
=LfCf
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
