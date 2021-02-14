Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.13978.1613283604172309926
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Feb 2021 22:20:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pmCxWR8S;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: milan.opensource@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id u66so4443745oig.9
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Feb 2021 22:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XM9zos9BGmt0oeCLavu+Ztq/F1x4q2tNY/DXG69EpTI=;
        b=pmCxWR8S1T+EHdcQ2t5JjIGZDRS8OE8GyGj6CNW/246CH0NEkDCfplI0LUS3W2Rfc2
         3g8MZ3ywE8pCXzWoiXdVH+uU/uYwgCbU06PtXOQs5eNCn/XVzk6xgzBRLSbMIdgx3peH
         MAuewEoQOUTMj88B20XydJ8VvlmI7QtLrOaiKRyGNfjO8Csw/3LL+SCurng0PXm4+1Fe
         nCbjZZNF28MFi5ZFz5PJyObi6DY8pxqWaVs0JDan+E7RgtRWOpb5UVjAvq8Zpcv/Fn8H
         ledVobougtwGchkvZcftW8R4c76CWROvXdG9M0mQuYkWyNAhjvfCGRW+rtRlEn18fUzd
         banQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XM9zos9BGmt0oeCLavu+Ztq/F1x4q2tNY/DXG69EpTI=;
        b=uNWBMSfoDCnyY25qOf0Hl0/+59hMFXuMYIIx7ZXJ8bfzMcgvh95VK7njig3Ix/2Pv9
         WhRhGdPw8pD35ZtTBn3Z3TXaCRWaZIyLsHdHXyUPsq4qYx9sq0eFbjHluPNiWPMLb+h6
         HjfZDZ5B3nM5NCLH1arJQLo5Mg32wIIMcuXqniji0vbuVZOveF/M3U2IHb+74Ywz/T8x
         xRY4i3ZLS6SIuLTt0u2692GRmb1sXwFV/tpCFE17FlCa9OAivkQYKWbsJA0dm9Eg2/cV
         ecsqIdYWWI9jPyXJkJ/h0nix44vVvtTiE6HSsZGgNzTB1uyXqLnsPeBI4iRqrwXURdIK
         pxeg==
X-Gm-Message-State: AOAM530kLcGZIuM1T5rbb8ViTH8nCDM9SDR/T/5u1PUSEbfrPpMVCIco
	gxYHGaNFQo3TvIJ6NYrSiEfTaDMryH/K+maPQQ==
X-Google-Smtp-Source: ABdhPJybS2RdmTDBcPX1M1ie9Z8gAyAqX/u0EnLdXVJMH5KjPb9awh61dv+0OOFYtvtgFvMPyvneSCsEbdULLVEAr98=
X-Received: by 2002:aca:cfd0:: with SMTP id f199mr4897968oig.64.1613283603580;
 Sat, 13 Feb 2021 22:20:03 -0800 (PST)
MIME-Version: 1.0
References: <20210122055805.14834-1-milan.opensource@gmail.com> <267ec66436e2a7cb1c049dbc98b69c3d90001d55.camel@linuxfoundation.org>
In-Reply-To: <267ec66436e2a7cb1c049dbc98b69c3d90001d55.camel@linuxfoundation.org>
From: "Milan Shah" <milan.opensource@gmail.com>
Date: Sun, 14 Feb 2021 11:49:52 +0530
Message-ID: <CAKdz3nETSJeuFnNFFQ9ewH4TAmP2rGj_UTewWeuuska8soqs3A@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] manifest.py: Add tests to empty image
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, akuster@mvista.com, 
	randy.macleod@windriver.com
Content-Type: multipart/alternative; boundary="0000000000001d0ae405bb45dc6f"

--0000000000001d0ae405bb45dc6f
Content-Type: text/plain; charset="UTF-8"

Yes, Richard

Looks like now there are two patches for the same bug. As the bugz was not
updated, I also worked on the same bug.

As It is already merged, you can neglect my one. Please update the Bugzilla
bug and mark it as resolve whoever has worked on it.


Thanks,
Milan Shah

On Sat, Feb 6, 2021 at 2:37 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-01-22 at 11:28 +0530, Milan Shah wrote:
> > An oe-selftest test is added to ensure
> > meta-selftest/recipes-test/images/test-empty-image.bb builds and is
> empty.
> >
> > It is just a test that ensures that an empty image has no packages in it
> > (i.e. nothing in the manifest)
> >
> > See [YOCTO #8455] for details.
> >
> > Signed-off-by: Milan Shah <milan.opensource@gmail.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/manifest.py | 45 ++++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
>
> I was curious what else was using test-empty-image.bb and I see a test
> in:
>
> meta/lib/oeqa/selftest/cases/imagefeatures.py:
>
>         """Test creation of image with no packages"""
>         bitbake('test-empty-image')
>         res_dir = get_bb_var('DEPLOY_DIR_IMAGE')
>         images = os.path.join(res_dir, "test-empty-image-*.manifest")
>         result = glob.glob(images)
>         with open(result[1],"r") as f:
>                 self.assertEqual(len(f.read().strip()),0)
>
> Is this test doing the same thing?
>
> Cheers,
>
> Richard
>
>

--0000000000001d0ae405bb45dc6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Yes, Richard<div><br></div><div>Looks lik=
e now there are two patches for the same bug. As the bugz was not updated, =
I also worked on the same bug.</div><div><br></div><div>As It is already me=
rged, you can neglect my one. Please update the Bugzilla bug and mark it as=
 resolve whoever has worked on it.</div><div><br></div><div><br></div><div>=
Thanks,</div><div>Milan Shah</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 6, 2021 at 2:37 PM Richard Pu=
rdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purd=
ie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Fri, 2021-01-22 at 11:28 +0530, Milan Shah wrote:<=
br>
&gt; An oe-selftest test is added to ensure<br>
&gt; meta-selftest/recipes-test/images/<a href=3D"http://test-empty-image.b=
b" rel=3D"noreferrer" target=3D"_blank">test-empty-image.bb</a> builds and =
is empty.<br>
&gt; <br>
&gt; It is just a test that ensures that an empty image has no packages in =
it<br>
&gt; (i.e. nothing in the manifest)<br>
&gt; <br>
&gt; See [YOCTO #8455] for details.<br>
&gt; <br>
&gt; Signed-off-by: Milan Shah &lt;<a href=3D"mailto:milan.opensource@gmail=
.com" target=3D"_blank">milan.opensource@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/lib/oeqa/selftest/cases/manifest.py | 45 ++++++++++++++++++=
++++++<br>
&gt; =C2=A01 file changed, 45 insertions(+)<br>
<br>
I was curious what else was using <a href=3D"http://test-empty-image.bb" re=
l=3D"noreferrer" target=3D"_blank">test-empty-image.bb</a> and I see a test=
<br>
in:<br>
<br>
meta/lib/oeqa/selftest/cases/imagefeatures.py:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Test creation of image with n=
o packages&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;test-empty-image&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 res_dir =3D get_bb_var(&#39;DEPLOY_DIR_IMAGE&#3=
9;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 images =3D os.path.join(res_dir, &quot;test-emp=
ty-image-*.manifest&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D glob.glob(images)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(result[1],&quot;r&quot;) as f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(le=
n(f.read().strip()),0)<br>
<br>
Is this test doing the same thing?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--0000000000001d0ae405bb45dc6f--
