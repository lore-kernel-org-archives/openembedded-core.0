Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id D9DD56BE39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 12:01:12 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id k45so15670637edb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 05:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=PTRyyqpBbNc1AsEv7/9n3uHpZODq3b7IfFuCKPM4wqI=;
	b=mCXuZRdtnDiukdV97fEGWypfs1+5ioSqVw/SncltDDL9Xdf0pH3N1yj5pgNRKXKrur
	eOv/orrKZu2IsS6bgp2jdnjTPvlFjiXHwG2Lx9Ipx9L4eXiUs6DyyMZNx5ZZaMQrhDCv
	cRcJA8ryEVLSCyhQPYEvOmSz53cCYH1lO9hic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PTRyyqpBbNc1AsEv7/9n3uHpZODq3b7IfFuCKPM4wqI=;
	b=bYbIgX8wqOqMcs96LhFikaiEHMU1Qij5pzUm865I7xLNI2cJ8EXpUXE7WWzpK4/kuR
	HHQdhVF5d3BYj0yg9B0U6dOCnxa/Go/ZodlVRJH//6Wm0DCT9GBrBTen/+dozGsMkXel
	I0uRx5kaXmIKDmbK5428bp7KQYAB0ZcREVY0LLjaOLnnCpxTSBR5YgA1vsHr6PaWidTA
	Hje5DJm7a4vQCZtdidiK6vBJ60RSdv6nYNLWfc4l+OIEcpqxY1CfPxaj8DAEmIBLRzmn
	R8Ukay2ih507svfxfS4DTbBLQcXXqtBlQsyegx2h4z5GQl37UcoqX8rMKzofgG246kE1
	Vyfw==
X-Gm-Message-State: APjAAAVyh3NWuFjYjV2A66bk/oVsEzXvjfrHmONfgamtBaruoDNXeRgS
	z37t9Bw/vsIP+bncxDcwJV5iVQ==
X-Google-Smtp-Source: APXvYqx4G3//soMlD+TxAiaUQape8omgmOdWEHcOL5fAgtfa4p36yLVK2YSqHfX3T4nEyZBJ6qztZw==
X-Received: by 2002:aa7:c38c:: with SMTP id k12mr20490616edq.33.1556107273503; 
	Wed, 24 Apr 2019 05:01:13 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	i41sm3801067ede.36.2019.04.24.05.01.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 05:01:11 -0700 (PDT)
Date: Wed, 24 Apr 2019 08:01:08 -0400
From: Tom Rini <trini@konsulko.com>
To: Tim Orling <ticotimo@gmail.com>
Message-ID: <20190424120108.GG31207@bill-the-cat>
References: <1555869425-7613-1-git-send-email-trini@konsulko.com>
	<1555869425-7613-2-git-send-email-trini@konsulko.com>
	<6d594af6f152f129047dd75c8d42a52e1c6e7687.camel@linuxfoundation.org>
	<20190423220106.GA30419@bill-the-cat>
	<e6b4feb2584669c83dabbf50761f2e68b990140f.camel@linuxfoundation.org>
	<20190424011742.GE30419@bill-the-cat>
	<CANx9H-DVnmfTte4yWsYWLcdh2pQWMNY8Eum9CyFJ=AisbVu=Pg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-DVnmfTte4yWsYWLcdh2pQWMNY8Eum9CyFJ=AisbVu=Pg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] vim: Update to 8.1.1198
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
X-List-Received-Date: Wed, 24 Apr 2019 12:01:13 -0000
X-Groupsio-MsgNum: 123677
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PyMzGVE0NRonI6bs"
Content-Disposition: inline

