Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SnB6R-0001SN-22
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 18:09:55 +0200
Received: from mail227-tx2-R.bigfish.com (10.9.14.245) by
	TX2EHSOBE001.bigfish.com (10.9.40.21) with Microsoft SMTP Server id
	14.1.225.23; Fri, 6 Jul 2012 15:56:40 +0000
Received: from mail227-tx2 (localhost [127.0.0.1])	by
	mail227-tx2-R.bigfish.com (Postfix) with ESMTP id AC862800102;
	Fri,  6 Jul 2012 15:56:40 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eI1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail227-tx2 (localhost.localdomain [127.0.0.1]) by mail227-tx2
	(MessageSwitch) id 1341590199177987_8102;
	Fri,  6 Jul 2012 15:56:39 +0000 (UTC)
Received: from TX2EHSMHS025.bigfish.com (unknown [10.9.14.235])	by
	mail227-tx2.bigfish.com (Postfix) with ESMTP id 276E8440046;
	Fri,  6 Jul 2012 15:56:39 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS025.bigfish.com
	(10.9.99.125) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 6 Jul 2012 15:56:37 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.163]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Fri, 6 Jul 2012 10:58:45 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Scott Garman
	<scott.a.garman@intel.com>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 3/3] xserver-xorg: Fix build on powerpc
Thread-Index: AQHNW5A4oMqtr6Hnv0e4xgFX+lKM2w==
Date: Fri, 6 Jul 2012 15:58:44 +0000
Message-ID: <CAEsOVNfdHeAzs3ULW0UkMYCEjOptzSeBNYA=Bva9bJmEkVPp4g@mail.gmail.com>
References: <cover.1336522880.git.raj.khem@gmail.com>
	<2c51f2017955dff27ab68c1f4165309567864ee5.1336522880.git.raj.khem@gmail.com>
	<096c4f3ac2f83fc08064afcec5a05824bb96b94e.1336522880.git.raj.khem@gmail.com>
In-Reply-To: <096c4f3ac2f83fc08064afcec5a05824bb96b94e.1336522880.git.raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 3/3] xserver-xorg: Fix build on powerpc
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
X-List-Received-Date: Fri, 06 Jul 2012 16:09:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <ACE6B065433E1E44A91B10FAED4F98ED@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Scott,

Can you apply this patch to denzil branch of oe-core/poky? It fixes
build errors for powerpc on gcc 4.6.4 as well.

-M

On Tue, May 8, 2012 at 7:27 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../xorg-xserver/xserver-xorg-1.11.2.inc           |    9 +++--
>  .../xserver-xorg-1.11.2/gcc-47-warning.patch       |   33 ++++++++++++++=
++++++
>  2 files changed, 38 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.=
2/gcc-47-warning.patch
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b=
/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> index f5fa629..6a86af4 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> @@ -1,10 +1,11 @@
> -SRC_URI +=3D "file://crosscompile.patch"
> -
>  # Misc build failure for master HEAD
> -SRC_URI +=3D "file://fix_open_max_preprocessor_error.patch"
> +SRC_URI +=3D "file://crosscompile.patch \
> +            file://fix_open_max_preprocessor_error.patch \
> +            file://gcc-47-warning.patch \
> +           "
>
>  SRC_URI[md5sum] =3D "8796fff441e5435ee36a72579008af24"
>  SRC_URI[sha256sum] =3D "fa415decf02027ca278b06254ccfbcceba2a83c274140525=
7ebf749da4a73cf2"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-4=
7-warning.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gc=
c-47-warning.patch
> new file mode 100644
> index 0000000..ed4eaac
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warni=
ng.patch
> @@ -0,0 +1,33 @@
> +This patch fixes errors on powerpc like below
> +
> +| lnx_video.c: In function 'unmapVidMem':
> +| lnx_video.c:472:24: error: cast from pointer to integer of different s=
ize [-Werror=3Dpointer-to-int-cast]
> +
> +Its in 1.12 branch
> +
> +http://cgit.freedesktop.org/xorg/xserver/commit/?h=3Dserver-1.12-branch&=
id=3Deb3377ffb8a7baa26c9831e56ed782d48b28fa71
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: xorg-server-1.11.2/hw/xfree86/os-support/linux/lnx_video.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- xorg-server-1.11.2.orig/hw/xfree86/os-support/linux/lnx_video.c    2=
012-05-01 06:32:34.186489019 -0700
> ++++ xorg-server-1.11.2/hw/xfree86/os-support/linux/lnx_video.c 2012-05-0=
1 06:49:14.926537452 -0700
> +@@ -469,11 +469,11 @@
> + static void
> + unmapVidMem(int ScreenNum, pointer Base, unsigned long Size)
> + {
> +-    memType alignOff =3D (memType)Base
> +-      - ((memType)Base & ~(getpagesize() - 1));
> ++    uintptr_t alignOff =3D (uintptr_t)Base
> ++      - ((uintptr_t)Base & ~(getpagesize() - 1));
> +
> +-    DebugF("alignment offset: %lx\n",alignOff);
> +-    munmap((caddr_t)((memType)Base - alignOff), (Size + alignOff));
> ++    DebugF("alignment offset: %lx\n",(unsigned long)alignOff);
> ++    munmap((void*)((uintptr_t)Base - alignOff), (Size + alignOff));
> + }
> +
> +
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



