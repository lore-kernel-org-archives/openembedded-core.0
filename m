Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3377718B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 16:12:30 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id n10-v6so16229120wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 09:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0+gfgXS+hopKKM0J5KLDzYjl8ji430rfngTHwrskeQ4=;
	b=Mzm9bqOFSNuIxTtWBYEfSr59RYEXuJkai/EDHJ+gx/OjPcLi0jNcwiFS8HMKdt5q3y
	Au13bq5Z2ztv9kk3Z/wnTjB5A3aBmlUEPyb3ZTWxRBYR0Pi07ty/sskQiUCJWyfshyUq
	UlhAjqeNqRPo9mSutuhPompMKEnYvQ7LqE97cLytGzVoS7ZSp9mRB3epdl7//VafWSwA
	x5g/VTj5O2PEi/3J4hkWVhIbhfUDDxEo3QgW+UzIZE25mADFxv89AJljSEqjcWHdIywZ
	zF5LggEOXXUv96wVQV8Uk8ShNhzYcCF8/oA7c9R0tqiUDaS2yxbyElDsfzF7Jg09+nS7
	kQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0+gfgXS+hopKKM0J5KLDzYjl8ji430rfngTHwrskeQ4=;
	b=T9KCm0MirFQ6H3RrzmmufyJx8PwQrE/KQgRP0zg0X/QuQq+gmCrVMSYEHKS6x7YE9N
	RHzjapp0WhvvrRWPPXKWgx7fWN3MaVAMgeaWCuiWg9MPm+fg/xx4dAk1eFkfQuWxZdt0
	2SHniEP1jEvwqSe0dWSQjijHjx51/H9nZDgpKymN2yZkX+RIVdcd/FKkfiCNrJHN38H1
	45W8hZQypaRRvlfMgUufBVxSXyb+jHaDn42gpCblD+BMH14VLbr/ozQ9SsrFscz8kBfc
	idRLFdH7Zpe2EoQ/rtot3pNSDPQpwwItUrJk5Qs7yuZANnEj5Yw8ZPDHZwX3SDHV32tl
	ylCw==
X-Gm-Message-State: ALKqPwdfR09WrWRnDMHMkNCC+U97T74bs52mkjHt8USuRNoyT0wDSQUn
	9P2NrSeN+Zj+yaII7NGZQMI=
X-Google-Smtp-Source: AB8JxZpQI06i+VM+DbWaIB9UO+hK+tMo9sqaZWd0d/uTGrOUbMg6F2t9YXEa0qpM4ZZgmTWAdIF+uA==
X-Received: by 2002:a1c:dca:: with SMTP id 193-v6mr5491300wmn.36.1526314350864;
	Mon, 14 May 2018 09:12:30 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	67-v6sm9944815wmw.32.2018.05.14.09.12.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 14 May 2018 09:12:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 14 May 2018 18:12:30 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180514161230.GB2840@jama>
References: <CAJTo0LaJNCzWjNEsJw42_io2mC3iyDMoZ33SVj8huJLQQ7urhQ@mail.gmail.com>
	<20180511192103.7581-1-Martin.Jansa@gmail.com>
	<20180511192103.7581-4-Martin.Jansa@gmail.com>
	<CAJTo0LYxyM-sMx6_UdOoeQykuKXTZyXyuhUfUR2KWzf86MEOGA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYxyM-sMx6_UdOoeQykuKXTZyXyuhUfUR2KWzf86MEOGA@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 4/5] qemu: add PACKAGECONFIG for virglrenderer, sdl2, usb-redir and spice
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
X-List-Received-Date: Mon, 14 May 2018 16:12:30 -0000
X-Groupsio-MsgNum: 111357
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline

--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 13, 2018 at 09:05:16PM +0100, Burton, Ross wrote:
> On 11 May 2018 at 20:21, Martin Jansa <martin.jansa@gmail.com> wrote:
> > * sdl2 when selected needs sdl as well and will depend on both libsdl
> >   and libsdl
>=20
> Is that a limitation of the qemu build, or just how the configure
> options work?  Doesn't seem great to need both!
>=20
> Ross

Agreed, it's not great.

It's kind of PACKAGECONFIG limitation, the sdl option is like tristate:
--enable-sdl + --with-sdlabi=3D1.2
--enable-sdl + --with-sdlabi=3D2.0
--disable-sdl

I've added sdl2 PACKAGECONFIG like this:
PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,libsdl"
PACKAGECONFIG[sdl2] =3D "--with-sdlabi=3D2.0,--with-sdlabi=3D1.2,libsdl2"

I can add 3rd PACKAGECONFIG (that user will need to use sdl+sdl1 or
sdl+sdl2) or anonymous python to remove libsdl when both both libsdl and
libsdl2 are in DEPENDS.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWvm1bQAKCRA3VSO3ZXaA
HPyoAJ9K5ZEeXmqpkztp0yNzbhuZAM1yFwCdGPjK0EMV7y+bAAazTqnTdqmfURo=
=vh5m
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
