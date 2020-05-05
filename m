Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.66.1588641719749271762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 18:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: aehs29@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 188so40977lfa.10
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 18:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DlhTWuaSNaj1QESSQj5bG/iH2LFCp+xIhIoo95tSUKM=;
        b=rB+Hi+VPqSS76FJhEuW/aQT6BCEfwV2XFAYt4H95yOBUBu4ODEX+WNyiqpii1pG+y1
         MzgMnlqQzOBTpLWh4BH1wSkXWmXVRs3Xrxz3VasJaYDPNJMs4o7vnbFJwHTtU1ufGCOx
         g2mKzRnt1WK25DTKbVX7GCQhdRikn8UmZhrY3xzY2C+PKpR1GGFH0mGmWYtt5Jlxg+2y
         b7lqbowYwJQAhVtruFNIEvQ/tkuAn1+4fYadeSmkdvO6C4mqXMLZjkR0zAZL2UnVwgR/
         jP2j0ACdFus9K0sLOD1eKUutsy/oY9XzRaJmwaoC8JGudi0H2Y0jo2zCjTzZD5ed0Um9
         InbA==
X-Gm-Message-State: AGi0PuYXyZpO4yGRYh0ZMcz/BP0AFPPh3DVk9ZNfu05AQ3sDrHGZ6IWK
	ZhM1a7/fqTG+U3jl6sj69X4bZqWI
X-Google-Smtp-Source: APiQypKQ2ls0c2GEkjY2ZWfo1F1PtxXY+pI3xlSkjEZwjfQJnGqD/z39vZm2zDZ9SlT1Cjn/J1bdEQ==
X-Received: by 2002:ac2:4248:: with SMTP id m8mr140663lfl.211.1588641717739;
        Mon, 04 May 2020 18:21:57 -0700 (PDT)
Return-Path: <aehs29@gmail.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id c10sm516043lfc.7.2020.05.04.18.21.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 18:21:57 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id g4so44794ljl.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 18:21:57 -0700 (PDT)
X-Received: by 2002:a2e:3e15:: with SMTP id l21mr265675lja.251.1588641717036;
 Mon, 04 May 2020 18:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200504205751.40338-1-alejandro@enedino.org> <20200504210236.2273.59294@do>
 <f242e19e-c275-f0b0-b7f1-63f7c056c611@linux.microsoft.com> <CAGDS+nm9n-VBw2Hf-Yk93K2-xLSSrZUuR8TTCZuSXpZ-oTmPJQ@mail.gmail.com>
In-Reply-To: <CAGDS+nm9n-VBw2Hf-Yk93K2-xLSSrZUuR8TTCZuSXpZ-oTmPJQ@mail.gmail.com>
From: "Alejandro Hernandez" <alejandro@enedino.org>
Date: Mon, 4 May 2020 19:21:44 -0600
X-Gmail-Original-Message-ID: <CAHMutrbT5vFOhmZSK6N5SuoceSf65jGaw2iqepE1_kReVXGeLg@mail.gmail.com>
Message-ID: <CAHMutrbT5vFOhmZSK6N5SuoceSf65jGaw2iqepE1_kReVXGeLg@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFtPRS1jb3JlXSDinJcgcGF0Y2h0ZXN0OiBmYWlsdXJlIGZvciBuZXdsaWI6IFVwZ3JhZGUgdG8gbGF0ZXN0IHllYXJseSByZWxlYXNlIDMuMy4w?=
To: Steve Sakoman <sakoman@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000382ba005a4dc79ec"

--000000000000382ba005a4dc79ec
Content-Type: text/plain; charset="UTF-8"

On Mon, May 4, 2020, 7:17 PM Steve Sakoman <sakoman@gmail.com> wrote:

> On Mon, May 4, 2020 at 11:12 AM Alejandro Hernandez
> <alhe@linux.microsoft.com> wrote:
> >
> > My bad, this meant to be a patch for Dunfell since its been merged on
> master already, please disregard this failure
>
> If you'd like me to consider a patch for dunfell, I'll need a little
> more info than just that it is a version upgrade.
>
> For dunfell patches to be considered they should be in one of the
> following categories:
>
> Acceptable:
>
> Security and CVE fixes
> Fixes for bugs
> Changes to follow an upstream stable series or LTS that aligns with
> the original release (based on compatibility)
>
> Potentially Acceptable:
>
> Fixes so codebase works with newly released distros (only in the first
> six months after a given release series first releases)
> Bug fix only version upgrades for upstreams with a good stable process
>
> So if you could tag any patches for dunfell LTS with [dunfell] in the
> subject and let me know which of the above categories the patch falls
> into I will be a happy maintainer ;-)
>
> Steve
>

Understood, I don't think it fits any of those, so lets keep this one off
Dunfell for now.

Thanks Steve

Cheers,

Alejandro


