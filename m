Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id E61A378E25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 20:20:27 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id m13-v6so3309178qth.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 13:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MB1+WQKeZWFLFKNEdoGpFdxgXyBntEI0VNBdTa0lmK8=;
	b=Mjcohy4I8OSLnzFCXTdqraPKdm7jLy0oO3s5IiqK8TPZCaBxgmkb4qIcSPH9MIuOX0
	CdUFWSeQ0A1XxjAumgtzZM+jw7Yi0iAX6egLuGg0X9a7aOEi9x/45sUm2TvSfrNb0swF
	CguUSQLq+/9OHUc7Lwv6jKYPFKxXwvvAIvvUsKPXrikUTNpEnKFWEN4+2kKMezbUrWqS
	nupasYo9cjfskOmip2P5js8gHg74fAv9A2XPazb5zLLoEFALkfLctRuR8NMHr+k7eRFK
	JV6BGLzw2kx7aFxAxJY3sSkp/W6Nb7PY3UErTqzNfQuVX9XLjIvr766nIQMbbvXKwcn+
	CtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MB1+WQKeZWFLFKNEdoGpFdxgXyBntEI0VNBdTa0lmK8=;
	b=j62+J47GMAdOFXO4F3K7C5RsH8NOvpkBH5eNf+wBUqcA0+Ow15dfV6Qxj8RCX4Vv8A
	jxkVfuCqQTolBSKr4lvPZ/Fl3NVaPCHAF5460alIdzNs/534taaOKoBHiS3Ozr16Yzyl
	+csSSDJqjxr6E5HNyiAYAU4or0Di5vCy6dJl3bJd0JXblVzy4Sydo8sRh9aRGW7+jYYR
	aHPoU4y/3mFZMsxJ0hrqZtfh18iYl8TPSWMBVJEQoFyNQTUI2WeVY0knHDd5oLPBrkPx
	kHV2juMcsAMWK7U2nIX8a/ywKto50mdtim/2ru7rnbZofV+czURYhx1PWjEYfykJCUUi
	/B+Q==
X-Gm-Message-State: APzg51C5UQUSO+bD6Zwhrt/kiP2acUzRummIoYG7gPDGm/pPHgL2h028
	T5vyxQMj6RAtXZTpEM+E86QjFWdEGpon5EJ5w1k=
X-Google-Smtp-Source: ANB0VdZVxVfJSMYzP7cLf+znLEQ93TEb5AHiz6BtuM1Wie92Co8YDJflTMZbjVF5fZa7uW3zCrc4l3E63pkByLu1FWg=
X-Received: by 2002:aed:3848:: with SMTP id
	j66-v6mr3516118qte.218.1535487628384; 
	Tue, 28 Aug 2018 13:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1534791421.git.raj.khem@gmail.com>
	<011962bd47ca60969fa50a3e890adadd6bddc487.1534791421.git.raj.khem@gmail.com>
	<CALbNGRRN0gjg4VTu4mPh726Q6JyCf4BCmv32mDuVaJ5BtNxpjg@mail.gmail.com>
	<CAMKF1so_wuCSh7uo=QOJvmxPSDX=OW-hwiV6KCuMVjHi6Aw0FQ@mail.gmail.com>
	<CALbNGRRO4A6dpuncayo0L45G6nbsWq67XeJ_4J-FoXG08AUXXw@mail.gmail.com>
	<CALbNGRRLYCYB7YqW5x1PYsUqYVw0zoorw9CYOmR=Tj+d-pg_bw@mail.gmail.com>
	<CAMKF1spHi-Vi_rs3oRsqx0xjxfbCjW6WpeCvcs5HPdGDGKuUEg@mail.gmail.com>
	<CALbNGRQNt-tTK=dSOT1Xi=waufsFOiDLNNPu9HwyVa6RAYp=3g@mail.gmail.com>
