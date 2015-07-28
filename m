Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id E776576312
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 14:18:40 +0000 (UTC)
Received: by qgeu79 with SMTP id u79so75859988qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 07:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6w8XB1IooibCZia0D/2nlLvJJi+raRjx1GJUVqOmhdE=;
	b=S8E0iLtJyo0nMBnHYmbUJAh35wTzRCfnMH56OR4yrSVOrPFqi6Pi4YyvsHhGrZKikY
	ZrQSHHifyKavbSHNGfUrOn8X5cbjeAidOubJdl7hBI1w9kA7Qwazaqn1n5XaQkrBLCqm
	1oPjr0WwHUAzhtd72dPTGzXbk3KLdUUUPK+X6nVA2ctnYEO93gvISe4lbAzfpDxJqZgN
	qIyYiiO3qKzaoySn5cThMWnJ1dHbi5psk0f1OGYAL9PDE3kcjixyeKxGcDq5/Gxni3xT
	5LjpPGf8RCzfp5UR8eC3SEfM2ftQXOoxmpjywnwc4E66dPfMiW442Npq+Xo+IWQoFLo6
	r8ZQ==
X-Gm-Message-State: ALoCoQlbR+6OOdFsiQI7ITleJ1xXrPJ7NGsPjGXGtk8yro6OA5d6NRMjNlgfm1S8B2YZk2+3ALZo
X-Received: by 10.140.234.147 with SMTP id f141mr1428301qhc.22.1438093120860; 
	Tue, 28 Jul 2015 07:18:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Tue, 28 Jul 2015 07:18:21 -0700 (PDT)
In-Reply-To: <20150728141603.GC2465@jama>
References: <cover.1438074266.git.liezhi.yang@windriver.com>
	<d2fde8961c75893e53e9cacdbadcfedf69bcca3b.1438074266.git.liezhi.yang@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB44B6C087@irsmsx105.ger.corp.intel.com>
	<20150728141603.GC2465@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Jul 2015 15:18:21 +0100
Message-ID: <CAJTo0Lb4sWe3RfL25jj8ia2JXpBZ8X_-CWPX5CKOo=DSo7J0kg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] qemu_git.bb: remove it
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
X-List-Received-Date: Tue, 28 Jul 2015 14:18:42 -0000
Content-Type: multipart/alternative; boundary=001a11c0f5fa9f8bce051bf02534

--001a11c0f5fa9f8bce051bf02534
Content-Type: text/plain; charset=UTF-8

On 28 July 2015 at 15:16, Martin Jansa <martin.jansa@gmail.com> wrote:

> Close to being up to date? Aren't you talking about
> ./meta/recipes-devtools/qemu/qemu_2.4.0-rc2.bb?
>
> bitbake@jama:/OE/webos/ow/oe-core$ find . -name qemu\*bb -exec grep
> PV.*= {} \;
> REALPV = "2.4.0-rc2"
> PV = "2.3.99+${REALPV}"
> PV = "1.3.0+git${SRCPV}"
>
> As Robert said, 1.3 version is old and current qemu_git recipe broken,
> because 04024dea2674861fcf13582a77b58130c67fccd8 isn't in master branch
> anymore after it was moved to stable-1.3 branch:
>

For local testing it's not exactly rocket science to set SRC_URI and S in a
bbappend.  _git recipes are fine *if they're actively used* but when they
sit around and bitrot, what's the point?

Ross

--001a11c0f5fa9f8bce051bf02534
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 July 2015 at 15:16, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":36q" class=3D=
"a3s" style=3D"overflow:hidden">Close to being up to date? Aren&#39;t you t=
alking about<br>
./meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.4.0-rc2.bb" rel=3D"no=
referrer" target=3D"_blank">qemu_2.4.0-rc2.bb</a>?<br>
<br>
bitbake@jama:/OE/webos/ow/oe-core$ find . -name qemu\*bb -exec grep<br>
PV.*=3D {} \;<br>
REALPV =3D &quot;2.4.0-rc2&quot;<br>
PV =3D &quot;2.3.99+${REALPV}&quot;<br>
PV =3D &quot;1.3.0+git${SRCPV}&quot;<br>
<br>
As Robert said, 1.3 version is old and current qemu_git recipe broken,<br>
because 04024dea2674861fcf13582a77b58130c67fccd8 isn&#39;t in master branch=
<br>
anymore after it was moved to stable-1.3 branch:</div></blockquote></div><b=
r>For local testing it&#39;s not exactly rocket science to set SRC_URI and =
S in a bbappend. =C2=A0_git recipes are fine *if they&#39;re actively used*=
 but when they sit around and bitrot, what&#39;s the point?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c0f5fa9f8bce051bf02534--
