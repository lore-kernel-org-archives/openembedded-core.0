Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id BFC0C60053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 17:03:38 +0000 (UTC)
Received: by igcpb10 with SMTP id pb10so83247945igc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 10:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hM61QevUHKpKKOOggyZk3JlQ7lrt6b99tGGsHhOocKQ=;
	b=S3dt9wSMb1Ybp85JJE1nmyZVeFs6AnvZAWhIq9bENiEnkWSc9tazXSznIuF1Wh4OV0
	4Wg5TdWlbBVkgSPbnUtPaPcEgegCdi9RC3bnuZIgl/TWYyu0Mniw03/DmKTWEczI6XTz
	I5D4QjQ5NbnAm5ax58tN8vXw44RSuhdg7wFJ2Vw3e/P4kG+/yZaX5cAxI6Q9oEKPI9Nz
	glIBrnC+at97tXKqlBvfZRBY1WqKUizHvkRFVQjlLGpPwrAq3fhtPtgl+CgqnSYzRiun
	iM6CGA+BY0IcB7/2rQ8x7/QdnQSHzd1qG34OdqnBMG1SeoInfc/xqqngDLXyGMVAb/0e
	YGEw==
MIME-Version: 1.0
X-Received: by 10.50.136.231 with SMTP id qd7mr12427160igb.11.1442855018519;
	Mon, 21 Sep 2015 10:03:38 -0700 (PDT)
Received: by 10.107.142.130 with HTTP; Mon, 21 Sep 2015 10:03:38 -0700 (PDT)
Received: by 10.107.142.130 with HTTP; Mon, 21 Sep 2015 10:03:38 -0700 (PDT)
In-Reply-To: <56001431.6030001@gmail.com>
References: <56001431.6030001@gmail.com>
Date: Mon, 21 Sep 2015 10:03:38 -0700
Message-ID: <CAMKF1sqomLPSg3Fn9jJfwJFGnfquM81hpjELX_VuWQw-t7jfww@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: yocto@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: packageconfig for non-autotooled project
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
X-List-Received-Date: Mon, 21 Sep 2015 17:03:39 -0000
Content-Type: multipart/alternative; boundary=089e0122aa5ad78a29052044dcce

--089e0122aa5ad78a29052044dcce
Content-Type: text/plain; charset=UTF-8

Look at the patches I have posted for raspberry pi layer
On Sep 21, 2015 7:29 AM, "Trevor Woerner" <twoerner@gmail.com> wrote:

> Hello,
>
> libepoxy needs its EGL support to have a packageconfig (*.pc) file but
> the EGL I want to use in my project
> (meta-sunxi/recipes-graphics/libgles/sunxi-mali_git.bb, which points to
> gitsm://github.com/linux-sunxi/sunxi-mali.git) isn't autotooled. There
> are a couple ways around this problem, but if there is an example of
> generating a .pc file for a non-autotooled project already, I'd be
> grateful if someone could point me to it :-)
>
> Best regards,
>     Trevor
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e0122aa5ad78a29052044dcce
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Look at the patches I have posted for raspberry pi layer</p>
<div class=3D"gmail_quote">On Sep 21, 2015 7:29 AM, &quot;Trevor Woerner&qu=
ot; &lt;<a href=3D"mailto:twoerner@gmail.com">twoerner@gmail.com</a>&gt; wr=
ote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello,<br>
<br>
libepoxy needs its EGL support to have a packageconfig (*.pc) file but<br>
the EGL I want to use in my project<br>
(meta-sunxi/recipes-graphics/libgles/<a href=3D"http://sunxi-mali_git.bb" r=
el=3D"noreferrer" target=3D"_blank">sunxi-mali_git.bb</a>, which points to<=
br>
gitsm://<a href=3D"http://github.com/linux-sunxi/sunxi-mali.git" rel=3D"nor=
eferrer" target=3D"_blank">github.com/linux-sunxi/sunxi-mali.git</a>) isn&#=
39;t autotooled. There<br>
are a couple ways around this problem, but if there is an example of<br>
generating a .pc file for a non-autotooled project already, I&#39;d be<br>
grateful if someone could point me to it :-)<br>
<br>
Best regards,<br>
=C2=A0 =C2=A0 Trevor<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--089e0122aa5ad78a29052044dcce--
