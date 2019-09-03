Return-Path: <wesley.lindauer@gmail.com>
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
	[209.85.221.173])
	by mail.openembedded.org (Postfix) with ESMTP id ADCA87F2AF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 18:59:55 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id b204so3814241vka.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 11:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VkLCdz2G8Ja1TFLbytEuZf+f+u0dM6cpop4UN++vswc=;
	b=TAXVHT2rPsBUifcx+AJOazZqHm1wMOky7+OPY2i2p0S8+HwnweTJaR3Jq/ZrSE9KQf
	OayCrwweFXWOEEhG+d2dGx7lfBLMrzXVJVbd6tYegblN9XhKS+q5Sjy59yTU5o8aU0M1
	MHEKEKpYI1ogTnIdAXsEcuAVfegvT6qeUiiCC5SMbaGEnbQcq2ntQCycmypFdSRDR1b9
	fbH59mxAYjmtvxJcZKD+8Hnp/XN3nLu/YDngM2rwmsE+jmXyKTIQAMi3xn86wV8DD5Wq
	ZpLGKabaa1uB1UfERL6NOEZyeT6bFokjVnjJsMSZDzU/F6YNFRpedH71kNOjJMsPH1k0
	Xe9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VkLCdz2G8Ja1TFLbytEuZf+f+u0dM6cpop4UN++vswc=;
	b=bgaszQN/uPHrg6YPtahNrzZV8WrdyuKqj0LiMC+4mT73jxjXjGnonsov9Qw8S0GgBa
	DpThioc68UakMxpc6MpTqApdI2gejfaj833hAElSIB/NdTqyv73apKLqCnra5sr45RMY
	YPkZQiBlLNXFagr7oblRV2v2ba42FzuDUtqFCuCQvpAC5XZs5z+xG1U3Fmr+S8cS8LKh
	i6Y03s/RSY55c+Mz4e9t11Hkl9qSrBoL9FO0iKaSXZrs+r/msckcl9H81bgh678OlYAs
	SyqVr+kcabsQKJKVZ9WBzaBEasVJQGBjGhfu916PAKQr+cAtgp1/koZk7pJq47yyCwFv
	3XDw==
X-Gm-Message-State: APjAAAU0KbAMO6NRpT4HGPMZyBUUyj2gCYBC6/vKs50ak9NgCjXXZmCW
	x9SC3JfnljBy6so402Jk+jG5jbGKYuh2H3hxVFc=
X-Google-Smtp-Source: APXvYqzl+5NPRS+UtQr63S7KkOhJh4yHT18geAn8VjWSZVir2CPmJgDD16ZqOx+NSrppZ3QXmqjlCm2ofq2eNlUtdFA=
X-Received: by 2002:a1f:970f:: with SMTP id z15mr13845806vkd.54.1567537196546; 
	Tue, 03 Sep 2019 11:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190816194405.12751-1-wesley.lindauer@gmail.com>
	<20190816194405.12751-6-wesley.lindauer@gmail.com>
	<CAMKF1sruqPBcwobNNErkdHKAnP7zT8zda81O2FUP88u=5ZnmVg@mail.gmail.com>
	<20190827180449.GA29638@localhost>
	<5fc12556-a817-e312-e1ed-60878a97d78c@windriver.com>
In-Reply-To: <5fc12556-a817-e312-e1ed-60878a97d78c@windriver.com>
From: Wes Lindauer <wesley.lindauer@gmail.com>
Date: Tue, 3 Sep 2019 14:59:45 -0400
Message-ID: <CALBQxSsXuM+926J=A=2R=X7xPSz4htuFk3pKrJ3Zpj1uK0AXDw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 6/6] xz: Remove GPLv3 license checksum
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
X-List-Received-Date: Tue, 03 Sep 2019 18:59:56 -0000
Content-Type: multipart/alternative; boundary="000000000000c5bdde0591aab1ce"

--000000000000c5bdde0591aab1ce
Content-Type: text/plain; charset="UTF-8"

Mark,

In reference to "It typically does NOT include the license of things used
to build the software (such as makefiles, autoconf fragments, etc)".
Since the only file that is licensed under GPLv3 is a M4 macro, does that
mean the current patch is still valid? Shouldn't the GPLv3 license be
removed from this recipe?

Wes L

On Tue, Aug 27, 2019 at 2:28 PM Mark Hatle <mark.hatle@windriver.com> wrote:

