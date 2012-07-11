Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SooGY-0004fp-MG
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 06:11:07 +0200
Received: from mail89-co1-R.bigfish.com (10.243.78.249) by
	CO1EHSOBE006.bigfish.com (10.243.66.69) with Microsoft SMTP Server id
	14.1.225.23; Wed, 11 Jul 2012 03:57:33 +0000
Received: from mail89-co1 (localhost [127.0.0.1])	by mail89-co1-R.bigfish.com
	(Postfix) with ESMTP id AE23BAC0301	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 03:57:33 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail89-co1 (localhost.localdomain [127.0.0.1]) by mail89-co1
	(MessageSwitch) id 1341979050744926_8339;
	Wed, 11 Jul 2012 03:57:30 +0000 (UTC)
Received: from CO1EHSMHS002.bigfish.com (unknown [10.243.78.230])	by
	mail89-co1.bigfish.com (Postfix) with ESMTP id AA84614004A	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 03:57:30 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS002.bigfish.com
	(10.243.66.12) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 11 Jul 2012 03:57:30 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Tue, 10 Jul 2012 22:59:50 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gcc-configure-common.inc: use
	--with-long-double-128 on powerpc to comply with ABI
Thread-Index: AQHNXxmeo9e9zB6Tc0CnI0do+nZo7Q==
Date: Wed, 11 Jul 2012 03:59:49 +0000
Message-ID: <CAEsOVNdxqbWTrSScnsTYEqB8LazSBm3cbo6FwfFCwptf96AWOQ@mail.gmail.com>
References: <1341977966-14246-1-git-send-email-msm@freescale.com>
In-Reply-To: <1341977966-14246-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] gcc-configure-common.inc: use --with-long-double-128 on powerpc to comply with ABI
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
X-List-Received-Date: Wed, 11 Jul 2012 04:11:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B3AA5CD3A29CBD4BB519408F804447C6@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2012 at 10:39 PM, Matthew McClintock <msm@freescale.com> wr=
ote:
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.7.inc              |    2 +-
>  meta/recipes-devtools/gcc/gcc-configure-common.inc |    4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtool=
s/gcc/gcc-4.7.inc
> index 3b6e313..ece32c1 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -1,6 +1,6 @@
>  require gcc-common.inc
>
> -PR =3D "r5"
> +PR =3D "r6"

This patch has the wrong PR bump here, but the version in my tree is fixed =
up:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dmattsm/mast=
er

-M

>
>  # Third digit in PV should be incremented after a minor release
>  # happens from this branch on gcc e.g. currently its 4.7.1
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/re=
cipes-devtools/gcc/gcc-configure-common.inc
> index 3dd9de7..908ad3e 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -61,6 +61,10 @@ EXTRA_OECONF_append_mips64el    =3D " --with-abi=3D64 =
--with-arch-64=3Dmips64 --with-t
>  EXTRA_OECONF_FPU =3D "${@get_gcc_fpu_setting(bb, d)}"
>  CPPFLAGS =3D ""
>
> +# powerpc needs this to comply with the ABI
> +EXTRA_OECONF_append_powerpc =3D " --with-long-double-128"
> +EXTRA_OECONF_append_powerpc64 =3D " --with-long-double-128"
> +
>  # Used by configure to define additional values for FLAGS_FOR_TARGET -
>  # passed to all the compilers.
>  ARCH_FLAGS_FOR_TARGET =3D "${TARGET_CC_ARCH}"
> --
> 1.7.10
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



