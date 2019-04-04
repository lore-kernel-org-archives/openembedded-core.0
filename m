Return-Path: <nathan@nathanrossi.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 693A27D35C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 03:28:35 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z11so1199052wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 20:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WKvuQpZdr7ctD6YyCEMXtPFICKAdniW+2AFPq7Fzij4=;
	b=aSqjBFHu8Cyhph/PJShLjg4KFcAfTSUgBabNxHBKnB2YcdpdZG5V0Qkorcrg9HL2K8
	8Zb/kStAkhtDLMgJED3wvMFTiH2Ee/wIHPkTObs2Ak3f6JhldC6efeQ9sawBlWuRHqKS
	S9YxebwYMjk0S/L3ZhHmjTymPu1NRTDEBcgIFgmtujy2wdjNwfj2b/GfTyLtIgG82rJQ
	ICwsZAG40cLeBGtSY0cMh5XyJbmZRjsWAFiauGNc3ULFF5qCJvmzLvsABzLi7CoHe2e9
	1ppknn7UY+96ZPnU6459MiQ5gennagOSiOmAIwBvtvjA6vkhp8YQFyiu23TEkDqQWEze
	9WIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WKvuQpZdr7ctD6YyCEMXtPFICKAdniW+2AFPq7Fzij4=;
	b=NEY685/qPPB1aftUmE8jj/BLSSmZgFIVyVVzhmfZUnPSwzqzhYlM9UO6HOwDxEq+w8
	eCXBHNeb7EYo685/fSItYlD4BmUg1AqHkCnny14gWtuf2oqyaFlNWEVadVxu53iOSbUp
	bo+g7KGm6KGY9vNOJ5PlMqxzWeikikVDaR8N4Fm/GxnlVzn5rmME17MGSq8vFmVH4NrR
	NiVW7c6sBFkk2kYD8io5SB6vOWQDT7EHuXY9zfV/Yo1v19+15YzxqKTfxI6JPlqovprz
	CGSOv9COZAKppNP4lhBdYd6kHHsdyMfA8dal9l4u/U6NFkMC0be2l1vwerkML3Wz/rtv
	o3FQ==
X-Gm-Message-State: APjAAAWF6eF9F99LA7xwhAa2u6UBldY2yWxINr5ov9vZ8LMctWQZ9q9+
	qKww5R6aGZJEelr2dSpUne+r8CjdFYo+hFITMn+O9g==
X-Google-Smtp-Source: APXvYqzZAxCqMW5wyT8NoNBuezJhaGDm/6Hlfj/9Wih3HOzgLBwPF1aJ/33d3KpQe8tfXxDjz5BQyWiLfcjJ5B9mErc=
X-Received: by 2002:a7b:c111:: with SMTP id w17mr2221895wmi.6.1554348516051;
	Wed, 03 Apr 2019 20:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190403053702.10672-1-nathan@nathanrossi.com>
	<355BE46A91031048906B695426A8D8E62EA2ECD4@DENBGAT9EL2MSX.ww902.siemens.net>
	<CAMKF1spfUupA_BL1s7Aim+UsBK4anGFPpdsnQhyH18CVdmo-pw@mail.gmail.com>
In-Reply-To: <CAMKF1spfUupA_BL1s7Aim+UsBK4anGFPpdsnQhyH18CVdmo-pw@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Thu, 4 Apr 2019 13:28:24 +1000
Message-ID: <CA+aJhH3narCCOSiWCPPLvoxF3P5pCkCGo--tc2s6n2hyXrrPMQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 04 Apr 2019 03:28:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Apr 2019 at 03:02, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Apr 3, 2019 at 2:26 AM Bach, Pascal <pascal.bach@siemens.com> wrote:
> >
> > >
> > > Enable the building of the curses based ui for cmake. This depends on
> > > ncurses.
> >
> > I think this is acceptable. It might also be useful for people wanting to use ccmake inside an SDK.

Just to be clear, this change only affects cmake-native, the recipe
for target/nativesdk is unchanged. Although interestingly the cmake
(target/nativesdk) recipe already depends on ncurses (despite
disabling ccmake).

> >
>
> Adding dependencies do serialize builds and might have penalty on
> build time, better is to turn this into a packageconfig
> option and keep it disabled by default.

I can rework this patch to make it a PACKAGECONFIG option. However the
reason for enabling ccmake by default is due to the addition of the
ccmake bbclass in this series, which relies on having ccmake available
in the native sysroot. Having to override PACKAGECONFIG to use the
ccmake class seemed broken (since it is not particularly a distro
config).

I could not find a good example of this sort of requirement for
configuration for any other bbclass except for maybe
gobject-introspection (which relies on qemu-native configured
correctly to have linux-user for the target).

Another approach I considered to have this working without requiring
the user to setup PACKAGECONFIG would be to have a "ccmake-native"
recipe which built the ccmake binary. But this seemed like it would be
extra maintenance burden compared to this patch which has minimal
build time overhead.

Regards,
Nathan

>
> > > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > > ---
> > > This patch suggests enabling this in the cmake-native recipe, however this
> > > might be undesirable for bootstrapping reasons. Whilst ccmake is not used
> > > normally the added dependency on ncurses is likely required for other parts
> > > of the build so impact on build ordering and time should be relatively
> > > minimal.
> > >
> > > Changes in v2:
> > > - None
> > > ---
> > >  meta/recipes-devtools/cmake/cmake-native_3.14.0.bb | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > > b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > > index fedcf3d4bd..b2952ee5f5 100644
> > > --- a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > > +++ b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > > @@ -1,7 +1,7 @@
> > >  require cmake.inc
> > >  inherit native
> > >
> > > -DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native
> > > curl-native"
> > > +DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native
> > > curl-native ncurses-native"
> > >
> > >  SRC_URI += "file://OEToolchainConfig.cmake \
> > >              file://environment.d-cmake.sh \ @@ -13,10 +13,9 @@ SRC_URI +=
> > > "file://OEToolchainConfig.cmake \  B = "${WORKDIR}/build"
> > >  do_configure[cleandirs] = "${B}"
> > >
> > > -# Disable ccmake since we don't depend on ncurses  CMAKE_EXTRACONF =
> > > "\
> > >      -DCMAKE_LIBRARY_PATH=${STAGING_LIBDIR_NATIVE} \
> > > -    -DBUILD_CursesDialog=0 \
> > > +    -DBUILD_CursesDialog=1 \
> > >      -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
> > >      -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 \
> > >      -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=0 \
> > > ---
> > > 2.20.1
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

