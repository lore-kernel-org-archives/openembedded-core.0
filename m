Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7D6D571E47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 16:10:50 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x186so7304722vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 08:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MIIxlh8z7SNR0UTiOF0rdANr3/D91+Vi2iy+Fp5y6mU=;
	b=JVdzrCO64hRp0h+ifmg2aNvGO4HJn4boXqYM5jzQTa+OO9/Tcu7lMDeBdqktSK7PJl
	brl5J3CqmBHUZzp3/LZGKH8tQzJxPdLD+bSnX/XhK97qmo+Q+Of6M/bLUpkyKUKTdguD
	pcaXqjuWHhjE4zR/63o5Fl0p0c0EFKeDfoZLtENhkcUsx59rcyv+XYJv/q4MdU+xyLiB
	+9EZLK4mtjTcW9lPMWFn6qeKVr3Glsg5yESl7f/uKc27h5pDXPag8XRV3IlHsSUpN/3g
	Qbz7kwGuFlaRDe5/nWv6ZjdbUXm+WQtUXkjm+Wu90/x3IAFS3m5Vga9nnja39TaLxUwo
	J93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MIIxlh8z7SNR0UTiOF0rdANr3/D91+Vi2iy+Fp5y6mU=;
	b=aBeqHyPUnV1myj/Ubuc63EV70ssJKPEIFLbzH9fAMofgCNkZIP5Ufl7X3eI21FVn5Y
	a7BYfOe9qo83R40vg1Op3UitxKoMzeVlYTqBKnzj3PcMKlEANzXgkIu4LLX0DMqnwlMH
	iFqg+VJAHeng6W+L/a94+6lI8PRK4PhOAC6kqESzryZ8FOY6fyTFuINYUe/lKxcZjAtF
	5TYtXUs6jfogOQGk0shvZoQqDbFGYtHv8N1oOVVJ8zo9iSX9U0aV2Tvjd1gy3fee93j2
	EPiVtM4rZLWbiYFqfnZLMW59b25Z1VLQFweHA0LSR/5RlVyZO2HMDzjMFGw9EfM1Z1s5
	lPRA==
X-Gm-Message-State: AKaTC03joGzNteAxGwZpe0GLhIOW4RXDk5i7BK8sbxWhUh7e6unuyZiGb2+VGjaUeoBf9WsMauznTEkH8+H8dg==
X-Received: by 10.176.1.17 with SMTP id 17mr66760934uak.143.1481645451424;
	Tue, 13 Dec 2016 08:10:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Tue, 13 Dec 2016 08:10:50 -0800 (PST)
Received: by 10.159.48.87 with HTTP; Tue, 13 Dec 2016 08:10:50 -0800 (PST)
In-Reply-To: <CAMKF1spT3LkZmJLNVu7H61ZFeXo5o4mOqXi5v7ZWvML08ubAJw@mail.gmail.com>
References: <1481571408-19983-1-git-send-email-mark.asselstine@windriver.com>
	<3629007.TMJVuC0a6H@tal>
	<CAJTo0Lb0SgZH9LQyqwdXm858XTk6RQD0HTGBnZ1g-sXoy_HbjQ@mail.gmail.com>
	<2300280.p2E0ZC6noH@yow-masselst-d1>
	<CAMKF1srzRaY=a+g3ntXHaVfq3yndZYF67aKGAa2odNSf=kzHpg@mail.gmail.com>
	<CAMKF1spT3LkZmJLNVu7H61ZFeXo5o4mOqXi5v7ZWvML08ubAJw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Dec 2016 08:10:50 -0800
Message-ID: <CAMKF1sqe5SHxGQSeSw7QV6RPincGF5vHBs=WmnUw=miBn=gO2Q@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: disable 'libdir' QA check
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
X-List-Received-Date: Tue, 13 Dec 2016 16:10:59 -0000
Content-Type: multipart/alternative; boundary=001a113cfa70d0c43905438c7643

--001a113cfa70d0c43905438c7643
Content-Type: text/plain; charset=UTF-8

This library may be private however this does not mean it should be hidden
in a dedicated path. But I guess its better to lower qa guards then carry a
patch for life

On Dec 13, 2016 7:20 AM, "Mark Asselstine" <mark.asselstine@windriver.com>
wrote:

On Monday, December 12, 2016 9:17:14 PM EST Burton, Ross wrote:
> On 12 December 2016 at 20:51, Mark Asselstine <
mark.asselstine@windriver.com
> > wrote:
> >
> > I think the discussion I pointed to in the commit log closes the door on
> > any
> > such change. Specific the comment from Lennart --
> > https://github.com/systemd/systemd/issues/3810#issuecomment-235290526
> >
> > They don't want the library to be found in the default search path, they
> > want
> > to maintain this as a "hidden, internal resource".
>
> Oh if it's an implementation detail of systemd and not a user-facing
> library then I can see their argument I guess.
>
> Don't agree with it though.  But, the point is that as long as the parts
of
> systemd that could realistically be multilibd are in $libdir then this
> isn't a problem.

It is definitely an internal infra item for systemd and not seen as a
'public'
library so I think we are best to run with it. I am with you that I don't
necessarily agree with it. Khem, does this satisfy your concerns?

Mark

>
> Ross

--001a113cfa70d0c43905438c7643
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This library may be private however this does not mean it=
 should be hidden in a dedicated path. But I guess its better to lower qa g=
uards then carry a patch for life</div><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">On Dec 13, 2016 7:20 AM, &quot;Mark Asselstine&quot; =
&lt;<a href=3D"mailto:mark.asselstine@windriver.com">mark.asselstine@windri=
ver.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v class=3D"elided-text">On Monday, December 12, 2016 9:17:14 PM EST Burton,=
 Ross wrote:<br>
&gt; On 12 December 2016 at 20:51, Mark Asselstine &lt;<a href=3D"mailto:ma=
rk.asselstine@windriver.com">mark.asselstine@windriver.com</a><br>
&gt; &gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; I think the discussion I pointed to in the commit log closes the =
door on<br>
&gt; &gt; any<br>
&gt; &gt; such change. Specific the comment from Lennart --<br>
&gt; &gt; <a href=3D"https://github.com/systemd/systemd/issues/3810#issueco=
mment-235290526" rel=3D"noreferrer" target=3D"_blank">https://github.com/sy=
stemd/<wbr>systemd/issues/3810#<wbr>issuecomment-235290526</a><br>
&gt; &gt;<br>
&gt; &gt; They don&#39;t want the library to be found in the default search=
 path, they<br>
&gt; &gt; want<br>
&gt; &gt; to maintain this as a &quot;hidden, internal resource&quot;.<br>
&gt;<br>
&gt; Oh if it&#39;s an implementation detail of systemd and not a user-faci=
ng<br>
&gt; library then I can see their argument I guess.<br>
&gt;<br>
&gt; Don&#39;t agree with it though.=C2=A0 But, the point is that as long a=
s the parts of<br>
&gt; systemd that could realistically be multilibd are in $libdir then this=
<br>
&gt; isn&#39;t a problem.<br>
<br>
</div>It is definitely an internal infra item for systemd and not seen as a=
 &#39;public&#39;<br>
library so I think we are best to run with it. I am with you that I don&#39=
;t<br>
necessarily agree with it. Khem, does this satisfy your concerns?<br>
<br>
Mark<br>
<br>
&gt;<br>
&gt; Ross<br>
<br>
<br>
</blockquote></div><br></div>

--001a113cfa70d0c43905438c7643--
