Return-Path: <vladimir.molokov@gmail.com>
Received: from mail-yw1-f50.google.com (mail-yw1-f50.google.com
	[209.85.161.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6BD7F845
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:07:27 +0000 (UTC)
Received: by mail-yw1-f50.google.com with SMTP id i190so14576454ywc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 08:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DCV0OMijiG6ZCaHaYf0BhJCKH9mU7MlIo/NB9I7hcaQ=;
	b=OXgw6TkJazbUCtuwi2RVwV0QtrqFLi7g65KSgtE6lANqeWdQJmWtWyS/K5rLTzYfdF
	sqdycU8MSCs4J8bRBuanq0c55lMQ/kIds3l8t1LU+nUKVm4x925ivrThFWtkc39rsVIy
	kZHuk4AH5D1OLvAQneVv2Y0M3B6SJlZ8hq7loqtQyFXXTaqzYOeaPw8JbfdjA4SkX1o3
	Vh7ngcXjzqxEApX6GKyFyBMMS1Byl/liztt2V5QXrOzlxtV8x3w5fo3X7M9IM7RWuZ06
	pbqgWIWMnkcStZte0Foi7eVirsT4uobNd0zFhdwFZ8W8w9C+KhwDFFmbk7tM8u0IAXUu
	bT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DCV0OMijiG6ZCaHaYf0BhJCKH9mU7MlIo/NB9I7hcaQ=;
	b=g5bH3sAVKVrjInDJTDGOXTZMPrSyeUrc8Xgg4GtRQRIidjDgA91JHLXLJ+yFGUsxph
	Ldz04FttwpQYFWYhG7qgkaVkyFxSVJ1FLwWIjK3H5Vx4WiVw7A7l3Up7CE9Bej2HOpHf
	ob3Ld0eupM44QemlWawMqp2EGoHVoJ0yhU8UZqBnng7SODGyutet7gkllI0ctZKcvKbc
	OuOmw0mIzVss37WfoIGoQ21FWF74/GbOIVUldFhQ7zXCdKAZEszi6VcC0eiTaXIrwf5U
	RSVtlCjmZUwTD9gfFll/siMP3u/TZMXb9+t/BfLTcDqt9ff8GM9+EsG/eyEnLGDLRlpI
	ftbw==
X-Gm-Message-State: APjAAAWVEjV8Vf+qlFuHuwzZ+DHH0x+1/Rsgbc+D0O5guTxp9n//Ahg9
	cPzv7/abo4jCRWJ5LZkvu80JBwSgYquFpxicN+dfyA==
X-Google-Smtp-Source: APXvYqxhrCfyIsxYPHOPo09eq59WFfmaJlRCALn03jH0d1bBuSFupI9FtpXt1qLskZqxXcHSyoQ1VHC6WZn+5S3rw6Q=
X-Received: by 2002:a0d:eb8e:: with SMTP id u136mr2672653ywe.17.1579277248199; 
	Fri, 17 Jan 2020 08:07:28 -0800 (PST)
MIME-Version: 1.0
References: <CAE2LOAym2eC+yJ9pFmGUGDaC9LjjO=RKr_TA_ON+m6GvRtW3YA@mail.gmail.com>
	<f17d90f6-e302-2ef5-b768-04e36d64b9cc@intel.com>
In-Reply-To: <f17d90f6-e302-2ef5-b768-04e36d64b9cc@intel.com>
From: Vladimir Molokov <vladimir.molokov@gmail.com>
Date: Fri, 17 Jan 2020 17:07:16 +0100
Message-ID: <CAE2LOAyYuAMsE0OZUbjDex5eRHTCKrnw1ww7mOpt1_=YeO-08A@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: attr dependency on linux-yocto
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
X-List-Received-Date: Fri, 17 Jan 2020 16:07:27 -0000
Content-Type: multipart/alternative; boundary="0000000000006180dd059c58235e"

--0000000000006180dd059c58235e
Content-Type: text/plain; charset="UTF-8"

whoa, thanks for the information
though I think it is not great,
when applications, like vim, get linux dependecies.

did anyone try to fix this?
could it be considered as a bug?
i can try to file the bug and fix it


On Fri, 17 Jan 2020, 15:23 Ross Burton, <ross.burton@intel.com> wrote:

> On 16/01/2020 23:22, Vladimir Molokov wrote:
> > Hi,
> >
> > Question about attr. I'm not familiar with it.
> >
> > On a clean poky is it normal(not a bug?) to have deps such as
> >
> > "attr.do_build" -> "linux-libc-headers.do_package_write_rpm"
> > "attr.do_build" -> "linux-yocto.do_deploy"
> > "attr.do_build" -> "linux-yocto.do_package_write_rpm"
> >
> > How they are appear? I didn't find anything in attr which could be the
> cause.
> > It's just a clean poky from a repo, after . oe-init-build-env and
> > bitbake -g attr.
> > Appreciate any hints.
>
> It's a long and convoluted dependency chain that only happens if you
> have ptest enabled.  I can't recall the exact details but at some point
> attr-ptest RDEPENDS on util-linux and util-linux-ptest recommends
> kernel-module-scsi-debug.
>
> As bitbake wants to ensure dependencies are satisfiable, building attr
> will ensure a kernel is built.
>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000006180dd059c58235e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div style=3D"font-family:sans-serif" dir=3D"auto">w=
hoa,=C2=A0<font face=3D"sans-serif">thanks for the information</font></div>=
<div dir=3D"auto" style=3D"font-family:sans-serif"><font face=3D"sans-serif=
">though I think it is not great,</font></div><div dir=3D"auto" style=3D"fo=
nt-family:sans-serif"><font face=3D"sans-serif">when applications, like vim=
, get linux dependecies.</font></div><div dir=3D"auto" style=3D"font-family=
:sans-serif"><font face=3D"sans-serif"><br></font></div><div dir=3D"auto" s=
tyle=3D"font-family:sans-serif"><font face=3D"sans-serif">did anyone try to=
 fix this?</font></div><div dir=3D"auto" style=3D"font-family:sans-serif"><=
font face=3D"sans-serif">could it be considered as a bug?</font></div><div =
dir=3D"auto" style=3D"font-family:sans-serif"><font face=3D"sans-serif">i c=
an try to file the bug and fix it</font></div><br><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 17 Jan 2020, 15:23 Ross=
 Burton, &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 16/01/2020 23:22=
, Vladimir Molokov wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Question about attr. I&#39;m not familiar with it.<br>
&gt; <br>
&gt; On a clean poky is it normal(not a bug?) to have deps such as<br>
&gt; <br>
&gt; &quot;attr.do_build&quot; -&gt; &quot;linux-libc-headers.do_package_wr=
ite_rpm&quot;<br>
&gt; &quot;attr.do_build&quot; -&gt; &quot;linux-yocto.do_deploy&quot;<br>
&gt; &quot;attr.do_build&quot; -&gt; &quot;linux-yocto.do_package_write_rpm=
&quot;<br>
&gt; <br>
&gt; How they are appear? I didn&#39;t find anything in attr which could be=
 the cause.<br>
&gt; It&#39;s just a clean poky from a repo, after . oe-init-build-env and<=
br>
&gt; bitbake -g attr.<br>
&gt; Appreciate any hints.<br>
<br>
It&#39;s a long and convoluted dependency chain that only happens if you <b=
r>
have ptest enabled.=C2=A0 I can&#39;t recall the exact details but at some =
point <br>
attr-ptest RDEPENDS on util-linux and util-linux-ptest recommends <br>
kernel-module-scsi-debug.<br>
<br>
As bitbake wants to ensure dependencies are satisfiable, building attr <br>
will ensure a kernel is built.<br>
<br>
Ross<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--0000000000006180dd059c58235e--
