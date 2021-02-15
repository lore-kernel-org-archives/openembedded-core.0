Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web12.27624.1613370092284428235
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 22:21:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fTWLHU+t;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id u7so2765075vsp.12
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 22:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N6PItbFmw0XqWxZlZVEPkpifrDpu/G2FFS/dWDoktHg=;
        b=fTWLHU+ta6CjxqUJNhBxKY+fsEvSezlmdC87C+p1Py6y523RWm6a00wh6QqFLuKrFG
         Sh/dFn2pIdNo9JxArUjlxbrGbodPKLTbCur/ICTLVK50m5/bW3u4sQRu+K0zKjVAWu3C
         MHivNfiNURCYDLKrRq+1Mk5nWE1RWyuM8llHicqV9MeAKNGWpsqRb6uFsyWRloJkLcCz
         xtV27XpfgcCQ1EkPbLyEOQLFyHziFiOCWPBBiO4ltNQaxQhHF5IImH7RnTOUTAewFNi/
         o2+fKyTXd0c/88EXhOm1liGj453BuraQ/BsFj9H8QYFaCYHs+/bdINssUSHAD8JqpQFt
         vbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N6PItbFmw0XqWxZlZVEPkpifrDpu/G2FFS/dWDoktHg=;
        b=jc4vis9iW3T67mtwXVgtXb/AA0Hh8sd4Pqyi4ANOVMFebKtzKtaUWzZOHlz95prIVY
         a0bjkg6KcO9y2TUeKbaRcdSGAAFSz5p/tXWtJLv2Er+I33jqPAHMjsU5n+6hQ3mZjzYT
         mnhCnKlaAfhBkGXSaQ8NFA8Mu+bP2NX+7DXXrHH6yLuLih8s0nOcH0hr2+r17Ox39MlQ
         LqPMj2Orx2+AUOubNOGWaK4gPBXuAEt+VKEJrKl+XPK2pBgw8qk37r6IIAdCiR4hM2+R
         PU7yZf3xkDi1KfpWi6Rzh8wOsZN3vCwtI5MfxzN8xohUA3oZOdMDt3rSmoyU0gAbz9XR
         GLQQ==
X-Gm-Message-State: AOAM531ljiGy/UH4RuMmGe3BjVSpyRuABdEVeDNNsOhh63chyI0L9QaT
	uPhmcvsAGYBfdDotHO9SsIHLQzCfZrJxtQ1S2a4=
X-Google-Smtp-Source: ABdhPJwm9bBal+ALMFaBtefFCU7StFxkEvsoC97wBZbYzVT0ackEw4DhVSuBfME275hvfOp5vG2TDc+eiYvfKrrIkZI=
X-Received: by 2002:a67:c599:: with SMTP id h25mr7534802vsk.31.1613370091287;
 Sun, 14 Feb 2021 22:21:31 -0800 (PST)
MIME-Version: 1.0
References: <80c70797943e52fa430d2f9f65bffe7a90730dec.camel@linuxfoundation.org>
 <CAJdd5GZ4WyPb+Rc-s1n=mm-PQo3ENcjwdnLxsyH1FMC0YTGB-g@mail.gmail.com>
In-Reply-To: <CAJdd5GZ4WyPb+Rc-s1n=mm-PQo3ENcjwdnLxsyH1FMC0YTGB-g@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 15 Feb 2021 07:21:20 +0100
Message-ID: <CANNYZj9cpxKMWbwXFaJay0C-yFk4_9B45T4V34a_vKS1PG38pQ@mail.gmail.com>
Subject: Re: Autobuilder reproducibility target changes
To: Joshua Watt <jpewhacker@gmail.com>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	swat <swat@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000002eb72105bb59ff93"

--0000000000002eb72105bb59ff93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99ve definitely seen diffoscope process take hours and hours and ho=
urs in
local builds. Trying it with these vim packages locally should still be
done.

Alex

On Sun 14. Feb 2021 at 20.18, Joshua Watt <jpewhacker@gmail.com> wrote:

