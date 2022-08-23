Return-Path: <mateuszmar2@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCEEC32792
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 09:38:20 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web12.29358.1661247493392979989
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 02:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LWTqBPpM;
 spf=pass (domain: gmail.com, ip: 209.85.160.44,
 mailfrom: mateuszmar2@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so16126410fac.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 02:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=1GLxFRDZuU/4q2pWG563dgeMCe9CwI7LiA9jzooh78U=;
        b=LWTqBPpMXwt4+p1iFQkEB9rhWORJO72HTrsR3zoUT7yM1l3CaBsJXJ0As6a1jqCiyj
         oHq1bBAYJtWL3TeNlXFD6kManqyGa66ulEARUb6w3NG3ZNLQz6O/6+QvepxUPZAEE7eY
         p9nEXKE/E+0edDFbqx5bubMw/i6YfDxiGab6pj9+tAK2ZDyRzKhwwVponHav1htT+Svk
         v7jDUQsmyHwRuoTs674SJCuY+5yRhqAEDvRsOk9iPaal6v7RkQ7Ah8xQ4R/CjTy5savv
         iR8qfzn32sh1SQd5nvkMbe34j7LSAeSG4oBs35nkFi1GbSeM0ogrtNIR+GFoUhcEj5wp
         Zeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=1GLxFRDZuU/4q2pWG563dgeMCe9CwI7LiA9jzooh78U=;
        b=kGqzhUJEYHJCTTlVdoZ4KwORdI5OFhM4P1FD/MGv18frWYUDbidRpD3cn/I6l2KsFr
         Ms3FwsYkNjUJkgF7L+sCWwy7I0J1CB03NgQxLArA/JVJvxsL7hkwwhEAw6qbeeNsdEtU
         E459DHzkzYz5dvxGlLjCZx2NeMS4uXrjbif6fP1CYiiqE+fqchjzbvSBI9x7KE2x1/Sg
         kxcfLSz958YZE9MfOR99pzDQD2/0dcYG06feS0EAOz6hu1Qw5v/YtCpsRpzlowIJXEED
         DbDqFQ+W0LNqVzqBoSu68DUiUuo1V6QEezy3qVnipIB3x9rFSySVgR4RgYOnRCenXkfO
         +wQA==
X-Gm-Message-State: ACgBeo141FyY243hYQv+hRZCQXZF7IVZslnhidPI3tSG4RMVrQnt133b
	BqPmXK9aYQ9IplrVtw4A3+rHVGuVQLHGPqK6X2E=
X-Google-Smtp-Source: 
 AA6agR6cM2ls5HlrFiqfRBNtuKpL5Gv94AZYrTK8gDcC+hbf4VYoSzj9F55FuViHz9qvLojEp6CE8VOfFHO0fZbXjuY=
X-Received: by 2002:a05:6870:4597:b0:11c:ab4e:9fe8 with SMTP id
 y23-20020a056870459700b0011cab4e9fe8mr1051926oao.123.1661247492724; Tue, 23
 Aug 2022 02:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220819113336.3167-1-mateuszmar2@gmail.com>
 <fedbfff08c3f42e693fe007d4066d0cf@axis.com>
In-Reply-To: <fedbfff08c3f42e693fe007d4066d0cf@axis.com>
From: Mateusz Marciniec <mateuszmar2@gmail.com>
Date: Tue, 23 Aug 2022 11:38:02 +0200
Message-ID: 
 <CAFZoAkws7N9DrTo1TVoVNftK0bEqQJnry5PWQ43ReMC4xB3+mQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] util-linux: Remove raw flags in EXTRA_OECONF
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b01d3e05e6e55251"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 09:38:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169700

--000000000000b01d3e05e6e55251
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, you are right, I corrected it in the new version of patch.
Thanks for pointing that out.

Best Regards,
Mateusz Marciniec

