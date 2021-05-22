Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.4072.1621667957583488997
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 May 2021 00:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zu8NBlNN;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so8559253wmf.5
        for <openembedded-core@lists.openembedded.org>; Sat, 22 May 2021 00:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dyFTy3yC/zt3lATBPmbFH1eouK4bMjCVI6ZBgIgOSCo=;
        b=Zu8NBlNNHsfxk/JnYhd29rFHcvxVnUH0dzVrVXVo6lYl9T4M9zOV0kzfN9fWFB44qW
         yDOSV5g8+Kmjw6cc4IqOdWawHX2EA63ZO8Ok+9XtTtFvSO3R36+CTNN5Qq/eYzgsBbqQ
         wj2rwkYPOWAMC6tgVIH0QtVrM54nnpnlp+rcodE82oqOOlCD63642gx9a3/+HOxUYV9c
         HtVM3yuCxmvBSgyqiSYA0AIEg1+FeZnEmwa7rxMsdXNLsdr9bM9zlndfl/ASdbl/Kiqf
         ZYglNpASksyDMwUxMOGwvNWJ3bW0vHWYgjPO2SnBCK7gLvfdAmljH8I/hNruT1OCfjvh
         YAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dyFTy3yC/zt3lATBPmbFH1eouK4bMjCVI6ZBgIgOSCo=;
        b=XGNK5l14rEMZoJx4iy8CPFW+EKBY5hQZ8psX5tQbFTezeD8U7b/wqAlSBJ2BZhJC+h
         KUQUer0oAS+tAa3LUUXychB9kNdG1uF6GJwSPXrlOo66Ohxrse5URyJt4r+fNsowGC+e
         7TSYIF0J8V2L/5gFIuRBt2OqXqf14WovEtftd/7K8Cygaz3qxnKHWpXofmg/vmcHYMGU
         ffUN06WJLTnut8+Fg/gampC2ODW9C43DhpuUv5amCCt8qaFu7bkWwSCmAafykTEo0gGJ
         tx/3KjWWgxWs5u/V8LjNu4q3FjKmMwF439BRdtsuqCPS1ZMhBW4lRAnCxoRLgY5uDp1W
         TXGg==
X-Gm-Message-State: AOAM530bKgnq3NWvl1gDxNDBt6TymnJC7NmiajSdRt28QUxKQlqLHrDd
	j0u5l2zg1sOZKBMmgbw95Z9d81Xuzpnk8f41BIw=
X-Google-Smtp-Source: ABdhPJzkUn4AkEo9pnq6RuUVs6JcfLpusZR8xZhE+mBM/Vy7cpOQ0iiVEqtnil/WMC8NnrAGqOoQe873JqqZMhetfBQ=
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr12721452wmi.153.1621667955876;
 Sat, 22 May 2021 00:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210521122032.196712-1-liu.ming50@gmail.com> <74350fb1207d2596a5fe555461392408147f78ae.camel@linuxfoundation.org>
 <CADkTA4PmzCobkfMARy-xMerRdNH-ZiR_g0VFjw_bjsAqUOHvLg@mail.gmail.com> <CAHtQpK4WVpSVZd=6bHnJ0R=tgke-L-UFz0RJP+_G3GtZwPaEMA@mail.gmail.com>
In-Reply-To: <CAHtQpK4WVpSVZd=6bHnJ0R=tgke-L-UFz0RJP+_G3GtZwPaEMA@mail.gmail.com>
From: "Ming Liu" <liu.ming50@gmail.com>
Date: Sat, 22 May 2021 09:19:05 +0200
Message-ID: <CALatG=4WaQFjBtYUKCQMTDA2hRGLqh1JRD8qdktGWyk4T+Kcug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-fitimage.bbclass: fix wrong separators
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007426ab05c2e5fef1"

--0000000000007426ab05c2e5fef1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Andrey:

Thanks, exactly as you explained, it's to fix CVE-2021-27138, will add mor=
e
commit messages.

//Ming Liu

Andrey Zhizhikin <andrey.z@gmail.com> =E6=96=BC 2021=E5=B9=B45=E6=9C=8821=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:04=E5=AF=AB=E9=81=93=EF=
=BC=9A

> On Fri, May 21, 2021 at 4:44 PM Bruce Ashfield <bruce.ashfield@gmail.com=
>
> wrote:
> >
> > On Fri, May 21, 2021 at 10:28 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Fri, 2021-05-21 at 14:20 +0200, Ming Liu wrote:
> > > > From: Ming Liu <liu.ming50@gmail.com>
> > > >
> > > > Change to use '-' rather than '@' as separators.
> > >
> > > Why? The commit message needs more information.
> > >
> >
> > I had exactly the same question/comment!
>
> I guess this comes from the attempt to fix CVE-2021-27138, which was
> already addressed in U-Boot with commit 3f04db891a35 ("image: Check
> for unit addresses in FITs").
>
> `@` is prohibied, so the `-` should be used instead.
>
> I believe it would throw the build error, somethign like this:
> | ./tools/mkimage: verify_header failed for FIT Image support with exit
> | code 1
>
> I do agree though - commit message should state this reason for this
> change.
>
> >
> > Bruce
> >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >=20
> >
>
>
> --
> Regards,
> Andrey.
>

--0000000000007426ab05c2e5fef1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Andrey:<div><br></div><div>Thanks, exactly as you expl=
ained, it&#39;s to fix CVE-2021-27138, will add more commit messages.</div>=
<div><br></div><div>//Ming Liu=C2=A0</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Andrey Zhizhikin &lt;<a href=3D"m=
ailto:andrey.z@gmail.com">andrey.z@gmail.com</a>&gt; =E6=96=BC 2021=E5=B9=
=B45=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:04=E5=AF=
=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Fri, May 21, 2021 at 4:44 PM Bruce Ashfield &lt;<a href=3D"mailto=
:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&g=
t; wrote:<br>
&gt;<br>
&gt; On Fri, May 21, 2021 at 10:28 AM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_=
blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Fri, 2021-05-21 at 14:20 +0200, Ming Liu wrote:<br>
&gt; &gt; &gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" =
target=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Change to use &#39;-&#39; rather than &#39;@&#39; as separa=
tors.<br>
&gt; &gt;<br>
&gt; &gt; Why? The commit message needs more information.<br>
&gt; &gt;<br>
&gt;<br>
&gt; I had exactly the same question/comment!<br>
<br>
I guess this comes from the attempt to fix CVE-2021-27138, which was<br>
already addressed in U-Boot with commit 3f04db891a35 (&quot;image: Check<b=
r>
for unit addresses in FITs&quot;).<br>
<br>
`@` is prohibied, so the `-` should be used instead.<br>
<br>
I believe it would throw the build error, somethign like this:<br>
| ./tools/mkimage: verify_header failed for FIT Image support with exit<br=
>
| code 1<br>
<br>
I do agree though - commit message should state this reason for this chang=
e.<br>
<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt;<br>
&gt; &gt; Richard<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await=
<br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
Regards,<br>
Andrey.<br>
</blockquote></div>

--0000000000007426ab05c2e5fef1--
