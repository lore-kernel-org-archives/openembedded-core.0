Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 966FC7D3AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 11:29:47 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id y67so15608769ede.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 04:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4Z7oAL1Q3PSGAg7au6NfyTL6Z1iuP9UdVl8u88rsw88=;
	b=KHqVpLb7/0gT/RxoQVnpLpeQ+J6k4/J+H1iooWUfQqUzGNqrWGZ+Lw7ZVMAu4ePRnS
	xHONnjjkC/cIvxWiQNLCMz02SklvjI2EG3oEWRgpBC8mXkudyJvRXKEadmFiI34VmuUJ
	L+G7KTMhnUbJpZM+aoZhrZunw0f7Ltp1ihE38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4Z7oAL1Q3PSGAg7au6NfyTL6Z1iuP9UdVl8u88rsw88=;
	b=jm+CC2ylPav0Fx/Ech0HHrtHtvoEuflZ6hC3eZ2CHzO/ZOu7uML5MMTltWZ2Y32XSx
	SMQt1rGG99kiJjlY4b0vqRASgcvNnW/forblbNXMb2YAVutFhNuQTN18qiQvUudeXNQL
	8TdaAq2DBCuC2ANn1AjyxQinPKwTTJJgLzqZgR4/+tBJP5W9g0Zv8f1ZnKDSrEVUGqr1
	IjOLT/S+yIOin6TyAM8A6jsJeP35fVepEnM9LXeugP3dfjcy8F4McNWD62k3rA8XQuUw
	S/PwNtgIFUndhVJqvseDzwSJlo2+9bwp1tM5fEFGBkAMuu4MjGu8bJc8erysrX1cue0t
	1n4g==
X-Gm-Message-State: APjAAAV2WSEghJ1elrWOAhHgXg52KGw8YnaRPcTQD/2q6qOVuA+qyXeN
	edAp/xDN9WtoaAxSxg9L57HTeQ==
X-Google-Smtp-Source: APXvYqz5dRcpbWj0XnSpAIg9B+kFLSw1dv/XrZOt3+5Xg9GxHK6BxnIHoAO1+agYb7t/FXVJA+WNKg==
X-Received: by 2002:a50:9eec:: with SMTP id a99mr19770545edf.186.1556105388279;
	Wed, 24 Apr 2019 04:29:48 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147])
	by smtp.gmail.com with ESMTPSA id c45sm455667edb.69.2019.04.24.04.29.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 04:29:46 -0700 (PDT)
Date: Wed, 24 Apr 2019 07:29:43 -0400
From: Tom Rini <trini@konsulko.com>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190424112943.GB31207@bill-the-cat>
References: <1555869425-7613-1-git-send-email-trini@konsulko.com>
	<1555869425-7613-2-git-send-email-trini@konsulko.com>
	<6d594af6f152f129047dd75c8d42a52e1c6e7687.camel@linuxfoundation.org>
	<20190423220106.GA30419@bill-the-cat>
	<e6b4feb2584669c83dabbf50761f2e68b990140f.camel@linuxfoundation.org>
	<20190424011742.GE30419@bill-the-cat>
	<f0092d0d82b7fe8fda61bb0baee724926264820f.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <f0092d0d82b7fe8fda61bb0baee724926264820f.camel@linuxfoundation.org>
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
X-List-Received-Date: Wed, 24 Apr 2019 11:29:47 -0000
X-Groupsio-MsgNum: 123675
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline

--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2019 at 08:40:01AM +0100, richard.purdie@linuxfoundation.or=
g wrote:
> On Tue, 2019-04-23 at 21:17 -0400, Tom Rini wrote:
> > On Tue, Apr 23, 2019 at 11:22:14PM +0100,=20
> > richard.purdie@linuxfoundation.org wrote:
> > > On Tue, 2019-04-23 at 18:01 -0400, Tom Rini wrote:
> > > > On Tue, Apr 23, 2019 at 04:02:49PM +0100, Richard Purdie wrote:
> > > > > On Sun, 2019-04-21 at 13:57 -0400, Tom Rini wrote:
> > > > > > This brings us to the current version of vim.
> > > > > >=20
> > > > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > > > > ---
> > > > > >  meta/recipes-support/vim/{vim-tiny_8.1.1017.bb =3D> vim-
> > > > > > tiny_8.1.1198.bb} | 0
> > > > > >  meta/recipes-support/vim/{vim_8.1.1017.bb =3D>
> > > > > > vim_8.1.1198.bb}           | 2 +-
> > > > > >  2 files changed, 1 insertion(+), 1 deletion(-)
> > > > > >  rename meta/recipes-support/vim/{vim-tiny_8.1.1017.bb =3D>
> > > > > > vim-
> > > > > > tiny_8.1.1198.bb} (100%)
> > > > > >  rename meta/recipes-support/vim/{vim_8.1.1017.bb =3D>
> > > > > > vim_8.1.1198.bb}
> > > > > > (98%)
> > > > >=20
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds=
/527
> > > >=20
> > > > Does the current version even work in this case?  Digging down
> > > > into
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5=
27/steps/7/logs/step1b
> > > > there's a certain level of "how does that even work today then?"
> > > > that
> > > > springs to mind.
> > > >=20
> > > > I need a few more details to know how to reproduce this locally
> > > > as I
> > > > don't see whatever must be in site.conf/etc to turn regular poky
> > > > into
> > > > no-x11.  The errors are also around iconv stuff so maybe nls is
> > > > also
> > > > removed here?  Thanks!
> > >=20
> > > perhaps simpler, qemux86-world also failed:
> > >=20
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/515
> > >=20
> > > with:
> > >=20
> > > > /home/pokybuild/yocto-worker/qemux86-
> > > > world/build/build/tmp/work/i586-
> > > poky-linux/vim/8.1.1198-r0/recipe-sysroot-native/usr/bin/msgfmt:
> > > Cannot
> > > convert from "ISO-8859-2" to "UTF-8". msgfmt relies on iconv(), and
> > > iconv() does not support this conversion.
> > > > make[2]: *** [gvim.desktop] Error 1
> > >=20
> > > So perhaps there is host contamination and this works one some
> > > build
> > > machine setups but not more minimal ones?
> > >=20
> > > The build configuration hasn't changed, just the new version
> > > upgrade
> > > and the other patch. I suppose its possible it depends which of our
> > > workers its built upon but that seems unlikely for two world
> > > failures
> > > (no-x11 is also a world failure).
> >=20
> > Current poky master-next + my patches (and bitbake -k'ing around
> > gobject-introspection-native failing to configure over passing
> > -Ddocs=3Dfalse) and vim builds on a FC29 "Cloud" image + documented
> > additional packages off of
> > https://www.openembedded.org/wiki/Getting_started
>=20
> Something odd is going on as I tried this on my local build system and
> that failed the same way as the autobuilder. That is an ubuntu 18.04
> system, nothing special. I guess this means I should try and figure out
> why it breaks. I still suspect something about the native locales
> installed...

