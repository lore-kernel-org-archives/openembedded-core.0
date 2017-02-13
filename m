Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6D18771CAA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:32:45 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k90so24579502wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 07:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=nff9XyyaVdhkOawb1oj0ae1aueb7WrINhTrJYW3sGnc=;
	b=JwB3w8xL7gp0c1fEIDwtmWQHt9bkKpx+lvBySHk2wEe1+lI8TNPYxuWz8vBYk+F2XX
	9DCp8qDm1lBfO4pAClQHOyn70DifCUiQ/RLH/S3W5RJyJlOFFOIb+LoFCOcoiHMKL3FO
	VQmqyT/5J/puHB4S5PsyoP0lK/GBeR8oLPw4phpx0MxEnvdCF+mzGeAgc2Xb6eehnEBN
	AExNuPesXVCpAtGKNis5oor9FnKHMLlPgPWDtMlefMLfAgxBiObLYk9/ehAEUNwsAK8c
	0FUII+7k00GW9irVDXK7fuypfADjrDOjtzAzr5Q9imT1cMqwEUWvlb9ukhFUrSo5VsPN
	YO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nff9XyyaVdhkOawb1oj0ae1aueb7WrINhTrJYW3sGnc=;
	b=Cthp1w8m4zVtXWkAG585eFR5N8Xc1vIs97jCcq0TLF+3cCD0+ss3wJeyQC9TQvnEus
	KkTr5VCU2Xd/UN5JaS6eVpRZu6HFRelP2PHvs0FiMav8nsg/vHy7XCU/Bj32Rfygy/Ew
	YrRNR/Pp1941HsjwtAqBeEu7HuRzCQP9lp2DPufYfOGTA3+wvog3gDRH4iQKBGTzsJHo
	xz5O14r3hxs6dfcx7aYpuDkG+LsYmtSxXXKwQ840U+pESdRswI+hpYYIMrlpvn/GvG/4
	Xc4NTu0I82fvR9oK/DomFtBtTwjQRTbuQZRev5CILlSRA8LQOehzl+zjvzZo8/Iq32Mb
	qKvg==
X-Gm-Message-State: AMke39m070rmllOLXEk7JiksK8zCl3JPchXmq6ytnrbvY9yGZaPwa1lWuhcf0Sb0ltQsZw==
X-Received: by 10.223.163.30 with SMTP id c30mr20344884wrb.40.1486999966066;
	Mon, 13 Feb 2017 07:32:46 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	65sm11183153wri.53.2017.02.13.07.32.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Feb 2017 07:32:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 13 Feb 2017 16:32:45 +0100
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170213153245.GC3280@jama>
References: <CALbNGRSgxbz1F2YLzQ-F2Fn+01hiA4LAoDgQuQ-qLg9KMVTHAw@mail.gmail.com>
	<CALbNGRR1+yVyMC1O1G1mCYp8e87Q2kucGEgs-dL0P3KHxi8WCQ@mail.gmail.com>
	<CA+chaQcHBzDJ4UbW1NCex70T56PL02+agOZBMoK4=Q1WWSm2EA@mail.gmail.com>
	<1486999455.13854.241.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1486999455.13854.241.camel@intel.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does recipe specific sysrooot (or whatelse in current oe) break native dependencies?
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
X-List-Received-Date: Mon, 13 Feb 2017 15:32:46 -0000
X-Groupsio-MsgNum: 93274
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline

--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2017 at 04:24:15PM +0100, Patrick Ohly wrote:
> On Mon, 2017-02-13 at 15:36 +0100, Martin Jansa wrote:
> > Hi Andreas,
> >=20
> >=20
> > I think it's feature which was already there, but almost never
> > triggered (even in test-dependencies.sh tests), but with RSS it fails
> > reliably.
> >=20
> >=20
> > See:
> > http://lists.openembedded.org/pipermail/openembedded-core/2016-July/124=
435.html
>=20
> That's not quite the same, if I understand it correctly. In that email,
> Richard was talking about "dependencies of that target are not needed
> and not installed" and used "quilt-native" and "compiler/toolchain" as
> example. In other words, if recipe foo DEPENDS on bar for getting foo
> compiled, that dependency on bar gets ignored when installing "foo" into
> the recipe specific sysroot because it shouldn't be needed anymore.

I'm not sure if it's the same or not, but back then I got very rarely
missing dependency on wayland-native or qtwayland-native, now with RSS I
got 20-30 recipes failing because of missing dependency on
wayland-native, qtwayland-native or qtbase-native to stage the scanner,
moc and other native tools in recipe-sysroot-native.

And Andreas issues look similar to that.

> But the example here is a recipe foo which has a runtime dependency on
> bar, so bar must be installed in addition to foo, otherwise foo will not
> work.
>=20
> This is where it gets tricky: do native recipes have RDEPENDS? They are
> not getting packaged, so I suppose not. One could collect all RDEPENDS_*
> values (regardless of the actual package), but that might be too broad
> (for example, when "packaging" the native recipe wouldn't even produce
> that package).

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWKHRnQAKCRA3VSO3ZXaA
HKBqAJsFLy3Ilot5d4AE1j2NMKlftAXnWwCgrmHjmANhzaYYDm8Lx6PEdHJU0HU=
=PWax
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
