Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id D2C137BDAE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 09:37:54 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id l15-v6so10331015lja.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 01:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=P4sh0FkEe//h5M8vcgOS66lUz8iSxa8Hmqtitu6HMm4=;
	b=IQHH8FYmkmImN5dqpTm78U5jny4tnUGyrueyfC9ATB5NgMsSGT8JC7HwACbhUCLSxY
	VpOFD55gbUs5jrW1PGUMqec7RgvCk6lwOrvMO5dbuSzXW/I0AYufSBarxO+AWfpnjyDt
	PIXY9NDxjXSphKHuwXEpWcOL+fIkcdeDVuxcGpop3pM3eKJ5OvGNFOYNzMrlMQbv65YW
	k9Lz4k/7SX/jCK/OlqHzuRwoJPCaopP74RwCkn0vYF2e6JGAJ92y2j0Behr3NmExtvss
	pou8Z/LeTK9hTnPBrLaFJf++ERUbcUqxNA+ZpFAZa6LuqbhnMeTAxaVWsIazF5pBvzkF
	MICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=P4sh0FkEe//h5M8vcgOS66lUz8iSxa8Hmqtitu6HMm4=;
	b=Q6udM78NtJczUHO6CRZpd9AYTpoTJF8bF/Tw+xtz2cl8dBZY52Y39zN6Iwu4kndlt0
	8RGK81m9ZCZwSqEeznLBVitn6sOsK5a5o9si/g69kBDu+nljupFjoiWygIucBOLVIHeJ
	/9tpd1YadfPGvOLYs1ddMkgvo8hJDB6qRQfunntnl9ceZEyIEXKF57YBLccN4XTqeDVm
	QoBJuvEWVXMkabpMIo7gPTWkIVRAxDLX/68FYuyF5bIlatDqi5+vkr30zs7G4RiLbGgX
	ULmoWOMxwwllr+R/UxFq3DLLOeVwY5mTJVkckyiCb+g1EWpt2BLUbNNpQjXsrn9Hd/k5
	qF6Q==
X-Gm-Message-State: AA+aEWYHYaJjm0NDIP1j3jquvjg4CGBrcqGSa7PHZw+vATflmywPMtc0
	YBWVfSv/c0r31An7a8oUr+dz8nLY
X-Google-Smtp-Source: AFSGD/UZwb6YAeGtUSzCEjRJuq6J/Csh4ulRLQ7/4y9X8HOT/UK+OxTzAwCqzqaR83sl4yGGj4Lm0g==
X-Received: by 2002:a2e:449c:: with SMTP id
	b28-v6mr6824190ljf.47.1545039475121; 
	Mon, 17 Dec 2018 01:37:55 -0800 (PST)
Received: from tuxracer.as41781.net (nat18.vpn1-no7-iev.as41781.net.
	[193.34.155.18]) by smtp.gmail.com with ESMTPSA id
	d24-v6sm2412491ljg.2.2018.12.17.01.37.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Dec 2018 01:37:54 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
	<1544810082-22164-7-git-send-email-serhe.popovych@gmail.com>
	<CAMKF1sq67e22RCV4jasQsvaUcyzA9DR+oz9UgRPqMwFi48-thg@mail.gmail.com>
From: Serhey Popovych <serhe.popovych@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=serhe.popovych@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <55ac3f82-15bb-b4d3-1729-2a320dba6f6d@gmail.com>
Date: Mon, 17 Dec 2018 11:37:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:51.0) Gecko/20100101
	Firefox/51.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq67e22RCV4jasQsvaUcyzA9DR+oz9UgRPqMwFi48-thg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/13] musl: Create default library search path based on configuration
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
X-List-Received-Date: Mon, 17 Dec 2018 09:37:55 -0000
X-Groupsio-MsgNum: 119278
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="7Kxw7J2mJFl1pPCsxUXKY9TTE2yptsgNM"

--7Kxw7J2mJFl1pPCsxUXKY9TTE2yptsgNM
Content-Type: multipart/mixed; boundary="CMiJKz0DWcFEVQeh4msne5Li9o75Dyslu";
 protected-headers="v1"
