Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8154A77E4D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 21:34:27 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id k134so7680493pga.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Dec 2017 13:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=s24QhYsvCm8k+rTBZCdGy9q+gg+KXk7WHi78UndMkpU=;
	b=isFA67SlPGa1QxI3LaB4DBU+BMK8CTq4yESv1FvcQwm7HMb1Ah/6ZJ2y0U1UldDPHr
	e3xtu0S9NE6RN8remh+sXNRjLepwFqDNXWlsiHUbz8bUxJjPOraJ1MVjkmDjdtFbKdhJ
	Soi9JjSEI8UmuNoQgkGPiLaEGJHFchLMtuGrfCmeJDOFvBL1HGWqhcSGG65HdBHqib0/
	ziahrc7aRT1nNU+egJVLdkeouiXQ8adAWp25RnwGbGzQyiJmMbWzLdyKUQdEVllrpJPV
	3Ulok47OyyTIvpwm3O2aH9mGZ5rI7NwX3+D8I5tNYEh/26ZKurKYOsa1aBKDY98bv2Xy
	bMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=s24QhYsvCm8k+rTBZCdGy9q+gg+KXk7WHi78UndMkpU=;
	b=dq6w8W3aYK6a8lhb2/Ag/CSGYMZLFZ3J/t/H/0mMhMDkF1vvglXHjjaJBGt9Um4k9+
	XHPzb1d9iKscIfF3ApcaoIKmJr/FD1YHC6pzJ5ekIhO92cQso7bvoONxebRdsSNtmQR9
	0CXuYEYidMxSH8Vh2WZpr8QwVHGMWm48VEJJ0QX3V6eSPKrHUoxpW3NH5QrBLSQN4Yog
	/yeXAlYVmVmU/5gzemD2r97l9rHrkT/saXknOsueTN+sWxJjF+g1M1x9/LLMTJtQIGOO
	pE2GtCpvCSMBLl0wY+NTTliJQH6ubAZlwZEBQn31ELqc80u1/WCLI5x5ItEeUhHiz+yu
	YYOw==
X-Gm-Message-State: AJaThX5vHUewOnP7g/htjm+lNvh2NzTsNkPETwTqEQn+R+6D18EFiRyV
	/bHnqvaoXtIqBgtWEEp/LZqmJfE35nlXi4RPlts=
X-Google-Smtp-Source: AGs4zMZIyHpSV0XKiWTmPTeotYra02mYrlFcQLPfXEyc+myIzOAGPnlBPhO3ft9y4i6Qp3QJCovLDyTQLwHllT+Wp34=
X-Received: by 10.84.213.144 with SMTP id g16mr31817616pli.339.1512768868426; 
	Fri, 08 Dec 2017 13:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20171207161555.uqbdyctwj7qljnto@mcrowe.com>
	<CAMKF1soDvWpqpUaZQcPoVA_0_NFXh_UB6vJ5QTb=ZKhtX+L3XQ@mail.gmail.com>
	<CAJ86T=VzQrqQPa4OB_SgyhYGg_ySp9UgBLeRuY1XLCXYgNbtjA@mail.gmail.com>
In-Reply-To: <CAJ86T=VzQrqQPa4OB_SgyhYGg_ySp9UgBLeRuY1XLCXYgNbtjA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 08 Dec 2017 21:34:17 +0000
Message-ID: <CAMKF1srhviBz5_Y9Gsn=Db2y9wCJ8HN96+FjBci+XA3m1R-Pwg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Mike Crowe <mac@mcrowe.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel.bbclass do_sizecheck behaviour changes
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
X-List-Received-Date: Fri, 08 Dec 2017 21:34:27 -0000
Content-Type: multipart/alternative; boundary="f403045d223807a8bc055fdaf3b8"

