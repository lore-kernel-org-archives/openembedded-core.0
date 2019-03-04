Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id A87A77C8CB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 16:38:15 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id 10so4767910eds.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 08:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=VVreqCJre+55ECE0jxsIgU+tqhlY2T0ohsjXpj1EkRA=;
	b=gM4h55TkXU2og47SPUSEZRiCwxrCwSuo5FGwN0D3Tklt/UFvNPC1FB/WSzcOwvt7ne
	Qtl8622dFxZfG+GvBLBgq4sLNfzYINXcGfyXP/RaTfUtGcbRPMfGWbKtNuuwIJTvp8QS
	AA8FBWpmWcv8x8OJZLPUdl5k6jltejTZIXbzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=VVreqCJre+55ECE0jxsIgU+tqhlY2T0ohsjXpj1EkRA=;
	b=ctqBYWW4YjVDj8gvA4FS13xZlMDWK/0SGfYUx7qfZwMQqQQMrNuQqh28LShbp+g6d8
	msVjlY8IXZ94wRCiMVZDrEu8zvUSxex16mLXYI1CPWrgSsHcVk1cFAsRbi+QCLEyUf+3
	p5d7Y/Ej76IFcKk25oAQBHk4sq5HGz0Atmh9wBnGY+ydZ6xL6lCSKkQqje8uoCczMFPa
	rTcgiSbQjuHcAuPJvFMSVqjklCshBkN2Zhd6OSiAippPCUkAo2Pkzw5L7FWY2hBVHGQW
	mcKlf+Af84Du+UF2Bua0bHzPNyNHRkrpcBRZGOwRupsMJnySiSVph0PjgJBno+Yuinbt
	kCjg==
X-Gm-Message-State: APjAAAU2l7YvpnuDRfEeQxuPJWjPes50fA1xabaBCzz1yIgbYCTVkI4X
	VGg1LlbZ1InYFOAy03b/yiyUXg==
X-Google-Smtp-Source: APXvYqz1DIti8YOCauPWSrvW05UcL9gxjP+0u014Ea0QWHjau678xqmWWBzUxLLTB9FWlQYmLCPvUA==
X-Received: by 2002:a50:8ef4:: with SMTP id x49mr15828374edx.254.1551717496189;
	Mon, 04 Mar 2019 08:38:16 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-D0BF-27DA-BE9A-269E.dyn6.twc.com.
	[2606:a000:1401:880d:d0bf:27da:be9a:269e])
	by smtp.gmail.com with ESMTPSA id
	g31sm2242711edb.45.2019.03.04.08.38.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 08:38:15 -0800 (PST)
Date: Mon, 4 Mar 2019 11:38:11 -0500
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190304163811.GS5026@bill-the-cat>
References: <20190303204731.GK5026@bill-the-cat>
	<CAJdd5GYLLN4OB+wRsFGN10Cs2ybvKNcM_TP5pMHRdycf0M_Lsg@mail.gmail.com>
	<20190303212515.GL5026@bill-the-cat>
	<CAJdd5GbdpUCenci29Pk16vzhFDR=rMb_sd9CWD15pHreFPQfDw@mail.gmail.com>
	<20190304155845.GP5026@bill-the-cat>
	<c35172f8efc2e7d16a7915037f4b0d412d1707c0.camel@linuxfoundation.org>
	<20190304161443.GQ5026@bill-the-cat>
	<c8018d5229f49e70b7ab52394196537c78e7af54.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <c8018d5229f49e70b7ab52394196537c78e7af54.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sstate hash equivalence breaks rm_work
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
X-List-Received-Date: Mon, 04 Mar 2019 16:38:16 -0000
X-Groupsio-MsgNum: 121919
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+hz2tM55CCA8Ej21"
Content-Disposition: inline