From: Serhey Popovych <serhe.popovych@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Message-ID: <55ac3f82-15bb-b4d3-1729-2a320dba6f6d@gmail.com>
Subject: Re: [OE-core] [OE-Core][PATCH 06/13] musl: Create default library
 search path based on configuration
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
 <1544810082-22164-7-git-send-email-serhe.popovych@gmail.com>
 <CAMKF1sq67e22RCV4jasQsvaUcyzA9DR+oz9UgRPqMwFi48-thg@mail.gmail.com>
In-Reply-To: <CAMKF1sq67e22RCV4jasQsvaUcyzA9DR+oz9UgRPqMwFi48-thg@mail.gmail.com>

--CMiJKz0DWcFEVQeh4msne5Li9o75Dyslu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Khem Raj wrote:
> On Fri, Dec 14, 2018 at 9:57 AM Serhey Popovych
> <serhe.popovych@gmail.com> wrote:
>>
>> In absence of /etc/ld-musl-$(ARCH).path file musl uses hardcoded defau=
lt
>> search path "/lib:/usr/local/lib:/usr/lib". This works for cases when
>> system libraries installed in one of these pathes.
>>
>> However if lib64 or libx32 used as system library directories and no
>> usr merge functionality enabled for distro musl dynamic loader cannot
>> find libraries and finally execute binaries.
>>
>> Found while working on support for musl on powerpc64 builds where
>> lib64 variant is used regardless of multilib being on or off.
>>
>> Fix by creating default search path based on configuration time values=

>> for syslibdir and libdir.
>=20
> Lets take this fix to musl upstream at the same time. I think it does
> have some value
> but if upstream does not agree then we are in for supporting this
> forever, and I would like
> us to have upstream review on it first.

Will do that. Passing defines in CFLAGS isn't best approach. Maybe
upstream suggests something better.

>=20
>>
>> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
>> ---
>>  ...slibdir-and-libdir-as-default-pathes-to-l.patch | 61 +++++++++++++=
+++++++++
>>  meta/recipes-core/musl/musl_git.bb                 |  1 +
>>  2 files changed, 62 insertions(+)
>>  create mode 100644 meta/recipes-core/musl/musl/0002-ldso-Use-syslibdi=
r-and-libdir-as-default-pathes-to-l.patch
>>
>> diff --git a/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-l=
ibdir-as-default-pathes-to-l.patch b/meta/recipes-core/musl/musl/0002-lds=
o-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
>> new file mode 100644
>> index 0000000..6a875a7
>> --- /dev/null
>> +++ b/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-a=
s-default-pathes-to-l.patch
>> @@ -0,0 +1,61 @@
>> +From 5a2886f81dbca3f2ed28eebe7d27d471da278db8 Mon Sep 17 00:00:00 200=
1
>> +From: Serhey Popovych <serhe.popovych@gmail.com>
>> +Date: Tue, 11 Dec 2018 05:44:20 -0500
>> +Subject: [PATCH] ldso: Use syslibdir and libdir as default pathes to =
libdirs
>> +
>> +In absence of /etc/ld-musl-$(ARCH).path ldso uses default path to sea=
rch
>> +libraries /lib:/usr/local/lib:/usr/lib.
>> +
>> +However this path isn't relevant in case when library is put in dirs
>> +like lib64 or libx32.
>> +
>> +Adjust CFLAGS_ALL to pass syslibdir as SYSLIBDIR and libdir as LIBDIR=

>> +preprocessor macroses to construct default ldso library search path
>> +in ldso/dynlink.c::SYS_PATH_DFLT.
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
>> +---
>> + Makefile       | 3 ++-
>> + ldso/dynlink.c | 4 +++-
>> + 2 files changed, 5 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index b46f8ca4..c07e4ae8 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -46,7 +46,8 @@ CFLAGS_AUTO =3D -Os -pipe
>> + CFLAGS_C99FSE =3D -std=3Dc99 -ffreestanding -nostdinc
>> +
>> + CFLAGS_ALL =3D $(CFLAGS_C99FSE)
>> +-CFLAGS_ALL +=3D -D_XOPEN_SOURCE=3D700 -I$(srcdir)/arch/$(ARCH) -I$(s=
rcdir)/arch/generic -Iobj/src/internal -I$(srcdir)/src/include -I$(srcdir=
)/src/internal -Iobj/include -I$(srcdir)/include
>> ++CFLAGS_ALL +=3D -D_XOPEN_SOURCE=3D700 -DSYSLIBDIR=3D'"$(syslibdir)"'=
 -DLIBDIR=3D'"$(libdir)"'
