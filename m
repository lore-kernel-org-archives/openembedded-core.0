Return-Path: <srifenbark@gmail.com>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail.openembedded.org (Postfix) with ESMTP id C457879CD4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 22:06:42 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id w19-v6so11923796eds.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 15:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HDXNL5Lhwq187mgpu7T6l7EZcMIIn9bZG/ckSXIdxRE=;
	b=hRXF1maNDuRgABr2NizcFXzlsmUO+sAGBpaZPALs8jBvUqhj7xqdcXIs/4aNLcMz7z
	mxGLI90BvcfDfMzzsiGCj/DV33Xl4q3H/cp2uUxkaC+OH6V/bXdBsymEfBesn5XbdyCh
	8rdMXBn2KAlF0cUcec3lodlxNqN/kyRQeuOXF/ainMLrv6d1HUU9g6SSUWA6Q350BqIR
	//D45uGzjORQy6TtyIqlaME4LrAFP5BS9yJZB5U2W5Tu75NjTTcuThXIkptooYd4mGqP
	qD6yMIgM2CPRTvnMOQJNxUCT0DoCHZss0+pmzOeWK7t4npwz957CijfAwrddMR7FL5pr
	WCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HDXNL5Lhwq187mgpu7T6l7EZcMIIn9bZG/ckSXIdxRE=;
	b=slYUTHcuAkJn3eYYcowRdRGwAyakC0Fc37aoB/AYZEHeCd6GtQnjZXz8RSphuoUqSd
	761XvIfR5PrImfEViRuv2Iz5PqLCffEZWnfnD5dPKF3/arsrQUvLpP7vw/7SGyine1l7
	H6xCnIgC6bsPM3oijo+VDhjXVAF7FjSxgc6wWss2AlEvMfXj/2UAyVXU46HjNGrza+Ik
	jJ2FYQPpmxGJ3+ly63WTtQfow+KTJo0VXJmvFt+RiMC3s1bLWeaaeKRAxS24pIYTbyud
	NtzIHRSRQ5Ss7r63DR9+4w4eD5TK5es2ZnroaIE1FgLLD2R6o4XnBDfrvFOg26I48oMF
	YBEQ==
X-Gm-Message-State: AGRZ1gJNFtE/a7K753pism28KyzkMS/5ZzUcKlfj9vdM52DRtPcpPSpp
	0Y+5+lrFmBvTXyExj3cmRHspzS2SyO8LN6DGdnc=
X-Google-Smtp-Source: AJdET5dy2hjObqNBRHaq67fwt1YAkGVzU4YSyYYS1cW0r4VQEQi8UCDGCJgj8dY2tXsvuB41iXT89HpI/4XA7KQt+nQ=
X-Received: by 2002:a50:8f23:: with SMTP id 32-v6mr246852edy.158.1540937203337;
	Tue, 30 Oct 2018 15:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <2829165.0Ht5z2aexs@localhost.localdomain>
In-Reply-To: <2829165.0Ht5z2aexs@localhost.localdomain>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Tue, 30 Oct 2018 15:06:31 -0700
Message-ID: <CAFNP8OvFy2n7SMe5de66EcdM3URFm-b+dpcqS09hW0CMa9rNaA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: 2.6 migration guide
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
X-List-Received-Date: Tue, 30 Oct 2018 22:06:43 -0000
Content-Type: multipart/alternative; boundary="000000000000a04d7c0579796635"

--000000000000a04d7c0579796635
Content-Type: text/plain; charset="UTF-8"

Paul,

Thanks for sending.

Contributors....

I have an initial section at
https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#moving-to-the-yocto-project-2.6-release,
which is based on Richard's input.  I am sure there are more items.

Thanks,
Scott

On Tue, Oct 23, 2018 at 2:14 PM Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> Hi folks
>
> When Scott prepares the migration guide for a release, he usually looks to
> me
> to collate the notable changes for it (those requiring user intervention).
> I
> haven't prepared anything yet though and the 2.6 release is fast
> approaching.
> Can anyone who has been involved in or is aware of such changes in master
> for
> upcoming 2.6 (thud) make a note of it on the wiki in raw form on this page:
>
>   https://wiki.yoctoproject.org/wiki/FutureMigrationGuide
>
> Scott and I will take care of cleaning it up, so things added there don't
> need
> to be perfect.
>
> I will also be doing my usual trawl through the commits in the release for
> the
> more general changelog, so most things will get picked up that way, but
> it's
> really helpful if people with first-hand knowledge of the implications of
> some
> of these changes are involved in how they get documented.
>
> Thanks,
> Paul
>
> --
> Paul Eggleton
> Intel Open Source Technology Centre
>
>
>

--000000000000a04d7c0579796635
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Paul,<br></div><div><br></div><div>T=
hanks for sending.=C2=A0 <br></div><div><br></div><div>Contributors....</di=
v><div><br></div><div>I have an initial section at <a href=3D"https://yocto=
project.org/docs/2.6/ref-manual/ref-manual.html#moving-to-the-yocto-project=
-2.6-release">https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#=
moving-to-the-yocto-project-2.6-release</a>, which is based on Richard&#39;=
s input.=C2=A0 I am sure there are more items.</div><div><br></div><div>Tha=
nks, <br></div><div>Scott<br></div></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr">On Tue, Oct 23, 2018 at 2:14 PM Paul Eggleton &lt;<a hr=
ef=3D"mailto:paul.eggleton@linux.intel.com">paul.eggleton@linux.intel.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi folks<br>
<br>
When Scott prepares the migration guide for a release, he usually looks to =
me <br>
to collate the notable changes for it (those requiring user intervention). =
I <br>
haven&#39;t prepared anything yet though and the 2.6 release is fast approa=
ching. <br>
Can anyone who has been involved in or is aware of such changes in master f=
or <br>
upcoming 2.6 (thud) make a note of it on the wiki in raw form on this page:=
<br>
<br>
=C2=A0 <a href=3D"https://wiki.yoctoproject.org/wiki/FutureMigrationGuide" =
rel=3D"noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Fut=
ureMigrationGuide</a><br>
<br>
Scott and I will take care of cleaning it up, so things added there don&#39=
;t need <br>
to be perfect. <br>
<br>
I will also be doing my usual trawl through the commits in the release for =
the <br>
more general changelog, so most things will get picked up that way, but it&=
#39;s <br>
really helpful if people with first-hand knowledge of the implications of s=
ome <br>
of these changes are involved in how they get documented.<br>
<br>
Thanks,<br>
Paul<br>
<br>
-- <br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
<br>
<br>
</blockquote></div>

--000000000000a04d7c0579796635--