Very strange, yeah.

> The gobject-introspection-native issue was dropped from -next fwiw.

OK.

> What does "locale -a" show for you?

On Fedora Core 29:
C
C.utf8
en_AG
en_AG.utf8
en_AU
en_AU.iso88591
en_AU.utf8
en_BW
en_BW.iso88591
en_BW.utf8
en_CA
en_CA.iso88591
en_CA.utf8
en_DK
en_DK.iso88591
en_DK.utf8
en_GB
en_GB.iso88591
en_GB.iso885915
en_GB.utf8
en_HK
en_HK.iso88591
en_HK.utf8
en_IE
en_IE@euro
en_IE.iso88591
en_IE.iso885915@euro
en_IE.utf8
en_IL
en_IL.utf8
en_IN
en_IN.utf8
en_NG
en_NG.utf8
en_NZ
en_NZ.iso88591
en_NZ.utf8
en_PH
en_PH.iso88591
en_PH.utf8
en_SC.utf8
en_SG
en_SG.iso88591
en_SG.utf8
en_US
en_US.iso88591
en_US.iso885915
en_US.utf8
en_ZA
en_ZA.iso88591
en_ZA.utf8
en_ZM
en_ZM.utf8
en_ZW
en_ZW.iso88591
en_ZW.utf8
POSIX

And then my Ubuntu 16.04 regular build env:
C
C.UTF-8
en_AG
en_AG.utf8
en_AU.utf8
en_BW.utf8
en_CA.utf8
en_DK.utf8
en_GB.utf8
en_HK.utf8
en_IE.utf8
en_IN
en_IN.utf8
en_NG
en_NG.utf8
en_NZ.utf8
en_PH.utf8
en_SG.utf8
en_US.utf8
en_ZA.utf8
en_ZM
en_ZM.utf8
en_ZW.utf8
POSIX

--=20
Tom

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcwEinAAoJEIf59jXTHXZS3DcP/17TWdlLn5YktKCjm938G/MF
bMtvl4vZeHh9Ci+lOOHkOWO4BU+jxTKfX8qc0UbbKcrGRZi4RiNyau+uyy++MTS7
JdkqZRKlvv8+jXPi8rzvLrwgsUl2LRg2yCyAhwxy4tw87rhsrO+7A2nsi2VTZU8b
Cl254/juM2yjNT7yTyhG3nLAVCH83Kl5pSa6eQXOBFCoTWwHp7Qc1+Yd5DACpWDz
jZA9EaUTizLEqBfMkh9jf/9hEA7if2C6iERjputI70McAV+soiyohZqNra3E6DE8
nCK0n91Pdh9VAZlVlRmZXFgOpAdVVgUV2lLT5PjGRz+JPPqqY4GIgWXgaWHWp7tZ
g0TIgQwVHosW2yYkhFUelEaWfOu/zjHe5ztpCQwGYausgRkCpD+xYZUhWc12LMqX
/NvXINLzi+mxPGJmY9d98fzjzqoA1clTPPkfQTJHM8q2DWCCFdL3nPEBekBCwA9p
UdeUSeFIKV91Qdj4dnzEWiRqAJWt5ugDSUZMo+GlSgR4UD+wrl8ucLHTwJt5lcO6
1ReJWwRLtRVlPuWHnmGQF+eaIxJ3oKICF+VIYGeAnEMjn3kue3xEy9k2uAmKxfL6
wvX4Akze2Yd8FqqgzXv1fpeM1T3TAtkxkCqz9Tpdwgiw3z4PXJWBFj50UPgxbpxq
sDikbm48JgHlDi3YPcQO
=kctq
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
