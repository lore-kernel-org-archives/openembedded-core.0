Return-Path: <mans.zigher@gmail.com>
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
	[209.85.167.170])
	by mail.openembedded.org (Postfix) with ESMTP id CBBE6796E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 11:59:31 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id p125-v6so3860038oic.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 04:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=NfF3/tBr6gieLaeYzxSEMDk2BU/+Ha3+pdTXHI+TvTk=;
	b=E8NN6/bN5Ln7CMAZg1XQAMP1uXS6I0QfaSAPCOeVRhB+q2jAyQQ5QrRYsTdxair+rb
	Ts6EGxrz+7sqfxkebtYkx9zaRFzknKfNQCse0AIrf411pDrZfHsXeaUDwf3P9UZXU7uw
	q8DMmbP1CSvzRgjbKYS9Q5JzDVSOsFUikjisaHpPIGYZTp0wbDyD/jyy8loo2JA3KOhD
	caj4Gnyw1hl0qiKRRnL5nHBLLSMhaI1YXru8xj04SQAXPM/9AybZqbGBpwNF4hMR9ZGR
	YvgZIG6tLlMrWmyiEf4Ih/yeXz0y29Qo5HSjjFrzkESIwTDxOzI4DMFyxlTA/jxUNo1B
	r8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=NfF3/tBr6gieLaeYzxSEMDk2BU/+Ha3+pdTXHI+TvTk=;
	b=HCf0hNZs7VBY29PZvu3UvS8AfN/MrF8yV5qh93In6xeshg9YQyka7RwE6J67c/f58L
	a+CN3NQucVT9xTbRZPuDBN3KRzhXGALPy9793bO7MQ1Yt4cHYs1a5dCp+0QAwD4B07Yb
	JXaSV7ptxAVZk+S+tqaWw8tqWMAjCI4Y8URfwCKsWMeVsRgT3f0qDRC07T9mGVgYEFEh
	/7FGFj3pO02pIMsxcfuA3N8wc3ifYEEzeT1Az1JQD/+77H39cxJ/6pSWBHvoSu99EV9B
	ccy/uWIEKe3bwgQLnIeoThZ1dbp00Ket9qMsfVHlpQJQ5nDkmTEjylrOSGLGhr5UbEzJ
	rrkA==
X-Gm-Message-State: ABuFfoicYqSN4lk8uBH+Dh86dQkGzgbXxguGsnviw4Rxvzq81FDudHGK
	TQIhzDdLHU3SWEGI2UOCUgA2bE/E1dZmNp9cQTbEmYPvqMci1g==
X-Google-Smtp-Source: ACcGV62Gk3V8WKEgJFIX4cl5IAyNgPWesSuIGPeTVN6MbiftV+AWUD0+qn5bVKDFDNoIKUBxRFLDAa7PogqM8mE5W+E=
X-Received: by 2002:aca:ce8b:: with SMTP id
	e133-v6mr1520348oig.247.1539172772556; 
	Wed, 10 Oct 2018 04:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAEhQi8kDQKOzouhjxshi6=jkHfitZkAYDWTVBQ26cgEojPn35Q@mail.gmail.com>
In-Reply-To: <CAEhQi8kDQKOzouhjxshi6=jkHfitZkAYDWTVBQ26cgEojPn35Q@mail.gmail.com>
From: =?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Date: Wed, 10 Oct 2018 13:59:21 +0200
Message-ID: <CAEhQi8=vRf9K5SE0fF8WcAvk1X3unKm8b7T-ZK-a9KzQhOYAOQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [bitbake] How to fetch private github release
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
X-List-Received-Date: Wed, 10 Oct 2018 11:59:32 -0000
Content-Type: multipart/alternative; boundary="0000000000005b336d0577de9660"

--0000000000005b336d0577de9660
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi again,

I have a workaround that I think is good enough but I would still like to
get any pointers regarding it and if it would be possible for fetch to
actually support downloading from private repo.

do_my_fetch() {
    fetch --repo=3D${MY_REPO} \
        --github-oauth-token=3D${GITHUB_TOKEN} \
        --tag=3D${VERSION} \
        --release-asset=3Dasset.tar.gz ${WORKDIR} || {
        bbfatal "Failed to download asset"
    }
}
addtask my_fetch after do_fetch before do_unpack
do_my_fetch[depends] +=3D "${PN}:do_prepare_recipe_sysroot"

In the recipe I have made sure to add fetch to DEPENDS so that the fetch
will be part of the sysroot. So the reason for do_fetch not working was
that it was not depending on do_prepare_recipe_sysroot and do_install was.

