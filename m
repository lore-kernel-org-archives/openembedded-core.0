Return-Path: <trini@konsulko.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id ADD3D6B076
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 22:29:22 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id l3so4653034qtj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 15:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+iFwD7QaLkAzHHjMksBqrkyp4MiQYxk41Pr5/mSD4Gs=;
	b=sqCua+V2zi9GySCeJmJ0df5XsEOlitp2BbmORqtCfRvmuUvfpLgyuiWGMb9JU/LU4a
	QSo3T0PISB8FABIyCelapuTzijBhfNG70fFZrm6mEZ0wj+ffjySUgxX9J+XiVN9XCR/c
	eSqc+IwyDZj9x9RjQYJ262Nw16S6LWjpDgQPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+iFwD7QaLkAzHHjMksBqrkyp4MiQYxk41Pr5/mSD4Gs=;
	b=Xnw8/dFIYJbaD+kWWl3fU5lS5BQzgGYi+Be+w5dnPaAhlF34ri2s3laPDCGiDkCNBx
	aKKYV8XE+GG3Vs4Es+1u3tPjGIC2Zs47xu+HOGffk+JNRNh98qz4kP8D2bAyQr3bQyCA
	xaOtTmxOkI94nLr4ndF8gRI2TBsI7LxSXFEYvFDlfKoYWVukUmnyRj4NS+K9uawpDCeq
	DGoIGmQ/Nah2i9akFTFieQ1yQX4JX3JN0zE7rYm236NmmqdXmX5UTZkv1sLpvOpj1HiC
	/4DyG/AJTF6yqnJ2Z/I2nT6O4pxJ1GCZuYCzC97wBuvp2/xoLrfLMRXuonfzgbCBqaa6
	nR3Q==
X-Gm-Message-State: APjAAAW/eU4ExZEAPWzvpXBToGxLF250a59fUaShW/IgzUbpkG03N7d2
	+2FCTpamE3Zy1Tkbwik5vBJS9g==
X-Google-Smtp-Source: APXvYqzyqCYaXWOftv1ACGS6WPFqiGNs05uypIrX73JbcUHWLm+JSTv0XJpZggpIoZiFLRwKsZh5bw==
X-Received: by 2002:ac8:2ea1:: with SMTP id h30mr372274qta.333.1559168963408; 
	Wed, 29 May 2019 15:29:23 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1401-82DE-F9EA-E538-B09C-E631.dyn6.twc.com.
	[2606:a000:1401:82de:f9ea:e538:b09c:e631])
	by smtp.gmail.com with ESMTPSA id y8sm344192qki.26.2019.05.29.15.29.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 15:29:22 -0700 (PDT)
Date: Wed, 29 May 2019 18:29:20 -0400
From: Tom Rini <trini@konsulko.com>
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190529222920.GP20781@bill-the-cat>
References: <20190529184328.28470-1-richard.purdie@linuxfoundation.org>
	<20190529184328.28470-2-richard.purdie@linuxfoundation.org>
	<4c62af9f-8bff-726e-db35-6f6ed7ebafc2@gmail.com>
	<8798dc0e5d91991953720388b601c9c5b3174c42.camel@linuxfoundation.org>
	<321f3cb8-a101-49ad-07c4-64fc82d2c7f8@gmail.com>
	<d5b41b11583c78cd16d6393736fafd8e733c48a9.camel@linuxfoundation.org>
	<20190529212556.GO20781@bill-the-cat>
	<4571b3c03fb83ee01492dd1891e410becb72b0e5.camel@linuxfoundation.org>
	<20190529221726.GA16075@localhost>
MIME-Version: 1.0
In-Reply-To: <20190529221726.GA16075@localhost>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Wed, 29 May 2019 22:29:22 -0000
X-Groupsio-MsgNum: 125133
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Yy8WFzRlv6nS3fa"
Content-Disposition: inline

