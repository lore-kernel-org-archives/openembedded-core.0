Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE9BC433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 11:43:54 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.26471.1653306231531387029
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 04:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fmtxote4;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id r23so20992054wrr.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 04:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vFBq1pYC5ll/7y8oJKVGUOfzZBBF2ZJJ6XPL7Xqu8Dg=;
        b=fmtxote4lmZkdA3bNCjcc8JlpudRlQCzwcMWIC5hC9xKv+pK9NMbr6ZGp7EWvtCu9n
         GTRbDFY2v6y6wzXHGXuR7YayM2NhKa3DwE5vW8s/ORa829BBJ7KMv6YrFeg1B1qreWar
         pY8FvbU4mZwvemXZBJBwuEHBW+yH/eTj4JhonIhuo2jKPK1ajB2q5X+o4oo33is2jTPq
         AG3aycsxXpmZGj9tDHQCAlaVhaZoZaUTJ+0xUPDZvcELY3N8XfNenvCqcvdTWzO+UBIj
         sFWR3XGqS/yujWlDwGVCFtbCR/trvMkifc5wXZcFibWwS1FTSSYowhxJpw3pzAfaC9mX
         L/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vFBq1pYC5ll/7y8oJKVGUOfzZBBF2ZJJ6XPL7Xqu8Dg=;
        b=yfCsrPQyGQ3PzH6WLjtl8mzg+xZxWDGK1D9NQ3A3VIMtUMg+5TWNrkFTjzOUItwLJW
         v+LokoUqaURtP6D39e1cZt5JVd9JfG755I+1bpp9fBqDDxHakGrnnoI4FXChAhD9amXE
         sl54lNq7e2YtavxRlMRWf4p9VCQsRVyt3mPfWWFTNTzDwkl71CnXATMBMhE9Fs+235QF
         j34CmBBCysEk29BkGhyJT1RwdA1lx00SgQB+qaz9YlxLDY/MX1hbW28qyjCI6BU+KqcL
         pohSsMZwfyL2BgrVAWlkptLhJdfBvz6I+5oZZeURw+KXz+7MvBY59u0ol4fqEPsPRQwD
         5Fuw==
X-Gm-Message-State: AOAM532vhymbBOM1BW4ICyuUTf2EuolyxQcZdbLry3Y5ls/56sZkwnWx
	5VgFSM11Ea3F+ZkXx+lGr3HA/PxSxa8+czj7XNQ=
X-Google-Smtp-Source: 
 ABdhPJxVfoj8bvt6wt7XVwet4IMbhxpDQJZ/QSDzE8aLLisKXcwnZVtgt2JhgetleG4jkhrjRGC6Jio5oHFSJzbU6Ck=
X-Received: by 2002:adf:f106:0:b0:20d:20a:96e8 with SMTP id
 r6-20020adff106000000b0020d020a96e8mr19161308wro.495.1653306229525; Mon, 23
 May 2022 04:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220523112433.383046-1-Martin.Jansa@gmail.com>
 <18e8883e3582f2d8057f0608a6edab4a0837f031.camel@linuxfoundation.org>
In-Reply-To: 
 <18e8883e3582f2d8057f0608a6edab4a0837f031.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 23 May 2022 13:43:29 +0200
Message-ID: 
 <CA+chaQdRxAuQTgdiuQC5im5FSKy=8JHsvnOtVZZaFEZFRJZTfw@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH] glibc-common.inc: add BSD-4-Clause-UC,
 BSD-3-Clause, ISC to LICENSE
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000084157905dfac5a5e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 11:43:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166008

--00000000000084157905dfac5a5e
Content-Type: text/plain; charset="UTF-8"

The LICENSES file is already in LIC_FILES_CHKSUM.

