Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7F34F7C72C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 11:13:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id j125so4272994wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 03:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version; bh=DE5p0XM9YVWNBHY2XFiSYQV3wrXx4v4FbOINauC3rgE=;
	b=TCEWIwl8fKyyXK8xNaXbOMR+N0/TeFCnABlZJfaCYT/hcsNAWShNI6uVVU2JNGU0NT
	jV0lX256+60rYezPD3l1xmAZEHsEFG0QIFeFtPsikNP7TZ629lwrUGNeAVwT/XrhgZnh
	cPgneg/SoLi/u2umsuwETaG9y21FyBq5UVLiOE/bFrlZ1XZYYVb5H90om3Fkq9DWs0S7
	WoqnU6l1QX1kIeJ6nOlXM+5R5FdBAC7JU5Rw+4Rp0GWEXlv3dfCS+Gs20WY9sjkQo20r
	bLUf1rCOQlYg3zOmZy5uAeej6j+yj9NzzeVoHISir6AyLfbC8tDjhb1+UUhwtyeVExxi
	dyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version;
	bh=DE5p0XM9YVWNBHY2XFiSYQV3wrXx4v4FbOINauC3rgE=;
	b=NSIzdRTQAqvwo886SWYf0BhpRAZLgiMtYO1IremSmVOtUsC98ES//2fA0o3amHN5Yu
	F+8F48+fOXuMigibjE/65iNIw02Rlksjt8+VuCj24YRoftm3S9ViItDR5GXgloBvNmK/
	6+Hyu/gXOHzLG3SUhi4PzqjcnmEIG6lvXC/OfR4jr0hvHN86ySzHB1s/l15WqEXH4NzD
	Fdt8NdyXAZ226OhX8eALhkqUK8zKe1q+xskIjzcrI3dVsK5n4daFYB0PB5P52i3xahQ/
	LqeyLKUB5Fvc+79eEDy74sN3XTYcTK/hPfDCNgLt5haofGoLz8241TZT/KOA2w8Tk093
	i68w==
X-Gm-Message-State: APjAAAXf+B4Ck65vWz1V11cGEWAQiemZacl7+RC4UYtCK1lPL9eL4hrw
	9LR6K/hkta+NmfbvWy4/deM=
X-Google-Smtp-Source: AHgI3IZo5KgvQts/akgQQvDHM6BBHED427H54TBXGLEGgYpeIQe97DD6E1EEYgV/0tQ+Jy2SOojNdQ==
X-Received: by 2002:a1c:6409:: with SMTP id y9mr11399831wmb.68.1551697986089; 
	Mon, 04 Mar 2019 03:13:06 -0800 (PST)
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:b00c:66c8:99df:336])
	by smtp.gmail.com with ESMTPSA id
	s127sm5834943wmf.39.2019.03.04.03.13.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 04 Mar 2019 03:13:05 -0800 (PST)
Message-ID: <32432494b9ff3df70ae416d6d080c95de16b5fe9.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Mar 2019 11:13:03 +0000
In-Reply-To: <5a3c4372a14a9c21b3b598e3662324681c7f0862.camel@linuxfoundation.org>
References: <20190228142745.23630-1-luca.boccassi@gmail.com>
	<20190301163639.26436-1-luca.boccassi@gmail.com>
	<c77e986f7f1db21123fa9f0eed5392b2562d2ce4.camel@linuxfoundation.org>
	<5a3c4372a14a9c21b3b598e3662324681c7f0862.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2] swig: fix build with musl
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
X-List-Received-Date: Mon, 04 Mar 2019 11:13:05 -0000
X-Groupsio-MsgNum: 121893
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-6SNJVbN7D6y9jqSJVd9r"

--=-6SNJVbN7D6y9jqSJVd9r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-03-02 at 23:03 +0000, Richard Purdie wrote:
> On Sat, 2019-03-02 at 18:12 +0000, Richard Purdie wrote:
> > On Fri, 2019-03-01 at 16:36 +0000, luca.boccassi@gmail.com wrote:
> > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > >=20
> > > Building with musl currently fails. The fix has been committed
> > > upstream, so backport it.
> > > Note that it requires the recent change to use autoconf's
> > > do_configure
> > > as it modifies a bison file which is used at make-dist time, so
> > > it
> > > triggers an autoconf rerun which was not working previously due
> > > to
> > > the
> > > custom do_configure step that was removed recently by:
> > > a9b1f9eca963 ("swig: Fix configure failure")
> > >=20
> > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > ---
> > > v2: fixed upstream metadata format in patch header
> >=20
> > Fails in testing:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/585
> >=20
> > May need a bison-native DEPENDS?

It does require bison, and I feel very silly as I have added it to the
internal build and forgot to include it in the patch! Sorry :-)

> I tried that, it fails with other problems :(
>=20
> For example:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/353
>=20
> Cheers,
>=20
> Richard

I thought that would have been fixed by:

95c78d2166d3 ("swig: Fix configure failure")

Upstream's configure step creates that directory that is missing and
causes the build failure showed by the logs. I thought avoiding a
custom do_configure would fix that, but evidently it doesn't!

I've sent a v3 with the bison dependency and with a workaround I've
successfully used in our internal build, which creates the directory
manually in a do_configure_append block.

Thanks for the review!

--=20
Kind regards,
Luca Boccassi

--=-6SNJVbN7D6y9jqSJVd9r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAlx9CD8ACgkQSylmgFB4
UWKiLQf6AtKwygCNhWUkcntAVSo3FS2QQIXgcDegqNC39OviDpP87EzSYAEBYxgy
MQFRfdvnMix0+j6qpo32F54Tth1UdOyD918+u0GAyqu+dEDwlvPanawuqQiT0TPE
OGPyPg9nx6+QfSzl9IuAkQfiAW0JrIbpD6eWXwKlPI0Bk6RuLYMrChQPCYrmnplO
+s1YmDfljZJbqiSpjbkR3Pr787l/udbgqJl+GtHPl1iozycEj88/moTodulo5dD/
xpajT8pVgDIBrYwWqkIJgc2hH4N9rfn9HxMLgNxqVXkvQjUnqCCi6tCrmaOoeNxa
KGtnW7ldGFyfw+JPr++vMxS33t7crA==
=/1gL
-----END PGP SIGNATURE-----

--=-6SNJVbN7D6y9jqSJVd9r--
