Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A62E26AC37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 11:50:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id s187so3678155wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 04:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fU2i86yKt67fU7qw/CfnQRL75I5LkMCWcBe6kJiaYI0=;
	b=oC1l6wfjbevN8Km/e3ATp/t6lAhd+uVrzp3NTZOKL6no9Ss69mOhcg49gMC2r/abMP
	+K/1QmvYgNB0M1uLkMJq2M0VAFrROgsr2y4ohbyUafXED46468vkCj1ryTaytpPyHIk1
	ThrrJmuyfkI1EAuRBcbuLhn7ANg7n6HeOXqom6tqGKvkrP1vnylGqv4YPIZUI152pJp0
	yoSD8+F8CA/1UNV1foD7daF9j15zbX6HOcbKEwtR6XmaHZ+It1TI6qyjdM/jtTAnM0RC
	rJJoBteQ3EWf2RufqmX6NUn0lKHYeSyhFrVP6VYJXh+aCvExLbKhL7CNKpx9du1gJA+u
	60Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fU2i86yKt67fU7qw/CfnQRL75I5LkMCWcBe6kJiaYI0=;
	b=X0n4adjfZYONi/jGJnKEulZGwpfx+Ccc6vTN/eAwDjIGXUYeiSFWI2jQDqG8wUd6zF
	ZkHF9uS9Vaw7dfhz5a3Tq0uJ3mCpk2Ng3UOHhaOWtL4QeS4cyUv6rbnCyxV13C3G1ury
	Kl8657urClhjTGZGFaImFSVbe6TKvmZHYnfTnykQ1NUz097vwpIM2LWZpWN5yEgSUHrH
	+0eaXNWPW5oBzLTszjcqlnb9Ujjav56PdMuhEgeBSSNKmPuWOJVkGXC/G00KYGpBjw0l
	c1GLH+sGb7mrMlE652aGBzHoCWSOYnlEMO5Iv4h+/xr1hvNvgnDk6BCEqVOrO55kcBoF
	sSlA==
X-Gm-Message-State: AD7BkJKpJtpr06PVoM8d52QHlm0nRKuLGkigfpEhjAsO4nJ4bv16twDV24CQB4ZjJ12wow==
X-Received: by 10.28.65.137 with SMTP id o131mr16059702wma.54.1458906617862;
	Fri, 25 Mar 2016 04:50:17 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	et11sm11664088wjc.30.2016.03.25.04.50.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Mar 2016 04:50:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Mar 2016 12:55:03 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160325115503.GE2555@jama>
References: <1456610987-17836-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LaVL04OQaipNFn1hyCGruFZ7itmrxH00i=L+OkcsZexQw@mail.gmail.com>
	<20160325105025.GC2555@jama>
	<1458905339.3073.53.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1458905339.3073.53.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] base.bbclass: Introduce EXTRA_CONF_PACKAGECONFIG variable
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
X-List-Received-Date: Fri, 25 Mar 2016 11:50:23 -0000
X-Groupsio-MsgNum: 80154
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pql/uPZNXIm1JCle"
Content-Disposition: inline

--Pql/uPZNXIm1JCle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2016 at 11:28:59AM +0000, Richard Purdie wrote:
> On Fri, 2016-03-25 at 11:50 +0100, Martin Jansa wrote:
> > On Wed, Mar 02, 2016 at 12:40:31PM +0000, Burton, Ross wrote:
> > > On 27 February 2016 at 22:09, Martin Jansa <martin.jansa@gmail.com>
> > > wrote:
> > >=20
> > > > * add separate variable for configuration options generated from
> > > >   PACKAGECONFIG setting, this helps other bbclasses and recipes
> > > >   to take advantage of PACKAGECONFIG mechanism, without including
> > > >   other options from EXTRA_OECONF
> > > > * e.g. meta-qt5 recipes are abusing EXTRA_OECONF to get options
> > > >   from PACKAGECONFIG:
> > > >   EXTRA_QMAKEVARS_PRE +=3D
> > > >   but with
> > > >   conf/distro/include/no-static-libs.inc
> > > >   it means getting --disable-static as invalid option inside
> > > >   EXTRA_QMAKEVARS_PRE as reported by Alexandre Belloni who tried
> > > >   to use poky with meta-qt5.
> > > > * once we migrate all bbclasses and recipes to
> > > > EXTRA_CONF_PACKAGECONFIG
> > > >   we should also restrict EXTRA_OECONF append only to
> > > > autotools.bbclass
> > > >   like I did for cmake.bbclass
> > > >=20
> > >=20
> > > Sorry, some of us have been a bit busy trying to get M3 stable.=20
> > >  This does
> > > look good and I'm for squeezing it into M3.
> >=20
> > Any update on squeezing this?
> >=20
> > meta-qt5 is still broken with default poky config
>=20
> I'm a little confused, was there going to be another version with some
> tweaked variable names?

Was there some agreement about variable name?

:)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pql/uPZNXIm1JCle
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb1JxcACgkQN1Ujt2V2gBw7RgCgu3k9WlqcF+MH61a/9pG32ABi
vjUAnid/4h9GYFCpU5k+j3qlO7652v3W
=ArG6
-----END PGP SIGNATURE-----

--Pql/uPZNXIm1JCle--
