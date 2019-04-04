Return-Path: <nathan@nathanrossi.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 67EFF7D323
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 04:35:58 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g3so1724928wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 21:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=woJmYKpSZu92U5r8wqayHeyyauvAIKr6SWJWi3InppU=;
	b=CAxMCaU761VoIFpnDZgpLU1n08qwLvQklFcRigYy/CN4AJmlAwAKWeTEupZWIssUBQ
	aXvJ3ncxjTnIRrhB13ztHiwcTUqssxAnsEcFAr3HIrfFI7XBud/48FOhhw/YwcdylTgR
	4WKm9I8i8I13raCv9vKhJNI1MeHziMe0gn+gXN+3T/VqJftdCt7I0tZYf6c03A1nxzJd
	l28iFeOCosUQdtFryAMXBG9nwTHkHerRPdTxNc6K/K+Pk6dk35x7ZJpdEwEXhkJh50AT
	bvBDTX6dQdvW318jaX7fz2Nl8KftolVfdgLF3favNznqTnUR1cuH1ZUC6PZHHpIEsFpy
	1GJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=woJmYKpSZu92U5r8wqayHeyyauvAIKr6SWJWi3InppU=;
	b=ga3ni9Nu0v77mIXqZt7kb7oa3d6nU5nKZMEi1jsnrciHN3f76djcEHJQdlNCX6fhMk
	wTNirtjscOLDT6pwzjPY4nk2Ov6n3RlzJU8XpypqsKsiLMbNBFmIbPTy78oFqalDzEHD
	R3bKPYSMwL37nUFJwVIrjUuGdLUI4pEqxbQfp3W997YtvdrXfOaXfqo2HnsvVT3Ah4lO
	1Gg1JjsYE78Ceyt9v9akims0hcw9oUihO5TYUgQZe5BsmAkfqtlBRxtKOcrYgYY/6Hp/
	dLlAok9c5EkuPrV72VUqLclexEI2Q5JJizdTKhUy8/inxh6a00QqOXgdAH/cFdt597hM
	dFJg==
X-Gm-Message-State: APjAAAWXlI/3ZER3EFOdZn0shDYux5bEcBQ5VVu6MB6IWi4Za4v7m4BA
	vIE1yBoz6XYYVGE2ycYUubI2UCOhwVr7hfcaGExzRw==
X-Google-Smtp-Source: APXvYqxr6S3pJJ4uf5lVtKWx0CF7SAgSVGaHLlC2vMr5kqh/1x0RaSvojmf0EzpLt9C/j4Cmb7AlQnaNikIbPEU73K8=
X-Received: by 2002:adf:fa47:: with SMTP id y7mr2309393wrr.27.1554352559198;
	Wed, 03 Apr 2019 21:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190403053702.10672-1-nathan@nathanrossi.com>
	<355BE46A91031048906B695426A8D8E62EA2ECD4@DENBGAT9EL2MSX.ww902.siemens.net>
	<CAMKF1spfUupA_BL1s7Aim+UsBK4anGFPpdsnQhyH18CVdmo-pw@mail.gmail.com>
	<CA+aJhH3narCCOSiWCPPLvoxF3P5pCkCGo--tc2s6n2hyXrrPMQ@mail.gmail.com>
	<CAMKF1sqpzE5DMM-M3qbDG+Z9C=_bZm23++d9MLWsUPm9k+0SbQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqpzE5DMM-M3qbDG+Z9C=_bZm23++d9MLWsUPm9k+0SbQ@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Thu, 4 Apr 2019 14:35:46 +1000
