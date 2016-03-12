Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2827E731E6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 21:54:44 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id av4so37069890igc.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 13:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lquz8tu64QSItlyTbo9gyL/RENadbEBZgWTjO/pqwxo=;
	b=Jtppnd8qAv/5C5lDsP5Cnuc22xhaQJS61x4QpWNDV9aFCGQlhffx7MCsqTqRvm51mP
	GoR1kI4ZbZCPuFNDRHUOPRBZ5e6M81eYiThmxIFuWZjh9jFQbQt7N8jMOHFx6+Afz3iw
	NucL8QBMzhmuQxysGQtnQpa/+f3ipi3GuzpcqxoFauXxWma8eLGVrZXXV8/oo/oVlFQ0
	bBDs3D2O/THOodxnEpmtKIL9gAQJo6Z1TZk6TT1VbXAMwFOgGkZklOs73n7Ojw4PF8s3
	VxS+5kT/SXT+bXRksWhFOykFuG+yrV57po6BacK920QzaMYk6JyoFNzNPfqqGfiwT6ue
	jM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lquz8tu64QSItlyTbo9gyL/RENadbEBZgWTjO/pqwxo=;
	b=XgQi53S5mt+kETMF/RBR+bHojfS3l+cd0AqTPVSPWwzXaShdhb1pmLPHVBGvr28NKm
	/mVdmWJD+B1nq0uWVyrY3+DLtduyyuGr/esXHJmzBRzTNAXLlTtOycimA0L3zX8G6Hhc
	wgE7I85ZfET2BtNgqqoSw9TAE6rOxD5KOi1l4AwkogCvVEJeFG3DXhMSDkA/AwEqnBPr
	X4eD98YF01q39TZgqQiz2VkbGPZ0EnM94vhKjOrBK7KGa49YCJGS7v9W0j9f501d074q
	bITs7874Mq3+hCb9bBwQ/pAj8hH1yIWZ8J/rd9f2pxHbiVPWreh2mXYXIpUQfadEE9b+
	ZQdw==
X-Gm-Message-State: AD7BkJLO7d3VLtt+RjS0ttFfkF2NDUcrevtXzztFDMJszFIvsGCoiAK4cFN3zMA+afrD4D4M7g1//D9RHnzhw0Kj
X-Received: by 10.50.43.226 with SMTP id z2mr11082292igl.78.1457819685384;
	Sat, 12 Mar 2016 13:54:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Sat, 12 Mar 2016 13:54:26 -0800 (PST)
In-Reply-To: <56E39AD3.4000503@gmail.com>
References: <1457750954-32065-1-git-send-email-twoerner@gmail.com>
	<CAMKF1sqBf1Hg8w8G3Xes9TAjVoQcAE=DuHvsfJxNcVArZ=+Gmw@mail.gmail.com>
	<56E39AD3.4000503@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 12 Mar 2016 21:54:26 +0000
Message-ID: <CAJTo0Lb23TkQYmVBUpTmOpCgtB-odj9MDZzSrAn4ZzyQKaw6gQ@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildhistory.bbclass: metadata-revs show repo parent
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
X-List-Received-Date: Sat, 12 Mar 2016 21:54:46 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f47e9014052de118de

--047d7bfea0f47e9014052de118de
Content-Type: text/plain; charset=UTF-8

On 12 March 2016 at 04:28, Trevor Woerner <twoerner@gmail.com> wrote:

>     openembedded-core/meta =
> master:00d3fd571a8d261d065b43f5cf3076a381843984
>     meta-openembedded/meta-oe =
> master:a1e135a499998add7575682bf53db5e02e753580
>     meta-openembedded/meta-gnome =
> master:a1e135a499998add7575682bf53db5e02e753580
>     meta-rpb          = master:203903ca6f4e8df09bef6ea3c6e899d07eca8df9
>     meta-96boards     = master:2be59f0d381b5ec173d7fc24f3ae14aaf47b8649
>     meta-qcom         = master:32fcda819acb8ec485d9ab05108d554f807bf75d
>     meta-browser      = master:a3789a4168fcd42f1cdf5b5febe2c779a9467919
>     meta-linaro/meta-linaro-toolchain =
> master:367f784b831938dc508b7d472342d2d0d6ed9769
>     meta-poky/meta    = master:37b61b059031e3c272a929b834e12fd83f46598c
>     meta-poky/meta-poky = master:37b61b059031e3c272a929b834e12fd83f46598c
>

Why are you pulling oe-core/meta and poky/meta into the same build
considering they're literally the same layer?  You should either drop
oe-core/meta or poky/meta from your bblayers.

However the output showing the full remote URLs seems a sensible
improvement to me.

Ross

--047d7bfea0f47e9014052de118de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 March 2016 at 04:28, Trevor Woerner <span dir=3D"ltr">&lt;<a href=3D"=
mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1qo" class=3D"a3s"=
 style=3D"overflow:hidden">=C2=A0 =C2=A0 openembedded-core/meta =3D master:=
00d3fd571a8d261d065b43f5cf3076a381843984<br>
=C2=A0 =C2=A0 meta-openembedded/meta-oe =3D master:a1e135a499998add7575682b=
f53db5e02e753580<br>
=C2=A0 =C2=A0 meta-openembedded/meta-gnome =3D master:a1e135a499998add75756=
82bf53db5e02e753580<br>
=C2=A0 =C2=A0 meta-rpb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D master:203903c=
a6f4e8df09bef6ea3c6e899d07eca8df9<br>
=C2=A0 =C2=A0 meta-96boards=C2=A0 =C2=A0 =C2=A0=3D master:2be59f0d381b5ec17=
3d7fc24f3ae14aaf47b8649<br>
=C2=A0 =C2=A0 meta-qcom=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D master:32fcda8=
19acb8ec485d9ab05108d554f807bf75d<br>
=C2=A0 =C2=A0 meta-browser=C2=A0 =C2=A0 =C2=A0 =3D master:a3789a4168fcd42f1=
cdf5b5febe2c779a9467919<br>
=C2=A0 =C2=A0 meta-linaro/meta-linaro-toolchain =3D master:367f784b831938dc=
508b7d472342d2d0d6ed9769<br>
=C2=A0 =C2=A0 meta-poky/meta=C2=A0 =C2=A0 =3D master:37b61b059031e3c272a929=
b834e12fd83f46598c<br>
=C2=A0 =C2=A0 meta-poky/meta-poky =3D master:37b61b059031e3c272a929b834e12f=
d83f46598c</div></blockquote></div><br>Why are you pulling oe-core/meta and=
 poky/meta into the same build considering they&#39;re literally the same l=
ayer?=C2=A0 You should either drop oe-core/meta or poky/meta from your bbla=
yers.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
However the output showing the full remote URLs seems a sensible improvemen=
t to me.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--047d7bfea0f47e9014052de118de--
