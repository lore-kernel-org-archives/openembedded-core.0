Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id BCC656B6EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 22:36:38 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id p22-v6so4454631uao.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 15:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PUou3u8L1bLXdld3/P5QPP4oRddvMp439KRXzI5uS80=;
	b=In/WtlEgwTbo7976hzGpx55ZiaU6oRUlJpS6zU3pwhMV9BRSENFQ/nBvNay4KucoKd
	fSsPwIB+eN7ySCoxOR2e28FduHj+wcGaHODjlNEE1YdRA/9xPWnXpyxEdx8PJvyeAYQE
	Hyw23X9wFFcF487fY7C8I2r6ArO956SCSr7oMAeoDMYnMSI5wjXAk4MkDvBrYgNuzXs0
	crzf0qVruH6CgetJxwK3YmBR7543Uyj13uyTizMO5pLDYU8wfxllFibV4x/HavrYpTDN
	fhUh3KeSQYR1HV3z3WRalPeQn5AI1bkceyRk7YkMrZGhIBbjUEtIZ1uYkkUs2RVAD/sc
	Xbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PUou3u8L1bLXdld3/P5QPP4oRddvMp439KRXzI5uS80=;
	b=m05umZc05Q5jt4vpUsv1Sz0Pb8AtCvfcqNt/fOAR2p23Dptlmj/gEHZS0d/LIPjrQK
	hMIbyy7RNk4rm6MXu1hr0J/v3F0Se7fQu4ThoFJ3k9cASyZUqUsBmskmHkIMLl6uXPd9
	FudJkkqcte0uG88HgEvo0+iCt74a/OB7rRO4iJxnW3/D5vVdHIF34plOTSeDYhw68/Iy
	8z4AP5PdyusOT8li147WoSgD/1t3x96DlcduQkSJN7KjqVk9OEaz6EvT6ExVqSw+OV/3
	NN6d815sC4TKZIvZAAzX5/Vrx93XmnrC4WRGa3qPI2VP8HfLe8KtrZDwpuYVSABwFaEg
	8FIw==
X-Gm-Message-State: APt69E1oaOi+PmaPBwIcbs6yzgpEDZE37FGHl3jqLQ0fEvIGbp12ZTf8
	KTf3YH2Jcxd3zS+rFi2N6aqUmli+LWVp1Eavnps=
X-Google-Smtp-Source: AAOMgpfKxpwv74r2w91ati92cVXDStnqxVCXzXleQTva2vgAhb5Ac7P9fSCRrc2dB7qb5uVIm2AyhV0W2mGMSse312g=
X-Received: by 2002:ab0:50cd:: with SMTP id
	d13-v6mr16822378uaa.45.1531262199383; 
	Tue, 10 Jul 2018 15:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20180704001137.41385-1-raj.khem@gmail.com>
	<CAJTo0LY75OXe6AmZvdOkT2LRe58k9ZEzgYBtf_xbqnhu7waY=A@mail.gmail.com>
	<693877c1-05a2-85c0-3c42-97ab4b056fe0@gmail.com>
In-Reply-To: <693877c1-05a2-85c0-3c42-97ab4b056fe0@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Jul 2018 16:36:13 -0600
Message-ID: <CAMKF1spsrbBFj9RpDw6-x4031r8QXf+Dh4jhAwSQccb25GB9ww@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] mesa: Fix bild with waylang and egl
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
X-List-Received-Date: Tue, 10 Jul 2018 22:36:39 -0000
Content-Type: text/plain; charset="UTF-8"

