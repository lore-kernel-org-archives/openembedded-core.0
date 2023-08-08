Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0338AC04E69
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 23:00:43 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.76317.1691535632794724577
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 16:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kA+TMELg;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6b9c9944da8so5553753a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 16:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691535632; x=1692140432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RFze3SzRTtkexvRXUXAeifudpkdtSB6U5yh36KmH1e4=;
        b=kA+TMELg9q5REh2PBmazLCluKB8tJYKasDrCfEtkKu0uJmAoDWo/GUhAaELQpn4Ddk
         v9i1DGuD1Cdej1eDROWXlWGdwuDmDlWQo8kyvT2RptZ78vEIL4fptIw66cQxOQgp/PQf
         2x5e4PneS02SkCtbCIqLUGEnQIbM1wNAYxqClfMryHkTvPc9xebFbS+lL/OWqOHcdKFW
         LCR4W4VVHFMbff94b/lg2gl+8xXlkwH7SSBaXW4dOwnMix7soAffDc6GZA9SfMQ1QFyw
         0Ommzh+fGlm9JQ2NR5sYKeEmRKejyEjymVxMdU6e432gb/gEQQEzEAH0EANdPXBdCCDl
         ngjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691535632; x=1692140432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFze3SzRTtkexvRXUXAeifudpkdtSB6U5yh36KmH1e4=;
        b=GAegPrX9zx3BI7lLjWuOI4QSXnSd9DtljTf180efWKnD2wK/JJ0O3G1wF9BhhKkhUX
         MXGRaRXogMF0KBBr6c6FHf+xzjunBIjCzn4o8YQXsVDKpu7yEgn+1YN0kabhNP4aQjOM
         dR5bVC5bZTaO6IiEUzNPX5kiHhlBrWVHPWlTYiQMcZFibMV86RVBUDUYyXwP8S+Qn5ww
         Epb+/h/70taRq0RAD86ZIEU6nMFo8cxNj7GZyMX9QZRBoEFi+htvdSnOwYutDz6SsjUW
         l3ellRSBEFpm5u7hD2e7EOc8yrbCLpRj8cQAIwTNO72Sp7S2XiGn/2gM2Ff+O6OnJ2WE
         GyIg==
X-Gm-Message-State: AOJu0YzMP3mAkZWbm/9qyRGHbwSgAiUPYrlJS44+TURjcKJ4VujBCSkv
	4zdJuEekzhz6MhoTjnHsWLQL+OST7wrLARW1d2FNTOrxK9vxrBiG
X-Google-Smtp-Source: AGHT+IHHr5/fMs2ghJmxCUawzfnO65c11yBudq06ZSQvkwHk6kw1WhlWPp24drhf25FZwf3uHHgmdmSxAb4FIzL/HFM=
X-Received: by 2002:a05:6358:927:b0:135:a5fe:53e1 with SMTP id
 r39-20020a056358092700b00135a5fe53e1mr935369rwi.14.1691535631882; Tue, 08 Aug
 2023 16:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230808160828.3045524-1-jose.quaresma@foundries.io> <CAMKF1sr4azY=E9XUz4946qWByrMFHbVM-jCACFtgF93_ry4DpQ@mail.gmail.com>
In-Reply-To: <CAMKF1sr4azY=E9XUz4946qWByrMFHbVM-jCACFtgF93_ry4DpQ@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 9 Aug 2023 00:00:20 +0100
Message-ID: <CANPvuRny9BbNDpGtz6y2omz2fzsezKHij_pff_bMNRZsW_iyTg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] systemd-boot: enable verbose compilation
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000769faa0602715428"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 23:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185678

--000000000000769faa0602715428
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem Raj <raj.khem@gmail.com> escreveu no dia ter=C3=A7a, 8/08/2023 =C3=A0(=
s) 18:05:

> On Tue, Aug 8, 2023 at 9:08=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail=
.com>
> wrote:
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/recipes-core/systemd/systemd-boot_254.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd-boot_254.bb
> b/meta/recipes-core/systemd/systemd-boot_254.bb
> > index 5d69cf83ab..b91bbfe485 100644
> > --- a/meta/recipes-core/systemd/systemd-boot_254.bb
> > +++ b/meta/recipes-core/systemd/systemd-boot_254.bb
> > @@ -53,7 +53,7 @@ COMPATIBLE_HOST =3D
> "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
> >  COMPATIBLE_HOST:x86-x32 =3D "null"
> >
> >  do_compile() {
> > -       ninja systemd-boot
> > +       ninja -v systemd-boot
>
> I think this is only useful during debugging. So perhaps a comment to
> enable it is better than enabling it always.
>

The meson bbclass also compile with verbose so in my opinion it is better
to do the same
and make it consistent with the main systemd recipe

meson_do_compile() {
    meson compile -v ${PARALLEL_MAKE}
}

Jose


> >  }
> >
> >  do_install() {
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#185665):
> https://lists.openembedded.org/g/openembedded-core/message/185665
> > Mute This Topic: https://lists.openembedded.org/mt/100625045/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000769faa0602715428
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; escreveu no dia ter=C3=A7a, 8/08/2=
023 =C3=A0(s) 18:05:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Tue, Aug 8, 2023 at 9:08=E2=80=AFAM Jose Quaresma &lt;<a href=3D"ma=
ilto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>=
&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd-boot_254.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-boot_254.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_=
254.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_254.bb</a> b/meta=
/recipes-core/systemd/<a href=3D"http://systemd-boot_254.bb" rel=3D"norefer=
rer" target=3D"_blank">systemd-boot_254.bb</a><br>
&gt; index 5d69cf83ab..b91bbfe485 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_254.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-boot_254.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_254.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-boot_254.bb</a><br>
&gt; @@ -53,7 +53,7 @@ COMPATIBLE_HOST =3D &quot;(aarch64.*|arm.*|x86_64.*|=
i.86.*)-linux&quot;<br>
&gt;=C2=A0 COMPATIBLE_HOST:x86-x32 =3D &quot;null&quot;<br>
&gt;<br>
&gt;=C2=A0 do_compile() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ninja systemd-boot<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ninja -v systemd-boot<br>
<br>
I think this is only useful during debugging. So perhaps a comment to<br>
enable it is better than enabling it always.<br></blockquote><div><br></div=
><div>The meson bbclass also compile with verbose so in my opinion it is be=
tter to do the same</div><div>and make it consistent with the main systemd =
recipe<br><br></div><div>meson_do_compile() {</div>=C2=A0 =C2=A0 meson comp=
ile -v ${PARALLEL_MAKE}<br>}<br><br>Jose</div><div class=3D"gmail_quote"><b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 do_install() {<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#185665): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/185665" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/185665</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10062504=
5/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/100625045/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000769faa0602715428--

