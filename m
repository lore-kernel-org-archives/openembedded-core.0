Return-Path: <mvader@victronenergy.com>
X-Greylist: delayed 63121 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 Feb 2018 21:30:48 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01on0109.outbound.protection.outlook.com [104.47.1.109])
	by mail.openembedded.org (Postfix) with ESMTP id 65E48783C9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 21:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=f/Kz06WW4Rd5tk2k8x4+nqtHwGUcpju+uEjAlfnK4FA=;
	b=qrEalj8hXCAPkHOofgn4clhG0yEjlpmrguHFE8gxv8gHspg/y2BJFwDYHQMT+J5HaCoVt25jpCopI9Mwb0QYHPV0VF1UlbcIYYwU+bWfr4sEC+bbra0TT3ks4wbLv6XpsTKl1Vb+JAEqmu6ljz10f0kLQ3841we3j5lw8UNprVs=
Received: from HE1PR07MB1436.eurprd07.prod.outlook.com (10.169.122.22) by
	HE1PR07MB1467.eurprd07.prod.outlook.com (10.169.122.29) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.485.3; Mon, 5 Feb 2018 15:55:27 +0000
Received: from HE1PR07MB1436.eurprd07.prod.outlook.com
	([fe80::fce3:9070:a9a8:6b9a]) by
	HE1PR07MB1436.eurprd07.prod.outlook.com
	([fe80::fce3:9070:a9a8:6b9a%14]) with mapi id 15.20.0485.009;
	Mon, 5 Feb 2018 15:55:27 +0000
From: Matthijs Vader <mvader@victronenergy.com>
To: =?iso-8859-1?B?QvZzevZybelueWkgWm9sdOFu?= <zboszor@pr.hu>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] classes/npm: replace cache clear with cache
	clean --force
Thread-Index: AQHTngbGFIIYgWT5mUGf+slqbVgYj6OV2QCAgAAa2mA=
Date: Mon, 5 Feb 2018 15:55:27 +0000
Message-ID: <HE1PR07MB143682C1F14E2831B5C0D133C5FE0@HE1PR07MB1436.eurprd07.prod.outlook.com>
References: <1517782997-32315-1-git-send-email-mvader@victronenergy.com>
	<575bced0-3a91-cea6-ba14-fc2346907620@pr.hu>
