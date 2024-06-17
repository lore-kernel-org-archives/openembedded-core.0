Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637BCC27C77
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 05:00:12 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.49046.1718600406243554607
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jun 2024 22:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: aehs29@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3d21c4eec2dso2123449b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 22:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718600405; x=1719205205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zqnOPPZui68qX5pe2MbZKvX+f1tiKo1N5Fa5R7C2wBQ=;
        b=QvGyMOwpn7GWPGVdQlvFoY0s+gkTccxMSD+6+8OqP9jWXYr85UuqHUzXWUSf6MJYEo
         JS+QUaLeEnDA9hZKS8H7lG3QzyNp9j33rG03S1kb7k/cuJbzJrEsQ0e6p8kIC3KB16Te
         YdhbUAZALmDO37Xk831u6QVts/qlWL98AFhNmTcSt20RQkGPZlwa6Il2M1IjYNzTnhv0
         m0TiIUfrMtr+El1TktaNCdV0TjN0gL0KOHOJRJnxoDOxzocgz3pc2i6Ahhs9X5TlO/aQ
         YGb4cs1Eum5Dnvx0o/knZaHhTA4nnHfkjctsiOQmqccm/b15ciLmQQUy7ROyi4R5BGLW
         POBA==
X-Gm-Message-State: AOJu0YyGxx1W6AtIFNvVlPKzbo5ziHBAxcX0g7Bj7FlByxbWCKrwzo++
	MicpWRBgqE+440GsEhBgILxvI3dmiG/9V1puxW1k2qlt11FrOR9CzJCc3KvFpZk=
X-Google-Smtp-Source: AGHT+IH1dsg/IS5AgTfTUZEor+qAfWQ6k85++1LHHT1cXO7IzGb7GZbvpu6j4B4uYIiLRi0JmLuW3A==
X-Received: by 2002:a05:6808:10c4:b0:3d2:2334:67e5 with SMTP id 5614622812f47-3d24e8a6debmr12527552b6e.4.1718600404300;
        Sun, 16 Jun 2024 22:00:04 -0700 (PDT)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com. [209.85.161.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d24763f571sm1406749b6e.34.2024.06.16.22.00.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 22:00:04 -0700 (PDT)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5b9778bb7c8so2040423eaf.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 22:00:03 -0700 (PDT)
X-Received: by 2002:a05:6820:555:b0:5bb:672:405f with SMTP id
 006d021491bc7-5bdadc577acmr8557156eaf.7.1718600403718; Sun, 16 Jun 2024
 22:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240522061016.1763718-1-alejandro@enedino.org> <07A133B8-E8E5-4BDC-B37E-EEEB77361F59@arm.com>
In-Reply-To: <07A133B8-E8E5-4BDC-B37E-EEEB77361F59@arm.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Sun, 16 Jun 2024 22:59:52 -0600
X-Gmail-Original-Message-ID: <CAHMutra=FmPAKzkx1-TjfcviOpk-SY-0eM3rRbcgxcnGiVpkyQ@mail.gmail.com>
Message-ID: <CAHMutra=FmPAKzkx1-TjfcviOpk-SY-0eM3rRbcgxcnGiVpkyQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4 v2] meson.bbclass: Allow early compiler
 tests to be bypassed if necessary
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000933353061b0ed679"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200784

--000000000000933353061b0ed679
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Ross,


This was addressed and simplified by the v3 I sent by only including a
cross file for the recipe without modifying the class.

I see that the v3 wont work anymore due to the recent UNPACKDIR changes.

Will rebase and send v4.

Thanks!

Alejandro


On Tue, Jun 4, 2024, 6:09=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wrot=
e:

> This is pretty niche behaviour - is it worth adding to the increasingly
> complex meson.bbclass?  Can it just be added to the picolibc recipe inste=
ad?
>
> Ross
>
> > On 22 May 2024, at 07:10, Alejandro Hernandez Samaniego via
> lists.openembedded.org <alejandro=3Denedino.org@lists.openembedded.org>
> wrote:
> >
> > Setting skip_sanity_check=3Dtrue in the [properties] section of
> meson.cross allows
> > early compiler tests to be skipped on cross compilation environments
> where
> > sanity applications cant be compiled or tested.
> >
> > Setting MESON_SKIP_SANITY_CHECK=3D1 enables this behavior.
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > ---
> > meta/classes-recipe/meson.bbclass | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/meson.bbclass
> b/meta/classes-recipe/meson.bbclass
> > index 03fa2c06eb..492243c3c0 100644
> > --- a/meta/classes-recipe/meson.bbclass
> > +++ b/meta/classes-recipe/meson.bbclass
> > @@ -61,7 +61,7 @@ def rust_tool(d, target_var):
> >     return "rust =3D %s" % repr(cmd)
> >
> > addtask write_config before do_configure
> > -do_write_config[vardeps] +=3D "CC CXX AR NM STRIP READELF OBJCOPY CFLA=
GS
> CXXFLAGS LDFLAGS RUSTC RUSTFLAGS EXEWRAPPER_ENABLED"
> > +do_write_config[vardeps] +=3D "CC CXX AR NM STRIP READELF OBJCOPY CFLA=
GS
> CXXFLAGS LDFLAGS RUSTC RUSTFLAGS EXEWRAPPER_ENABLED MESON_SKIP_SANITY_CHE=
CK"
> > do_write_config() {
> >     # This needs to be Py to split the args into single-element lists
> >     cat >${WORKDIR}/meson.cross <<EOF
> > @@ -89,6 +89,7 @@ cpp_args =3D ${@meson_array('CXXFLAGS', d)}
> > cpp_link_args =3D ${@meson_array('LDFLAGS', d)}
> >
> > [properties]
> > +${@"skip_sanity_check =3D true" if d.getVar('MESON_SKIP_SANITY_CHECK')=
 =3D=3D
> '1' else ""}
> > needs_exe_wrapper =3D true
> > sys_root =3D '${STAGING_DIR_HOST}'
> >
> > --
> > 2.45.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#199686):
> https://lists.openembedded.org/g/openembedded-core/message/199686
> > Mute This Topic: https://lists.openembedded.org/mt/106238394/6875888
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ross.burton@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
>

--000000000000933353061b0ed679
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hey Ross,<div dir=3D"auto"><br></div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">This was addressed and simplified by the v3 =
I sent by only including a cross file for the recipe without modifying the =
class.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I see that the v3=
 wont work anymore due to the recent UNPACKDIR changes.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Will rebase and send v4.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Thanks!</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Alejandro=C2=A0</div><br><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 4, 2024, 6:09=E2=80=AFAM Ro=
ss Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thi=
s is pretty niche behaviour - is it worth adding to the increasingly comple=
x meson.bbclass?=C2=A0 Can it just be added to the picolibc recipe instead?=
<br>
<br>
Ross<br>
<br>
&gt; On 22 May 2024, at 07:10, Alejandro Hernandez Samaniego via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">lists.openembedded.org</a> &lt;alejandro=3D<a href=3D"mailto:enedino.o=
rg@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">enedino.org=
@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; Setting skip_sanity_check=3Dtrue in the [properties] section of meson.=
cross allows<br>
&gt; early compiler tests to be skipped on cross compilation environments w=
here<br>
&gt; sanity applications cant be compiled or tested.<br>
&gt; <br>
&gt; Setting MESON_SKIP_SANITY_CHECK=3D1 enables this behavior.<br>
&gt; <br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"ma=
ilto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alejandro@=
enedino.org</a>&gt;<br>
&gt; ---<br>
&gt; meta/classes-recipe/meson.bbclass | 3 ++-<br>
&gt; 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/m=
eson.bbclass<br>
&gt; index 03fa2c06eb..492243c3c0 100644<br>
&gt; --- a/meta/classes-recipe/meson.bbclass<br>
&gt; +++ b/meta/classes-recipe/meson.bbclass<br>
&gt; @@ -61,7 +61,7 @@ def rust_tool(d, target_var):<br>
&gt;=C2=A0 =C2=A0 =C2=A0return &quot;rust =3D %s&quot; % repr(cmd)<br>
&gt; <br>
&gt; addtask write_config before do_configure<br>
&gt; -do_write_config[vardeps] +=3D &quot;CC CXX AR NM STRIP READELF OBJCOP=
Y CFLAGS CXXFLAGS LDFLAGS RUSTC RUSTFLAGS EXEWRAPPER_ENABLED&quot;<br>
&gt; +do_write_config[vardeps] +=3D &quot;CC CXX AR NM STRIP READELF OBJCOP=
Y CFLAGS CXXFLAGS LDFLAGS RUSTC RUSTFLAGS EXEWRAPPER_ENABLED MESON_SKIP_SAN=
ITY_CHECK&quot;<br>
&gt; do_write_config() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0# This needs to be Py to split the args into single=
-element lists<br>
&gt;=C2=A0 =C2=A0 =C2=A0cat &gt;${WORKDIR}/meson.cross &lt;&lt;EOF<br>
&gt; @@ -89,6 +89,7 @@ cpp_args =3D ${@meson_array(&#39;CXXFLAGS&#39;, d)}<=
br>
&gt; cpp_link_args =3D ${@meson_array(&#39;LDFLAGS&#39;, d)}<br>
&gt; <br>
&gt; [properties]<br>
&gt; +${@&quot;skip_sanity_check =3D true&quot; if d.getVar(&#39;MESON_SKIP=
_SANITY_CHECK&#39;) =3D=3D &#39;1&#39; else &quot;&quot;}<br>
&gt; needs_exe_wrapper =3D true<br>
&gt; sys_root =3D &#39;${STAGING_DIR_HOST}&#39;<br>
&gt; <br>
&gt; -- <br>
&gt; 2.45.1<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#199686): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/199686" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1996=
86</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10623839=
4/6875888" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/106238394/6875888</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ross.burto=
n@arm.com" target=3D"_blank" rel=3D"noreferrer">ross.burton@arm.com</a>]<br=
>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
</blockquote></div></div></div>

--000000000000933353061b0ed679--

