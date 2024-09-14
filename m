Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342F6C02190
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 10:14:07 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.93115.1726308842624763759
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Sep 2024 03:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GTuavN3E;
 spf=pass (domain: mvista.com, ip: 209.85.208.172, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f75aa08a96so31716451fa.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Sep 2024 03:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1726308840; x=1726913640; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/outhGP51ZK98O0vsKuNnQK2ONMoqbqH6heTBf6IRd8=;
        b=GTuavN3EGbDJYkL2isSRev3F1IeWz0i2mBUu6bgmos1XwfMlQGTf6d6dsQEMVNJBCw
         cy1whx4d6mvwUwBxMlxDhYF12UuzWXCALRAdDB9f410rGPb/xvFrO4/Bpc/hbOr8chVy
         9a0x3zGT4voMVwt+gARBy1wnxVJGHl4nnoORk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726308840; x=1726913640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/outhGP51ZK98O0vsKuNnQK2ONMoqbqH6heTBf6IRd8=;
        b=bUPITAZfRPcR3n2AMW6q0OxshqPago6yF+Kq3NdddYYE8gB2elq4Cj1eaDeJeSLlhJ
         g6JaQW4XYmxg1Mx9MAM759VQfLuN8OdZCZSVc/jmPiS5qj1rskspBfbkz4Xfx+wtaVMS
         /ZpdO5rgmpYOLbe5eMRtc6C0pTeZj6HWCp6qnmH5atksD/iunSjtaOyIpZQptkxxsJfM
         a/yWaBccqSuKLQotVfeAr2C9T3JnAkep4lUveoQKbtLuorcBtHUAIuwvzzgQreJ1IOnO
         7GnZDgoT4kq5/xyI8Vlfa30HHVZoKFOzBfF7yGD+bdzuPtq9RSnPVGTx1FVq0yWtDzNl
         hdWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDKOLTZyZoYlPJHeZJO88iu+uslILVNOXC4EdQouZPJG1sjAsyGgao3MUG1oTmO7Quf8Jk02dNpFAAvr7lmng8HQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwoL7EUQfEKZIrEBooA1smK+QdvdlV5VdHMpMzqvVVpAysEySjv
	yxT7ENJadgV4N2kF5RFfkWCsgYM2GlahE0eGnR0hH05XdJ5JYXdBUYO8jPQ3TKakhKcRkT/MR53
	+PgDuFaXAhUOce2mI3YxjE6JGjJ9MSRBBc+cX/w==
X-Google-Smtp-Source: AGHT+IEI5XeLoNzVxM3GeDIMkR4/GOaknezwua/lSeOFXO8CLJZn06R08Ok5JvGiG7Bm4sWe8aEPZt7/m847i8MhIIw=
X-Received: by 2002:a05:651c:1548:b0:2f7:5bcd:ab52 with SMTP id
 38308e7fff4ca-2f787edca58mr48431301fa.25.1726308840041; Sat, 14 Sep 2024
 03:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240912131711.243389-1-vanusuri@mvista.com> <CA+chaQe+jAerWU7PvouvyuQP8nd-qcw2C-9Y=ZA3Pt19mAG0rQ@mail.gmail.com>
In-Reply-To: <CA+chaQe+jAerWU7PvouvyuQP8nd-qcw2C-9Y=ZA3Pt19mAG0rQ@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Sat, 14 Sep 2024 15:43:48 +0530
Message-ID: <CANQUz1-FoAzSKxKC+eqnLHcjbHn2XBKgZZoO8MBXZG-OKfKkFg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] libpcap: upgrade 1.10.1 -> 1.10.5
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002f09d706221199f4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Sep 2024 10:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204490

--0000000000002f09d706221199f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Martin for letting me know.

Hi Steve,
Could you please ignore this upgrade patch. I will send another patch with
security fixes.

Thanks & Regards,
Vijay

On Sat, Sep 14, 2024 at 12:12=E2=80=AFPM Martin Jansa <martin.jansa@gmail.c=
om>
wrote:

