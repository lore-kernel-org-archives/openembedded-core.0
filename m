Return-Path: <paul.betafive@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id A369C60169;
	Mon, 18 Aug 2014 19:31:06 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id hz20so4973351lab.22
	for <multiple recipients>; Mon, 18 Aug 2014 12:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JZAyvwOncz23WztJXofI13ZHv1sl1RzJY5vT0XfuWIA=;
	b=i39VAYlqDjsW6vI9OE31PjawWnW20+KFidRG+vVjdgG28Da08dA7e1EJKmSA0Pbiq7
	QrP+fJYjHtRKXu/Lt7hetlfObzfgJ979+ehspJ1NjxRP6t8DcnJcUp29xYtfQsVq7Lhx
	iDkQE7PoWS7OIoTJRsaCYiykUnjkggUlWNf1M5ebAKOrzuZgtgAwJrUiBtsdixffrg1Q
	1H6gBtRW2iigIpLeUQuy/ZP7mmwi/en3ep7TvyHgCu/feV7hZ2WL296HsZBtlChhj22X
	KEWfRIlNXsiJe3ChFzaspD/NCF6uCA/sfGGJpUiS1BTeAfEaQ4KEvtjy8IzFpClEy4k3
	5m2Q==
X-Received: by 10.112.35.138 with SMTP id h10mr16368370lbj.65.1408390266549;
	Mon, 18 Aug 2014 12:31:06 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id j20sm28484678lbo.3.2014.08.18.12.31.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Aug 2014 12:31:05 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Mon, 18 Aug 2014 19:31:02 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140818193102.GC7174@gmail.com>
References: <CAMKF1sp9Z6vj1Dz96_WYiHOtYFqa-zECrNHOFgb=dBUDJN2Z_g@mail.gmail.com>
	<20140818181424.GG12992@gmail.com>
	<CAMKF1srjVfmfAWZ0mx+AfE_nR4erYtAEYt2OVhEsU+q++XKVrg@mail.gmail.com>
	<20140818185009.GA7174@gmail.com>
	<CAMKF1spkQkfbZMkL2Gg41hF9bm=+HS8sU8LME3pV6yMzDLLs-Q@mail.gmail.com>
	<20140818190814.GB7174@gmail.com>
	<CAMKF1sq+qbSPSOaU4iyi1Vr8=Xvzuyd2gHx2QN5PPNtUo0JLAQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq+qbSPSOaU4iyi1Vr8=Xvzuyd2gHx2QN5PPNtUo0JLAQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Announcing meta-musl OE/Yocto layer supporting musl C library
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
X-List-Received-Date: Mon, 18 Aug 2014 19:31:14 -0000
X-Groupsio-MsgNum: 56706
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline

--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2014 at 12:14:08PM -0700, Khem Raj wrote:
> On Mon, Aug 18, 2014 at 12:08 PM, Paul Barker <paul@paulbarker.me.uk> wro=
te:
> >> That would be handy too. But I wanted was to keep this info in project
> >> for folks to try it out.
> >>
> >
> > I'll just post one ticket for now.
> >
>=20
> Thats fine too.
>=20
> > I think I've got a fix for e2fsprogs as well.
>=20
> Great. when we write patches that arise out of musl systems we should
> make sure that
>=20
> 1. If patch fixes a genuine issue surfaced with musl, fight it out ar
> respective package upstream and in OE universe add it to the original
> layer where recipe primarily resides
> but we can keep the patches in meta-musl as a last resort.
>=20
> 2. If its something musl specific then lets keep it in meta-musl and
> see how musl can be changed to fix it.
>=20
> Thanks
> -Khem

That makes sense. I'd suggest adding that to the README file in meta-musl so
other would-be-contributors notice it.

In this case, it's ensuring that 'uint64_t' is used instead of '__uint64_t'=
 and
that <limits.h> is included where needed for 'PATH_MAX'. So I'd say those f=
ixes
belong in oe-core and are candidates for submitting upstream.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJT8lR2AAoJEBwoJlo7UPQDKV0H/3kiDDC0Bt3y7phnSBGedJzM
PPV8ZMKxr5n67zROzPWDXKCuq3ugMJ/iszVmXxns4Y8l7eNYNPVaDL+wZ0DVS2SV
a8txnr9MD23IpCszjvhXIZgSEr/RXPpGYWaom09xhyc52Rp2qBJRNt2lPffD3EC5
AbhPZwXny2iRUxrULsq38CnoFOwjAh7/hTFTaSTyU4VLjfN6Roz6nTnvBHwtANWy
JHxMEzhM0a/ZmhwJ3ccDRNvHjSkAVcwrI+w0bNKmSZ8+kJTotIVKFTUbghhY08Fz
mMi26wK8MwJAldp7JWGliYqPjunlieSTsHU81silh2yEg/dj36NECENenaai/Ps=
=tJ2t
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
