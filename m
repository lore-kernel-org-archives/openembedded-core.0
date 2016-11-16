Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0B19B60069
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 10:06:25 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id n6so94997733qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 02:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OjrTraYMjjlCs2a+zg5x0yskwBBcOb2UCLldVGbUNZ0=;
	b=j9zkDNTga/QLVVv8CiQMNZdz7d+meh4bgCA0Xr6FqdHU1Fe3x2jOjKAPAUR0GIkQp2
	lXL2X9bdYHaO49Ox0NUVmQq3dZ1kKoZIvzibm79H5cPkV0oxo2R+ugUEtccmvVnxRpmG
	2TGUNeJO0OkjFUTHShkimY9EwxUfAbLV/KoMm0qqVjpR7lHJB/JW651SP56uvy60RJit
	i6QIVKWgTddVeGDm/nTCuzro9Skx2D4BEdpDOdVXnyPiEuX0199E5Eh8JDIELasnEDT7
	VsqTn1/JQIUHa48rkO1Z3+E1hppNcGycPsdh3limAxgEIlwuA8zLLmhmhISLXmMgW3Bl
	Wuow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OjrTraYMjjlCs2a+zg5x0yskwBBcOb2UCLldVGbUNZ0=;
	b=bEGF8g+Eahq833MoSMFat6Rrni44IdYBvTy/yFAadsnmASlPlxXAYzbT60YElfproT
	9T2JkLe9eCbyRF4FtWZejn3qTuNo10ecl8KJAvTHKc5eAvMGOCWkpyr7ZQ3uOml7NNmM
	EsG+tMp90TLRJxwdWbLTTtK4euSX82JOmfu6AO+/baqlrLf27oRKCAvw+RyI8obDN1cD
	Ukcm61+c8C42251n49LTlFZEUWsQH+ZUo7DH5YRJv+rb6aroGaTqtVFJsZDJFxsC9Bbr
	3ndBiQaNpyc29lhSPHd0T5Mt7Z715aP03nYQKkwtkIwaxMubUAK1DjPghhcD6bPnWcPE
	MWzA==
X-Gm-Message-State: AKaTC02Y5xOsBpjc0zTQ6Qw16egH5YPp6KxdrEHAmy0BH3Bbu/cfa8jZ0QWneXkIRNxT+Gy9DTCDTK8irhWG4E7d
X-Received: by 10.237.44.161 with SMTP id g30mr1148426qtd.144.1479290787344;
	Wed, 16 Nov 2016 02:06:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Wed, 16 Nov 2016 02:06:06 -0800 (PST)
In-Reply-To: <20161114225241.2282-1-edwin.plauchu.camacho@linux.intel.com>
References: <20161114225241.2282-1-edwin.plauchu.camacho@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Nov 2016 10:06:06 +0000
Message-ID: <CAJTo0La-NgoDXBsVcq5Puf2xZYS_aDJcqZ1UW6F_H_Qcmk0xjQ@mail.gmail.com>
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-mako: upgrade to 1.0.6
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
X-List-Received-Date: Wed, 16 Nov 2016 10:06:27 -0000
Content-Type: multipart/alternative; boundary=94eb2c125848e65b8f05416839ed

--94eb2c125848e65b8f05416839ed
Content-Type: text/plain; charset=UTF-8

On 14 November 2016 at 22:52, Edwin Plauchu <
edwin.plauchu.camacho@linux.intel.com> wrote:

>  meta/recipes-devtools/python/python-mako.inc                          |
> 4 ++--
>  .../python/{python3-mako_1.0.4.bb => python3-mako_1.0.6.bb}           | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-mako_1.0.4.bb =>
> python3-mako_1.0.6.bb} (100%)
>

Same problem as python3-git.

Ross

--94eb2c125848e65b8f05416839ed
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 November 2016 at 22:52, Edwin Plauchu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:edwin.plauchu.camacho@linux.intel.com" target=3D"_blank">edwin.p=
lauchu.camacho@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D":3xh" class=3D"a3s aXjCH m1586512b3eb7376a">=C2=A0=
meta/recipes-devtools/<span class=3D"il">python</span>/<wbr><span class=3D"=
il">python</span>-mako.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0.../<span class=3D"il">python</span>/{<a href=3D"http://python3-mako_=
1.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.0.<wbr>4.bb</=
a> =3D&gt; <a href=3D"http://python3-mako_1.0.6.bb" rel=3D"noreferrer" targ=
et=3D"_blank">python3-mako_1.0.6.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 0<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/<span class=3D"il">python</span>/{<a hre=
f=3D"http://python3-mako_1.0.4.bb" rel=3D"noreferrer" target=3D"_blank"><wb=
r>python3-mako_1.0.4.bb</a> =3D&gt; <a href=3D"http://python3-mako_1.0.6.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.0.6.bb</a>} (100%)</d=
iv></blockquote></div><br>Same problem as python3-git.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c125848e65b8f05416839ed--
