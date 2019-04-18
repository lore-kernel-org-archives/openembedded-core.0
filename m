Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 586F760053
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 11:13:03 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w10so2498752wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 04:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Pk1Kys7u1VEdJkh7cQ8L4gb9UsfnkMAh7/XYT/G+UKE=;
	b=q1PibtVZZU16riygB8IhyEgzKzI6eFR8xaL2KrrzjyODi+tzxTp2X3Nxww4SFfarC8
	u43zXkMFuPzuiMRScsW+nZNMRXAmSrjVRnUB9WgAPeW/KRV0JEw+knhCz7dA6K+uGeOc
	9inCCLWtWIVLuDtOLuzupXqcxXR+6v7amgt4a3E5d2yA98RCltW69UK0dgyxIUBm9sjb
	oUG2a/Ue7WmdiPeF4sDjqyIA8Ajkbkc/OgHYJvli06/NqArniiJJ7PgXphhckriVizLB
	NtVBlwWKOukfRDpyWpOMTUgZE5+n9+5KWPrOlA7jZR4OE7gtgvwuebzb5LgqtP1/nZ5H
	+ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Pk1Kys7u1VEdJkh7cQ8L4gb9UsfnkMAh7/XYT/G+UKE=;
	b=pmqS4B9bYe8Rl6pSQtLbbE8jgaeTe0a6RyYi0EgPTO0YqarnIAU5NZz3i52ittUXPN
	GPC64YTHYQou+LDhItBqrLsTySELwSWHHWS5La9JmHv2AEplkGjdPmF0JdCXMkncKTOQ
	WToelTjtQ9qW1eb7e5LiRrpDUJIx8BxU4dONflwLMPiNy379AiUnR2Fdl7EV5Ae78qfu
	r8LLV9iUKC7vH+GuT69HNqMpcTcuFeA6q8n0wXIW/gylBjhtEywLCYTDw73hlbGJK8w9
	f/cSRz5Ph/BV38Ke3wDNgrOxQ4uQpBQ98Xf9VIMvswNwqbTPHs5jjpjVpxy8Ym5EECzZ
	enIQ==
X-Gm-Message-State: APjAAAUqAn4C5OYxi8VOEx/Fr6j16vVp2ef8BmhOGiePSeI8G0+uhppx
	5I668cbxQUHsmKXE0nWxEr03RyLw
X-Google-Smtp-Source: APXvYqydoD8sO0ZaS8Zh/Ifx2+W1xRykWt/SfCimrKsfhK5PuvQfZ5rAl0bOc0unstauqNGDlM9pnQ==
X-Received: by 2002:adf:f285:: with SMTP id k5mr47772798wro.110.1555585983428; 
	Thu, 18 Apr 2019 04:13:03 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 67sm1799249wmz.41.2019.04.18.04.13.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Apr 2019 04:13:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 18 Apr 2019 13:13:06 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20190418111306.GA1545@jama>
References: <20190328102139.23427-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190328102139.23427-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [PATCH] glibc: always use bfd linker
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
X-List-Received-Date: Thu, 18 Apr 2019 11:13:03 -0000
X-Groupsio-MsgNum: 123510
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2019 at 10:21:39AM +0000, Martin Jansa wrote:
> * Work around broken ld-2.29.so when gold is used
>   causing qemu-arm to segfault during e.g. gobject-introspection
>   or postinst at do_rootfs time, more details in:
>   http://lists.openembedded.org/pipermail/openembedded-devel/2019-March/1=
98937.html
>   https://sourceware.org/bugzilla/show_bug.cgi?id=3D24148
>   https://sourceware.org/bugzilla/show_bug.cgi?id=3D10937
>   https://sourceware.org/bugzilla/show_bug.cgi?id=3D18103

ping.

RP: I know you said on IRC that it's late for warrior and you were
hoping for khem's opinion, is it now acceptable at least for master?

Here is Khem's reply in the other thread about this:
http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280546=
=2Ehtml

and Trevor's testing confirms that it's not only issue when
gold-built-libc is used by qemu, but it kills init in runtime as well:

[    4.140000] Kernel panic - not syncing: Attempted to kill init! exitcode=
=3D0x0000000b

http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280605=
=2Ehtml
http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280610=
=2Ehtml

Unusable libc on arm is a bit sad start for warrior build :). Using bfd
like it was in thud seems like reasonable work around even when we don't
fully understand the internal details why it fails with gold.

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc_2.29.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/gl=
ibc/glibc_2.29.bb
> index 9184c5932c..073d1533e3 100644
> --- a/meta/recipes-core/glibc/glibc_2.29.bb
> +++ b/meta/recipes-core/glibc/glibc_2.29.bb
> @@ -110,7 +110,7 @@ do_configure () {
> =20
>  do_compile () {
>  	# -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if anothe=
r glibc is in staging
> -	unset LDFLAGS
> +	LDFLAGS=3D"-fuse-ld=3Dbfd"
>  	base_do_compile
>  	echo "Adjust ldd script"
>  	if [ -n "${RTLDLIST}" ]
> --=20
> 2.17.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXLhbwQAKCRA3VSO3ZXaA
HB6uAJ4mCsxJwKcysFBVr0kcTy/B0tSVtQCdH8MoOSGDcST24iyfl6JGyR9g53c=
=jh18
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
