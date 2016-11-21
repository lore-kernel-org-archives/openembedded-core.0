Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.1])
	by mail.openembedded.org (Postfix) with ESMTP id 1DBDE6E666
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 05:12:48 +0000 (UTC)
Received: from nbhjo (114-136-54-125.EMOME-IP.hinet.net [114.136.54.125])
	by msfrf2615.sfr.fr (SMTP Server) with ESMTP id BC3A41C00683E;
	Mon, 21 Nov 2016 06:12:49 +0100 (CET)
Received: from nbhjo (114-136-54-125.EMOME-IP.hinet.net
	[114.136.54.125])	(using TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2615.sfr.fr (SMTP Server) with ESMTPSA;
	Mon, 21 Nov 2016 06:12:47 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: 'Khem Raj' <raj.khem@gmail.com>
References: <1479643823-11675-1-git-send-email-herve.jourdain@neuf.fr>
	<1479643823-11675-2-git-send-email-herve.jourdain@neuf.fr>
	<CAMKF1sq6KOibu2XqE4RDsP7_C-DkFBjp-7rBHmsFz--wjdcyMQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq6KOibu2XqE4RDsP7_C-DkFBjp-7rBHmsFz--wjdcyMQ@mail.gmail.com>
Date: Mon, 21 Nov 2016 06:12:41 +0100
Message-ID: <000601d243b5$e526ea00$af74be00$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQI+VLVPZZ+ga1ONwoVoKiDd75YPOQK2dCn5AxBiYkef3Itl4A==
X-sfr-mailing: LEGIT
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/3] arch-arm64.inc: include arch-armv7ve instead of arch-armv7a
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
X-List-Received-Date: Mon, 21 Nov 2016 05:12:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Language: fr

Hi Khem,

Do you want me to resubmit the patch with a better commit message?
Or do you want to submit yours instead?
I'm fine either way.

Herve

-----Original Message-----
From: Khem Raj [mailto:raj.khem@gmail.com]=20
Sent: dimanche 20 novembre 2016 20:35
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: Patches and discussions about the oe-core layer =
<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [oe-core][PATCH v3 1/3] arch-arm64.inc: include =
arch-armv7ve instead of arch-armv7a

On Sun, Nov 20, 2016 at 4:10 AM, Herve Jourdain <herve.jourdain@neuf.fr> =
wrote:
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> ---
>  meta/conf/machine/include/arm/arch-arm64.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/arm/arch-arm64.inc =
b/meta/conf/machine/include/arm/arch-arm64.inc
> index 9440698..9eeffac 100644
> --- a/meta/conf/machine/include/arm/arch-arm64.inc
> +++ b/meta/conf/machine/include/arm/arch-arm64.inc
> @@ -1,6 +1,6 @@
>  DEFAULTTUNE ?=3D "aarch64"
>
> -require conf/machine/include/arm/arch-armv7a.inc
> +require conf/machine/include/arm/arch-armv7ve.inc

This is ok. However a better commit message would be justified.
I have similar patch see

https://github.com/kraj/openembedded-core/commit/8ece89ac164062601d341857=
6d51434c69654e28

>
>  TUNEVALID[aarch64] =3D "Enable instructions for aarch64"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


