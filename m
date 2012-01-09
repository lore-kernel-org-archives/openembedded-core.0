Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Rk7b8-0003d5-An
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 06:16:55 +0100
Received: from mail63-tx2-R.bigfish.com (10.9.14.244) by
	TX2EHSOBE003.bigfish.com (10.9.40.23) with Microsoft SMTP Server id
	14.1.225.23; Mon, 9 Jan 2012 05:09:05 +0000
Received: from mail63-tx2 (localhost [127.0.0.1])	by mail63-tx2-R.bigfish.com
	(Postfix) with ESMTP id D355C404FE;
	Mon,  9 Jan 2012 05:08:23 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9k61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail63-tx2 (localhost.localdomain [127.0.0.1]) by mail63-tx2
	(MessageSwitch) id 1326085702362455_1094;
	Mon,  9 Jan 2012 05:08:22 +0000 (UTC)
Received: from TX2EHSMHS033.bigfish.com (unknown [10.9.14.243])	by
	mail63-tx2.bigfish.com (Postfix) with ESMTP id 74C033E0067;
	Mon,  9 Jan 2012 05:07:46 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS033.bigfish.com
	(10.9.99.133) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 9 Jan 2012 05:08:27 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Sun, 8 Jan 2012 23:08:27 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] busybox: defconfig modified in order to
	activate CONFIG_EXPR_MATH_SUPPORT_64
Thread-Index: AQHMzoy4KGD2EjRW5Ee+0vNezSbBuw==
Date: Mon, 9 Jan 2012 05:08:26 +0000
Message-ID: <CAEsOVNeAuF5u2J_MhZg9tVezexCNyK2rGsZ2sUgBpTeJ90ZVqw@mail.gmail.com>
References: <1326067422-30771-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1326067422-30771-1-git-send-email-andrei@gherzan.ro>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Andrei Gherzan <andrei@gherzan.ro>,
	Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH] busybox: defconfig modified in order to activate CONFIG_EXPR_MATH_SUPPORT_64
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
X-List-Received-Date: Mon, 09 Jan 2012 05:16:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8E38909E3F872B49ADD1C38214D57F0D@freescale.net>
Content-Transfer-Encoding: quoted-printable

Is anyone working on more fine grained control of busybox? Some ideas inclu=
de:

1) configure via PACKAGECONFIG?

2) supply a defconfig for busybox?

3) multiple busybox recipes?

-M

On Sun, Jan 8, 2012 at 6:03 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> From: Andrei Gherzan <andrei.gherzan@windriver.com>
>
> Enable 64-bit math support in the expr applet. This will make
> the applet slightly larger, but will allow computation with very
> large numbers.
>
> [YOCTO #1767]
>
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
> =A0meta/recipes-core/busybox/busybox-1.19.3/defconfig | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/re=
cipes-core/busybox/busybox-1.19.3/defconfig
> index 1990f28..ebd751d 100644
> --- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
> +++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
> @@ -214,7 +214,7 @@ CONFIG_FEATURE_ENV_LONG_OPTIONS=3Dy
> =A0# CONFIG_EXPAND is not set
> =A0# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
> =A0CONFIG_EXPR=3Dy
> -# CONFIG_EXPR_MATH_SUPPORT_64 is not set
> +CONFIG_EXPR_MATH_SUPPORT_64=3Dy
> =A0CONFIG_FALSE=3Dy
> =A0# CONFIG_FOLD is not set
> =A0# CONFIG_FSYNC is not set
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



