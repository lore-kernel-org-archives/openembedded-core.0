Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TJ5RS-0006Qu-W3
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 18:35:31 +0200
Received: from mail35-ch1-R.bigfish.com (10.43.68.251) by
	CH1EHSOBE017.bigfish.com (10.43.70.67) with Microsoft SMTP Server id
	14.1.225.23; Tue, 2 Oct 2012 16:22:31 +0000
Received: from mail35-ch1 (localhost [127.0.0.1])	by mail35-ch1-R.bigfish.com
	(Postfix) with ESMTP id D3408E010F;
	Tue,  2 Oct 2012 16:22:31 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz17326ah8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441hbe9i1155h)
Received: from mail35-ch1 (localhost.localdomain [127.0.0.1]) by mail35-ch1
	(MessageSwitch) id 1349194949426218_19583;
	Tue,  2 Oct 2012 16:22:29 +0000 (UTC)
Received: from CH1EHSMHS023.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.231])	by mail35-ch1.bigfish.com (Postfix) with ESMTP id
	641671600C7;	Tue,  2 Oct 2012 16:22:29 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS023.bigfish.com
	(10.43.70.23) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 2 Oct 2012 16:22:27 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0309.003; Tue, 2 Oct 2012 11:22:27 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] chrpath: We should provide
	chrpath-replacement-native and install into a native specific directory
Thread-Index: AQHNoLoc26FFDKiYnkKd2cURalLMrw==
Date: Tue, 2 Oct 2012 16:22:26 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6CA2B9@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1349183622.15753.149.camel@ted>
In-Reply-To: <1349183622.15753.149.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] chrpath: We should provide chrpath-replacement-native and install into a native specific directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2012 16:35:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6DF766B96F23C74C8072C23D2103F580@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Docs need to be updated, there was also a build warning if it was not
installed - did that get removed too?

-M

On Tue, Oct 2, 2012 at 8:13 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> chrpath is assumed to be provided by the build host system. This means
> we need to provide a replacement version and install into a specific dire=
ctory
> to avoid races.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/chrpath/chrpath_0.14.bb b/meta/recipes=
-devtools/chrpath/chrpath_0.14.bb
> index 679f1aa..bb9b4b6 100644
> --- a/meta/recipes-devtools/chrpath/chrpath_0.14.bb
> +++ b/meta/recipes-devtools/chrpath/chrpath_0.14.bb
> @@ -20,4 +20,7 @@ inherit autotools
>  # relocatable, so use the one we've just built
>  CHRPATH_BIN_virtclass-native =3D "${S}/chrpath"
>
> +PROVIDES_append_virtclass-native =3D " chrpath-replacement-native"
> +NATIVE_PACKAGE_PATH_SUFFIX =3D "/${PN}"
> +
>  BBCLASSEXTEND =3D "native nativesdk"
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



