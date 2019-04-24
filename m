Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9087D5AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 18:04:51 +0000 (UTC)
Received: by mail-it1-f177.google.com with SMTP id q19so7762134itk.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 11:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qTlrdcdbyD4PsIDUQKv1cS0NK3Np7UWOPhAub6dLgu0=;
	b=H5UVzPROezDcQKgQPCpV/eSFj9mVKvw1hzokmrqDteDMR5pMdLgeGNu4CGd0kM/mR1
	WPu/Uhzwlqf17T/NUT4w3c7BHVFxnEhsH20fABhOhQd/qZUEKOhvsD4z7NhwocGW8ste
	bvn+BCRChh291FReYAEPl2ICM6BefA1NB210vHh1PhCXPrQuTVe8bIFlW90QZUZDMSTV
	uOGsPfaBj/NMlRpDmmm9BM+4BBqSuAaJ0ghCJKIxTR+GJFzD6tTwfsKYkH/JV7n24mc2
	cya4boAhIgETyL5sG7xBRvorpyxjN0KUlXF3+c3XbsWPX4hkWKT3LZOuYv5nixVYP2TQ
	SOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qTlrdcdbyD4PsIDUQKv1cS0NK3Np7UWOPhAub6dLgu0=;
	b=de/ZCls45HdkTzsAQS7YyL3V/zDunBBoLOibFZEQFwX107pM8/UwdklXJA51mC/CRP
	PovHbcx6qbddQBZiG6uZQlUZo5Tmb1ynnUp7++myYOrW61fmVvXkcuUBOlaO6QAsZMJ1
	sb201HljhahiPe5PbzPuP3I2B/Mpi0RnYzPy/2+DWVBm0sP7pwMbTfgS0RprdftUe1wv
	YjPkWH7TltK0+OhGxzBAkZfQL9BhMxC17KkyfO9Elikcf+a3FEBG+p5ZVNTkEodckSj2
	AGuhj0cILS42y6RyeLk6XJw4YHty/F0DK03J6IZ2XaktOM54UdG6KzqEE25ACq3DmMlk
	56TQ==
X-Gm-Message-State: APjAAAVm3SMd2/s7c8BCSYOiqvqqxaZkIDIMIyrWVzJbim4ePZjyZvmi
	Pk/C9fliGHOJuMrm9dDK/eujPsvOlO0DkEBu5SZ1Xg==
X-Google-Smtp-Source: APXvYqxjRzy27sXxONGOixOLphTQXCY8FMdBIuP5ENx1lmNsGeAEwTuSkSiQ18QnX2zImt+raZZRTGgq+sNV91JvbpI=
X-Received: by 2002:a24:43c8:: with SMTP id s191mr257028itb.109.1556129092312; 
	Wed, 24 Apr 2019 11:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190424071955.22692-1-zangrc.fnst@cn.fujitsu.com>
	<CAJTo0LZJFLLtO7ZEX7SBUpo4T-=pSE++gKFdAAaTsd5iTZYefg@mail.gmail.com>
In-Reply-To: <CAJTo0LZJFLLtO7ZEX7SBUpo4T-=pSE++gKFdAAaTsd5iTZYefg@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Wed, 24 Apr 2019 15:04:34 -0300
Message-ID: <CAAPZna30Z1BydPm2YVr1VtWQf4VeK_ybK34+9Fs08O9fujMiqQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa:upgrade 19.0.1 -> 19.0.2
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
X-List-Received-Date: Wed, 24 Apr 2019 18:04:51 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Alex!

I'll rebase meson patch to work with this version.

On Wed, Apr 24, 2019 at 8:07 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> How did you even test this?
>
> ERROR: ParseError at
> /home/ross/Yocto/poky/meta/recipes-graphics/mesa/mesa-gl_19.0.1.bb:1:
> Could not include required file mesa_19.0.1.bb
>
> Ross
>
> On Wed, 24 Apr 2019 at 08:19, Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
> >
> > -Upgrade from mesa_19.0.1.bb to mesa_19.0.2.bb.
> >
> > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > ---
> >  meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.2.bb} | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.2.bb} (85%)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa_19.0.1.bb b/meta/recipes-graphics/mesa/mesa_19.0.2.bb
> > similarity index 85%
> > rename from meta/recipes-graphics/mesa/mesa_19.0.1.bb
> > rename to meta/recipes-graphics/mesa/mesa_19.0.2.bb
> > index d90be8a074..e6646e8503 100644
> > --- a/meta/recipes-graphics/mesa/mesa_19.0.1.bb
> > +++ b/meta/recipes-graphics/mesa/mesa_19.0.2.bb
> > @@ -7,8 +7,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> >             file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
> >  "
> >
> > -SRC_URI[md5sum] = "19636bb3da35c21f43040d31e575d5ce"
> > -SRC_URI[sha256sum] = "6884163c0ea9e4c98378ab8fecd72fe7b5f437713a14471beda378df247999d4"
> > +SRC_URI[md5sum] = "7f84af1c3fe2078c35a7a991d1469921"
> > +SRC_URI[sha256sum] = "1a2edc3ce56906a676c91e6851298db45903df1f5cb9827395a922c1452db802"
> >
> >  #because we cannot rely on the fact that all apps will use pkgconfig,
> >  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> > --
> > 2.20.1
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

