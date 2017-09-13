Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id D6B3578645
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 14:10:40 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id g206so7903225wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 07:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=YplYkji33nFaEqkuCELKDOwar4bYfp5aEX3qY4mtit8=;
	b=W3pX7xl8mnHCPb4avY/M4ZL0iij0E3USZUPPWGEH+eHB+MfuzQTDdLfnGBXKTk8RkW
	eH5vOs01+r4MnMHngTnX62FAju3YNFvLJx9ZcGtPViWUljUR2pWRKeTKteRkZIvCaZqn
	ygM/yKcayU6lrSnoKIEyYg+vx4BlNXzFJzyS87i50k3lip1UsJ49EW/g5wj6iACNm3fx
	EsD7ZRX1lOsb4q1gKx/HflUgN56LgJ0lbXp4fWeu8o0T28VjSVDQhf1bedWLegEXpH7X
	jhrerCgcW5aGxIi8A0ZLQBIh/BRPrXFeO9EgXxWqrG4yD8wb6dn6tQSnSRXDtnF2reJb
	wwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=YplYkji33nFaEqkuCELKDOwar4bYfp5aEX3qY4mtit8=;
	b=sou00QjCjpQDTZF5Oswj8t9MJc/+WilzF+s5DFO4NkgrvwVgSKR7+cy/mkLESiw9sL
	YT7xIMB/1R+Jeb3BtpVmQ6bfhpCfWFVpnGLFP6V++EBX7m6M+Vth/zbeUc2p9cUZgaif
	ojY8eUTl3kIQlgnpO15Hstsv6Lwfm2sjSHlZAdRA/++YWmp9NRI8fs/VI+FhQZErQwke
	uWFz1+/1SNfmrPl3XTOr7IFWcOGFVvE620+kZcqxp71hbrNRjVfZvRoAUOsVcBSr4sVq
	ZULCXdRRSbZqrtwTwt+dn5BQNoJznRk3xJWYWeBibXEZi89CLlMZD92uNl+RrVjC9lPm
	gjBw==
X-Gm-Message-State: AHPjjUhPBbSgeS9Sa+GB0UskibPKW1NzViRcLsWlrAaqqDGwBDnWAuBA
	dAYvjHmkbFWTlQ==
X-Google-Smtp-Source: AOwi7QB3k28RIxq5M9wOnU+JLr76M+9f2f3CxGKx0FXHamKfD2zSkMxt16RzTynQkmvb/54czkOIDA==
X-Received: by 10.28.132.73 with SMTP id g70mr2498767wmd.33.1505311841280;
	Wed, 13 Sep 2017 07:10:41 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id r72sm1621231wmb.9.2017.09.13.07.10.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Sep 2017 07:10:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Sep 2017 16:12:59 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170913141259.GB3288@jama>
References: <1504215229-79715-1-git-send-email-juro.bystricky@intel.com>
	<CA+chaQfbZAM+mjNvZ-HYe=XZnNJz+H7Wq9z1vcEsMgDY=CUksg@mail.gmail.com>
	<CAJTo0LYArQkU-OtvmiSwsfa7DaxkiMNPYYTvr_kChi9RvpgC=w@mail.gmail.com>
	<CA+chaQdAuijLCAM8UzwMh1DO-7gc5tD3Ek3DYc-9rUNBY=85cg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQdAuijLCAM8UzwMh1DO-7gc5tD3Ek3DYc-9rUNBY=85cg@mail.gmail.com>
User-Agent: Mutt/1.9.0 (2017-09-02)
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: upgrade to version 2.10.0
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
X-List-Received-Date: Wed, 13 Sep 2017 14:10:41 -0000
X-Groupsio-MsgNum: 102828
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline

--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2017 at 01:44:56PM +0200, Martin Jansa wrote:
> I don't know how accelerated GL will be in the end, but this commit:
> https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D474114b7305cc1be7c2=
ee8ba5267be159a9d56e3
> made it possible.
>=20
> I've built qemu with my Gentoo host with virgl and spice support, and I
> plan to try how fast it goes.

I've some WIP changes to build qemu-native with virglrenderer enabled in:
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/qemu

and few more to enable spice as well in:
http://git.openembedded.org/meta-openembedded-contrib/log/?h=3Djansa/spice

> On Fri, Sep 1, 2017 at 12:09 PM, Burton, Ross <ross.burton@intel.com> wro=
te:
>=20
> > On 1 September 2017 at 11:03, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> >
> >> Is there any ticket requesting virgl support enabled in qemu-native? It
> >> might depend on providing virglrenderer-native, libsdl2-native,
> >> epoxy-native and maybe even mesa-native.
> >>
> >
> > It's been something that I've been meaning to look at for a long time, =
but
> > between my build machine being headless and other stuff being more
> > important I've not got around to it.  I've not dug into the details: if=
 you
> > run headless qemu and a spice client, presumably you don't get any real=
 GL
> > acceleration?
> >
> > Patches welcome, as always.  All the extra build dependencies means I
> > expect it will be off by default, but having the option would be great.
> >
> > Ross
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWbk86gAKCRA3VSO3ZXaA
HC84AJ0Y8AMSX2nzWDXWiJenyXgFOJ2j8QCbBO0uPMgOnr/OY3e2nmo+t79g/9M=
=FG0Z
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