--f403045d223807a8bc055fdaf3b8
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 7, 2017 at 11:44 AM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, Dec 7, 2017 at 11:20 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Thu, Dec 7, 2017 at 8:15 AM, Mike Crowe <mac@mcrowe.com> wrote:
> >> I discovered today that our kernel size check has been ineffective
> since we
> >> took 7384d2831c713ac5999aca83c312154dc15cec56 from 2014 which changed
> the
> >> units for KERNEL_IMAGE_MAXSIZE from bytes to kilobytes.
> >>
> >> However whilst fixing that, I also noticed that
> >> 849b67b2e4820564b5e5c9bd4bb293c44351c5f3 in 2016 changed the
> consequences
> >> of exceeding the size from being fatal to merely a warning.
> >>
> >> This second change in behaviour wasn't described in the commit message,
> so
> >> I'm not sure whether it was intentional. I can believe that when
> generating
> >> multiple kernel image types it may not be essential that they all fit,
> but
> >> I don't really know what the use case for the feature is.
> >>
> >> I could fix this by adding to kernel.bbclass something like:
> >>
> >>  KERNEL_IMAGE_MAXSIZE_CONSEQUENCE ?= "warn"
> >>
> >> and then using it when delivering the bad news so that recipes can
> override
> >> it if they wish.
> >>
> >> Alternatively, I could treat the error as being fatal if none of the
> kernel
> >> images fit within the required size. This would degenerate to the old
> >> behaviour automatically if KERNEL_IMAGETYPES contains only one entry.
>
> That sounds like a good solution.
>
> >> Does one of these solutions appeal, or is there another even better
> >> solution?
> >
> > I think default should be a warning with a possibility to be turned
> > into an error
> > if user wishes too. I think if you are generating multiple kernel types
> then you
> > will use all of them somewhere, so I would say if the size of one of
> > them excedes
> > the set limit them break the build.
>
> The size limit for an uncompressed kernel vs a compressed kernel is
> going to be quite different, so defining one size limit and applying
> it to all images doesn't seem logical.


I was hoping that we are talking about deployed kernels here compressed
sizes can vary widely too

So may be we can have a hook to define which image types should be
monitored and what the limits are for individual type

>
>

--f403045d223807a8bc055fdaf3b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Thu, Dec 7, 2017 a=
t 11:44 AM Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">armccur=
dy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu,=
 Dec 7, 2017 at 11:20 AM, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; On Thu, Dec 7, 2017 at 8:15 AM, Mike Crowe &lt;<a href=3D"mailto:mac@m=
crowe.com" target=3D"_blank">mac@mcrowe.com</a>&gt; wrote:<br>
&gt;&gt; I discovered today that our kernel size check has been ineffective=
 since we<br>
&gt;&gt; took 7384d2831c713ac5999aca83c312154dc15cec56 from 2014 which chan=
ged the<br>
&gt;&gt; units for KERNEL_IMAGE_MAXSIZE from bytes to kilobytes.<br>
&gt;&gt;<br>
&gt;&gt; However whilst fixing that, I also noticed that<br>
&gt;&gt; 849b67b2e4820564b5e5c9bd4bb293c44351c5f3 in 2016 changed the conse=
quences<br>
&gt;&gt; of exceeding the size from being fatal to merely a warning.<br>
&gt;&gt;<br>
&gt;&gt; This second change in behaviour wasn&#39;t described in the commit=
 message, so<br>
&gt;&gt; I&#39;m not sure whether it was intentional. I can believe that wh=
en generating<br>
&gt;&gt; multiple kernel image types it may not be essential that they all =
fit, but<br>
&gt;&gt; I don&#39;t really know what the use case for the feature is.<br>
&gt;&gt;<br>
&gt;&gt; I could fix this by adding to kernel.bbclass something like:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 KERNEL_IMAGE_MAXSIZE_CONSEQUENCE ?=3D &quot;warn&quot;<br>
&gt;&gt;<br>
&gt;&gt; and then using it when delivering the bad news so that recipes can=
 override<br>
&gt;&gt; it if they wish.<br>
&gt;&gt;<br>
&gt;&gt; Alternatively, I could treat the error as being fatal if none of t=
he kernel<br>
&gt;&gt; images fit within the required size. This would degenerate to the =
old<br>
&gt;&gt; behaviour automatically if KERNEL_IMAGETYPES contains only one ent=
ry.<br>
<br>
That sounds like a good solution.<br>
<br>
&gt;&gt; Does one of these solutions appeal, or is there another even bette=
r<br>
&gt;&gt; solution?<br>
&gt;<br>
&gt; I think default should be a warning with a possibility to be turned<br=
>
&gt; into an error<br>
&gt; if user wishes too. I think if you are generating multiple kernel type=
s then you<br>
&gt; will use all of them somewhere, so I would say if the size of one of<b=
r>
&gt; them excedes<br>
&gt; the set limit them break the build.<br>
<br>
The size limit for an uncompressed kernel vs a compressed kernel is<br>
going to be quite different, so defining one size limit and applying<br>
it to all images doesn&#39;t seem logical.</blockquote><div dir=3D"auto"><b=
r></div><div dir=3D"auto">I was hoping that we are talking about deployed k=
ernels here compressed sizes can vary widely too</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">So may be we can have a hook to define which image=
 types should be monitored and what the limits are for individual type</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><br>
</blockquote></div></div>

--f403045d223807a8bc055fdaf3b8--
