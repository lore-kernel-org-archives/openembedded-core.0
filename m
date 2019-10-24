Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id 38FF37D278
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:45:55 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id w140so8897044ywd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 10:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=KNqasQmml+8EooAEzXQALeWh+e2vlxpznvmLXserViQ=;
	b=jYi5znjg7Pp3vbcG2WCTJr6e29Mqk6McM3YT+jA0lgVUq/eAQyZYo+ZqSfAHRX4nNR
	m/z3hrm9huHlLQlFWQ1TR75o7ep5odbSV0zXaOFZuvl+cQKV/GC8MtKieWDHyye+IWP6
	J/aI0iUaJnHnfts1ky3XTf8V40cvngrss8udA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KNqasQmml+8EooAEzXQALeWh+e2vlxpznvmLXserViQ=;
	b=D6B2jFEvhYpwr6NyN2NOrLaePghbv7W1OsGnKJR9O/gFn0CLKldgBBDRGNNnWoPFPN
	Anu+K5/qXJWQElDOrXriYnU4FqsydMyo+MRZnlSI3Hay05aI/6L1p/tN70wF8+SHG6qs
	5e7/BZgK3dxUNNidl2YEtZBDxJOVKrtQNOBcFklDT09H/aoZVtTDEU3im/CoxocxJT9n
	knNKXbFgHCDZsWGrADQedu+OuvMnSnhPnGZNqJ1Fnn+ilYnlcK23r8qjLef0OZiQrbtu
	n9vZ5/94ddkjHZXgNXF+Cfa36wbHlbrzAcA9b6pY8KQX1NBDYoXQG9nvjq6uLknAjPKp
	mtzw==
X-Gm-Message-State: APjAAAX2ChI0Smxlktgd4xQHdP1KiSbDeKSWYeiLO0GptAtQ9PvRvlAJ
	yT2NvFhODTzpnwoF9q9AOOizDe7/cxZurQ==
X-Google-Smtp-Source: APXvYqxtaIaYHuLUyUE3C0O/VFxZaehE/o4un/7E6hS07hzwiqq62J1IBIR4idUqhAExbPf3vD2Chg==
X-Received: by 2002:a0d:f1c2:: with SMTP id a185mr7608692ywf.298.1571939155917;
	Thu, 24 Oct 2019 10:45:55 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
	by smtp.gmail.com with ESMTPSA id
	x201sm5318135ywx.34.2019.10.24.10.45.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Oct 2019 10:45:54 -0700 (PDT)
Date: Thu, 24 Oct 2019 13:45:52 -0400
From: Tom Rini <trini@konsulko.com>
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20191024174552.GO11173@bill-the-cat>
References: <20191021094149.uwvkismntthgd7i3@pengutronix.de>
	<20191021102440.GA25961@localhost>
MIME-Version: 1.0
In-Reply-To: <20191021102440.GA25961@localhost>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mfe@pengutronix.de, kernel@pengutronix.de,
	openembedded-core@lists.openembedded.org
Subject: Re: Why do we still disable mke2fs 64bit support?
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
X-List-Received-Date: Thu, 24 Oct 2019 17:45:55 -0000
X-Groupsio-MsgNum: 130455
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XPfPv5HFi+O4rHSw"
Content-Disposition: inline

--XPfPv5HFi+O4rHSw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2019 at 01:24:40PM +0300, Adrian Bunk wrote:
> On Mon, Oct 21, 2019 at 11:41:49AM +0200, Marco Felsch wrote:
> > Hi,
> >=20
> > during a initial system-setup script the mke2fs tools complains about
> > the missing 64bit support:
> >=20
> > 8<----------------------------------------------------------------------
> > mke2fs 1.44.5 (15-Dec-2018)
> > 64-bit filesystem support is not enabled.  The larger fields afforded by
> > this feature enable full-strength checksumming. Pass -O 64bit to rectif=
y.
> > 8<----------------------------------------------------------------------
> >=20
> > Other build tools e.g. PTXdist or Buildroot don't modify the build-in
> > config. I know in the early days this feature break something but
> > shouldn't we (re-)think this decision?
>=20
> Already fixed in zeus:
> https://github.com/openembedded/openembedded-core/commit/f5edce401cfb31eb=
d0200adaba9a201caf7ea705

I suppose as this point we just hope that there's not going to be still
more boards found in the wild where U-Boot is old enough to silently
corrupt on write or fail to find things on read.

And with my cranky U-Boot hat on, is there another new on-by-default
feature that'll prevent writing (or worse, reading) ext4 again?

--=20
Tom

--XPfPv5HFi+O4rHSw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl2x40wACgkQh/n2NdMd
dlIVIw/+PgUw9bBQ5oTnFzdaVNVDFZVvfbOQHptjk8/eS/jpvEa5vhH2dRGGws42
W5ETFGk57CSdRHOSXQf+gWCPSm2OJQsaNaBSyeXpLVsEeqwiC7tWu8+jx6/BOcpT
npZBPfGYgCCy2QvDQfXYc14eeevW8xn5OY1J4+KAP1BLj8oaoJMomlPomaYKpnxB
KEgSc9TcCHvAD/cxpshPTgea/Vpi6qL7niJPrqN9j41NENaDs9cm8R5l4KaGgILw
434Z8gkX0lz2G+O0oINwswNmUcly4WlWHsnYa3VfvvZrk2tOqIwgCBGtXYwePmbU
Yj+vOHdGSZHhIoVdpzIXk/awL1sCPYuDipibQzz3ZseaiR6BnzK5dvvIBgj7br8r
qLW4kvk93ciuFfwLdXsiEJfCzvxWTb6Hk2UIN89KV8JD3mFWZxfD2mEr+LMSdTqe
EaBxC8eQEUDYzWTQxxFdXNiAfHi/euJeQMoMjiqfezC8gGyHenUDlGK/tad2B05S
8xNbysa4i9v959xivQC3GIOPAKMQzrUEmrF23nbbAqdc8S1NyXCnZ6fpLdD1+oYV
89Yq+hY7dY919pNgszwswUhHeRG9ywDQrRz+foyfzlsjhzOeX1r5UlrxeZ5soirn
e3JQqmIX8eE5IbWVXxkg7BYpLVUqMGiYACFM+MVyKY6cWoOaK0A=
=rc93
-----END PGP SIGNATURE-----

--XPfPv5HFi+O4rHSw--
