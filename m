Return-Path: <trini@konsulko.com>
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 47C257F821
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 23:26:24 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id t5so583964qvs.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 15:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=CPJGKUbYi3llrFMGBHCJJiKW1/YfRDeCE+g45MuplXI=;
	b=QrQHuC0S7WJqkDoE/3JkzOT9oVPZEPU9UrMCFL2htPnhf9aLPBMo6U9dSDYsD9/oZp
	Rcexj2XEsZBolrQthK9igp4jlaCb7d1yGeA+C9SMQaKblcnlZ6V9bquhD2YA2jQndXvr
	XhR0dindt+EEAnYkb+MZ6JAkqek44HBWqkWGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=CPJGKUbYi3llrFMGBHCJJiKW1/YfRDeCE+g45MuplXI=;
	b=qbXRf+am69ols7AgbbZD4FHzr6GTnrpwRjcdKq8pljfPbHSBmcVa90v9TJg0Q7hhCi
	gjecZvl7z1Se+yYF1pveRZ75nO54SSbLSpg1uPzyMOUX/5KL9+Ms8X9qqNVtQz2bQat8
	nGpgJy7XJC52HVNMXbaEzCchigsV2oOk+xCw+ugIY8OMrk/F2NLWf+LfIw2OZJGbUhzN
	nY/L2PgLSuKL+cCcrWv6JSvqZVgK7U3Wv/sWEvRwgCCd0b+CraV0lR49XdHOVjaSfcak
	yM6d9DBwoXGz7fAF/I4P1RDS7xORGWb3GVxADqYNheFiuq3VrsOr2X0182imRybik6AV
	I63w==
X-Gm-Message-State: APjAAAXym+TttdLPQoX8kKIbkuhwxtDlTQgkFxAkG5vOKsIPGqA60l3N
	PzkJEeL7zsVlVm281tpMb+BZPg==
X-Google-Smtp-Source: APXvYqweGiHbdEez/r6tA1Zb5/SebRmlLlZ0vcxlRdXdvQnmng9YYBpL16ND9bOrobiGxwxWjioIAA==
X-Received: by 2002:a0c:804c:: with SMTP id 70mr5118866qva.81.1575501984968;
	Wed, 04 Dec 2019 15:26:24 -0800 (PST)
Received: from bill-the-cat
	(2606-a000-1401-86dd-2437-e57c-2a66-2025.inf6.spectrum.com.
	[2606:a000:1401:86dd:2437:e57c:2a66:2025])
	by smtp.gmail.com with ESMTPSA id
	139sm4292587qkj.116.2019.12.04.15.26.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Dec 2019 15:26:24 -0800 (PST)
Date: Wed, 4 Dec 2019 18:26:21 -0500
From: Tom Rini <trini@konsulko.com>
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20191204232621.GF9549@bill-the-cat>
References: <216e9c7062d44b98a54b6fd572128266383e83ad.camel@linuxfoundation.org>
	<20191204230237.GE9549@bill-the-cat>
	<20191204232324.GA24229@localhost>
MIME-Version: 1.0
In-Reply-To: <20191204232324.GA24229@localhost>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: OE-Core python minimum version requirement
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
X-List-Received-Date: Wed, 04 Dec 2019 23:26:24 -0000
X-Groupsio-MsgNum: 132175
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mrJd9p1Ce66CJMxE"
Content-Disposition: inline

--mrJd9p1Ce66CJMxE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2019 at 01:23:24AM +0200, Adrian Bunk wrote:
> On Wed, Dec 04, 2019 at 06:02:37PM -0500, Tom Rini wrote:
> > On Wed, Dec 04, 2019 at 05:45:03PM +0000, Richard Purdie wrote:
> >=20
> > > I just enabled hashequiv's server in local mode by default in poky.
> > >=20
> > > This causes an unintended side effect of requiring python 3.5 as the
> > > minimum version.
> > >=20
> > > We had thought that the servers would be 'rare' and a 3.5 version
> > > requirement for that was fine. It turns out a local server is also
> > > extremely useful.
> > >=20
> > > The code needed the python 3.5 async support and trying to write it a=
ny
> > > other way is a nightmare, we need that performance for the server.
> > >=20
> > > At this point I think we just give in and require python 3.5 as a
> > > minimum. Any objections?
> >=20
> > In having to pick a minimum Python 3 for U-Boot, it was noted that
> > Debian/Stretch is 3.4 and gets end of long term support in 2022.  3.5
> > was otherwise fine I believe in the end.
>=20
> Debian 9 (stretch) has 3.5
> Debian 8 (jessie) has 3.4

Ah, ok, thanks.

--=20
Tom

--mrJd9p1Ce66CJMxE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl3oQJcACgkQh/n2NdMd
dlKfRg/5AVrH0uDwR1DRxdx8lu3mDLgDlHNGvtTIUTuH5VFjsYACOvi/MqfeROA0
dpkhFfnNGLaICXX88Ec/v/pr9GF6RW8t4ZvcHhQwvgRTqk1yHnJ0TX4G4YAezfAm
ZEZXL3JstR9DGHUFtjMw//nf8FdPeIevdi6ZO8IYejO+/mBeFctGi6qF+dS+5FvQ
Zn3gW9sXbxGdoo4f5q3u5TUlGtbFKXQCSOuZLUXa/Wgfd0VcGJxAQrtw+Bg3HBX/
XP52jFlxzeuKt9OwnsfIZusu00ZkS28b8sa9qJZzrf8KbyullBXaTXlZA4YcRS5C
nu9/xxSggGdSCdeh81bfoVnu4VG4SUU0uroEYgJdH3JFdMidaMgUoLATZwvDaGik
dpkU/qyhIcD1YgKDHHaOEl+Kp76Xt2bFgcvgtuEFLl5QzXI6qQ5b6tPF7ctxDlWd
nEO33imw/6mwHrq1sC3JP746osmpCQ4CXPcx8LZG56GHH/AE+uAlgASY6Dm934Nl
tTuyeh30elB/Uwm7Xty8WcwqrN+4J7UWooMAO1AbgiSya/AsA76UapgKrOg3NRG3
Obhvg6caZmTHNKxZegu+TIyTBjcWA9tB3otGoBU2Mm1a4AYyZ45LuejbpVnyDFTC
MEBAc40x2PmGJuqcWRmsyf+WL78XD1XjsSiZc7TLCkt8WVecPhI=
=8+tC
-----END PGP SIGNATURE-----

--mrJd9p1Ce66CJMxE--
