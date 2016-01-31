Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id BCF1875A31
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 23:07:28 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id z14so22985452igp.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 15:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=F5oIkwnf5LUUmNTiH+yTWJBCy9bH4I7xa3tJAbXulCE=;
	b=WtZeswu6Kzq6uYMBXHu7D/CEFnSASs8TAwkUAHiPXsz5bM0ZRJCO/36frDHnjVDlw6
	EcHGQI5qaQFlCCfGkm4U9FTlPy0Y+ihTi2HLUC8sXdirCKP/+vz+MmyJKGIqV0GOCU7t
	wytEL9c6N9m1Y1s4HLfG+WmQ32WHcipmBmgaH80WWV4bjuLoDJ1VdkvprQ1ne3mG8/iU
	qm61fSBN+FPQHFXK8jU1Ho+PHbxQfJI5pvvncMlOCFS+Avd7z+kUi8nFNGAL/rPhr5Vo
	A99FMtOnwwznmrdqxVjFMOe1CHeopN5KIHvpZtYskXf6lUvNT3EhFZi3vnKSFeuXmBAT
	JjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=F5oIkwnf5LUUmNTiH+yTWJBCy9bH4I7xa3tJAbXulCE=;
	b=KaBxuuzF9r1yXh0xqFoKrcq9bBNCUqk5VfMXevY/ILyyteEGWV9ujQhGEcpb5OaQH+
	q9ckXa64fUUvZmJa/vdU3if+DqGFafyANzF6eNsMEJk35UVQ1016eo75VTtKw+zovx+Y
	0JkrpEn1g1oQCZjZ61UzuR3q3wXcAJ+jxum6DlnvPp1n83ljzbzdtoOoBoDjDoiQiOKN
	I6mB0DYYYfirfuEcWKx9Blv7gC3m4h3N+YlJ92st1Lp7UwWbRyXQM3xn/2t42Ye7rWFK
	d4+UyHuu1IJNP88cusc2C9Gnqyqz/e9IHyzkBrBXO7rD+2koMpI9Fk1g7HD6C4X7cpkr
	27ig==
X-Gm-Message-State: AG10YOSbDAYTCyGrjBTmk8tF6jLWlgPgr0eT2V9ZFwWGyd0md7Pm4wBjp9aRJioGcsbFGAM14YV7n8Vr9Ah8AwLm
X-Received: by 10.50.27.37 with SMTP id q5mr4892942igg.64.1454281649352; Sun,
	31 Jan 2016 15:07:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Sun, 31 Jan 2016 15:07:09 -0800 (PST)
In-Reply-To: <1454270163-5294-1-git-send-email-paul.gortmaker@windriver.com>
References: <1454270163-5294-1-git-send-email-paul.gortmaker@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 31 Jan 2016 23:07:09 +0000
Message-ID: <CAJTo0LYaTG4Mo+wJZWHMPwkwT339c7TZakjhhXaFzirMjvmAow@mail.gmail.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xterm: revert FILES_PN change from recent package uprev
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
X-List-Received-Date: Sun, 31 Jan 2016 23:07:30 -0000
Content-Type: multipart/alternative; boundary=047d7b10c8371d39fb052aa95528

--047d7b10c8371d39fb052aa95528
Content-Type: text/plain; charset=UTF-8

On 31 January 2016 at 19:56, Paul Gortmaker <paul.gortmaker@windriver.com>
wrote:

> -FILES_${PN} += "${libdir}/X11"
> +FILES_${PN} += "/usr/lib/X11"
>

Is xterm hard-coding /usr/lib/X11?  Should that be $prefix/lib/X11?  What
is the xserver itself looking in?  Is that actually using $libdir/X11 so
the xterm makefile is broken and should be patched?

Ross

--047d7b10c8371d39fb052aa95528
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 January 2016 at 19:56, Paul Gortmaker <span dir=3D"ltr">&lt;<a href=
=3D"mailto:paul.gortmaker@windriver.com" target=3D"_blank">paul.gortmaker@w=
indriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":4c1" class=3D"a3s" style=3D"overflow:hidden">-FILES_${PN} +=3D &quot;=
${libdir}/X11&quot;<br>
+FILES_${PN} +=3D &quot;/usr/lib/X11&quot;</div></blockquote><div><br></div=
><div>Is xterm hard-coding /usr/lib/X11?=C2=A0 Should that be $prefix/lib/X=
11?=C2=A0 What is the xserver itself looking in?=C2=A0 Is that actually usi=
ng $libdir/X11 so the xterm makefile is broken and should be patched?</div>=
<div><br></div><div>Ross</div></div></div></div>

--047d7b10c8371d39fb052aa95528--
