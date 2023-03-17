Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A050BC6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 13:26:48 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.19069.1679059600290687559
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 06:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LDB3PDIu;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id bh20so3714635oib.9
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 06:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679059599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6fnO6AJ1EUXw2DoGDTMKrTluWtRxVB5w0L8fwmurro=;
        b=LDB3PDIue647PnpH7bpfQfotokHtAZ1bksgPGDO6hJtHp03NykWYT5mvmBUFeBj9hz
         AOviocCJfIKmjvWWMRtxbcoXsPpBdz2oBcBo19tb+GPbPfONmG0uCzuvJWQPd9BsXOee
         EA0K49PDiryb5iJ5AR+OhQfQfzHEuFN/dshc40l0MJNvXbRCuF0cMR0v/FoVyZqiRNU0
         JV+BTYDNP/ySc6afAwi6ZL7p1wVvVQ0QhIxmX1ylF2DWcwmMd21f4X3UsdK+h2S1LACG
         JjM0zFqvvZsGlU+bw/nHXXz68KZcWn2af3HoKCbw0dII6yr3Zcf4sG9R3SCFHACjXZu1
         wGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679059599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6fnO6AJ1EUXw2DoGDTMKrTluWtRxVB5w0L8fwmurro=;
        b=2XOBHZDyg8S6PJ3yi6lj+Liez5sMS1GDSyiZ6OMuUWJlgah9lx9xhzDfn0S9uQ/hFz
         rQG88YYQisWtZAjL9qZIqCD9JJ1L2d0fAD3ee+OO5UMZq5CJmXhf/15VNWJAMBrH1WWR
         K50ALKTBGd1TcBM7aiI/WTJNL0PDbS9+BxCGyPihi0UwFKrA3DSMc5ZRa48WbUs4vQvS
         u29P8U5caZ9LyoeR7hK26kUHfpVLl6FDbklBsOI7sEeiX8JipHjdwkvGxNWCv4Tw8XOl
         h74lEyad7E5pxiAaADmb/Sc8DEb9XucXGJPDy2zZ/Fz+sJ9cTsnJ6Egp/xY3wcYcB0dz
         pVTQ==
X-Gm-Message-State: AO0yUKWSodvPIuftgPP+m9+60eKUuYT1TYswNmdSjJ8ddo6P2kw+/2Ix
	LeRanbaMwIy87m0icH6Bl1QLg1TwG2No/Va5XQA=
X-Google-Smtp-Source: AK7set+2XiLPukowZUqLoabia+GvBMrTZlba/IzqQOILrzhIanw+PBK26Iap2o/zDO8asqqHYHGJjIIhR0wbRHSFi7g=
X-Received: by 2002:aca:d08:0:b0:384:3518:df33 with SMTP id
 8-20020aca0d08000000b003843518df33mr3137963oin.4.1679059599496; Fri, 17 Mar
 2023 06:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <1678926524-24495-1-git-send-email-wangmy@fujitsu.com> <20230316214622adcc63a5@mail.local>
In-Reply-To: <20230316214622adcc63a5@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Mar 2023 06:26:13 -0700
Message-ID: <CAMKF1sruMeRoLnwdBjuE5R7Wqfy_ndKaWyTWFDh0-SN9K9BT_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] btrfs-tools: upgrade 6.1.3 -> 6.2.1
To: alexandre.belloni@bootlin.com
Cc: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 13:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178754

FWIW it also fails compiling with clang compiler

https://errors.yoctoproject.org/Errors/Details/698109/

On Thu, Mar 16, 2023 at 2:46=E2=80=AFPM Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> This fails on the AB for edgerouter-alt and meta-intel:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/4406/s=
teps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/4205/s=
teps/13/logs/stdio
>
> | gcc  -isystem/home/pokybuild/yocto-worker/edgerouter-alt/build/build/tm=
p/work/x86_64-linux/btrfs-tools-native/6.2.1-r0/recipe-sysroot-native/usr/i=
nclude -O2 -pipe -std=3Dgnu11 -D_GNU_SOURCE -fPIC -fvisibility=3Dhidden -I.=
/libbtrfsutil    -o libbtrfsutil/stubs.o -c libbtrfsutil/stubs.c -o libbtrf=
sutil/stubs.o
> | In file included from crypto/blake2b-round.h:140,
> |                  from crypto/blake2b-sse2.c:33:
> | crypto/blake2b-sse2.c: In function =E2=80=98blake2b_compress_sse2=E2=80=
=99:
> | crypto/blake2b-load-sse41.h:21:25: error: incompatible type for argumen=
t 1 of =E2=80=98_mm_unpacklo_epi64=E2=80=99
> |    21 | b0 =3D _mm_unpacklo_epi64(m0, m1); \
> |       |                         ^~
> |       |                         |
> |       |                         uint64_t {aka long unsigned int}
> | crypto/blake2b-round.h:146:3: note: in expansion of macro =E2=80=98LOAD=
_MSG_0_1=E2=80=99
> |   146 |   LOAD_MSG_ ##r ##_1(b0, b1); \
> |       |   ^~~~~~~~~
> | crypto/blake2b-sse2.c:80:3: note: in expansion of macro =E2=80=98ROUND=
=E2=80=99
> |    80 |   ROUND( 0 );
> |       |   ^~~~~
> | In file included from crypto/blake2b-sse2.c:25:
> | /usr/lib/gcc/x86_64-redhat-linux/11/include/emmintrin.h:1046:29: note: =
expected =E2=80=98__m128i=E2=80=99 but argument is of type =E2=80=98uint64_=
t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99}
> |  1046 | _mm_unpacklo_epi64 (__m128i __A, __m128i __B)
> |       |                     ~~~~~~~~^~~
> | In file included from crypto/blake2b-round.h:140,
> |                  from crypto/blake2b-sse2.c:33:
>
> On 16/03/2023 08:28:44+0800, wangmy wrote:
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Changelog:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  * fix build with crypto libraries
> >  * CI images updated, build tests extended
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../btrfs-tools/{btrfs-tools_6.1.3.bb =3D> btrfs-tools_6.2.1.bb}  | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.1.3.bb =3D> bt=
rfs-tools_6.2.1.bb} (98%)
> >
> > diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb b/m=
eta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb
> > similarity index 98%
> > rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
> > rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb
> > index b4dfc5b3f3..a6ff87a90c 100644
> > --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
> > +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb
> > @@ -19,7 +19,7 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kerne=
l/git/kdave/btrfs-progs.git;b
> >             file://0001-Add-a-possibility-to-specify-where-python-modul=
es-ar.patch \
> >             file://0001-Use-pread-pwrite-ftruncate-stat-instead-of-64bi=
t-equ.patch \
> >             "
> > -SRCREV =3D "908b4b4450320e30fdef693f09b42f4eb93702c3"
> > +SRCREV =3D "366cd079bc43241b27e0838be0c5369aa00716f8"
> >  S =3D "${WORKDIR}/git"
> >
> >  PACKAGECONFIG ??=3D " \
> > --
> > 2.34.1
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178735): https://lists.openembedded.org/g/openembedde=
d-core/message/178735
> Mute This Topic: https://lists.openembedded.org/mt/97641211/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

