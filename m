Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12039CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 15:00:04 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.19211.1758639595322812356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 07:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H6ub3PFb;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27d2c35c459so6240105ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 07:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758639595; x=1759244395; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P+1m+umODx/bYjm2ixRGIBPQ5t1im45LsBkJvTDv0yc=;
        b=H6ub3PFbF3erbvg5kPmLJ+i4CqfhNejvc36SpYGTetn41ESdsCOWduimCL9SOgE0XV
         8JmxORmlQjl/8gqzy3GJej+8ZOveU5uiLz7pDJvfdqgy8vXnSd+fs9+AcDbxmfoMvUSY
         hg1TdxiVARgLMbm24B1MLm4Uu20knDqVCpkm19vaoJ2rpbpeWPxwxRy2uLAs9m3sVMH/
         ccD/UO4iPw7fLYoJ4ESoz9Hrznagzb3heaXgZh79ddEe4hWWC+3jNt5MXavcwJk98+52
         Qs9ThvjhTlHEoI/5hLo9bBKXndQ0bjom7tkGcVU9rk1Kl2MLVlxfbvuwMjYBfDavDYSc
         z69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758639595; x=1759244395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+1m+umODx/bYjm2ixRGIBPQ5t1im45LsBkJvTDv0yc=;
        b=bCESuWRS2tnILfkUGZjORl3ZweZCbM67MjlDuGgi9PPOAPj2BcTay/lRo5JIDr8rOj
         xFVgM4jZIEGda9+UoU1S1BTAKnNoReVdHYGIclPfAxZfkA0lKxysHmP9ohGb7s6cdmAs
         l2HrrDd+wYrInQEDRquLJF84FPg22a103mH9PjUCf3KgTrC3Kff68PXUgNi8+M8o7TAI
         oftmaFR9v1RfXSwceOepIfeARp2E1YZGp34t2fMgkvwhAM5N15DlQeHezub58aa2J+wO
         FWgDJ9Bldo/S8GhyLEYAAggvLWE3tQ4VIIqFOgdEqftCovZbR9hSXu7tMwA4U9OYaqjS
         nddA==
X-Forwarded-Encrypted: i=1; AJvYcCWq32JxkBMbxZaywXzbDrHrPyfZHU9IdibCXgtLpoYKmAVX8a9sXWvinAn8D5sFmCYYEoi704j9plkNUgg11/wULA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxyksFY4e5KGzH+hLwDshIs603FWTxuPWE3OYr6/qW+6mLADPo4
	Q4cd6rHaB1Q7gE3RVEe5v3+BO92cu79AfRONNs6CpuXXoJP6AvrcRMAQlleF3KkW4UfHZT2r6vC
	+p+AktExgDDI39C6JJ5yX/Wwi+reH01s=
X-Gm-Gg: ASbGncv0HAB+grJdK8UstwXiIMy6u+4L75D7RuqvNPx2PV9Z5LE0cCEZBTJms+0Yq3B
	6VPKd8zgBAmo0XC6wRyCJoNIf5ehapE3JSgSvmB5W2oUpe1B9Vr3YDNfVKAUoi4rE7EGoQM/mRK
	jOb+jivmCDgJzp6Jphd5bNxPm3ALlacu5s+lJpMKUvuBi30/KebThf9YywZj4ere5YNoqyusI7Y
	PeemV8etAIlokAioqwBN3iDcO4/btVh2xCtcMf8
X-Google-Smtp-Source: AGHT+IH6IcET2Yo9ywA+2hL0kGpff/BqFVJc67prQlvYTDiLHybuAqYkP5WMOicLdXVoQ3wSdqdsaFD/M6tWcRx5rJw=
X-Received: by 2002:a17:902:ce0f:b0:276:842a:f9a7 with SMTP id
 d9443c01a7336-27cc7f8edb9mr42649295ad.57.1758639594535; Tue, 23 Sep 2025
 07:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250826185922.20154-1-peter.marko@siemens.com>
 <a9a5777d-d622-4e89-9888-3989f884e816@vaisala.com> <PA4PR10MB5707144A5B4B39EEDF739AEFFD16A@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
 <50952460f2bf31d8f1632d20f696a4e06985386b.camel@linuxfoundation.org>
 <AS1PR10MB5697B95623B2339AA021CA90FD1DA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <201b074a0d05dda923ff4ba10d86d74357cf45d6.camel@linuxfoundation.org>
