Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id EBE597CB12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 18:48:03 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id f3so6716648wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 11:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Vzfk8Q8qvOPLW+0qxl58HGooD9q60eNYg/8reNd03kE=;
	b=cqf2AMx68mori194cgWYWmF2nARixSVVf/8Xf51MIAK7i6hzrYAXw4dudbz38ztN/A
	m0hCayd383YmoY8c8ny94sthASUWKkmclbLaZaOqMoDfKrL+HrN3tA3p143F0owMEo2e
	oLwPCxEHq/0aQDhPLqnDW4aEAYZIEDdofvypKKtbh4YGD2yZyMDL2bHUo3RQ6U0A0Xwi
	uLuKupEgNxboXY3ESFtrgpDYIa5O0N0qwSF23BdRcg4LeK0ThIfTBclySZTFCIcPR7uE
	wlJXhK8DdHbXvg/4gN3Zro/WnX5111XtWxfmevq2hjyO63pqb2heRe1SReZfxCPSNWlw
	Styw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Vzfk8Q8qvOPLW+0qxl58HGooD9q60eNYg/8reNd03kE=;
	b=ie1lxnt71266NdPBhjnH+TxMGgMGd37w7UGPEOPvuG/5GpFfIPcglaGtxNSZE+qmtB
	B/jXB9ACF8bLu8d8j9SqAPKa4OdpdsIh1HMy4uT424oJAzMSglosh39wjk/INg5s/0Tr
	xeS4klqtqQAJw5Amwuo58IHn2KXcVnmrNa4I0SpNmXN/Vig/tNPUfL571A0fkINTOm7q
	eBWN+IiWNkQMMPm/ms4N38Du+syj/Yq9K37xjHuUHma305K9c6s7j8y1zYW09gN4iLw+
	D9ylu/yxIqmupPCG24/4iNRmhqTYqO8cY7qvvPvvHs38D0BoVqjPyGk6GvzQwuasu1qG
	umIw==
X-Gm-Message-State: APjAAAXj3qWtw4mQB4rpdWXsYlX8JRUdqgqzPK2LXDrwdXk3CNOu1U3u
	moF35hbufOAFOp4gdxJt2Q8=
X-Google-Smtp-Source: APXvYqyI7FLDKshlYacAlSlrqqc5027STiywauUrxsVQW3U2kjALyGhAd2qdKr8BwNzU+jANW0wg3w==
X-Received: by 2002:a7b:cd95:: with SMTP id y21mr8604975wmj.29.1553453284654; 
	Sun, 24 Mar 2019 11:48:04 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	l8sm12572644wrv.45.2019.03.24.11.48.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 24 Mar 2019 11:48:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 24 Mar 2019 19:48:03 +0100
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190324184803.GB1947@jama>
References: <1552927535-19740-1-git-send-email-akuster808@gmail.com>
	<CALbNGRT1_qD8LYEP7X7JexnEOW7AsC84ceatZ3BLgECoo7vixQ@mail.gmail.com>
	<20190319075206.GK20077@hiutale> <20190324180113.GA1947@jama>
	<f307d6b7-80db-14a1-8703-785ce476d43a@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f307d6b7-80db-14a1-8703-785ce476d43a@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH] Revert "boost: update to 1.69.0"
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
X-List-Received-Date: Sun, 24 Mar 2019 18:48:04 -0000
X-Groupsio-MsgNum: 122556
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline

--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 24, 2019 at 11:45:08AM -0700, akuster808 wrote:
>=20
>=20
> On 3/24/19 11:01 AM, Martin Jansa wrote:
> > On Tue, Mar 19, 2019 at 07:52:06AM +0000, Mikko.Rapeli@bmw.de wrote:
> >> On Mon, Mar 18, 2019 at 06:03:05PM +0100, Andreas M=FCller wrote:
> >>> On Mon, Mar 18, 2019 at 5:45 PM Armin Kuster <akuster808@gmail.com> w=
rote:
> >>>> This reverts commit a384248938ea9db096866bf4ec8678d35ca62a12.
> >>>>
> >>>> This package update slipped in doing the maint process. Removing it.
> >> <snip>
> >>> Just my opinion - don't consider this as NAK.
> >>>
> >>> * I already fixed the recipes that failed for me. For at least one the
> >>> change is no more compatible to 1.68.0.
> >>> * This makes PV going backwards
> >>>
> >>> Thanks for addressing - what do others think?
> >> I'm not using thud yet, but updating boost in stable branch would break
> >> too many things and I would have to revert that change in our trees. S=
ome boost
> >> updates are in the end quite trivial and just require recompiling
> >> everything but still, I would prefer that boost is not updated in stab=
le
> >> branches unless there is a huge security/stability issue with the old =
version.
> > Agreed.
> >
> > I care less for PV going backwards nowadays, it's probably less annoyin=
g than
> > bumping PE first in master and then backporting PE bump to thud.
> >
> > People with build issues related to boost upgrade probably never
> > built whole image to push it as an upgrade to end devices.
>=20
> So do you agree with the revert?

I do.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXJfQ4QAKCRA3VSO3ZXaA
HFF5AKCmHG2NK4oBSOjeMjyCnUC6n7U2xwCfXk/iHxlhoD3vQkyIrIQOYLwnFTo=
=GaXz
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
