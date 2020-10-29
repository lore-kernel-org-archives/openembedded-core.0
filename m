Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.7863.1603974014660575051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 05:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I9jW5wnU;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id b4so1386392vsd.4
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 05:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pSrzoA5gZhlrT1CUtOrsNbIdHyRqay8+fhbe5qlXKwk=;
        b=I9jW5wnUYOAF0Ztbn8f93cx+nCEeyqnIlhfVc/WJY4n+f3fGB3LbJzygWGKKCnkHDV
         7WXhMSC88SJSnUuPqg2mcXGPlTrz1wjE2ELNZTQeUSFYLdnNQTqBrNuKnZq8jOSIJvwV
         NuuCJwS/R5tEorHToodtmVlQqdRBPR/CJ8gwrfjBwuhkdaeDhoG+izaYskE/JkouMJFE
         cLcNJkJ8avHPeKOBjzdZe51uMF5QZXDrWwwbO2AOh95pBAoFUSkHknpOrP/N5EqzVKkm
         yZjXHcXfOI4euN2CAN1TYCWYYRIMuseoyUG9ExpUkN9h68C9J1Rfgo810FFKth83VJah
         eLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pSrzoA5gZhlrT1CUtOrsNbIdHyRqay8+fhbe5qlXKwk=;
        b=lzmnqdRPvFG2m4L3PZaVQN3Q53OUlMuRyo0qBmSPPBSg8uwtqE/j7GdKF5M66vW8hI
         bNwVATietHfnDfGEsHDKrj8M695dcCpcoKfjFkDH/A39/dp0SOQnZx5m7+abi3SlouXp
         BYAW3e13MIXDMEbXBzebAUs2ILLb53qGhYaQvmGSjR9VuF2c9R1OTIezxzb3PTOJlqV9
         UBGn7dzKUKG6B7jXSXv+c+3p9U304sBPukBMZW0zk510gK7oB6ZfixrqW/e7N3SeBY2u
         doLe8kyZ17Ce/mZoF8Q8FqbYtHiGXoxodn+R9tCz5O3nI9Vm1Ny01aS4nhrE5AVHK0vZ
         kLRA==
X-Gm-Message-State: AOAM5315k7cDHMezQLsz2HHQRQQj0HVQ526mb0t0m6ohHkkjRjUPv6N9
	deX+6qJLgzFm3yfV/xmFPvLWecs00XZvfLU1HAc=
X-Google-Smtp-Source: ABdhPJwJLHZkUVSjpCPHtQh8E1j3/yAaoRIwJKrh+Wexzd5Awm+6kWw5/usO+gC877PAPPSjPxIx01j5pp7am8/VFCU=
X-Received: by 2002:a67:ea0b:: with SMTP id g11mr2413387vso.20.1603974013825;
 Thu, 29 Oct 2020 05:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
 <6c5cc7223aec5587143b1d7e165346494a4ab77d.camel@linuxfoundation.org> <CANPvuRkMioP_k1f6=xj3Gn==wQq-JUtzqcux=sCV98CibvKFrA@mail.gmail.com>
In-Reply-To: <CANPvuRkMioP_k1f6=xj3Gn==wQq-JUtzqcux=sCV98CibvKFrA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 29 Oct 2020 13:20:01 +0100
Message-ID: <CANNYZj9x+mWxJ6NnUarwF3Q1YjoqmDYq83ZwFc8aQY2fyQjtuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 00/21] Updates the gstreamer to version 1.18.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000052b73705b2ce4dec"

--00000000000052b73705b2ce4dec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wait, ffmpeg has been available in oe-core for a long time:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-multimedi=
a/ffmpeg

So the issue is not the absence of ffmpeg.

Alex

On Thu, 29 Oct 2020 at 13:01, Jose Quaresma <quaresma.jose@gmail.com> wrot=
e:

> Hi Richard,
>
> Starting with 1.17, gstreamer1.0-libav will not ship a copy of FFmpeg.
> ffmpeg is on meta-oe and because this recipe needs to be moved to
> meta-oe as well.
> I think [gstreamer1.0-libav: upgrade to version 1.18.0] can dropped from
> OE-core
> and I will submit it to meta-oe.
>
> Sorry for this. I have built all the recipes in the series but I have
> meta-oe present in my layers.
>
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> quinta, 29/10/2020 =C3=A0(s) 11:18:
> >
> > On Fri, 2020-10-23 at 19:41 +0100, Jose Quaresma wrote:
> > > V2:
> > > - Fixes the build of vulkan plugin
> > > - Fixes pacth headers
> > > - Upgrade orc 0.4.31 -> 0.4.32
> > >
> > > V3:
> > > - gstreamer1.0: Fix reproducibility issue around libcap
> > > - gstreamer1.0-python: install append is not need any more
> > > - gstreamer1.0-plugins-[good/bad]: disable new meson options
> > > - gstreamer1.0-plugins-[base/good/bad]: add new meson option as
> > > PACKAGECONFIG
> > > - Update pacth headers
> > >
> > > V4:
> > >
> > > - gstreamer1.0-plugins-good: on wayland qt5 needs qtwayland
> >
> > Thanks for these, I've tried running some tests in master-next with th=
e
> > patchset. There was an issue on no-x11 builds:
> >
> > step1b: ERROR: Nothing PROVIDES 'ffmpeg' (but
> /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-multimedia/gstrea=
mer/
> gstreamer1.0-libav_1.18.0.bb DEPENDS on or otherwise requires it)
> > step1b: ERROR: Nothing RPROVIDES 'gstreamer1.0-libav-dev' (but
> /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-multimedia/gstrea=
mer/
> gstreamer1.0-libav_1.18.0.bb RDEPENDS on or otherwise requires it)
> > step1b: ERROR: Nothing RPROVIDES 'gstreamer1.0-libav' (but
> /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-multimedia/gstrea=
mer/
> gstreamer1.0-libav_1.18.0.bb RDEPENDS on or otherwise requires it)
> >
> > in the build:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2629
> >
> > Would you be able to help sort that out?
> >
> > Cheers,
> >
> > Richard
> >
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma
>
>=20
>
>

