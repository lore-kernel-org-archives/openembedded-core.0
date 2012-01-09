Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE009.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RkB6u-0007gC-LR
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 10:01:44 +0100
Received: from mail72-tx2-R.bigfish.com (10.9.14.247) by
	TX2EHSOBE009.bigfish.com (10.9.40.29) with Microsoft SMTP Server id
	14.1.225.23; Mon, 9 Jan 2012 08:54:16 +0000
Received: from mail72-tx2 (localhost [127.0.0.1])	by mail72-tx2-R.bigfish.com
	(Postfix) with ESMTP id 100035401FA	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2012 08:54:02 +0000 (UTC)
X-SpamScore: -5
X-BigFish: VS-5(zz9371I542M1432Nb922lzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hbe9k63h)
X-Spam-TCS-SCL: 2:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail72-tx2 (localhost.localdomain [127.0.0.1]) by mail72-tx2
	(MessageSwitch) id 1326099241913351_23249;
	Mon,  9 Jan 2012 08:54:01 +0000 (UTC)
Received: from TX2EHSMHS041.bigfish.com (unknown [10.9.14.243])	by
	mail72-tx2.bigfish.com (Postfix) with ESMTP id CF57528004C	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2012 08:54:01 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS041.bigfish.com
	(10.9.99.141) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 9 Jan 2012 08:54:16 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Mon, 9 Jan 2012 02:54:16 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] FSLONLY: adjust the meta-oe layer sequence to make
	Yocto pick up the right bbclass file
Thread-Index: AQHMzqw0Q8Essvv/6E64hAYQhQBnSJYDuyOw
Date: Mon, 9 Jan 2012 08:54:16 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010CA811@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1326099506-5473-1-git-send-email-b19537@freescale.com>
In-Reply-To: <1326099506-5473-1-git-send-email-b19537@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] FSLONLY: adjust the meta-oe layer sequence to make Yocto pick up the right bbclass file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 09 Jan 2012 09:01:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore.=20


Best Regards,

Zhenhua


> -----Original Message-----
> From: Luo Zhenhua-B19537
> Sent: Monday, January 09, 2012 4:58 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Luo Zhenhua-B19537
> Subject: [PATCH] FSLONLY: adjust the meta-oe layer sequence to make Yocto=
 pick
> up the right bbclass file
>=20
> From: Zhenhua Luo <b19537@freescale.com>
>=20
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
>  fsl-setup-poky |   14 +++++++-------
>  1 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/fsl-setup-poky b/fsl-setup-poky index a5cc702..d1faaae 10075=
5
> --- a/fsl-setup-poky
> +++ b/fsl-setup-poky
> @@ -168,13 +168,6 @@ echo >> build_${BOARD}_release/conf/local.conf
>  sed "/  \"/d" build_${BOARD}_release/conf/bblayers.conf >
> build_${BOARD}_release/conf/bblayers.conf~
>  mv build_${BOARD}_release/conf/bblayers.conf~
> build_${BOARD}_release/conf/bblayers.conf
>=20
> -# append meta-oe/meta-oe if it exists
> -if [ -e $CUR_DIR/meta-oe/meta-oe ]; then
> -    echo "  $CUR_DIR/meta-oe/meta-oe \\" >>
> build_${BOARD}_release/conf/bblayers.conf
> -elif [ -e $CUR_DIR/../meta-oe/meta-oe ]; then
> -    echo "  $CUR_DIR/../meta-oe/meta-oe \\" >>
> build_${BOARD}_release/conf/bblayers.conf
> -fi
> -
>  # append meta-fsl-ppc bblayer into conf/bblayers.conf  echo "
> ${META_FSL_PPC_LAYER_PATH} \\" >> build_${BOARD}_release/conf/bblayers.co=
nf
>=20
> @@ -191,6 +184,13 @@ if [ -e $CUR_DIR/meta-fsl-local-sdk ]; then  elif [ =
-e
> $CUR_DIR/../meta-fsl-local-sdk ]; then
>      echo "  $CUR_DIR/../meta-fsl-local-sdk \\" >>
> build_${BOARD}_release/conf/bblayers.conf
>  fi
> +
> +# append meta-oe/meta-oe if it exists
> +if [ -e $CUR_DIR/meta-oe/meta-oe ]; then
> +    echo "  $CUR_DIR/meta-oe/meta-oe \\" >>
> +build_${BOARD}_release/conf/bblayers.conf
> +elif [ -e $CUR_DIR/../meta-oe/meta-oe ]; then
> +    echo "  $CUR_DIR/../meta-oe/meta-oe \\" >>
> +build_${BOARD}_release/conf/bblayers.conf
> +fi
>  echo "  \"" >> build_${BOARD}_release/conf/bblayers.conf
>=20
>  # enable 64b multilib if we are a p5020ds(-32b)
> --
> 1.7.0.4




