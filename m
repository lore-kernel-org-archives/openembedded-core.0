Return-Path: <Jagadeesh.Krishnanjanappa@caviumnetworks.com>
X-Greylist: delayed 13341 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 26 Mar 2015 14:56:16 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0077.outbound.protection.outlook.com [157.56.111.77])
	by mail.openembedded.org (Postfix) with ESMTP id 54F0F6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 14:56:16 +0000 (UTC)
Received: from BY1PR0701MB1141.namprd07.prod.outlook.com (25.160.104.27) by
	BY1PR0701MB1848.namprd07.prod.outlook.com (25.162.143.142) with
	Microsoft
	SMTP Server (TLS) id 15.1.112.19; Thu, 26 Mar 2015 14:56:15 +0000
Received: from BY1PR0701MB1144.namprd07.prod.outlook.com (25.160.105.12) by
	BY1PR0701MB1141.namprd07.prod.outlook.com (25.160.104.27) with
	Microsoft SMTP
	Server (TLS) id 15.1.112.19; Thu, 26 Mar 2015 14:56:12 +0000
Received: from BY1PR0701MB1144.namprd07.prod.outlook.com ([25.160.105.12]) by
	BY1PR0701MB1144.namprd07.prod.outlook.com ([25.160.105.12]) with
	mapi id 15.01.0112.000; Thu, 26 Mar 2015 14:56:12 +0000
From: "Krishnanjanappa, Jagadeesh"
	<Jagadeesh.Krishnanjanappa@caviumnetworks.com>
To: Naresh Bhat <naresh.bhat@linaro.org>
Thread-Topic: [OE-core] [PATCH] libart-lgpl: add art_config.h for
	armeb/aarch64be/aarch64be_32
Thread-Index: AQHQZ8ETFZXXnlfpTkWTe9kdIJQSP50u1UwsgAAEpBc=
Date: Thu, 26 Mar 2015 14:56:12 +0000
Message-ID: <1427381761316.40460@caviumnetworks.com>
References: <1427366383-10800-1-git-send-email-jkrishnanjanappa@caviumnetworks.com>,
	<CAFoFrHZxSDX3obxSa7OVeCD7DAqn-_W3egS2+p009Okf4Z=DZg@mail.gmail.com>,
	<1427380742615.27596@caviumnetworks.com>
In-Reply-To: <1427380742615.27596@caviumnetworks.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [64.2.3.194]
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BY1PR0701MB1141;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BY1PR0701MB1848; 
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10009020)(6009001)(51704005)(77156002)(15975445007)(2950100001)(110136001)(99286002)(66066001)(50986999)(62966003)(2900100001)(54356999)(102836002)(122556002)(76176999)(106116001)(40100003)(92566002)(1720100001)(87936001)(2656002)(46102003)(575784001)(19580405001)(117636001)(19580395003)(36756003)(86362001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR0701MB1141;
	H:BY1PR0701MB1144.namprd07.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-microsoft-antispam-prvs: <BY1PR0701MB1141DC1DFA7484159E80F7D78E080@BY1PR0701MB1141.namprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BY1PR0701MB1141; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0701MB1141; 
x-forefront-prvs: 0527DFA348
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2015 14:56:12.1742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0701MB1141
X-OriginatorOrg: caviumnetworks.com
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libart-lgpl: add art_config.h for armeb/aarch64be/aarch64be_32
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
X-List-Received-Date: Thu, 26 Mar 2015 14:56:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Naresh,

><DESCRIPTION>
>Detail description what does the patch will do ???

The patch adds art_config.h files for
armeb/aarch64be/aarch64be_32 target architectures.
The preprocessor macro values present in art_config.h
differ for individual architectures, basically libart-lgpl recipe will
pick up correct art_config.h file based on

ART_CONFIG =3D "${HOST_ARCH}/art_config.h"

and thereby having correct preprocessor macros definition
of each architectures.

Regards,
Jagadeesh

> Signed-off-by: Jagadeesh K <jkrishnanjanappa@caviumnetworks.com>
> ---
>  meta/recipes-gnome/gnome/libart-lgpl/aarch64be/art_config.h    | 10 ++++=
++++++
>  meta/recipes-gnome/gnome/libart-lgpl/aarch64be_32/art_config.h | 10 ++++=
++++++
>  meta/recipes-gnome/gnome/libart-lgpl/armeb/art_config.h        | 10 ++++=
++++++
>  3 files changed, 30 insertions(+)
>  create mode 100644 meta/recipes-gnome/gnome/libart-lgpl/aarch64be/art_co=
nfig.h
>  create mode 100644 meta/recipes-gnome/gnome/libart-lgpl/aarch64be_32/art=
_config.h
>  create mode 100644 meta/recipes-gnome/gnome/libart-lgpl/armeb/art_config=
.h
>
> diff --git a/meta/recipes-gnome/gnome/libart-lgpl/aarch64be/art_config.h =
b/meta/recipes-gnome/gnome/libart-lgpl/aarch64be/art_config.h
> new file mode 100644
> index 0000000..500ffc3
> --- /dev/null
> +++ b/meta/recipes-gnome/gnome/libart-lgpl/aarch64be/art_config.h
> @@ -0,0 +1,10 @@
> +/* Automatically generated by gen_art_config.c */
> +
> +#define ART_SIZEOF_CHAR 1
> +#define ART_SIZEOF_SHORT 2
> +#define ART_SIZEOF_INT 4
> +#define ART_SIZEOF_LONG 8
> +
> +typedef unsigned char art_u8;
> +typedef unsigned short art_u16;
> +typedef unsigned int art_u32;
> diff --git a/meta/recipes-gnome/gnome/libart-lgpl/aarch64be_32/art_config=
.h b/meta/recipes-gnome/gnome/libart-lgpl/aarch64be_32/art_config.h
> new file mode 100644
> index 0000000..b0e74ad
> --- /dev/null
> +++ b/meta/recipes-gnome/gnome/libart-lgpl/aarch64be_32/art_config.h
> @@ -0,0 +1,10 @@
> +/* Automatically generated by gen_art_config.c */
> +
> +#define ART_SIZEOF_CHAR 1
> +#define ART_SIZEOF_SHORT 2
> +#define ART_SIZEOF_INT 4
> +#define ART_SIZEOF_LONG 4
> +
> +typedef unsigned char art_u8;
> +typedef unsigned short art_u16;
> +typedef unsigned int art_u32;
> diff --git a/meta/recipes-gnome/gnome/libart-lgpl/armeb/art_config.h b/me=
ta/recipes-gnome/gnome/libart-lgpl/armeb/art_config.h
> new file mode 100644
> index 0000000..b0e74ad
> --- /dev/null
> +++ b/meta/recipes-gnome/gnome/libart-lgpl/armeb/art_config.h
> @@ -0,0 +1,10 @@
> +/* Automatically generated by gen_art_config.c */
> +
> +#define ART_SIZEOF_CHAR 1
> +#define ART_SIZEOF_SHORT 2
> +#define ART_SIZEOF_INT 4
> +#define ART_SIZEOF_LONG 4
> +
> +typedef unsigned char art_u8;
> +typedef unsigned short art_u16;
> +typedef unsigned int art_u32;
> --
> 1.8.2.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