In-Reply-To: <201b074a0d05dda923ff4ba10d86d74357cf45d6.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 23 Sep 2025 16:59:41 +0200
X-Gm-Features: AS18NWB-GQpQTjZrHxkETtDz_ZTjY-dlbTaxluJH8LpOyW6ol0GyyugJxkmisFM
Message-ID: <CAApg2=Q03BYUXtUtaHm3aAAD3ms=CiMMmYKUVoa7SJ8JF3iG9A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] cve-update: log timestamps and add force update
 for future time
To: richard.purdie@linuxfoundation.org
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, Niko Mauno <niko.mauno@vaisala.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000052021b063f793099"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 15:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223892

--00000000000052021b063f793099
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 2:47=E2=80=AFPM Richard Purdie via lists.openembedd=
ed.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> On Tue, 2025-09-23 at 12:30 +0000, Marko, Peter wrote:
> >
> >
> > > -----Original Message-----
> > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > Sent: Friday, September 19, 2025 0:16
> > > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>; Niko
> > > Mauno
> > > <niko.mauno@vaisala.com>; openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core][PATCH] cve-update: log timestamps and add
> > > force update
> > > for future time
> > >
> > > On Thu, 2025-09-18 at 12:55 +0000, Marko, Peter wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Niko Mauno <niko.mauno@vaisala.com>
> > > > > Sent: Thursday, September 18, 2025 14:48
> > > > > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> > > > > openembedded-core@lists.openembedded.org
> > > > > Subject: Re: [OE-core][PATCH] cve-update: log timestamps and
> > > > > add force
> > > update
> > > > > for future time
> > > > >
> > > > > On 26.8.2025 21.59, Peter Marko via lists.openembedded.org
> > > > > wrote:
> > > > > > From: Peter Marko <peter.marko@siemens.com>
> > > > > >
> > > > > > CVE update is currently not working properly on autobuilder.
> > > > > > This improves logging for problem analysis.
> > > > > >
> > > > > > Future time is something which could be reason for current
> > > > > > autobuilder
> > > > > > problems since the DB was not updated for more than 3 months
> > > > > > by now.
> > > > > >
> > > > >
> > > > > CVE check mechanism, which relies on a CVE database that can
> > > > > silently fail to
> > > > > update for several months, seems troubling to say the least.
> > > > >
> > > > > Looking at the do_fetch() method in both recipes they seem to
> > > > > use the
> > > > > os.path.getmtime() method to resolve the last modified time of
> > > > > the database.
> > > The
> > > > > value is however based on database file modification time. This
> > > > > seems
> > > inherently
> > > > > fragile, and I would be curious if there would be a less
> > > > > problem-prone
> > > approach
> > > > > that could be used to resolve the last modified date, such as
> > > > > resorting to the
> > > most
> > > > > recent CVE last modified date. Seems it can be extracted from
> > > > > the database
> > > file
> > > > > by issuing:
> > > > >
> > > > >    select MODIFIED from NVD order by MODIFIED desc limit 1;
> > > > >
> > > > > I'm not sure if all things considered it is completely
> > > > > appropriate to utilize the
> > > NVD
> > > > > MODIFIED value in this fashion, but it would feel at least less
> > > > > hazardous than
> > > > > referencing the modification time of the database file itself.
> > > > >
> > > >
> > > > I was considering multiple options, also using a text file with
> > > > timestamp instead
> > > of the getmtime.
> > > > Your proposal looks nicer.
> > > > But I decided to first look at the AB logs before implementing
> > > > something.
> > > >
> > > > Unfortunately, my patch to expose the logs was not merged yet :-(
> > > > https://lists.yoctoproject.org/g/yocto-patches/message/2083
> > >
> > > Basically I'm worried that this is something to debug a one off
> > > issue
> > > but we'll be left with files building up on the shared storage.
> > > We've
> > > multiple other debugging experiments like this from previous such
> > > situations. People add them but never remove things.
> >
> > I believe that I have written the patches in a way that they are not
> > temporary.
> > Then focus on improving logging which will be hopefully kept also
> > after the potential rework of timestamp handling.
> > Please let me know if this can be merged or in which other direction
> > do you think that we could go in investigating the clearly non-
> > working yocto CVE statistics.
>
> I get lots of requests to keep all kinds of build data "just in case".
> If I said yes to all of them, we'd just end up with mountains of files
> in an unmaintainable mess. In fact that already happens, hence the
> source of frustration and my reluctance to save more logs, especially
> since this isn't apparently temporary for debugging but permanent :(.
>
> I'm frustrated as where I have said "yes" to adding extra files in the
> past, they're cluttering up UIs, space on the NAS and it is left to
> others to try and cleanup the mess that builds up. These files are
> probably only useful to you and you alone since nobody else knows where
> they end up, why or how to use them. There is no documentation on any
> of this.
>
> Yes, we could develop policies and processes to clean these things up.
> Nobody has actually done that though, or has much interest in it, they
> just hope someone else does.
>
> I'm trying really hard to sort bitbake-setup and I'm sorry but I simply
> don't have the bandwidth to try and work out how to resolve this :(
>
> I guess I just merge the patch and get quietly upset/annoyed/frustrated
> since if I'm seen to "block" any form of CVE work, that is a huge
> problem too.
>
>
The design decision until now was that the database update is not a critica=
l
function and not to cause an error in case it breaks.

I think it might be more appropriate to make the build with cve-check
enabled break instead. Especially when you have FKIE flow that just
should not break.

What do you think?

Kind regards,
Marta

--00000000000052021b063f793099
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 23,=
 2025 at 2:47=E2=80=AFPM Richard Purdie via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;richard.purdie=3D<a href=3D"mailt=
o:linuxfoundation.org@lists.openembedded.org">linuxfoundation.org@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Tue, 2025-09-23 at 12:30 +0000, Marko, Peter wrote:<br>
&gt; <br>
&gt; <br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
&gt; &gt; Sent: Friday, September 19, 2025 0:16<br>
&gt; &gt; To: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Ma=
rko@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;; Niko<br=
>
&gt; &gt; Mauno<br>
&gt; &gt; &lt;<a href=3D"mailto:niko.mauno@vaisala.com" target=3D"_blank">n=
iko.mauno@vaisala.com</a>&gt;; <a href=3D"mailto:openembedded-core@lists.op=
enembedded.org" target=3D"_blank">openembedded-core@lists.openembedded.org<=
/a><br>
&gt; &gt; Subject: Re: [OE-core][PATCH] cve-update: log timestamps and add<=
br>
&gt; &gt; force update<br>
&gt; &gt; for future time<br>
&gt; &gt; <br>
&gt; &gt; On Thu, 2025-09-18 at 12:55 +0000, Marko, Peter wrote:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; &gt; From: Niko Mauno &lt;<a href=3D"mailto:niko.mauno@vaisa=
la.com" target=3D"_blank">niko.mauno@vaisala.com</a>&gt;<br>
&gt; &gt; &gt; &gt; Sent: Thursday, September 18, 2025 14:48<br>
&gt; &gt; &gt; &gt; To: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailt=
o:Peter.Marko@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt=
;;<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:openembedded-core@lists.openembedded.=
org" target=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; &gt; &gt; Subject: Re: [OE-core][PATCH] cve-update: log timestamp=
s and<br>
&gt; &gt; &gt; &gt; add force<br>
&gt; &gt; update<br>
&gt; &gt; &gt; &gt; for future time<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; On 26.8.2025 21.59, Peter Marko via <a href=3D"http://l=
ists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembed=
ded.org</a><br>
&gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; From: Peter Marko &lt;<a href=3D"mailto:peter.mark=
o@siemens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; CVE update is currently not working properly on au=
tobuilder.<br>
&gt; &gt; &gt; &gt; &gt; This improves logging for problem analysis.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Future time is something which could be reason for=
 current<br>
&gt; &gt; &gt; &gt; &gt; autobuilder<br>
&gt; &gt; &gt; &gt; &gt; problems since the DB was not updated for more tha=
n 3 months<br>
&gt; &gt; &gt; &gt; &gt; by now.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; CVE check mechanism, which relies on a CVE database tha=
t can<br>
&gt; &gt; &gt; &gt; silently fail to<br>
&gt; &gt; &gt; &gt; update for several months, seems troubling to say the l=
east.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Looking at the do_fetch() method in both recipes they s=
eem to<br>
&gt; &gt; &gt; &gt; use the<br>
&gt; &gt; &gt; &gt; os.path.getmtime() method to resolve the last modified =
time of<br>
&gt; &gt; &gt; &gt; the database.<br>
&gt; &gt; The<br>
&gt; &gt; &gt; &gt; value is however based on database file modification ti=
me. This<br>
&gt; &gt; &gt; &gt; seems<br>
&gt; &gt; inherently<br>
&gt; &gt; &gt; &gt; fragile, and I would be curious if there would be a les=
s<br>
&gt; &gt; &gt; &gt; problem-prone<br>
&gt; &gt; approach<br>
&gt; &gt; &gt; &gt; that could be used to resolve the last modified date, s=
uch as<br>
&gt; &gt; &gt; &gt; resorting to the<br>
&gt; &gt; most<br>
&gt; &gt; &gt; &gt; recent CVE last modified date. Seems it can be extracte=
d from<br>
&gt; &gt; &gt; &gt; the database<br>
&gt; &gt; file<br>
&gt; &gt; &gt; &gt; by issuing:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; =C2=A0=C2=A0 select MODIFIED from NVD order by MODIFIED=
 desc limit 1;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; I&#39;m not sure if all things considered it is complet=
ely<br>
&gt; &gt; &gt; &gt; appropriate to utilize the<br>
&gt; &gt; NVD<br>
&gt; &gt; &gt; &gt; MODIFIED value in this fashion, but it would feel at le=
ast less<br>
&gt; &gt; &gt; &gt; hazardous than<br>
&gt; &gt; &gt; &gt; referencing the modification time of the database file =
itself.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I was considering multiple options, also using a text file w=
ith<br>
&gt; &gt; &gt; timestamp instead<br>
&gt; &gt; of the getmtime.<br>
&gt; &gt; &gt; Your proposal looks nicer.<br>
&gt; &gt; &gt; But I decided to first look at the AB logs before implementi=
ng<br>
&gt; &gt; &gt; something.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Unfortunately, my patch to expose the logs was not merged ye=
t :-(<br>
&gt; &gt; &gt; <a href=3D"https://lists.yoctoproject.org/g/yocto-patches/me=
ssage/2083" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject=
.org/g/yocto-patches/message/2083</a><br>
&gt; &gt; <br>
&gt; &gt; Basically I&#39;m worried that this is something to debug a one o=
ff<br>
&gt; &gt; issue<br>
&gt; &gt; but we&#39;ll be left with files building up on the shared storag=
e.<br>
&gt; &gt; We&#39;ve<br>
&gt; &gt; multiple other debugging experiments like this from previous such=
<br>
&gt; &gt; situations. People add them but never remove things.<br>
&gt; <br>
&gt; I believe that I have written the patches in a way that they are not<b=
r>
&gt; temporary.<br>
&gt; Then focus on improving logging which will be hopefully kept also<br>
&gt; after the potential rework of timestamp handling.<br>
&gt; Please let me know if this can be merged or in which other direction<b=
r>
&gt; do you think that we could go in investigating the clearly non-<br>
&gt; working yocto CVE statistics.<br>
<br>
I get lots of requests to keep all kinds of build data &quot;just in case&q=
uot;.<br>
If I said yes to all of them, we&#39;d just end up with mountains of files<=
br>
in an unmaintainable mess. In fact that already happens, hence the<br>
source of frustration and my reluctance to save more logs, especially<br>
since this isn&#39;t apparently temporary for debugging but permanent :(.<b=
r>
<br>
I&#39;m frustrated as where I have said &quot;yes&quot; to adding extra fil=
es in the<br>
past, they&#39;re cluttering up UIs, space on the NAS and it is left to<br>
others to try and cleanup the mess that builds up. These files are<br>
probably only useful to you and you alone since nobody else knows where<br>
they end up, why or how to use them. There is no documentation on any<br>
of this.<br>
<br>
Yes, we could develop policies and processes to clean these things up.<br>
Nobody has actually done that though, or has much interest in it, they<br>
just hope someone else does.<br>
<br>
I&#39;m trying really hard to sort bitbake-setup and I&#39;m sorry but I si=
mply<br>
don&#39;t have the bandwidth to try and work out how to resolve this :(<br>
<br>
I guess I just merge the patch and get quietly upset/annoyed/frustrated<br>
since if I&#39;m seen to &quot;block&quot; any form of CVE work, that is a =
huge<br>
problem too.<br>
<br></blockquote><div><br></div><div>The design decision until now was that=
 the database update is not a critical</div><div>function and not to cause =
an error in case it breaks.</div><div><br></div><div>I think it might be mo=
re appropriate to make the build with cve-check</div><div>enabled break ins=
tead. Especially when you have FKIE flow that just</div><div>should not bre=
ak.</div><div><br></div><div>What do you think?</div><div><br></div><div>Ki=
nd regards,</div><div>Marta<br></div></div></div>

--00000000000052021b063f793099--