> This update seems to break nmap build from meta-oe:
>
> nse_nsock.cc:36:3: error: expected identifier before 'int'
>    36 |   PCAP_SOCKET =3D lua_upvalueindex(3), /* pcap socket metatable *=
/
>       |   ^~~~~~~~~~~
> nse_nsock.cc:36:3: error: expected '}' before 'int'
> nse_nsock.cc:33:6: note: to match this '{'
>    33 | enum {
>       |      ^
> nse_nsock.cc:36:15: error: expected unqualified-id before '=3D' token
>    36 |   PCAP_SOCKET =3D lua_upvalueindex(3), /* pcap socket metatable *=
/
>       |               ^
> nse_nsock.cc:40:1: error: expected declaration before '}' token
>    40 | };
>       | ^
> nse_nsock.cc: In function 'int socket_lock(lua_State*, int)':
> nse_nsock.cc:181:17: error: 'THREAD_SOCKETS' was not declared in this
> scope; did you mean 'MAX_SOCKETS'?
>   181 |   lua_rawget(L, THREAD_SOCKETS);
>       |                 ^~~~~~~~~~~~~~
>       |                 MAX_SOCKETS
> nse_nsock.cc:203:19: error: 'CONNECT_WAITING' was not declared in this
> scope
>   203 |     lua_rawset(L, CONNECT_WAITING);
>       |                   ^~~~~~~~~~~~~~~
>
> I don't think this upgrade from
> 470 Wednesday, June 9, 2021:
> 471 Summary for 1.10.1 libpcap release:
> to
> 70 Friday, August 30, 2024 / The Tcpdump Group
> 71 Summary for 1.10.5 libpcap release
>
> is suitable for stable branch, please cherry-pick just the security fixes=
.
>
> On Thu, Sep 12, 2024 at 3:17=E2=80=AFPM Vijay Anusuri via
> lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
> wrote:
> >
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Changelog:
> > https://git.tcpdump.org/libpcap/blob/HEAD:/CHANGES
> >
> > Includes Security fixes
> > CVE-2023-7256, CVE-2024-8006
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../libpcap/{libpcap_1.10.1.bb =3D> libpcap_1.10.5.bb}          | 4 ++=
--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-connectivity/libpcap/{libpcap_1.10.1.bb =3D>
> libpcap_1.10.5.bb} (92%)
> >
> > diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
> b/meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
> > similarity index 92%
> > rename from meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
> > rename to meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
> > index dbe2fd8157..94b6466722 100644
> > --- a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
> > +++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
> > @@ -10,8 +10,8 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D5eb289217c160e2920d2e35bddc36453 \
> >
> file://pcap.h;beginline=3D1;endline=3D32;md5=3D39af3510e011f34b8872f120b1=
dc31d2"
> >  DEPENDS =3D "flex-native bison-native"
> >
> > -SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.gz"
> > -SRC_URI[sha256sum] =3D
> "ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4"
> > +SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz"
> > +SRC_URI[sha256sum] =3D
> "84fa89ac6d303028c1c5b754abff77224f45eca0a94eb1a34ff0aa9ceece3925"
> >
> >  inherit autotools binconfig-disabled pkgconfig
> >
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#204443):
> https://lists.openembedded.org/g/openembedded-core/message/204443
> > Mute This Topic: https://lists.openembedded.org/mt/108412577/3617156
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000002f09d706221199f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Martin for letting me know.<br></div><div><br>=
</div><div>Hi Steve,</div><div>Could you please ignore this upgrade patch. =
I will send another patch with security fixes.<br><br></div><div>Thanks &am=
p; Regards,<br></div><div>Vijay<br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 14, 2024 at 12:12=E2=
=80=AFPM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.=
jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">This update seems to break nmap build from meta-oe:<br>
<br>
nse_nsock.cc:36:3: error: expected identifier before &#39;int&#39;<br>
=C2=A0 =C2=A036 |=C2=A0 =C2=A0PCAP_SOCKET =3D lua_upvalueindex(3), /* pcap =
socket metatable */<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0^~~~~~~~~~~<br>
nse_nsock.cc:36:3: error: expected &#39;}&#39; before &#39;int&#39;<br>
nse_nsock.cc:33:6: note: to match this &#39;{&#39;<br>
=C2=A0 =C2=A033 | enum {<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 ^<br>
nse_nsock.cc:36:15: error: expected unqualified-id before &#39;=3D&#39; tok=
en<br>
=C2=A0 =C2=A036 |=C2=A0 =C2=A0PCAP_SOCKET =3D lua_upvalueindex(3), /* pcap =
socket metatable */<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^<br>
nse_nsock.cc:40:1: error: expected declaration before &#39;}&#39; token<br>
=C2=A0 =C2=A040 | };<br>
=C2=A0 =C2=A0 =C2=A0 | ^<br>
nse_nsock.cc: In function &#39;int socket_lock(lua_State*, int)&#39;:<br>
nse_nsock.cc:181:17: error: &#39;THREAD_SOCKETS&#39; was not declared in th=
is<br>
scope; did you mean &#39;MAX_SOCKETS&#39;?<br>
=C2=A0 181 |=C2=A0 =C2=A0lua_rawget(L, THREAD_SOCKETS);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MAX_SOCKETS<br>
nse_nsock.cc:203:19: error: &#39;CONNECT_WAITING&#39; was not declared in t=
his scope<br>
=C2=A0 203 |=C2=A0 =C2=A0 =C2=A0lua_rawset(L, CONNECT_WAITING);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~<br>
<br>
I don&#39;t think this upgrade from<br>
470 Wednesday, June 9, 2021:<br>
471 Summary for 1.10.1 libpcap release:<br>
to<br>
70 Friday, August 30, 2024 / The Tcpdump Group<br>
71 Summary for 1.10.5 libpcap release<br>
<br>
is suitable for stable branch, please cherry-pick just the security fixes.<=
br>
<br>
On Thu, Sep 12, 2024 at 3:17=E2=80=AFPM Vijay Anusuri via<br>
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
&gt; <a href=3D"https://git.tcpdump.org/libpcap/blob/HEAD:/CHANGES" rel=3D"=
noreferrer" target=3D"_blank">https://git.tcpdump.org/libpcap/blob/HEAD:/CH=
ANGES</a><br>
&gt;<br>
&gt; Includes Security fixes<br>
&gt; CVE-2023-7256, CVE-2024-8006<br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../libpcap/{<a href=3D"http://libpcap_1.10.1.bb" rel=3D"norefer=
rer" target=3D"_blank">libpcap_1.10.1.bb</a> =3D&gt; <a href=3D"http://libp=
cap_1.10.5.bb" rel=3D"noreferrer" target=3D"_blank">libpcap_1.10.5.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-connectivity/libpcap/{<a href=3D"http://libp=
cap_1.10.1.bb" rel=3D"noreferrer" target=3D"_blank">libpcap_1.10.1.bb</a> =
=3D&gt; <a href=3D"http://libpcap_1.10.5.bb" rel=3D"noreferrer" target=3D"_=
blank">libpcap_1.10.5.bb</a>} (92%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/libpcap/<a href=3D"http://libpc=
ap_1.10.1.bb" rel=3D"noreferrer" target=3D"_blank">libpcap_1.10.1.bb</a> b/=
meta/recipes-connectivity/libpcap/<a href=3D"http://libpcap_1.10.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libpcap_1.10.5.bb</a><br>
&gt; similarity index 92%<br>
&gt; rename from meta/recipes-connectivity/libpcap/<a href=3D"http://libpca=
p_1.10.1.bb" rel=3D"noreferrer" target=3D"_blank">libpcap_1.10.1.bb</a><br>
&gt; rename to meta/recipes-connectivity/libpcap/<a href=3D"http://libpcap_=
1.10.5.bb" rel=3D"noreferrer" target=3D"_blank">libpcap_1.10.5.bb</a><br>
&gt; index dbe2fd8157..94b6466722 100644<br>
&gt; --- a/meta/recipes-connectivity/libpcap/<a href=3D"http://libpcap_1.10=
.1.bb" rel=3D"noreferrer" target=3D"_blank">libpcap_1.10.1.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/libpcap/<a href=3D"http://libpcap_1.10=
.5.bb" rel=3D"noreferrer" target=3D"_blank">libpcap_1.10.5.bb</a><br>
&gt; @@ -10,8 +10,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5eb2=
89217c160e2920d2e35bddc36453 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://pcap.h;beginline=3D1;endline=3D32;md5=3D39af3510e011f34b8872f=
120b1dc31d2&quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;flex-native bison-native&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://www.tcpdump.org/release/$%7BBP%7=
D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://www.tcpdump.org/rele=
ase/${BP}.tar.gz</a>&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;ed285f4accaf05344f90975757b3dbfe772ba41d=
1c401c2648b7fa45b711bdd4&quot;<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://www.tcpdump.org/release/$%7BBP%7=
D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://www.tcpdump.org/rele=
ase/${BP}.tar.xz</a>&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;84fa89ac6d303028c1c5b754abff77224f45eca0=
a94eb1a34ff0aa9ceece3925&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools binconfig-disabled pkgconfig<br>
&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#204443): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/204443" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/204443</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10841257=
7/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/108412577/3617156</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.co=
m" target=3D"_blank">martin.jansa@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000002f09d706221199f4--

