Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 69322782F7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 15:37:36 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id q2so12961072ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 08:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zyitvVrQkVYzD/v8XmMES5VHMrL2EdEixoV0/iqCbrk=;
	b=oEERQwWc3WyNtsbudz2LXlsC3Mikym17LPbH2gXoBIlnGxT3QjjJBNLCUMJS9SPyj7
	wN19MUz5D71877zsBdY83n3/MWT01uC0eVkuqYM/ZKZwig2OOfotIIyIEzvjgmzw7ku9
	mSBELwQFKdKeAZi2Xywy+K60105nzwQcFEX6b1OVgR4p9IQbgEnRogZGlTKP5spfAmfi
	TxqU4MuJl7SH7AUMRoDp9sF1oeFZyQ4kyQdCyOUR/UlWGZ5uW2ztldBrG4vAE5cW23eO
	7Xv7OC/i3vD7ltxlCE52HMzcFhvdFB3aqbFTmTvojYi/vy7s2A/HgACNUSe30iW11+0H
	5eJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zyitvVrQkVYzD/v8XmMES5VHMrL2EdEixoV0/iqCbrk=;
	b=deCNWPGzdD143xKwuzaC7zwAh71LR1pD45B3Md6876xCvUN7vzXXfy+2Z4s7fK31TX
	ZPbfw9lGDnOYj87nJ1xRIGtxzv1HKbn2THIIRiilwBF0s/iUscdt0NYZXyzgI3FAsjqn
	mad3PdIq9spVsV6ci0+G6JhshqVoncpSfc0+yQVVN+EkWGCM/kKrH+liF5zJWcYTSEKZ
	/8dhnrWj/146VKPssMjuYD12HcFZTdtDDpoia/BvE639LKpItf9vsWgSmEleba+AOVI5
	oUQUj8IW8fm1gvU4QgEV1+SLBFPmWWMpVIlv0lWH27kYnPHTq0XpKSE9u9nGYtDzPEkx
	0KoQ==
X-Gm-Message-State: AIVw112L88SffrfHW3Oc1bBCSI1cm9rD/BzyvKLpL8FWIkbCkFigbhE+
	Xm7a7xUJjHJ6Z6DDsWQCGwY5W9wCvjohV6M=
X-Received: by 10.107.132.33 with SMTP id g33mr3830297iod.300.1500565058406;
	Thu, 20 Jul 2017 08:37:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Thu, 20 Jul 2017 08:37:17 -0700 (PDT)
In-Reply-To: <20170717184050.5474-1-otavio@ossystems.com.br>
References: <20170717184050.5474-1-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jul 2017 16:37:17 +0100
Message-ID: <CAJTo0La-FM3ThuMWJPB4riFf1QLeq0Vd=cRJ_DBjrCCbOCV4Vw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 17.1.5 release
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
X-List-Received-Date: Thu, 20 Jul 2017 15:37:37 -0000
Content-Type: multipart/alternative; boundary="001a113ed2e844e7370554c18744"

--001a113ed2e844e7370554c18744
Content-Type: text/plain; charset="UTF-8"

On 17 July 2017 at 19:40, Otavio Salvador <otavio@ossystems.com.br> wrote:

> This is a stable bugfix release. Following upstream bugs were fixed:
>
> Bug 100242 - radeon buffer allocation failure during startup of Factorio
> Bug 101657 - strtod.c:32:10: fatal error: xlocale.h: No such file or
> directory
> Bug 101666 - bitfieldExtract is marked as a built-in function on OpenGL ES
> 3.0, but was added in OpenGL ES 3.1
> Bug 101703 - No stencil buffer allocated when requested by GLUT
>
> Also, the following patches were included in this release and as such
> deleted:
>
> - etnaviv_fix-shader-miscompilation.patch
>

This fails to build on ppc:

| checking for libdrm >= 2.4.75 libdrm_intel >= 2.4.75... no
| configure: error: Package requirements (libdrm >= 2.4.75 libdrm_intel >=
2.4.75) were not met:
|
| No package 'libdrm_intel' found

https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/1191/steps/BuildImages/logs/stdio

Ross

--001a113ed2e844e7370554c18744
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 July 2017 at 19:40, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"=
mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-=
color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:2gn" class=3D"gm=
ail-a3s gmail-aXjCH gmail-m15d51daf82d09c29">This is a stable bugfix releas=
e. Following upstream bugs were fixed:<br>
<br>
Bug 100242 - radeon buffer allocation failure during startup of Factorio<br=
>
Bug 101657 - strtod.c:32:10: fatal error: xlocale.h: No such file or direct=
ory<br>
Bug 101666 - bitfieldExtract is marked as a built-in function on OpenGL ES =
3.0, but was added in OpenGL ES 3.1<br>
Bug 101703 - No stencil buffer allocated when requested by GLUT<br>
<br>
Also, the following patches were included in this release and as such<br>
deleted:<br>
<br>
- etnaviv_fix-shader-<wbr>miscompilation.patch<br></div></blockquote><div>=
=C2=A0<br></div></div>This fails to build on ppc:<br><br>| checking for lib=
drm &gt;=3D 2.4.75 libdrm_intel &gt;=3D 2.4.75... no<br>| configure: error:=
 Package requirements (libdrm &gt;=3D 2.4.75 libdrm_intel &gt;=3D 2.4.75) w=
ere not met:<br>| <br>| No package &#39;libdrm_intel&#39; found<br></div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><a href=3D"ht=
tps://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/1191/st=
eps/BuildImages/logs/stdio">https://autobuilder.yoctoproject.org/main/build=
ers/nightly-ppc/builds/1191/steps/BuildImages/logs/stdio</a><br></div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ed2e844e7370554c18744--
