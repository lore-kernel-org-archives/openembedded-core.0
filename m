Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D0AC07CDBA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 10:39:57 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p1so20415310wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 03:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6JOgWBUcqAzG8oBBctH03tdogygF0kXUPDDbqluDyKY=;
	b=BntjKBzI6AerxZw8q/VLJmpQEdXkw1MtIesLAfNqMoSQiDJaMS7UwW0kYSIJ+v+PpB
	ECgZDlMRzRN0ryLh1KV4DhxAaIBn+vhp4wxeCIXR0qxZ1//Di/HARgDbtL0Bet24WwKf
	ZiSfWMT94vbBpBtFq3Nu0xP4IXlIVxOxYqdjRVpFIKb1qpFoxougxt4rw5r7Gg14zvQ3
	7lJMYrbp3BZKozQ9F/aIXiQthGO5xqdoU1geKNnqKkw+pf3ABfkc8Y4rmKtXhv3v9WSp
	D2EW4eFo50Fc+JHP4IYkQUTPo4KwLY38xbM/20hmrVOzDPbgggNUm1m7ULB0F2yGqrKC
	0qeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6JOgWBUcqAzG8oBBctH03tdogygF0kXUPDDbqluDyKY=;
	b=d9iqELG8tHQ52/j5yk0k/h0j5X9IoQ0uOXsDSd1OeLMo76qMOLTDjKjKiSSr5BzF90
	DQw44HQSnUIJm5Oa1GzgtG45558u75rViU9GNflp9NxbRFWTMvDtHulpZXdP4/TQc6dD
	+6v7VqfNhxBreWcZr9GmgZETiQAiRx4UwDbonhCPUuXwJrllBDuHAozeXlvnePMhZE06
	osVOiwi78TcuP4urpDnAmghi/ku7Pwq7C13WX0pnau4Vyehlwb22rd7/8uFviDHjqnJd
	/aXSYI0ExnTQQdSkA7co1UVyQ2lS2pTLa8vzlAqPwOX1QJzjZxQUBF3C9C2A2K7alQU1
	jucA==
X-Gm-Message-State: APjAAAVeTsAeevVvUUG+Vo26+pzz8FqelibgniLxzNs5aeeVU9wnltnr
	F0raGgYGcu/hIRLOubDUzd4=
X-Google-Smtp-Source: APXvYqyv/YBQYiv43njOhpsPmpUq9tFGcA9PW1uN3sKunZ/X2dGXHjICmsmyiM5tY+B6mLNE1jTvfQ==
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr16618222wrn.191.1552991998586;
	Tue, 19 Mar 2019 03:39:58 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	d11sm1344052wmb.19.2019.03.19.03.39.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Mar 2019 03:39:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Mar 2019 11:40:01 +0100
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190319104001.GG1994@jama>
References: <cover.1552962581.git.akuster808@gmail.com>
	<20190319085532.GF1994@jama>
	<D3413079-663B-47D2-8550-658159790D3B@gmail.com>
MIME-Version: 1.0
In-Reply-To: <D3413079-663B-47D2-8550-658159790D3B@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/26] thud patch review
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
X-List-Received-Date: Tue, 19 Mar 2019 10:39:58 -0000
X-Groupsio-MsgNum: 122400
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iJXiJc/TAIT2rh2r"
Content-Disposition: inline

--iJXiJc/TAIT2rh2r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2019 at 11:22:11AM +0100, Alexander Kanavin wrote:
> The commit you refer to changes the dependency from 1.1.0 to 1.1.1, so ca=
-certificates currently in thud already needs 1.1.
>=20
> Alex
>=20
> > On 19 Mar 2019, at 9.55, Martin Jansa <martin.jansa@gmail.com> wrote:
> >=20
> >> On Mon, Mar 18, 2019 at 07:36:29PM -0700, Armin Kuster wrote:
> >> Responses should be made by Wed March 20th 22:00:00 UTC 2019
> >>=20
> >> The following changes since commit f5a57e939e626a5b7c6de5b51799ca602ed=
355ed:
> >>=20
> >>  mesa: ship /etc/drirc in mesa-megadriver (2019-03-05 22:24:13 +0000)
> >>=20
> >> are available in the git repository at:
> >>=20
> >>  git://git.yoctoproject.org/poky-contrib stable/thud-next
> >>  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dstable/thu=
d-next
> >>=20
> >> Alexander Kanavin (1):
> >>  ca-certificates: upgrade 20180409 -> 20190110
> >=20
> > This depends on openssl >=3D 1.1.1 since:
> > https://salsa.debian.org/debian/ca-certificates/commit/d5e425c8405448e5=
034d1e16ca52be6a10cb3334
> > some people might not use new openssl with thud.
> >=20
> > More detail in:
> > http://lists.openembedded.org/pipermail/openembedded-core/2019-March/28=
0234.html

hmm right
https://salsa.debian.org/debian/ca-certificates/commit/1bc87e0b41a04551a93d=
4e784e158b044c18792a
was already included in 20180409, another thing to work around when
upgrading to thud.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iJXiJc/TAIT2rh2r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXJDHAQAKCRA3VSO3ZXaA
HPf0AJ9jeBphA08qNqz2p4N3ue3IXu+FpQCgsFbNybNl58/Tvq/cT8l8F0JaYcQ=
=ORRH
-----END PGP SIGNATURE-----

--iJXiJc/TAIT2rh2r--
