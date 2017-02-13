Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 4744 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 13 Feb 2017 14:51:07 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0104.outbound.protection.outlook.com [104.47.38.104])
	by mail.openembedded.org (Postfix) with ESMTP id 5331C71D99
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=Melink.onmicrosoft.com; s=selector1-melinkcorp-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4+WYAmvmBUvqja42yZlniZVUgDngGhuN13h7DygCFrY=;
	b=fJ6b2bAbx65S+WzZnZ3B8VHc9feiMsNWgRCudsu9F2Qnh2hmDW+2NVHHwN3YcDZ6/PhrxNDcFnp6QzOTgIT1YymnvhPL40IuF/B7Go9OcSz0z7JWXhr96Lp260EOwNKMIJpX9jogX+0BLx2uEUSL+TgjH01z4MRTgqLZ+koCkOo=
Received: from DM5PR05MB2954.namprd05.prod.outlook.com (10.168.176.142) by
	DM5PR05MB2954.namprd05.prod.outlook.com (10.168.176.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.888.5; Mon, 13 Feb 2017 13:17:29 +0000
Received: from DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) by
	DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) with mapi id
	15.01.0888.029; Mon, 13 Feb 2017 13:17:29 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] libcurl vs. libcurl5 vs. libcurl4
Thread-Index: AdKDsNjf+iymq+k4QQ6ihwgbAB3KWgAJo2+AAIjrqmA=
Date: Mon, 13 Feb 2017 13:17:28 +0000
Message-ID: <DM5PR05MB2954EFB5E808B54EE3EA7AD4BB590@DM5PR05MB2954.namprd05.prod.outlook.com>
References: <DM5PR05MB295469CD2CBB36C236111A0DBB440@DM5PR05MB2954.namprd05.prod.outlook.com>
	<20170210195351.GC3021@jama>
In-Reply-To: <20170210195351.GC3021@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bevenson@melinkcorp.com; 
x-originating-ip: [98.100.91.242]
x-ms-office365-filtering-correlation-id: 31797384-5581-4f48-2580-08d45412a931
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:DM5PR05MB2954;
x-microsoft-exchange-diagnostics: 1; DM5PR05MB2954;
	7:p2V/wVaOTMFwyYP9AuCZB/wEZmOtOgmiLYq1fPxg9pRe3WMh2iLPLMEcsFChwcKrvw8pXe3vTWgX9qqDNss1ODljHjJhKpPbFlY/7Vj5bpVYZCAALq4kL6o9bllGBCoLwQALGNGp8cKsn+8bFLgZcui84NrEbQmXYfyUjVd1zIj/FuMSaUufWJCLfhuusxnW9okMBM0sDhryCMqlwS4Ayv6T6lFI+Th1NX5yhTHrtPb8/xxUUMyZhgRwQpusR57UmtITzurUC3oR+DtyJ4JEHuF59s236sYEiq/7INAQqEzN15mmiFZ3jTKdJy6gxzdPfDHMYWOjgJQjYcggzbsAe7xvMqqgMVCkNH2AEnr96omdiLbkxFU5pywjs5r/rl3T1IUgB0KqphYC+Hf3vqE+8TN7oRgcemzfIBVYVwbt9ZQixDdrHfjh3kqaxTlR0x8UD53z0BlE7phxAPrrj13bTKsTgon9C4J9u6hJ8+E5T3OWm1dJ1ee+rP7aDF1Q0R4z6hJ/oMLlyxZKuvX9vuhCFg==
x-microsoft-antispam-prvs: <DM5PR05MB29544E868945A2CD307227DEBB590@DM5PR05MB2954.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6041248)(20161123558025)(20161123564025)(20161123562025)(20161123560025)(20161123555025)(6072148);
	SRVR:DM5PR05MB2954; BCL:0; PCL:0; RULEID:; SRVR:DM5PR05MB2954; 
x-forefront-prvs: 02176E2458
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39450400003)(13464003)(51914003)(24454002)(377454003)(189002)(199003)(66066001)(99286003)(6116002)(76176999)(92566002)(33656002)(55016002)(50986999)(3846002)(81156014)(106356001)(105586002)(25786008)(101416001)(9686003)(189998001)(3280700002)(2900100001)(229853002)(3660700001)(74316002)(39060400001)(305945005)(6306002)(6436002)(97736004)(2906002)(7736002)(8676002)(6506006)(102836003)(54356999)(6916009)(68736007)(110136004)(38730400002)(77096006)(81166006)(5660300001)(8936002)(4326007)(53936002)(122556002)(7696004)(86362001)(6246003)(2950100002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR05MB2954;
	H:DM5PR05MB2954.namprd05.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: melinkcorp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2017 13:17:28.7724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB2954
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: libcurl vs. libcurl5 vs. libcurl4
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
X-List-Received-Date: Mon, 13 Feb 2017 14:51:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Martin,

> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Friday, February 10, 2017 2:54 PM
> To: Bryan Evenson <bevenson@melinkcorp.com>
> Cc: Openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] libcurl vs. libcurl5 vs. libcurl4
>=20
> On Fri, Feb 10, 2017 at 03:41:44PM +0000, Bryan Evenson wrote:
> > I'm on the dizzy branch and I'm working on updating my build tools to u=
se a
> more recent branch.  I have an image built using fido and I'm doing some
> firmware upgrade testing.  I have a package that depends on libcurl and I=
'm
> getting some strange version dependencies that I'm trying to sort out.
> >
> > In my package recipe I have "RDEPENDS_${PN} =3D <number of unrelated
> packages> libcurl" to pull in the runtime depenency on curl.  When I buil=
d my
> image using the dizzy branch, libcurl gets built as libcurl5-7.37.1, but =
when I
> build my image using the fido branch libcurl gets built as libcurl4-7.40.=
0.  As a
> result, by checking my package dependencies with "opkg info
> <my_package_name>" I see that the package dependency has changed
> from "libcurl5 (>=3D7.37.1)" to "libcurl4 (>=3D7.40.1)".
> >
> > Any ideas why the package name dropped from libcurl5 to libcurl4?  Is t=
his
> something that has been fixed in a more recent branch?  If I'm reading th=
e
> dependencies correctly, opkg should still install libcurl-7.40.0 since my
> package depends on libcurl4, correct?
>=20
> See --enable-soname-bump option in curl.
>=20
> This change in oe-core:
>   commit 49c848018484827c433e1bcf9c63416640456f3e
>   Author: Khem Raj <raj.khem@gmail.com>
>   Date:   Tue Apr 28 22:34:22 2015 -0700
>   Subject:  curl: Fix wrong assumption about sizeof off_t on largefile
>     systems
>=20
>     This issue was reported on poky ml as well see
>     https://lists.yoctoproject.org/pipermail/poky/2013-
> December/009435.html
>=20
> Causes this difference in curl_config.h between Dizzy and Fido:
> diff 7.40.0-r0-dizzy/build/lib/curl_config.h
>      7.40.0-r0-fido/build/lib/curl_config.h
> 878c877
> < #define SIZEOF_OFF_T 4
> ---
> > #define SIZEOF_OFF_T 8
> Which in turn causes curl's configure script to stop bumping the SONAME
> version.
>=20
> That's why newer curl 7.40.1 produces libcurl4 while older 7.37.1 produce=
d
> libcurl5.

Thanks for the explanation.  I also verified that the package dependencies =
worked correctly.  My updated package now depends on libcurl4 instead of li=
bcurl5, so the new package was correctly installed.  In my case I'll avoid =
doing any specific patch to keep the SONAME version the same if firmware up=
grade works as expected.

Thanks,
Bryan

>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

