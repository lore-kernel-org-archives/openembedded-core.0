Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
	[209.85.217.45])
	by mail.openembedded.org (Postfix) with ESMTP id E2C5A601FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 13:50:04 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id m25so7629878vsa.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 06:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cLGVCqVVI+h68lm0ZgSc6SXm1++a0SGlR4luiUBgwaQ=;
	b=TONYavRaBCBmz91dCzl60UbAxRVvxUmwGTtGKHXil7g4lLmqH0VorXxDTpLDcI+lSG
	BEw7dhetsCcrI4VfT1Y24doDrOG+pGFbBwLZP70NpCgoVMTM7kTfldQd68l+ZEzD6+MU
	MguYAMCwjjbWQ1pfTCPmVSE+Yquw+SPFM6JyqZCxd/O9zUN999SiCQZ5jbbl99vpjd8l
	eoA1986vdw+A/Op/5wRNxdAVeiXNBwnxyQQC5flQ8/8+EmnwdbWMxv5E9J6qVLtLfxIJ
	VxRSlefvCZaBeE7gdumgaRENGZgDICTv0j07ScHEvH4W1oaBgO9GQGEVU65B1PktUTfH
	inAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cLGVCqVVI+h68lm0ZgSc6SXm1++a0SGlR4luiUBgwaQ=;
	b=Mj1wzYUYydkAQ8sSLb3eCcRYfOj0K4u7hHQZ5idR6Uct+9cXT3Lu/miDzL+a/UjUHF
	q4UgpC8YlWV/qqEQXM5zDSzOu5K/Waop/j+I7NwkSllMqZ1wWEZU5hKTLWBhHpO5eyVs
	QVkcwF+cjyFhDQUskQEelquSHcLMdJ9WNZaDVeHBLWOa4KkQmcL80wH4n0+KhONuDJu3
	7vWl8joAQpiuGrriDhN2BztUWLQ+N1MSTii58SBj+qPt7m5qL+IpTPCvSGh1tQmv7gBA
	+sATnS6S0jvA5oUwBfL5gijDmVUIKKn0aBeNGcdtgjmVl8JmuYa6fdtw3Jbe1dbQqEyw
	20Pw==
X-Gm-Message-State: ANhLgQ0p290p85QOESBgJrrsQqeZE2GEHsPEj1a12Y+LTN9t9NwSaPnn
	G9AwewSSb94fA/FjtL6CXPCWtlAgpTL5k7vVzhM=
X-Google-Smtp-Source: ADFU+vvQEuR1tGaajoVHaV5ilHgWMHtRKE0K9+Ph4Lxur49ttYPEx/kRdJgyQsGXmxneAeOrpAIgn0WjInPQ8V5RGRM=
X-Received: by 2002:a67:d03:: with SMTP id 3mr3061168vsn.35.1584539405527;
	Wed, 18 Mar 2020 06:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200229101433.30787-1-alex.kanavin@gmail.com>
	<23132fd4872488b259751cdf8bcd8335d703b205.camel@linuxfoundation.org>
	<CANNYZj_orEnKxs6AvyYTauDVexY+Eby2DeRYeh=9=-9i8TzTwg@mail.gmail.com>
	<d415671888365ca180bcfb72000bcd394f0e7b24.camel@linuxfoundation.org>
	<CANNYZj_RZ=Q1Me7_Ye+N4NmQBvW+fE2yDiRdsYu_XnCOGY_+nA@mail.gmail.com>
In-Reply-To: <CANNYZj_RZ=Q1Me7_Ye+N4NmQBvW+fE2yDiRdsYu_XnCOGY_+nA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Mar 2020 14:49:54 +0100
Message-ID: <CANNYZj9eiLf7n=Cu7X5A4z+YYz5upiW_9pjTgSPCX_2x2egSvA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] piglit: move to meta-oe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Mar 2020 13:50:05 -0000
Content-Type: multipart/alternative; boundary="000000000000663ae305a12154d9"

--000000000000663ae305a12154d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 29 Feb 2020 at 14:42, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> > > I'm not sure about this. The intent was to use piglit as a way of
>
>> > > improving our graphics testing, particularly allowing it to be
>> > > automated.
>> > >
>> > > Whilst we've had to focus on getting the basics right, I'm not sure
>> > > that objective isn't still a worthy goal over time?
>> >
>> > Piglit is meant for testing and validating OpenGL drivers for real
>> > hardware. While we can put it on top of software Mesa driver or
>> > virgl, I am not sure there is much value in that? Software rendering
>> > might even be too slow to run in practice.
>>
>> OE-Core is meant to be usable for validating BSPs amongst other things
>> though. Testing virgl does prove the graphics stack is working too from
>> a software perspective so does have some value.
>
>
> Right, I can put Piglit on top of virgl and see how well that works. It
> would be good to enable virgl =E2=80=98out of the box=E2=80=99 at some po=
int, I=E2=80=99ve been
> proposing that for a while :)
>

I found an old ticket where piglit was proposed for the core image testing,
and the idea was rejected due to its huge install size, so I won't be
pursuing this further.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10047

Would you still say it's worth to keep the recipe in core? Python-numpy
(that piglit and only piglit needs) isn't trivial to maintain either (for
instance, update to latest version needs cython to be added to core).

Alex

--000000000000663ae305a12154d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, 29 Feb 2020 at 14:42, Alexander Kanavin &lt;<a href=3D"mailt=
o:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">&gt; &gt; I&#39;m not sure =
about this. The intent was to use piglit as a way of<br><div><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &gt; improving our graphics testing, particularly allowing it to be<br=
>
&gt; &gt; automated.<br>
&gt; &gt; <br>
&gt; &gt; Whilst we&#39;ve had to focus on getting the basics right, I&#39;=
m not sure<br>
&gt; &gt; that objective isn&#39;t still a worthy goal over time?<br>
&gt; <br>
&gt; Piglit is meant for testing and validating OpenGL drivers for real<br>
&gt; hardware. While we can put it on top of software Mesa driver or<br>
&gt; virgl, I am not sure there is much value in that? Software rendering<b=
r>
&gt; might even be too slow to run in practice.<br>
<br>
OE-Core is meant to be usable for validating BSPs amongst other things<br>
though. Testing virgl does prove the graphics stack is working too from<br>
a software perspective so does have some value.</blockquote><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Right, I can put Piglit on top of virgl and =
see how well that works. It would be good to enable virgl =E2=80=98out of t=
he box=E2=80=99 at some point, I=E2=80=99ve been proposing that for a while=
 :)</div></div></div></blockquote><div><br></div><div><div>I found an old t=
icket where piglit was proposed for the core image testing, and the idea wa=
s rejected due to its huge install size, so I won&#39;t be pursuing this fu=
rther.</div><div><a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?=
id=3D10047">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10047</a></=
div><div><br></div><div>Would you still say it&#39;s worth to keep the reci=
pe in core? Python-numpy (that piglit and only piglit needs) isn&#39;t triv=
ial to maintain either (for instance, update to latest version needs cython=
 to be added to core).<br></div><div><br></div><div>Alex</div>=C2=A0</div><=
/div></div>

--000000000000663ae305a12154d9--