> On Sun, Feb 14, 2021 at 6:19 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > Regular users of the autobuilder will note that I've split the
> > reproducible builds test out of the main oe-selftest build and into its
> > own target build. This is because that test tends to run for a lot
> > longer time period and it helps to see the result separately.
> >
> > I've only done this for master. If gatesgarth and dunfell want to
> > follow, that should be straight forward with a change to the branch in
> > autobuilder-helper. Obviously we should ensure this is working ok with
> > master first but so far so good.
> >
> > It has already highlighted the difference between a successful run:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/2
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/119/builds/2
> > (took 3-4 hours)
> >
> > and failing two failing runs:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/2
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/2
> > (took 9 hours)
>
> OK, I read through the code and unfortunately found a bug: when
> attempting to make sure the "B" build doesn't use sstate, I misspelled
> the SSTATE_MIRRORS, which means that the B build could have been
> pulling from the sstate mirror when it was not supposed to. This has a
> few implications:
>
>  1) It might explain why some of the reproducible results seem intermitte=
nt
>  2) It might explain why there is such a time disparity between the tests
>
> Unfortunately, while it probably will help the intermittent results,
> it probably means that the tests taking 9 hours is what is "supposed"
> to happen, and they happen to be shorter sometimes because the B build
> is pulling from sstate when it's not supposed to.
>
> >
> > the time difference being the system trying to run diffoscope on vim-
> > common :/.
> >
> > I'm aware I removed some recipes from the exclusions list after seeing
> > multiple passing builds for all distros and we're now seeing test
> > failures. My mistake was not waiting for the date to change and for
> > builds to run on an autobuilder worker with a different umask.
> >
> > Meson is failing with a pyc file mismatch which diffoscope can't decode
> > and despite trying for 5 hours, diffoscope hasn't given any data on why
> > vim-common differs. I should have fixes in for quilt, valgrind, kernel-
> > devsrc and cwautomacros. The umask fix may fix other issues too. Alex
> > has improved the reporting so we can spot cases where exclusion is now
> > longer needed.
> >
> > Cheers,
> >
> > Richard
> >
>

--0000000000002eb72105bb59ff93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I=E2=80=99ve definitely seen diffoscope process take hour=
s and hours and hours in local builds. Trying it with these vim packages lo=
cally should still be done.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sun 14. Feb 2021 at 20.18, Joshua Watt &lt;<a href=3D"mailt=
o:jpewhacker@gmail.com">jpewhacker@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204=
,204,204)">On Sun, Feb 14, 2021 at 6:19 AM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Regular users of the autobuilder will note that I&#39;ve split the<br>
&gt; reproducible builds test out of the main oe-selftest build and into it=
s<br>
&gt; own target build. This is because that test tends to run for a lot<br>
&gt; longer time period and it helps to see the result separately.<br>
&gt;<br>
&gt; I&#39;ve only done this for master. If gatesgarth and dunfell want to<=
br>
&gt; follow, that should be straight forward with a change to the branch in=
<br>
&gt; autobuilder-helper. Obviously we should ensure this is working ok with=
<br>
&gt; master first but so far so good.<br>
&gt;<br>
&gt; It has already highlighted the difference between a successful run:<br=
>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/115=
/builds/2" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctopr=
oject.org/typhoon/#/builders/115/builds/2</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/119=
/builds/2" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctopr=
oject.org/typhoon/#/builders/119/builds/2</a><br>
&gt; (took 3-4 hours)<br>
&gt;<br>
&gt; and failing two failing runs:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/116=
/builds/2" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctopr=
oject.org/typhoon/#/builders/116/builds/2</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/118=
/builds/2" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctopr=
oject.org/typhoon/#/builders/118/builds/2</a><br>
&gt; (took 9 hours)<br>
<br>
OK, I read through the code and unfortunately found a bug: when<br>
attempting to make sure the &quot;B&quot; build doesn&#39;t use sstate, I m=
isspelled<br>
the SSTATE_MIRRORS, which means that the B build could have been<br>
pulling from the sstate mirror when it was not supposed to. This has a<br>
few implications:<br>
<br>
=C2=A01) It might explain why some of the reproducible results seem intermi=
ttent<br>
=C2=A02) It might explain why there is such a time disparity between the te=
sts<br>
<br>
Unfortunately, while it probably will help the intermittent results,<br>
it probably means that the tests taking 9 hours is what is &quot;supposed&q=
uot;<br>
to happen, and they happen to be shorter sometimes because the B build<br>
is pulling from sstate when it&#39;s not supposed to.<br>
<br>
&gt;<br>
&gt; the time difference being the system trying to run diffoscope on vim-<=
br>
&gt; common :/.<br>
&gt;<br>
&gt; I&#39;m aware I removed some recipes from the exclusions list after se=
eing<br>
&gt; multiple passing builds for all distros and we&#39;re now seeing test<=
br>
&gt; failures. My mistake was not waiting for the date to change and for<br=
>
&gt; builds to run on an autobuilder worker with a different umask.<br>
&gt;<br>
&gt; Meson is failing with a pyc file mismatch which diffoscope can&#39;t d=
ecode<br>
&gt; and despite trying for 5 hours, diffoscope hasn&#39;t given any data o=
n why<br>
&gt; vim-common differs. I should have fixes in for quilt, valgrind, kernel=
-<br>
&gt; devsrc and cwautomacros. The umask fix may fix other issues too. Alex<=
br>
&gt; has improved the reporting so we can spot cases where exclusion is now=
<br>
&gt; longer needed.<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
</blockquote></div></div>

--0000000000002eb72105bb59ff93--
