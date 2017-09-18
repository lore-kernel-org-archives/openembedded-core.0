Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id E75F978272
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 16:06:11 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id x131so670491ywa.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 09:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qnZozpgrE/oPRq/kWSEBqkeiScesjLlBOZguOeOMiAs=;
	b=XOzSQsWo2RIapDV807HBekb07cG8anQIVGTOdQjjnOkoyApnttEvHf6mTB4wcJTpBi
	GUIQdH/D9Gfe9QfeEoxxpQEBxdx1zv4DYF+rO9Obt8zX4z/0Uw1zqmiOybTWheCxSta+
	3yLpxeLC3QTXh7liRKGJobdcNKY5yZRPq+AZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qnZozpgrE/oPRq/kWSEBqkeiScesjLlBOZguOeOMiAs=;
	b=KvQbNwEgf9fRrDY6eUXxeKMo47uv5RC5oDIlN+Jv45qUwOSKso2e5gcXoV668cCjIs
	aI/wmfC2zURzwkh4MHvruvEZ2COJglaExLk9J1MdeLTnfDvGcQ5D07bh+SD5Ol91GIpk
	8AGhDkhgEikJPspmLB2FJWJd56YXXui6Xk3J7CDM1o7LWL3e466nrjbbDcv9+4HKwNlj
	Zzpkfr5AVg2CAsJULvtNOfo/bi/vDbCIFwfO7+ZA6tP17o0McjWe3GBin4WjGGcIMSk+
	3E3Q+z3E0l/OCpmGfaKY2K5y1LjPSKeiS0WE2h2kdNHhLWVfhc7ZGqsqcnjOBfrd5pni
	Q+Ug==
X-Gm-Message-State: AHPjjUj9uMEx/zDS/KPJ1q218OiG93JvI0TQn1+L353ZtXs2YlK2SUaR
	GCv9U431B6UnUX2L
X-Google-Smtp-Source: ADKCNb7xggV2TaOIsio+YFpswjD+qe91I/2+I5La/+1l43VPQHoilNSfXgkjLSs35KJjF0NXY+X4ng==
X-Received: by 10.129.89.215 with SMTP id n206mr28490787ywb.68.1505750772508; 
	Mon, 18 Sep 2017 09:06:12 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	l19sm1409931ywk.69.2017.09.18.09.06.11
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 09:06:11 -0700 (PDT)
Date: Mon, 18 Sep 2017 12:06:10 -0400
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170918160610.GD17137@bill-the-cat>
References: <20170911203056.22156-1-otavio@ossystems.com.br>
	<CA+chaQcUnbBq_f3zkAOxSF_E8M9RUMSaefncSgF6Hdt-j+Q0qg@mail.gmail.com>
	<CA+chaQec-cL6x3i3TfOi7yBhmCQ9Gf=-4jXkXqJ2-yJQmPmcmw@mail.gmail.com>
	<5e66c357-fda0-17d8-1d78-5b877fdc47e5@gmail.com>
	<CA+chaQfdgGcWAc17f=epK8s3q1=h+voUUc4sNJSLdtu_5SbOfA@mail.gmail.com>
	<1095f2c9-3ff8-bf71-4b6e-707111a4445c@gmail.com>
	<20170918083915.GB3340@jama>
	<51b6874b-551a-3983-4002-77e166822521@balister.org>
	<CAP9ODKpiSEJqR47RnjV+EFBeo7gd3wEtAR398Pwn8HjCj93TEA@mail.gmail.com>
	<CAJTo0LbFHX_Wm_W2MteS=6XbJgqzZh-jtGZ_Bhu95kO8Nue+dw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbFHX_Wm_W2MteS=6XbJgqzZh-jtGZ_Bhu95kO8Nue+dw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Marek Vasut <marek.vasut@gmail.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [U-Boot] [PATCH] u-boot: Upgrade to 2017.09
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
X-List-Received-Date: Mon, 18 Sep 2017 16:06:12 -0000
X-Groupsio-MsgNum: 103069
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yudcn1FV7Hsu/q59"
Content-Disposition: inline

--yudcn1FV7Hsu/q59
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2017 at 04:51:31PM +0100, Burton, Ross wrote:
> On 18 September 2017 at 16:46, Otavio Salvador <
> otavio.salvador@ossystems.com.br> wrote:
>=20
> > What is the policy on doing u-boot version upgrades this late in the
> >
> > release cycle? SHouldn't this wait until after the release?
> >
> >
> > Why?
> >
> > It is just another recipe and we are upgrading to the final release.
> >
> > As Martin said, it was already broken.
> >
> > I'll take the responsibility to fix it. But as other packages, upgrades
> > has risk and we have more than enough time to proper fix it.
> >
>=20
> Why?  Because it was merged to master after the freeze.
>=20
> Personally I'm of the opinion that u-boot is one of those special recipes
> that if an upgrade appears just after freeze, we consider it.  If we don't
> keep it up to date BSPs won't use the recipe, and we'll be back to every
> BSP layer containing its own special copy of the u-boot recipe.

Also please note that U-Boot has a rather regular and public release
schedule: http://www.denx.de/wiki/U-Boot/ReleaseCycle so you can have a
good idea beforehand if you want to grab something for a release or not.

Personally, I would like to see this in.  But the security issue that's
been disclosed now is "resolved" just by not enabling functionality that
no one was enabling in mainline, and will be removed in the next
release, so don't feel you need to pull it in on those grounds.

--=20
Tom

--yudcn1FV7Hsu/q59
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZv+7yAAoJEIf59jXTHXZSNSsP/A0DuPICNcksGseGcZAZz1jB
QRcpfiOR6WrRHt26PbB/+g3dPQ6nppIQ5rffwSVdbx+sTDbr6UOAtopEd7mC1zzW
TjYofdt2kn4lYKSRzmrvv5Hk+7FkAzf5rb1WS50DU6pEZS9Qm5tvtGCAnp/9tYEI
RNiUUioK0Cq6bLnS25ZG6YQa68PCeQDG8PYrW0ak2a2cgoEx5nOiByhFCkBYrNkB
tZgrtOeadS/4gP+Enqi9n73tk4T/7ARKqBJhXrMzCvm/D+O8NY4VKjfCQ1ZOhDtq
ysaf5YIl5/dYssGhKfLYhwigjfKNj5125+YbKQ6FL6t4Yk+6y9fmkhea/Ms8SsV9
2aXqNFqlK/x1ZdFlLK+o3c5EkyPXVrdAQ2dEkbjrZLIfA5ERLniHWNe4fI42tFZ2
3L5JBjMhkyW/wxKipbWewBwNQwtUt22cAZLQDF/ucrMvkHPZyRkH+X8aFJ2NYNQg
czx+G/k2lIwjJ26J0YfttIt+Qs3oOiqZ2nKtHrEBdnQh9FeB5MAopymLzIN/PV9W
hPV+ct0z1mdqlQorAekI9gDuI1lN/Yf2FeaJ4jA30XUcQ/4A9LKVWjogIb66XI0E
G8M0rxqUMEWwMS4d3YkY3vg/a/RuXMM2vI08ZIVR7ZL5tQhRsBf9R9F6iY0Kjoz5
BD3Dqqd5uLyAjFSI7kod
=55ec
-----END PGP SIGNATURE-----

--yudcn1FV7Hsu/q59--
