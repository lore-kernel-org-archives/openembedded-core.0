Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AA9C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 13:26:07 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.27960.1658755561028975737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 06:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mWxNSXVJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id l14so8165843qtv.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZAatTEdzfRXHFYxmcTFH00JWuRQeOa1q6I3NVr1t1w0=;
        b=mWxNSXVJn4udEWCuAPJuRVz+lxkgzOIuSjcTG7HD9eYkUx/Nls+rtre0izDwvxojV9
         VwIc5064NJriUqfnghd8Mw9CzA2s84Ci2rHoBFEiaFDzeN/OMkUhjr2JbZvOPGtjmu/O
         9dw93dw9ZknaM1e/xXMPJMJyiCaaf24Y2PmpIEJONgqYcByE0y/TxCzoujhpYNjl0xf/
         C7e5MYOGUBkWYPwyaTpQAtElkmQntUZQGmpayuEGL1HYGnnDMhnU67UxYyNLaTLBRTX2
         xK+JlCzBw03R9/CmxEWOaCw3QW+esFKpyC6cm86h6DQ4BT1AgH7L7ytmcKEh0rya7tc6
         Nqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZAatTEdzfRXHFYxmcTFH00JWuRQeOa1q6I3NVr1t1w0=;
        b=R7Qm9YiVwWCRDyxMjwYF+gDWoTEFUzF1HuUueVoy4f7mhxq6+zOKS/WT0LeJfOUygp
         F7i3z9mRFO+qbEfQDrRgcEKtzJh+Y0JjwVsw+uI5OxTVkt7isus2R6DA9GkDPh7jPAAL
         ZGknnNgwh2qCszrQTnBIMn27pwQVuRN9Rn51pxr6vzNwlyEVolbQNf+lMFRt7A819Hcw
         bipfgoDg0ccw6HMieQx76JcCbMdOcaUP4q/Pn0YjlQ9PjYEUUwfrvVY5TXoMhuAuTy8w
         9U1ZfzSpqIsiy4VpvPnkd4dnP98rteNRcfnAtbnNirjWbM+JvausquqhVv18JPQDFLqb
         vQcg==
X-Gm-Message-State: AJIora/XbybtT+jdp2X3SAdHdYUERq7INHFToFcnQOnbTqg0YtW7OAou
	JvdGu44L6leRqRShzYWTFIMFcLTCrAURqTDjhIMIvllMgZY=
X-Google-Smtp-Source: 
 AGRyM1svZ8wGC+hGZhj4pQmkPdXQ7FyiEBrPb3bpDiuOO9CbrODGDAY270Seu2nn4N63cIVWlMy9gZkCzVTJXPyk5Ws=
X-Received: by 2002:ac8:5e4f:0:b0:31e:d96f:a4e7 with SMTP id
 i15-20020ac85e4f000000b0031ed96fa4e7mr10228887qtx.634.1658755559755; Mon, 25
 Jul 2022 06:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220705070318.737747-1-mingli.yu@windriver.com>
 <7af70882-4835-2316-5c54-52318b5e7d4b@gmail.com>
 <fd32991d-822a-b452-5c5e-b367b8542961@windriver.com>
 <CAMKF1sqXMhjrhBpNDPiBruZFY03hNb3zPUATQ2Xy=xmDj3O-1A@mail.gmail.com>
 <aa97c7be-febb-b203-71dc-1699c2ce4326@windriver.com>
In-Reply-To: <aa97c7be-febb-b203-71dc-1699c2ce4326@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Jul 2022 09:25:48 -0400
Message-ID: 
 <CAMKF1sqgjkyussC5jEVtEDC3Gkd8DibMfACXXP5Aq-MtT+yeGA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] strace: set COMPATIBLE_HOST for riscv32
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e8955305e4a11f23"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 13:26:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168484

--000000000000e8955305e4a11f23
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2022 at 1:56 AM Yu, Mingli <mingli.yu@windriver.com> wrote:

