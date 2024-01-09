Return-Path: <sam.van.den.berge@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F54EC46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 09:34:59 +0000 (UTC)
Subject: Re: [PATCH] gstreamer1.0-plugins-good: Provide Qt6 option for qmlgl
To: openembedded-core@lists.openembedded.org
From: "Sam Van Den Berge" <sam.van.den.berge@gmail.com>
X-Originating-Location: Ixelles-Elsene, Brussels Capital, BE (81.246.50.154)
X-Originating-Platform: Windows Chrome 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 09 Jan 2024 01:34:57 -0800
References: <c6b52856-a5c8-42ef-66f2-a5c422ee77db@kde.org>
In-Reply-To: <c6b52856-a5c8-42ef-66f2-a5c422ee77db@kde.org>
Message-ID: <28934.1704792897679047991@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 09:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193447

On Mon, Oct  9, 2023 at 08:26 PM, Andreas Cord-Landwehr wrote:

>
>=20
> On 05.10.23 23:14, Khem Raj wrote:
> > On Thu, Oct 5, 2023 at 12:27=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >>
> >> On Thu, 2023-10-05 at 21:22 +0200, Andreas Cord-Landwehr wrote:
> >>> On 04.10.23 20:42, Richard Purdie wrote:
> >>>> On Wed, 2023-10-04 at 20:19 +0200, Andreas Cord-Landwehr wrote:
> >>>>> On 04.10.23 20:10, Khem Raj wrote:
> >>>>>> On Wed, Oct 4, 2023 at 9:09=E2=80=AFAM Andreas Cord-Landwehr
> >>>>>> <cordlandwehr@kde.org> wrote:
> >>>>>>>
> >>>>>>> Gstreamer release 1.22.0 introduced option for Qt6 API.
> >>>>>>>
> >>>>>>> Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
> >>>>>>> ---
> >>>>>>>     .../gstreamer/gstreamer1.0-plugins-good_1.22.5.bb      | 10
> ++++++++--
> >>>>>>>     1 file changed, 8 insertions(+), 2 deletions(-)
> >>>>>>>
> >>>>>>> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
> >>>>>>> index 93f0e76ee9..ca1e1d6046 100644
> >>>>>>> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
> >>>>>>> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
> >>>>>>> @@ -35,7 +35,7 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender
> libxfixes libxdamage"
> >>>>>>>     X11ENABLEOPTS =3D "-Dximagesrc=3Denabled -Dximagesrc-xshm=3De=
nabled
> -Dximagesrc-xfixes=3Denabled -Dximagesrc-xdamage=3Denabled"
> >>>>>>>     X11DISABLEOPTS =3D "-Dximagesrc=3Ddisabled -Dximagesrc-xshm=
=3Ddisabled
> -Dximagesrc-xfixes=3Ddisabled -Dximagesrc-xdamage=3Ddisabled"
> >>>>>>>
> >>>>>>> -QT5WAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES",
> "wayland", "qtwayland", "", d)}"
> >>>>>>> +QTWAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES",
> "wayland", "qtwayland", "", d)}"
> >>>>>>>
> >>>>>>>     PACKAGECONFIG[asm]        =3D
> "-Dasm=3Denabled,-Dasm=3Ddisabled,nasm-native"
> >>>>>>>     PACKAGECONFIG[bz2]        =3D "-Dbz2=3Denabled,-Dbz2=3Ddisabl=
ed,bzip2"
> >>>>>>> @@ -52,7 +52,8 @@ PACKAGECONFIG[libpng]     =3D
> "-Dpng=3Denabled,-Dpng=3Ddisabled,libpng"
> >>>>>>>     PACKAGECONFIG[libv4l2]    =3D
> "-Dv4l2-libv4l2=3Denabled,-Dv4l2-libv4l2=3Ddisabled,v4l-utils"
> >>>>>>>     PACKAGECONFIG[mpg123]     =3D
> "-Dmpg123=3Denabled,-Dmpg123=3Ddisabled,mpg123"
> >>>>>>>     PACKAGECONFIG[pulseaudio] =3D
> "-Dpulse=3Denabled,-Dpulse=3Ddisabled,pulseaudio"
> >>>>>>> -PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,=
qtbase
> qtdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
> >>>>>>> +PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,=
qtbase
> qtdeclarative qtbase-native ${QTWAYLANDDEPENDS}"
> >>>>>>> +PACKAGECONFIG[qt6]        =3D "-Dqt6=3Denabled,-Dqt6=3Ddisabled,=
qtbase
> qtdeclarative qtbase-native qttools-native ${QTWAYLANDDEPENDS}"
> >>>>>>>     PACKAGECONFIG[soup2]      =3D "-Dsoup=3Denabled,,libsoup-2.4,=
,,soup3"
> >>>>>>>     PACKAGECONFIG[soup3]      =3D "-Dsoup=3Denabled,,libsoup,,,so=
up2"
> >>>>>>>     PACKAGECONFIG[speex]      =3D
> "-Dspeex=3Denabled,-Dspeex=3Ddisabled,speex"
> >>>>>>> @@ -79,3 +80,8 @@ EXTRA_OEMESON +=3D " \
> >>>>>>>     "
> >>>>>>>
> >>>>>>>     FILES:${PN}-equalizer +=3D "${datadir}/gstreamer-1.0/presets/=
*.prs"
> >>>>>>> +
> >>>>>>> +do_configure:prepend() {
> >>>>>>> +    # provide path to qtwaylandscanner
> >>>>>>> +    export PATH=3D${PATH}:${STAGING_DIR_NATIVE}/${libexecdir}
> >>>>>>
> >>>>>> perhaps we should fix naitve qt6 to install qtwaylandscanner in na=
tive
> >>>>>> bindir. Then we do not need this.
> >>>>>
> >>>>> Hi, I brought this up recently in a different discussion
> >>>>>
> >>>>> https://bugreports.qt.io/browse/QTBUG-116998
> >>>>>
> >>>>> My understanding is that the move was deliberate and the expectatio=
n is
> >>>>> that everybody uses the CMake macros with internal path logic; howe=
ver,
> >>>>> that fails when not using CMake like here with Meson.
> >>>>
> >>>> There isn't anything stopping OE from symlinking it in it's recipe?
> >>>>
> >>>> Cheers,
> >>>>
> >>>> Richard
> >>>
> >>> Hi Richard,
> >>>
> >>> thanks for you answer! Since qtwayland is part of meta-qt6, do I get
> >>> your comment correct that you suggest creating a symlink
> >>> /usr/bin/qtwaylandscanner -> /usr/libexec/qtwaylandscanner
> >>> for the gstreamer1.0-plugins-good recipe or do you have patching of
> >>> qtwayland in mind?
> >>
> >> I was suggesting you ask meta-qt6 about the idea of the symlink in
> >> their recipe. I didn't know if meta-qt6 was being handled by qt.io or
> >> not though. I may have misunderstood and it is the meta-qt6 people
> >> saying gstreamer are doing it "wrong" in which case this is indeed mor=
e
> >> tricky :(.
> >=20
> > yeah creating a symlink in meta-qt6 should be quick and easy solution.
>=20
> Hi, a short update: I figured out that Meson actually has code to handle=
=20
> exactly this situation to detect Qt's tools in libexec. Not sure yet=20
> what is happening there and why the detection fails. By the way, this=20
> detection problem holds for further Qt tools (moc, lrelease, rcc...)
>=20
> Currently looking into this.

Andreas, did you eventually find anything or did you report this to meson p=
roject?

>=20
> Cheers,
> Andreas
>

