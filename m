Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D538C3DA7F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 04:35:35 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.35776.1722400528686002093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 21:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CcCRdK2T;
 spf=pass (domain: mvista.com, ip: 209.85.208.175, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ef32fea28dso62792001fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 21:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1722400526; x=1723005326; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VL62baI3GaWqrXws2fsmHQj8qvABXczxyjUaWl8ejGo=;
        b=CcCRdK2Thiv/ttyRmMj48tK3aAItKvoJSkAT6c+6aimZaOWCFYiXOGhH8HnO3D6qkB
         AJsyeYVRkVPzns7S8BKbcGSaD0F4hgIDlwOaeXeoccHN2phBr+2zJkRXlZ/YF0ZTJ/66
         m6TyyqLLAKYx8VRXiDxOtWG8pkBEqUGWLtP+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722400526; x=1723005326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VL62baI3GaWqrXws2fsmHQj8qvABXczxyjUaWl8ejGo=;
        b=dOrtYACtP6eQ2lnz075IxcazF8h9Em0WmT/1JzeF8GCVU20brbJ8LiqF9HynKLkSmQ
         mrRFHtPbXV1sMW2ZCp7b0z3W23TfUCXiSTusiUEIx2E866qbKxzjKc5jDNjjNQAYeGtP
         mZqP1RFBN9F4HM/zPi7zTUhwExd1wucxOLcrb31b3ookjZNt+/hVOUv/K5rLcXeOY7Ak
         jw8zWhgYjSetHu474nl5Tl6MN08znbzqm5CG3Q8taaSmDt/un/4ITozFsrCya+YFkjhi
         AChxuZeHqQIy3TrPmPUKuA+xpCEee3XProEDO/QiaL8CkbJnDlvsWd84VjcQCPOMnn0n
         yGwg==
X-Gm-Message-State: AOJu0YzkoFGQZW6GaK42YADsdIcyva/0YU69Mllh/XJk4z7SJHbwUKqO
	tYXRnAX0lQv2M5PlamtmBKgvJIdQ4eGoufP8FLp1/sZ5CTQQLS8Y7VfHpUXRW6rWYnrxNlzqm/5
	XdAeU8Hj1hlAXWQ/69n11sUVnyLL2ZYE5nackMQ==
X-Google-Smtp-Source: AGHT+IFpk3yfLhyqDvr7IOu51X9T84x+snr+1c8MKtTA5+vi4Dh1Q+I7PVp8YqQ3pje64svz2Gt36sck8pqwCUQHclQ=
X-Received: by 2002:a2e:b601:0:b0:2ef:22e5:b96b with SMTP id
 38308e7fff4ca-2f12ecd2840mr80008931fa.19.1722400525962; Tue, 30 Jul 2024
 21:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240730101039.1757198-1-vanusuri@mvista.com> <CAOSpxdY3A+q1sPGWDyDiNQ5kf74yjQ=8fFs=YBubYVyA+ZfycA@mail.gmail.com>
In-Reply-To: <CAOSpxdY3A+q1sPGWDyDiNQ5kf74yjQ=8fFs=YBubYVyA+ZfycA@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 31 Jul 2024 10:05:13 +0530
Message-ID: <CANQUz1908j2hSP=RA=rEOB8PzvCZkUdoeMuJ4wQV8TsYZv+4sA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] orc: upgrade 0.4.38 -> 0.4.39
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000082ebcc061e839f8b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 04:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202689

--00000000000082ebcc061e839f8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok Steve.

Patch for master has already been submitted.

https://lists.openembedded.org/g/openembedded-core/message/202585

Thanks & Regards,
Vijay

On Tue, Jul 30, 2024 at 7:47=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

