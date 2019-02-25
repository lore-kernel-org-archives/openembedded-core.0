Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 59B547CA61
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 12:52:35 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id g1so7663140otj.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 04:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3G6SqeMFx3oQStb0jEnky5x4Z+eMXBg1Bh6Fspm45d4=;
	b=P5zPVxoaKHuEGx4vMntksAAC5sYEWlOOkuKer133EgEdnyp3ic2dVQxHUPdt/CDGnP
	hFgqMgd2Wu2yRNfTf1kBaLLDI6n4YyiGkj5/KWGC3eHPZsr6hrhZpCVOnjlD5Z1gXmAh
	uNRJdcneiM26f94jCjTOCXEX6fLFMZjc6gKSQ4Ph2lQurKgMDSCiHOyVQudUBSD0ZhKH
	l/dS+z3X7/BZ/acmO5Xih7kBg3Lny7xgKMuRW4mk7hmsB75a60pqhwhFnMRSZevTOKN0
	06sPljW7ocDlP9iTLPBAlKNmirLrGnDEe82R4rNgp6TSF4p/McqCKTLM1E1n0D3cVtAn
	OCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3G6SqeMFx3oQStb0jEnky5x4Z+eMXBg1Bh6Fspm45d4=;
	b=k0TZFdO+Mje1zHBDB3vX7WwZSs8N/l070VTZEdmoB6XvCt4qjTpb+OL42gwG6vQGFo
	ZTllbO5TbITtmM21Fdza5rLj5n8Tx5hrGbVLAwZ7co+Cgmg5poDOTf4EkaHsXeIHIFq2
	VfPTWy/rP8shkle8aQ0twWOyTHCttrQxEL82VQQJPDdADEPTPAclIr43lAraQRpwBizk
	//2GII933TO5p8JUcgKp6TgjafNhpkghkks+VzYYAgyaJVoX8tTNjCqJqCYp9Eyxa8y/
	T2SMPEzU2Yf051sIsILsxIH14q+DVVwCewTh19SbP5PGXVSKuvR74MyHvOCOAnCMFm78
	nyHg==
X-Gm-Message-State: AHQUAubWv+XUYxwATv2BbrSeXNwCATs8fFBpuaboDbCZcxwDXpdsVbO5
	Gn5uiV/0IsnomiNHyQsSTxDyvtyZbyZ/avOfD4w=
X-Google-Smtp-Source: AHgI3IYuwAiitNkBV5lCXqTyRdocKVztCTvWUYB0DR2Vufkyo1SblD6EoCeHO4arxontLg85OYfVoEA3n+rjaIqJTbA=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr11278271otl.12.1551099156240; 
	Mon, 25 Feb 2019 04:52:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550845989.git.alex.kanavin@gmail.com>
	<296658f75576781b5e8f36c95bec204a65482af7.1550845989.git.alex.kanavin@gmail.com>
	<3cab827a44a031abbffa58de513230d100d5ebe4.camel@linuxfoundation.org>
In-Reply-To: <3cab827a44a031abbffa58de513230d100d5ebe4.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Feb 2019 13:52:25 +0100
Message-ID: <CANNYZj-egKt=s0SYG2NN3kV2LnPqg9Jb9UQ25LOGrLjhfZVQUg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/12] qemu: enable virglrenderer and glx options for native/nativesdk builds
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
X-List-Received-Date: Mon, 25 Feb 2019 12:52:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Feb 2019 at 12:02, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-02-22 at 15:33 +0100, Alexander Kanavin wrote:
> > Except for ming32/darwin, which do not support them.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-devtools/qemu/qemu.inc | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
> > devtools/qemu/qemu.inc
> > index c127434b020..95e9e0ede77 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -74,15 +74,15 @@ PACKAGECONFIG ??= " \
> >      fdt sdl kvm \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
> >  "
> > -PACKAGECONFIG_class-native ??= "fdt alsa kvm"
> > -PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
> > +PACKAGECONFIG_class-native ??= "fdt alsa kvm virglrenderer glx"
> > +PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
> >
> >  # Handle distros such as CentOS 5 32-bit that do not have kvm
> > support
> >  PACKAGECONFIG_class-native_remove = "${@'kvm' if not
> > os.path.exists('/usr/include/linux/kvm.h') else ''}"
> >
> > -# Disable kvm on targets that do not support it
> > -PACKAGECONFIG_remove_darwin = "kvm"
> > -PACKAGECONFIG_remove_mingw32 = "kvm"
> > +# Disable kvm/virgl/mesa on targets that do not support it
> > +PACKAGECONFIG_remove_darwin = "kvm virglrenderer glx gtk+"
> > +PACKAGECONFIG_remove_mingw32 = "kvm virglrenderer glx gtk+"
>
> Sorry, I just spotted this. Please don't use _remove in OE-Core. Can we
> rearrange this so we don't need to use remove?
>
> I appreciate there are other users that have crept in but I'd like to
> see them gone too...

I'm actually unsure how to override the
PACKAGECONFIG_append_pn-qemu-native = " gtk+"
set in local.conf without using _remove.

(we do not support gtk+ on mingw, and I guess darwin too).

We can rearrange this, enable/not enable gtk+ directly in the recipe,
and drop the qemu related lines from local.conf altogether, if you're
okay with that.

Alex

