Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4FAB07D397
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 03:48:05 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id c189so807848qke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 20:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GK/1RP1ybwGxxlnEK7OGzq2qNxoop5G/ALkAxF9smhk=;
	b=HfUhlXV9vKvISKML5u3EQ/JDXPoLrUmseVfETERreZQTMPHRQKbINhYSC7NsgZoE0+
	MjFhj6ELppYi69yQDbgufPEZsj1RQ4EPA4/soJ9Cpryh2caKVo90l6CjUp6rcyfNtKim
	BZCOKX1ri6c7Z31zH/zOVMdOgKWQETQpD8tLterNfG+U+tt+7UBtW7D6/Zcs3p2p57z1
	LizoRCRs/oI+Y3axXWXi3AExu66W/76XbVI5ayLzKPjhrv9oXqNkGxb93dtm63N52pqs
	pViianc6walxGWGJDlSlKSXQZD312xFDAduQzSI6jBVVV1dUXHZCgX3fwl/T+/bQuMCs
	dNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GK/1RP1ybwGxxlnEK7OGzq2qNxoop5G/ALkAxF9smhk=;
	b=VHJLw1pign1pWfmPeDGnYA78ggtTAunB5PYMq0wOfaWAJH1WzG5jZ3w0dukdy1/wIF
	hsy9ZV+e4GmbzkJVJzSemi6hURuqGN21cfV2LuK849WIGXof7hf2DoZheQ62wz4V+Hxg
	K3Lc1XEkKwnHuh8+NjJ3zH6ZCnna+y3sNjf4xkJrRz0IxQB4PISINTlU8RE/I6499xYr
	+eeGW7FrAFdlt7oSxMYwQbl2voJ2i1DlFaHy1sBVLpgK6ye4RE8MyS8Ao4qZhBioLm3E
	cJlvXTVDK+uBtacGd0uVeD3B0XGUAkMh8iAOTrr69A+fvvvxDDILh/WFba31DcWz5Nlg
	MNsw==
X-Gm-Message-State: APjAAAUgcvjaTIkCBA0zOPTa0yIZydgfFe46/xM9g8h/UHXnEXip/N+R
	SB9xYLEB8rmB/db9WY7vqetLUQW5t/vLbZxZ7KU=
X-Google-Smtp-Source: APXvYqz+2txvrqfIrEEFXsIAMcK90H/sx4keHhY2bL5XCTmAZPQrqo7cTnVNw6ui4rHNTsGw2eNi57r9st5MoGeePcQ=
X-Received: by 2002:a37:7b02:: with SMTP id w2mr3073050qkc.225.1554349685163; 
	Wed, 03 Apr 2019 20:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190403053702.10672-1-nathan@nathanrossi.com>
	<355BE46A91031048906B695426A8D8E62EA2ECD4@DENBGAT9EL2MSX.ww902.siemens.net>
	<CAMKF1spfUupA_BL1s7Aim+UsBK4anGFPpdsnQhyH18CVdmo-pw@mail.gmail.com>
	<CA+aJhH3narCCOSiWCPPLvoxF3P5pCkCGo--tc2s6n2hyXrrPMQ@mail.gmail.com>
In-Reply-To: <CA+aJhH3narCCOSiWCPPLvoxF3P5pCkCGo--tc2s6n2hyXrrPMQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Apr 2019 20:47:39 -0700
Message-ID: <CAMKF1sqpzE5DMM-M3qbDG+Z9C=_bZm23++d9MLWsUPm9k+0SbQ@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
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
X-List-Received-Date: Thu, 04 Apr 2019 03:48:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 3, 2019 at 8:28 PM Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> On Thu, 4 Apr 2019 at 03:02, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Apr 3, 2019 at 2:26 AM Bach, Pascal <pascal.bach@siemens.com> wrote:
> > >
> > > >
> > > > Enable the building of the curses based ui for cmake. This depends on
> > > > ncurses.
> > >
> > > I think this is acceptable. It might also be useful for people wanting to use ccmake inside an SDK.
>
> Just to be clear, this change only affects cmake-native, the recipe
> for target/nativesdk is unchanged. Although interestingly the cmake
> (target/nativesdk) recipe already depends on ncurses (despite
> disabling ccmake).
>
> > >
> >
> > Adding dependencies do serialize builds and might have penalty on
> > build time, better is to turn this into a packageconfig
> > option and keep it disabled by default.
>
> I can rework this patch to make it a PACKAGECONFIG option. However the
> reason for enabling ccmake by default is due to the addition of the
> ccmake bbclass in this series, which relies on having ccmake available
> in the native sysroot. Having to override PACKAGECONFIG to use the
> ccmake class seemed broken (since it is not particularly a distro
> config).
>
> I could not find a good example of this sort of requirement for
> configuration for any other bbclass except for maybe
> gobject-introspection (which relies on qemu-native configured
> correctly to have linux-user for the target).
>
> Another approach I considered to have this working without requiring
> the user to setup PACKAGECONFIG would be to have a "ccmake-native"
> recipe which built the ccmake binary. But this seemed like it would be
> extra maintenance burden compared to this patch which has minimal
> build time overhead.
>

this seems fine, if the number of recipes needing this bbclass are far less than
one the needing cmake bbclass.

> Regards,
> Nathan
>
> >
> > > > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > > > ---
> > > > This patch suggests enabling this in the cmake-native recipe, however this
> > > > might be undesirable for bootstrapping reasons. Whilst ccmake is not used
> > > > normally the added dependency on ncurses is likely required for other parts
> > > > of the build so impact on build ordering and time should be relatively
> > > > minimal.
> > > >
> > > > Changes in v2:
> > > > - None
> > > > ---
> > > >  meta/recipes-devtools/cmake/cmake-native_3.14.0.bb | 5 ++---
> > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > > > b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > > > index fedcf3d4bd..b2952ee5f5 100644
> > > > --- a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > > > +++ b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > > > @@ -1,7 +1,7 @@
> > > >  require cmake.inc
> > > >  inherit native
> > > >
> > > > -DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native
> > > > curl-native"
> > > > +DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native
> > > > curl-native ncurses-native"
> > > >
> > > >  SRC_URI += "file://OEToolchainConfig.cmake \
> > > >              file://environment.d-cmake.sh \ @@ -13,10 +13,9 @@ SRC_URI +=
> > > > "file://OEToolchainConfig.cmake \  B = "${WORKDIR}/build"
> > > >  do_configure[cleandirs] = "${B}"
> > > >
> > > > -# Disable ccmake since we don't depend on ncurses  CMAKE_EXTRACONF =
> > > > "\
> > > >      -DCMAKE_LIBRARY_PATH=${STAGING_LIBDIR_NATIVE} \
> > > > -    -DBUILD_CursesDialog=0 \
> > > > +    -DBUILD_CursesDialog=1 \
> > > >      -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
> > > >      -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 \
> > > >      -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=0 \
> > > > ---
> > > > 2.20.1
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

