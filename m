Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Sz8yS-000741-64
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 18:19:08 +0200
Received: from mail228-va3-R.bigfish.com (10.7.14.247) by
	VA3EHSOBE013.bigfish.com (10.7.40.63) with Microsoft SMTP Server id
	14.1.225.23; Wed, 8 Aug 2012 16:07:20 +0000
Received: from mail228-va3 (localhost [127.0.0.1])	by
	mail228-va3-R.bigfish.com (Postfix) with ESMTP id 570D24C0327	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2012 16:07:20 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail228-va3 (localhost.localdomain [127.0.0.1]) by mail228-va3
	(MessageSwitch) id 1344442038576158_3245;
	Wed,  8 Aug 2012 16:07:18 +0000 (UTC)
Received: from VA3EHSMHS015.bigfish.com (unknown [10.7.14.254])	by
	mail228-va3.bigfish.com (Postfix) with ESMTP id 8B0AC1E004A	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2012 16:07:18 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS015.bigfish.com
	(10.7.99.25) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 8 Aug 2012 16:07:18 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Wed, 8 Aug 2012 11:07:17 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] owl-video_git.bb: fix compilation on Fedora
	13 machine
Thread-Index: AQHNdX/hm8306Ka8Iki8aVq7vcEToA==
Date: Wed, 8 Aug 2012 16:07:16 +0000
Message-ID: <CAEsOVNe9eWTVy7k2u5yNRGRZz==jRTZ0=nZD+xtdOhS=hSn7rg@mail.gmail.com>
References: <1343335023-28938-1-git-send-email-msm@freescale.com>
In-Reply-To: <1343335023-28938-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] owl-video_git.bb: fix compilation on Fedora 13 machine
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2012 16:19:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2133FC963984734A98799F1841BCE7B3@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Any comments on this?

-M

On Thu, Jul 26, 2012 at 3:37 PM, Matthew McClintock <msm@freescale.com> wro=
te:
> This adds libXrandr to the link step and fixes this issue:
>
> | /opt/yocto/upstream/label/master/machine/atom-pc/poky/edison/tmp/sysroo=
ts/atom-pc/usr/lib/libgdk-x11-2.0.so: undefined reference to `XRRGetOutputI=
nfo'
> | /opt/yocto/upstream/label/master/machine/atom-pc/poky/edison/tmp/sysroo=
ts/atom-pc/usr/lib/libgdk-x11-2.0.so: undefined reference to `XRRGetScreenR=
esourcesCurrent'
> | /opt/yocto/upstream/label/master/machine/atom-pc/poky/edison/tmp/sysroo=
ts/atom-pc/usr/lib/libgdk-x11-2.0.so: undefined reference to `XRRFreeOutput=
Info'
> | /opt/yocto/upstream/label/master/machine/atom-pc/poky/edison/tmp/sysroo=
ts/atom-pc/usr/lib/libgdk-x11-2.0.so: undefined reference to `XRRFreeScreen=
Resources'
> | /opt/yocto/upstream/label/master/machine/atom-pc/poky/edison/tmp/sysroo=
ts/atom-pc/usr/lib/libgdk-x11-2.0.so: undefined reference to `XRRGetOutputP=
rimary'
> | /opt/yocto/upstream/label/master/machine/atom-pc/poky/edison/tmp/sysroo=
ts/atom-pc/usr/lib/libgdk-x11-2.0.so: undefined reference to `XRRFreeCrtcIn=
fo'
> | /opt/yocto/upstream/label/master/machine/atom-pc/poky/edison/tmp/sysroo=
ts/atom-pc/usr/lib/libgdk-x11-2.0.so: undefined reference to `XRRGetCrtcInf=
o'
> | collect2: ld returned 1 exit status
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  .../owl-video/0001-add-dependency-for-xrandr.patch |   30 ++++++++++++++=
++++++
>  .../recipes-sato/owl-video-widget/owl-video_git.bb |    5 ++--
>  2 files changed, 33 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-sato/owl-video-widget/owl-video/0001-add=
-dependency-for-xrandr.patch
>
> diff --git a/meta/recipes-sato/owl-video-widget/owl-video/0001-add-depend=
ency-for-xrandr.patch b/meta/recipes-sato/owl-video-widget/owl-video/0001-a=
dd-dependency-for-xrandr.patch
> new file mode 100644
> index 0000000..8c14578
> --- /dev/null
> +++ b/meta/recipes-sato/owl-video-widget/owl-video/0001-add-dependency-fo=
r-xrandr.patch
> @@ -0,0 +1,30 @@
> +Upstream-Status: Pending
> +
> +This patch should probably go upstream
> +
> +From 18bdd57b36489439dc5c18b20abd9d59c6778662 Mon Sep 17 00:00:00 2001
> +From: Matthew McClintock <msm@freescale.com>
> +Date: Wed, 25 Jul 2012 15:05:40 -0500
> +Subject: [PATCH] add dependency for xrandr
> +
> +Signed-off-by: Matthew McClintock <msm@freescale.com>
> +---
> + src/Makefile.am |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 60e845b..00e4b11 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -12,7 +12,7 @@ video_SOURCES =3D video.c      \
> +       owl-overlay-bin.c       \
> +       owl-overlay-bin.h
> +
> +-video_LDADD =3D $(VIDEO_LIBS)
> ++video_LDADD =3D $(VIDEO_LIBS) -lXrandr
> +
> + dist_pkgdata_DATA =3D gtk-fullscreen.png
> +
> +--
> +1.7.5.4
> +
> diff --git a/meta/recipes-sato/owl-video-widget/owl-video_git.bb b/meta/r=
ecipes-sato/owl-video-widget/owl-video_git.bb
> index bc63273..321b71b 100644
> --- a/meta/recipes-sato/owl-video-widget/owl-video_git.bb
> +++ b/meta/recipes-sato/owl-video-widget/owl-video_git.bb
> @@ -10,7 +10,7 @@ DEPENDS =3D "libowl-av"
>
>  SRCREV =3D "f133472318970796fae1ea3e98ac062156768baf"
>  PV =3D "0.1+git${SRCPV}"
> -PR =3D "r1"
> +PR =3D "r2"
>
>  S =3D "${WORKDIR}/git"
>
> @@ -23,7 +23,8 @@ SRC_URI =3D "git://git.yoctoproject.org/${BPN};protocol=
=3Dgit \
>             file://stock_volume-med.png \
>             file://stock_volume-max.png \
>             file://owl-video-widget.desktop \
> -          file://make-382.patch"
> +          file://make-382.patch \
> +          file://0001-add-dependency-for-xrandr.patch"
>
>  inherit autotools pkgconfig
>
> --
> 1.7.10
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



