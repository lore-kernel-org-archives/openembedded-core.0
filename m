Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id BFBC7731FB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:11:10 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id 77so250538598ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=T7BRoSoLmkG0gdPDMwFx7rEWBHkb8nBFnKPBbRjLBFE=;
	b=M6dxIp14cyNXTmUdU218kGKqix7/KkILmch4j1NfR6ObnTw35FSqaqIkKi1Og0zB6s
	5mWYoMJ5f4AchDpU8i8/tCq0q09IUnVegmsdNduCgNpkhsm1RFok6xUi1mFLfeTgXzh5
	kG3Maph9JuPOOyLt7sCCMJ6eAUb/kXOu3Pid16n6rLXCilbYNgzbB2HyswJgxtBxzjoO
	kHATbHYdpvlX0s0LA7Le/ZgTw+YZ4KQ4JzYRMgL8uc1djuP6dLUaxKDFtVh7wd72cKt7
	A8OWZIHEzkcz1TnjGwZNaBam1IDiV3XxEs5++EKqwB7sZWWL6mLiSamcb+/yKKJILrct
	wGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=T7BRoSoLmkG0gdPDMwFx7rEWBHkb8nBFnKPBbRjLBFE=;
	b=in1Qa3QdKtcgd0euuJHXaKNEHxwEOeqtpLmn19y27vfRXGvJh4V7Gpvh24pspXkG6J
	x+GB5/ISQ3K7lNPW98zyBMu8cTxn+QTV3his1m765P07D/fy45pwqB2eEFQz+ZmM7SOG
	1r7f+9eHgHYgC3pSR5M74gSSHMOmlD0aDulQ0yYKngpvmlDFNH+LBBurGJKPfXv5wma3
	16+vodTIJqzHaLnNc9yiIMQBsvCRotOV/NGGptAwTotM8YTE0soFKB/tev3qYuTNR4xT
	K3ujSMHYKOh3eFOu/8R2JQfmcoR14riJJtcRO0IbjV+r6ZA8mwqbO/aFc0QD45jBSPFy
	5OSA==
X-Gm-Message-State: ALoCoQmYnIOnCLAXOBML7bVGZBc8sdzSa6Ea9cmB1VM9yrqrUcQIwOaT2MPV+chUzMwiyqEr1OGIT3bs7Sa/wAoFhsAy0U0VJUSpBZeuNJqjWwsabyZqvFc=
X-Received: by 10.107.3.154 with SMTP id e26mr94401678ioi.99.1452247871347;
	Fri, 08 Jan 2016 02:11:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 8 Jan 2016 02:10:52 -0800 (PST)
In-Reply-To: <8b25bbe0ade4a8c4eeb058ff0f9e3fd02cddf891.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
	<8b25bbe0ade4a8c4eeb058ff0f9e3fd02cddf891.1450568936.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jan 2016 10:10:52 +0000
Message-ID: <CAJTo0LaOj_UtSr4hDo5YSR+HVFwaaQsuz6H+_sK6kS=Niuy-WQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/17] xserver-xorg: Fix build with musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:11:13 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a7f773f0528cfcee3

--001a113ec10a7f773f0528cfcee3
Content-Type: text/plain; charset=UTF-8

On 19 December 2015 at 23:52, Khem Raj <raj.khem@gmail.com> wrote:

> inb/outb are implemented for ARM on glibc but not on linux in general
> therefore the conditional has to reflect that
>

Untestable as libdrm fails to build with musl:

|
/data/poky-master/tmp/work/corei7-64-poky-linux-musl/libdrm/2.4.65-r0/libdrm-2.4.65/xf86drm.c:
In function 'drmParseSubsystemType':
|
/data/poky-master/tmp/work/corei7-64-poky-linux-musl/libdrm/2.4.65-r0/libdrm-2.4.65/xf86drm.c:2840:15:
error: 'PATH_MAX' undeclared (first use in this function)
|      char link[PATH_MAX + 1] = "";

Ross

--001a113ec10a7f773f0528cfcee3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2015 at 23:52, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><div id=3D":5ns" class=3D"" style=3D"overflow:h=
idden">inb/outb are implemented for ARM on glibc but not on linux in genera=
l<br>
therefore the conditional has to reflect that<br></div></blockquote></div><=
br>Untestable as libdrm fails to build with musl:</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">| /d=
ata/poky-master/tmp/work/corei7-64-poky-linux-musl/libdrm/2.4.65-r0/libdrm-=
2.4.65/xf86drm.c: In function &#39;drmParseSubsystemType&#39;:</div><div cl=
ass=3D"gmail_extra">| /data/poky-master/tmp/work/corei7-64-poky-linux-musl/=
libdrm/2.4.65-r0/libdrm-2.4.65/xf86drm.c:2840:15: error: &#39;PATH_MAX&#39;=
 undeclared (first use in this function)</div><div class=3D"gmail_extra">| =
=C2=A0 =C2=A0 =C2=A0char link[PATH_MAX + 1] =3D &quot;&quot;;</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></d=
iv>

--001a113ec10a7f773f0528cfcee3--
