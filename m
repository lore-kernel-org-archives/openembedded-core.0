Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 624066067C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jul 2016 19:48:07 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id f6so44575689ith.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jul 2016 12:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=COAQtRqrB2qONckfIIWrLuswRRhf7lsC4Hg6aw5yuv8=;
	b=uCMaPHuxNnO8/IqLmPqqRJmYKDOKxOKSRwismpDVoUKacbNPg8iN/ZfH6Yjc48HUpX
	7rNdoCOP6Ne2P9+iF30Z1KlvvPf2A9vl7CxEFkVe9fRnxcDcqSr3vle9yQv0HrNs2xMg
	roLXpuzVEOJwALb1Ciubh0oYIM9aJYapPFEs6YSiAMWlccrSyH7OQYlH8Pcu59pnQ4QM
	LnAmUoAcEB2aoS5w656XYPT29MzrOv+NYm85xexsyOQEffUF+LIcBVhXtB31x45gQvSX
	UTeJqDvbw/6mT/htxVGBJjm3K0tRNc5qMKNiYS/SBF/zngogqngFeN4oknLhsb7m4nH+
	WJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=COAQtRqrB2qONckfIIWrLuswRRhf7lsC4Hg6aw5yuv8=;
	b=E1YR4yfMfK9LH6eciRigBI5zWGblgsao1YTzunzJo8UKbTYp5WzDXQ83drwEc9Mctw
	hvKwALmAx7cD9ROqKIkSya5dDkDLoegnmdg7+O5qYKfuAepdD4kYCsgNyaCknTH+86oK
	izna+WjH5jSqGNB4YKue4XVYOc1MMWpSALvFVHSVSO3S9dHfeY6NpXG/65I8A4dAGC1A
	Kovt87mQaKceMm9n4GJdriJARv/DCoGV9pliIiioLIsBQQTy/yHa69vHaxxDg0HyJD5z
	D85M+0aXCrzt/ssRi+xvfzlZy2Cl2yR00FrM5svbJ4vKXltblyFHLfRRgAmxOnTmr8wF
	t22Q==
X-Gm-Message-State: ALyK8tJ9ONh+N58GWHcyPBJsZ4BUR/weAZzSW44vMATwwQ9ytoLsGl2R2U74SdCAcVeFoygE7kl2hOnD//xHhsyX
X-Received: by 10.36.121.204 with SMTP id z195mr27621299itc.22.1468698488591; 
	Sat, 16 Jul 2016 12:48:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Sat, 16 Jul 2016 12:47:49 -0700 (PDT)
In-Reply-To: <8673f0535cc7b0698e4d900b79f06975dd8670c1.1468578590.git.jussi.kukkonen@intel.com>
References: <cover.1468578590.git.jussi.kukkonen@intel.com>
	<8673f0535cc7b0698e4d900b79f06975dd8670c1.1468578590.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 16 Jul 2016 20:47:49 +0100
Message-ID: <CAJTo0LY+whG89qBDKHYmk8j1q1UJb2oH6Y+8d6=ffNCXHw9HRw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] mesa: Upgrade 11.2.2 -> 12.0.1
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
X-List-Received-Date: Sat, 16 Jul 2016 19:48:10 -0000
Content-Type: multipart/alternative; boundary=001a114aa466b1eca90537c60346

--001a114aa466b1eca90537c60346
Content-Type: text/plain; charset=UTF-8

On 15 July 2016 at 11:41, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> Massive mesa upgrade (OpenGL 4.3, GLVND support, vulkan driver
> for intel etc), although many new things are disabled by default.
>

Looks like something changed - likely for the good - and mesa-demos in
X11-free builds are now failing:
http://errors.yoctoproject.org/Errors/Details/71162/

Why that was looking for GL.h when X11 should have been disabled I don't
know...

Ross

--001a114aa466b1eca90537c60346
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 July 2016 at 11:41, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D":2z4" class=3D"">Massi=
ve <span class=3D"">mesa</span> upgrade (OpenGL 4.3, GLVND support, vulkan =
driver<br>
for intel etc), although many new things are disabled by default.<br></div>=
</blockquote></div><br>Looks like something changed - likely for the good -=
 and mesa-demos in X11-free builds are now failing: <a href=3D"http://error=
s.yoctoproject.org/Errors/Details/71162/">http://errors.yoctoproject.org/Er=
rors/Details/71162/</a></div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Why that was looking for GL.h when X11 should have been d=
isabled I don&#39;t know...</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a114aa466b1eca90537c60346--
