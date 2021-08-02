Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.18187.1627900514761731693
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 03:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=x1t4VdrV;
 spf=pass (domain: linaro.org, ip: 209.85.208.48, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f48.google.com with SMTP id n2so23755216eda.10
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 03:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mql2j/+KeJK0+wTFJ864ISAT88fAXu1H9TFXIrGl+90=;
        b=x1t4VdrVR13+xe1Pk54fIxVPdA1KerJJCvlkRGnSNDeeFLAt2hzZmf4qvTCt87z8VS
         sxI3nGTeQ6Fy7fbnKSBn3eCgXX1ObCUNJ8igdzeTiJFoxrV0EJ0zRhuX6Eh8KAOb3BK2
         P+VgNDv95F/cpGC+nJiHWQc39GWpW6+OMX/z4qEfmFruuhAtd25GTM3z4jsMKUMn8y9k
         yPXnoT5cdDuvWKpu+GVhsmiapWoWsOmR+YFq2A+eHpj6WPGXj+dVsysFmF/KqDkQkhBB
         8zOisRvPRNr3FiTklR3cbPE0S+hEfNtxEfsMNYNyw0JR1YWm0lztRaZ0F5NkFX7gWYIM
         QvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mql2j/+KeJK0+wTFJ864ISAT88fAXu1H9TFXIrGl+90=;
        b=e8YQCYGfSiy/kF7GtdYN0sgWH7ORSSxLNOGtaRTggRXn1uiiMQ6QN3ygxJJP6aB2Mo
         icXcQRXHRo5wZ/LeK7amQ455MS5jO1B3Ej1Z0gAwIRjqjeAs0ePX379d8Bszkr0R7SGn
         v3Ea9me05A5uz0jVyWtT4VEF7oja+1iqKlCD3rRCdvmZcSMNu9FrP/apz41m4Ldne9MW
         IOBCIm145hAG8wtqXDnA4BSbOQoKyrlyjgB1UDDIWUZcQey5My8yMy6z3cD1wHuDJIFq
         LuHz1EEfXzBpyOPqJswcpAiCfoqNCsHjk7CsxPM9blIMiO6ymiPZKmsdxgztZypouI86
         yfaw==
X-Gm-Message-State: AOAM533xcJOkvhA6JxSi6zYPVslrk6fKpetFaAK3ou6oL0rwbOL4g1v9
	wIghGHjpEJ5V4bJqEtdZkgRSnzvvW62qyp6B8vrwJA==
X-Google-Smtp-Source: ABdhPJwUTzCJOazRQY32mCfhyTzSzRrPiKbw83J3qbNoxvyMit8RsXnkgxoAPnU3VrJGOtQfxFHJIU6/e/yxplc5rSg=
X-Received: by 2002:aa7:c9d8:: with SMTP id i24mr18476609edt.79.1627900512858;
 Mon, 02 Aug 2021 03:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
 <33b5d60e01b3995046709b17b8014fd45b0c48e5.camel@linuxfoundation.org>
 <CAP71WjxcSk64Snj8Hd0Vy9nJyUH8mE9MjnkfAZC095mPt9bd6g@mail.gmail.com> <98ab2870e07ad6d296d29322b7ee78bade43b9ea.camel@linuxfoundation.org>
In-Reply-To: <98ab2870e07ad6d296d29322b7ee78bade43b9ea.camel@linuxfoundation.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 2 Aug 2021 12:35:02 +0200
Message-ID: <CAP71Wjz5-CQJ7nJzRU+Kij7itOLFeyxsyYkc=XGm=U5iWHqN7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] yocto-check-layer: add support to check for dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Anuj Mittal <anuj.mittal@intel.com>, 
	Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000cc88eb05c8911f8d"

--000000000000cc88eb05c8911f8d
Content-Type: text/plain; charset="UTF-8"

Richard, Steve, Anuj,


On Fri, Jul 30, 2021 at 11:28 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-07-30 at 11:08 +0200, Nicolas Dechesne wrote:
> >
> >
> > On Fri, Jul 30, 2021 at 10:03 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > > On Thu, 2021-07-22 at 14:46 +0200, Nicolas Dechesne wrote:
> > > > It has been recentely mentioned to me by the YP TSC that a layer must
> > > > not only pass the yocto-check-layer script, but also all its
> > > > dependencies. These patches add support for testing dependencies
> > > > automatically.
> > > >
> > > > Patch #1 and #3 are not much related, but improvements I made along
> > > > the lines.
> > > >
> > > > Patch #2 split the internal function into 2 parts, so that we can get
> > > > the list of dependencies from the main script.
> > > >
> > > > Patch #4 is where the processing of the dependencies is done. I chose
> > > > to enable checking the dependencies by default, and use
> > > > '--no-auto-dependency' to disable it, we could decide the other way
> > > > around. For any dependency of the 'layers under test' we will simply
> > > > add them to the list of layers to test unless they are already there.
> > > >
> > > > Here is a sample output with these changes:
> > > >
> > > > $ yocto-check-layer /work/oe/sources/meta-aws \
> > > >                     --dependency /work/oe/sources/meta-openembedded/
> > > >
> > > > INFO: Summary of results:
> > > > INFO:
> > > > INFO: meta-aws ... PASS
> > > > INFO: meta-python ... PASS
> > > > INFO: meta-oe ... PASS
> > > > INFO: meta-networking ... PASS
> > >
> > > We merged this but have started seeing:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/166
> > >
> > > which seems a little strange and is probably related to this series.
> > >
> >
> >
> > yes, it's related.
> >
> > ...
> > INFO: Adding meta-poky to the list of layers to test, as a dependency
> > ...
> > INFO: meta-poky ... SKIPPED (Layer under test should not present in
> BBLAYERS)
> >
> > With these changes, we are now adding all dependencies and trying to
> test them too. But meta-poky seems to
> > be in bblayers.conf, and yocto-check-layer won't work since it needs to
> compute all checksum *without* the
> > layer in the config first.
> >
> > It is probably a good idea to make sure bblayers only has oe-core when
> we try to perform YP compat.
> > Alternatively, as discussed, we use --no-auto-dependency on AB..
>
> Fair enough, I'll update the config to do that.
>