--+hz2tM55CCA8Ej21
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2019 at 04:21:48PM +0000, Richard Purdie wrote:
> On Mon, 2019-03-04 at 11:14 -0500, Tom Rini wrote:
> > On Mon, Mar 04, 2019 at 04:06:47PM +0000, Richard Purdie wrote:
> > > You mean like the BB_MIN_VERSION variable:
> > >=20
> > > http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/sanity.conf#=
n6
> > >=20
> > > ?
> > >=20
> > > :)
> > >=20
> > > The changes were intended to be backwards compatible hence it
> > > wasn't
> > > bumped. Clearly something isn't playing as intended...
> >=20
> > Yes, that.  I think we haven't fully used that well historically
> > since I can only ever recall *kaboom* when using too old of a bitbake
> > rather than a nice sane error message.  Looking at
> > https://wiki.yoctoproject.org/wiki/Releases and then some quick git
> > history, we also must have had that mechanism available when I last
> > ran into something like that even for the fairly ancient jumping
> > around I've had to do a time or three.
>=20
> That variable has been around for a long time. It does get incremented
> when we do nasty things which we know break things. If something sneaks
> in, its more problematic. We do try and avoid API breakage.
>=20
> > In fact, can we make BB_MIN_VERSION match the table found there?  It
> > doesn't look like we have resources / time to test things on both
> > current and min versions, so we should I think have the min match
> > what we say should be used.
>=20
> The problem is more "test what?" on the min version. In this case its
> rm_work which triggers it, the bugs tend to be unusual corner cases
> which our test matrix, vast as it is might not catch. Case in hand, we
> don't test rm_work on the autobuilder.
>=20
> I'm torn on forcing people to update, I've had a lot of complaints
> about being being forced when they didn't need to in the past. Its also
> true that we're not as backwards compatible as we could be, i.e. using
> a modern bitbake on old metadata isn't always guaranteed either due to
> the same kinds of problems :(.
>=20
> By this line of argument, we'd bump the minor bitbake version for every
> bug fix and force people to it, just to "protect" them from themselves
> :/

So, what's worse, people hit a bug that's fixed in a newer version, or
when people upgrade one set of branches they have to update another
repository too?

Honestly, I could see the "but why do I have to update bitbake too?"
complaint being more reasonable back in the early days after we moved to
proper layers.  Now that it's not just oe-core/poky but also
meta-openembedded and meta-$BSP and maybe 2-5 other layers you also need
to bump from branch to branch, adding bitbake to that mix seems a lot
less of a big deal.

I thought about this and re-drafted something a few times now.  I think
perhaps a happy compromise would be to move the BB_MIN_VERSION check
=66rom a hard-failure to the same level of warning we do on
SANITY_TESTED_DISTROS, and make it track the suggested version for a
release.  This will both help to catch bugs that have been fixed already
but still let people that know what they want (or don't want) to do, do
it.

--=20
Tom

--+hz2tM55CCA8Ej21
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcfVRzAAoJEIf59jXTHXZSIGMQALUKzhaGZ3M04j656KFiSaJf
g9g9eku088DR4NqS/6B19e6Nu7xwO9nHB26qAriwq2hy8kmLRZjVc4EL94xAW4dk
ISsBpsr7WrSu+POgSMNna6xRResw3W25x6vALgHeAoZl8z0URmWSA+EP3Bb+S3Zw
VcFgVr31zuPQ5wvIbPpEc0f7sHsYpBo08UoIk0aHKDXwz2uh4BVTQeuRKvlaH274
m2CBVA/0zu3NUbRtkqttGe9lLg73ldRU7gynwARQzAEWqSJe7ADkdMHl4/tW/ZX2
gE8Pcs0HJZduOaMG2a8SY0Xpnwe57f7Ro+NrxqFfEnIw833BEZFtG4ZQjxo2ZoIp
HSsTutzruZ+YJqbHdke9jiXz/8VpvKmYP9b41FtaC5BDcedPDc15dP9rzSLG5W63
hBCSyhKxc0wuOUqnE7zetAJFK0+Djftj1niXFVFNKbDLPZt0QmEtKyyhQ+3Bm3an
yPzdXb5aGlSl4leMUpXNVPW62GBEJ/+/KVv24D9KC4EL5yp9uOAqgdflEbQrPQZf
On+jLJfBxGhEkps6cfRPw8fsw3zTxv2Ysj0vg5cWNn7KFPjqs/DsK7iJYw+3Y8ZB
2GpSeUrtXZUDgTYoSwteRlkYkr0B3vkvIMqtrtzUjNu7TVxDNBei2r2p/GBcVBP4
8IbnqQOEId0uJpy/G+Oj
=l5MN
-----END PGP SIGNATURE-----

--+hz2tM55CCA8Ej21--
