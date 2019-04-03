Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 907617D38D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 17:02:41 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id g1so10614939qki.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 10:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=meD1k8JjqCaO71+Xv1K8dIslmjsIdzKVodr4jlP2VlU=;
	b=oTicd3FXloXXdHvb1is2uEhHyl+DVsx4nhytUQnk216szU4meWdC3zBKQzDyZjBr8V
	bGFpUiXrG30+ezs347QN5hOEuKRgx08zMiAlf9/VjRLluf+SElusKoNXv8kX7DJq9jpb
	GJQ3UphjCG0JO/PCRCEs2VdtNDy8UmILjzDVfgcSLMfBsPIiZQ7B1D0HdwwA+n8MFzP8
	QphtVch2YKzLy8cJCAVrMZOaYVUjayvm+Z8SONs6YNFYyusuOpoBDb505MDG47r3yE5d
	RUeWITtQXRD3+yelFvoYIz9+Yr3Bm1MZO4A2Gc8mCSKIBcgYYXyMo00kvc5xq3nJBx2u
	LfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=meD1k8JjqCaO71+Xv1K8dIslmjsIdzKVodr4jlP2VlU=;
	b=BjyWYhgwUBQ0J1Ltq1hA0t5/A9nD14gDwsR78IPX1639eGRbiP3g9ml1N/G6MSEmeI
	azG5EUibc9vlqEaaP22dnxeMwBNMLNKwNjyi5Kicxmr9UnR4ExQ3zR2FPZcsJYRTe/Iw
	2Pr7Qi7KqzXiTuzctF/OWvYittCIL/M41c5am3tvLa5pIIB3zs4fN0iyn/7+vLoYBArn
	HAh0uv74YlWKSkrqm2piXKmcPe17sY7aTeTHa5z4N237cTBSyz8UbNykROyoWzcoFuaL
	+DLR23QrY0FZmSaNZrJoTI0/qYG/kAJrWlJYmm45nxJmN+/L+kGqlkuXLLdi64PDYmqi
	iT1A==
X-Gm-Message-State: APjAAAWMtmN04pQ3mzkbDgpjy4u/0I3HQ5qCMi/bjiRqUHKiz7U6qXov
	I5ZynFIerbdSXyQV68+hxSbSFwrIPXzGam1rc3Y=
X-Google-Smtp-Source: APXvYqzjbrC6IG70XDPgARGFzhKOH6f1ua56QH3PzpMIUESvCWxzulF4+NFYJDnbH/hJ2STG1DVSWpT0dzhX+HpFhjo=
X-Received: by 2002:a37:b587:: with SMTP id e129mr965744qkf.145.1554310962206; 
	Wed, 03 Apr 2019 10:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190403053702.10672-1-nathan@nathanrossi.com>
	<355BE46A91031048906B695426A8D8E62EA2ECD4@DENBGAT9EL2MSX.ww902.siemens.net>
In-Reply-To: <355BE46A91031048906B695426A8D8E62EA2ECD4@DENBGAT9EL2MSX.ww902.siemens.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Apr 2019 10:02:16 -0700
Message-ID: <CAMKF1spfUupA_BL1s7Aim+UsBK4anGFPpdsnQhyH18CVdmo-pw@mail.gmail.com>
To: "Bach, Pascal" <pascal.bach@siemens.com>
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
X-List-Received-Date: Wed, 03 Apr 2019 17:02:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 3, 2019 at 2:26 AM Bach, Pascal <pascal.bach@siemens.com> wrote:
>
> >
> > Enable the building of the curses based ui for cmake. This depends on
> > ncurses.
>
> I think this is acceptable. It might also be useful for people wanting to use ccmake inside an SDK.
>

Adding dependencies do serialize builds and might have penalty on
build time, better is to turn this into a packageconfig
option and keep it disabled by default.

> > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > ---
> > This patch suggests enabling this in the cmake-native recipe, however this
> > might be undesirable for bootstrapping reasons. Whilst ccmake is not used
> > normally the added dependency on ncurses is likely required for other parts
> > of the build so impact on build ordering and time should be relatively
> > minimal.
> >
> > Changes in v2:
> > - None
> > ---
> >  meta/recipes-devtools/cmake/cmake-native_3.14.0.bb | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > index fedcf3d4bd..b2952ee5f5 100644
> > --- a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > +++ b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> > @@ -1,7 +1,7 @@
> >  require cmake.inc
> >  inherit native
> >
> > -DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native
> > curl-native"
> > +DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native
> > curl-native ncurses-native"
> >
> >  SRC_URI += "file://OEToolchainConfig.cmake \
> >              file://environment.d-cmake.sh \ @@ -13,10 +13,9 @@ SRC_URI +=
> > "file://OEToolchainConfig.cmake \  B = "${WORKDIR}/build"
> >  do_configure[cleandirs] = "${B}"
> >
> > -# Disable ccmake since we don't depend on ncurses  CMAKE_EXTRACONF =
> > "\
> >      -DCMAKE_LIBRARY_PATH=${STAGING_LIBDIR_NATIVE} \
> > -    -DBUILD_CursesDialog=0 \
> > +    -DBUILD_CursesDialog=1 \
> >      -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
> >      -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 \
> >      -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=0 \
> > ---
> > 2.20.1
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

