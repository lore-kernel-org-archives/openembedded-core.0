Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SM8Eh-0002z7-Pj
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 03:38:39 +0200
Received: by lbjn8 with SMTP id n8so4941919lbj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2012 18:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=HQSjZ/RZ+3vn2GTCEIpbutz6XztBu5JpeGtfZLX2KSs=;
	b=kEm1oyfBBsp+tFbsojYym2YyNuqLu8V8xg2Nu4RCCKwyvXCMEQaYQ5mG/fqbKd6k/7
	V3ScE795Lo1UsGy/IB98FGjE2l6JxQIcfT6YrU/xLzu2chgEYbA98TAinIBfdKq5KEu0
	aDFhvIeFCgqrVP0+ZecTLYcm22ZsPcMciUlkZzWLK2CDSf8GEWLihwjLDLQ5iJwDQRcP
	TFr7bm9rlMlZ0hxoB6WQPemBvu5lruF/eHPL/HL5D+gqOhRQYsoJXIk9bP7CdUwVr5Pn
	ZDsyECKkF4Y0jsK66Up4BJmTof2dr6+tb0bTC09LsTZTwopXFZeLv2B4FZiPAY4Fg1lq
	gzqg==
Received: by 10.152.111.198 with SMTP id ik6mr13574410lab.38.1335144546816;
	Sun, 22 Apr 2012 18:29:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sun, 22 Apr 2012 18:28:36 -0700 (PDT)
In-Reply-To: <CAJtrzLMRLjgiP82w-=bg4wmtiwiRpkv3Q+sh006YG-ZO4vND4w@mail.gmail.com>
References: <CAJtrzLNJgu-Joix2YMbeZEjm1=Ktap80i4N0OsjFZsCHDmmOSg@mail.gmail.com>
	<CAJtrzLMRLjgiP82w-=bg4wmtiwiRpkv3Q+sh006YG-ZO4vND4w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 22 Apr 2012 18:28:36 -0700
Message-ID: <CAMKF1sriJpkRX_zO21K3hqPRCyw_8qZ9YiJjRbrvUxy7L2xP7Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: uclibc SDK not including libpthread_nonshared.a
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Apr 2012 01:38:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 22, 2012 at 4:47 AM, Mark Norman <mpnorman@gmail.com> wrote:
> --- a/meta/recipes-core/uclibc/uclibc.inc
> +++ b/meta/recipes-core/uclibc/uclibc.inc
> @@ -48,9 +48,7 @@ RDEPENDS_${PN}-dev =3D "linux-libc-headers-dev"
>
> =C2=A0INHIBIT_DEFAULT_DEPS =3D "1"
>
> -PACKAGES =3D+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv
> uclibc-thread-db uclibc-argp uclibc-backtrace"
> -PACKAGES =3D+ "uclibc-libcrypt uclibc-libintl uclibc-libnsl
> uclibc-libresolv uclibc-libm"
> -PACKAGES =3D+ "uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-libr=
t"
> +PACKAGES =3D "${PN}-dbg ${PN} ldd ${PN}-utils ${PN}-utils-dbg
> uclibc-thread-db uclibc-gconv ${PN}-dev ${PN}-staticdev ${PN}-doc
> uclibc-argp uclibc-backtrace uclibc-libcrypt uclibc-libintl
> uclibc-libnsl uclibc-libresolv uclibc-libm uclibc-libdl uclibc-libutil
> uclibc-libpthread uclibc-librt"
>
>
> Doing this caused the _nonshared.a libraries to successfully get
> packaged in the -dev package.
>
> Is this the correct way to get this to work? =C2=A0If so I am happy to
> submit a proper patch, otherwise is there something else I am missing?

This is OK. can you submit this as a proper patch please.


