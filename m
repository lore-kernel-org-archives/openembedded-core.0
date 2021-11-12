Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DF4C433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 06:46:26 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web12.12047.1636699585332625108
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 22:46:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VQFz/+jV;
 spf=pass (domain: gmail.com, ip: 209.85.222.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id p2so16837868uad.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 22:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mzGrzeqH41LO7F6BEt5yW+xy+T4dncTiEp+hJk2DrHQ=;
        b=VQFz/+jVUYRRkvwKcywaECMJjiLk6Oq9ZgkMalWGlH/+KGbwxpj2k8Rsj868Vg4SHI
         /8CuBKTcFhCgHil12pRDXR3q8yRok4+ePFHEXDsEG3SnkCyb3DWMk1FjkO/TmSrBRXIl
         Cqk/ILSsBx1y2ELmpLMNBlPMrw/LIFVazdri9mPWtPDHk1hQgZPTxIYgHDDWUYthoZ9N
         ytO04s6oJD8Z91UlyhGXPZf5kJIX1Y7VWTm94jSP8s/NiXX/qHOsBtrQyGNWXbXZN7p7
         m1F/Hi+pQAg8Gtgf0fX26lCd8bNdPz4Wnd18eJYT9yvNi5gOj8uNCgcTScz+QSubzfft
         Bkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mzGrzeqH41LO7F6BEt5yW+xy+T4dncTiEp+hJk2DrHQ=;
        b=lQV5VUgf7VOIL3y+nI28zlIJXr5124OA2gAy05oqsNmEJi1jxJRjc79A0pORq8e7RG
         FcT8ohK+79e03NyvqVmBHEBbeVBeYRdd2IHBEkwwrgmAbTUOKAAJ2F+WsamSsC1ds/sU
         8B3SgZ54AU6GQUChQnVW12V68sI5S/DeX/bgXV+ZKjjQQFTQt2WnkRi/HyZKJI36+SWg
         38wUSUc5bQKC26GZiU0lfXuLd/FrLZ7LtIiIx6XBVf3K0mW4WsAyInYVXLAYa/lY2sS1
         PUzWczOTzX0XNpZxarfankAPJevp2XrTWdt1ktxSGCTL5QHdJabCwRLhRcGOBZIWx8eT
         qzDw==
X-Gm-Message-State: AOAM530XiSY6bdEidtrMvgqSVN7Jx5FTrwzSYLfcrOsKYGquFNg0zEMd
	npzbEtsadLMeKMg4oCy+TNNh6/cwDmC1T+08zVdIEgOs
X-Google-Smtp-Source: 
 ABdhPJzvPO3qXBwKSPImFBwnbM+/S/0mezYdn3+i/jQBERUoKj19ovhd0nJZXCNzKu9qvoqXbB+8OrxOqn0PS4ZhK50=
X-Received: by 2002:a05:6102:2c6:: with SMTP id
 h6mr6997702vsh.13.1636699584263;
 Thu, 11 Nov 2021 22:46:24 -0800 (PST)
MIME-Version: 1.0
References: <20211027090736.2546759-1-alex@linutronix.de>
 <20211027090736.2546759-29-alex@linutronix.de>
 <CAMKF1spjC7iPSOfZwoC2Tw1hFTfz18J-grBbmnB2ow+kKkkFow@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spjC7iPSOfZwoC2Tw1hFTfz18J-grBbmnB2ow+kKkkFow@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Nov 2021 07:46:12 +0100
Message-ID: 
 <CANNYZj_GM3ubecGBwPhB2aJYUgRUUZ6a6Uv6X80Vfrkfy43pEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 29/30] gstreamer1.0-python: do not supply
 unknown g-i options
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000052f87c05d091d155"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 06:46:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158209

--00000000000052f87c05d091d155
Content-Type: text/plain; charset="UTF-8"

Thanks, can you send a patch to correct this?

Alex