Unfortunately the files themselves usually don't have clear license
headers, but at least there is Copyright in them, so it might be possible
to map the LICENSES files sections to actual source files (in cases where
it's not explicitly mentioned) and then map these source files to package
names and set the LICENSE:<pkg> to match.

I was waiting for an agreement that this is really needed as BSD is quite
permissive and it would be surprising if LGE was the only company which had
to fix this LICENSE issue (in long forgotten bbappend from 2014), so maybe
someone else have already better upstream-able change handy (and this
e-mail would be just a reminder to upstream it - my over-optimistic self
said).

Cheers,

On Mon, May 23, 2022 at 1:34 PM <richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2022-05-23 at 13:24 +0200, Martin Jansa wrote:
> > * the main motivation is to get rid of this bbappend from 2014:
> >
> https://github.com/openwebos/meta-webos/commit/8eb313e4303defbe495cf7f91974799046975fca
> >   which unfortunately doesn't explain which files under BSD license are
> included
> >   in which package and also uses ambiguous 'BSD' license which was
> >   removed from oe-core's common-licenses in:
> >
> https://git.openembedded.org/openembedded-core/commit/?h=kirkstone&id=14d4c007c49652d836d325a12bdbcd3bfa42e6d5
> >
> > * COPYING mentions only GPL-2.0-only & LGPL-2.1-only as our LICENSE
> variable says,
> > , but the LICENSES files lists various licenses with various Copyright
> >   holders, the ones I was able to figure out where:
> >   BSD-4-Clause-UC (but with 3rd clause explicitly removed)
> >   ISC
> >   BSD-3-Clause (with Intel Corportion copyright)
> >   BSD-3-Clause (with Oracle America copyright)
> >   which have just small formatting changes compared to corresponding
> >   license in common-licenses, but there are couple more, should we
> >   list them all (and create new common-licenses if needed)?
> >
> > * there were only 7 changes in LICENSES file since 2002:
> >
> https://sourceware.org/git/?p=glibc.git;a=history;f=LICENSES;h=530893b1dc9ea00755603c68fb36bd4fc38a7be8;hb=HEAD
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-core/glibc/glibc-common.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/glibc/glibc-common.inc
> b/meta/recipes-core/glibc/glibc-common.inc
> > index 90a6a534f3..7e3dc3b816 100644
> > --- a/meta/recipes-core/glibc/glibc-common.inc
> > +++ b/meta/recipes-core/glibc/glibc-common.inc
> > @@ -2,7 +2,7 @@ SUMMARY = "GLIBC (GNU C Library)"
> >  DESCRIPTION = "The GNU C Library is used as the system C library in
> most systems with the Linux kernel."
> >  HOMEPAGE = "http://www.gnu.org/software/libc/libc.html"
> >  SECTION = "libs"
> > -LICENSE = "GPL-2.0-only & LGPL-2.1-only"
> > +LICENSE = "GPL-2.0-only & LGPL-2.1-only & BSD-4-Clause-UC &
> BSD-3-Clause & ISC"
> >
> >  LIC_FILES_CHKSUM ?=
> "file://LICENSES;md5=1541fd8f5e8f1579512bf05f533371ba \
> >        file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>
> I don't mind updating this but I think we'd need to add something to
> LIC_FILES_CHKSUM to show where the context under BSD* is...
>
> Cheers,
>
> Richard
>
>
>

--00000000000084157905dfac5a5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The LICENSES file is already in LIC_FILES_CHKSUM.<div><br>=
</div><div>Unfortunately the files themselves usually don&#39;t have clear =
license headers, but at least there is Copyright in them, so it might be po=
ssible to map the LICENSES files sections to actual source files (in cases =
where it&#39;s not explicitly mentioned) and then map these source files to=
 package names and set the LICENSE:&lt;pkg&gt; to match.</div><div><br></di=
v><div>I was waiting for an agreement that this is really needed as BSD is =
quite permissive and it would be surprising if LGE was the only company whi=
ch had to fix this LICENSE issue (in long forgotten bbappend from 2014), so=
 maybe someone else have already better upstream-able change handy (and thi=
s e-mail would be just a reminder to upstream it - my over-optimistic self =
said).</div><div><br></div><div>Cheers,</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 23, 2022 at 1:34 P=
M &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@=
linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Mon, 2022-05-23 at 13:24 +0200, Martin Jansa wrote:<b=
r>
&gt; * the main motivation is to get rid of this bbappend from 2014:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/openwebos/meta-webos/commit/=
8eb313e4303defbe495cf7f91974799046975fca" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/openwebos/meta-webos/commit/8eb313e4303defbe495cf7f9=
1974799046975fca</a><br>
&gt;=C2=A0 =C2=A0which unfortunately doesn&#39;t explain which files under =
BSD license are included<br>
&gt;=C2=A0 =C2=A0in which package and also uses ambiguous &#39;BSD&#39; lic=
ense which was<br>
&gt;=C2=A0 =C2=A0removed from oe-core&#39;s common-licenses in:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/openembedded-core/=
commit/?h=3Dkirkstone&amp;id=3D14d4c007c49652d836d325a12bdbcd3bfa42e6d5" re=
l=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedde=
d-core/commit/?h=3Dkirkstone&amp;id=3D14d4c007c49652d836d325a12bdbcd3bfa42e=
6d5</a><br>
&gt; <br>
&gt; * COPYING mentions only GPL-2.0-only &amp; LGPL-2.1-only as our LICENS=
E variable says,<br>
&gt; , but the LICENSES files lists various licenses with various Copyright=
<br>
&gt;=C2=A0 =C2=A0holders, the ones I was able to figure out where:<br>
&gt;=C2=A0 =C2=A0BSD-4-Clause-UC (but with 3rd clause explicitly removed)<b=
r>
&gt;=C2=A0 =C2=A0ISC<br>
&gt;=C2=A0 =C2=A0BSD-3-Clause (with Intel Corportion copyright)<br>
&gt;=C2=A0 =C2=A0BSD-3-Clause (with Oracle America copyright)<br>
&gt;=C2=A0 =C2=A0which have just small formatting changes compared to corre=
sponding<br>
&gt;=C2=A0 =C2=A0license in common-licenses, but there are couple more, sho=
uld we<br>
&gt;=C2=A0 =C2=A0list them all (and create new common-licenses if needed)?<=
br>
&gt; <br>
&gt; * there were only 7 changes in LICENSES file since 2002:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dh=
istory;f=3DLICENSES;h=3D530893b1dc9ea00755603c68fb36bd4fc38a7be8;hb=3DHEAD"=
 rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/git/?p=3Dglibc=
.git;a=3Dhistory;f=3DLICENSES;h=3D530893b1dc9ea00755603c68fb36bd4fc38a7be8;=
hb=3DHEAD</a><br>
&gt; <br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/glibc/glibc-common.inc | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-c=
ore/glibc/glibc-common.inc<br>
&gt; index 90a6a534f3..7e3dc3b816 100644<br>
&gt; --- a/meta/recipes-core/glibc/glibc-common.inc<br>
&gt; +++ b/meta/recipes-core/glibc/glibc-common.inc<br>
&gt; @@ -2,7 +2,7 @@ SUMMARY =3D &quot;GLIBC (GNU C Library)&quot;<br>
&gt;=C2=A0 DESCRIPTION =3D &quot;The GNU C Library is used as the system C =
library in most systems with the Linux kernel.&quot;<br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://www.gnu.org/software/libc/l=
ibc.html" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/software/=
libc/libc.html</a>&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;libs&quot;<br>
&gt; -LICENSE =3D &quot;GPL-2.0-only &amp; LGPL-2.1-only&quot;<br>
&gt; +LICENSE =3D &quot;GPL-2.0-only &amp; LGPL-2.1-only &amp; BSD-4-Clause=
-UC &amp; BSD-3-Clause &amp; ISC&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 LIC_FILES_CHKSUM ?=3D &quot;file://LICENSES;md5=3D1541fd8f5e8f15=
79512bf05f533371ba \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://COPYING;md5=3Db234ee4d69f5fce4486a80=
fdaf4a4263 \<br>
<br>
I don&#39;t mind updating this but I think we&#39;d need to add something t=
o<br>
LIC_FILES_CHKSUM to show where the context under BSD* is...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--00000000000084157905dfac5a5e--