--4Yy8WFzRlv6nS3fa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2019 at 01:17:26AM +0300, Adrian Bunk wrote:
> On Wed, May 29, 2019 at 10:29:31PM +0100, richard.purdie@linuxfoundation.=
org wrote:
> > On Wed, 2019-05-29 at 17:25 -0400, Tom Rini wrote:
> > > On Wed, May 29, 2019 at 09:50:22PM +0100,=20
> > > richard.purdie@linuxfoundation.org wrote:
> > > > On Wed, 2019-05-29 at 13:39 -0700, akuster808 wrote:
> > > > > On 5/29/19 12:26 PM, richard.purdie@linuxfoundation.org wrote:
> > > > > > On Wed, 2019-05-29 at 12:21 -0700, akuster808 wrote:
> > > > > > > On 5/29/19 11:43 AM, Richard Purdie wrote:
> > > > > > > > (From OE-Core rev:
> > > > > > > > 29fc9210b973be68de474e75068e4c72371afe5a)
> > > > > > > >=20
> > > > > > > > Signed-off-by: Richard Purdie <
> > > > > > > > richard.purdie@linuxfoundation.org>
> > > > > > > With back port to warrior and Thud too?
> > > > > > Yes, we'll need to do that if we bring fedora 30 workers online
> > > > > > on
> > > > > > the
> > > > > > autobuilder.
> > > > > I know the uninative update is required for FC30 but changing the
> > > > > compression does not.
> > > > >=20
> > > > > This question is about the compression extension question.
> > > > >=20
> > > > > Does this mean YP will no longer be providing bz2 uninatives?
> > > >=20
> > > > Correct, the patch should be straight forward to include with the
> > > > upgrade.
> > >=20
> > > Does that in turn mean we must have host xz-utils?
> >=20
> > It will mean you need a tar which supports the -J option. The tests
> > I've see so far suggest all our oldest supported distros do...
>=20
> For thud tar >=3D 1.27 is required, -J was added in 1.22.
>=20
> But Tom is asking about something different:
> tar calls "xz -d" for decompression, which needs xz-utils installed.
>=20
> https://www.yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#required=
-packages-for-the-build-host=20
> documents that xz has to be installed, but looking at=20
> meta/conf/bitbake.conf it might be missing in HOSTTOOLS.

I think it's also missing in for example the crops containers.  So if
we're going to backport it, I think maybe we should keep it bz2?  The
size difference can't be that much.

--=20
Tom

--4Yy8WFzRlv6nS3fa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJc7wfAAAoJEIf59jXTHXZS5AAQAMIm+iQ95RceXgElT+DPJJ7x
+RWk3c6n2ubT5S/J4kAL2fcqDu3y8LB/ia9hWHZJq94onLFpZx9rkq1kZWK34Gsr
OZN8AhGf9daBkdtbBxUZxgynliNCXUUYJOxpFtGkSF1R5GDXZmrdCmVwTeZXG7Y+
kiZzDUKCMyo7hEQFEo/WD7D2yRnoeKDLBS+9U7QCOPoXjpwsgLRtu87oZMZw19rX
uSE6jSBG49/7MPGpTkjBVP3KA6+0bmJg2kY4XPpUJmnzsEeoNLtyOoKBwsaMkrIS
nhEeqv2rB2PZgs23Fu5TkJ0VyCxIvyFUo43OYH/w+eYvmQP4hOdD6s+HLFkdB8kY
nfoAIeTGfcIXuzQ/E/0Rb00+jqgHbJ9Lrm/f2qekko/mwdrtAd6jE70zB3z5Sw48
Lw9gyayruyi6amTb5cJe3hgbl2Ly1OLHyBfPef6KUvt+8D4aWOZWNIaZiGwSaNjB
w9mmNov7op0Q0IhgwbD38DCigvx0iGpUrHV8wYIdaeV5uvNCSWsYAmfS5fgg0n6J
PebzAZUcX+s7NIJGbMWp1/LYGfAxnN4u1Qpxp/Rk082Nzas72D9uIaXjiKJwz/NH
iS9RDedKk1h6Oo6nioOBBs25PDRM45f48tIZpy9uomeDCRkLnwJRYQTMotgV2h+N
Mdabe7e7ETHT75TPjc/U
=KUHY
-----END PGP SIGNATURE-----

--4Yy8WFzRlv6nS3fa--
