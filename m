Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71438C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 11:34:54 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.26062.1653305689169182625
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 04:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ei9saSrt;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id f2so20964272wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 04:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KKgK+B7YKGp99lqI55dsiIcTWiMAwg9GRURSi4743oU=;
        b=Ei9saSrt5OVmE4ceUzse2/5pUvkFDY5mhO+j7W6pIJhiSSpI2pqg+ObaPxwBkoKbsr
         OXTjIGfefQR1i7HzdWe7Qji6PxlRuk7BEo0DcoBCS/qAb+BuQd5eLTacBfm99gYdQgOv
         K5zEh0hIy9rPccvWnuzWwpJ2rFlV6u5l/2xpWDFo1A+t1uZbyFqEkfv1oD8WgBBwHf7f
         7PLkdXE9HZ6ngmgqt84lev2d1JRhkeGeEGpDVOdjSWL698mUOihAZhn7Y7sO91qK+DC7
         8Yhw9JnDD+Ye3z59TdFb8ZaXvPDVykA290NKRAy0SJi4N38bBQtM3UF9ubYSdKhdYXMd
         MNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KKgK+B7YKGp99lqI55dsiIcTWiMAwg9GRURSi4743oU=;
        b=RRuMlnacUmKJ0l4JlIax0e4W7FmDBWgMO5usQFmSFg6KBgc9Vu6KJ4lVS+M2aXBaU5
         tDTkZnMgDC4KUhWsVVwlLGGz47Uge2/pgWUFR4ucTcX94HpONgYq2HpNISGJoGE7TQib
         Z6vUQRfrFL5xTbXGDPkBxl/OFYzzqOIpkwpKKSf54NX0Z6Tr5bB3qqmuUzQdTuD2ciLm
         Ks/LWDkscgRjgakSH7Kblfac0e5Q8qSP2A/JJhV5M6vWHWAvgTI7APk1V8wWe1qod4io
         PBnr4aYJL8daddGMd8HtBdOmMw4qpwyxYBhL11oHGrq3BitJmWTxuIudqEtfoJMH67P2
         PDPQ==
X-Gm-Message-State: AOAM532x94XS9uhLPi68uCozuML3Lv8647yoTgPf6klSixfDih+zitpo
	LwTW3lueY94R81pgzqAyAlln5q/xNwUEbFGyngw=
X-Google-Smtp-Source: 
 ABdhPJymy1WT/8gtpdSU/N0Llf0bhT9NghIXwiw8h+D2/8+FRJILyBarb4fHqbA7wwhpl3id4BdgrCryTIWlKjgR/Ys=
X-Received: by 2002:adf:ee43:0:b0:20e:607c:6943 with SMTP id
 w3-20020adfee43000000b0020e607c6943mr19394478wro.407.1653305687275; Mon, 23
 May 2022 04:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <16F1B837A6A07046.1376@lists.openembedded.org>
In-Reply-To: <16F1B837A6A07046.1376@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 23 May 2022 13:34:26 +0200
Message-ID: 
 <CA+chaQdxYG2hKQDDx+Y3oNRWU7sHByOmrhE9gf_P_sKvKVCpwQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH] glibc-common.inc: add BSD-4-Clause-UC,
 BSD-3-Clause, ISC to LICENSE
To: Martin.Jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000031fe8c05dfac3aed"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 11:34:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166006

--00000000000031fe8c05dfac3aed
Content-Type: text/plain; charset="UTF-8"

This is really just RFC,

if there is an agreement that we need to resolve this, then we might also
introduce package specific licenses as even our old bbappend was adding BSD
only to glibc-extra-nss, PN-dbg, PN-dev, PN, PN-staticdev and PN-utils, but
that's from eglibc-2.17 days and would need to be re-checked in current
glibc sources.

Cheers,

On Mon, May 23, 2022 at 1:24 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> * the main motivation is to get rid of this bbappend from 2014:
>
> https://github.com/openwebos/meta-webos/commit/8eb313e4303defbe495cf7f91974799046975fca
>   which unfortunately doesn't explain which files under BSD license are
> included
>   in which package and also uses ambiguous 'BSD' license which was
>   removed from oe-core's common-licenses in:
>
> https://git.openembedded.org/openembedded-core/commit/?h=kirkstone&id=14d4c007c49652d836d325a12bdbcd3bfa42e6d5
>
> * COPYING mentions only GPL-2.0-only & LGPL-2.1-only as our LICENSE
> variable says,
> , but the LICENSES files lists various licenses with various Copyright
>   holders, the ones I was able to figure out where:
>   BSD-4-Clause-UC (but with 3rd clause explicitly removed)
>   ISC
>   BSD-3-Clause (with Intel Corportion copyright)
>   BSD-3-Clause (with Oracle America copyright)
>   which have just small formatting changes compared to corresponding
>   license in common-licenses, but there are couple more, should we
>   list them all (and create new common-licenses if needed)?
>
> * there were only 7 changes in LICENSES file since 2002:
>
> https://sourceware.org/git/?p=glibc.git;a=history;f=LICENSES;h=530893b1dc9ea00755603c68fb36bd4fc38a7be8;hb=HEAD
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-common.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-common.inc
> b/meta/recipes-core/glibc/glibc-common.inc
> index 90a6a534f3..7e3dc3b816 100644
> --- a/meta/recipes-core/glibc/glibc-common.inc
> +++ b/meta/recipes-core/glibc/glibc-common.inc
> @@ -2,7 +2,7 @@ SUMMARY = "GLIBC (GNU C Library)"
>  DESCRIPTION = "The GNU C Library is used as the system C library in most
> systems with the Linux kernel."
>  HOMEPAGE = "http://www.gnu.org/software/libc/libc.html"
>  SECTION = "libs"
> -LICENSE = "GPL-2.0-only & LGPL-2.1-only"
> +LICENSE = "GPL-2.0-only & LGPL-2.1-only & BSD-4-Clause-UC & BSD-3-Clause
> & ISC"
>
>  LIC_FILES_CHKSUM ?= "file://LICENSES;md5=1541fd8f5e8f1579512bf05f533371ba
> \
>        file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166005):
> https://lists.openembedded.org/g/openembedded-core/message/166005
> Mute This Topic: https://lists.openembedded.org/mt/91285771/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000031fe8c05dfac3aed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is really just RFC,<div><br></div><div>if there is an=
 agreement that we need to resolve this, then we might also introduce packa=
