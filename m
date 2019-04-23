Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id C8F1B6C0F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 22:29:05 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id g6so14124187edc.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 15:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JP66MB4XxJoPznKAg87xR5iSUOw+Myk6fKDNSg1sIb0=;
	b=Xkbo/pdMGqpbTRHxRLyAY1qeJ3DzzHasT6xVal7dnZFtZNuw/K56punzQE/Hth3r6s
	+8UKTpXKq5hFuhHSIFndycVu5ouI+Z5s5431yDxjjCUH0pBTP6IFaBQ69omiCx1lfB6Q
	huK7t097jWZdE+RGXYaKpgzHq5igYHQ7vTdbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JP66MB4XxJoPznKAg87xR5iSUOw+Myk6fKDNSg1sIb0=;
	b=qm0vk7T+KO3OdWf978yjENPuU9XfQeZUwDJX0EFrF4puOHuFKod24porwB1qfpWORJ
	NNLsnVMJPuZppenFFVk0rYryRyMCYOKLvrqd9NU0A/Q3Xb2Qdg5cAGDbKf9NFSm1KWgN
	HwFSqxLTXQ3FwbhZWC8zyBJVXa4QN4E+rRRi6wBY0n+cEgbh6GL3QxEA9zvcs7Vh7MOr
	buH1owjudX6p1wbNN8eWqCQgF+n3oMwOISnZsrVi2c9w3GpcsXnNAjtCmrzGIHBYR0Sr
	cvPxchIfcG9kLnxSsIq+9KIsmRY2UROp51J6AozB0cfQytyZ/l7jMyxr+dtB6Olxblp5
	wxVg==
X-Gm-Message-State: APjAAAVdUROwobmYE7MYkGKeySMGdFsfiNsyH/iV40YNIQKVCBRGbCfI
	rIUY6eNySx1Bg1Z6ee6stJD+VQ==
X-Google-Smtp-Source: APXvYqzm4ehGPhvHHQjuRreliCmOs5vETxjOM79ad8NgkxeyDIdZF34vLz9Jk28ulT6Tyj5BNGEpAA==
X-Received: by 2002:a50:ac34:: with SMTP id v49mr17679245edc.52.1556058546447; 
	Tue, 23 Apr 2019 15:29:06 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147])
	by smtp.gmail.com with ESMTPSA id 5sm1732039eds.26.2019.04.23.15.29.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 15:29:05 -0700 (PDT)
Date: Tue, 23 Apr 2019 18:29:02 -0400
From: Tom Rini <trini@konsulko.com>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190423222902.GD30419@bill-the-cat>
References: <1555869425-7613-1-git-send-email-trini@konsulko.com>
	<1555869425-7613-2-git-send-email-trini@konsulko.com>
	<6d594af6f152f129047dd75c8d42a52e1c6e7687.camel@linuxfoundation.org>
	<20190423220106.GA30419@bill-the-cat>
	<e6b4feb2584669c83dabbf50761f2e68b990140f.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <e6b4feb2584669c83dabbf50761f2e68b990140f.camel@linuxfoundation.org>
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
X-List-Received-Date: Tue, 23 Apr 2019 22:29:06 -0000
X-Groupsio-MsgNum: 123643
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GpGaEY17fSl8rd50"
Content-Disposition: inline

--GpGaEY17fSl8rd50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 11:22:14PM +0100, richard.purdie@linuxfoundation.or=
g wrote:
> On Tue, 2019-04-23 at 18:01 -0400, Tom Rini wrote:
> > On Tue, Apr 23, 2019 at 04:02:49PM +0100, Richard Purdie wrote:
> > > On Sun, 2019-04-21 at 13:57 -0400, Tom Rini wrote:
> > > > This brings us to the current version of vim.
> > > >=20
> > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > > ---
> > > >  meta/recipes-support/vim/{vim-tiny_8.1.1017.bb =3D> vim-
> > > > tiny_8.1.1198.bb} | 0
> > > >  meta/recipes-support/vim/{vim_8.1.1017.bb =3D>
> > > > vim_8.1.1198.bb}           | 2 +-
> > > >  2 files changed, 1 insertion(+), 1 deletion(-)
> > > >  rename meta/recipes-support/vim/{vim-tiny_8.1.1017.bb =3D> vim-
> > > > tiny_8.1.1198.bb} (100%)
> > > >  rename meta/recipes-support/vim/{vim_8.1.1017.bb =3D> vim_8.1.1198=
=2Ebb}
> > > > (98%)
> > >=20
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/527
> >=20
> > Does the current version even work in this case?  Digging down into
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/527/s=
teps/7/logs/step1b
> > there's a certain level of "how does that even work today then?" that
> > springs to mind.
> >=20
> > I need a few more details to know how to reproduce this locally as I
> > don't see whatever must be in site.conf/etc to turn regular poky into
> > no-x11.  The errors are also around iconv stuff so maybe nls is also
> > removed here?  Thanks!
>=20
> perhaps simpler, qemux86-world also failed:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/515
>=20
> with:
>=20
> | /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/i586-
> poky-linux/vim/8.1.1198-r0/recipe-sysroot-native/usr/bin/msgfmt: Cannot
> convert from "ISO-8859-2" to "UTF-8". msgfmt relies on iconv(), and
> iconv() does not support this conversion.
> | make[2]: *** [gvim.desktop] Error 1
>=20
> So perhaps there is host contamination and this works one some build
> machine setups but not more minimal ones?

Hmm, could be.  I assume there's not currently a minimal Docker (or,
whatever) image to grab and build off of (I just spent some time setting
up such a thing for U-Boot) ?  It looks like I can setup a minimal
Fedora chroot without too much work, so I'll pencil in some time to make
that, install the normal documented must-haves and see what I can make
blow up.  Thanks!

--=20
Tom

--GpGaEY17fSl8rd50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcv5GtAAoJEIf59jXTHXZS9LEQAIrbOKkL8vbJ3eXS71iufHzS
6JFH8dm/oHBpfOhOtZhV+sWVL+OC/MUvTBT8rSSGtXQ/OYEtaz/o4rAyxfCMMxwI
cfrTxfYzBe8ytnBrSFHYALv/i0EPCSl5of3PdrvrnJERgs0eagA/rfHPxuXDKOix
5yybEf6B+SpFmozt+lsGKNAQZv1lPDNDzXbJ4l58BNzCkBJN9TdcLsNkFuEpnlua
ICuVPD3BpsBbC/uttx4h30tW3B2qtkE/z9rLnhht4xIM6pG7fBLvmCFH2KnuaswY
sZC+bXyN/szLiLgTzFs8HyASbcBYOCvZ7LD1g9j2wkagYva8RHaOXfZ+FRXRO9d9
uBXni1l90bBwEYzmxwbNib99Bh3ex2hvUiHCBxRJSPRakveYlexOkHAAU3wAPt6P
UsLd0LffWsfaDMSKVojAsBz2WVKRVBc7M5LMMDEeBHf+zs98+xQ2NNjoSWHbRUEx
U9dc3FxrqyHkgK99amHhmD9KnXPhZKXfKQRRCo1vWdWOBZQdeBGCQESLp/Rt8vK+
WsT1wHfbGlmxD/ZU065winKoN0tj1PsYyoYlwzIEpYMSIYMZDyvSkg3At2kyCQDv
iCQbxm213Hh7wAaGC2oPH9Em6/wWVYHrhcvtW2vPQzO8HD3Tw0drtQZR6bnWqkyQ
PDMmfaoIUmh8hi4mv+G5
=VZA4
-----END PGP SIGNATURE-----

--GpGaEY17fSl8rd50--
