Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251A8C61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 16:57:39 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.144091.1700845049944538140
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 08:57:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IwB/uDIx;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3b83fc26e4cso1275047b6e.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 08:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700845049; x=1701449849; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lQn4bRYFnygReri7Olko9b/wq9omqfcAQgYuYKWVvDA=;
        b=IwB/uDIxBo54XqvE02SGJR1UZAGjPXZugiG8PzJtjKrwfnt5HMBR82ibf0B0fNOpw9
         EAKwfNfd2ws4VW5YlIW97DBLL3ww9F6VO50LPKYFnK0cxnBZQG8Muyfe37QS5vtdKT7D
         Yk0i9To+fZfJfWtKWTlYRMKq2LVoOOIFQI78DFfPDUFOXRDqKGPEiUEkO124YNbfXIqJ
         Xq+nMeeGzRB40ksv6oyrb8ug2fqGqJIrChKSTQc5Su6LrYT3aQmZwctjgfak2U4O7HW4
         ziBEbFf7RbnDS4jMgy5CrGNu2F865aeUYCaxhplTWFxMWalS1VHoOdqH1XGpEGZ2wEzp
         yDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700845049; x=1701449849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQn4bRYFnygReri7Olko9b/wq9omqfcAQgYuYKWVvDA=;
        b=UmU7CtFvABZqFnJqAeXH/kTJpShg8gQmOq2DAB3IwKA/uan5G/uGFmLuqMyazh/+ko
         1LfVP5EwaJksEVh5Swzu3BVdy3LrcvrcdFHDcAKHdUwzGNOSU6B9qdvFa3j1or+oC8B5
         CRkYz5r+NuJb8K+fYdIKhu8UgcI7zrZzbSRMIM6f5cOLBMYqmeBr+xLKeJprSvqW3rD7
         A2wPrxhoTt4L0qqFQWjcOrwG0ipESYgnlGeIg5oEH2qeqd0mo668/eUmTwtAUXfVUyFT
         O+8Kf9AKkvfNO1TV5RY0LubYl4+xSqQijKRItslAooF7CbgGRznU1CddI//SipLBIrKE
         WEtA==
X-Gm-Message-State: AOJu0YzJT+Vt77RGv4YILxn9p93ydSohZ02cE0IlErdrIpwhXeO7NGTn
	ZUDgsHVWOkH4f2Wi0s6N/lFTamB8izClNIYM1ko=
X-Google-Smtp-Source: AGHT+IGUfI+pxNII/FLHmEQ8LhvoMmL5NdYOTJ7jEGeRicnA9Z1kZWo1KFRa85A+9kDRdYF1sU/LXhb4T51NZO+v/Js=
X-Received: by 2002:a05:6870:e99a:b0:1fa:126:2b27 with SMTP id
 r26-20020a056870e99a00b001fa01262b27mr2301645oao.50.1700845049028; Fri, 24
 Nov 2023 08:57:29 -0800 (PST)
MIME-Version: 1.0
References: <20231122063119.3620722-1-raj.khem@gmail.com> <462EA886-8F44-464F-88ED-609B42680F39@arm.com>
 <307F70DF-9B9F-4A38-9788-F47DB99193D1@arm.com>
In-Reply-To: <307F70DF-9B9F-4A38-9788-F47DB99193D1@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Nov 2023 08:57:18 -0800
Message-ID: <CAMKF1srK4r=YYB35noP5f30JJMO-cMYUyMMixWFrAP3tdox1+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v9 1/3] vte: upgrade 2.72.2 -> 2.74.0
To: Ross Burton <ross.burton@arm.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Markus Volk <f_l_k@t-online.de>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f723fd060ae8d8cc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 16:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191210

--000000000000f723fd060ae8d8cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 8:24=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

