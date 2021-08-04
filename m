Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.9739.1628087398240407055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 07:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ua5tQHmk;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id o5so4065130ejy.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 07:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n3EA1ll4ORnKFZOTUFiE7cj9mQinBAMx2FQf9c2wJJs=;
        b=Ua5tQHmkNt1PIxwSpJBm146LaS1aa3DMd4jLHvxekSu5zsNEmVMe7xkD/h7xTfOFDf
         P2XTV+NT194RUaQZuaagZgXwCoAf0JcTQO3B3OkUiYJyXeRSTSd27Oed3Y7ZnUQhyaau
         ++ZaZ1+WHzvrkz6nOfGX3OBC4rVKRcLGfx46HFZEoUXmwF7qqbvYMfc3JqOAOKNsbGq0
         qFZGk2w/FW2lppGs0IzVHnse8S4kmV+mQp5DewP55LhpJ1kUwPcfcm6O5uZj7cusN6Bb
         Fsv+c2n5aJoWiRjGpdkUlXPkkcOm8YN3gfv0jaRooqizwzaGIwzawUDPngNqqqWkqT/Y
         LG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n3EA1ll4ORnKFZOTUFiE7cj9mQinBAMx2FQf9c2wJJs=;
        b=M3I5F9JPkKFgLV0x9jVG+0L27PevXyV8Yg1tKsLOfZtcByhpmFefbgCSYOxlGS9tP6
         m77dxSzg2jAuJfU2lw5ZfbOO1Ys9xl9FGZijHVKODJCQdxq6Ib9UhHyeS3PFy0H9ATXM
         l+UdsFX5kTbSU15ni4hpNGN/dOIR2qkcdcIR7zABqc3ASWG42D2X6mtxAgyrMsDUM54b
         IN1TxFp+FKdAr8+9tqtLwgJgh9FHdhsJd1uZ7zpXr8O8PTZjHxkTSFF1o4ZdaQvN4S8m
         bQ1usr7N1Jb7Wa3kInwMCw8Riu+MAwNSMMaBIsMu0KPQVXav9DOWNHMyuvDc9o2ghEGI
         Fs+g==
X-Gm-Message-State: AOAM530liTxHW3cA0wJibUOSKymfwt6EGkSAK3B4ztVBMLqQBrzG17dX
	7ut/we5vs+7kyPlPaBjj+jklQf30Y119JfMZorU=
X-Google-Smtp-Source: ABdhPJyLIuiawHxQ9Zw5XsfMNbvQ1X5BNyjWDT4/aMOK8ZOhN2EG0lrq4leZFlHvOJmK4xQhsFwGpK1ku5HVnOA5L2k=
X-Received: by 2002:a17:906:3041:: with SMTP id d1mr26693838ejd.54.1628087396697;
 Wed, 04 Aug 2021 07:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <1628040485-45946-1-git-send-email-denis@denix.org>
 <1628040485-45946-2-git-send-email-denis@denix.org> <3abc2853445a6f54a68cca95a87ee63925bf1588.camel@linuxfoundation.org>
In-Reply-To: <3abc2853445a6f54a68cca95a87ee63925bf1588.camel@linuxfoundation.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 4 Aug 2021 16:29:45 +0200
Message-ID: <CA+chaQfComiP6AtnyhFbcqbhxzjD8epMuxSbdDNYibDGjFtPOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] convert-overrides.py: handle few more cases of overrides
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f18c8805c8bca2df"

--000000000000f18c8805c8bca2df
Content-Type: text/plain; charset="UTF-8"

Yes, I see the same in meta-oe and meta-webosose.

It's easy to spot false translations in incremental conversion where the
diff is relatively small, but doing initial conversion on big layer with
this change already included might be more painful.

