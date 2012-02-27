Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=DB3EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S28T3-0005xK-MO
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 22:50:49 +0100
Received: from mail66-db3-R.bigfish.com (10.3.81.248) by
	DB3EHSOBE001.bigfish.com (10.3.84.21) with Microsoft SMTP Server id
	14.1.225.23; Mon, 27 Feb 2012 21:42:23 +0000
Received: from mail66-db3 (localhost [127.0.0.1])	by mail66-db3-R.bigfish.com
	(Postfix) with ESMTP id 25ADC3005B8;
	Mon, 27 Feb 2012 21:42:23 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail66-db3 (localhost.localdomain [127.0.0.1]) by mail66-db3
	(MessageSwitch) id 1330378941836406_8751;
	Mon, 27 Feb 2012 21:42:21 +0000 (UTC)
Received: from DB3EHSMHS004.bigfish.com (unknown [10.3.81.245])	by
	mail66-db3.bigfish.com (Postfix) with ESMTP id C595110004C;
	Mon, 27 Feb 2012 21:42:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS004.bigfish.com
	(10.3.87.104) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 27 Feb 2012 21:42:21 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.244]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Mon, 27 Feb 2012 15:42:19 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/4] arch-powerpc.inc: use default value of
	TUNE_PKGARCH
Thread-Index: AQHM9ZitFM6YWEDQ5Eyj6FPOiid9yg==
Date: Mon, 27 Feb 2012 21:42:18 +0000
Message-ID: <CAEsOVNeSWS_X8UjbzofCOEdssxz8mVBtwEa+nwLzfrEXJW3MmQ@mail.gmail.com>
References: <1330371531-28803-1-git-send-email-msm@freescale.com>
	<1330371531-28803-3-git-send-email-msm@freescale.com>
In-Reply-To: <1330371531-28803-3-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 3/4] arch-powerpc.inc: use default value of TUNE_PKGARCH
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
X-List-Received-Date: Mon, 27 Feb 2012 21:50:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <799760E249380F46B7E79A66DAA1349E@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2012 at 1:38 PM, Matthew McClintock <msm@freescale.com> wro=
te:
> We can use the default value for TUNE_PKGARCH, and now we just
> append "-nf" if no float is the build target
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> =A0meta/conf/machine/include/powerpc/arch-powerpc.inc | =A0 =A03 +--
> =A01 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/co=
nf/machine/include/powerpc/arch-powerpc.inc
> index c9b2829..350f9a9 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> @@ -20,8 +20,7 @@ ABIEXTENSION =3D "${@['','spe'][d.getVar('TARGET_FPU', =
True) in ['ppc-efd', 'ppc-e
>
> =A0PPCPKGSFX_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , =
"", "-nf", d)}"

This bit above needs to change too.. we need to reverse the logic:

-PPCPKGSFX_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" ,
"", "-nf", d)}"
+PPCPKGSFX_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft" ,
"-nf", "", d)}"

So for parts with an SPE which define ppc-efd and ppc-efs we don't get
the '-nf' appended (the part this patch adds just below)

-M

> -PPCPKGARCH =3D "${TUNE_ARCH}${PPCPKGSFX_FPU}"
> -TUNE_PKGARCH ?=3D "${PPCPKGARCH}"
> +TUNE_PKGARCH_append =3D "${PPCPKGSFX_FPU}"
>
> =A0# Basic tune definitions
> =A0AVAILTUNES +=3D "powerpc powerpc-nf"=