ge specific licenses as even our old bbappend was adding BSD only to glibc-=
extra-nss, PN-dbg, PN-dev, PN, PN-staticdev and PN-utils, but that&#39;s fr=
om eglibc-2.17 days and would need to be re-checked in current glibc source=
s.</div><div><br></div><div>Cheers,</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 23, 2022 at 1:24 PM Ma=
rtin Jansa via <a href=3D"http://lists.openembedded.org">lists.openembedded=
.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.=
org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">* the main motivation is to get rid of=
 this bbappend from 2014:<br>
=C2=A0 <a href=3D"https://github.com/openwebos/meta-webos/commit/8eb313e430=
3defbe495cf7f91974799046975fca" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/openwebos/meta-webos/commit/8eb313e4303defbe495cf7f91974799046=
975fca</a><br>
=C2=A0 which unfortunately doesn&#39;t explain which files under BSD licens=
e are included<br>
=C2=A0 in which package and also uses ambiguous &#39;BSD&#39; license which=
 was<br>
=C2=A0 removed from oe-core&#39;s common-licenses in:<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core/commit/?h=
=3Dkirkstone&amp;id=3D14d4c007c49652d836d325a12bdbcd3bfa42e6d5" rel=3D"nore=
ferrer" target=3D"_blank">https://git.openembedded.org/openembedded-core/co=
mmit/?h=3Dkirkstone&amp;id=3D14d4c007c49652d836d325a12bdbcd3bfa42e6d5</a><b=
r>
<br>
* COPYING mentions only GPL-2.0-only &amp; LGPL-2.1-only as our LICENSE var=
iable says,<br>
, but the LICENSES files lists various licenses with various Copyright<br>
=C2=A0 holders, the ones I was able to figure out where:<br>
=C2=A0 BSD-4-Clause-UC (but with 3rd clause explicitly removed)<br>
=C2=A0 ISC<br>
=C2=A0 BSD-3-Clause (with Intel Corportion copyright)<br>
=C2=A0 BSD-3-Clause (with Oracle America copyright)<br>
=C2=A0 which have just small formatting changes compared to corresponding<b=
r>
=C2=A0 license in common-licenses, but there are couple more, should we<br>
=C2=A0 list them all (and create new common-licenses if needed)?<br>
<br>
* there were only 7 changes in LICENSES file since 2002:<br>
=C2=A0 <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dhistory;f=
=3DLICENSES;h=3D530893b1dc9ea00755603c68fb36bd4fc38a7be8;hb=3DHEAD" rel=3D"=
noreferrer" target=3D"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dhistory;f=3DLICENSES;h=3D530893b1dc9ea00755603c68fb36bd4fc38a7be8;hb=3DH=
EAD</a><br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/glibc-common.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/g=
libc/glibc-common.inc<br>
index 90a6a534f3..7e3dc3b816 100644<br>
--- a/meta/recipes-core/glibc/glibc-common.inc<br>
+++ b/meta/recipes-core/glibc/glibc-common.inc<br>
@@ -2,7 +2,7 @@ SUMMARY =3D &quot;GLIBC (GNU C Library)&quot;<br>
=C2=A0DESCRIPTION =3D &quot;The GNU C Library is used as the system C libra=
ry in most systems with the Linux kernel.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.gnu.org/software/libc/libc.h=
tml" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/software/libc/=
libc.html</a>&quot;<br>
=C2=A0SECTION =3D &quot;libs&quot;<br>
-LICENSE =3D &quot;GPL-2.0-only &amp; LGPL-2.1-only&quot;<br>
+LICENSE =3D &quot;GPL-2.0-only &amp; LGPL-2.1-only &amp; BSD-4-Clause-UC &=
amp; BSD-3-Clause &amp; ISC&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM ?=3D &quot;file://LICENSES;md5=3D1541fd8f5e8f1579512=
bf05f533371ba \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263 \<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#166005): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/166005" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/166005</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91285771/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91285771/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000031fe8c05dfac3aed--

