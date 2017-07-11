Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id A50BE77E9C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:36:55 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id 16so94470904qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 01:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B4whm+C293rVzkunODEeLxwk73TdkKmVFdzg6C+13ow=;
	b=n/OMYog5De/E8raNmIDQFuL+iRJ9U/T3Gzhjq3TidO6EVCUq2Ia4fGShQ27jk2s9D8
	wyBDQEEadOOBgjGEo0zdbPTdXQ1TeYGf60RbCMklispAnnUVk9QJ8UMD/wGvZROb/OJG
	byv2hjPigmASO7hxkDNF1s7lYEhUTOOuzC1o6wi1qIFpuU7XNHDQ2z43mGljVr61bwJK
	GjpeBqvVSIZ4xtRKGT37IFvzw2augxE0F8mVAtG++BihXFGvZYyJnBmxhoUHbqS1d31V
	uqSiRnNoKBDKXwFryj5vYN6zo6mx68urTQiegR5C5BElBLq7Hp17UxMKmeAMZ92zGr91
	nIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B4whm+C293rVzkunODEeLxwk73TdkKmVFdzg6C+13ow=;
	b=mAvRvpFxvufW+hsmL/YBJ1gwKOGDV9aGyL/nfADbSXkKjOz0UF09nysXXjspyu5XwK
	/DGrugNqHBou7Wh4IffHuJpDB89d6Bp1iLrV3aOfONMH1wZoFVTt3v5g0+eYZ0twr/Vi
	e7DY+UX1tWfFvAEihApe7qnG6GlW86yTXR2/EMWK7rMNzBh2NaB27hbjMhgfZphupbsu
	W3e0+ZxeWMihAa0ShVlKhg+y5DA95Lg2fkX8nlJgE+cc3YxzicVKWTkqwWn9qeqOEgH3
	uQAjtSRWik/e5PJCIRXrIh4C1D67wlur83x16C7SwmjFJqWfqcqkVzA8aJYdwUxixzkC
	BrWQ==
X-Gm-Message-State: AIVw113RBDvnFT6/f+VSzyK2XwpCiqXBdt5SeLioyrT9OUIchMKNsKiJ
	pnglii3bECQjcQIarNEOIhvBmlaFDS99
X-Received: by 10.55.79.145 with SMTP id d139mr8970769qkb.32.1499762217393;
	Tue, 11 Jul 2017 01:36:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Tue, 11 Jul 2017 01:36:36 -0700 (PDT)
In-Reply-To: <1499352038-27144-1-git-send-email-liu.ming50@gmail.com>
References: <1499352038-27144-1-git-send-email-liu.ming50@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jul 2017 09:36:36 +0100
Message-ID: <CAJTo0LZaTP--5JmZN6=0Of5W3Cepx3HDT=+3WrjyuUBUvhmC8w@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image-mklibs.bbclass: add a missing dependency
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
X-List-Received-Date: Tue, 11 Jul 2017 08:36:56 -0000
Content-Type: multipart/alternative; boundary="001a114a7efe37323b0554069a47"

--001a114a7efe37323b0554069a47
Content-Type: text/plain; charset="UTF-8"

On 6 July 2017 at 15:40, <liu.ming50@gmail.com> wrote:

> ${HOST_PREFIX}readelf is being called in mklibs_optimize_image_doit, so
> do_rootfs should depend on
> virtual/${MLPREFIX}${TARGET_PREFIX}binutils:do_populate_sysroot.
>

I think this was responsible for my latest autobuilder run failing:

ERROR: Nothing PROVIDES 'virtual/none-poky-none-binutils'. Close matches:
  virtual/aarch64-poky-linux-binutils
Missing or unbuildable dependency chain was: ['core-image-minimal',
'uninative-tarball', 'virtual/none-poky-none-binutils']

Ross

--001a114a7efe37323b0554069a47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 July 2017 at 15:40,  <span dir=3D"ltr">&lt;<a href=3D"mailto:liu.ming5=
0@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204)=
;padding-left:1ex"><div id=3D"gmail-:2wv" class=3D"gmail-a3s gmail-aXjCH gm=
ail-m15d1858eafd27439">${HOST_PREFIX}readelf is being called in mklibs_opti=
mize_image_doit, so<br>
do_rootfs should depend on<br>
virtual/${MLPREFIX}${TARGET_<wbr>PREFIX}binutils:do_populate_<wbr>sysroot.<=
br></div></blockquote></div><br>I think=C2=A0this was responsible for my la=
test autobuilder run failing:<br><br>ERROR: Nothing PROVIDES &#39;virtual/n=
one-poky-none-binutils&#39;. Close matches:<br>=C2=A0 virtual/aarch64-poky-=
linux-binutils<br>Missing or unbuildable dependency chain was: [&#39;core-i=
mage-minimal&#39;, &#39;uninative-tarball&#39;, &#39;virtual/none-poky-none=
-binutils&#39;]</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a114a7efe37323b0554069a47--
