Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id AD9C77F3DD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2019 15:10:24 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id d79so57050135qke.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2019 08:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N9kNF+sWnfdkemm9m4ZK9ZhK80KmfSUTJ5BvU9MAzy4=;
	b=dFil+gmIMHutBzZ0UhEhNgJ+WieFkeME6tVTD1a1DeP3MnOr59r069CYCfyTRB2LXc
	qxq9bAn8rw3rhsLd00WxAFUSXqZc89VnG8UTZujG2xNtKVRanarm9Xi0zzq9X6RUr3pm
	3OzrJkogyptMXynQ2KS88Eu2dN/rLgiWP8K5lzPWrBVbSC/AVX0LQkojEcmlqCYnC1Lo
	VxMeZAHGto7Ys60HFj7ecZnIXq6KrBAniwV7eff1YJ36HzRQe69nsjjp7Ea+Ybm8AbwO
	u2VTSw7n8jOm9oUCYG+SQfyd0ss4cr46L0qr5YxwwhNG89iO9+MOXCu3rEYhMwfgpQTZ
	EQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N9kNF+sWnfdkemm9m4ZK9ZhK80KmfSUTJ5BvU9MAzy4=;
	b=q3K5+Zb7v6ko0GozMKLRTugDkB7rVLJISLhqzdI56MvwOoLY0gNi5WnSc/aedpyRXN
	miqy4pdS1D8WDLLGmcqbKRWm8MiXuHK+Kj/7XtQhF0/i24EJXPG5aiTb4pPVSARc1Jo6
	Va2V3Hpy2mJhzr8ysfCHfyRyrG4H9Dk7G0smTrhk0JEqTQH6G6T8xw7KO5CRy1MF44Qd
	kHdz1D16ICpngYlCiFX5O6fKakaNBRLHHir+te30wlORUXG3K3cto69yw1TyWH7J4UUk
	7CSOOWKFp0GI3/nfF0F4T9LWE1SkLi/Nd1WCrDgQGkae5+heVDQbsFfu/exadzoQJkK3
	QO+Q==
X-Gm-Message-State: APjAAAW1Nbz4nQaJVDFDPCfLSzrjP7q1j1VTg3DuqPT+siqoorSn5Zel
	JO1DyEYY46OTVSxoWLeuLso36UlnKUWHoaEu7UhgalB59/I=
X-Google-Smtp-Source: APXvYqyKpg5qdu1BT+LYUcmNI4kmSACvvpV35MkptpL3gSF7Xi38eb9aG06K0W4NBrFTI2sAKQNwG6+yh3Jmckwj0xA=
X-Received: by 2002:a37:4243:: with SMTP id p64mr77679523qka.9.1564845025208; 
	Sat, 03 Aug 2019 08:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190731174820.16459-1-raj.khem@gmail.com>
	<20190731174820.16459-2-raj.khem@gmail.com>
	<232eed90aa6b376d8505d94f0b51e9352101fea7.camel@linuxfoundation.org>
	<CAMKF1so97t0zFsDB3PRaGaXD=VeTn8159WZojW29ctTEngyzYg@mail.gmail.com>
	<a8e8972184dcac7be154510d1ac49f38d5979d89.camel@linuxfoundation.org>
In-Reply-To: <a8e8972184dcac7be154510d1ac49f38d5979d89.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Aug 2019 08:10:08 -0700
Message-ID: <CAMKF1srDd=EMhwpJnAwamCj7s7FRuuq0dtT-NNergaPWbykyKA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] llvm: Update to 8.0.1
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
X-List-Received-Date: Sat, 03 Aug 2019 15:10:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 3, 2019 at 6:42 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2019-08-03 at 05:13 -0700, Khem Raj wrote:
> > Thanks for taking care of this I noticed this failure last night as
> > well
> >
> > On Sat, Aug 3, 2019 at 3:53 AM Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > On Wed, 2019-07-31 at 10:48 -0700, Khem Raj wrote:
> > > > Add missing dependency on libedit
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/recipes-devtools/llvm/llvm_git.bb | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-devtools/llvm/llvm_git.bb
> > > b/meta/recipes-
> > > > devtools/llvm/llvm_git.bb
> > > > index 0067635c2b..6d3d69b9fb 100644
> > > > --- a/meta/recipes-devtools/llvm/llvm_git.bb
> > > > +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> > > > @@ -8,7 +8,7 @@ SECTION = "devel"
> > > >
> > > >  LIC_FILES_CHKSUM =
> > > > "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
> > > >
> > > > -DEPENDS = "libffi libxml2 zlib ninja-native llvm-native"
> > > > +DEPENDS = "libffi libxml2 zlib libedit ninja-native llvm-native"
> > > >
> > > >  RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
> > > >
> > > > @@ -19,12 +19,12 @@ PROVIDES += "llvm${PV}"
> > > >  LLVM_RELEASE = "${PV}"
> > > >  LLVM_DIR = "llvm${LLVM_RELEASE}"
> > > >
> > > > -SRCREV = "d2298e74235598f15594fe2c99bbac870a507c59"
> > > > +SRCREV = "19a71f6bdf2dddb10764939e7f0ec2b98dba76c9"
> > > >
> > > >  BRANCH = "release/${MAJOR_VERSION}.x"
> > > >  MAJOR_VERSION = "8"
> > > >  MINOR_VERSION = "0"
> > > > -PATCH_VERSION = "0"
> > > > +PATCH_VERSION = "1"
> > >
> > > I had to tweak MESA_LLVM_RELEASE in the mesa recipe to match this
> > > change...
> > >
> > > (squashed into this patch in -next)
>
> Unfortunately there is still something else wrong:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/901
>

something meson ... I wonder, I will see if I can reproduce it here on
top of master-next

| llvm-config found: NO need '>= 7.0.0'
| Run-time dependency LLVM found: NO (tried config-tool)
|
| meson.build:1253:2: ERROR: Dependency "llvm" not found, tried config-tool


> Cheers,
>
> Richard
>

