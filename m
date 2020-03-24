Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.78.1585076827241207743
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 12:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TV6KV4aA;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: a.manache@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id bd14so8173980edb.10
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 12:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XpnZjs/4CkcHcWsMiDcjmaCP1/tzkqOq9SnL/1U7bYk=;
        b=TV6KV4aApDUPJ6wLFqnq6S0GCRlUgf8Mnd4CfmV806IrWdM+D/uiCc3lrP/lH1Clqb
         9yeKGJu0eOztG/gzHcdzsVUO2iOrA9KoWN1hCiKt5S91ZaLl5KKu9L0K1ikDeDGKCkXp
         jSRgpjTWi+UV7q+gRQRZY7piBlQM4nwm9dw9nVCA8qMiGelnjsbMO3hmAofeH2a3PNZh
         FZ7U917F5dX92WMi38oeexw6qJwH5XRa13ynkKHm2WSs4E6dAH7KSf9PFmw13IFDovnA
         1nzleLKQIzPtD9u+YhD9d0UNlFaE9x0s6PBZQJfY1JNu/Nhuz3r3DLheNPu32kon5sXO
         iD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XpnZjs/4CkcHcWsMiDcjmaCP1/tzkqOq9SnL/1U7bYk=;
        b=sgvQ3CI6QfCjS+3dTVNeZWyp7VjaJiNzFXnKlD1Z5QDJegIBWESdc38dWAAqsSdygG
         gShHmX5yhprPDQ4Gq2VCkyFTTpg691M54FJnFxAwdDvBM5TXB2/GX9qAjHzgxsMwzvO/
         jWgsqogYiuNPf9EkfvxhnIMrlc0fwkuDuT+Dl6LBOUlRAeNCD/RCWbb3qLK9XEdQU20Q
         3sHwQdqhtdnfaA7BF0Yh8BX0ka2G6RpiuiEiP1aFq0KietN6solmemLWNoTwSOom4yl8
         beMgCq1+kj+zJQaxTnNoQSzss19QOx0v3Qt3SC9ass5NAxFpHi+xZr4/9h0BbibxusF1
         vOWg==
X-Gm-Message-State: ANhLgQ1fHo1JfrRGZnukAqDfvPMMJsVKEZqD/PdZLw8ggZcEvnO0KJJD
	tKLwJupKl8ULf5as3Ii+Q5AMJ93RfNlHtPkxRUY=
X-Google-Smtp-Source: ADFU+vsR8TL1WhJX2s7pxgQ9rjSeljtmoFMKWEy4qrXuNvWkXY8d2U/s9YHrOJTt7IToewVaD/tR5W2fJVVslEbPfxA=
X-Received: by 2002:a17:906:524f:: with SMTP id y15mr5407515ejm.231.1585076825465;
 Tue, 24 Mar 2020 12:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200324170259.3206-1-tom.hochstein@nxp.com> <CAMu9SpJmwRw9gmCJS4NkdhMuyNdVij_-C4AsyeLs+zb6+pV2fA@mail.gmail.com>
 <5e1f58719f8835201ddcd82bb19af555f5c2dcc2.camel@linuxfoundation.org> <VE1PR04MB6621F3264C205F46AACCA6AFE2F10@VE1PR04MB6621.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6621F3264C205F46AACCA6AFE2F10@VE1PR04MB6621.eurprd04.prod.outlook.com>
From: "Antoine Manache" <a.manache@gmail.com>
Date: Tue, 24 Mar 2020 20:06:54 +0100
Message-ID: <CAMu9SpKSFfexqz2sqsr6ZyPtdeSCu1XfLYSSznX1FtpG5=TK7g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] security_flags.inc: fix flags missing from SDK toolchain
To: Tom Hochstein <tom.hochstein@nxp.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001faa4005a19e75e2"

--0000000000001faa4005a19e75e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Absolutely.
I would add an example of issue I've seen in a software project.
Someone developing a new application and using the image-based SDK that I
provided got the right functional behaviour on target.
Once this application was integrated into the core image of our Yocto
project (new recipe), the same tests on target failed (application crash).
The root cause was : the two binaries produced were different because the
effective GCC options at compile time were different between both methods
(security flags not enabled when compiling with the SDK).
Antoine

Le mar. 24 mars 2020 =C3=A0 19:34, Tom Hochstein <tom.hochstein@nxp.com> a
=C3=A9crit :

