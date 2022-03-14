Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1C4C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 23:14:32 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.3536.1647299671800204505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T5+f+p6l;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id y17so7044320ljd.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lgo62vLQQk/qnV8YepcapeR3LcITxiEPn9BoQK90J0o=;
        b=T5+f+p6lXELMXXtQcFF5qWM1CphWAUx+lzl8c02Pvhbxgov4aFssTDBexT3n+LDKRo
         fRaUHvgROMFcwY9iwDbX9E3By0qlfj7xeW7CXl9xerMQ1CvgjYbuqIbYZwplcMaSVvLg
         ci1ZhdPJSLh06XzuooZzOwNvfYIoCZHVv2KT/NAjsgUBMgF+jVA4DCVgRhvSU7LlqrxT
         NXLmwjsrVQCPMUtBwbWlofA+FrSDyzHnr5KTUCo6nO3C1RLcKRPBZqoAk2tn/CyOOvV6
         RmwOqYV6c2maFanJGFV312G1r96C3X7UEbahxijs26l6qWjBLHjbloPbH0Tz+f6/nstS
         Nf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lgo62vLQQk/qnV8YepcapeR3LcITxiEPn9BoQK90J0o=;
        b=swSYtFOBY7RoM8Dj6LuD7pEAF8AZhj84DDRZwuwbDuCi/hwZHFOvhh1+ayyQkTKM86
         Zxyhe9qk4op76y4D/lEhrBjM4jgtOOC5UkMHcG2YtyZQ58cWGa62rYtYIa3B61hbBukn
         00G13BcxJnJmnMO2+EZW7bR+keY4c6tLgHa2HAP8FcbqslMcHIaRKQfVLO8/ZZXN2ou/
         sh7YOaSpSwgLjNL1r1VMcBnhoMJWZoRiGW5uI/CyI07x7zCBt1OJRwnVY3DM743e9xVZ
         dv6DcS3Ne47YikENMMGGWryAalIa/SoFxJkKdKqZBMk4JMaUutoDDdSlJCjLS1E7018Y
         ll+Q==
X-Gm-Message-State: AOAM533gkJ2YO34z5qACPY1G5Vf9Y4Xn74qBHDAmrG0kCZhMAokMM8pZ
	BwFElKM9N5zWyH0IsvVjc4otSyJ2QsR3f+CT7n8=
X-Google-Smtp-Source: 
 ABdhPJxbFZfOaItDpYj9kdhCzVymntpE8NnOfswF2TJiCpZJcVYKNBGp+AdI0hVwgXaelSW0x2cFwUc+QySy71UlTxw=
X-Received: by 2002:a05:651c:b07:b0:247:e06d:8943 with SMTP id
 b7-20020a05651c0b0700b00247e06d8943mr14863864ljr.426.1647299669911; Mon, 14
 Mar 2022 16:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220312154011.499012-1-quaresma.jose@gmail.com>
 <c2bf5b0dc76b78ce72d54b8d0a7bee40c0512f4f.camel@linuxfoundation.org>
In-Reply-To: 
 <c2bf5b0dc76b78ce72d54b8d0a7bee40c0512f4f.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 14 Mar 2022 23:14:18 +0000
Message-ID: 
 <CANPvuRkcqN9XiQRmO=tYh4B_XFgecwU4SQvotOTaAvA+9DzLVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meson.bbclass: add exe_wrapper helper
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a9eaea05da35d7d3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 23:14:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163203

--000000000000a9eaea05da35d7d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia s=C3=A1=
bado,
12/03/2022 =C3=A0(s) 17:11:

> On Sat, 2022-03-12 at 15:40 +0000, Jose Quaresma wrote:
> > Sometimes when we use the exe_wrapper we need a way to
> > costumize or circumvent some limitations of the qemu usermode.
> > The ideia of this help script is to handle such cases before
> > the qemu usermode was launched.
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/classes/meson.bbclass | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> > index 0bfe945811..877f5e7794 100644
> > --- a/meta/classes/meson.bbclass
> > +++ b/meta/classes/meson.bbclass
> > @@ -114,6 +114,8 @@ cpp_link_args =3D ${@meson_array('BUILD_LDFLAGS', d=
)}
> >  EOF
> >  }
> >
> > +MESON_QEMU_WRAPPER_HELPER ?=3D ""
> > +
> >  do_write_config:append:class-target() {
> >      # Write out a qemu wrapper that will be used as exe_wrapper so tha=
t
> meson
> >      # can run target helper binaries through that.
> > @@ -127,10 +129,14 @@ export
> GIO_MODULE_DIR=3D${STAGING_LIBDIR}/gio/modules-dummy
> >  # meson sets this wrongly (only to libs in build-dir),
> qemu_wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
> >  unset LD_LIBRARY_PATH
> >
> > +# import any customization provided in the helper
> > +test -f "${MESON_QEMU_WRAPPER_HELPER}" && . ${MESON_QEMU_WRAPPER_HELPE=
R}
> > +
> >  $qemu_binary "\$@"
> >  EOF
> >      chmod +x ${WORKDIR}/meson-qemuwrapper
> >  }
> > +do_write_config:class-target[vardeps] +=3D "MESON_QEMU_WRAPPER_HELPER"
>
> You can't use overrides with flags like that, I'm surprised that even
> parses!


I will drop this line because my intention is to rerun the do_write_config
when
the content of the file changes, which is not possible at all.

I will take the opportunity to ask if the following would work?
do_write_config[vardeps]:class-target +=3D "MESON_QEMU_WRAPPER_HELPER"

Jose


> Cheers,
>
> Richard
>
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000a9eaea05da35d7d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia s=C3=A1bado, 12/03/2022 =C3=A0(s) 17:11:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Sat, 2022-03-12 at 15:40 +0=
000, Jose Quaresma wrote:<br>
&gt; Sometimes when we use the exe_wrapper we need a way to<br>
&gt; costumize or circumvent some limitations of the qemu usermode.<br>
&gt; The ideia of this help script is to handle such cases before<br>
&gt; the qemu usermode was launched.<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/meson.bbclass | 6 ++++++<br>
&gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass<b=
r>
&gt; index 0bfe945811..877f5e7794 100644<br>
&gt; --- a/meta/classes/meson.bbclass<br>
&gt; +++ b/meta/classes/meson.bbclass<br>
&gt; @@ -114,6 +114,8 @@ cpp_link_args =3D ${@meson_array(&#39;BUILD_LDFLAG=
S&#39;, d)}<br>
&gt;=C2=A0 EOF<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +MESON_QEMU_WRAPPER_HELPER ?=3D &quot;&quot;<br>
&gt; +<br>
&gt;=C2=A0 do_write_config:append:class-target() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Write out a qemu wrapper that will be used as ex=
e_wrapper so that meson<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # can run target helper binaries through that.<br>
&gt; @@ -127,10 +129,14 @@ export GIO_MODULE_DIR=3D${STAGING_LIBDIR}/gio/mo=
dules-dummy<br>
&gt;=C2=A0 # meson sets this wrongly (only to libs in build-dir), qemu_wrap=
per_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly<br>
&gt;=C2=A0 unset LD_LIBRARY_PATH<br>
&gt;=C2=A0 <br>
&gt; +# import any customization provided in the helper<br>
&gt; +test -f &quot;${MESON_QEMU_WRAPPER_HELPER}&quot; &amp;&amp; . ${MESON=
_QEMU_WRAPPER_HELPER}<br>
&gt; +<br>
&gt;=C2=A0 $qemu_binary &quot;\$@&quot;<br>
&gt;=C2=A0 EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 chmod +x ${WORKDIR}/meson-qemuwrapper<br>
&gt;=C2=A0 }<br>
&gt; +do_write_config:class-target[vardeps] +=3D &quot;MESON_QEMU_WRAPPER_H=
ELPER&quot;<br>
<br>
You can&#39;t use overrides with flags like that, I&#39;m surprised that ev=
en parses!</blockquote><div><br></div><div>I will drop this line because my=
 intention is to rerun the do_write_config when</div><div>the content of th=
e file changes, which is not possible at all.</div><div><br></div><div><div=
>I will take the opportunity to ask if the following would work?</div></div=
>do_write_config[vardeps]:class-target=C2=A0+=3D &quot;MESON_QEMU_WRAPPER_H=
ELPER&quot;</div><div class=3D"gmail_quote"><div><br></div><div>Jose</div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000a9eaea05da35d7d3--