>> ++CFLAGS_ALL +=3D -I$(srcdir)/arch/$(ARCH) -I$(srcdir)/arch/generic -I=
obj/src/internal -I$(srcdir)/src/include -I$(srcdir)/src/internal -Iobj/i=
nclude -I$(srcdir)/include
>> + CFLAGS_ALL +=3D $(CPPFLAGS) $(CFLAGS_AUTO) $(CFLAGS)
>> +
>> + LDFLAGS_ALL =3D $(LDFLAGS_AUTO) $(LDFLAGS)
>> +diff --git a/ldso/dynlink.c b/ldso/dynlink.c
>> +index ec921dfd..7c119c55 100644
>> +--- a/ldso/dynlink.c
>> ++++ b/ldso/dynlink.c
>> +@@ -22,6 +22,8 @@
>> + #include "dynlink.h"
>> + #include "malloc_impl.h"
>> +
>> ++#define SYS_PATH_DFLT SYSLIBDIR ":" LIBDIR
>> ++
>> + static void error(const char *, ...);
>> +
>> + #define MAXP2(a,b) (-(-(a)&-(b)))
>> +@@ -1038,7 +1040,7 @@ static struct dso *load_library(const char *nam=
e, struct dso *needed_by)
>> +                                       sys_path =3D "";
>> +                               }
>> +                       }
>> +-                      if (!sys_path) sys_path =3D "/lib:/usr/local/l=
ib:/usr/lib";
>> ++                      if (!sys_path) sys_path =3D SYS_PATH_DFLT;
>> +                       fd =3D path_open(name, sys_path, buf, sizeof b=
uf);
>> +               }
>> +               pathname =3D buf;
>> +--
>> +2.7.4
>> +
>> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/mu=
sl/musl_git.bb
>> index b416ec4..9cc875c 100644
>> --- a/meta/recipes-core/musl/musl_git.bb
>> +++ b/meta/recipes-core/musl/musl_git.bb
>> @@ -12,6 +12,7 @@ PV =3D "1.1.20+git${SRCPV}"
>>
>>  SRC_URI =3D "git://git.musl-libc.org/musl \
>>             file://0001-Make-dynamic-linker-a-relative-symlink-to-libc=
=2Epatch \
>> +           file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathe=
s-to-l.patch \
>>            "
>>
>>  S =3D "${WORKDIR}/git"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--CMiJKz0DWcFEVQeh4msne5Li9o75Dyslu--

--7Kxw7J2mJFl1pPCsxUXKY9TTE2yptsgNM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJcF25xAAoJEBTawMmQ61bB+mwIAJzLThj9AaBP9d16RQqnHMT2
c74HZXBrmA4HKYksCu52Uxj4Sd/IEebM2KB5s95eUfq04BjojHFgEOYiW2oV14GP
96VZ7COd2+Apg+Gp5r4se4c8O0i7LxQdWyFbAxij8BdZZ9kcJgg+0LImWiK7WuU1
ZQkgZBAVbsvY7fOJHwUei1uyaEoj+4T+f+SfO0h+rsIeA4nrHts8My643s2mtgdy
3pgRblmzQCKr9Rr6Axe4Fos8GNCv/lNtad8TyVvqnaeDXvvmH/ogd7scHTdPim6t
it77B0IAr+q2j72zIxqZ4zd6Pj23R7Sk5aeoZAjLCBVNKi+jY1G6SIcDgA+Ephk=
=Jvrx
-----END PGP SIGNATURE-----

--7Kxw7J2mJFl1pPCsxUXKY9TTE2yptsgNM--
