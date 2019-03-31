Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id DEE2C7CFCE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 22:31:51 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id v21so6521398edq.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 15:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9EkrtflA2Yx9hVdCNJVg2xqGD1VY0+VT0UxsKLLMOb8=;
	b=LZTt2WcC7z+ifYXjC52Chyz8TLOKpVOGDFQOn5zjGgLALK31SAo2A0Ct+T+t7WXHRe
	/hGP8SCrdEkoaLwaqvkxhGCeqBoU/dD20sD3CB9WYsgAOfpZTX4PvGqBiJSVSny7rRaP
	j7cwXWem1/mOYxoDOWp/vWnYkO32kZkAHmtzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9EkrtflA2Yx9hVdCNJVg2xqGD1VY0+VT0UxsKLLMOb8=;
	b=Hhu6JY4UqOb3enLVCkaGppnZUV1I86qmt80MsmL+De4eqkdjMMA5idZk/Jo+nxrjBM
	ij126v/VaPAIv8fxgZb3/vSi+CeUYCHjxoA8wpF7pYn+U5SplTDvSjWwgnxRv0nAgAjV
	ngf22RDxXrEEKAgrnv43ZjcCeNVqE6Q1CsmGg5kF1vqJ8/xoFXRA0cfugkFtc0DqIh8Q
	bNWq+AAcbZGEXd3LWqYZShbU+s3AOcJF9Y0ygGfSXMYEDYDMUYVohhLFLVFeMFNd/Z6H
	2AGq2Hm6nt16Bi1LPuE0aPuroyrk724ztAIjZWQXhsUK5a0+eohOHULgC5d3Mo9WFaa4
	nYRg==
X-Gm-Message-State: APjAAAW+YXH0TuVbrL85FjAWN1KjRoT6A0Ov0+Gxjp9bhCv6l00Cr7ks
	8H+UoDRH4aR5MZn/nnV4BfzTUQ==
X-Google-Smtp-Source: APXvYqx1SxV6DnFb73a8J4QlNHnFfaKXdErUH7WwQfv4/o7ZvtJBp6OascWobE6S7+lP+Yq3b/3kjA==
X-Received: by 2002:a50:eac8:: with SMTP id u8mr21728271edp.125.1554071512653; 
	Sun, 31 Mar 2019 15:31:52 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105]) by smtp.gmail.com with ESMTPSA id
	p16sm1565243ejb.13.2019.03.31.15.31.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 15:31:50 -0700 (PDT)
Date: Sun, 31 Mar 2019 18:31:47 -0400
From: Tom Rini <trini@konsulko.com>
To: Paul Barker <paul@betafive.co.uk>
Message-ID: <20190331223147.GC4664@bill-the-cat>
References: <20190331155012.3085-1-open.source@oleksandr-kravchuk.com>
	<20190331201141.GH18421@bill-the-cat>
	<CANNYZj9QeaLU8AC03CmtczcVJ_jbuaL7gQEQ6HQVnDB82z+taw@mail.gmail.com>
	<20190331205613.GA4664@bill-the-cat>
	<05e3208a-24a2-4a6d-ba33-a23f00ffe41f@www.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <05e3208a-24a2-4a6d-ba33-a23f00ffe41f@www.fastmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] vim: update to 8.1.1097
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
X-List-Received-Date: Sun, 31 Mar 2019 22:31:52 -0000
X-Groupsio-MsgNum: 122806
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2/5bycvrmDh4d1IB"
Content-Disposition: inline

--2/5bycvrmDh4d1IB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 31, 2019 at 06:28:31PM -0400, Paul Barker wrote:
> On Sun, 31 Mar 2019, at 21:56, Tom Rini wrote:
> > On Sun, Mar 31, 2019 at 10:19:51PM +0200, Alexander Kanavin wrote:
> > > On Sun, 31 Mar 2019 at 22:12, Tom Rini <trini@konsulko.com> wrote:
> > > > Looks better, thanks. Is there a particular fix / change you're doi=
ng
> > > > this for? I ask since every commit is a version bump we might want =
to
> > > > set a guideline of once a month or so for bumping vim to the latest.
> > >=20
> > > It's a bit insane upstream is doing that.
> > > Should we set PV to something like PV =3D "8.1+git${SRCPV}"? That way
> > > devtool/AUH/RRS will not be reporting a new version for each commit,
> > > and will only do that when 8.2 is out.
> >=20
> > No, we should follow what upstream does for version numbers, it's what
> > other distros do. And on the related topic of "is it a stable branch?",
> > it does seem like yes, it is. We should just remember to not update it
> > more often than say the first of the month, without a specific reason.
>=20
> When I've done vim updates in the past I aimed for once every 3
> months. I also looked at Debian/Fedora/etc to find a version that
> someone else has already tested in a distribution - with vim having so
> many "releases" you have the same issue you'd get from picking a
> random commit off the master branch from another project. Matching
> against a version used somewhere else gives us something to compare to
> when we hit a bug.

That's also a good idea, yes.  My only concern is finding something
moving forward otherwise quickly enough, but Fedora might do well for
that.

--=20
Tom

--2/5bycvrmDh4d1IB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcoT/TAAoJEIf59jXTHXZSq5AP/1phrxW8kK3ncpPhqJqznE4n
TaFHfNHMhmORuj5bWAJ8YGATVaIGK/OqCp3otl/AiHsEy2AM+wGExpjfi2YYz4Ht
zc/Y+wBqSLTOmaaXvfijNYRO8Z7tScadgqCECqNmRDRLKNw9eOAECrhSE+6NQzul
0lxW7vnjJKtqU4zOxcRGK+Xnl8wOEQzgJvGA5zJ5uVN914UH7qr4TxpOqAxvnYnO
Cf15IiH09CqHnDtBqq4Kh+nK2wHAKNJ2xP14cdWYArUvj3Rl2mGoHLuN6PPIQ1mh
nh4YUdc44jxOVtR9dj5DtFYDXyUfQt+yEa73gMOUwqajNRy1Jvw2PlNlPu3yWg7q
5OvqSDdRUXRELWCDVh03UMn1TKrLe9Axui2xT93cEq36iNOXktSXIYBKMw8thUUc
MY5YkpA7VYiOJDBy6MLV5DnX6CreQXHesNjLWlsx8OuK5E64aUlRVuZ3vBRZXnTJ
XiLTCNF00IApJ7DkDapfa3351hVXiFGaEtOKnA4YAkMtsNJU0DpnSIBVDYXuHuL+
3h1LvzdeWVjvIR0SKnYP2o/pBdQEAMezAWKm70v46BMv60EjjD0LYJIheqxrSTNs
dXClSeEh1pPnRGbBzFNRmHhMPrspnT7kmgac5PLocV9cUCIpCU8N/cWlOI3WbKYq
k9EwEumyiNRsO2cGRdEx
=jqTi
-----END PGP SIGNATURE-----

--2/5bycvrmDh4d1IB--
