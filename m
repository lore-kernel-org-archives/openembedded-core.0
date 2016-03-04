Return-Path: <zhenhua.luo@nxp.com>
X-Greylist: delayed 4742 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 04 Mar 2016 11:16:09 UTC
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0074.outbound.protection.outlook.com [157.55.234.74])
	by mail.openembedded.org (Postfix) with ESMTP id 794336E681
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 11:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=0pCt7H0ls6olvIf/RaT181c7WpmpFZ231AL9i6l/6/U=;
	b=afEGbw39ezj0uINy6RL2oEHP2SyGfJyhGupqvk2FXdZ9GHIp8BZSlE7mXl1o+6Im9CQMmEirTdrae69K+1YMwjw0m0WU9Nl8sRuMJKAvbgpAsP5K5t7VlptQ+KfZNemHlIaXOh7yZ9zonHaDRhWxESyfH1txfUNdWm0DxSrkK1Y=
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com
	(2a01:111:e400:943c::14) by DB3PR04MB0681.eurprd04.prod.outlook.com
	(2a01:111:e400:943c::11) with Microsoft SMTP Server (TLS) id
	15.1.427.16; Fri, 4 Mar 2016 09:41:51 +0000
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::5d5f:4faf:f854:c77e]) by
	DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::5d5f:4faf:f854:c77e%16]) with mapi id 15.01.0427.016;
	Fri, 4 Mar 2016 09:41:51 +0000
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] Status of M3
Thread-Index: AQHRdVhGsXvrFyBNX0Gn620r+EcAUp9JCDuw
Date: Fri, 4 Mar 2016 09:41:51 +0000
Message-ID: <DB3PR04MB068422B10C54A685417DCE3AEEBE0@DB3PR04MB0684.eurprd04.prod.outlook.com>
References: <1457014986.25131.69.camel@linuxfoundation.org>
In-Reply-To: <1457014986.25131.69.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
	header.d=none;linuxfoundation.org; dmarc=none action=none
	header.from=nxp.com;
x-originating-ip: [199.59.226.141]
x-ms-office365-filtering-correlation-id: 736aa9b1-10f3-473f-b41f-08d3441136db
x-microsoft-exchange-diagnostics: 1; DB3PR04MB0681;
	5:TexF1cL+hLlIddzoahX/xWUiIwYS5XUuoU52ickbSkc5ewWGVyz69Ka7ebr4y38UXTkWdPEd8VHO8dFZdn7AYcmfylHGbzzqze1rsP/jRa0hrgfpRGxpXdnPh5+JnWMu5Eh5TYeIH5i+GemBHu+1dA==;
	24:i0NWMPzT9WLPDZq2Fa1Ug29K+vRq/ECejyRZpYYL9v/sncM5D2JqUtgPx3yMR7KJChVhYSTEpf8kie97fkRzFVhV4k2u8Fv+/yzH6hhEqyw=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB3PR04MB0681;
x-microsoft-antispam-prvs: <DB3PR04MB068148C7108CE70047C1968CEEBE0@DB3PR04MB0681.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:DB3PR04MB0681; BCL:0; PCL:0; RULEID:; SRVR:DB3PR04MB0681; 
x-forefront-prvs: 0871917CDA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(377454003)(13464003)(1096002)(1220700001)(5008740100001)(2906002)(586003)(6116002)(3846002)(3280700002)(4326007)(110136002)(86362001)(102836003)(19580395003)(66066001)(81166005)(3660700001)(5002640100001)(87936001)(40100003)(19580405001)(2950100001)(15975445007)(2900100001)(106116001)(76176999)(5004730100002)(74316001)(50986999)(5250100002)(189998001)(1720100001)(5003600100002)(76576001)(11100500001)(54356999)(92566002)(33656002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB3PR04MB0681;
	H:DB3PR04MB0684.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2016 09:41:51.3779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR04MB0681
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Status of M3
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
X-List-Received-Date: Fri, 04 Mar 2016 11:16:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,=20

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Richard Purdie
> Sent: Thursday, March 03, 2016 10:23 PM
> To: openembedded-core <openembedded-core@lists.openembedded.org>
> Subject: [OE-core] Status of M3
>=20
> I'm not sure people realise quite how much pain we've been suffering this
> week trying to get things stabilised for M3. To illustrate the kinds of p=
roblems,
> let me give an idea of the issues in the past few days. The resolved list=
:
>=20
> * gobject-introspection has sstate relocation issues
> * gobject-introspection was missing a dependency
> * allarch contamination issues from gnomebase defaulting to g-i
> * gobject-introspection fails on x32
> * oe-selftest failures from the vm class changes
> * random createrepo issue
> * autobuilder workers were replaced with new distros
>   - one had firewall problems
>   - two had network interface problems
>   - another had VNC issues causing sanity test failures
> * there were autobuilder configuration changes
>   - eSDK changes failed initial
>   - increased ptest coverage failed initially
>   - uninative tarball publishing wasn't correct
>   - handle meta-poky transition
>   - handle adt-installer removal
> * uninative output name issues (BUILD_ARCH verses SDK_ARCH)
> * uninative sstate interaction issues (NATIVESDKSTRING)
> * ongoing pseudo retry issues
> * bitbake unpack improvements broke
> * canterall fonts broke oe-selftest
> * unsafe script references broke sanity tests
> * unsafe binary references broke in sanity tests due to prelink problem
> * meta-yocto -> meta-poky had multiple problems
> * race in do_rootfs_wicenv
> * eudev change broke oe-selftest
> * rpm upgrade went through multiple different build failures
> * toaster references to meta-yocto
> * I screwed up manually fixing a simple merge breaking builds. Twice :(
>=20
> Things which still break:
>=20
> * rpm upgrade causes smart remove to not function
> * gobject-introspection breaks on multilib with python-pygobject file
>   location issue
> * gobject-introspection fails on musl
> * createrepo has occasional failure with checksum mismatch
> * oe-selftest signing failure
> * sato application launch failures from glib issues due to prelink
> * meta-fsl-ppc breaks on eudev change (patch pending)
> * meta-fsl-ppc breakage blocks AB artefact publishing
[Luo Zhenhua-B19537] The eudev patch is merged, http://git.yoctoproject.org=
/cgit/cgit.cgi/meta-fsl-ppc/commit/?id=3D2642cf5e8a6f8d11603acf016b8c075ebc=
e00ec0, is there any other blocker issue?=20


Best Regards,

Zhenhua

> There are only a small number of us who dive in and try and untangle the
> twisted web of which patch is causing which issue and try and put these t=
hings
> on a path to resolution
>=20
> With this level of issues, we're simply not able to consider things like =
"why
> aren't you testing X?" or "can you test this patch to this component to g=
et
> debugging?". There are 101 things that many of us would love to do but we
> need to improve the turnaround time of the tests we have. There are some
> simple things that come to mind that we could do:
>=20
> a) optimisation of oe-selftest. Currently it takes around 8 hours but we =
could
> cut that time massively with some optimisation around the sstate cache an=
d
> the way the tests are written. This one does catch many valid issues but =
its way
> too slow. Parallelism is also an option here.
>=20
> b) switch to uninative by default to improve native/cross artefact reuse =
on the
> autobuilder. I have patches queued in -next to test this, see if we could=
 switch
> to it.
>=20
> c) switch to the new AB cluster when its ready (newer/faster hardware)
>=20
> Volunteers for a) would be most welcome, other ideas welcome too.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

