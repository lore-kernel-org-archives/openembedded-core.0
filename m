Return-Path: <jefro.net@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 269F974E09;
	Tue,  8 May 2018 21:20:46 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id g21-v6so33679751wrb.8;
	Tue, 08 May 2018 14:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=bxsb+KYJhxdJSwcwnHzXFbCa0S/Aq8K6GaUYTY/htAk=;
	b=eyY0LYcdGbIuVe/QUjschQQF/70JZJ1+hgJR9UpCZKwNuoxJOz8vz2fPhYNYbxyijT
	HTMJaac3fQokxnmd+i8DC4bkzXGmhR2DeoxayPSjHdtU9N+OWsXD30B8ss/6R7GJzIKo
	5bOV8bU177Ixrjnb0j4oiOAmKsZZMhaP5L92euZwK8QcqRvgdK8PatE8cstYQSuXaYkv
	AJod0nOT/cBR5oa3nUQGFQ44XUwnSIddweJ+u9SsajDdqbv6rY8k9msrJxneYtqileL0
	vztCBCPXVFCfrOzPP9iGjbu0K6AdIHfl1k2iFVFGp89PAuraLC4hJ/1BQmcqkJu+6KIT
	jAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=bxsb+KYJhxdJSwcwnHzXFbCa0S/Aq8K6GaUYTY/htAk=;
	b=lsUoNzvvJUQOkHVycNhlThAGesnKM+1zpnjWR+nHo+of5PRp8epfknlJcX0DSzooDY
	GWM43vSdyMulq1tcX60wWEt2hnE/T/oDaPc0nCQIhf8yQf02WZ0Po7ze9QLg7MgKQnW/
	EDhhCv4wiYy34tYdnktF1G3bDaQyGNSSXIdKdUtaEAfyisyLpDfktpefa9Y4+KTX1YAR
	m1tAtfsl+Tph9fG8v9BIBbtM90cILKeD3TAB4w4xrwarswBrqEJrcIlFsVLPH1x0+LWw
	LklGzzG0ZjKsNv5if/uTEDgaZUcVVgfW+Ua2cxsnxsdXjHkdaws6w08arsPkC8dyCFjx
	2w5g==
X-Gm-Message-State: ALQs6tBvQX6OhJ8Re0bu42MvB7AL27YyBviDCFxNHieAaOMwxaP1Tr1B
	puEi+fez08kZQRzXd4+czNLkynykwf/3mNiQEh8=
X-Google-Smtp-Source: AB8JxZrn1VASdadnUe07DJk0RbcIVFym8ZCu+g0rFAUW4U1eW3eYwXodoJ4C6THg4ys4EJi2PiTVjLFuTT4lC7ZQVtQ=
X-Received: by 2002:adf:99b5:: with SMTP id
	y50-v6mr31934124wrb.168.1525814447432; 
	Tue, 08 May 2018 14:20:47 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.223.229.139 with HTTP; Tue, 8 May 2018 14:20:26 -0700 (PDT)
In-Reply-To: <CAGAf8LwBWH7DQPRyTDgzuuJYCYZxHvjrzva3a03DzksYd66shQ@mail.gmail.com>
References: <CA+YB3rba5-xUdzRg2jE8oaY6+ZLhu3ROV0O6_=w7Dc+qPVSqpQ@mail.gmail.com>
	<CAGAf8LwBWH7DQPRyTDgzuuJYCYZxHvjrzva3a03DzksYd66shQ@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Tue, 8 May 2018 14:20:26 -0700
X-Google-Sender-Auth: Im-ClSAm30PO-V0SiB7fBQJp5JU
Message-ID: <CA+YB3raaF45piohqCHwuxPXBsVYp54g3invvbUcPr29TUMdiuQ@mail.gmail.com>
To: Zoran Stojsavljevic <zoran.stojsavljevic@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembedded-members@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Yocto Project changes in progress
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
X-List-Received-Date: Tue, 08 May 2018 21:20:47 -0000
Content-Type: multipart/alternative; boundary="00000000000021eba3056bb85c0e"

--00000000000021eba3056bb85c0e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Many projects function this way. It is one of the strengths of the open
source process.

I'd be happy to answer any questions.


On Mon, May 7, 2018 at 9:53 PM, Zoran Stojsavljevic <
zoran.stojsavljevic@gmail.com> wrote:

