Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5865960197
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 09:37:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y17so6270814wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 01:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=nX+F8tAMiPXLZYHZkheDAtAKGI+/0uG8br2+yaosGPM=;
	b=CYAn9LX7GgHSgvFaNtrd8MCdyxn7+VxJp3bW68Bnas7QbN8VExtupf7K/GtveFvC2e
	WIXGFFpNQaI318bWjz6aS+yccZiL2UpFfu6CECtz7cEbvCp9d5E8J4wYL3fIrTWR6z66
	vREC3og/24hiLrK2Mds3I/4xAH0TO0SAU/9s0Vcxf16VRWRuLHjmxIKs6+OmxfIR7P5e
	Md1rBkg20Kzhrx1i/ow0A89B7YPC2+Xfcmn0N70IMDTJCPaopAFjai+RzqznSMbIXMyc
	KVTkLBc4Y4W9euTvDYIuBXN8dpTp1RYF9Rl+LW8uMsnnyZOkWclE/UyM1gkN8Mbo/yFy
	ud3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nX+F8tAMiPXLZYHZkheDAtAKGI+/0uG8br2+yaosGPM=;
	b=HxC9dRn2oXcdnui9/AG/JHlhcITq50d849qE94GTbAV7MHN+71IfOC2M3KMG8T+S1L
	hDTtybydfXPN43V9zVflqpvH6hcZk4C4hUJkFcbZHCjLkYcR1NJ2jIU22jU6YWco4XJc
	ysKiPhB1obcNh9hVgbD7sCqPSkO3JTWNM+fLXgL4Or2RhHzLdGd+8lC200SXbA5xIhpm
	8KdHH7qPvhfkark8+BTVtG6eZpRI+tgjVEVvJwKZIktrnPN9NR30sf+fyAzo3sxL/LKb
	C42zdlPIxlW4QpTnX/SYTvEiLkcl0evFf1haYPw8Li7ATdJ3oYHkt0Ifkij+4zMGup4/
	mItA==
X-Gm-Message-State: APjAAAV6enBbvxG1hkpajn8ghnAg2gz/TscDvzyfIehb+/26wfwEi05i
	8xl62Ap91puWlVlMUZcHrxLEx+zF
X-Google-Smtp-Source: APXvYqz7LH2iWex2oH6GmJ1G0ppOEaAItV8IcyIk4zRWT1amXkeFMAQWJwWOv+WfHROeRKrFEEz3cQ==
X-Received: by 2002:a5d:4ed0:: with SMTP id s16mr2937679wrv.144.1580981844917; 
	Thu, 06 Feb 2020 01:37:24 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id d13sm3435215wrc.3.2020.02.06.01.37.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 01:37:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 6 Feb 2020 10:37:23 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200206093723.6hq2anenujgnqiq5@jama>
References: <20200205010819.4172914-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200205010819.4172914-1-raj.khem@gmail.com>
User-Agent: NeoMutt/20180716
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bison: Upgrade to 3.5.1
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
X-List-Received-Date: Thu, 06 Feb 2020 09:37:24 -0000
X-Groupsio-MsgNum: 134583
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yor25h3jvqko374v"
Content-Disposition: inline

--yor25h3jvqko374v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2020 at 05:08:19PM -0800, Khem Raj wrote:
> Minor upgrade on 3.5 release series

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Minor upgrade with added benefits that bison-native doesn't fail to
build for me when using yoe-distro. Strangely I haven't seen this error
in any other build yet.

86_64-linux/bison-native/3.5-r0/recipe-sysroot-native/usr/include -O2 -pipe=
 -c -o lib/libbison_a-pipe2.o `test -f 'lib/pipe2.c' || echo '../bison-3.5/=
'`lib/pipe2.c
In file included from ../bison-3.5/lib/pipe2.c:25:
=2E./bison-3.5/lib/binary-io.h: In function '__gl_setmode':
=2E./bison-3.5/lib/binary-io.h:52:10: error: 'O_BINARY' undeclared (first u=
se in this function)
   52 |   return O_BINARY;
      |          ^~~~~~~~
=2E./bison-3.5/lib/binary-io.h:52:10: note: each undeclared identifier is r=
eported only once for each function it appears in
=2E./bison-3.5/lib/pipe2.c: In function 'rpl_pipe2':
=2E./bison-3.5/lib/pipe2.c:70:43: error: 'O_BINARY' undeclared (first use i=
n this function); did you mean 'SET_BINARY'?
   70 |   if ((flags & ~(O_CLOEXEC | O_NONBLOCK | O_BINARY | O_TEXT)) !=3D =
0)
      |                                           ^~~~~~~~
      |                                           SET_BINARY
=2E./bison-3.5/lib/pipe2.c:70:54: error: 'O_TEXT' undeclared (first use in =
this function); did you mean 'F_TEST'?
   70 |   if ((flags & ~(O_CLOEXEC | O_NONBLOCK | O_BINARY | O_TEXT)) !=3D =
0)
      |                                                      ^~~~~~
      |                                                      F_TEST
make: *** [Makefile:4827: lib/libbison_a-pipe2.o] Error 1
WARNING: exit code 1 from a shell command.

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/bison/{bison_3.5.bb =3D> bison_3.5.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/bison/{bison_3.5.bb =3D> bison_3.5.1.bb} (9=
0%)
>=20
> diff --git a/meta/recipes-devtools/bison/bison_3.5.bb b/meta/recipes-devt=
ools/bison/bison_3.5.1.bb
> similarity index 90%
> rename from meta/recipes-devtools/bison/bison_3.5.bb
> rename to meta/recipes-devtools/bison/bison_3.5.1.bb
> index 3d8f6579b9..e70252d974 100644
> --- a/meta/recipes-devtools/bison/bison_3.5.bb
> +++ b/meta/recipes-devtools/bison/bison_3.5.1.bb
> @@ -17,8 +17,8 @@ SRC_URI =3D "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
>  # No point in hardcoding path to m4, just use PATH
>  EXTRA_OECONF +=3D "M4=3Dm4"
> =20
> -SRC_URI[md5sum] =3D "c0230be066069f33c8445766833f3205"
> -SRC_URI[sha256sum] =3D "55e4a023b1b4ad19095a5f8279f0dc048fa29f970759cea8=
3224a6d5e7a3a641"
> +SRC_URI[md5sum] =3D "6fc5fa4488832a65db934b9e93bd5d4c"
> +SRC_URI[sha256sum] =3D "3e7e097bd9709a2d5e40e69446b74b149733b3de864fadb7=
a9b54eca7b2a4dd0"
> =20
>  inherit autotools gettext texinfo
> =20
> --=20
> 2.25.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--yor25h3jvqko374v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXjveUgAKCRA3VSO3ZXaA
HAP9AJ9D1vgb1lcGaPKxQDRMvNxaCLTnBQCgqiLvcdUxa/6qWGROm2JZ7QGGvEc=
=vhUR
-----END PGP SIGNATURE-----

--yor25h3jvqko374v--