--00000000000052b73705b2ce4dec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Wait, ffmpeg has been available in oe-core for a long=
 time:</div><div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/=
tree/meta/recipes-multimedia/ffmpeg">http://git.yoctoproject.org/cgit/cgit.=
cgi/poky/tree/meta/recipes-multimedia/ffmpeg</a></div><div><br></div><div>S=
o the issue is not the absence of ffmpeg.<br></div><div><br></div><div>Alex=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, 29 Oct 2020 at 13:01, Jose Quaresma &lt;<a href=3D"mailto=
:quaresma.jose@gmail.com">quaresma.jose@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi Richard,<br>
<br>
Starting with 1.17, gstreamer1.0-libav will not ship a copy of FFmpeg.<br>
ffmpeg is on meta-oe and because this recipe needs to be moved to<br>
meta-oe as well.<br>
I think [gstreamer1.0-libav: upgrade to version 1.18.0] can dropped from O=
E-core<br>
and I will submit it to meta-oe.<br>
<br>
Sorry for this. I have built all the recipes in the series but I have<br>
meta-oe present in my layers.<br>
<br>
Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" t=
arget=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escreveu no dia=
<br>
quinta, 29/10/2020 =C3=A0(s) 11:18:<br>
&gt;<br>
&gt; On Fri, 2020-10-23 at 19:41 +0100, Jose Quaresma wrote:<br>
&gt; &gt; V2:<br>
&gt; &gt; - Fixes the build of vulkan plugin<br>
&gt; &gt; - Fixes pacth headers<br>
&gt; &gt; - Upgrade orc 0.4.31 -&gt; 0.4.32<br>
&gt; &gt;<br>
&gt; &gt; V3:<br>
&gt; &gt; - gstreamer1.0: Fix reproducibility issue around libcap<br>
&gt; &gt; - gstreamer1.0-python: install append is not need any more<br>
&gt; &gt; - gstreamer1.0-plugins-[good/bad]: disable new meson options<br>
&gt; &gt; - gstreamer1.0-plugins-[base/good/bad]: add new meson option as<=
br>
&gt; &gt; PACKAGECONFIG<br>
&gt; &gt; - Update pacth headers<br>
&gt; &gt;<br>
&gt; &gt; V4:<br>
&gt; &gt;<br>
&gt; &gt; - gstreamer1.0-plugins-good: on wayland qt5 needs qtwayland<br>
&gt;<br>
&gt; Thanks for these, I&#39;ve tried running some tests in master-next wi=
th the<br>
&gt; patchset. There was an issue on no-x11 builds:<br>
&gt;<br>
&gt; step1b: ERROR: Nothing PROVIDES &#39;ffmpeg&#39; (but /home/pokybuild=
/yocto-worker/no-x11/build/meta/recipes-multimedia/gstreamer/<a href=3D"htt=
p://gstreamer1.0-libav_1.18.0.bb" rel=3D"noreferrer" target=3D"_blank">gstr=
eamer1.0-libav_1.18.0.bb</a> DEPENDS on or otherwise requires it)<br>
&gt; step1b: ERROR: Nothing RPROVIDES &#39;gstreamer1.0-libav-dev&#39; (bu=
t /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-multimedia/gstream=
er/<a href=3D"http://gstreamer1.0-libav_1.18.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gstreamer1.0-libav_1.18.0.bb</a> RDEPENDS on or otherwise requ=
ires it)<br>
&gt; step1b: ERROR: Nothing RPROVIDES &#39;gstreamer1.0-libav&#39; (but /h=
ome/pokybuild/yocto-worker/no-x11/build/meta/recipes-multimedia/gstreamer/<=
a href=3D"http://gstreamer1.0-libav_1.18.0.bb" rel=3D"noreferrer" target=3D=
"_blank">gstreamer1.0-libav_1.18.0.bb</a> RDEPENDS on or otherwise requires=
 it)<br>
&gt;<br>
&gt; in the build:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/40=
/builds/2629" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/typhoon/#/builders/40/builds/2629</a><br>
&gt;<br>
&gt; Would you be able to help sort that out?<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
<br>
<br>
-- <br>
best regards,<br>
Jos=C3=A9 Quaresma<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000052b73705b2ce4dec--
