Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 491D16080F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 09:10:58 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id g127so59774505ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 02:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fyfFHuqcb1/0XuLvrXpPvUtFKJJ4v4xTSmytgS0Notg=;
	b=ErBBZT2ys+6LhG1YK920kWLUAHYFm1/d9xS7csvKpAe5MJ7tml7AEwtXRRGGMSyliO
	zpuXArF5V/Dl4qmuKeXPHP/8Ng9TyS0/mry1E/G2v6OT/GfOY7DBzMdxTvJPn4Mpk7wV
	/gi8x71/T92qABM+sL57G99B6U8XFzBF0PnVFVJnrQCMDBlebF2qjzHZJ1MDmS2LxU7E
	aucjJMqJYs8WXXZV9CIcXiyjNLIy8OBuxxehbbyDnoCbIQCcGFVtKcaKZrkErthF30fJ
	c7VJtEV/PFbOIqPS1v+l0Kcx3OM8bp5MEk41PJnx7gaK/5p/MI82TamoD4YMUmNB6F70
	tFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fyfFHuqcb1/0XuLvrXpPvUtFKJJ4v4xTSmytgS0Notg=;
	b=aYgKlbmpjMpiwgCaqVwEe4iekzG4UIYK0HiFEtJo+3vpPrveGxFNemy0YnIkykOuaH
	Zs16Yv9JzFs0AmMJW5CpfFF6QEb+I9R5GKeZx1/BAI2DiB4HcW8iz4Rz9zFI59k0Q4K+
	ha/bRwcIMyV4nXCF4kDSBB6wz2vC3dkNdjIh9s+hm/fnye/KST2CrKnSwPQD3ZpUUOCA
	t0Stgg/lTXHSNG09BNUcjc5s/ggOVoRUTPmudTotOB+ohdnK2rayZdQkubT7SeBHQCUU
	O+53PqlwDLlEV4AGO2h4lSkNI4mPNLQMx6XULMxBMfGoE1jpBYeyJGfKtzdt0YMqNc/1
	HyJg==
X-Gm-Message-State: ALyK8tK1Pq+O9BwZpSIgNhlGHClFvvPCWaNE7slDvcuMtsQ+Fh18C2F9pn/fnfwlV7H9ckGx8ec2nNsjyeWlSDho
X-Received: by 10.36.120.71 with SMTP id p68mr8001253itc.22.1467018659576;
	Mon, 27 Jun 2016 02:10:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Mon, 27 Jun 2016 02:10:40 -0700 (PDT)
In-Reply-To: <1466765962-23197-1-git-send-email-git@andred.net>
References: <1466765962-23197-1-git-send-email-git@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Jun 2016 10:10:40 +0100
Message-ID: <CAJTo0La+NmXWrJW4hp9e2JtqB2DTeREfOYhhLi4MJWqkZygc3g@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] security_flags.inc: libidn fails to build w/ -Wformat-security
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
X-List-Received-Date: Mon, 27 Jun 2016 09:10:59 -0000
Content-Type: multipart/alternative; boundary=001a114a938815561d05363ee6b0

--001a114a938815561d05363ee6b0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 24 June 2016 at 11:59, Andr=C3=A9 Draszik <git@andred.net> wrote:

> ../../libidn-1.32/src/idn.c: In function 'main':
> ../../libidn-1.32/src/idn.c:172:7: error: format not a string literal and
> no format arguments [-Werror=3Dformat-security]
>        error (0, 0, _("only one of -s, -e, -d, -a, -u or -n can be
> specified"));
>

As libidn will be dealing with data from the network it seems like the sort
of package that should be built with format-security enabled.  Wouldn't it
be better to fix up the calls to error() instead?

Ross

--001a114a938815561d05363ee6b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 June 2016 at 11:59, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a href=
=3D"mailto:git@andred.net" target=3D"_blank">git@andred.net</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":9mb" class=3D"a3s aXjC=
H m1558210ba318f2cf">../../libidn-1.32/src/idn.c: In function &#39;main&#39=
;:<br>
../../libidn-1.32/src/idn.c:172:7: error: format not a string literal and n=
o format arguments [-Werror=3Dformat-security]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0error (0, 0, _(&quot;only one of -s, -e, -d, -a,=
 -u or -n can be specified&quot;));</div></blockquote></div><br>As libidn w=
ill be dealing with data from the network it seems like the sort of package=
 that should be built with format-security enabled.=C2=A0 Wouldn&#39;t it b=
e better to fix up the calls to error() instead?</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114a938815561d05363ee6b0--