Message-ID: <CA+aJhH0x40-RNdF61G-i+dY9kMA3w=sr9AnBEFhhARB8uYfdSw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] cmake-native: Enable ccmake by default and depend on ncurses
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
X-List-Received-Date: Thu, 04 Apr 2019 04:35:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Apr 2019 at 13:48, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Apr 3, 2019 at 8:28 PM Nathan Rossi <nathan@nathanrossi.com> wrote:
> >
> > On Thu, 4 Apr 2019 at 03:02, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Wed, Apr 3, 2019 at 2:26 AM Bach, Pascal <pascal.bach@siemens.com> wrote:
> > > >
> > > > >
> > > > > Enable the building of the curses based ui for cmake. This depends on
> > > > > ncurses.
> > > >
> > > > I think this is acceptable. It might also be useful for people wanting to use ccmake inside an SDK.
> >
> > Just to be clear, this change only affects cmake-native, the recipe
> > for target/nativesdk is unchanged. Although interestingly the cmake
> > (target/nativesdk) recipe already depends on ncurses (despite
> > disabling ccmake).
> >
> > > >
> > >
> > > Adding dependencies do serialize builds and might have penalty on
> > > build time, better is to turn this into a packageconfig
> > > option and keep it disabled by default.
> >
> > I can rework this patch to make it a PACKAGECONFIG option. However the
> > reason for enabling ccmake by default is due to the addition of the
> > ccmake bbclass in this series, which relies on having ccmake available
> > in the native sysroot. Having to override PACKAGECONFIG to use the
> > ccmake class seemed broken (since it is not particularly a distro
> > config).
> >
> > I could not find a good example of this sort of requirement for
> > configuration for any other bbclass except for maybe
> > gobject-introspection (which relies on qemu-native configured
> > correctly to have linux-user for the target).
> >
> > Another approach I considered to have this working without requiring
> > the user to setup PACKAGECONFIG would be to have a "ccmake-native"
> > recipe which built the ccmake binary. But this seemed like it would be
> > extra maintenance burden compared to this patch which has minimal
> > build time overhead.
> >
>
> this seems fine, if the number of recipes needing this bbclass are far less than
> one the needing cmake bbclass.

Just to clarify, are you suggesting that making a ccmake-native recipe
would be fine? Or that requiring the PACKAGECONFIG setup would be
acceptable/preferred?

Thanks,
Nathan

>
> > Regards,
> > Nathan
> >
> > >
> > > > > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > > > > ---
> > > > > This patch suggests enabling this in the cmake-native recipe, however this
> > > > > might be undesirable for bootstrapping reasons. Whilst ccmake is not used
> > > > > normally the added dependency on ncurses is likely required for other parts
> > > > > of the build so impact on build ordering and time should be relatively
> > > > > minimal.
> > > > >
> > > > > Changes in v2:
> > > > > - None
> > > > > ---
> > > > >  meta/recipes-devtools/cmake/cmake-native_3.14.0.bb | 5 ++---
> > > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > > > > b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > > > > index fedcf3d4bd..b2952ee5f5 100644
> > > > > --- a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > > > > +++ b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > > > > @@ -1,7 +1,7 @@
> > > > >  require cmake.inc
> > > > >  inherit native
> > > > >
> > > > > -DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native
> > > > > curl-native"
> > > > > +DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native
> > > > > curl-native ncurses-native"
> > > > >
> > > > >  SRC_URI += "file://OEToolchainConfig.cmake \
> > > > >              file://environment.d-cmake.sh \ @@ -13,10 +13,9 @@ SRC_URI +=
> > > > > "file://OEToolchainConfig.cmake \  B = "${WORKDIR}/build"
> > > > >  do_configure[cleandirs] = "${B}"
> > > > >
> > > > > -# Disable ccmake since we don't depend on ncurses  CMAKE_EXTRACONF =
> > > > > "\
> > > > >      -DCMAKE_LIBRARY_PATH=${STAGING_LIBDIR_NATIVE} \
> > > > > -    -DBUILD_CursesDialog=0 \
> > > > > +    -DBUILD_CursesDialog=1 \
> > > > >      -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
> > > > >      -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 \
> > > > >      -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=0 \
> > > > > ---
> > > > > 2.20.1
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-core mailing list
> > > > > Openembedded-core@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

