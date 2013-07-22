Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6CE7360629
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 12:59:04 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id m14so3777200eaj.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 05:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/h3W07Rq6BLOHza4yy4aGLhnOo6foKpiqypl5epj+Zc=;
	b=T1vyrXJUuBC14ID+kZZLp0NxJb8NGTASMmUDi10xE4NAU0H9qOD5Il3L9YzZmeqMK5
	Id6YKQ6EzYDh0Ria8f+abC8ZjB429ifNvt+GWUYDx8ehUmmOE1SI6x/MlceuVWWRXm8O
	CLJWl458b7UkMz1bxcrIVaCo0KLuKQACuJIWwSBN8LcrC3OfOmvauxh22K+BBdyelNf/
	o7uH3kb0f4lYXC0uewjWi06wFP6uFsqQDe5BB97NqRCk5uKu/6ELDrl00Sws77NXGbp/
	pC/ulRQZmS/MG1jbp7sb/pNZeY75Z4P9mza9MRyGGqOA3YYRQhiyxbPZylJMzpytlvZC
	JjaA==
X-Received: by 10.15.93.134 with SMTP id w6mr27766954eez.25.1374497944691;
	Mon, 22 Jul 2013 05:59:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm50624772eed.9.2013.07.22.05.59.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 22 Jul 2013 05:59:04 -0700 (PDT)
Date: Mon, 22 Jul 2013 14:59:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130722125925.GJ9527@jama>
References: <cover.1374332196.git.Martin.Jansa@gmail.com>
	<8c70a1c4daf74d5a248237f22b0f58c331b681da.1374332196.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8c70a1c4daf74d5a248237f22b0f58c331b681da.1374332196.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 6/8] gst-plugins-bad: add few more PACKAGECONFIGs
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
X-List-Received-Date: Mon, 22 Jul 2013 12:59:04 -0000
X-Groupsio-MsgNum: 42273
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GlnCQLZWzqLRJED8"
Content-Disposition: inline

--GlnCQLZWzqLRJED8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 20, 2013 at 04:57:23PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb=
 b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
> index 7e80ce4..40accfa 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
> @@ -24,6 +24,14 @@ PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,=
curl"
>  PACKAGECONFIG[rsvg] =3D "--enable-rsvg,--disable-rsvg,librsvg,"
>  PACKAGECONFIG[orc] =3D "--enable-orc,--disable-orc,orc"
>  PACKAGECONFIG[neon] =3D "--enable-neon,--disable-neon,neon"
> +PACKAGECONFIG[mms] =3D "--enable-mms,--disable-mms,libmms"
I'm sending updated patch, this should be --enable-libmms.

> +PACKAGECONFIG[cog] =3D "--enable-cog,--disable-cog,libpng"
> +PACKAGECONFIG[faad] =3D "--enable-faad,--disable-faad,faad2"
> +PACKAGECONFIG[jp2k] =3D "--enable-jp2k,--disable-jp2k,jasper"
> +PACKAGECONFIG[modplug] =3D "--enable-modplug,--disable-modplug,libmodplu=
g"
> +PACKAGECONFIG[opus] =3D "--enable-opus,--disable-opus,libopus"
> +PACKAGECONFIG[sndfile] =3D "--enable-sndfile,--disable-sndfile,libsndfil=
e1"
> +PACKAGECONFIG[vp8] =3D "--enable-vp8,--disable-vp8,libvpx"
> =20
>  ARM_INSTRUCTION_SET =3D "arm"
> =20
> --=20
> 1.8.3.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GlnCQLZWzqLRJED8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHtLK0ACgkQN1Ujt2V2gBx69QCcCEs7ba/a+BzylrA7ecsD1LXx
D68AnAluKpAOLQtOyvCzm69SPd4d//fa
=et+j
-----END PGP SIGNATURE-----

--GlnCQLZWzqLRJED8--