On Fri, 12 Nov 2021 at 02:35, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Oct 27, 2021 at 2:08 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > meson 0.60 turns unknown options into them hard errors, so instead of
> relying on g-i class
> > (where the options are mandatory) add g-i dependencies explicitly.
> >
>
> This patch is not needed after merging
>
>
> https://lists.openembedded.org/g/openembedded-core/topic/patch/86997027?p=,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,86997027,previd=1636678766912195299,nextid=1636633780004461498&previd=1636678766912195299&nextid=1636633780004461498
>
> all we will need is
>
> GIR_MESON_OPTION = ""
>
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  .../gstreamer/gstreamer1.0-python_1.18.5.bb          | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-python_1.18.5.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-python_1.18.5.bb
> > index 74dd15b3eb..a32805d129 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
> > @@ -21,6 +21,14 @@ EXTRA_OEMESON += "-Dlibpython-dir=${libdir}"
> >
> >  # gobject-introspection is mandatory and cannot be configured
> >  REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> > -UNKNOWN_CONFIGURE_WHITELIST:append = " introspection"
> >
> > -inherit meson pkgconfig distutils3-base upstream-version-is-even
> gobject-introspection features_check
> > +inherit meson pkgconfig distutils3-base upstream-version-is-even
> features_check
> > +
> > +# Generating introspection data depends on a combination of native and
> target
> > +# introspection tools, and qemu to run the target tools.
> > +DEPENDS:append:class-target = " gobject-introspection
> gobject-introspection-native qemu-native prelink-native"
> > +
> > +# Even though introspection is disabled on -native,
> gobject-introspection package is still
> > +# needed for m4 macros.
> > +DEPENDS:append:class-native = " gobject-introspection-native"
> > +DEPENDS:append:class-nativesdk = " gobject-introspection-native"
> > --
> > 2.20.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#157505):
> https://lists.openembedded.org/g/openembedded-core/message/157505
> > Mute This Topic: https://lists.openembedded.org/mt/86623409/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000052f87c05d091d155
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, can you send a patch to correct this?</div><d=
iv><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, 12 Nov 2021 at 02:35, Khem Raj &lt;=
<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Oct 27, 202=
1 at 2:08 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; meson 0.60 turns unknown options into them hard errors, so instead of =
relying on g-i class<br>
&gt; (where the options are mandatory) add g-i dependencies explicitly.<br>
&gt;<br>
<br>
This patch is not needed after merging<br>
<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/patch/8=
6997027?p=3D,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,86997027,previd=3D1=
636678766912195299,nextid=3D1636633780004461498&amp;previd=3D16366787669121=
95299&amp;nextid=3D1636633780004461498" rel=3D"noreferrer" target=3D"_blank=
">https://lists.openembedded.org/g/openembedded-core/topic/patch/86997027?p=
=3D,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,86997027,previd=3D1636678766=
912195299,nextid=3D1636633780004461498&amp;previd=3D1636678766912195299&amp=
;nextid=3D1636633780004461498</a><br>
<br>
all we will need is<br>
<br>
GIR_MESON_OPTION =3D &quot;&quot;<br>
<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0-python_1.18.5.bb" r=
el=3D"noreferrer" target=3D"_blank">gstreamer1.0-python_1.18.5.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++++++++++--<br>
&gt;=C2=A0 1 file changed, 10 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstre=
amer1.0-python_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0=
-python_1.18.5.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http:/=
/gstreamer1.0-python_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstrea=
mer1.0-python_1.18.5.bb</a><br>
&gt; index 74dd15b3eb..a32805d129 100644<br>
&gt; --- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
-python_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-python=
_1.18.5.bb</a><br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
-python_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-python=
_1.18.5.bb</a><br>
&gt; @@ -21,6 +21,14 @@ EXTRA_OEMESON +=3D &quot;-Dlibpython-dir=3D${libdir=
}&quot;<br>
&gt;<br>
&gt;=C2=A0 # gobject-introspection is mandatory and cannot be configured<br=
>
&gt;=C2=A0 REQUIRED_DISTRO_FEATURES =3D &quot;gobject-introspection-data&qu=
ot;<br>
&gt; -UNKNOWN_CONFIGURE_WHITELIST:append =3D &quot; introspection&quot;<br>
&gt;<br>
&gt; -inherit meson pkgconfig distutils3-base upstream-version-is-even gobj=
ect-introspection features_check<br>
&gt; +inherit meson pkgconfig distutils3-base upstream-version-is-even feat=
ures_check<br>
&gt; +<br>
&gt; +# Generating introspection data depends on a combination of native an=
d target<br>
&gt; +# introspection tools, and qemu to run the target tools.<br>
&gt; +DEPENDS:append:class-target =3D &quot; gobject-introspection gobject-=
introspection-native qemu-native prelink-native&quot;<br>
&gt; +<br>
&gt; +# Even though introspection is disabled on -native, gobject-introspec=
tion package is still<br>
&gt; +# needed for m4 macros.<br>
&gt; +DEPENDS:append:class-native =3D &quot; gobject-introspection-native&q=
uot;<br>
&gt; +DEPENDS:append:class-nativesdk =3D &quot; gobject-introspection-nativ=
e&quot;<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#157505): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/157505" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/157505</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86623409=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/86623409/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000052f87c05d091d155--

