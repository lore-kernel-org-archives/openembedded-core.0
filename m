Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 41A2460043
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 09:02:20 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so37676298wgy.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 02:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SbaNiFdyrooIhvyrnNXZ8jPN/18HyAuQajBzRdKJNnc=;
	b=PWdX0G39yLfy93BE6D0t82LHvz8TKIjlgoeQl3jYsHr8L7HIhZsihj/3cpWr1YtxTq
	dvqRgdzLiUkpyyYZBlmNZQvwIqXxZCqd3apb1tssD19CkyDk3yUMNrHfNPXrbQ0gS44h
	gN/ZUzmYy2nMr4Dv8YolX8n8bGcjJgtZu4ZmtQw2zoJX1IlQNVkdYRL0DQR6+y6nEo2n
	kM4VFog2nrvXSPWHJmElWJTGRm3xVHOIH9g6NS7jlQf27FqZCOLcz8AqRyvXmcKbUSc+
	0ITeI2FO7GhEho95Lx0tqO8L0X55w+wV1ViLHvmDmdgEtzQylsEm4s6RNksTlTJLrFm2
	W+dg==
MIME-Version: 1.0
X-Received: by 10.180.99.2 with SMTP id em2mr4613268wib.59.1428742941379; Sat,
	11 Apr 2015 02:02:21 -0700 (PDT)
Received: by 10.28.157.17 with HTTP; Sat, 11 Apr 2015 02:02:21 -0700 (PDT)
In-Reply-To: <c8117308ef5d12d8bdeb088d2bea4dff4bb686ff.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
	<9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
	<c8117308ef5d12d8bdeb088d2bea4dff4bb686ff.1428714999.git.raj.khem@gmail.com>
Date: Sat, 11 Apr 2015 11:02:21 +0200
Message-ID: <CA+chaQe1WeSN3pCy3=jzb8x3PZmJ_LdDMtkkzxCrVE9ibZJnOQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Khem Raj <khem_raj@cable.comcast.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 17/17] e2fsprogs: Delete identical binaries and create symlinks instead
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
X-List-Received-Date: Sat, 11 Apr 2015 09:02:23 -0000
Content-Type: multipart/alternative; boundary=f46d04426c687f12b905136f233d

--f46d04426c687f12b905136f233d
Content-Type: text/plain; charset=UTF-8

There is configure option for this, see my pending e2fsprogs patch from
Friday.

On Sat, Apr 11, 2015 at 3:20 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Here is what build history tells now
>
> e2fsprogs-tune2fs:
>
> -PKGSIZE = 144336
> +PKGSIZE = 72175
>
> e2fsprogs-e2fsck:
>
> -PKGSIZE = 1345500
> +PKGSIZE = 269124
>
> e2fsprogs-mke2fs:
>
> -PKGSIZE = 551316
> +PKGSIZE = 111036
>
> Change-Id: I0902484ad506d892292c4bea6789467179b5ea8d
> Signed-off-by: Khem Raj <khem_raj@cable.comcast.com>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
> b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
> index 66065bc..e6ff5f9 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
> @@ -43,6 +43,9 @@ do_install () {
>         rm -f ${D}${base_sbindir}/blkid
>         rm -f ${D}${base_sbindir}/fsck
>         rm -f ${D}${base_sbindir}/findfs
> +       rm -f ${D}${base_sbindir}/mkfs.ext*
> +       rm -f ${D}${base_sbindir}/fsck.ext*
> +       rm -f ${D}${base_sbindir}/e2label
>
>         # e2initrd_helper and the pkgconfig files belong in libdir
>         if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
> @@ -50,6 +53,11 @@ do_install () {
>                 mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
>                 mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
>         fi
> +       for ext in ext2 ext3 ext4 ext4dev; do
> +               ln -sf mke2fs ${D}${base_sbindir}/mkfs.${ext}
> +               ln -sf e2fsck ${D}${base_sbindir}/fsck.${ext}
> +       done
> +       ln -sf tune2fs ${D}${base_sbindir}/e2label
>
>         oe_multilib_header ext2fs/ext2_types.h
>         install -d ${D}${base_bindir}
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f46d04426c687f12b905136f233d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is configure option for this, see my pending e2fspro=
gs patch from Friday.</div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Sat, Apr 11, 2015 at 3:20 AM, Khem Raj <span dir=3D"ltr">&lt;<=
a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Here is what build h=
istory tells now<br>
<br>
e2fsprogs-tune2fs:<br>
<br>
-PKGSIZE =3D 144336<br>
+PKGSIZE =3D 72175<br>
<br>
e2fsprogs-e2fsck:<br>
<br>
-PKGSIZE =3D 1345500<br>
+PKGSIZE =3D 269124<br>
<br>
e2fsprogs-mke2fs:<br>
<br>
-PKGSIZE =3D 551316<br>
+PKGSIZE =3D 111036<br>
<br>
Change-Id: I0902484ad506d892292c4bea6789467179b5ea8d<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem_raj@cable.comcast.com">k=
hem_raj@cable.comcast.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.42.9.bb=
" target=3D"_blank">e2fsprogs_1.42.9.bb</a> | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.=
42.9.bb" target=3D"_blank">e2fsprogs_1.42.9.bb</a> b/meta/recipes-devtools/=
e2fsprogs/<a href=3D"http://e2fsprogs_1.42.9.bb" target=3D"_blank">e2fsprog=
s_1.42.9.bb</a><br>
index 66065bc..e6ff5f9 100644<br>
--- a/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.42.9.bb=
" target=3D"_blank">e2fsprogs_1.42.9.bb</a><br>
+++ b/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.42.9.bb=
" target=3D"_blank">e2fsprogs_1.42.9.bb</a><br>
@@ -43,6 +43,9 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${base_sbindir}/blkid<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${base_sbindir}/fsck<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${base_sbindir}/findfs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${base_sbindir}/mkfs.ext*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${base_sbindir}/fsck.ext*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${base_sbindir}/e2label<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # e2initrd_helper and the pkgconfig files belon=
g in libdir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; =
then<br>
@@ -50,6 +53,11 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${base_libdi=
r}/e2initrd_helper ${D}${libdir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${base_libdi=
r}/pkgconfig ${D}${libdir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for ext in ext2 ext3 ext4 ext4dev; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf mke2fs ${D}$=
{base_sbindir}/mkfs.${ext}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf e2fsck ${D}$=
{base_sbindir}/fsck.${ext}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf tune2fs ${D}${base_sbindir}/e2label<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_multilib_header ext2fs/ext2_types.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${base_bindir}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--f46d04426c687f12b905136f233d--