--PyMzGVE0NRonI6bs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 10:24:42PM -0700, Tim Orling wrote:
> On Tue, Apr 23, 2019 at 6:17 PM Tom Rini <trini@konsulko.com> wrote:
>=20
> > On Tue, Apr 23, 2019 at 11:22:14PM +0100,
> > richard.purdie@linuxfoundation.org wrote:
> > > On Tue, 2019-04-23 at 18:01 -0400, Tom Rini wrote:
> > > > On Tue, Apr 23, 2019 at 04:02:49PM +0100, Richard Purdie wrote:
> > > > > On Sun, 2019-04-21 at 13:57 -0400, Tom Rini wrote:
> > > > > > This brings us to the current version of vim.
> > > > > >
> > > > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > > > > ---
> > > > > >  meta/recipes-support/vim/{vim-tiny_8.1.1017.bb =3D> vim-
> > > > > > tiny_8.1.1198.bb} | 0
> > > > > >  meta/recipes-support/vim/{vim_8.1.1017.bb =3D>
> > > > > > vim_8.1.1198.bb}           | 2 +-
> > > > > >  2 files changed, 1 insertion(+), 1 deletion(-)
> > > > > >  rename meta/recipes-support/vim/{vim-tiny_8.1.1017.bb =3D> vim-
> > > > > > tiny_8.1.1198.bb} (100%)
> > > > > >  rename meta/recipes-support/vim/{vim_8.1.1017.bb =3D>
> > vim_8.1.1198.bb}
> > > > > > (98%)
> > > > >
> > > > >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/527
> > > >
> > > > Does the current version even work in this case?  Digging down into
> > > >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/527/s=
teps/7/logs/step1b
> > > > there's a certain level of "how does that even work today then?" th=
at
> > > > springs to mind.
> > > >
> > > > I need a few more details to know how to reproduce this locally as I
> > > > don't see whatever must be in site.conf/etc to turn regular poky in=
to
> > > > no-x11.  The errors are also around iconv stuff so maybe nls is also
> > > > removed here?  Thanks!
> > >
> > > perhaps simpler, qemux86-world also failed:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/515
> > >
> > > with:
> > >
> > > | /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/i58=
6-
> > > poky-linux/vim/8.1.1198-r0/recipe-sysroot-native/usr/bin/msgfmt: Cann=
ot
> > > convert from "ISO-8859-2" to "UTF-8". msgfmt relies on iconv(), and
> > > iconv() does not support this conversion.
> > > | make[2]: *** [gvim.desktop] Error 1
> > >
> > > So perhaps there is host contamination and this works one some build
> > > machine setups but not more minimal ones?
> > >
> > > The build configuration hasn't changed, just the new version upgrade
> > > and the other patch. I suppose its possible it depends which of our
> > > workers its built upon but that seems unlikely for two world failures
> > > (no-x11 is also a world failure).
> >
> > Current poky master-next + my patches (and bitbake -k'ing around
> > gobject-introspection-native failing to configure over passing
> > -Ddocs=3Dfalse) and vim builds on a FC29 "Cloud" image + documented
> > additional packages off of
> > https://www.openembedded.org/wiki/Getting_started
>=20
> Or you could use a CROPS container?
> https://hub.docker.com/r/crops/poky/

No, only in that I was looking to replicate a hopefully known failing
env (of which RP pointed to Centos and Fedora builders).

--=20
Tom

--PyMzGVE0NRonI6bs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcwFAEAAoJEIf59jXTHXZSae0P/j1TUi6yAwT54le6fywGeV/5
UMS/g6u9ITts5DeuE/7uJ2Q4zKhu+qAek8VaUbJvWv8CGsrirDFAS1J/YNnVQ0AQ
+7GXjdVvyVZuRZZocrlalmvhoUv0I3+W1oKoIb/qN6lBFDDF5eY4/Wglwa5glKLR
Hgackq/Glr4U0cR6rPrg5xoOrK2WCIOr2Gh7TNl7rCjXuG4fkpO3gbUA8d22KZ6K
MUhPagbhXxQHr7cbDegAzRVhbxweUSgIPxuPiLYN2KjtgI8ZhbVm4KM40j+QSDgR
QE9vqBN11GHwl80CPQO9y8MFeegRuAs9xEMqSTIXxrcbYD0dVxcQ6Npr/TkbmkGi
i9hzh+gMtfpSu8RFiOoRh6ezm+BCOAp9pQKmO0pq2VP/QCF5NuDKuLI4VVkuvu77
8y7L6LnX3t232ziJYfSsUT7m1I32kijPpVpdyTSxg0AqO2ATx8IjqfcsQaUxwqth
BoRG1ZyUApNF1Nd2XmX9nKIc55KINNmLkK3p+v7L86JDfLl4rDDgDRXdEOU2XnOp
3LaCFRw5fwgm5Imtlzj5LeqGRSqriXdoPUiq3kZcYOxjxKPjQY8w/HqziEIV7zNP
7epfhlICXWK/j4OYgA1m0RzIVduegjWCdTPFZcBiEj5VjbTj5dKUwD9YYDY8KXeU
A2qPO5ZV65+vbkjhwYsp
=QMKW
-----END PGP SIGNATURE-----

--PyMzGVE0NRonI6bs--