> > On 5/4/20 2:02 PM, Patchwork wrote:
> >
> > == Series Details ==
> >
> > Series: newlib: Upgrade to latest yearly release 3.3.0
> > Revision: 1
> > URL   : https://patchwork.openembedded.org/series/23943/
> > State : failure
> >
> > == Summary ==
> >
> >
> > Thank you for submitting this patch series to OpenEmbedded Core. This is
> > an automated response. Several tests have been executed on the proposed
> > series by patchtest resulting in the following failures:
> >
> >
> >
> > * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head]
> >   Suggested fix    Rebase your series on top of targeted branch
> >   Targeted branch  master (currently at 26eb22191f)
> >
> >
> >
> > If you believe any of these test results are incorrect, please reply to
> the
> > mailing list (openembedded-core@lists.openembedded.org) raising your
> concerns.
> > Otherwise we would appreciate you correcting the issues and submitting a
> new
> > version of the patchset if applicable. Please ensure you add/increment
> the
> > version number when sending the new version (i.e. [PATCH] -> [PATCH v2]
> ->
> > [PATCH v3] -> ...).
> >
> > ---
> > Guidelines:
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> > Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> >
> >
> > 
>

--000000000000382ba005a4dc79ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, May 4, 2020, 7:17 PM Steve Sakoman &lt;<a href=
=
=3D"mailto:sakoman@gmail.com">sakoman@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">On Mon, May 4, 2020 at 11:12 AM Alejandro Hern=
andez<br>
&lt;<a href=3D"mailto:alhe@linux.microsoft.com" target=3D"_blank" rel=3D"n=
oreferrer">alhe@linux.microsoft.com</a>&gt; wrote:<br>
&gt;<br>
&gt; My bad, this meant to be a patch for Dunfell since its been merged on=
 master already, please disregard this failure<br>
<br>
If you&#39;d like me to consider a patch for dunfell, I&#39;ll need a litt=
le<br>
more info than just that it is a version upgrade.<br>
<br>
For dunfell patches to be considered they should be in one of the<br>
following categories:<br>
<br>
Acceptable:<br>
<br>
Security and CVE fixes<br>
Fixes for bugs<br>
Changes to follow an upstream stable series or LTS that aligns with<br>
the original release (based on compatibility)<br>
<br>
Potentially Acceptable:<br>
<br>
Fixes so codebase works with newly released distros (only in the first<br>
six months after a given release series first releases)<br>
Bug fix only version upgrades for upstreams with a good stable process<br>
<br>
So if you could tag any patches for dunfell LTS with [dunfell] in the<br>
subject and let me know which of the above categories the patch falls<br>
into I will be a happy maintainer ;-)<br>
<br>
Steve<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquot=
e></div></div><div dir=3D"auto">Understood, I don&#39;t think it fits any o=
f those, so lets keep this one off Dunfell for now.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Thanks Steve</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Alejandro</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; On 5/4/20 2:02 PM, Patchwork wrote:<br>
&gt;<br>
&gt; =3D=3D Series Details =3D=3D<br>
&gt;<br>
&gt; Series: newlib: Upgrade to latest yearly release 3.3.0<br>
&gt; Revision: 1<br>
&gt; URL=C2=A0 =C2=A0: <a href=3D"https://patchwork.openembedded.org/serie=
s/23943/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://patchwork=
.openembedded.org/series/23943/</a><br>
&gt; State : failure<br>
&gt;<br>
&gt; =3D=3D Summary =3D=3D<br>
&gt;<br>
&gt;<br>
&gt; Thank you for submitting this patch series to OpenEmbedded Core. This=
 is<br>
&gt; an automated response. Several tests have been executed on the propos=
ed<br>
&gt; series by patchtest resulting in the following failures:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; * Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Series does no=
t apply on top of target branch [test_series_merge_on_head]<br>
&gt;=C2=A0 =C2=A0Suggested fix=C2=A0 =C2=A0 Rebase your series on top of t=
argeted branch<br>
&gt;=C2=A0 =C2=A0Targeted branch=C2=A0 master (currently at 26eb22191f)<br=
>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; If you believe any of these test results are incorrect, please reply =
to the<br>
&gt; mailing list (<a href=3D"mailto:openembedded-core@lists.openembedded.=
org" target=3D"_blank" rel=3D"noreferrer">openembedded-core@lists.openembed=
ded.org</a>) raising your concerns.<br>
&gt; Otherwise we would appreciate you correcting the issues and submittin=
g a new<br>
&gt; version of the patchset if applicable. Please ensure you add/incremen=
t the<br>
&gt; version number when sending the new version (i.e. [PATCH] -&gt; [PATC=
H v2] -&gt;<br>
&gt; [PATCH v3] -&gt; ...).<br>
&gt;<br>
&gt; ---<br>
&gt; Guidelines:=C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.openembedded.or=
g/wiki/Commit_Patch_Message_Guidelines" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">https://www.openembedded.org/wiki/Commit_Patch_Message_Guideli=
nes</a><br>
&gt; Test framework: <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/=
patchtest" rel=3D"noreferrer noreferrer" target=3D"_blank">http://git.yocto=
project.org/cgit/cgit.cgi/patchtest</a><br>
&gt; Test suite:=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org=
/cgit/cgit.cgi/patchtest-oe" rel=3D"noreferrer noreferrer" target=3D"_blank=
">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe</a><br>
&gt;<br>
&gt;<br>
&gt; <br>
</blockquote></div></div></div>

--000000000000382ba005a4dc79ec--
