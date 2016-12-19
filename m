Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1443E719C3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:14:34 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id n21so5746652qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iAJT5Du2UDi6LqZFWlevKN4qr0DHp4tRdEC0xb4Gkpk=;
	b=jMk0FmVipfd+Kz19O+XebZGMajA+61RzyXsHC+Nld+ctGF/g9h5iGb0cvGl9Q1XBLN
	wI98niQtZhyc+XRNfhAN4dUz7EFBkF9N6fJLow65Z5wNHd5yOjlvROO+P4e6o2moTjsH
	znbPiviFQmcjK7atxmnJ/SfEUytMOvy1T5EYqXEhCZ8ugmNcTGo+gxxjubByOTkJhIY9
	/WfR2h2FI7lO8WuF26O/9IhLCaNPg95yH+FE2rxVcJ19XSvuEdKUxLe4iyi6FZNH7l+L
	dHgtclHJpbvz2wTuBiiT48IfeuuSREm6mxEpi3/PE9EdqXvxLuE+mF6YH5NHUFxB6TST
	WWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iAJT5Du2UDi6LqZFWlevKN4qr0DHp4tRdEC0xb4Gkpk=;
	b=o3UksWwcER5kw/hSnOxf1rPl+3n/pmzmOjpYu8awZ+5QhsPOoF/wr9+58jNPpbkCht
	rKb0Sv5KUkBgA0W2R1XXv6dFAWRIUBT5H3Gx7Nb32UnK9Hhkkg0Mkhtz9jJX0wVeWjeo
	1ahmEaFCLwtwKgOWjwO3V2OdYGsrbEkbW+MsbxTEdhByZOJDTgD/F4/9TJ/DvmDW96fA
	TfmFZAY2Uv834STtSG1jJcvRneNRhj8vJQsf4EZMAIZ92t3xfLuYxqg+nIcVWgKnWz2U
	2kwGjuVD0dcGJJ5ifZyiT0Fv2GV8SMsvoNkuK1vxirjbVyqqkGOtlcKMqW3rTL63UGR/
	RKaQ==
X-Gm-Message-State: AIkVDXIMRS0qqd+uDAIPoqveqwpmwKp9tWOg9RGednQkbmdpaevZX84oW5XAmaiAdiL9W/6pKC2Hpo7pu8U5tLfZ
X-Received: by 10.55.8.20 with SMTP id 20mr1425153qki.3.1482146075758; Mon, 19
	Dec 2016 03:14:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 19 Dec 2016 03:14:15 -0800 (PST)
In-Reply-To: <20161219063957.18716-2-raj.khem@gmail.com>
References: <20161219063957.18716-1-raj.khem@gmail.com>
	<20161219063957.18716-2-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Dec 2016 11:14:15 +0000
Message-ID: <CAJTo0LY1m20z=4SmyHJg0v1DVS=PukdGvYkkHT=V7ii9rTgzYA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [V2 02/10] gdb: Upgrade to 7.12
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
X-List-Received-Date: Mon, 19 Dec 2016 11:14:36 -0000
Content-Type: multipart/alternative; boundary=001a114c9d6059fd24054401062a

--001a114c9d6059fd24054401062a
Content-Type: text/plain; charset=UTF-8

On 19 December 2016 at 06:39, Khem Raj <raj.khem@gmail.com> wrote:

> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -25,7 +25,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>  GCCVERSION ?= "6.2%"
>  SDKGCCVERSION ?= "${GCCVERSION}"
>  BINUVERSION ?= "2.27%"
> -GDBVERSION ?= "7.11%"
> +GDBVERSION ?= "7.12%"
>  GLIBCVERSION ?= "2.25"
>

Can you rebase stuff to master before submitting it, as this patch doesn't
apply.

Ross

--001a114c9d6059fd24054401062a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2016 at 06:39, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div class=3D"">--- a/meta/conf/d=
istro/include/<wbr>tcmode-default.inc<br>
+++ b/meta/conf/distro/include/<wbr>tcmode-default.inc<br>
@@ -25,7 +25,7 @@ PREFERRED_PROVIDER_virtual/<wbr>gettext ??=3D &quot;gette=
xt&quot;<br>
=C2=A0GCCVERSION ?=3D &quot;6.2%&quot;<br>
=C2=A0SDKGCCVERSION ?=3D &quot;${GCCVERSION}&quot;<br>
=C2=A0BINUVERSION ?=3D &quot;2.27%&quot;<br>
-GDBVERSION ?=3D &quot;7.11%&quot;<br>
+GDBVERSION ?=3D &quot;7.12%&quot;<br>
=C2=A0GLIBCVERSION ?=3D &quot;2.25&quot;</div></blockquote></div><br>Can yo=
u rebase stuff to master before submitting it, as this patch doesn&#39;t ap=
ply.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a114c9d6059fd24054401062a--