>
>
> > On 24 Nov 2023, at 16:21, Ross Burton via lists.openembedded.org
> <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >
> > On 22 Nov 2023, at 06:31, Khem Raj via lists.openembedded.org <raj.khem=
=3D
> gmail.com@lists.openembedded.org> wrote:
> >> +PACKAGECONFIG ??=3D " \
> >> + gnutls \
> >> + ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> >> + ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gtk4', '', d)} \
> >> +"
> >> +PACKAGECONFIG[gtk4] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4=E2=80=9D
> >
> > So for example a Sato system which is entirely 100% GTK+3 will now also
> pull in the entire GTK4 stack, right?
> >
> > That=E2=80=99s clearly and obviously the wrong thing to do.
> >
> > Split the packages so that the GTK3 binaries are in separate packages t=
o
> the GTK4 binaries.
>

Hmm interesting I wonder if it Will avoid adding the dependencies for dbg
and dev packages

>
> I can only presume nobody looks at buildhistory-diff, but this isn=E2=80=
=99t a
> subtle problem:




>
> packages/core2-64-poky-linux/vte/vte-dbg: PKGSIZE changed from 7057208 to
> 14127056 (+100%)
> packages/core2-64-poky-linux/vte/vte-dbg: RRECOMMENDS: removed
> "fribidi-dbg", added "gtk4-dbg libsystemd-dbg"
> packages/core2-64-poky-linux/vte/vte-dev: RDEPENDS: added "gtk4-dev
> cairo-dev"
> packages/core2-64-poky-linux/vte/vte-dev: PKGSIZE changed from 391257 to
> 815848 (+109%)
> packages/core2-64-poky-linux/vte/vte-dev: RRECOMMENDS: removed
> "fribidi-dev", added "vala-dev libsystemd-dev gtk4-dev systemd-dev"
> packages/core2-64-poky-linux/vte/vte-dev: FILELIST: added
> "/usr/include/vte-2.91-gtk4/vte/vte.h
> /usr/include/vte-2.91-gtk4/vte/vteglobals.h
> /usr/include/vte-2.91-gtk4/vte/vteenums.h
> /usr/include/vte-2.91-gtk4/vte/vteterminal.h
> /usr/share/gir-1.0/Vte-3.91.gir /usr/share/vala/vapi/vte-2.91-gtk4.vapi
> /usr/include/vte-2.91-gtk4/vte/vtemacros.h
> /usr/include/vte-2.91-gtk4/vte/vteregex.h
> /usr/share/vala/vapi/vte-2.91.deps /usr/include/vte-2.91-gtk4/vte/vtepty.=
h
> /usr/lib/libvte-2.91-gtk4.so /usr/share/vala/vapi/vte-2.91-gtk4.deps
> /usr/share/vala/vapi/vte-2.91.vapi
> /usr/include/vte-2.91-gtk4/vte/vtedeprecated.h
> /usr/include/vte-2.91-gtk4/vte/vtetypebuiltins.h
> /usr/lib/pkgconfig/vte-2.91-gtk4.pc
> /usr/include/vte-2.91-gtk4/vte/vtetypebuiltins-gtk4.h
> /usr/include/vte-2.91-gtk4/vte/vteversion.h"
> packages/core2-64-poky-linux/vte/vte-locale-el: PKGSIZE changed from 1278
> to 1622 (+27%)
> packages/core2-64-poky-linux/vte/vte: RDEPENDS: added "gtk4 (['>=3D
> 4.12.3'])"
> packages/core2-64-poky-linux/vte/vte: PKGSIZE changed from 93336 to 17846=
6
> (+91%)
> packages/core2-64-poky-linux/vte/vte: FILELIST: added
> "/usr/lib/systemd/user/vte-spawn-.scope.d/defaults.conf
> /usr/bin/vte-2.91-gtk4=E2=80=9D
>
> Ross

--000000000000f723fd060ae8d8cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Nov 24, 2023 at 8:24=E2=80=AFAM Ross Burton &lt;<a =
href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; On 24 Nov 2023, at 16:21, Ross Burton via <a href=3D"http://lists.open=
embedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</=
a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org" targ=
et=3D"_blank">arm.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; On 22 Nov 2023, at 06:31, Khem Raj via <a href=3D"http://lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> =
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt; +PACKAGECONFIG ??=3D &quot; \<br>
&gt;&gt; + gnutls \<br>
&gt;&gt; + ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;,=
 d)} \<br>
