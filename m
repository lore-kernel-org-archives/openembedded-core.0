Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E73F17D3CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 20:09:06 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t7so3380294wrr.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 13:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=cY4S0ENcCM1HwOQxJr4uXftl6XTNHAj5xxeYeJVmLKs=;
	b=eRuYYzmQEdq+U+FVB6HlOyEO+H2IN5FBczvs62DPWDjylw49bnHh4uNBeOQ1Aewq4S
	iStQ9DeeFVd4R+ydxtdMBeQwCZz3bVYu+QUKxxh3LjKBCe/bkudv7TT2qd75v0UU+zYh
	v1h69IHxZi3mNEl25jv3prLXTUbrLdwuJnKSttg97133oHi394BHDyHiRdkntqk66lHK
	Qs16vn6AaRcIVuBh5Q0KhKKDeHh1ydZhtQUgp5W8TO8l3yq4bZvB16hO0Hh2dMp70Hf/
	lMeRKwjKQ2Ddx9KFPTWFtmwxTJDqYJ4bFMPW7u6uvdaNAnThhIQQ6ezOz/sRhm5VoFB4
	sBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cY4S0ENcCM1HwOQxJr4uXftl6XTNHAj5xxeYeJVmLKs=;
	b=BLM/H2VaYEXaAXjjN88CXNzbSdnZoUkjw+j+BQfVpBY98D1yetlXhHL4NPMxMp15NZ
	N3H5RT8lIsedBVPvRIYk7lVtYyWL9NRQsiG9oZrESZtDnZ+5RK1WCsmXHjpajpJpw+D5
	OQ5KpejWEcQJe6xsqtKOGsmZX0eJgviNft0UQBmTa58OKAxU1BgYxMBJk5ixg1jF7L/f
	cODFFMC4YHgQFybclxezqKRyFo6VjLIz61rx+Ukul9VhI4zrAjvdbKFCTsajNrEZtb97
	k0Y13+xrR0biWFNcz0QSYdSZahzcyze9zkUyvfQgQxzpnmbBYottZYwBhFXWTIMs897q
	huVA==
X-Gm-Message-State: APjAAAVsVctTTaf291oIcMMfubymBN3dQFHXNka5vPE3si1hxTqUi2eB
	GoXp0Raa2qlKFCvH7HQqm2I=
X-Google-Smtp-Source: APXvYqw7HUmLrH/NPfnaiHPI9/3WB55NkqbHyaB8dYreE5YOyTr6NGYzeGT6VaL7o4uIFS4BbM5lyw==
X-Received: by 2002:adf:ec8e:: with SMTP id z14mr27787635wrn.198.1558555747400;
	Wed, 22 May 2019 13:09:07 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	b18sm23303794wrx.75.2019.05.22.13.09.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 13:09:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 May 2019 22:09:16 +0200
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190522200916.GA1421@jama>
References: <cover.1558300553.git.just.another.mariano@gmail.com>
	<c7d776cebebd9bf2c28d43aad3fd911101283572.1558300553.git.just.another.mariano@gmail.com>
	<CA+chaQdu3hKa6ogM=9_iG1GS67YdrwoF=J2YWdh6RX3V1r7qbA@mail.gmail.com>
	<20190522141825.GA7379@localhost>
MIME-Version: 1.0
In-Reply-To: <20190522141825.GA7379@localhost>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] util-linux: Add missing ptest dependencies
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
X-List-Received-Date: Wed, 22 May 2019 20:09:07 -0000
X-Groupsio-MsgNum: 124868
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 05:18:25PM +0300, Adrian Bunk wrote:
> On Wed, May 22, 2019 at 01:03:37PM +0200, Martin Jansa wrote:
> > This pulls bc to many images with busybox, causing busybox postinst to =
fail
> > with:
> >=20
> > update-alternatives: Error: not linking /usr/bin/bc to /bin/busybox.nos=
uid
> > since /usr/bin/bc exists and is not a link
>=20
> Are you enabling CONFIG_BC in your busybox config?
> It is not enabled in meta/recipes-core/busybox/busybox/defconfig

It's not disabled in my defconfig like it is in
meta/recipes-core/busybox/busybox/defconfig, maybe it got auto enabled.

In log.do_configure I see:
=2E..
*
* Miscellaneous Utilities
*
adjtimex (4.7 kb) (ADJTIMEX) [N/y/?] n
bbconfig (9.7 kb) (BBCONFIG) [N/y/?] n
bc (45 kb) (BC) [Y/n/?] (NEW) dc (36 kb) (DC) [Y/n/?] y
  Use bc code base for dc (larger, more features) (FEATURE_DC_BIG) [Y] (NEW=
) y
    Interactive mode (+4kb) (FEATURE_BC_INTERACTIVE) [Y/n/?] (NEW)     Enab=
le bc/dc long options (FEATURE_BC_LONG_OPTIONS) [Y/n] (NEW) beep (2.4 kb) (=
BEEP) [N/y/?] n
chat (6.3 kb) (CHAT) [N/y/?] n
conspy (10 kb) (CONSPY) [N/y/?] n
=2E..

> > I'll check which busybox defconfig entry enables BC and send patch to u=
se
> > u-a for bc in ./meta/recipes-extended/bc/bc_1.07.1.bb
> >=20
> > There already is:
> > ALTERNATIVE_${PN} =3D "dc"
> > ALTERNATIVE_PRIORITY =3D "100"
> > but maybe dc is a typo.
>=20
> bc and dc are two different binaries built from bc.
>=20
> busybox used to only have dc, bc was added 6 months ago.

Thanks I've never noticed dc before.

I see both dc and bc in 1.06 version from meta-gplv2 which was released
on 2000-11-15

bc/1.06-r3/image/usr/bin/bc

As there is already u-a for dc, I will sent u-a for bc as well.
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXOWsawAKCRA3VSO3ZXaA
HNFFAJ0U7VyxeBZOgSUUMsaPg/8f2bN1FwCgi24tUh1vFtAwGEWjPwbJgD4HPY0=
=bGew
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
