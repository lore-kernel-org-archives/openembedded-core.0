Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6A1CE73D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 17:25:39 +0000 (UTC)
Received: by qgad10 with SMTP id d10so125186279qga.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 10:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=tcYPfu+fGgpDs1HZHVDTM0LX/lV70PSMedWzRyjIBtQ=;
	b=yVdQI4YO6TMAf2qDk6UHBg6c56W+al48o6vrObFcRMjH2ys9VZ+A+4LwxZcPy5dTGa
	i225FR6mQq3NGZ7/dSyBATg3WM8rDSs1thCJudv5QlKTexZyOm0+Gaeh1jwJdFTKJj8l
	YZRro1zF26c7Umz0yveZmZlTW+AUOxaIR+8Mhgxk0FuRj/lxhFyl7jNlPfklLbF2WjmI
	GTjGAVZFCeCZ7pYudO608mIfVri78Pe4ddBnaXOJaKARoQ6P759ovfQlhaz6f/tjpQ0T
	rWvDKEJxgBKf4xX0wk8Lbvd0TghZ5sFPzaM3Q5UQ1aq5yWHJxH3NgnhAdBgrxOFlfWc1
	S/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tcYPfu+fGgpDs1HZHVDTM0LX/lV70PSMedWzRyjIBtQ=;
	b=MlZy0+Humbeppi1UeD0dhGxPnFByKqMdmB87B1sq6PLI0z/pIrdWM9WgXx6zGovNYe
	ibcP+qHN0+v425z1J3VfZPpwxCheMxdrffSJjJBoCmf6bjnSvbKu+A/HF5vlW/uuMwlx
	J28phrMmsj3iLgFsbLurhh22VTLiZlXJ8vz+oxv6dMs+OWfknnLjJC3E13TX7o5VnIbD
	q/C/lxDB27zPnp+p+hVd4psC+b2sX6rd78HQ60GJRqbP+PGG52uV3IvVl5mE0sNaUXHk
	aKB0UchKzD09GOsdGa38hpZHocivxg1Baneqo40eRsHn43TVs8JvnuDLBlnew1+Pv/hQ
	rc7Q==
X-Gm-Message-State: ALoCoQlyjFsSVXiu7ltOGn8k9CXYAcMSyr7Q5W1kmwUlDxmjLAOPhmwyprOxwb+y5QZNdteQcrY9
X-Received: by 10.140.109.74 with SMTP id k68mr45218514qgf.77.1445880340056;
	Mon, 26 Oct 2015 10:25:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Mon, 26 Oct 2015 10:25:20 -0700 (PDT)
In-Reply-To: <1443390491-23728-3-git-send-email-dv@pseudoterminal.org>
References: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
	<1443390491-23728-3-git-send-email-dv@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Oct 2015 17:25:20 +0000
Message-ID: <CAJTo0Laku8nPyJw0HZ1m+x5Rb8-x3N9sT5tr2cjUoz7=gWo0mA@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] gstreamer1.0-plugins-good: upgrade to version 1.6.0
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
X-List-Received-Date: Mon, 26 Oct 2015 17:25:40 -0000
Content-Type: multipart/alternative; boundary=001a1139af240ea7d705230540e8

--001a1139af240ea7d705230540e8
Content-Type: text/plain; charset=UTF-8

On 27 September 2015 at 22:48, Carlos Rafael Giani <dv@pseudoterminal.org>
wrote:

> -X11ENABLEOPTS = "--enable-x --enable-xshm"
> -X11DISABLEOPTS = "--disable-x --disable-xshm"
> +X11ENABLEOPTS = "--enable-x"
> +X11DISABLEOPTS = "--disable-x"
>  PACKAGECONFIG[x11]        =
> "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
>

As the options are not long anymore, can you change this to just
--enable-x, --disable-x, ${X11DEPENDS} for conciseness.

Ross

--001a1139af240ea7d705230540e8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 September 2015 at 22:48, Carlos Rafael Giani <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:dv@pseudoterminal.org" target=3D"_blank">dv@pseudoterminal.=
org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2rf=
" class=3D"a3s" style=3D"overflow:hidden">-X11ENABLEOPTS =3D &quot;--enable=
-x --enable-xshm&quot;<br>
-X11DISABLEOPTS =3D &quot;--disable-x --disable-xshm&quot;<br>
+X11ENABLEOPTS =3D &quot;--enable-x&quot;<br>
+X11DISABLEOPTS =3D &quot;--disable-x&quot;<br>
=C2=A0PACKAGECONFIG[x11]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;${X11ENABLEOP=
TS},${X11DISABLEOPTS},${X11DEPENDS}&quot;<br></div></blockquote></div><br>A=
s the options are not long anymore, can you change this to just --enable-x,=
 --disable-x, ${X11DEPENDS} for conciseness.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1139af240ea7d705230540e8--
