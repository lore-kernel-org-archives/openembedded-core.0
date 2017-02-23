Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 26C72773B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 23:05:00 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id u188so5618731qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 15:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ih5ZgLnpUY5P2egsFcBvvUNYp07FbSyJb+gkb7ZZGrc=;
	b=WCVl1WYSz1atgehRsGgqKz8oNhPH7FxrmtK4rnxXBrPPS1N1//UmrFoKQKPHX0M7xs
	8gcOSG+r0jh6POZl3srsmKa/QT/6b+EP2Q5cwUjUBB8GPHGdUcm9kBaTljPG/hYH0HEL
	JpIC6tc8QHOtcnXGh3giIPTwAgWRgt94QQmDJGREXqgRi4zm8S2WcRTh/PDIr6xpdyNL
	PoGq2NEduey965Bex2HWO+yfE8DUPzvtSgRneDDjIVy7JWUPkRYEvGrjpHtwhIHUhk1b
	fRXc4FY01i1JHWrTJKD8iE6byN1rEGpWBaPPzmpStuvs1UeBtSRGzTwksSTYmVyNv1jD
	i3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ih5ZgLnpUY5P2egsFcBvvUNYp07FbSyJb+gkb7ZZGrc=;
	b=OQoGXMdxAwgiAiedM9h2jHJC3UT7+tJgBEhOfO6iZ2uIOClcaXh768hUsIxMOCfklv
	IxqQbNph8sVrXvoy/3VaFi+bcc+1kuhc8MOEm8WJaEw+RccCdJEuhzvZmOHDDPco1505
	V1yBuLR/XpfaNwnVyaJ1OykdquCTTUqYXQafOibFGzGNDn+srQvCPsP7RQXuOL+Y/9vt
	V/8CsQQeaQPaUI0Pf5Kq6lDGy6a4Qb6jPKJ+285opP2SNdjnqm0m+mlrN3OBeGKsETim
	H5/8FbrKq3al4HZ0X9tQ9cIiOXfh+6l1o0p3P+5y++OhlNXbLbxlJ9YJLIiNxtdaAaJI
	5JyA==
X-Gm-Message-State: AMke39kALwcDjNbHA5crm+6+ztdHVmTejU5o8EX5tL8V0xYXxsTSamFMGJpiONKs4I2uxddNLJON0ux/U+iIUdll
X-Received: by 10.55.40.27 with SMTP id o27mr37089583qkh.221.1487891101983;
	Thu, 23 Feb 2017 15:05:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 23 Feb 2017 15:04:41 -0800 (PST)
In-Reply-To: <CAMKF1squEy9GvqMPCGBtNg06frrW1csujShZMX2fq06rrruX+Q@mail.gmail.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
	<82576a21b491938531cbbba58160459b91ec6960.1487774787.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LYeRPDGFjL2113ciF7sN9F2o1iap8e5Z_m8b4LPpL3GbQ@mail.gmail.com>
	<CAMKF1squEy9GvqMPCGBtNg06frrW1csujShZMX2fq06rrruX+Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Feb 2017 23:04:41 +0000
Message-ID: <CAJTo0LZdyMYg6cc2LffwTuvFvSDZ74_FWi+X5qTox-0g5MzbsQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/24] libiconv: remove recipe
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
X-List-Received-Date: Thu, 23 Feb 2017 23:05:01 -0000
Content-Type: multipart/alternative; boundary=001a11441144994e6705493aa4bc

--001a11441144994e6705493aa4bc
Content-Type: text/plain; charset=UTF-8

On 23 February 2017 at 22:47, Khem Raj <raj.khem@gmail.com> wrote:

> > ERROR: Nothing PROVIDES 'virtual/nativesdk-libiconv' (but
> > virtual:nativesdk:/home/pokybuild/yocto-autobuilder/
> yocto-worker/nightly-qa-extras/build/meta/recipes-core/gettext/
> gettext_0.19.8.1.bb
> > DEPENDS on or otherwise requires it)
>
> It seems that nativesdk-glibc is not providing it. We
> should fix that
>

Oh, this was with  SDKMACHINE = "i686-mingw32" which likely makes a
difference but it's too late for me to make an informed opinion. :)

Ross

--001a11441144994e6705493aa4bc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 February 2017 at 22:47, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><span class=3D"gmail-">&gt; ERROR: Nothing PROV=
IDES &#39;virtual/nativesdk-libiconv&#39; (but<br>
&gt; virtual:nativesdk:/home/<wbr>pokybuild/yocto-autobuilder/<wbr>yocto-wo=
rker/nightly-qa-<wbr>extras/build/meta/recipes-<wbr>core/gettext/<a href=3D=
"http://gettext_0.19.8.1.bb" rel=3D"noreferrer" target=3D"_blank">gettext_0=
.19.8.1.<wbr>bb</a><br>
&gt; DEPENDS on or otherwise requires it)<br>
<br>
</span>It seems that nativesdk-glibc is not providing it. We<br>
should fix that<br></blockquote></div><div class=3D"gmail_extra"><br></div>=
Oh, this was with =C2=A0SDKMACHINE =3D &quot;i686-mingw32&quot; which likel=
y makes a difference but it&#39;s too late for me to make an informed opini=
on. :)<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a11441144994e6705493aa4bc--