These patches are now merged in master, and I believe they should be merged
in dunfell and hardknott too. The 4 patches apply as-is in both branches.
Let me know if you need anything from me!



>
> Cheers,
>
> Richard
>
> >
>
>
>
>

--000000000000cc88eb05c8911f8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Richard, Steve, Anuj,<div><br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fr=
i, Jul 30, 2021 at 11:28 AM Richard Purdie &lt;<a href=3D"mailto:richard.pu=
rdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2021-07=
-30 at 11:08 +0200, Nicolas Dechesne wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Jul 30, 2021 at 10:03 AM Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxf=
oundation.org</a>&gt; wrote:<br>
&gt; &gt; On Thu, 2021-07-22 at 14:46 +0200, Nicolas Dechesne wrote:<br>
&gt; &gt; &gt; It has been recentely mentioned to me by the YP TSC that a l=
ayer must<br>
&gt; &gt; &gt; not only pass the yocto-check-layer script, but also all its=
<br>
&gt; &gt; &gt; dependencies. These patches add support for testing dependen=
cies<br>
&gt; &gt; &gt; automatically.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Patch #1 and #3 are not much related, but improvements I mad=
e along<br>
&gt; &gt; &gt; the lines. <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Patch #2 split the internal function into 2 parts, so that w=
e can get<br>
&gt; &gt; &gt; the list of dependencies from the main script. <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Patch #4 is where the processing of the dependencies is done=
. I chose<br>
&gt; &gt; &gt; to enable checking the dependencies by default, and use<br>
&gt; &gt; &gt; &#39;--no-auto-dependency&#39; to disable it, we could decid=
e the other way<br>
&gt; &gt; &gt; around. For any dependency of the &#39;layers under test&#39=
; we will simply<br>
&gt; &gt; &gt; add them to the list of layers to test unless they are alrea=
dy there.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Here is a sample output with these changes:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; $ yocto-check-layer /work/oe/sources/meta-aws \ <br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0--dependency /w=
ork/oe/sources/meta-openembedded/ <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; INFO: Summary of results:<br>
&gt; &gt; &gt; INFO:<br>
&gt; &gt; &gt; INFO: meta-aws ... PASS<br>
&gt; &gt; &gt; INFO: meta-python ... PASS<br>
&gt; &gt; &gt; INFO: meta-oe ... PASS<br>
&gt; &gt; &gt; INFO: meta-networking ... PASS<br>
&gt; &gt; <br>
&gt; &gt; We merged this but have started seeing:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/121/builds/166" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/121/builds/166</a><br>
&gt; &gt; <br>
&gt; &gt; which seems a little strange and is probably related to this seri=
es.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; yes, it&#39;s related.<br>
&gt; <br>
&gt; ...<br>
&gt; INFO: Adding meta-poky to the list of layers to test, as a dependency<=
br>
&gt; ...<br>
&gt; INFO: meta-poky ... SKIPPED (Layer under test should not present in BB=
LAYERS)<br>
&gt; <br>
&gt; With these changes, we are now adding all dependencies and trying to t=
est them too. But meta-poky seems to<br>
&gt; be in bblayers.conf, and yocto-check-layer won&#39;t work since it nee=
ds to compute all checksum *without* the<br>
&gt; layer in the config first.=C2=A0<br>
&gt; <br>
&gt; It is probably a good idea to make sure bblayers only has oe-core when=
 we try to perform YP compat.<br>
&gt; Alternatively, as discussed, we use=C2=A0--no-auto-dependency on AB..=
=C2=A0<br>
<br>
Fair enough, I&#39;ll update the config to do that.<br></blockquote><div><b=
r></div><div>These patches are now merged in master, and I believe they sho=
uld be merged in dunfell and hardknott too. The 4 patches apply as-is in bo=
th branches. Let me know if you need anything from me!</div><div><br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000cc88eb05c8911f8d--