On Wed, Aug 4, 2021 at 12:31 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2021-08-03 at 21:28 -0400, Denys Dmytriyenko wrote:
> > Add task-configure and few more supported values of TARGET_OS override.
> >
> > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > ---
> >  scripts/contrib/convert-overrides.py | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/contrib/convert-overrides.py
> b/scripts/contrib/convert-overrides.py
> > index 6505b18..23f63a2 100755
> > --- a/scripts/contrib/convert-overrides.py
> > +++ b/scripts/contrib/convert-overrides.py
> > @@ -36,9 +36,10 @@ vars = vars + ["mipsarch", "x86-x32", "mips16e",
> "microblaze", "e5500-64b", "mip
> >  vars = vars + ["class-native", "class-target", "class-cross-canadian",
> "class-cross", "class-devupstream"]
> >  vars = vars + ["tune-",  "pn-", "forcevariable"]
> >  vars = vars + ["libc-musl", "libc-glibc",
> "libc-newlib","libc-baremetal"]
> > -vars = vars + ["task-compile", "task-install", "task-clean",
> "task-image-qa", "task-rm_work", "task-image-complete", "task-populate-sdk"]
> > +vars = vars + ["task-configure", "task-compile", "task-install",
> "task-clean", "task-image-qa", "task-rm_work", "task-image-complete",
> "task-populate-sdk"]
> >  vars = vars + ["toolchain-clang", "mydistro", "nios2", "sdkmingw32",
> "overrideone", "overridetwo"]
> >  vars = vars + ["linux-gnux32", "linux-muslx32", "linux-gnun32",
> "mingw32", "poky", "darwin", "linuxstdbase"]
> > +vars = vars + ["linux", "linux-gnueabi", "elf", "eabi"]
>
> I have reservations about linux and elf being here since this does lead to
> a lot of false translations for OE-Core. Since OE-Core is now translated I
> guess that isn't the driving factor so I'll probably take this but it is
> worth
> being aware of.
>
> I did just have to retest a translation of core so I now need to filter all
> these out the diff...
>
> Cheers,
>
> Richard
>
>
> 
>
>

--000000000000f18c8805c8bca2df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, I see the same in meta-oe and meta-webosose.<div><br>=
</div><div>It&#39;s easy to spot false translations in incremental conversi=
on where the diff is relatively small, but doing initial conversion on big =
layer with this change already included might be more painful.</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 Aug 4, 2021 at 12:31 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2021-08-03=
 at 21:28 -0400, Denys Dmytriyenko wrote:<br>
&gt; Add task-configure and few more supported values of TARGET_OS overrid=
e.<br>
&gt; <br>
&gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.or=
g" target=3D"_blank">denis@denix.org</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0scripts/contrib/convert-overrides.py | 5 +++--<br>
&gt; =C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/c=
onvert-overrides.py<br>
&gt; index 6505b18..23f63a2 100755<br>
&gt; --- a/scripts/contrib/convert-overrides.py<br>
&gt; +++ b/scripts/contrib/convert-overrides.py<br>
&gt; @@ -36,9 +36,10 @@ vars =3D vars + [&quot;mipsarch&quot;, &quot;x86-x=
32&quot;, &quot;mips16e&quot;, &quot;microblaze&quot;, &quot;e5500-64b&quot=
;, &quot;mip<br>
&gt; =C2=A0vars =3D vars + [&quot;class-native&quot;, &quot;class-target&q=
uot;, &quot;class-cross-canadian&quot;, &quot;class-cross&quot;, &quot;clas=
s-devupstream&quot;]<br>
&gt; =C2=A0vars =3D vars + [&quot;tune-&quot;,=C2=A0 &quot;pn-&quot;, &quo=
t;forcevariable&quot;]<br>
&gt; =C2=A0vars =3D vars + [&quot;libc-musl&quot;, &quot;libc-glibc&quot;,=
 &quot;libc-newlib&quot;,&quot;libc-baremetal&quot;]<br>
&gt; -vars =3D vars + [&quot;task-compile&quot;, &quot;task-install&quot;,=
 &quot;task-clean&quot;, &quot;task-image-qa&quot;, &quot;task-rm_work&quot=
;, &quot;task-image-complete&quot;, &quot;task-populate-sdk&quot;]<br>
&gt; +vars =3D vars + [&quot;task-configure&quot;, &quot;task-compile&quot=
;, &quot;task-install&quot;, &quot;task-clean&quot;, &quot;task-image-qa&qu=
ot;, &quot;task-rm_work&quot;, &quot;task-image-complete&quot;, &quot;task-=
populate-sdk&quot;]<br>
&gt; =C2=A0vars =3D vars + [&quot;toolchain-clang&quot;, &quot;mydistro&qu=
ot;, &quot;nios2&quot;, &quot;sdkmingw32&quot;, &quot;overrideone&quot;, &q=
uot;overridetwo&quot;]<br>
&gt; =C2=A0vars =3D vars + [&quot;linux-gnux32&quot;, &quot;linux-muslx32&=
quot;, &quot;linux-gnun32&quot;, &quot;mingw32&quot;, &quot;poky&quot;, &qu=
ot;darwin&quot;, &quot;linuxstdbase&quot;]<br>
&gt; +vars =3D vars + [&quot;linux&quot;, &quot;linux-gnueabi&quot;, &quot=
;elf&quot;, &quot;eabi&quot;]<br>
<br>
I have reservations about linux and elf being here since this does lead to=
=
=C2=A0<br>
a lot of false translations for OE-Core. Since OE-Core is now translated I=
<br>
guess that isn&#39;t the driving factor so I&#39;ll probably take this but=
 it is worth<br>
being aware of.<br>
<br>
I did just have to retest a translation of core so I now need to filter al=
l<br>
these out the diff...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000f18c8805c8bca2df--