> On 8/27/19 1:04 PM, Adrian Bunk wrote:
> > On Fri, Aug 16, 2019 at 01:50:14PM -0700, Khem Raj wrote:
> >> On Fri, Aug 16, 2019 at 12:46 PM Wes Lindauer <
> wesley.lindauer@gmail.com> wrote:
> >>>
> >>> Although xz has some files that are GPLv3 licensed, none of them get
> >>> packaged up, and therefore none of it ends up in the final rootfs.
> Since
> >>> there is no GPLv3 code in the final image, we don't want to include it
> >>> when we collect licenses, as that would give the incorrect impression
> >>> that the image contains GPLv3 code.
> >>
> >> We will be distributing this in src packages though. Maybe these files
> >> should be deleted before the build even starts.
> >
> > OE does licence tracking on binary packages, not on source packages.
>
> It tracks -both-.  Since MOST recipes and binary packages agree, people
> don't
> often know this.
>
> LICENSE is the -recipe source license-.  Nothing more nothing less.  It
> typically does NOT include the license of things used to build the software
> (such as makefiles, autoconf fragments, etc), but must include the license
> of
> any sources that are or may be used to construct binaries.
>
> LICENSE_<package> is automatically defined as LICENSE.  If a binary
> package has
> a difference license (which must ALWAYS be a subset of the recipe
> LICENSE), then
> it can be specified independently.
>
> See sysfsutils as an example:
>
> LICENSE = "GPLv2 & LGPLv2.1"
> LICENSE_${PN} = "GPLv2"
> LICENSE_libsysfs = "LGPLv2.1"
>
> recipe is made of of source code consisting of GPLv2 and LGPLv2.1.
>
> The LICENSE_${PN} is expected to be GPLv2, while the LICENSE_libsysfs is
> expected to be LGPLv2.1.
>
>
> The LIC_FILES_CHKSUM is supposed to represent the -recipe- source
> license.  If
> the component is used to build the binaries, then it needs to be listed
> (but
> only has to be listed once).
>
> If the component MIGHT be used, it needs to be listed.
>
> If the component will NOT be used, then it should not be listed (and it's
> advised to remove it from the source to avoid accidental usage...)
>
> --Mark
>
>
> > There are recipes that build binary packages with different licences
> > from the same sources.
> >
> > cu
> > Adrian
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c5bdde0591aab1ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Mark,</div><div><br></div><div>In reference to &quot;=
It
typically does NOT include the license of things used to build the software=
 (such as makefiles, autoconf fragments, etc)&quot;. <br></div><div>Since t=
he only file that is licensed under GPLv3 is a M4 macro, does that mean the=
 current patch is still valid? Shouldn&#39;t the GPLv3 license be removed f=
rom this recipe?</div><div><br></div><div>Wes L<br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 27, 20=
19 at 2:28 PM Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com">ma=
rk.hatle@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On 8/27/19 1:04 PM, Adrian Bunk wrote:<br>
&gt; On Fri, Aug 16, 2019 at 01:50:14PM -0700, Khem Raj wrote:<br>
&gt;&gt; On Fri, Aug 16, 2019 at 12:46 PM Wes Lindauer &lt;<a href=3D"mailt=
o:wesley.lindauer@gmail.com" target=3D"_blank">wesley.lindauer@gmail.com</a=
>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Although xz has some files that are GPLv3 licensed, none of th=
em get<br>
&gt;&gt;&gt; packaged up, and therefore none of it ends up in the final roo=
tfs. Since<br>
&gt;&gt;&gt; there is no GPLv3 code in the final image, we don&#39;t want t=
o include it<br>
&gt;&gt;&gt; when we collect licenses, as that would give the incorrect imp=
ression<br>
&gt;&gt;&gt; that the image contains GPLv3 code.<br>
&gt;&gt;<br>
&gt;&gt; We will be distributing this in src packages though. Maybe these f=
iles<br>
&gt;&gt; should be deleted before the build even starts.<br>
&gt; <br>
&gt; OE does licence tracking on binary packages, not on source packages.<b=
r>
<br>
It tracks -both-.=C2=A0 Since MOST recipes and binary packages agree, peopl=
e don&#39;t<br>
often know this.<br>
<br>
LICENSE is the -recipe source license-.=C2=A0 Nothing more nothing less.=C2=
=A0 It<br>
typically does NOT include the license of things used to build the software=
<br>
(such as makefiles, autoconf fragments, etc), but must include the license =
of<br>
any sources that are or may be used to construct binaries.<br>
<br>
LICENSE_&lt;package&gt; is automatically defined as LICENSE.=C2=A0 If a bin=
ary package has<br>
a difference license (which must ALWAYS be a subset of the recipe LICENSE),=
 then<br>
it can be specified independently.<br>
<br>
See sysfsutils as an example:<br>
<br>
LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
LICENSE_${PN} =3D &quot;GPLv2&quot;<br>
LICENSE_libsysfs =3D &quot;LGPLv2.1&quot;<br>
<br>
recipe is made of of source code consisting of GPLv2 and LGPLv2.1.<br>
<br>
The LICENSE_${PN} is expected to be GPLv2, while the LICENSE_libsysfs is<br=
>
expected to be LGPLv2.1.<br>
<br>
<br>
The LIC_FILES_CHKSUM is supposed to represent the -recipe- source license.=
=C2=A0 If<br>
the component is used to build the binaries, then it needs to be listed (bu=
t<br>
only has to be listed once).<br>
<br>
If the component MIGHT be used, it needs to be listed.<br>
<br>
If the component will NOT be used, then it should not be listed (and it&#39=
;s<br>
advised to remove it from the source to avoid accidental usage...)<br>
<br>
--Mark<br>
<br>
<br>
&gt; There are recipes that build binary packages with different licences <=
br>
&gt; from the same sources.<br>
&gt; <br>
&gt; cu<br>
&gt; Adrian<br>
&gt; <br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000c5bdde0591aab1ce--
