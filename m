Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id A27EE606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 17:32:33 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id b199so93126424lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 10:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U3SgHhUsyA9Qe/OSfEKFWDDHRq7rZfkf3SYjN4628/Q=;
	b=hfdW6c6FGvkDZDVuRxL9LIh2D1b84zc+WvFNAByCZQPSilE3/IpKnMdY8vgVwyCx4T
	mc7HYEpACYo2GWVm2QcY5hztL7bKz2w0XZcv1PCGyCUThhU/pffPour/xlHrstyIbfIW
	wGSj5pWGQ15G/4kJxNm8c/vuDpkKqMTbLaFKZkslkqKQYfxk6TJX4RJqAs5ex4Dfh7MR
	oN46eE+SV6we8RAQ9EAMjkCvoBNTHxHgXRqY+gbFVZWKoR9ooNUticSBoka1gOpSrJAi
	YRgzD4zxcDMqdYrfQyCvtvdE0QxZHMeXylGixJ3+sZzsSloWksOg1zlrdw4IV+tBBpb5
	hzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U3SgHhUsyA9Qe/OSfEKFWDDHRq7rZfkf3SYjN4628/Q=;
	b=C8NU2FhnOHD+nXzgWWWIIB9athTWLMZFKiCFaGKFohgpuVG2B9wVyvuuWB6geE4D9X
	Mi1KnJgMWpTUmk2tSqj7a2iMQGnCQXNhEz+ADKMeGCSPsHM9DQwNXrVYt40NMeLaexu2
	Np2ti3gOSo7BM5BpvbtDmqUjxHGHwB8eamB/pWinXfvGQtQ85OI1rjMPnyrj4cWDcX+d
	567umZX3aHCmU7+KXu7v8zsv/svEd9nmGI/BOFeKfF84n4Phl3g3avTBuH45D758gpwQ
	+yMm3mNlm0NtukYt1tgq8lS5gSmT6gy+NcPPd4UnheIAs1+aAdzdI9/cYbcc+YC6y23N
	lKPw==
X-Gm-Message-State: ALyK8tLqdR9Gd1ZSOH1qFEDgl7yFsietI+fNRxPFwWuM4/p8fTK+NSxA+8eGAzTfF24YdIS//IN3jAmTrw4TVA==
X-Received: by 10.46.1.35 with SMTP id 35mr9987078ljb.8.1468603954254; Fri, 15
	Jul 2016 10:32:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.10.10 with HTTP; Fri, 15 Jul 2016 10:32:33 -0700 (PDT)
In-Reply-To: <5788F2C3.800@gmail.com>
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
	<ba010ae55186d533ee35ed38839d7761d7b004a3.1468546499.git.timothy.t.orling@linux.intel.com>
	<5788EAC8.5090701@gmail.com>
	<CAJTo0LY8M1k=XoHYYfTXo9uvCcBgqU6C7mttOvPdeqyR1_XbZw@mail.gmail.com>
	<5788F2C3.800@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 15 Jul 2016 10:32:33 -0700
Message-ID: <CANx9H-DEzwX8c5EVzWk8wZ5Z-DZpZQ1t9-1XijRPiMi9+7FZpQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [krogoth][PATCH 1/8] pkgconfig: Fix build with gcc-6
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
X-List-Received-Date: Fri, 15 Jul 2016 17:32:39 -0000
Content-Type: multipart/alternative; boundary=001a1142bf320257df0537b00175

--001a1142bf320257df0537b00175
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 15, 2016 at 7:27 AM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 07/15/2016 07:08 AM, Burton, Ross wrote:
> > On 15 July 2016 at 14:53, akuster808 <akuster808@gmail.com> wrote:
> >
> >> So this is the host gcc not the one in OE?
> >>
> >
> > Yes, the situation was host with gcc6 building krogoth.
>
> Thanks. After looking further down the queue I found the PATCH 0/8 and
> it explained.
>
> The original master commits are cryptic on which GCC 6 has the issue.
>
>
Sorry. I wasn't thinking about that when I did the cherry-picks. This was
all for gcc-6 on host only, but those commits have no indication of that.
And of course the cover-letter will not be in the git history.

I probably should have done rebase reword on them for clarity.

Cheers.

--Tim


> thanks,
> - Armin
> >
> > Ross
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1142bf320257df0537b00175
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jul 15, 2016 at 7:27 AM, akuster808 <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><br=
>
<br>
On 07/15/2016 07:08 AM, Burton, Ross wrote:<br>
&gt; On 15 July 2016 at 14:53, akuster808 &lt;<a href=3D"mailto:akuster808@=
gmail.com">akuster808@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; So this is the host gcc not the one in OE?<br>
&gt;&gt;<br>
&gt;<br>
&gt; Yes, the situation was host with gcc6 building krogoth.<br>
<br>
</span>Thanks. After looking further down the queue I found the PATCH 0/8 a=
nd<br>
it explained.<br>
<br>
The original master commits are cryptic on which GCC 6 has the issue.<br>
<br></blockquote><div><br></div><div>Sorry. I wasn&#39;t thinking about tha=
t when I did the cherry-picks. This was all for gcc-6 on host only, but tho=
se commits have no indication of that. And of course the cover-letter will =
not be in the git history.<br><br></div><div>I probably should have done re=
base reword on them for clarity.<br><br></div><div>Cheers.<br><br></div><di=
v>--Tim<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
thanks,<br>
- Armin<br>
&gt;<br>
&gt; Ross<br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt;<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div></div>

--001a1142bf320257df0537b00175--