> Very interesting, indeed! Newer knew that Richard (Purdie) is/was
> INTEL employee!?
>
> This announcement gives several (conspiracy?) theories... Some
> official, some unofficial. ;-)
>
> As independent thinker... IMHO.
>
> Time Will Tell!
>
> Zoran Stojsavljevic
> _______
>
> On Mon, May 7, 2018 at 11:53 PM, Jeff Osier-Mixon <jefro@jefro.net> wrote=
:
> > Hello everyone. I'd like to briefly address rumors around Richard
> Purdie's
> > transition from Intel to a more neutral position, and Intel's reduction
> in
> > resources for the project.
> >
> > We set up the Yocto Project in 2010 through Linux Foundation, with over
> 20
> > member organizations, so it would function as a true open source projec=
t
> -
> > neutral, unbiased, and well distributed. Those things are what make ope=
n
> > source projects less vulnerable to any one person or company. This is
> > actually a very exciting transitional time for the project, and all
> existing
> > member organizations are fully behind the project. We will let people
> know
> > details as they are available.
> >
> > Meanwhile, the 2.5 "Sumo" release is on the way and should be released
> soon,
> > the 2.6 planning process has started in earnest (please participate!),
> and
> > we are excited to see what the future has in store for the project.
> >
> > --
> > Jeffrey =E2=80=9CJefro=E2=80=9D Osier-Mixon, Intel Corporation
> > Open Source Community Ecosystem Strategist
> >
> >
> > --
> > _______________________________________________
> > yocto mailing list
> > yocto@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/yocto
> >
>



--=20
Jeffrey =E2=80=9CJefro=E2=80=9D Osier-Mixon, Intel Corporation
Open Source Community Ecosystem Strategist

--00000000000021eba3056bb85c0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Many projects function this way. It is one of the str=
engths of the open source process.<br></div><div><div><br></div><div>I&#39;=
d be happy to answer any questions.</div><div><br></div></div></div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, May 7, 2018 at 9=
:53 PM, Zoran Stojsavljevic <span dir=3D"ltr">&lt;<a href=3D"mailto:zoran.s=
tojsavljevic@gmail.com" target=3D"_blank">zoran.stojsavljevic@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Very interesting, inde=
ed! Newer knew that Richard (Purdie) is/was<br>
INTEL employee!?<br>
<br>
This announcement gives several (conspiracy?) theories... Some<br>
official, some unofficial. ;-)<br>
<br>
As independent thinker... IMHO.<br>
<br>
Time Will Tell!<br>
<br>
Zoran Stojsavljevic<br>
_______<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Mon, May 7, 2018 at 11:53 PM, Jeff Osier-Mixon &lt;<a href=3D"mailto:jef=
ro@jefro.net">jefro@jefro.net</a>&gt; wrote:<br>
&gt; Hello everyone. I&#39;d like to briefly address rumors around Richard =
Purdie&#39;s<br>
&gt; transition from Intel to a more neutral position, and Intel&#39;s redu=
ction in<br>
&gt; resources for the project.<br>
&gt;<br>
&gt; We set up the Yocto Project in 2010 through Linux Foundation, with ove=
r 20<br>
&gt; member organizations, so it would function as a true open source proje=
ct -<br>
&gt; neutral, unbiased, and well distributed. Those things are what make op=
en<br>
&gt; source projects less vulnerable to any one person or company. This is<=
br>
&gt; actually a very exciting transitional time for the project, and all ex=
isting<br>
&gt; member organizations are fully behind the project. We will let people =
know<br>
&gt; details as they are available.<br>
&gt;<br>
&gt; Meanwhile, the 2.5 &quot;Sumo&quot; release is on the way and should b=
e released soon,<br>
&gt; the 2.6 planning process has started in earnest (please participate!),=
 and<br>
&gt; we are excited to see what the future has in store for the project.<br=
>
&gt;<br>
&gt; --<br>
&gt; Jeffrey =E2=80=9CJefro=E2=80=9D Osier-Mixon, Intel Corporation<br>
&gt; Open Source Community Ecosystem Strategist<br>
&gt;<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; yocto mailing list<br>
&gt; <a href=3D"mailto:yocto@yoctoproject.org">yocto@yoctoproject.org</a><b=
r>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/yocto" rel=3D"noref=
errer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listinfo/yocto=
</a><br>
&gt;<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><div>Jeffrey =E2=80=9CJefr=
o=E2=80=9D Osier-Mixon, Intel Corporation</div><div>Open Source Community E=
cosystem Strategist</div><div><br></div></div></div></div></div></div>
</div>

--00000000000021eba3056bb85c0e--
