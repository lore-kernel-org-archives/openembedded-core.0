Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 957AA7D8EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 11:03:37 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id f37so3185324edb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 04:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=THdS25ct4fv4K+OeJNxSoDqDnI3bNC6TTuIzjSB3KZ0=;
	b=fAi7CsvGcMuaSYl2/114svCDhYA7QW8FblP9kQg3/933wP1BgVklWVfCfF/2cf1Avq
	g51o2FVzrCLHlbyXO+MY8H41oD1Rg2x1x4RPjearXQ5zfbgTkRL4WGRRM3VD/Jo1zsGE
	eIDjAg71lxGmhxWKcn1wB7w6a7Cg+wrpLRNKJSNfF6+bjYE1+H/48ld6ylrTvBmXZfdD
	wzy1eEHSF+0nLxmJm3OHfS6UQu4UY+VhjW4dqtVOvlkguzkvuXDYpVwGfTMwmmkUkTeG
	oZxM3kPL8AzdMoXcGZYzS5z87W9oTiPIDOGQZNdPQ2aRwDFarrnFMCAXS1YWYNLz2SV5
	Ps8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=THdS25ct4fv4K+OeJNxSoDqDnI3bNC6TTuIzjSB3KZ0=;
	b=tMDLsNU0p3gBZ/DdkcW9L3QNmOdBK6A93de02qdeYGg1175AbZnPufAsg+4nHZirIw
	GLnI2/NlmopKcv0QSZj0rehIjtaDmgWXr+Equpb4C3K2ba4K5F5s6Cck8tlCgn134qLD
	+DY5fikXwOVQxGwFQk5HiNz+OrX2wilHlkK0DZfDMRZWOlb3BFHynlglVQXIhK54Zifr
	CaMOdvRxYPK8ee5qxOnEUTV8cwmQ1KDenn2C8ptCs1TtKqIR0mrIZttKw7lpkcoCPoJk
	eD5F05JD+8LNQSnTvtgH4vupJx4xwA8am1+ckKVgkqLNfYDwTB/JCuNGXqs4gIvnmpgo
	YOgQ==
X-Gm-Message-State: APjAAAVEvQIYliHZSfMhKs3IPdF5ROYEDBiK7WCgAkxoVtjHB+s5Ljm7
	euK2W38Wvy6oYYZT7cDf7CUN5EDEB5hrHbGxWks=
X-Google-Smtp-Source: APXvYqwrvki6kf5ymKud8O+n+lp/dYQXO5IPiRb8NRyYsJIkBF5vrCThyigRaV/quDfOBeCQ9Se3dUjIv6Uuu1G3+4s=
X-Received: by 2002:a17:906:830d:: with SMTP id
	j13mr29499588ejx.151.1558523018219; 
	Wed, 22 May 2019 04:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1558300553.git.just.another.mariano@gmail.com>
	<c7d776cebebd9bf2c28d43aad3fd911101283572.1558300553.git.just.another.mariano@gmail.com>
In-Reply-To: <c7d776cebebd9bf2c28d43aad3fd911101283572.1558300553.git.just.another.mariano@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 22 May 2019 13:03:37 +0200
Message-ID: <CA+chaQdu3hKa6ogM=9_iG1GS67YdrwoF=J2YWdh6RX3V1r7qbA@mail.gmail.com>
To: =?UTF-8?Q?Mariano_L=C3=B3pez?= <just.another.mariano@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] util-linux: Add missing ptest dependencies
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
X-List-Received-Date: Wed, 22 May 2019 11:03:37 -0000
Content-Type: multipart/alternative; boundary="000000000000e0171d058977eac5"

--000000000000e0171d058977eac5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This pulls bc to many images with busybox, causing busybox postinst to fail
with:

update-alternatives: Error: not linking /usr/bin/bc to /bin/busybox.nosuid
since /usr/bin/bc exists and is not a link

I'll check which busybox defconfig entry enables BC and send patch to use
u-a for bc in ./meta/recipes-extended/bc/bc_1.07.1.bb

There already is:
ALTERNATIVE_${PN} =3D "dc"
ALTERNATIVE_PRIORITY =3D "100"
but maybe dc is a typo.

On Sun, May 19, 2019 at 11:21 PM Mariano L=C3=B3pez <
just.another.mariano@gmail.com> wrote:

> There are some missing dependencies for the util-linux-ptest package
> that causes inconsistencies in the package tests run in different images.
>
> The kernel module in RRECOMMENDS is not build at this time, it needs
> more testing and check if the configuration change can be part of the
> yocto-kernel-cache repository.
>
> Signed-off-by: Mariano L=C3=B3pez <just.another.mariano@gmail.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc
> b/meta/recipes-core/util-linux/util-linux.inc
> index 34255a2dec..6dfbe0b683 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -142,7 +142,8 @@ RDEPENDS_${PN}_class-nativesdk =3D ""
>  RPROVIDES_${PN}-dev =3D "${PN}-libblkid-dev ${PN}-libmount-dev
> ${PN}-libuuid-dev"
>
>  RDEPENDS_${PN}-bash-completion +=3D "${PN}-lsblk"
> -RDEPENDS_${PN}-ptest =3D "bash grep coreutils which btrfs-tools ${PN} se=
d"
> +RDEPENDS_${PN}-ptest =3D "bash bc btrfs-tools coreutils e2fsprogs grep
> iproute2 kmod mdadm ${PN} procps sed socat which xz"
> +RRECOMMENDS_${PN}-ptest =3D "kernel-module-scsi-debug"
>  RDEPENDS_${PN}-swaponoff =3D "${PN}-swapon ${PN}-swapoff"
>  ALLOW_EMPTY_${PN}-swaponoff =3D "1"
>
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000e0171d058977eac5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This pulls bc to many images with busybox, causing busybox=
 postinst to fail with:<div><br></div><div>update-alternatives: Error: not =
linking /usr/bin/bc to /bin/busybox.nosuid since /usr/bin/bc exists and is =
not a link<br></div><div><br></div><div>I&#39;ll check which busybox defcon=
fig entry enables BC and send patch to use u-a for bc in=C2=A0./meta/recipe=
s-extended/bc/<a href=3D"http://bc_1.07.1.bb">bc_1.07.1.bb</a></div><div><b=
r></div><div>There already is:</div><div>ALTERNATIVE_${PN} =3D &quot;dc&quo=
t;<br>ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br></div><div>but maybe dc i=
s a typo.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, May 19, 2019 at 11:21 PM Mariano L=C3=B3pez &lt;<a =
href=3D"mailto:just.another.mariano@gmail.com">just.another.mariano@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">There are some missing dependencies for the util-linux-ptest package<br>
that causes inconsistencies in the package tests run in different images.<b=
r>
<br>
The kernel module in RRECOMMENDS is not build at this time, it needs<br>
more testing and check if the configuration change can be part of the<br>
yocto-kernel-cache repository.<br>
<br>
Signed-off-by: Mariano L=C3=B3pez &lt;<a href=3D"mailto:just.another.marian=
o@gmail.com" target=3D"_blank">just.another.mariano@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/util-linux/util-linux.inc | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc<br>
index 34255a2dec..6dfbe0b683 100644<br>
--- a/meta/recipes-core/util-linux/util-linux.inc<br>
+++ b/meta/recipes-core/util-linux/util-linux.inc<br>
@@ -142,7 +142,8 @@ RDEPENDS_${PN}_class-nativesdk =3D &quot;&quot;<br>
=C2=A0RPROVIDES_${PN}-dev =3D &quot;${PN}-libblkid-dev ${PN}-libmount-dev $=
{PN}-libuuid-dev&quot;<br>
<br>
=C2=A0RDEPENDS_${PN}-bash-completion +=3D &quot;${PN}-lsblk&quot;<br>
-RDEPENDS_${PN}-ptest =3D &quot;bash grep coreutils which btrfs-tools ${PN}=
 sed&quot;<br>
+RDEPENDS_${PN}-ptest =3D &quot;bash bc btrfs-tools coreutils e2fsprogs gre=
p iproute2 kmod mdadm ${PN} procps sed socat which xz&quot;<br>
+RRECOMMENDS_${PN}-ptest =3D &quot;kernel-module-scsi-debug&quot;<br>
=C2=A0RDEPENDS_${PN}-swaponoff =3D &quot;${PN}-swapon ${PN}-swapoff&quot;<b=
r>
=C2=A0ALLOW_EMPTY_${PN}-swaponoff =3D &quot;1&quot;<br>
<br>
-- <br>
2.21.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000e0171d058977eac5--