BR
M=C3=A5ns Zigher

Den ons 10 okt. 2018 kl 13:18 skrev M=C3=A5ns Zigher <mans.zigher@gmail.com=
>:

> Hi,
>
> I need to fetch a github release tar file. I think I have seen that it
> should be supported by default by setting the
>
> SRC_URI =3D "
> https://github.com/DynamicDevices/bbexample/releases/download/v1.0/bbexam=
ple-${PV}.tar.gz
> "
>
> The problem that I am facing is that the repo is private so I need to be
> able to specify a github token. Is this supported?
>
> I have also tried specify my own do_fetch to my recipe and from there
> making use of https://github.com/gruntwork-io/fetch but do_fetch cannot
> the binary. I have verified fetch binary is part of the package sysroot a=
nd
> I can call the fetch tool from do_install but that feels like a bad hack.
> Do you guys have any advice?
>
> BR
> M=C3=A5ns Zigher
>
>

--0000000000005b336d0577de9660
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi again,<div><br></div><div>I have a wor=
karound that I think is good enough but I would still like to get any point=
ers regarding it and if it would be possible for fetch to actually support =
downloading from private repo.</div><div><br></div><div><div>do_my_fetch() =
{</div><div>=C2=A0 =C2=A0 fetch --repo=3D${MY_REPO} \</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 --github-oauth-token=3D${GITHUB_TOKEN} \</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 --tag=3D${VERSION} \</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --release-asset=3Dasset.tar.gz ${WORKDIR} || {</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 bbfatal &quot;Failed to download asset&quot;</div><div>=
=C2=A0 =C2=A0 }</div><div>}</div><div>addtask my_fetch after do_fetch befor=
e do_unpack</div><div>do_my_fetch[depends] +=3D &quot;${PN}:do_prepare_reci=
pe_sysroot&quot;</div></div><div><br></div><div>In the recipe I have made s=
ure to add fetch to DEPENDS so that the fetch will be part of the sysroot. =
So the reason for do_fetch not working was that it was not depending on do_=
prepare_recipe_sysroot and do_install was.</div><div><br></div><div>BR</div=
><div>M=C3=A5ns Zigher</div></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr">Den ons 10 okt. 2018 kl 13:18 skrev M=C3=A5ns Zigher &lt;<a hr=
ef=3D"mailto:mans.zigher@gmail.com">mans.zigher@gmail.com</a>&gt;:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><=
br></div><div>I need to fetch a github release tar file. I think I have see=
n that it should be supported by default by setting the=C2=A0</div><div><sp=
an style=3D"background-color:rgb(249,249,249);color:rgb(0,0,0);font-family:=
monospace,Courier;font-size:12.7px"><br></span></div><div><span style=3D"ba=
ckground-color:rgb(249,249,249);color:rgb(0,0,0);font-family:monospace,Cour=
ier;font-size:12.7px">SRC_URI =3D &quot;</span><a rel=3D"nofollow" class=3D=
"m_9100698632605001920external m_9100698632605001920gmail-free" href=3D"htt=
ps://github.com/DynamicDevices/bbexample/releases/download/v1.0/bbexample-$=
%7BPV%7D.tar.gz" style=3D"font-family:monospace,Courier;font-size:12.7px;te=
xt-decoration-line:none;color:rgb(51,102,187);background:url(&quot;&quot;) =
100% 50% no-repeat;padding-right:16px" target=3D"_blank">https://github.com=
/DynamicDevices/bbexample/releases/download/v1.0/bbexample-${PV}.tar.gz</a>=
<span style=3D"background-color:rgb(249,249,249);color:rgb(0,0,0);font-fami=
ly:monospace,Courier;font-size:12.7px">&quot;</span></div><div><br></div><d=
iv>The problem that I am facing is that the repo is private so I need to be=
 able to specify a github token. Is this supported?</div><div><br></div><di=
v>I have also tried specify my own do_fetch to my recipe and from there mak=
ing use of=C2=A0<a href=3D"https://github.com/gruntwork-io/fetch" target=3D=
"_blank">https://github.com/gruntwork-io/fetch</a> but do_fetch cannot the =
binary. I have verified fetch binary is part of the package sysroot and I c=
an call the fetch tool from do_install but that feels like a bad hack. Do y=
ou guys have any advice?</div><div><br></div><div>BR</div><div>M=C3=A5ns Zi=
gher</div><div><div><br></div></div></div></div>
</blockquote></div>

--0000000000005b336d0577de9660--