>  I won't be able to take this patch until it hits master first.
>
> Steve
>
> On Tue, Jul 30, 2024 at 3:10=E2=80=AFAM Vijay Anusuri via
> lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
> wrote:
> >
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Changelog:
> >
> > - Security: Fix error message printing buffer overflow leading to
> possible
> >   code executation in orcc with specific input files (CVE-2024-40897).
> This
> >   only affects developers and CI environments using orcc, not users of
> liborc
> >   (Sebastian Dr=C3=B6ge, L. E. Segovia)
> > - div255w: fix off-by-one error in the implementations (L. E. Segovia)
> > - x86: only run AVX detection if xgetbv is available (L. E. Segovia)
> > - x86: fix AVX detection by implementing the check recommended by Intel
> (L. E. Segovia)
> > - Only enable JIT compilation on Apple arm64 if running on macOS, fixes
> crashes on iOS (Piotr Brzezi=C5=84ski)
> > - Fix potential crash in emulation mode if logging is enabled (L. E.
> Segovia)
> > - Handle undefined TARGET_OS_OSX correctly (Joshua Root)
> > - orconce: Fix typo in GCC __sync-based implementation (Jakub Van=C4=9B=
k)
> > - orconce: Fix usage of __STDC_NO_ATOMICS__ (Alexander Slobodeniuk)
> > - Fix build with MSVC 17.10 + C11 (L. E. Segovia)
> > - Support stack unwinding on Windows (L. E. Segovia)
> > - Major opcode and instruction set code clean-ups and refactoring (Jorg=
e
> Zapata)
> > - Refactor allocation and chunk initialization of code regions (L. E.
> Segovia)
> > - Fall back to emulation on Linux if JIT support is not available,
> >   e.g. because of SELinux sandboxing or noexec mounting) (L. E. Segovia=
)
> >
> > Ref: https://github.com/GStreamer/orc/blob/0.4.39/RELEASE
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  meta/recipes-devtools/orc/{orc_0.4.38.bb =3D> orc_0.4.39.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-devtools/orc/{orc_0.4.38.bb =3D> orc_0.4.39.bb} (9=
2%)
> >
> > diff --git a/meta/recipes-devtools/orc/orc_0.4.38.bb
> b/meta/recipes-devtools/orc/orc_0.4.39.bb
> > similarity index 92%
> > rename from meta/recipes-devtools/orc/orc_0.4.38.bb
> > rename to meta/recipes-devtools/orc/orc_0.4.39.bb
> > index 5d2296694a..320abf536a 100644
> > --- a/meta/recipes-devtools/orc/orc_0.4.38.bb
> > +++ b/meta/recipes-devtools/orc/orc_0.4.39.bb
> > @@ -5,7 +5,7 @@ LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1400bd9d09e8af56b9ec982b3d8=
5797e"
> >
> >  SRC_URI =3D "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz=
"
> > -SRC_URI[sha256sum] =3D
> "a55a98d4772567aa3faed8fb84d540c3db77eaba16d3e2e10b044fbc9228668d"
> > +SRC_URI[sha256sum] =3D
> "33ed2387f49b825fa1b9c3b0072e05f259141b895474ad085ae51143d3040cc0"
> >
> >  inherit meson pkgconfig gtk-doc
> >
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#202669):
> https://lists.openembedded.org/g/openembedded-core/message/202669
> > Mute This Topic: https://lists.openembedded.org/mt/107625073/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000082ebcc061e839f8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Ok Steve.<br><br></div>Patch for master has alre=
ady been submitted.<br><br><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/202585">https://lists.openembedded.org/g/openembedded=
-core/message/202585</a><br><br></div><div>Thanks &amp; Regards,</div><div>=
Vijay<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jul 30, 2024 at 7:47=E2=80=AFPM Steve Sakoman &lt;<=
a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0I won&#39;t be a=
ble to take this patch until it hits master first.<br>
<br>
Steve<br>
<br>
On Tue, Jul 30, 2024 at 3:10=E2=80=AFAM Vijay Anusuri via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@=
lists.openembedded.org" target=3D"_blank">mvista.com@lists.openembedded.org=
</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Changelog:<br>
&gt;<br>
&gt; - Security: Fix error message printing buffer overflow leading to poss=
ible<br>
&gt;=C2=A0 =C2=A0code executation in orcc with specific input files (CVE-20=
24-40897). This<br>
&gt;=C2=A0 =C2=A0only affects developers and CI environments using orcc, no=
t users of liborc<br>
&gt;=C2=A0 =C2=A0(Sebastian Dr=C3=B6ge, L. E. Segovia)<br>
&gt; - div255w: fix off-by-one error in the implementations (L. E. Segovia)=
<br>
&gt; - x86: only run AVX detection if xgetbv is available (L. E. Segovia)<b=
r>
&gt; - x86: fix AVX detection by implementing the check recommended by Inte=
l (L. E. Segovia)<br>
&gt; - Only enable JIT compilation on Apple arm64 if running on macOS, fixe=
s crashes on iOS (Piotr Brzezi=C5=84ski)<br>
&gt; - Fix potential crash in emulation mode if logging is enabled (L. E. S=
egovia)<br>
&gt; - Handle undefined TARGET_OS_OSX correctly (Joshua Root)<br>
&gt; - orconce: Fix typo in GCC __sync-based implementation (Jakub Van=C4=
=9Bk)<br>
&gt; - orconce: Fix usage of __STDC_NO_ATOMICS__ (Alexander Slobodeniuk)<br=
>
&gt; - Fix build with MSVC 17.10 + C11 (L. E. Segovia)<br>
&gt; - Support stack unwinding on Windows (L. E. Segovia)<br>
&gt; - Major opcode and instruction set code clean-ups and refactoring (Jor=
ge Zapata)<br>
&gt; - Refactor allocation and chunk initialization of code regions (L. E. =
Segovia)<br>
&gt; - Fall back to emulation on Linux if JIT support is not available,<br>
&gt;=C2=A0 =C2=A0e.g. because of SELinux sandboxing or noexec mounting) (L.=
 E. Segovia)<br>
