Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SkiY1-0005r7-46
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 23:16:13 +0200
Received: from mail179-tx2-R.bigfish.com (10.9.14.252) by
	TX2EHSOBE010.bigfish.com (10.9.40.30) with Microsoft SMTP Server id
	14.1.225.23; Fri, 29 Jun 2012 20:02:58 +0000
Received: from mail179-tx2 (localhost [127.0.0.1])	by
	mail179-tx2-R.bigfish.com (Postfix) with ESMTP id 13EAA460258	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 20:02:58 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ahbe9i)
Received: from mail179-tx2 (localhost.localdomain [127.0.0.1]) by mail179-tx2
	(MessageSwitch) id 1341000175970626_15080;
	Fri, 29 Jun 2012 20:02:55 +0000 (UTC)
Received: from TX2EHSMHS038.bigfish.com (unknown [10.9.14.250])	by
	mail179-tx2.bigfish.com (Postfix) with ESMTP id E7E3E340052	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 20:02:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS038.bigfish.com
	(10.9.99.138) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 29 Jun 2012 20:02:55 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.135]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Fri, 29 Jun 2012 15:04:45 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/3] u-boot: make sure CROSS_COMPILE is
	passed into build
Thread-Index: AQHNVjJtp37hPwcOx0OAR1JZ5GEipQ==
Date: Fri, 29 Jun 2012 20:04:44 +0000
Message-ID: <CAEsOVNdNezAmBfOZxj_9oXekYwLvqEQFfvoQQH1Unz3sQFPO6Q@mail.gmail.com>
References: <1340994915-14947-1-git-send-email-paul.gortmaker@windriver.com>
	<1340994915-14947-4-git-send-email-paul.gortmaker@windriver.com>
In-Reply-To: <1340994915-14947-4-git-send-email-paul.gortmaker@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 3/3] u-boot: make sure CROSS_COMPILE is passed into build
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
X-List-Received-Date: Fri, 29 Jun 2012 21:16:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E1615EA0BE69484296F990CA84B0D936@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 29, 2012 at 1:35 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> The u-boot build system expects this, otherwise it will
> choose from its own internal defaults. =A0In the case of
> powerpc, we'll see it look for "ppc_8xx-gcc" and fail.
>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
> =A0meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb | =A0 =A03 +++
> =A01 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb b/meta/recipes-=
bsp/u-boot/u-boot_2012.04.01.bb
> index 25cc8c9..b37fe01 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
> @@ -26,3 +26,6 @@ SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmast=
er;protocol=3Dgit"
> =A0S =3D "${WORKDIR}/git"
>
> =A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +# u-boot expects this to indicate what toolchain to use
> +EXTRA_OEMAKE =3D "CROSS_COMPILE=3D${TARGET_PREFIX}"

Isn't this already in u-boot.inc?

-M

> --
> 1.7.9.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