> Hi Khem,
>
> On 7/20/22 20:14, Khem Raj wrote:
> > **[Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> >
> >
> > On Wed, Jul 20, 2022 at 5:35 AM Yu, Mingli <mingli.yu@windriver.com
> > <mailto:mingli.yu@windriver.com>> wrote:
> >
> >     Hi Khem,
> >
> >     On 7/5/22 21:39, Khem Raj wrote:
> >      > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >      >
> >      > On 7/5/22 3:03 AM, Yu, Mingli wrote:
> >      >> From: Mingli Yu <mingli.yu@windriver.com
> >     <mailto:mingli.yu@windriver.com>>
> >      >>
> >      >> Disable the build on riscv32 as it's not supported on riscv32
> [1].
> >      >>
> >      >> [1]
> >      >>
> >
> https://github.com/strace/strace/commit/69ff62ea5087506ad36a27599db088096=
db215da
> >     <
> https://urldefense.com/v3/__https://github.com/strace/strace/commit/69ff6=
2ea5087506ad36a27599db088096db215da__;!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ4B=
ahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLgvWe7uKs$
> >
> >
> >      >>
> >      >>
> >      >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com
> >     <mailto:mingli.yu@windriver.com>>
> >      >> ---
> >      >>   meta/recipes-devtools/strace/strace_5.18.bb
> >     <
> https://urldefense.com/v3/__http://strace_5.18.bb__;!!AjveYdw8EvQ!d673WVM=
yl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLg5BtLgG=
c$
> >
> >     | 3 +++
> >      >>   1 file changed, 3 insertions(+)
> >      >>
> >      >> diff --git a/meta/recipes-devtools/strace/strace_5.18.bb
> >     <
> https://urldefense.com/v3/__http://strace_5.18.bb__;!!AjveYdw8EvQ!d673WVM=
yl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLg5BtLgG=
c$
> >
> >
> >      >> b/meta/recipes-devtools/strace/strace_5.18.bb
> >     <
> https://urldefense.com/v3/__http://strace_5.18.bb__;!!AjveYdw8EvQ!d673WVM=
yl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLg5BtLgG=
c$
> >
> >      >> index 08f0f1d27e..75ff58bd50 100644
> >      >> --- a/meta/recipes-devtools/strace/strace_5.18.bb
> >     <
> https://urldefense.com/v3/__http://strace_5.18.bb__;!!AjveYdw8EvQ!d673WVM=
yl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLg5BtLgG=
c$
> >
> >      >> +++ b/meta/recipes-devtools/strace/strace_5.18.bb
> >     <
> https://urldefense.com/v3/__http://strace_5.18.bb__;!!AjveYdw8EvQ!d673WVM=
yl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLg5BtLgG=
c$
> >
> >      >> @@ -18,6 +18,9 @@ SRC_URI[sha256sum] =3D
> >      >> "60293ea79ac9253d600cdc9be077ad2988ca22284a439c9e66be5150db
> >      >>
> >      >>   inherit autotools ptest
> >      >>
> >      >> +# Not yet ported to rv32
> >      >> +COMPATIBLE_HOST:riscv32 =3D "null"
> >      >> +
> >      >
> >      > there might be more changes needed especially in package groups
> >     perhaps.
> >
> >     What do you mean when you mentioned package groups here?
> >
> >     There comes do_configure error as below:
> >     | checking for supported architecture... NO!
> >     | configure: error: architecture riscv32 is not supported by strace
> >     | NOTE: The following config.log files may provide further
> information.
> >     | NOTE:
> >
>  /buildarea/build/tmp-glibc/work/riscv32-wrs-linux/strace/5.18-r0/build/c=
onfig.log
> >     | ERROR: configure failed
> >     | WARNING: exit code 1 from a shell command.
> >
> >     Considering no support for riscv32 until now as
> >
> https://github.com/strace/strace/commit/69ff62ea5087506ad36a27599db088096=
db215da
> >     <
> https://urldefense.com/v3/__https://github.com/strace/strace/commit/69ff6=
2ea5087506ad36a27599db088096db215da__;!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ4B=
ahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLgvWe7uKs$
> >,
> >
> >     so we set COMPATIBLE_HOST for riscv32.
> >
> >
> > That=E2=80=99s fine. I think strace is added in some other places to im=
ages and
> > package groups you might have to remove it for rv32 from them
> >
>
> The strace for rv32 has already excluded in package group as
>
> https://git.openembedded.org/openembedded-core/commit/?id=3Dbec777887e7ee=
d9a12b08231a612aaf19b622614
> .


Thanks I am ok with this patch then

>
>
> Thanks,
>
> >
> >     Thanks,
> >
> >      >
> >      >>   PACKAGECONFIG:class-target ??=3D "\
> >      >>       ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth',
> 'bluez',
> >      >> '', d)} \
> >      >>   "
> >      >>
> >      >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >      >> Links: You receive all messages sent to this group.
> >      >> View/Reply Online (#167640):
> >      >>
> >     https://lists.openembedded.org/g/openembedded-core/message/167640
> >     <
> https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded=
-core/message/167640__;!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S=
9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLgnVp3icY$
> >
> >      >> Mute This Topic:
> >     https://lists.openembedded.org/mt/92180245/1997914
> >     <
> https://urldefense.com/v3/__https://lists.openembedded.org/mt/92180245/19=
97914__;!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH=
2_xYSt5fUlR_1bzG8tBtYLgRjA59ns$
> >
> >      >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> >      >> Unsubscribe:
> >     https://lists.openembedded.org/g/openembedded-core/unsub
> >     <
> https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded=
-core/unsub__;!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86=
MPAabH2_xYSt5fUlR_1bzG8tBtYLgVRirgww$
> >
> >
> >      >> [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
> >      >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >      >>
> >
>

--000000000000e8955305e4a11f23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jul 25, 2022 at 1:56 AM Yu, Mingli &lt;<a href=3D"m=
ailto:mingli.yu@windriver.com">mingli.yu@windriver.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Hi Khem,<br>
<br>
On 7/20/22 20:14, Khem Raj wrote:<br>
&gt; **[Please note: This e-mail is from an EXTERNAL e-mail address]<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Wed, Jul 20, 2022 at 5:35 AM Yu, Mingli &lt;<a href=3D"mailto:mingl=
i.yu@windriver.com" target=3D"_blank">mingli.yu@windriver.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:mingli.yu@windriver.com" target=3D"_blank=
">mingli.yu@windriver.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Khem,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 7/5/22 21:39, Khem Raj wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; [Please note: This e-mail is from an EXTERNAL=
 e-mail address]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On 7/5/22 3:03 AM, Yu, Mingli wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; From: Mingli Yu &lt;<a href=3D"mailto:min=
gli.yu@windriver.com" target=3D"_blank">mingli.yu@windriver.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mingli.yu@windriver.co=
m" target=3D"_blank">mingli.yu@windriver.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Disable the build on riscv32 as it&#39;s =
not supported on riscv32 [1].<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; [1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/strace/strace/commit/=
69ff62ea5087506ad36a27599db088096db215da" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/strace/strace/commit/69ff62ea5087506ad36a27599db0880=
96db215da</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__https://=
github.com/strace/strace/commit/69ff62ea5087506ad36a27599db088096db215da__;=
!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5f=
UlR_1bzG8tBtYLgvWe7uKs$" rel=3D"noreferrer" target=3D"_blank">https://urlde=
fense.com/v3/__https://github.com/strace/strace/commit/69ff62ea5087506ad36a=
27599db088096db215da__;!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S=
9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLgvWe7uKs$</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Signed-off-by: Mingli Yu &lt;<a href=3D"m=
ailto:mingli.yu@windriver.com" target=3D"_blank">mingli.yu@windriver.com</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mingli.yu@windriver.co=
m" target=3D"_blank">mingli.yu@windriver.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0 meta/recipes-devtools/strace/<a hr=
ef=3D"http://strace_5.18.bb" rel=3D"noreferrer" target=3D"_blank">strace_5.=
18.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__http://s=
trace_5.18.bb__;!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj=
86MPAabH2_xYSt5fUlR_1bzG8tBtYLg5BtLgGc$" rel=3D"noreferrer" target=3D"_blan=
k">https://urldefense.com/v3/__http://strace_5.18.bb__;!!AjveYdw8EvQ!d673WV=
Myl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLg5BtLg=
Gc$</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0| 3 +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0 1 file changed, 3 insertions(+)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; diff --git a/meta/recipes-devtools/strace=
/<a href=3D"http://strace_5.18.bb" rel=3D"noreferrer" target=3D"_blank">str=
ace_5.18.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__http://s=
trace_5.18.bb__;!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj=
86MPAabH2_xYSt5fUlR_1bzG8tBtYLg5BtLgGc$" rel=3D"noreferrer" target=3D"_blan=
k">https://urldefense.com/v3/__http://strace_5.18.bb__;!!AjveYdw8EvQ!d673WV=
Myl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLg5BtLg=
Gc$</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; b/meta/recipes-devtools/strace/<a href=3D=
"http://strace_5.18.bb" rel=3D"noreferrer" target=3D"_blank">strace_5.18.bb=
</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__http://s=
trace_5.18.bb__;!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj=
86MPAabH2_xYSt5fUlR_1bzG8tBtYLg5BtLgGc$" rel=3D"noreferrer" target=3D"_blan=
k">https://urldefense.com/v3/__http://strace_5.18.bb__;!!AjveYdw8EvQ!d673WV=
Myl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLg5BtLg=
Gc$</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; index 08f0f1d27e..75ff58bd50 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; --- a/meta/recipes-devtools/strace/<a hre=
f=3D"http://strace_5.18.bb" rel=3D"noreferrer" target=3D"_blank">strace_5.1=
8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__http://s=
trace_5.18.bb__;!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj=
86MPAabH2_xYSt5fUlR_1bzG8tBtYLg5BtLgGc$" rel=3D"noreferrer" target=3D"_blan=
k">https://urldefense.com/v3/__http://strace_5.18.bb__;!!AjveYdw8EvQ!d673WV=
Myl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLg5BtLg=
Gc$</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +++ b/meta/recipes-devtools/strace/<a hre=
f=3D"http://strace_5.18.bb" rel=3D"noreferrer" target=3D"_blank">strace_5.1=
8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__http://s=
trace_5.18.bb__;!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj=
86MPAabH2_xYSt5fUlR_1bzG8tBtYLg5BtLgGc$" rel=3D"noreferrer" target=3D"_blan=
k">https://urldefense.com/v3/__http://strace_5.18.bb__;!!AjveYdw8EvQ!d673WV=
Myl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLg5BtLg=
Gc$</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; @@ -18,6 +18,9 @@ SRC_URI[sha256sum] =3D<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &quot;60293ea79ac9253d600cdc9be077ad2988c=
a22284a439c9e66be5150db<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0 inherit autotools ptest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +# Not yet ported to rv32<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +COMPATIBLE_HOST:riscv32 =3D &quot;null&q=
uot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; there might be more changes needed especially=
 in package groups<br>
&gt;=C2=A0 =C2=A0 =C2=A0perhaps.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0What do you mean when you mentioned package groups =
here?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0There comes do_configure error as below:<br>
&gt;=C2=A0 =C2=A0 =C2=A0| checking for supported architecture... NO!<br>
&gt;=C2=A0 =C2=A0 =C2=A0| configure: error: architecture riscv32 is not sup=
ported by strace<br>
&gt;=C2=A0 =C2=A0 =C2=A0| NOTE: The following config.log files may provide =
further information.<br>
&gt;=C2=A0 =C2=A0 =C2=A0| NOTE:<br>
&gt;=C2=A0 =C2=A0 =C2=A0/buildarea/build/tmp-glibc/work/riscv32-wrs-linux/s=
trace/5.18-r0/build/config.log<br>
&gt;=C2=A0 =C2=A0 =C2=A0| ERROR: configure failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0| WARNING: exit code 1 from a shell command.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Considering no support for riscv32 until now as<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/strace/strace/commit/=
69ff62ea5087506ad36a27599db088096db215da" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/strace/strace/commit/69ff62ea5087506ad36a27599db0880=
96db215da</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__https://=
github.com/strace/strace/commit/69ff62ea5087506ad36a27599db088096db215da__;=
!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5f=
UlR_1bzG8tBtYLgvWe7uKs$" rel=3D"noreferrer" target=3D"_blank">https://urlde=
fense.com/v3/__https://github.com/strace/strace/commit/69ff62ea5087506ad36a=
27599db088096db215da__;!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S=
9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLgvWe7uKs$</a>&gt;,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0so we set COMPATIBLE_HOST for riscv32.<br>
&gt; <br>
&gt; <br>
&gt; That=E2=80=99s fine. I think strace is added in some other places to i=
mages and <br>
&gt; package groups you might have to remove it for rv32 from them<br>
&gt; <br>
<br>
The strace for rv32 has already excluded in package group as <br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3Dbec7=
77887e7eed9a12b08231a612aaf19b622614" rel=3D"noreferrer" target=3D"_blank">=
https://git.openembedded.org/openembedded-core/commit/?id=3Dbec777887e7eed9=
a12b08231a612aaf19b622614</a>.</blockquote><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Thanks I am ok with this patch then</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex" dir=3D"auto"><br>
<br>
Thanks,<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0 PACKAGECONFIG:class-target ??=3D &=
quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.util=
s.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluetooth&#39;, &#39;bluez&#39;,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0 &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Links: You receive all messages sent to t=
his group.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; View/Reply Online (#167640):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/message/167640" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-core/message/167640</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__https://=
lists.openembedded.org/g/openembedded-core/message/167640__;!!AjveYdw8EvQ!d=
673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLg=
nVp3icY$" rel=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3/__=
https://lists.openembedded.org/g/openembedded-core/message/167640__;!!AjveY=
dw8EvQ!d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bz=
G8tBtYLgnVp3icY$</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Mute This Topic:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/mt/921802=
45/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/mt/92180245/1997914</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__https://=
lists.openembedded.org/mt/92180245/1997914__;!!AjveYdw8EvQ!d673WVMyl0hCL6dO=
FMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLgRjA59ns$" rel=
=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3/__https://lists=
.openembedded.org/mt/92180245/1997914__;!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ=
4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLgRjA59ns$</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Group Owner: <a href=3D"mailto:openembedd=
ed-core%2Bowner@lists.openembedded.org" target=3D"_blank">openembedded-core=
+owner@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%252B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core%2Bowner@l=
ists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Unsubscribe:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__https://=
lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!d673WVMyl0=
hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLgVRirgww$"=
 rel=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3/__https://l=
ists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!d673WVMyl0h=
CL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLgVRirgww$</=
a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; [<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a> &lt;mailto:<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; <br>
</blockquote></div></div>

--000000000000e8955305e4a11f23--

