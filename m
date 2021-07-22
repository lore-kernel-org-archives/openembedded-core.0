Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.8912.1626965782868108668
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 07:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fED57uGe;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id q15so5626245qkm.8
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 07:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0VkeACm4f731RcYpEGGIfb8vMNHKM20LKMZn3Ncnckk=;
        b=fED57uGeU1J3Xi6tx6+rEm0HJtdl0ti4SvRTfAax2kQWi8Rd+bbVLbsLJ9bCQilg1T
         mENhoKjIECYWhZSmprS6wgya1i6dsSQTajL2oNoGmcrZzTfEWpEOD3M83WT0aTyVn10w
         pUO74DOirW3/K/Zx72uEHALbZA4U0NP/bcnjASz3498WvXKMwi0JqBZYi7+3iPohffp1
         L5EynbKTCTsK4y2ZdC5t4WHLx53Q1vxPR+xIHQsjneqdXy7cr9Nwsl+9Sj6klJxHtCwT
         olCVqaKyIYCkiR5TYyxt2TSxcmPcyD4BBWuwBwW7lxdGT1V/v7MXFV1l4Gv7cAPFDvea
         4Quw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0VkeACm4f731RcYpEGGIfb8vMNHKM20LKMZn3Ncnckk=;
        b=GEZVrs23M92YFaUY9puuL6qNmNYXzREzgBBskB28iN9NAoP+RWHCcGDLgehS4EpBXw
         wYjnccdbfnCnKKWWjGDK25pIgS5/9Vwe3j5wTA8tg9vv/Balmp718ChrEXWlzKFYfrD4
         n2M8+CXGaBsVlK2CvPYPUrkRdxE3rocOZ2+CGwu+ljvkWOBBhfBiYP9qWKU4ULUr7g47
         mXLs82gsADH0HGulK/rTwhtqkLqvS+Z9hlyGGQZSi2x4HkDle8ZbzJGFOIYoT87+XOAb
         MDWes569QhlAGvL4aiTs7R/Qmva2YpVvRko3qcLCyH06SlbfW+lpxq2Xp0Dcagvj6L2G
         I7+w==
X-Gm-Message-State: AOAM530FBr/Prh0AYReF+darmkK7lzTyweeb2d78OltYFCJBzNhA2L41
	wKFSDNlLRoK2fmCGP8/bWJ9uxaLkKPLhiB5eWRDfYIq/sME=
X-Google-Smtp-Source: ABdhPJygBQOkpnYCToFgr2fsf2OBZMuHac5QlBRNK76M1r3tpNdadEz1u/RrrMAqX95IA8WgNPh+1BqFmaO/ftnoIhc=
X-Received: by 2002:a05:620a:109a:: with SMTP id g26mr87403qkk.25.1626965781811;
 Thu, 22 Jul 2021 07:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210721021108.1082410-1-raj.khem@gmail.com> <YPkqwl0OiCwPtuer@piout.net>
In-Reply-To: <YPkqwl0OiCwPtuer@piout.net>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 22 Jul 2021 07:56:11 -0700
Message-ID: <CAMKF1soNY99BuAgNxgj7U=FukWY14VUa+_axra0zLB1bqe9u3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] binutils: Upgrade to 2.37 branch
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007c95a005c7b77d9d"

--0000000000007c95a005c7b77d9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 1:22 AM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Hi Khem,
>
> On 20/07/2021 19:11:08-0700, Khem Raj wrote:
> > This izOs next/latest release branch for binutils
> > Drop backports and CVE fixes which already are applied upstream
> >
> > bfd_stdint.h has been removed in favor of using stdint.h
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > V2: Fixes SDK builds for mingw and glew build with GLES
> >
>
> This didn't apply properly, I fixed it up, can you check
>
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dabello=
ni/master-next&id=3Defb06e3e03c750944bfa40314dae70c054bdaed4
>

What portion did not apply ? It looks alright to me but want to know so I
can correct my branch since I have few other patches lined up before it I
wonder if that=E2=80=99s the issue or something else

>
> It built fine and I have another build going right now.
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000007c95a005c7b77d9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jul 22, 2021 at 1:22 AM Alexandre Belloni &lt;<a hr=
ef=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Khem,<br>
<br>
On 20/07/2021 19:11:08-0700, Khem Raj wrote:<br>
&gt; This izOs next/latest release branch for binutils<br>
&gt; Drop backports and CVE fixes which already are applied upstream<br>
&gt; <br>
&gt; bfd_stdint.h has been removed in favor of using stdint.h<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; V2: Fixes SDK builds for mingw and glew build with GLES<br>
&gt; <br>
<br>
This didn&#39;t apply properly, I fixed it up, can you check<br>
<a href=3D"https://git.openembedded.org/openembedded-core-contrib/commit/?h=
=3Dabelloni/master-next&amp;id=3Defb06e3e03c750944bfa40314dae70c054bdaed4" =
rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembed=
ded-core-contrib/commit/?h=3Dabelloni/master-next&amp;id=3Defb06e3e03c75094=
4bfa40314dae70c054bdaed4</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">What portion did=
 not apply ? It looks alright to me but want to know so I can correct my br=
anch since I have few other patches lined up before it I wonder if that=E2=
=80=99s the issue or something else=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><br>
It built fine and I have another build going right now.<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--0000000000007c95a005c7b77d9d--
