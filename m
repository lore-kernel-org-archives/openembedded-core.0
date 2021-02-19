Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.12150.1613756253363662878
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 09:37:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rTj/ExXx;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: jatedev@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id fy5so4078963pjb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 09:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=68NEYR/vM9DkSLcm4VQndBoDowzTxDQBP8e8SA957kU=;
        b=rTj/ExXx7XWG3UtjWRFZeuZV0qHYuQIy8uEE0qHHiMfDW5CpHyOKc6xPEogb6guXKP
         BhNzk6+A0SN81ZDQPduso/L2s9idnehbupVI3doAPuom38aHhlmfmgWEd1LYtswJ3OSG
         r9dtYRz/D790Bph/CX6ejsIPTzpzWRmNWNaICbiRPOr8UOW0Y4X3fKlx6OTo45b6W6NE
         f3/zC/Yn2SkHD1uAWyDsloQ7bS1EWfGjiah31oUZQa9KNsd4p3v1VHLaTgDwHzkSHT86
         AxX7vzE1/HTbe78Eqvaap8Tl24be7RzPaZWPJhP9zUcKZsPasbkSJaOpBc9+5Viz1k+i
         Vzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=68NEYR/vM9DkSLcm4VQndBoDowzTxDQBP8e8SA957kU=;
        b=m1mc0HklIc8cOvvI69TT/cb1n93NJggc/tqlEPR+cQ0hyjikaz/5eQL/h2jIXpAZ88
         cbRj50LW7TPMrXUNLKZt+K7N5ltRsbYE4vPDHOJllCOksrvPLIzwnQtqx50ElWFqjAdk
         1HxZ40MsbfUIZUmslfQB8WvJuUltrQuZvMVLdgaRCa14win1aBidW0TQMzvDrYuK7oyl
         dUf4KbU3hy5ovDabsGhdrHrAH3Kdt46Ky3U93YU0WE8Q4P+W1WxuwGwUbAcitRug7Qat
         ApARXRynUT1ctrMaeVhrDxqihQSfsBvQBZJqZD9sKEQsHOmxKDcOAk5e3ekROY2moSnz
         USvg==
X-Gm-Message-State: AOAM530oLDlYZvrle+CwVot5LNPRYLeNbR/zC8FLG7cLXM5l745dAKRD
	swOSlyPw7tNJfKXh34ZPtDoPxmRjL+pBEmbBgw8=
X-Google-Smtp-Source: ABdhPJxFKomDdxzBrqICBeA/OtBU3t1HMfzpIyOBopyp4JSObDOssZDBa2VA/fWlJfkflUXepgpIPpzZSehULbmBzLI=
X-Received: by 2002:a17:902:9f94:b029:e3:287f:9a3a with SMTP id
 g20-20020a1709029f94b02900e3287f9a3amr9699324plq.46.1613756252835; Fri, 19
 Feb 2021 09:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20210218192138.39449-1-jatedev@gmail.com> <20210218192138.39449-2-jatedev@gmail.com>
 <CANNYZj9W4N0VeTi2WOQYG0c_XzwYX0EwEXD-GVkoUz_ciaoUCw@mail.gmail.com>
 <623d1b0df8dec2247f9d0c41ca8372cfb0af59e8.camel@linuxfoundation.org>
 <CANPvuRkeiwD0ngL8Ang-v4X2iHUxU9aVK5feDGAQ3kYqST-hdA@mail.gmail.com> <617da916aa05ce7cb4c8c0d6367ea02bf1d1ffec.camel@linuxfoundation.org>
In-Reply-To: <617da916aa05ce7cb4c8c0d6367ea02bf1d1ffec.camel@linuxfoundation.org>
From: "Jate Sujjavanich" <jatedev@gmail.com>
Date: Fri, 19 Feb 2021 12:37:21 -0500
Message-ID: <CAPphmgbB5Us5sWaqZj7vOvrMyy=bABREa4=KsQP4E6Rq1oodqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] iputils: Use STAGING_DIR_NATIVE for setcap detection
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000034554905bbb3e827"

--00000000000034554905bbb3e827
Content-Type: text/plain; charset="UTF-8"

I think we need the revert patch, the libcap-native DEPENDS, and then some
logic to exclude the hard-coded paths to setcap if we are cross-compiling.
This seems more mesonic and may be submittable upstream. Your hypothesis
that they hard code the setcap paths for non-root users makes sense,
Richard.

Per Alex, oe-core does exclude the build machine from PATH in the cross
environment. I was going by the PATH in the target devshell which adds the
build machine's paths.

Version 3 of the patchset is forthcoming.

- Jate

On Fri, Feb 19, 2021 at 6:34 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-02-19 at 11:26 +0000, Jose Quaresma wrote:
> > The only change needed on the recipe are:
> >
> > -PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false, libcap"
> > +PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false, libcap
> libcap-native"
> >
> > The patch 0001-Add-support-for-setcap-in-STAGING_DIR_NATIVE.patch is not
> need because
> > with the addition of the libcap-native the meson find_program will find
> the setcap binary on the native
> > sysroot and will use it.
>
> Ok, we can take that change.
>
> I'm assuming you still want/need the revert (patch 1/2) as well
> though?
>
> That does give us a problem since on systems where libcap
> isn't in PACKAGECONFIG, the binaries will be non-deterministic
> again.
>
> Cheers,
>
> Richard
>
>
>

--00000000000034554905bbb3e827
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think we need the revert patch, the libcap-native D=
EPENDS, and then some logic to exclude the hard-coded paths to setcap if we=
 are cross-compiling. This seems more mesonic and may be submittable upstre=
am. Your hypothesis that they hard code the setcap paths for non-root users=
 makes sense, Richard.<br></div><div><br></div><div>Per Alex, oe-core does =
exclude the build machine from PATH in the cross environment. I was going b=
y the PATH in the target devshell which adds the build machine&#39;s paths.=
</div><div><br></div><div>Version 3 of the patchset is forthcoming.</div><d=
iv><br></div><div>- Jate<br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 19, 2021 at 6:34 AM Richard P=
urdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pur=
die@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Fri, 2021-02-19 at 11:26 +0000, Jose Quaresma wro=
te:<br>
&gt; The only change needed on the recipe are:<br>
&gt; <br>
&gt; -PACKAGECONFIG[libcap] =3D &quot;-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse, =
libcap&quot;<br>
&gt; +PACKAGECONFIG[libcap] =3D &quot;-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse, =
libcap libcap-native&quot;<br>
&gt; <br>
&gt; The patch=C2=A00001-Add-support-for-setcap-in-STAGING_DIR_NATIVE.patch=
 is not need because<br>
&gt; with the addition of the=C2=A0libcap-native=C2=A0the meson=C2=A0find_p=
rogram will find the=C2=A0setcap binary on the native<br>
&gt; sysroot and will use it.<br>
<br>
Ok, we can take that change.<br>
<br>
I&#39;m assuming you still want/need the revert (patch 1/2) as well=C2=A0<b=
r>
though?<br>
<br>
That does give us a problem since on systems where libcap<br>
isn&#39;t in PACKAGECONFIG, the binaries will be non-deterministic=C2=A0<br=
>
again.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--00000000000034554905bbb3e827--