&gt;&gt; + ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;=
, &#39;gtk4&#39;, &#39;&#39;, d)} \<br>
&gt;&gt; +&quot;<br>
&gt;&gt; +PACKAGECONFIG[gtk4] =3D &quot;-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4=
=E2=80=9D<br>
&gt; <br>
&gt; So for example a Sato system which is entirely 100% GTK+3 will now als=
o pull in the entire GTK4 stack, right?<br>
&gt; <br>
&gt; That=E2=80=99s clearly and obviously the wrong thing to do.<br>
&gt; <br>
&gt; Split the packages so that the GTK3 binaries are in separate packages =
to the GTK4 binaries.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Hmm interesting =
I wonder if it Will avoid adding the dependencies for dbg and dev packages=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><br>
I can only presume nobody looks at buildhistory-diff, but this isn=E2=80=99=
t a subtle problem:</blockquote><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
packages/core2-64-poky-linux/vte/vte-dbg: PKGSIZE changed from 7057208 to 1=
4127056 (+100%)<br>
packages/core2-64-poky-linux/vte/vte-dbg: RRECOMMENDS: removed &quot;fribid=
i-dbg&quot;, added &quot;gtk4-dbg libsystemd-dbg&quot;<br>
packages/core2-64-poky-linux/vte/vte-dev: RDEPENDS: added &quot;gtk4-dev ca=
iro-dev&quot;<br>
packages/core2-64-poky-linux/vte/vte-dev: PKGSIZE changed from 391257 to 81=
5848 (+109%)<br>
packages/core2-64-poky-linux/vte/vte-dev: RRECOMMENDS: removed &quot;fribid=
i-dev&quot;, added &quot;vala-dev libsystemd-dev gtk4-dev systemd-dev&quot;=
<br>
packages/core2-64-poky-linux/vte/vte-dev: FILELIST: added &quot;/usr/includ=
e/vte-2.91-gtk4/vte/vte.h /usr/include/vte-2.91-gtk4/vte/vteglobals.h /usr/=
include/vte-2.91-gtk4/vte/vteenums.h /usr/include/vte-2.91-gtk4/vte/vteterm=
inal.h /usr/share/gir-1.0/Vte-3.91.gir /usr/share/vala/vapi/vte-2.91-gtk4.v=
api /usr/include/vte-2.91-gtk4/vte/vtemacros.h /usr/include/vte-2.91-gtk4/v=
te/vteregex.h /usr/share/vala/vapi/vte-2.91.deps /usr/include/vte-2.91-gtk4=
/vte/vtepty.h /usr/lib/<a href=3D"http://libvte-2.91-gtk4.so" rel=3D"norefe=
rrer" target=3D"_blank">libvte-2.91-gtk4.so</a> /usr/share/vala/vapi/vte-2.=
91-gtk4.deps /usr/share/vala/vapi/vte-2.91.vapi /usr/include/vte-2.91-gtk4/=
vte/vtedeprecated.h /usr/include/vte-2.91-gtk4/vte/vtetypebuiltins.h /usr/l=
ib/pkgconfig/vte-2.91-gtk4.pc /usr/include/vte-2.91-gtk4/vte/vtetypebuiltin=
s-gtk4.h /usr/include/vte-2.91-gtk4/vte/vteversion.h&quot;<br>
packages/core2-64-poky-linux/vte/vte-locale-el: PKGSIZE changed from 1278 t=
o 1622 (+27%)<br>
packages/core2-64-poky-linux/vte/vte: RDEPENDS: added &quot;gtk4 ([&#39;&gt=
;=3D 4.12.3&#39;])&quot;<br>
packages/core2-64-poky-linux/vte/vte: PKGSIZE changed from 93336 to 178466 =
(+91%)<br>
packages/core2-64-poky-linux/vte/vte: FILELIST: added &quot;/usr/lib/system=
d/user/vte-spawn-.scope.d/defaults.conf /usr/bin/vte-2.91-gtk4=E2=80=9D<br>
<br>
Ross</blockquote></div></div>

--000000000000f723fd060ae8d8cc--

