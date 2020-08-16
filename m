Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.32565.1597618560391850790
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 15:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dFOJG6Du;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id c16so15587310ejx.12
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 15:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lmNl4Zc4wyBPLggpLAgZcDgcgvcmEhMKe1TUawAPJmY=;
        b=dFOJG6DuF21EnYATzr9fSA+DpwOfa5dsyKCYAnaCjDasP6+/LqYZE3fDo0INc3VXRC
         aW+mlAVwsR8sG9aVzRhqvN/7uLiBVS59uu9CIQby24il0azrZdP0R9ASEYz+zZGFtB7n
         uWV7+9ysRuV9q5UEeX7+a3PFigjg4Jh6QAe8WJhHaUGMBOc5gGo0AlKine7SoKowxNro
         6ylfv2ExPBoR0UNAz2NymFqFtQ/tx7Ka99AkPaM3cPD7tGh2gyukvkDCmyf1Cpo3rNCy
         lOlassVZixXKrPJwQm/NaKO54hmUD9uEI5FESfJvXD3NepYVpzDFTOGlb3fGjJTnBYRL
         zU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lmNl4Zc4wyBPLggpLAgZcDgcgvcmEhMKe1TUawAPJmY=;
        b=dze52quXFzsUshzMDiA41LIgoNer8cn/i8ryC8vkGVowWBk4QdTz/Ih8d17stivnVr
         uQr/JdJu7syDGhCApfHMjaA+mq2EjeyeGFHJEWjBI8YlKrAWYphFU4l80CZS/Wn0yVF4
         pqHbw5Qo5kwQnX1xhpS6TqV/nIBqQIR8td2ITnQDLruy9HbmUou7zCvRnF2kS8nUqj7D
         4JjZwvUKxwyULX3x9hJRWy2sxOpgTLu/VcizrhQiafP82xTSdy8duaaD59BeOox5mqJJ
         LROQtDfaMYjXWL6IkyAIh5plTp8tucgIhPu+vLjBSGT2meG4WyPuFkzUFyhMHaDcwfCK
         Druw==
X-Gm-Message-State: AOAM531q4A5Mb/QmJMj31Mxvvnz/NlkirIwDLNgIw75sUvne5EeFF0An
	IWlYNaYtJVXHa/EPcfDYi9/sm02Jq1w/cGYNhko=
X-Google-Smtp-Source: ABdhPJwsGjxiuG+R8e0xQ6QfWq8aXQ6ymqyYcXdY1AF4yrkZfQTGymY2s/fehTVHOT/3jAruRE9Iv593yuXyd6BZcfQ=
X-Received: by 2002:a17:906:71d3:: with SMTP id i19mr12424818ejk.459.1597618558852;
 Sun, 16 Aug 2020 15:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200804082019.76320-1-jacob.kroon@gmail.com> <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com> <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
 <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
 <22b4b3f49bd9ca309ffe4c5fac7a3431fc43ce4b.camel@linuxfoundation.org>
 <CAMKF1srCFjrVimzDWU69Z=SaGu5gayYG7qi34Wo7pEqAG06osA@mail.gmail.com>
 <CAMKF1so+KKNoOTWMB6zLak5ek6c2rN-FAUfv1_L-TWp9h71jWQ@mail.gmail.com> <61e5a6bd3ec8371b2e15742caf18f342b5465c91.camel@linuxfoundation.org>
In-Reply-To: <61e5a6bd3ec8371b2e15742caf18f342b5465c91.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 16 Aug 2020 18:55:46 -0400
Message-ID: <CADkTA4OCH85UM8EH+bCOgHC5qh0Tw=1Rg6RPznNu=0y_pg4qyQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, Jacob Kroon <jacob.kroon@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000afe43905ad068e07"

--000000000000afe43905ad068e07
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 16, 2020 at 9:47 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:
> > Bruce,
> >
> > We need
> >
> https://github.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f36a
> > backported to 5.4 kernels for perf to build with -fno-common can you
> > queue this in your kernel updates as soon as you can ?
>
> I think we have other active kernels which will also need it as even
> with Khem's patch we still see failures:
>
>
I've taken care of linux-yocto now, I don't think there are any active use
cases for those kernels that won't be covered.

Cheers,

Bruce



> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1267
>
> Cheers,
>
> Richard
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000afe43905ad068e07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Aug 16, 2020 at 9:47 AM Richard Purdie &lt;=
<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxf=
oundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:<br>
&gt; Bruce,<br>
&gt; <br>
&gt; We need <br>
&gt; <a href=3D"https://github.com/torvalds/linux/commit/168200b6d6ea0cb576=
5943ec5da5b8149701f36a" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f36a</a><br>
&gt; backported to 5.4 kernels for perf to build with -fno-common can you<b=
r>
&gt; queue this in your kernel updates as soon as you can ?<br>
<br>
I think we have other active kernels which will also need it as even<br>
with Khem&#39;s patch we still see failures:<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I&#39;ve taken care of linux-yocto now, I don&#39;t think =
there are any active use cases for those kernels that won&#39;t be covered.=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">Cheers,</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/1267" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/83/builds/1267</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000afe43905ad068e07--
