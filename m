Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.3286.1589912712944957751
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 11:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WFGOI6H6;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id s3so88635eji.6
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 11:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+y2iD4EVi+YJhSNZNm2BZyCHjGK0wOOssnKQB+JGxow=;
        b=WFGOI6H6sgSsLgv6b8VVNkvu6VRt5PG0WkuJ0sZ5e+8WKJN1ug2UsQVej2F55Bk7wD
         3nlBdZ5kgZq9CyWZijKiKmrgxh4yvNy4ujuUbyabZG7m7Ndy2gXDI7ZPPjb43FEeMtm8
         r81pDJZCJlOwCcElRvjT1JPd7vLYoNjK4cyJ6Qb4RJBWtqtBMfzoNRcE6ckf+pDQK1uw
         5bG0TeNn8pogcaMdWpQHVOdoMb8adT2h8otjr1mSL6+3IIdUAzr3oTMIInu8PEnrb+8E
         MnigJCKOgorS1uAgFsLAD6P/4gOPDycVWWS+h+YX6mzc6O1sDO2vG0tvDob7ZAtl27oB
         N+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+y2iD4EVi+YJhSNZNm2BZyCHjGK0wOOssnKQB+JGxow=;
        b=CM7uVMV5Pq7FEpXlnYX+dXWRvlH2a8eIJzKFm8gIqHxc4WKeaOLtFzP4wqDI2L67Rt
         5RBbegmlTMu/9eFj8lSut1A8y/kTO33E94qf99P4dQdg/5uNZ51Y3Z1UgdxvoYGPFxuJ
         kecrJ+OkjYR6F/xnQ/JK2JjhxpKWzae5VLWRQqS9rwc3QspvFPiNVmjWX1bUrnM81xC9
         tj8Fsg1BPjN9geUniZPMJkNUtoMhJlM82BQS21V6wuLtEdrfF5mp3U0xgAWRmgrFgt2v
         z1xl/IwTSzlBkcBoSGvjKBq2JI/zfopiXb1kTDK1shaZx9dccY2K+uji5hiXLtgcBOO7
         WfdA==
X-Gm-Message-State: AOAM533kR4hCkmC0vq8gni5/GsGYEBTGGu0HnHcX85DM5ANsqQomiFzg
	5DioP+9wqsGC7OgZKlcsyLaWCatowRB8c346Pkzad+HM
X-Google-Smtp-Source: ABdhPJzuFvgB1Dkaa/UP7+/DbYoqII4QOTTj9rz5uXJINHoSAz+98G9tccVnh7eFPD6NNRvRRhQUN9PrnLFt4fGvY+I=
X-Received: by 2002:a17:906:374d:: with SMTP id e13mr482029ejc.392.1589912711418;
 Tue, 19 May 2020 11:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost> <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
 <20200516200957.GA8056@localhost> <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
 <20200517132245.GA9940@localhost> <CA+chaQeoVSY1HqivTCVkDixgJZOzxYchZ83FvRhgKuADwKJcFg@mail.gmail.com>
 <20200517154525.GA16162@localhost> <CA+chaQdKYt1ZMGxEnb6nQ2B3KitWXcNBsecgzfZ-htEVH=ySnA@mail.gmail.com>
 <20200517161441.GB16162@localhost> <5731941e-fe0c-e242-bea5-cd0d3c2ef772@gmail.com>
 <CAGDS+nkfNwuePOPSJ3JdRVqbzz=XTAvxMK_pjoeAX8vGnSS0HA@mail.gmail.com>
In-Reply-To: <CAGDS+nkfNwuePOPSJ3JdRVqbzz=XTAvxMK_pjoeAX8vGnSS0HA@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 19 May 2020 20:24:59 +0200
Message-ID: <CA+chaQcADhU_7tzV89CsEHH8YDa3xOobwxQmri9_2EWcLGVMWg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
To: Steve Sakoman <sakoman@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Adrian Bunk <bunk@stusta.de>, 
	Andrey Zhizhikin <andrey.z@gmail.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Denys Dmytriyenko <denis@denix.org>, 
	Joshua Watt <jpewhacker@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"jdmason@kudzu.us" <jdmason@kudzu.us>
Content-Type: multipart/alternative; boundary="00000000000063574a05a6046624"

--00000000000063574a05a6046624
Content-Type: text/plain; charset="UTF-8"

We have discussed this in OE TSC meeting yesterday:
https://lists.openembedded.org/g/tsc/topic/openembedded_tsc_meeting/74313532

tsc suggested to use LAYERVERSION bump in oe-core with
LAYERDEPENDS_meta-python update in meta-python, so that people will need to
update both layers (or neither if they really cannot).

Joshua volunteered to send patches if everybody agrees on this proposal.

On Tue, May 19, 2020 at 8:21 PM Steve Sakoman <sakoman@gmail.com> wrote:

> On Sun, May 17, 2020 at 1:47 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> > On 5/17/20 9:14 AM, Adrian Bunk wrote:
>
> > > IMHO moving recipes from meta-openembedded (or other layers) to oe-core
> > > in a released stable series is not a good idea.
> >
> > I think in current form in this situation it certainly seems a bit
> > complex sadly, however, we also need to explore if there is some "good"
> > way of doing such changes without breaking distro builders.
>
> It seems we don't have a clear consensus that backporting these
> patches to dunfell is a good idea.
>
> So for now I'm going to take the conservative approach and refrain
> from taking these patches in LTS.
>
> We can always revisit this later if the situation changes.
>
> Steve
>

--00000000000063574a05a6046624
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We have discussed this in OE TSC meeting yesterday:<div><a=
 href=3D"https://lists.openembedded.org/g/tsc/topic/openembedded_tsc_meetin=
g/74313532">https://lists.openembedded.org/g/tsc/topic/openembedded_tsc_mee=
ting/74313532</a><br></div><div><br></div><div>tsc suggested to use LAYERVE=
RSION bump in oe-core with LAYERDEPENDS_meta-python update in meta-python, =
so that people will need to update both layers (or neither if they really c=
annot).<br></div><div><br></div><div>Joshua volunteered to send patches if =
everybody agrees=C2=A0on this proposal.</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 19, 2020 at 8:21 P=
M Steve Sakoman &lt;<a href=3D"mailto:sakoman@gmail.com">sakoman@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Sun, May 17, 2020 at 1:47 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
<br>
&gt; On 5/17/20 9:14 AM, Adrian Bunk wrote:<br>
<br>
&gt; &gt; IMHO moving recipes from meta-openembedded (or other layers) to o=
e-core<br>
&gt; &gt; in a released stable series is not a good idea.<br>
&gt;<br>
&gt; I think in current form in this situation it certainly seems a bit<br>
&gt; complex sadly, however, we also need to explore if there is some &quot=
;good&quot;<br>
&gt; way of doing such changes without breaking distro builders.<br>
<br>
It seems we don&#39;t have a clear consensus that backporting these<br>
patches to dunfell is a good idea.<br>
<br>
So for now I&#39;m going to take the conservative approach and refrain<br>
from taking these patches in LTS.<br>
<br>
We can always revisit this later if the situation changes.<br>
<br>
Steve<br>
</blockquote></div>

--00000000000063574a05a6046624--
