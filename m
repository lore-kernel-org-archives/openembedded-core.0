Return-Path: <mvader@victronenergy.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0110.outbound.protection.outlook.com [104.47.2.110])
	by mail.openembedded.org (Postfix) with ESMTP id 84C2D78461
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 18:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=cMeD7US327jK5bCkXO0k64PYf1YEMOm4V39zUpCzzt0=;
	b=kwEg3K2PhVGWfN3JZHhwvK4oT8wc030TI/ZGv8nwBBCZ75ZP9FTrFl7G3kc2o49xfh44LKmtJjGt3zx3XxcGSPmeoKw81zX3jdV0OphToD4DwzvXY1aZYutixnmKhJjL/CWGKsLNyBBnjqRxglmFvlQFfVzHQ7zjq97VR9NkTY0=
Received: from HE1PR07MB1436.eurprd07.prod.outlook.com (10.169.122.22) by
	HE1PR07MB3419.eurprd07.prod.outlook.com (10.170.247.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.485.3; Tue, 6 Feb 2018 16:45:45 +0000
Received: from HE1PR07MB1436.eurprd07.prod.outlook.com
	([fe80::fce3:9070:a9a8:6b9a]) by
	HE1PR07MB1436.eurprd07.prod.outlook.com
	([fe80::fce3:9070:a9a8:6b9a%14]) with mapi id 15.20.0485.009;
	Tue, 6 Feb 2018 16:45:45 +0000
From: Matthijs Vader <mvader@victronenergy.com>
To: =?iso-8859-1?B?QvZzevZybelueWkgWm9sdOFu?= <zboszor@pr.hu>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] classes/npm: replace cache clear with cache
	clean --force
Thread-Index: AQHTngbGFIIYgWT5mUGf+slqbVgYj6OV2QCAgAAa2mCAAUlOgIAAWlzQ
Date: Tue, 6 Feb 2018 16:45:45 +0000
Message-ID: <HE1PR07MB14360E56B01BF9775CEDE61BC5FD0@HE1PR07MB1436.eurprd07.prod.outlook.com>
References: <1517782997-32315-1-git-send-email-mvader@victronenergy.com>
	<575bced0-3a91-cea6-ba14-fc2346907620@pr.hu>
	<HE1PR07MB143682C1F14E2831B5C0D133C5FE0@HE1PR07MB1436.eurprd07.prod.outlook.com>
	<a06b333b-7f52-6576-0f4f-4629acc79863@pr.hu>
In-Reply-To: <a06b333b-7f52-6576-0f4f-4629acc79863@pr.hu>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=mvader@victronenergy.com; 
x-originating-ip: [213.126.8.10]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR07MB3419;
	7:tXNeiGM77GeQucqpHWHRcb1U8XfE4Syh1D9BQNeuDZZmSvM9zMKUgIVDIUEbqjQbPuLa+nBmTMYlinBX0qKOTAxOY+M/PnTcvJDWqu1yF1vlEuLxqM3cyR0urEK/w1kjXpjOR6TKArZCcZBsmCX7/Oh9O7xiyaxEGgwoUP3FPXNyWSjjEho0fJeDJgeDK3PVEHTtjrSg3yj9MrZYItZbEkAs77yf2chO+y3YPJcVTermfSU5R2jWCnjozCfh0rR1
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 207007ba-2d1d-4381-662e-08d56d811159
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:HE1PR07MB3419; 
x-ms-traffictypediagnostic: HE1PR07MB3419:
x-microsoft-antispam-prvs: <HE1PR07MB3419914F863E9C353A701005C5FD0@HE1PR07MB3419.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(788757137089)(264703809997249); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(3002001)(3231101)(2400082)(944501161)(10201501046)(93006095)(93001095)(6041288)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011);
	SRVR:HE1PR07MB3419; BCL:0; PCL:0; RULEID:; SRVR:HE1PR07MB3419; 
x-forefront-prvs: 0575F81B58
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39850400004)(396003)(366004)(376002)(39380400002)(346002)(199004)(189003)(377424004)(7696005)(6436002)(76176011)(3846002)(33656002)(2900100001)(93886005)(105586002)(55016002)(2501003)(53936002)(6306002)(86362001)(6246003)(99286004)(6116002)(81156014)(5250100002)(1720100001)(2906002)(81166006)(25786009)(9686003)(102836004)(26005)(3660700001)(5660300001)(59450400001)(8676002)(3280700002)(966005)(8936002)(14454004)(68736007)(6506007)(186003)(66066001)(305945005)(110136005)(229853002)(7736002)(2950100002)(97736004)(478600001)(74316002)(316002)(106356001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR07MB3419;
	H:HE1PR07MB1436.eurprd07.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: yZLtwS+C5p+nPxXKFmqHsW9iV/7PqRUS99cx59UNV267vfCF029V4QYZfwORTMHLbfiBymKJMHNULZ0R6FCG6Q==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207007ba-2d1d-4381-662e-08d56d811159
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2018 16:45:45.1604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB3419
Subject: Re: [PATCH] classes/npm: replace cache clear with cache clean --force
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
X-List-Received-Date: Tue, 06 Feb 2018 18:18:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

You wrote:

> 2018-02-05 16:55 keltez=E9ssel, Matthijs Vader =EDrta:
> > Hi,
> >
> > 2018-02-05 15:07, zboszor wrote:
> >> I have already sent this patch (although a little extended) last week:
> >> http://lists.openembedded.org/pipermail/openembedded-core/2018-
> >> February/147071.html
> >
> > Thanks! The second patch you sent in with that actually solved some oth=
er
> problems I was having as well. Still one left to fix:
> >
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12534
> >
> > See also the comment I added to that bugreport just now.
>=20
> Cool! Can we have a joint effort in the merged patches?

Yes I will. I'll contact you off list.
=20
> Also, can you please look into this fix I made against bitbake?
> At least one node module (cli-color) has cyclic dependencies, making the
> npm fetcher looping infinitely.
> http://lists.openembedded.org/pipermail/bitbake-devel/2018-
> February/009199.html

I'll look at that & test that.

> >
> > Best regards, Matthijs
> >
> >
> >> 2018-02-04 23:23 keltez=E9ssel, mpvader =EDrta:
> >>> npm now requires --force to clean the cache, see [1]. Also, use
> >>> clean instead of clear since the latter is an alias.
> >>>
> >>> [1]
> >>>
> >>
> https://github.com/npm/npm/commit/34f24c8381235790945208d25ac193bc
> >> 97a2
> >>> 1b79
> >>>
> >>> Signed-off-by: mpvader <mvader@victronenergy.com>
> >>> ---
> >>>    meta/classes/npm.bbclass | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> >>> index
> >>> a69bedb..43aed36 100644
> >>> --- a/meta/classes/npm.bbclass
> >>> +++ b/meta/classes/npm.bbclass
> >>> @@ -31,7 +31,7 @@ npm_do_compile() {
> >>>    	fi
> >>>    	npm set cache ${WORKDIR}/npm_cache
> >>>    	# clear cache before every build
> >>> -	npm cache clear
> >>> +	npm cache clean --force
> >>>    	# Install pkg into ${S} without going to the registry
> >>>    	if [  "${NPM_INSTALL_DEV}" =3D "1" ]; then
> >>>    		npm --arch=3D${NPM_ARCH} --target_arch=3D${NPM_ARCH} --
> >> no-registry
> >>> install
> >>>
> >
> >


