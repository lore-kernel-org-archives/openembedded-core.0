Return-Path: <rasmus.villemoes@prevas.dk>
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur05on2100.outbound.protection.outlook.com [40.107.21.100])
	by mail.openembedded.org (Postfix) with ESMTP id 76B3D7FB3E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 22:25:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ELCU5X7Ni/VdtLhNsXG0exdV7jXWiPs+Aqn/iY6b5GWIEU5wQDkIUWlBw377fK0bBEBAOU3mw21wdsK63MzDnFaNE2fBWNGJN5N/4KAcYBb4RRYPCxLMC52dV3YM8h8WFKXUZVo0i2WcVuBmk38WdL3Y4CqiYSEsldf2+Jj24HspCQoaSMDm8LPIcZIaK1IXUyPXt/lhtTKCHCvD9qx+FH0VCTanc5u/uI1kigTLoAH5BvLN6cJ4aCuGkHAtkBkmxhnc0TthfWT3anJcnr9xFw2B1WljgUmx8uhGF71T9UKDf+pTJS6wNW+Y9+iO0G1xqyM1myahKF7K9XDbFWT8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8Rt1uxeyriWxrNctcfE5egO1Eqi6Dah+Dd2y/LmZOqo=;
	b=KabF5W80X7ZreOUt8SCV8QVrGSMkhceQ0BRIELdiFtr8tUiszORgUoXLJ3x0yN1+clC0jbLNO+XlqTnC5TnLgMTTaPx1a9Jloi6u4ZPFVM9+C6p83r52HQsVo+IGZXXQsbZKe2flBICOfaZF2SY70HPUq26oi3w7Q9vnO2WTSoqKzFdeRgHn1SYuXxbBeIL013PzncN6sKITOMx978lGWS000yIA44iupZgAbSIFbqnpCRKHxSHoZdkgz1pwz/InlkCtks2qA2Bmb9gNLHIaDd+fEnDuVwR7HIh7leA4fa5/gkN9Ag0Q7PUvePqNptE73n5T57xAYAnWgLv7wydLiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk; 
	dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8Rt1uxeyriWxrNctcfE5egO1Eqi6Dah+Dd2y/LmZOqo=;
	b=mNI7z5mXApq5eeEyHIrgi0rgFuCiiHDDE2OCP6oaSRtiXXKisdjVFjd0EZPEnEmcHSoAaI7gnAz4WaoQE8XLCHpNGeDVHcNwHbLKewf3+3Od2dMsZXeCCGAYQfDeZSiebTO3E8z9dhwjEOliKs7dcW9tMzxAQDL7oj6NKvLf2DE=
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (20.178.126.85) by
	VI1PR10MB3232.EURPRD10.PROD.OUTLOOK.COM (52.133.245.139) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.19; Sat, 18 Jan 2020 22:25:45 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
	([fe80::8175:5aa2:2870:766d]) by
	VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
	([fe80::8175:5aa2:2870:766d%6]) with mapi id 15.20.2644.024;
	Sat, 18 Jan 2020 22:25:45 +0000
Received: from [192.168.1.149] (5.186.115.54) by
	AM6P194CA0060.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::37)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20
	via Frontend Transport; Sat, 18 Jan 2020 22:25:44 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Thread-Topic: glibc and LDFLAGS
Thread-Index: AQHVzk457hrlmzQvPEiZCyrPnUNP7w==
Date: Sat, 18 Jan 2020 22:25:45 +0000
Message-ID: <2aedfee9-2985-e246-6a8c-7ec673039704@prevas.dk>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P194CA0060.EURP194.PROD.OUTLOOK.COM
	(2603:10a6:209:84::37) To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:803:e1::21)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=rasmus.villemoes@prevas.dk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [5.186.115.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb37287c-ace0-43ba-9348-08d79c655c3b
x-ms-traffictypediagnostic: VI1PR10MB3232:
x-microsoft-antispam-prvs: <VI1PR10MB32325841864EED6FB2B3EC7D93300@VI1PR10MB3232.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0286D7B531
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(396003)(39840400004)(136003)(376002)(366004)(199004)(189003)(478600001)(4326008)(71200400001)(31686004)(16526019)(8676002)(81166006)(186003)(81156014)(8976002)(54906003)(8936002)(6486002)(16576012)(316002)(7116003)(2616005)(956004)(26005)(66476007)(66556008)(64756008)(66446008)(31696002)(2906002)(66946007)(52116002)(36756003)(5660300002)(44832011)(6916009)(86362001)(3480700007)(4744005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB3232;
	H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: prevas.dk does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NfzddZf+wly+qP3c7LKy9YMC6fOWu5LmonL8RZUXtqZR7o5OiKv5kbJjHkWcCOH/U/zICFAc/08x0Md5022c+pUVe+YkOrN49/zHNW31spehnWFRvac0zmvAl45g4FGaAahaXYdMYk/IdRrUnWBaKgFB9zbx1Ja7RBlKnPaMSe0Uvx5RC//Eu7RUQxB4YB1kdopcTCLw9R/6Tal9EpziqxlIncOSLpd+V4PZJpLKx1ae6+H29fA+SDLjpHOAaM7Vn3Ki++RatWGWQR8tiGy0Bm1CbBd7ZmhS55Yxvvb17zGzdvTNYrI/PgLetDlKBDPvo8YAPEm/BdxrbMFjUm4NpzhAjhc0A987Gc07/JttRTc3Dq+TvVeBrZ7+QCWd9ElLBKn2Vq3ongaz7815JVv7wDfNQOwfqlR8OoXLifqn5Mw/irnYZeTxy2bFdKbd9Bhe
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: fb37287c-ace0-43ba-9348-08d79c655c3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2020 22:25:45.1321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zKlEthRgtaAXCvrae9A/DxX//vKLlMVAEKWq5NqAiroDTxrd6eYp7TgyhIa+ffWh2Wkjj4MdnQLUGPbpNeByx40juUHkmCfj/Ow0p/TVIP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3232
Subject: glibc and LDFLAGS
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
X-List-Received-Date: Sat, 18 Jan 2020 22:25:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <457A9D182AD5754B8E29E2DA5055C2F6@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable

I've added a custom setting to TARGET_LDFLAGS, but then I noticed that
the glibc build ignored that. The glibc do_compile did

 LDFLAGS =3D ""

for a very long time, with the explanation that "# -Wl,-rpath-link
<staging>/lib in LDFLAGS can cause breakage if another glibc is in
staging". Is that actually still relevant with per-recipe staging?

If that is indeed moot, can we do

         CPPFLAGS=3D"" oe_runconf
 }

+LDFLAGS +=3D "-fuse-ld=3Dbfd"
 do_compile () {
-       # -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if
another glibc is in staging
-       LDFLAGS=3D"-fuse-ld=3Dbfd"
        base_do_compile
        echo "Adjust ldd script"
        if [ -n "${RTLDLIST}" ]

?

And if not, at least move the LDFLAGS definition out to recipe level so
"bitbake -e" will show the value actually in effect? (And that would
also allow a .bbappend to tweak glibc's LDFLAGS with my custom setting,
though it's annoying to have to maintain that, so the best is if glibc
can just be built with the global LDFLAGS setting).

Rasmus