pt., 19 sie 2022 o 16:38 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
napisa=C5=82(a):

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Mateusz Marciniec
> > Sent: den 19 augusti 2022 13:34
> > To: openembedded-core@lists.openembedded.org
> > Cc: Mateusz Marciniec <mateuszmar2@gmail.com>; Tomasz Dziendzielski
> > <tomasz.dziendzielski@gmail.com>
> > Subject: [OE-core] [PATCH] util-linux: Remove raw flags in EXTRA_OECONF
> >
> > Having both enable and disable flags for raw is confusing.
> > Raw should not be enabled so both flags can be removed.
> >
> > Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
> > Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> > ---
> >  meta/recipes-core/util-linux/util-linux_2.38.1.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb
> > b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
> > index 8a7b47a0c6..a93ae83cd6 100644
> > --- a/meta/recipes-core/util-linux/util-linux_2.38.1.bb
> > +++ b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
> > @@ -69,12 +69,12 @@ EXTRA_OECONF =3D "\
> >      --enable-libuuid --enable-libblkid \
> >      \
> >      --enable-fsck --enable-kill --enable-last --enable-mesg \
> > -    --enable-mount --enable-partx --enable-raw --enable-rfkill \
> > +    --enable-mount --enable-partx --enable-rfkill \
> >      --enable-unshare --enable-write \
> >      \
> >      --disable-bfs --disable-login \
> >      --disable-makeinstall-chown --disable-minix --disable-newgrp \
> > -    --disable-use-tty-group --disable-vipw --disable-raw \
> > +    --disable-use-tty-group --disable-vipw \
>
> A quick look in configure.ac for util-linux indicates that it will
> start to look for linux/raw.h and enable raw support if it exists
> if you remove the --disable-raw option. So you should leave the
> --disable-raw option to maintain the current deterministic behavior.
>
> >      \
> >      --without-udev \
> >      \
> > --
> > 2.37.1
>
> //Peter
>
>

--000000000000b01d3e05e6e55251
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, you are right, I corrected it in the new version of p=
atch.<br>Thanks for=C2=A0pointing that out.<br><br>Best Regards,<br>Mateusz=
 Marciniec</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">pt., 19 sie 2022 o 16:38=C2=A0Peter Kjellerstedt &lt;<a href=3D"m=
ailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; napi=
sa=C5=82(a):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt=
; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Mateusz Marciniec<br>
&gt; Sent: den 19 augusti 2022 13:34<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Mateusz Marciniec &lt;<a href=3D"mailto:mateuszmar2@gmail.com" tar=
get=3D"_blank">mateuszmar2@gmail.com</a>&gt;; Tomasz Dziendzielski<br>
&gt; &lt;<a href=3D"mailto:tomasz.dziendzielski@gmail.com" target=3D"_blank=
">tomasz.dziendzielski@gmail.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH] util-linux: Remove raw flags in EXTRA_OECON=
F<br>
&gt; <br>
&gt; Having both enable and disable flags for raw is confusing.<br>
&gt; Raw should not be enabled so both flags can be removed.<br>
&gt; <br>
&gt; Signed-off-by: Mateusz Marciniec &lt;<a href=3D"mailto:mateuszmar2@gma=
il.com" target=3D"_blank">mateuszmar2@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Tomasz Dziendzielski &lt;<a href=3D"mailto:tomasz.dzien=
dzielski@gmail.com" target=3D"_blank">tomasz.dziendzielski@gmail.com</a>&gt=
;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.38.1=
.bb" rel=3D"noreferrer" target=3D"_blank">util-linux_2.38.1.bb</a> | 4 ++--=
<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/util-linux/<a href=3D"http://util-linux=
_2.38.1.bb" rel=3D"noreferrer" target=3D"_blank">util-linux_2.38.1.bb</a><b=
r>
&gt; b/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.38.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">util-linux_2.38.1.bb</a><br>
&gt; index 8a7b47a0c6..a93ae83cd6 100644<br>
&gt; --- a/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.38.1=
.bb" rel=3D"noreferrer" target=3D"_blank">util-linux_2.38.1.bb</a><br>
&gt; +++ b/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.38.1=
.bb" rel=3D"noreferrer" target=3D"_blank">util-linux_2.38.1.bb</a><br>
&gt; @@ -69,12 +69,12 @@ EXTRA_OECONF =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-libuuid --enable-libblkid \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-fsck --enable-kill --enable-last --enable=
-mesg \<br>
&gt; -=C2=A0 =C2=A0 --enable-mount --enable-partx --enable-raw --enable-rfk=
ill \<br>
&gt; +=C2=A0 =C2=A0 --enable-mount --enable-partx --enable-rfkill \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-unshare --enable-write \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-bfs --disable-login \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-makeinstall-chown --disable-minix --disa=
ble-newgrp \<br>
&gt; -=C2=A0 =C2=A0 --disable-use-tty-group --disable-vipw --disable-raw \<=
br>
&gt; +=C2=A0 =C2=A0 --disable-use-tty-group --disable-vipw \<br>
<br>
A quick look in <a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a> for util-linux indicates that it will <br>
start to look for linux/raw.h and enable raw support if it exists <br>
if you remove the --disable-raw option. So you should leave the <br>
--disable-raw option to maintain the current deterministic behavior.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --without-udev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; --<br>
&gt; 2.37.1<br>
<br>
//Peter<br>
<br>
</blockquote></div>

--000000000000b01d3e05e6e55251--