In-Reply-To: <CALbNGRQNt-tTK=dSOT1Xi=waufsFOiDLNNPu9HwyVa6RAYp=3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Aug 2018 13:20:02 -0700
Message-ID: <CAMKF1sozJp8fyw6ShFE+ByQJR3RGrW1NORDTDn3gUyrVsKHUMQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] mesa: Enable gallium-llvm on x86 and x86_64
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
X-List-Received-Date: Tue, 28 Aug 2018 20:20:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas
On Tue, Aug 28, 2018 at 11:28 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Tue, Aug 28, 2018 at 7:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > Hi Andreas
> >
> > On Tue, Aug 28, 2018 at 10:21 AM Andreas M=C3=BCller <schnitzeltony@gma=
il.com> wrote:
> >>
> >> On Tue, Aug 28, 2018 at 8:43 AM, Andreas M=C3=BCller <schnitzeltony@gm=
ail.com> wrote:
> >> > On Tue, Aug 28, 2018 at 12:55 AM, Khem Raj <raj.khem@gmail.com> wrot=
e:
> >> >> On Mon, Aug 27, 2018 at 2:15 PM Andreas M=C3=BCller <schnitzeltony@=
gmail.com> wrote:
> >> >>>
> >> >>> On Mon, Aug 20, 2018 at 8:59 PM, Khem Raj <raj.khem@gmail.com> wro=
te:
> >> >>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> >>> > ---
> >> >>> >  meta/recipes-graphics/cairo/cairo.inc | 3 ++-
> >> >>> >  meta/recipes-graphics/mesa/mesa.inc   | 3 +++
> >> >>> >  2 files changed, 5 insertions(+), 1 deletion(-)
> >> >>> >
> >> >>> > diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipe=
s-graphics/cairo/cairo.inc
> >> >>> > index 20e0d2c92a..7347f223ff 100644
> >> >>> > --- a/meta/recipes-graphics/cairo/cairo.inc
> >> >>> > +++ b/meta/recipes-graphics/cairo/cairo.inc
> >> >>> > @@ -22,7 +22,8 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrende=
r libxext"
> >> >>> >  DEPENDS =3D "libpng fontconfig pixman glib-2.0 zlib"
> >> >>> >
> >> >>> >  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x=
11', 'x11 xcb', '', d)} \
> >> >>> > -           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)=
}"
> >> >>> > +           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)=
} \
> >> >>> > +           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl'=
, 'opengl', '', d)}"
> >> >>> >
> >> >>> >  PACKAGECONFIG[x11] =3D "--with-x=3Dyes -enable-xlib,--with-x=3D=
no --disable-xlib,${X11DEPENDS}"
> >> >>> >  PACKAGECONFIG[xcb] =3D "--enable-xcb,--disable-xcb,libxcb"
> >> >>> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-=
graphics/mesa/mesa.inc
> >> >>> > index 5afd0db4b7..dd626d9f00 100644
> >> >>> ^ I think this came in accidentaly and it breaks builds when addin=
g
> >> >>> packageconfig glesv2:
> >> >>>
> >> >>> | configure: error: use either --enable-gl=3Dyes or --enable-glesv=
2=3Dyes.
> >> >>> Not both at the same time.
> >> >>
> >> >> do you remove opengl from DISTRO_FEATURES when enabling glesv2 ?
> >> >> try that out.
> >> >>
> >> >>>
> >> > Yes of course I can. But this patch is wrong - we don't have gles as
> >> > distro feature - and it is not even mentioned in commit message why
> >> > this is done.
> >> >
> >> I am tempted to send a revert for the cairo part:
> >>
> >> * Cross: It changes defaults valid for long time
> >> * Native: As far as I can remember it causes trouble for cairo-native
> >> * It went through without mentioning
> >
> > opengl as a DISTRO_FEATURE should tie into packageconfigs, the
> > situation before this patch was not ideal, people got to work with it.
> >
> > as seen in the example you cited, we can't mix opengl and gles support
> > in packages. other layers have solved your kind of usecase like below
> >
> > https://github.com/WebPlatformForEmbedded/meta-wpe/blob/master/recipes-=
graphics/cairo/cairo_%.bbappend
> * ^The link is broken

ah see cairo bbappend here
https://github.com/WebPlatformForEmbedded/meta-wpe/tree/master/recipes-grap=
hics/cairo

> * Am quite sure that it breaks cairo-native or dependants (have no
> logs at hand - it is some time ago)
> * Again: I consider this a major change and it was not even
> mentioned/discussed. To me it has nothing to do with 'mesa: Enable
> gallium-llvm on x86 and x86_64' - btw: what does that fix?
>

gallium is for enabling Gallium llvmpipe driver as rasterizer using llvm IR
code generator.

> Let's close discussion here - I think after all these years here I am
> able to find a workaround in case of further issues. Thanks for
> support.
>
> Andreas