&gt;<br>
&gt; Ref: <a href=3D"https://github.com/GStreamer/orc/blob/0.4.39/RELEASE" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/GStreamer/orc/blob/=
0.4.39/RELEASE</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/orc/{<a href=3D"http://orc_0.4.38.bb" rel=
=3D"noreferrer" target=3D"_blank">orc_0.4.38.bb</a> =3D&gt; <a href=3D"http=
://orc_0.4.39.bb" rel=3D"noreferrer" target=3D"_blank">orc_0.4.39.bb</a>} |=
 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/orc/{<a href=3D"http://orc_0.4.38.b=
b" rel=3D"noreferrer" target=3D"_blank">orc_0.4.38.bb</a> =3D&gt; <a href=
=3D"http://orc_0.4.39.bb" rel=3D"noreferrer" target=3D"_blank">orc_0.4.39.b=
b</a>} (92%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/orc/<a href=3D"http://orc_0.4.38.bb=
" rel=3D"noreferrer" target=3D"_blank">orc_0.4.38.bb</a> b/meta/recipes-dev=
tools/orc/<a href=3D"http://orc_0.4.39.bb" rel=3D"noreferrer" target=3D"_bl=
ank">orc_0.4.39.bb</a><br>
&gt; similarity index 92%<br>
&gt; rename from meta/recipes-devtools/orc/<a href=3D"http://orc_0.4.38.bb"=
 rel=3D"noreferrer" target=3D"_blank">orc_0.4.38.bb</a><br>
&gt; rename to meta/recipes-devtools/orc/<a href=3D"http://orc_0.4.39.bb" r=
el=3D"noreferrer" target=3D"_blank">orc_0.4.39.bb</a><br>
&gt; index 5d2296694a..320abf536a 100644<br>
&gt; --- a/meta/recipes-devtools/orc/<a href=3D"http://orc_0.4.38.bb" rel=
=3D"noreferrer" target=3D"_blank">orc_0.4.38.bb</a><br>
&gt; +++ b/meta/recipes-devtools/orc/<a href=3D"http://orc_0.4.39.bb" rel=
=3D"noreferrer" target=3D"_blank">orc_0.4.39.bb</a><br>
&gt; @@ -5,7 +5,7 @@ LICENSE =3D &quot;BSD-2-Clause &amp; BSD-3-Clause&quot=
;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1400bd9d09e8af56=
b9ec982b3d85797e&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://gstreamer.freedesktop.org/sr=
c/orc/orc-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://gst=
reamer.freedesktop.org/src/orc/orc-${PV}.tar.xz</a>&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;a55a98d4772567aa3faed8fb84d540c3db77eaba=
16d3e2e10b044fbc9228668d&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;33ed2387f49b825fa1b9c3b0072e05f259141b89=
5474ad085ae51143d3040cc0&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit meson pkgconfig gtk-doc<br>
&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#202669): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/202669" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/202669</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10762507=
3/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/107625073/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000082ebcc061e839f8b--

