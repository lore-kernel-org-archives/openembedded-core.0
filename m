Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6623677D3C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 12:40:29 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id d14so34877063qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 05:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pj0wTN6Zvc6GDGTOriobYZpUWuRqdE21gZ6OSDiNFXI=;
	b=fq9mKg/exltTlmMKY7zvZ0YhnuYfQEGU5AO4wwew5f2vJkwAECX8FofmrmYO3tANIV
	NqqYDAoSkpBw8kLE7gD1KdAloKSuMuKn1Yt7TdED35WBF/CnZA4/XxIYAyanp+EytjEP
	GD4Ome7fz1BAk+gmDFeve+/36FmFmFauW9GFedBw/qrtJylj1H4ULwK5H3SrVdHrb4WI
	b0prJTvcwrKjPN+6oy8ketoWTH3+stdJPPARGzpyXw8U38sHUedcxclU5WdmxG/wXdQq
	gsMFKOp5IIxQg3mEw4Sei/Fkjxd0sDAisczCf7gJcPWryP4wzreJH4c9/Cb3PRagacRw
	FueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pj0wTN6Zvc6GDGTOriobYZpUWuRqdE21gZ6OSDiNFXI=;
	b=GB65G7q3/MkZZHFmiAxBzBGKTRePZmrV6xnALs4nGtvcZzP2aAJ5OwcRi0WDDW5zMh
	Qc8FwDa5D/VDGvnRTwMOdyCqNOM797WzrOuqaoChkjnWyd//hpiwa/GtxzPwrSKBdl8/
	E0VtgltCrzG41+2fP4XXp9UGBctzwKUdsfew0+bVVg8x0XegaxuyMi1SSIe6TNb4MCnw
	dng+ZjqwRf6DY/RWgTQ5DSC7Ifym3jEU0aZ8TdXrhMIWk1BlSqoVSINepPO5hODHv+6v
	i1Yg89Wfpbkm8L3/sb9etwkXYx4TwIXzuUHPP94Xg68WTkLfupQPH8cxm3yxn5h3ONjR
	W1fw==
X-Gm-Message-State: AODbwcDKUkjy38fqOmli6tkZtgkeBvacjFl9esHNV8iPCBAHUmPwTOpc
	L4q08JPzuEaeyp934C/jOs5dXbwu9T0H
X-Received: by 10.55.140.65 with SMTP id o62mr1452779qkd.127.1496320831047;
	Thu, 01 Jun 2017 05:40:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 1 Jun 2017 05:40:10 -0700 (PDT)
In-Reply-To: <1495178237-22689-1-git-send-email-mikko.rapeli@bmw.de>
References: <1495178237-22689-1-git-send-email-mikko.rapeli@bmw.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Jun 2017 13:40:10 +0100
Message-ID: <CAJTo0LYvce=ZnTyYmT+_3b9-VD35t9yZES8wNin+xM-Xdj2ALQ@mail.gmail.com>
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Fix return value checks from subprocess.call()'s
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
X-List-Received-Date: Thu, 01 Jun 2017 12:40:30 -0000
Content-Type: multipart/alternative; boundary="94eb2c05430e9ae2240550e5570d"

--94eb2c05430e9ae2240550e5570d
Content-Type: text/plain; charset="UTF-8"

On 19 May 2017 at 08:17, Mikko Rapeli <mikko.rapeli@bmw.de> wrote:

>  bitbake/lib/bb/ui/ncurses.py             | 2 +-
>  bitbake/lib/bb/utils.py                  | 2 +-
>  meta/classes/archiver.bbclass            | 2 +-
>  meta/classes/cml1.bbclass                | 2 +-
>  meta/classes/kernel-module-split.bbclass | 2 +-
>  meta/classes/sstate.bbclass              | 4 ++--
>  meta/lib/oeqa/utils/buildproject.py      | 2 +-
>  meta/lib/oeqa/utils/targetbuild.py       | 4 ++--
>  meta/recipes-extended/cups/cups.inc      | 2 +-
>  scripts/runqemu                          | 8 ++++----
>

Poky is a generated repository and you've patches that touch two upstream
repositories, can you split this into bitbake/ (for the bitbake repo) and
meta/ scripts/ (for the openembedded-core repository).

I presume the transformation wasn't automated and you checked that throwing
exceptions was the right thing to do?

Ross

--94eb2c05430e9ae2240550e5570d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 May 2017 at 08:17, Mikko Rapeli <span dir=3D"ltr">&lt;<a href=3D"mail=
to:mikko.rapeli@bmw.de" target=3D"_blank">mikko.rapeli@bmw.de</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":282" class=3D"a3s aX=
jCH m15c1fb026a8668d0">=C2=A0bitbake/lib/bb/ui/ncurses.py=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0bitbake/lib/bb/utils.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/classes/archiver.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
=C2=A0meta/classes/cml1.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/classes/kernel-module-<wbr>split.bbclass | 2 +-<br>
=C2=A0meta/classes/sstate.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 4 ++--<br>
=C2=A0meta/lib/oeqa/utils/<wbr>buildproject.py=C2=A0 =C2=A0 =C2=A0 | 2 +-<b=
r>
=C2=A0meta/lib/oeqa/utils/<wbr>targetbuild.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4=
 ++--<br>
=C2=A0meta/recipes-extended/cups/<wbr>cups.inc=C2=A0 =C2=A0 =C2=A0 | 2 +-<b=
r>
=C2=A0scripts/runqemu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8 ++++----</div></blockquote></div=
><br>Poky is a generated repository and you&#39;ve patches that touch two u=
pstream repositories, can you split this into bitbake/ (for the bitbake rep=
o) and meta/ scripts/ (for the openembedded-core repository).</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I presume the trans=
formation wasn&#39;t automated and you checked that throwing exceptions was=
 the right thing to do?</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--94eb2c05430e9ae2240550e5570d--