ping
On Wed, Jul 4, 2018 at 10:31 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 7/4/18 9:28 AM, Burton, Ross wrote:
> > FWIW historically we just prepended PKG_CONFIG_SYSROOT or whatever the
> > spelling was to the result of the pkg-config calls.  I didn't know
> > about PKG_CHECK_VAR before, that's really useful!
> >
>
> indeed it is.
>
> > Have you tried pushing this upstream?
>
> No, not yet, PKG_CHECK_VAR would need pkgconfig 0.28+, for upstreaming
> we would need to account for that as well and also upstreaming has to
> agree to bumping minimum pkgconfig version to 0.28
>
> Also note that I've a branch
> > moving Mesa to Meson so we'll need to fix this again...
> >
> > Ross
> >
> > On 4 July 2018 at 01:11, Khem Raj <raj.khem@gmail.com> wrote:
> >> When we have wayland enabled with egl then it enables the wayland
> >> plugin which actually fails to build because its not finding wayland-protocol
> >> xml templates in proper location which is recipe sysroot since
> >> we are cross compiling
> >>
> >> Fixes build errors e.g.
> >> make[4]: *** No rule to make target `//usr/share/wayland-protocols/unstable/linux-dmabuf/linux-dmabuf-unstable-v1.xml', needed by `drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h'.  Stop.
> >> make[4]: *** Waiting for unfinished jobs....
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >> V2: Rebase on master
> >>
> >>   ...ss-compile-WAYLAND_PROTOCOLS_DATADIR.patch | 24 +++++++++++++++++++
> >>   meta/recipes-graphics/mesa/mesa.inc           |  2 ++
> >>   meta/recipes-graphics/mesa/mesa_18.1.3.bb     |  1 +
> >>   3 files changed, 27 insertions(+)
> >>   create mode 100644 meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch
> >>
> >> diff --git a/meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch b/meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch
> >> new file mode 100644
> >> index 0000000000..b4e3c4995f
> >> --- /dev/null
> >> +++ b/meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch
> >> @@ -0,0 +1,24 @@
> >> +use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DATADIR
> >> +
> >> +This allows to override the wayland-protocols pkgdatadir with the
> >> +WAYLAND_PROTOCOLS_DATADIR from environment.
> >> +
> >> +pkgconfig would return an absolute path in /usr/share/wayland-protocols
> >> +for the pkgdatadir value, which is not suitable for cross-compiling.
> >> +
> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +Upstream-Status: Pending
> >> +
> >> +Index: mesa-18.1.2/configure.ac
> >> +===================================================================
> >> +--- mesa-18.1.2.orig/configure.ac
> >> ++++ mesa-18.1.2/configure.ac
> >> +@@ -1808,7 +1808,7 @@ for plat in $platforms; do
> >> +         PKG_CHECK_MODULES([WAYLAND_CLIENT], [wayland-client >= $WAYLAND_REQUIRED])
> >> +         PKG_CHECK_MODULES([WAYLAND_SERVER], [wayland-server >= $WAYLAND_REQUIRED])
> >> +         PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED])
> >> +-        WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
> >> ++        PKG_CHECK_VAR([WAYLAND_PROTOCOLS_DATADIR], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED], pkgdatadir)
> >> +
> >> +         AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
> >> +
> >> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> >> index d1723e3506..fed2900577 100644
> >> --- a/meta/recipes-graphics/mesa/mesa.inc
> >> +++ b/meta/recipes-graphics/mesa/mesa.inc
> >> @@ -109,6 +109,8 @@ FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
> >>
> >>   CFLAGS_append_armv5 = " -DMISSING_64BIT_ATOMICS"
> >>
> >> +EXTRA_OEMAKE += "WAYLAND_PROTOCOLS_DATADIR=${STAGING_DATADIR}/wayland-protocols"
> >> +
> >>   # Remove the mesa dependency on mesa-dev, as mesa is empty
> >>   RDEPENDS_${PN}-dev = ""
> >>
> >> diff --git a/meta/recipes-graphics/mesa/mesa_18.1.3.bb b/meta/recipes-graphics/mesa/mesa_18.1.3.bb
> >> index c47c57e9d8..6af1216b79 100644
> >> --- a/meta/recipes-graphics/mesa/mesa_18.1.3.bb
> >> +++ b/meta/recipes-graphics/mesa/mesa_18.1.3.bb
> >> @@ -9,6 +9,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> >>              file://0006-Use-Python-3-to-execute-the-scripts.patch \
> >>              file://0007-dri-i965-Add-missing-time.h-include.patch \
> >>              file://0008-egl-fix-build-race-in-automake.patch \
> >> +           file://cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch \
> >>   "
> >>
> >>   SRC_URI[md5sum] = "b34273403a605f6f98ead00f0bdf8e0b"
> >> --
> >> 2.18.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core