In-Reply-To: <575bced0-3a91-cea6-ba14-fc2346907620@pr.hu>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=mvader@victronenergy.com; 
x-originating-ip: [213.126.8.10]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR07MB1467;
	6:EghBsarR4JQV+ypqTQmiXthDXMweWUAt4MqpXWf0RGTycWo/vQO6aYGf2U+eWs8dV3MVj3Fe6EAIMohy5pc4MLgN7NWhOtsLlRbG8pSy8+sYVCUYOELPsQ0iB9X01Phk1Lv3r7AGBQDtK/zVVLclmusgDRGwussR999nn+ylpbCKBD8mkC77/N6a+aF8viYg2H66FXwpuz3mj+Jjj0/FHGnWX3QWXD/FfSHxzvVDSvKSS0Whq4VRAMR9cT1/vph6kVR2Ra4CmtFjt+5iKMdd+OJSipEC0xWu5iSa1OF9xb8HONH6mP8EnId6MPXDNf5eAKcad9FzdZ1F4zXWrzkxnvV9Lb9ql5BHjlAfoSarCU8NWbBIa5Zj8hFOEX/iK9Nf;
	5:etbuAd/ibhWcKoT5AQfx8SyPNBKA4uOvFVfaVG8059zgFtw58AN8+B8qCSP4kt1aLW+G46WscyNAb3FkbsO4Ke0emd7m2dWx+1wCyF+HN41by7DJe83dFCjjdHQeKcj1LQYtgoW3p6QFTrgx5J9vae/hNtZIpisoqwDV6VfsJuM=;
	24:G/CfnL/2R7m9h/ZZKnMi3PLGf+QXPZA5Jb0vA6RNRLjftvlDBbiB0c/1XKIL3MKLRfIW1pTStQ3gRxSJpBHFm78X03qMpyvK4MLA0LFjMDE=;
	7:lgFVV84e0O+hxL7ViLU8coJrwOfYcJEpP1Cs6s6AvdIoGkydc3nyEoEU1v6VSkfkjqsEX4kRO6Xtt/xDXlYeoCkl6sTDvXDCVZ/5OifEoHg1+R9u1+QQt8Qopn9ydX68nQo+w1qRWyxhDu++O2KxjymW8HqUDPuQvOyrdswuITbmczax5fA3lVEM7jpEiXRAPitJb6fZC6hUUDJM8UKgs71TI1MVHUbiNvcvEb4s8JJW4t5VEFpwsa3Z1ZZ7L8GY
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 9a24f0a3-5c84-4e17-1c3a-08d56cb0e005
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:HE1PR07MB1467; 
x-ms-traffictypediagnostic: HE1PR07MB1467:
x-microsoft-antispam-prvs: <HE1PR07MB146784E81F8AAD1BB7114154C5FE0@HE1PR07MB1467.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(788757137089)(264703809997249); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(3231101)(2400082)(944501161)(10201501046)(6041288)(20161123562045)(20161123564045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:HE1PR07MB1467; BCL:0; PCL:0; RULEID:; SRVR:HE1PR07MB1467; 
x-forefront-prvs: 0574D4712B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39850400004)(346002)(39380400002)(396003)(376002)(366004)(377424004)(189003)(199004)(6306002)(9686003)(110136005)(966005)(3660700001)(3280700002)(105586002)(99286004)(7696005)(5660300001)(14454004)(7736002)(6116002)(3846002)(6246003)(68736007)(305945005)(59450400001)(6506007)(33656002)(106356001)(55016002)(26005)(81156014)(81166006)(74316002)(25786009)(186003)(102836004)(8676002)(478600001)(6436002)(8936002)(2501003)(5250100002)(86362001)(76176011)(316002)(2900100001)(2950100002)(97736004)(53936002)(66066001)(1720100001)(229853002)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR07MB1467;
	H:HE1PR07MB1436.eurprd07.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: kWve3jqDVnABsmwRHL+Y5vHAH0PTHNvfuI1rXi0ImPX5gKXRNwJKFQYurbUz2sOXCGyPlQETL9wUJaydsQpcww==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a24f0a3-5c84-4e17-1c3a-08d56cb0e005
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2018 15:55:27.0955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB1467
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
X-List-Received-Date: Mon, 05 Feb 2018 21:30:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

2018-02-05 15:07, zboszor wrote:
> I have already sent this patch (although a little extended) last week:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-
> February/147071.html

Thanks! The second patch you sent in with that actually solved some other p=
roblems I was having as well. Still one left to fix:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12534

See also the comment I added to that bugreport just now.

Best regards, Matthijs


> 2018-02-04 23:23 keltez=E9ssel, mpvader =EDrta:
> > npm now requires --force to clean the cache, see [1]. Also, use clean
> > instead of clear since the latter is an alias.
> >
> > [1]
> >
> https://github.com/npm/npm/commit/34f24c8381235790945208d25ac193bc
> 97a2
> > 1b79
> >
> > Signed-off-by: mpvader <mvader@victronenergy.com>
> > ---
> >   meta/classes/npm.bbclass | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass index
> > a69bedb..43aed36 100644
> > --- a/meta/classes/npm.bbclass
> > +++ b/meta/classes/npm.bbclass
> > @@ -31,7 +31,7 @@ npm_do_compile() {
> >   	fi
> >   	npm set cache ${WORKDIR}/npm_cache
> >   	# clear cache before every build
> > -	npm cache clear
> > +	npm cache clean --force
> >   	# Install pkg into ${S} without going to the registry
> >   	if [  "${NPM_INSTALL_DEV}" =3D "1" ]; then
> >   		npm --arch=3D${NPM_ARCH} --target_arch=3D${NPM_ARCH} --
> no-registry
> > install
> >


