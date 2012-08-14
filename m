Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T1IqF-0007KP-4T
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 17:15:35 +0200
Received: from mail165-va3-R.bigfish.com (10.7.14.252) by
	VA3EHSOBE007.bigfish.com (10.7.40.11) with Microsoft SMTP Server id
	14.1.225.23; Tue, 14 Aug 2012 14:48:33 +0000
Received: from mail165-va3 (localhost [127.0.0.1])	by
	mail165-va3-R.bigfish.com (Postfix) with ESMTP id DD61D4002FB	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 14:48:33 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail165-va3 (localhost.localdomain [127.0.0.1]) by mail165-va3
	(MessageSwitch) id 1344955712650621_18396;
	Tue, 14 Aug 2012 14:48:32 +0000 (UTC)
Received: from VA3EHSMHS016.bigfish.com (unknown [10.7.14.245])	by
	mail165-va3.bigfish.com (Postfix) with ESMTP id 9B42C20088	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 14:48:32 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS016.bigfish.com
	(10.7.99.26) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 14 Aug 2012 14:48:29 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Tue, 14 Aug 2012 09:48:28 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [CONSOLIDATED REQUEST 46/64] owl-video_git.bb: fix
	compilation on Fedora 13 machine
Thread-Index: AQHNehZsWtsMGLn4X0y+lBf0AuO1ZZdZt0SA
Date: Tue, 14 Aug 2012 14:48:27 +0000
Message-ID: <CAEsOVNcOGbaQghWhP5VBMMPc2TFSEoh37QaNyPbpOxH+TGDc7w@mail.gmail.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
	<76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
	<ccea2d07d0f88da1d5df027147238a97f78a4d3a.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <ccea2d07d0f88da1d5df027147238a97f78a4d3a.1344946189.git.sgw@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [CONSOLIDATED REQUEST 46/64] owl-video_git.bb: fix compilation on Fedora 13 machine
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
X-List-Received-Date: Tue, 14 Aug 2012 15:15:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D46193157DB82B4089309BE196571B11@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Saul,

I think we decided to wait / ignore this one.

-M

On Tue, Aug 14, 2012 at 7:13 AM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Matthew McClintock <msm@freescale.com>
>
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
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../owl-video/0001-add-dependency-for-xrandr.patch |   30 ++++++++++++++=
++++++
>  .../recipes-sato/owl-video-widget/owl-video_git.bb |    5 ++-
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
> 1.7.7.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



