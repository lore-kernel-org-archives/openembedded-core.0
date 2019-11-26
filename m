Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by mail.openembedded.org (Postfix) with ESMTP id E50DA7FCD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 18:27:26 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id m6so14016509ljc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 10:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3jjc0Adcfm4KrJaaKAjGw16mVp0cdxhjwbmPsf/FZy8=;
	b=vWH5drNxqou0xWgNKr0PBl7KnAKRKJjI/vvJQSAW/rF0bVOmRaGjk6HXXQC+eUc/zm
	4ysdjV544mN6ptyQrxwURcPeSxFe8v4AWEwtO/TZ2Q59sEBAlmtDcpZFq/mFhlJd4Fyw
	U8RmRABCANq3cTg9sPYuz0XjrErguUxtLSO7pUUtqYpRaLSTMG88nP3P6a+CCpmCAhEH
	jfT2CQIrrc0gSrB2sqQmj8Rf9KAGkAsVrP/3BqH5vjELZ45/FdZIFOfbpjl+82qZbEMy
	L2uJYtI4pGXyM0zQ1UiROZpdYuy9GX/WmRe0EVwXQbjU0YV92tHZ4YmnQk51Wk4T1vn/
	EmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3jjc0Adcfm4KrJaaKAjGw16mVp0cdxhjwbmPsf/FZy8=;
	b=YW3a3VobgHaP1/94CBWGt1dImgCGGsGUtcxwx8wX8XdBeUoDvm6n2mhlEdB/Z2vtS2
	fgW+HJAaO+NDJvNP1IskbAdXwz8WYDU2cq2N4NEm8TSuPhGBCLQfsx5lGGCxKVFr4rIN
	zuFaqdJW/lSIb1Hg5G3lxdMpZrhOfh17fu8HMiVwAGIkv6EnzYBuFW0a4PEkQma3jVWB
	19JdK7ojdJDwtrSz8DnDUbuwsl0Z/mcW07LsjzfPxXegaySKazQFFqnA7U7shOVw3UiD
	ChecDX6DKGag6HZfK8C/mfPvpsrDCBoEchzsJMOaIVpZKul6iEO4EFl6an7ZLopJf5Mb
	IpZw==
X-Gm-Message-State: APjAAAXe+18/DkI/BjAVEjkl5TC4gGu116hVgGPzG5IPiomtKCgE/LaX
	T7IrrFEXN3nqASK7MkHIE08FZF18a9U7gyXcLj8=
X-Google-Smtp-Source: APXvYqwUXuo5WK/ggmdAYh3FQNMbTA37uznmfuqJRKJw7ZpgzO3yDQnzSUibDSy948FbS7PYCecADWxqumbu698ytNc=
X-Received: by 2002:a2e:890e:: with SMTP id d14mr27015937lji.6.1574792847035; 
	Tue, 26 Nov 2019 10:27:27 -0800 (PST)
MIME-Version: 1.0
References: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
	<e92b8e21-99c6-c2c9-646a-b3a2e76d90aa@intel.com>
	<20191125211027.GA32080@localhost>
	<0c6015a022140c820803a3963ef33af984f19c8c.camel@gmail.com>
In-Reply-To: <0c6015a022140c820803a3963ef33af984f19c8c.camel@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 27 Nov 2019 07:27:12 +1300
Message-ID: <CADySD0Ht=A_-_5LbB00POn4Vjg_=n2ObTwZgExXwfiS6AZpidQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Adrian Bunk <bunk@stusta.de>
Subject: Re: Very large size of libraries in core-image-minimal rootfs
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
X-List-Received-Date: Tue, 26 Nov 2019 18:27:27 -0000
Content-Type: multipart/alternative; boundary="0000000000003e106c059844082e"

--0000000000003e106c059844082e
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

I have no experience with musl but keen to understand does musl
improves/impacts DRAM performance as compared to glibc?

regards
Ankur

On Wed, 27 Nov 2019, 7:17 a.m. Khem Raj, <raj.khem@gmail.com> wrote:

> On Mon, 2019-11-25 at 23:10 +0200, Adrian Bunk wrote:
> > On Mon, Nov 25, 2019 at 07:26:58PM +0000, Ross Burton wrote:
> > > On 25/11/2019 18:37, Ankur Tyagi wrote:
> > > > Hi,
> > > >
> > > > Based upon "thud" branch, I created core-image-minimal for
> > > > am335x-evm
> > > > board and resulting image size is very big(71M)
> > >
> > > If disk size is important then a good first step is to use musl
> > > instead of
> > > glibc:
> > >
> > > TCLIBC = "musl"
> > > ...
> >
> > musl is mainly useful for tiny systems, a 40 MB partition is such a
> > huge
> > amount of space that the size of the C library no longer matters
> > much.
> >
> > The size benefit of replacing glibc with musl is around 2 MB.
>
> I would refrain from labeling as useful for tiny systems. since
> static size is one thing, there is DRAM behaviour which is equally
> important, how malloc and other resource oriented algorithms behave is
> important as well.
>
> secondly, if I have 40MB partition, one might rather want to use extra
> space for implementing features in their product than spend it for
> enabling the system if they can.
>
> there are many other design considerations where musl might make more
> sense
>
> >
> > A partition with an -Os build of Yocto with glibc+systemd (sic)
> > is around 9 MB, together with bootloader and kernel this all
> > fits in a 16 MB flash. Use compression for kernel and root
> > filesystem and everything fits in a 8 MB flash.
> >
>
> -Os is not as well tested option as -O2 is. So we should always
> recommend it with grain of salt, speaking from experience there are
> bugs that will show up with Os which you wont see with O2 and leave a
> bad taste for user
>
> > > Ross
> >
> > cu
> > Adrian
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000003e106c059844082e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Khem,</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I have no experience with musl but keen to understand does musl i=
mproves/impacts DRAM performance as compared to glibc?=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">regards</div><div dir=3D"auto">Ankur<=
/div><div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 27 Nov 2019, 7:17 a.m. Khem Raj, &lt;=
<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">=
raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">O=
n Mon, 2019-11-25 at 23:10 +0200, Adrian Bunk wrote:<br>
&gt; On Mon, Nov 25, 2019 at 07:26:58PM +0000, Ross Burton wrote:<br>
&gt; &gt; On 25/11/2019 18:37, Ankur Tyagi wrote:<br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Based upon &quot;thud&quot; branch, I created core-image-min=
imal for<br>
&gt; &gt; &gt; am335x-evm<br>
&gt; &gt; &gt; board and resulting image size is very big(71M)<br>
&gt; &gt; <br>
&gt; &gt; If disk size is important then a good first step is to use musl<b=
r>
&gt; &gt; instead of<br>
&gt; &gt; glibc:<br>
&gt; &gt; <br>
&gt; &gt; TCLIBC =3D &quot;musl&quot;<br>
&gt; &gt; ...<br>
&gt; <br>
&gt; musl is mainly useful for tiny systems, a 40 MB partition is such a<br=
>
&gt; huge<br>
&gt; amount of space that the size of the C library no longer matters<br>
&gt; much.<br>
&gt; <br>
&gt; The size benefit of replacing glibc with musl is around 2 MB.<br>
<br>
I would refrain from labeling as useful for tiny systems. since<br>
static size is one thing, there is DRAM behaviour which is equally<br>
important, how malloc and other resource oriented algorithms behave is<br>
important as well.<br>
<br>
secondly, if I have 40MB partition, one might rather want to use extra<br>
space for implementing features in their product than spend it for<br>
enabling the system if they can.<br>
<br>
there are many other design considerations where musl might make more<br>
sense<br>
<br>
&gt; <br>
&gt; A partition with an -Os build of Yocto with glibc+systemd (sic)<br>
&gt; is around 9 MB, together with bootloader and kernel this all<br>
&gt; fits in a 16 MB flash. Use compression for kernel and root<br>
&gt; filesystem and everything fits in a 8 MB flash.<br>
&gt; <br>
<br>
-Os is not as well tested option as -O2 is. So we should always<br>
recommend it with grain of salt, speaking from experience there are<br>
bugs that will show up with Os which you wont see with O2 and leave a<br>
bad taste for user<br>
<br>
&gt; &gt; Ross<br>
&gt; <br>
&gt; cu<br>
&gt; Adrian<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" rel=3D"noreferr=
er noreferrer" target=3D"_blank">Openembedded-core@lists.openembedded.org</=
a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">http://lists.o=
penembedded.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--0000000000003e106c059844082e--