>
>
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: Tuesday, March 24, 2020 1:03 PM
> > To: Antoine Manache <a.manache@gmail.com>; Tom Hochstein <
> tom.hochstein@nxp.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core][PATCH] security_flags.inc: fix flags missing fro=
m
> SDK toolchain
> >
> > On Tue, 2020-03-24 at 18:25 +0100, Antoine Manache wrote:
> > > I've already sent this patch few months ago but not taken into
> > > account yet.
> >
> > Can someone explain more about the issue here please?
> >
> > Shouldn't these flags be added to the SDK toolchain environment files
> > rather than coded into the compiler? Why aren't they being coded in? or
> > is gcc being misconfigured?
>
> The recipe meta-environment inherits cross-canadian and toolchain-scripts=
.
> The latter generates the SDK toolchain environment file using
> TARGET_CC_ARCH and TARGET_LDFLAGS like this:
>
>         echo 'export CC=3D"${TARGET_PREFIX}gcc ${TARGET_CC_ARCH}
> --sysroot=3D$SDKTARGETSYSROOT"' >> $script
>         echo 'export LDFLAGS=3D"${TARGET_LDFLAGS}"' >> $script
>
>
> https://github.com/openembedded/openembedded-core/blob/master/meta/classe=
s/toolchain-scripts.bbclass#L82
>
> With class-cross-canadian as the applicable override, updating the
> security flags for class-target does nothing for the SDK toolchain, hence
> the proposed fix:
>
> TARGET_CC_ARCH_append_class-target =3D " ${SECURITY_CFLAGS}"
> +TARGET_CC_ARCH_append_class-cross-canadian =3D " ${SECURITY_CFLAGS}"
>  TARGET_LDFLAGS_append_class-target =3D " ${SECURITY_LDFLAGS}"
> +TARGET_LDFLAGS_append_class-cross-canadian =3D " ${SECURITY_LDFLAGS}"
>
> Tom
>

--0000000000001faa4005a19e75e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Absolutely.</div><div>I would add an example of issue=
 I&#39;ve seen in a software project.</div><div>Someone developing a new ap=
plication and using the image-based SDK that I provided got the right funct=
ional behaviour on target.</div><div>Once this application was integrated i=
nto the core image of our Yocto project (new recipe), the same tests on tar=
get failed (application crash).</div><div>The root cause was : the two  bin=
aries produced were different because the effective GCC options at compile =
time were different between both methods (security flags not enabled when c=
ompiling with the SDK).<br></div><div>Antoine<br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 24 mars 2020 =
=C3=A0=C2=A019:34, Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@nxp.co=
m">tom.hochstein@nxp.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt; Sent: Tuesday, March 24, 2020 1:03 PM<br>
&gt; To: Antoine Manache &lt;<a href=3D"mailto:a.manache@gmail.com" target=
=3D"_blank">a.manache@gmail.com</a>&gt;; Tom Hochstein &lt;<a href=3D"mailt=
o:tom.hochstein@nxp.com" target=3D"_blank">tom.hochstein@nxp.com</a>&gt;<br=
>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core][PATCH] security_flags.inc: fix flags missing fr=
om SDK toolchain<br>
&gt; <br>
&gt; On Tue, 2020-03-24 at 18:25 +0100, Antoine Manache wrote:<br>
&gt; &gt; I&#39;ve already sent this patch few months ago but not taken int=
o<br>
&gt; &gt; account yet.<br>
&gt; <br>
&gt; Can someone explain more about the issue here please?<br>
&gt; <br>
&gt; Shouldn&#39;t these flags be added to the SDK toolchain environment fi=
les<br>
&gt; rather than coded into the compiler? Why aren&#39;t they being coded i=
n? or<br>
&gt; is gcc being misconfigured?<br>
<br>
The recipe meta-environment inherits cross-canadian and toolchain-scripts. =
The latter generates the SDK toolchain environment file using TARGET_CC_ARC=
H and TARGET_LDFLAGS like this:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;export CC=3D&quot;${TARGET_PREFIX}gcc=
 ${TARGET_CC_ARCH} --sysroot=3D$SDKTARGETSYSROOT&quot;&#39; &gt;&gt; $scrip=
t<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;export LDFLAGS=3D&quot;${TARGET_LDFLA=
GS}&quot;&#39; &gt;&gt; $script<br>
<br>
<a href=3D"https://github.com/openembedded/openembedded-core/blob/master/me=
ta/classes/toolchain-scripts.bbclass#L82" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/openembedded/openembedded-core/blob/master/meta/clas=
ses/toolchain-scripts.bbclass#L82</a><br>
<br>
With class-cross-canadian as the applicable override, updating the security=
 flags for class-target does nothing for the SDK toolchain, hence the propo=
sed fix:<br>
<br>
TARGET_CC_ARCH_append_class-target =3D &quot; ${SECURITY_CFLAGS}&quot;<br>
+TARGET_CC_ARCH_append_class-cross-canadian =3D &quot; ${SECURITY_CFLAGS}&q=
uot;<br>
=C2=A0TARGET_LDFLAGS_append_class-target =3D &quot; ${SECURITY_LDFLAGS}&quo=
t;<br>
+TARGET_LDFLAGS_append_class-cross-canadian =3D &quot; ${SECURITY_LDFLAGS}&=
quot;<br>
<br>
Tom<br>
</blockquote></div></div>

--0000000000001faa4005a19e75e2--
