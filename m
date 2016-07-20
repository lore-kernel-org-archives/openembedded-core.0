Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9555E60722
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 11:59:42 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id u186so114320004ita.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 04:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=91fAM8JXvisll6jQuFP+jn0r/KxSHJBY68pCkLl/jb8=;
	b=EbEGvTd0/DRMGahgQT8gpG3BtkT1VeKgPdvw6eW28FQVfWjb2XtNvRGCUoE8AC/x2y
	amliDqHdkn+To8yA4a70SM613DsKP6O8Tmp6KZAe0Y8dr/SCoUUaBVEKX97vwKUfaCYf
	QFOIJeRuDvBcv7yJoBTXGMjj2ngV3aDc1MuA21zJrahEFXpgB5jbjJtErAPguyAEyj5S
	uI6QN//WMLoisQpOMLp5bZflUBWCepFmZTLm9nXTRivbLqkUA6qg/a5A26lr8weigDWY
	K320bu8iPRmDqj8cbnHpyVIUjIF57lt/1iqFNGfP3l0ozPjQrIOOWPOS+QbpWnQo3BrI
	UbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=91fAM8JXvisll6jQuFP+jn0r/KxSHJBY68pCkLl/jb8=;
	b=SwdZb5/6Y/H0BW+0BHMkyh+dLWThoOPgZHmIMb2/pDorU5ABJy/qGti3Oi+NO0tx7C
	U5zHkCJ9UA+e6hKf7yqoPIpAAn9hZAGt2N4dUVYFTe+zHqk9qOO1H/IymvYHafh57Ihj
	cSD+KW+ue+fKljtZV77BBj+NmXINMwmLvCIr5Jl3DyvUIbXRknKs7DBbRk5h2EQCsfu5
	6Lvnfmnfmass4mmFTOy7fiv9iADn3bmWKMOnHkjwjSf3ptH/KVWpxAAa6rcTbZMCc28L
	387azxTt61n96udbdc9ZaZPuDgPib0p6AX061ltgOuTX1EUosQ5QloVvyEgfy0nhMBoe
	x3Gw==
X-Gm-Message-State: ALyK8tIGhB3ijIt+bluTBThDfaO/0oqOU1ApxbHIkrRExLyFBJTQJB1sgkHt6r7JKHWagLsM01tE1fODMo2EjS2n
X-Received: by 10.36.20.75 with SMTP id 72mr34637721itg.83.1469015983618; Wed,
	20 Jul 2016 04:59:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 20 Jul 2016 04:59:24 -0700 (PDT)
In-Reply-To: <6dc817964ba46c0263b3b07cccf84a9917b72121.1468994042.git.liezhi.yang@windriver.com>
References: <cover.1468994042.git.liezhi.yang@windriver.com>
	<6dc817964ba46c0263b3b07cccf84a9917b72121.1468994042.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Jul 2016 12:59:24 +0100
Message-ID: <CAJTo0La07P1tsmf_trC0Gj+WQHVYwM=QiASRjBS8fFaBUjSaAA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] btrfs-tools: fix installed-vs-shipped
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
X-List-Received-Date: Wed, 20 Jul 2016 11:59:44 -0000
Content-Type: multipart/alternative; boundary=001a11446942df99ff05380fef49

--001a11446942df99ff05380fef49
Content-Type: text/plain; charset=UTF-8

On 20 July 2016 at 06:54, Robert Yang <liezhi.yang@windriver.com> wrote:

>   /lib64/udev/rules.d/64-btrfs-dm.rules
>

This says that the btrfstools recipe is broken, not the packaging.  udev
looks in /lib no matter what $libdir is.

udev reads UDEVLIBEXECDIR/rules.d, where
udevlibexecdir=$(rootprefix)/lib/udev and we pass rootprefix=$baseprefix
(which defaults to /).

Ross

--001a11446942df99ff05380fef49
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 July 2016 at 06:54, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D":347" class=3D"">=C2=A0=
 /lib64/udev/rules.d/64-btrfs-dm.rules<br></div></blockquote></div><br>This=
 says that the btrfstools recipe is broken, not the packaging. =C2=A0udev l=
ooks in /lib no matter what $libdir is.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">udev reads UDEVLIBEXECDIR/rules.d, where =
udevlibexecdir=3D$(rootprefix)/lib/udev and we pass rootprefix=3D$baseprefi=
x (which defaults to /).</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a11446942df99ff05380fef49--
