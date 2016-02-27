Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4B739770A1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 22:48:12 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id g203so154412624iof.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 14:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Myn6BILYS89Orw81a2MUtZixYirOXxUwlDEyikbrfX8=;
	b=HrZMvyG3Nvy1b3YtjO/GCgjFiE+4OfbCeGG5YsaOP3qcxw+baHy2PQ2DCxk8t+rKC7
	C5VeB+Tmrm0CksY3u7fjQD2tiLHyoh3ag7oir4zY6dZ/L3rANQhR/9kpCBy6ff4qQSjB
	eRPpfh1PtSVOUwfn/sSmt/gXTNKb6Fr2qzsDdagYSUOLAtk5cBhQnNCFFoqjaUj4IhSa
	4f9oWNViW3iHAz8xzY3BjfuE1HnZaM7A3x/s+eeG6oTsVGQ+w76OVrjEx765c1SrOX+W
	xeXs/DNvkehQxfdcKSfY6WErCmCc2QXyAoWROr5Xf9jBda9ny51X4wlalw5Veozsc97Y
	Ouhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Myn6BILYS89Orw81a2MUtZixYirOXxUwlDEyikbrfX8=;
	b=eQLIcBZt/yB1PAU/hmJAULUOzmiAIrcx4IQ08GDuxia8r8CyfMHfjKyqLdvpKyeI9G
	MpDQ91y8h22r7q9zkjXAjzi5Z7EBYSWlI7ZQ2ZIeMXrgKmcnJjBUWpAzImcFShhnFHxu
	Otu1IwDuie6O35g3lJemArwm8XA0TXkb/WHAMmE/lV0c6hE4Og7w7ar+NWLal15DES39
	xlunxaKLOhWibw9okCpWMv4QMaNnJBH+TRHNHC8a2OvMM0/RVJt1v4MK9uSdy9QN4urV
	q0JPPWKV2wSBIxSoVvwwhGD+eQ6vnM+2XspfhRoLGsz7ItTI2LtijqX6Gou0N0FFlgvp
	OI7g==
X-Gm-Message-State: AG10YOSnC4tSlOYsh/HwMTcE9nYQUOulFhLvcfMW81xxFwWFW5GDsH5ariGXM1atEviruNtK3sHRWaDfEMtU6Gwh
X-Received: by 10.107.164.15 with SMTP id n15mr12638483ioe.148.1456613292828; 
	Sat, 27 Feb 2016 14:48:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Sat, 27 Feb 2016 14:47:53 -0800 (PST)
In-Reply-To: <56D12579.9020705@windriver.com>
References: <cover.1456456877.git.mark.hatle@windriver.com>
	<CAJTo0LYDSo_oEMQEhHUWZEO2AGZ516JFevNH7oZ-yTKP_S8_sw@mail.gmail.com>
	<56D12579.9020705@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 27 Feb 2016 22:47:53 +0000
Message-ID: <CAJTo0LYdiFyyU0Mn8eEq8eQfmcmKekkXxg1Dzqv+apA9RfA1hQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3 v2] Upgrade RPM 5 to 5.4.16 (CVS HEAD)
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
X-List-Received-Date: Sat, 27 Feb 2016 22:48:13 -0000
Content-Type: multipart/alternative; boundary=001a11377682e51976052cc835f1

--001a11377682e51976052cc835f1
Content-Type: text/plain; charset=UTF-8

On 27 February 2016 at 04:26, Mark Hatle <mark.hatle@windriver.com> wrote:

> I am not getting this error on qemux86.
>
> My build configuration:
>
> BB_VERSION        = "1.29.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Fedora-23"
> TARGET_SYS        = "i586-oe-linux"
> MACHINE           = "qemux86"
> DISTRO            = "nodistro"
> DISTRO_VERSION    = "nodistro.0"
> TUNE_FEATURES     = "m32 i586"
> TARGET_FPU        = ""
> meta              =
> "mhatle/rpm-5.4.16:004efb3aaa973dba030847c1c8218238f0cc68c5"
>
> The local.conf is the stock one with buildhistory and package_rpm enabled.
>
> Which compiler do you have enabled?  I'm building with the default 5.3.0
> compiler.
>
> Since I'm not reproducing the problem, I'd like to know what the
> difference in
> configurations is.
>

This was on the autobuilder and happened twice in rpm-native:

http://errors.yoctoproject.org/Errors/Details/38006/ (Debian 8.3)
http://errors.yoctoproject.org/Errors/Details/38000/ (Ubuntu 14.04)

I guess the -native bit is important there.

Also, another failure happened more globally:

gcc: error: tblake2bp.o: No such file or directory

Several times in rpm for target:
http://errors.yoctoproject.org/Errors/Details/37991/
http://errors.yoctoproject.org/Errors/Details/38001/
http://errors.yoctoproject.org/Errors/Details/38007/
http://errors.yoctoproject.org/Errors/Details/38004/

And once in rpm-native:
http://errors.yoctoproject.org/Errors/Details/37995/

Ross

--001a11377682e51976052cc835f1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 February 2016 at 04:26, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D":28m" class=3D"" style=
=3D"overflow:hidden">I am not getting this error on qemux86.<br>
<br>
My build configuration:<br>
<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.29.0&quot;<br>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&quot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;Fedora-23&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;i586-oe-linux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;qemux86&quot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;nodistro&quot;<br=
>
DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;nodistro.0&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;m32 i586&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;&quot;<br>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;mhatle/rpm-5=
.4.16:004efb3aaa973dba030847c1c8218238f0cc68c5&quot;<br>
<br>
The local.conf is the stock one with buildhistory and package_rpm enabled.<=
br>
<br>
Which compiler do you have enabled?=C2=A0 I&#39;m building with the default=
 5.3.0 compiler.<br>
<br>
Since I&#39;m not reproducing the problem, I&#39;d like to know what the di=
fference in<br>
configurations is.</div></blockquote></div><br>This was on the autobuilder =
and happened twice in rpm-native:</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra"><a href=3D"http://errors.yoctoproject.org/Error=
s/Details/38006/">http://errors.yoctoproject.org/Errors/Details/38006/</a> =
(Debian 8.3)</div><div class=3D"gmail_extra"><a href=3D"http://errors.yocto=
project.org/Errors/Details/38000/">http://errors.yoctoproject.org/Errors/De=
tails/38000/</a> (Ubuntu 14.04)</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">I guess the -native bit is important there.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Also, anoth=
er failure happened more globally:<br><br>gcc: error: tblake2bp.o: No such =
file or directory</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Several times in rpm for target:</div><div class=3D"gmail_extra=
"><a href=3D"http://errors.yoctoproject.org/Errors/Details/37991/">http://e=
rrors.yoctoproject.org/Errors/Details/37991/</a><br></div><div class=3D"gma=
il_extra"><a href=3D"http://errors.yoctoproject.org/Errors/Details/38001/">=
http://errors.yoctoproject.org/Errors/Details/38001/</a></div><div class=3D=
"gmail_extra"><a href=3D"http://errors.yoctoproject.org/Errors/Details/3800=
7/">http://errors.yoctoproject.org/Errors/Details/38007/</a></div><div clas=
s=3D"gmail_extra"><a href=3D"http://errors.yoctoproject.org/Errors/Details/=
38004/">http://errors.yoctoproject.org/Errors/Details/38004/</a></div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">And once in rpm-=
native:</div><div class=3D"gmail_extra"><a href=3D"http://errors.yoctoproje=
ct.org/Errors/Details/37995/">http://errors.yoctoproject.org/Errors/Details=
/37995/</a></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a11377682e51976052cc835f1--
