Return-Path: <fsnow@phoenixcontact.com>
X-Greylist: delayed 101321 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 23 Feb 2019 01:08:10 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr150075.outbound.protection.outlook.com [40.107.15.75])
	by mail.openembedded.org (Postfix) with ESMTP id 77C527CBA1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 01:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=phoenixcontact.onmicrosoft.com; s=selector1-phoenixcontact-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=iUsfwzfIWipscmvqEiZCoBdtXOXQD9lepGw3G5XbGcs=;
	b=FeVwk9yzeVOrkO1yf/LkzTF3M3YTpQePoj98CPrryqkNdqBAvdYsbUycURUSMhXwfBh6zjBVuSmgMOYqGHuc7e5ZIYK0Z6gY8YOQt793gz1IR14jsAw5NFRHV+X11SBpmoIl6N+5IH92Y0I0fLg6J0ufWGBwHslxi0WMABnCM3g=
Received: from AM4PR0501CA0052.eurprd05.prod.outlook.com
	(2603:10a6:200:68::20) by AM6PR0502MB3880.eurprd05.prod.outlook.com
	(2603:10a6:209:2::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.19;
	Thu, 21 Feb 2019 15:07:58 +0000
Received: from VI1EUR04FT030.eop-eur04.prod.protection.outlook.com
	(2a01:111:f400:7e0e::200) by AM4PR0501CA0052.outlook.office365.com
	(2603:10a6:200:68::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.16 via
	Frontend Transport; Thu, 21 Feb 2019 15:07:58 +0000
Authentication-Results: spf=none (sender IP is 51.136.18.164)
	smtp.mailfrom=phoenixcontact.com; lists.openembedded.org;
	dkim=fail (body hash did not verify)
	header.d=phoenixcontact.onmicrosoft.com; lists.openembedded.org;
	dmarc=none action=none header.from=phoenixcontact.com;
Received-SPF: None (protection.outlook.com: phoenixcontact.com does not
	designate permitted sender hosts)
Received: from azr-iqsuite11 (51.136.18.164) by
	VI1EUR04FT030.mail.protection.outlook.com (10.152.29.110) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.1643.11 via Frontend Transport; Thu, 21 Feb 2019 15:07:57 +0000
Received: from mail pickup service by azr-iqsuite11 with Microsoft SMTPSVC;
	Thu, 21 Feb 2019 16:07:57 +0100
Received: from EUR02-HE1-obe.outbound.protection.outlook.com ([104.47.5.52])
	by azr-iqsuite11 over TLS secured channel with Microsoft
	SMTPSVC(10.0.14393.0); Thu, 21 Feb 2019 16:07:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=phoenixcontact.onmicrosoft.com; s=selector1-phoenixcontact-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=cSk/zCjv094swLd60Zcl8Shlxd+ewb6GCXuXKajQQFY=;
	b=EBD19NjHIxSGPpXJSe6vVedUIOhnpdxJ/AIiqKcWxO9GG6928ZZRJXVnh9pyMS5NAfNyhVSQBV39mmwPNimJYdAjO9H+x8IHkoJTN8DCLsIGP37Hx5COMgIGEsiPj2yaftdTpL8KmIlsY67w5o353mUYkUP0eY494nOuiou/wGs=
Received: from AM6PR05MB6357.eurprd05.prod.outlook.com (20.179.5.150) by
	AM6PR05MB5303.eurprd05.prod.outlook.com (20.177.197.12) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.21; Thu, 21 Feb 2019 15:07:54 +0000
Received: from AM6PR05MB6357.eurprd05.prod.outlook.com
	([fe80::65c1:8a3e:3f16:9d95]) by
	AM6PR05MB6357.eurprd05.prod.outlook.com
	([fe80::65c1:8a3e:3f16:9d95%5]) with mapi id 15.20.1643.014;
	Thu, 21 Feb 2019 15:07:54 +0000
From: Felix Snow <fsnow@phoenixcontact.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] version upgrade to python-click   -   patch
Thread-Index: AdTJ9y9+zBNf/xwOSPeHb6hFOvsP8A==
Date: Thu, 21 Feb 2019 15:07:54 +0000
Message-ID: <AM6PR05MB635702A03A8C85CA0B17D0FDDB7E0@AM6PR05MB6357.eurprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=fsnow@phoenixcontact.com; 
x-originating-ip: [62.157.123.101]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: af4ae4fd-b760-402e-6357-08d6980e5d22
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(49563074)(7193020);
	SRVR:AM6PR05MB5303; 
X-MS-TrafficTypeDiagnostic: AM6PR05MB5303:|AM6PR05MB5303:|AM6PR0502MB3880:|AM6PR0502MB3880:|AM6PR0502MB3880:|AM6PR0502MB3880:
X-MS-Exchange-PUrlCount: 8
x-ld-processed: 6868843b-f012-4c95-a18e-bab826cca9ac,ExtAddr
X-Microsoft-Exchange-Diagnostics-untrusted: =?us-ascii?Q?1; AM6PR05MB5303;
	23:GdnMtRWlKtgPAkgWpQj+280BliLwWOAWk+m2h24zz?=
	=?us-ascii?Q?y2eaK28JkQ7xsmPR/N/kPlaa7hR9sW5meZzlLky4+8hEKWg31r1UkVC7fmkV?=
	=?us-ascii?Q?MXNC+O/zkYJZnfsxI8u9lcmxgL6kOfvDWEgGJIzGyD1mhvr3Dhp1RuDMDyOS?=
	=?us-ascii?Q?ERVjV+tlb6OviwgAP3XsIoxXGr1Wk1Yb4WFQ3F0ETHmTgsvn+4x8ceuBQIDg?=
	=?us-ascii?Q?kp7kRL1pZusAmAyX47ZnxplTbCt9yllA3zMc4hQM77QmaMOUQlzyeqUqlWCl?=
	=?us-ascii?Q?pwua4x8E4ErmS22G5AgihLQsp0sySEW2bYkaXQSgDxEZ1QJWSJzI533vqhyV?=
	=?us-ascii?Q?4ABiGMriUiOOlAqENKLHU2rDhZWYSJjiy3pvORqp0tJzJPN7jIDSrf6dKhq2?=
	=?us-ascii?Q?QnXmneKZwMwvHQIyiQeMRUX3B78dCMBnfcvs8WNPEzJ+Exh4qI7zDsIqIXpu?=
	=?us-ascii?Q?vG8FQLKLzAzseb5t2+vqHr9DamZnN4jZXqtmM35CrPM2IKRVsrMIbb4L3hdK?=
	=?us-ascii?Q?BclJngDu0+duqCrLFS66JblqPFRj+eL6XEgN9lUESMJTKKOoD+XWcPwFl8i5?=
	=?us-ascii?Q?0Df+rVbSseaFYEr1oPG0dEQNudM3tAbjsOradPTb1R6Hc1ljQvkZdborHKql?=
	=?us-ascii?Q?hnbAYCjazKezKjAMA9fXauWAvxuxTjvGwYLWpnMHS3bV1eZ6250jdCfe7rLi?=
	=?us-ascii?Q?XlVZP+RiqMhoco/bYVo+QxhoNyhCV/VWUkrGGhJtqVB40HYPoAH/+dxZLCeB?=
	=?us-ascii?Q?Unq4uUekkFqGvPOhT/x/oCNm+rF/Sog2RKTzD41W3qSgsHOUIq8huQ33xQ/Y?=
	=?us-ascii?Q?+x24n3Ds2xNb+BS63y+D2SWqHeSweeJJZZ8WRXoBwrZivTlQrKyTnxb+l4zm?=
	=?us-ascii?Q?1L5+MwRK/3lMkDbnlUfsRNoAw80IClU0ROgsXh1YnaWz/voTRpAtwkiNvy9u?=
	=?us-ascii?Q?A8LkiJSEFTem+9/Ceq4QQ5vQKQE+IWcFPJpozIG1b61BPnwdeNDZA750E521?=
	=?us-ascii?Q?8wF661k5qUx7irg7WijyA1DHPo5H69v3GFNY7SjWlBp4AvUnjR+ZhNWvxFS4?=
	=?us-ascii?Q?3hohSSjGj4ua6QGOojRZK5Qa9a2nW+nmMibNKifgVbCwuV4PoxxngYsCgyNn?=
	=?us-ascii?Q?bI7psyEPMlZMRt7Zazfr8ofh2y2S/gAOYe/re7s0xrvCqUsWCwi9NFbYdhlE?=
	=?us-ascii?Q?J636275ZuXg4GUPwhPpr31HqOXMvozkrfjBIqQs4h6X889l2LOdysxd8ZPwA?=
	=?us-ascii?Q?qlB1yEhK6ZpDes2AR5AAXvJrf3ftCnCNz6oF7RQ/efnY5R5XxTlKnIkVTGmr?=
	=?us-ascii?B?Zz09?=
X-Microsoft-Antispam-PRVS: <AM6PR0502MB3880FDA05CC2733D6ECA2589DB7E0@AM6PR0502MB3880.eurprd05.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10009020)(346002)(136003)(39860400002)(366004)(396003)(376002)(189003)(51914003)(199004)(54534003)(33656002)(316002)(53936002)(5024004)(102836004)(14444005)(105586002)(6116002)(106356001)(25786009)(2906002)(256004)(5640700003)(476003)(3846002)(66066001)(2351001)(2501003)(6436002)(9686003)(6916009)(478600001)(26005)(7696005)(486006)(55016002)(81156014)(97736004)(81166006)(86362001)(186003)(6306002)(305945005)(53546011)(14454004)(66574012)(6506007)(71200400001)(966005)(99286004)(5660300002)(8676002)(74316002)(68736007)(7736002)(8936002)(71190400001)(99936001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR05MB5303;
	H:AM6PR05MB6357.eurprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: phoenixcontact.com does not
	designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: IN/viV4/VZq2U5UrJBEyXXH7JOl5egxLQxbfxudL3UCqdIVLYOKdCA6/Vj+cOplR1b1JFmXKBSN4r8Vb2tBzlrT2S/d9Sm/Kp5Z/dONInbWKInWI4isvu2si//7DahpBKHnuZz61HfTtGj8/LJXIUObz1i2dhgfDFUve2y0o/AOqazOfBz0R6DA+O2no+K85hETDgThYqvErY7GF5RoG5bWoijypvnSdmvkOlYna3lT+e5XJZ/EGBOdprd3jq3jFXzDIRFebRxKr2gyCkLALphUjTVqznS80tRbaHwoMwZrnZorKvffWL+aDiEOe783LgtWsgkSXY9NinA87IwCjv6/9jux53lpc1OQPEnTV2syD0ijcATbfp+iYJyMst5a5DXN5Pn83RTzSWMN7NjUfHlN2lxIqNHtsSzxl9pr0VL0=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5303
X-OriginalArrivalTime: 21 Feb 2019 15:07:56.0170 (UTC)
	FILETIME=[39A35EA0:01D4C9F7]
X-GBS-PROC: k7BRzbpU//IoBiUoohvGGNM72J/REaZw8Tl/jmSegtk6rGS+eqN2h5jGXotFRQN4
X-GRP-TAN: azr-iqsuite11@15BEF5257BA1480C8DEE965DAE642B94
X-iqsuite-process: processed
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VI1EUR04FT030.eop-eur04.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:51.136.18.164; IPV:NLI; CTRY:GB; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(346002)(136003)(396003)(2980300002)(428003)(199004)(54534003)(189003)(51914003)(33964004)(568964002)(55016002)(99936001)(5024004)(71190400001)(106466001)(68736007)(356004)(36906005)(186003)(25786009)(99286004)(14444005)(97736004)(2351001)(86362001)(5660300002)(66574012)(26005)(235185007)(105586002)(7696005)(2501003)(81156014)(14454004)(6306002)(486006)(53546011)(9686003)(476003)(966005)(478600001)(102836004)(2906002)(81166006)(5640700003)(84326002)(305945005)(33656002)(126002)(8676002)(6506007)(6916009)(3846002)(316002)(336012)(16586007)(53936002)(8936002)(2476003)(61614004)(7736002)(74316002)(6116002)(66066001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR0502MB3880; H:azr-iqsuite11;
	FPR:; SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: de9859e6-7fa6-4dcf-dee9-08d6980e5b5a
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(710020)(711020)(4605104)(2017052603328)(7153060)(49563074)(7193020);
	SRVR:AM6PR0502MB3880; 
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0502MB3880;
	20:rVaKGJhm/UQ5EcwkHy03a32FjZ/JZYYg5aZVb7q6w5etpR93Y2tyJSi436ze4+5XBooA9C5HtfyU5G03ipCCUMgbZxSYV+HMLgTKGque8I44W5vOy7tNZ8E1EAdwWv+pw4XpufXtNy6MIKcqHz+5IkCqDVQ1XSOr+uEtV0wgbg3g324zIfnSXubQx1sTBiJkfuXstKKtdywFx+Talas23mW0cItQCNJfz0l9cMcTHG0crjwm1d6cCTJRxwkNyQIJ5UipK0ZVbBWbGRstBLXkssDYuJUQeAdtwSyN/p4dSMoZDqi/yem/AogybzO9j2Ra37quYeOlcdG4ve2b8cjeSAFLvYwdZxmdnAY2te1znOY9Uywoh5+bTX2S5ioPPAJ9qvDqrwb/PShD2sX3aX8P7/Bs6qZbsCDiXKGWzrwecEtvXjXNRUfYv5bE2GHHTpO4IFzgQKJigkkouPZFgem3oP0jflwI6Q9GQCfNXiSmSgJYRRQigIt5JPwua8w/GKkytHXjUixPZSL/xDxd5kfPwMAwDJVcfgWNIG0sZ+qMk/l3su3M8jzonriCUqQNbfzSL1nxIACuaSPNGv7dR2XS9KzVYEV1CpnA2OY2Cpj9Jw4=
X-Forefront-PRVS: 09555FB1AD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM6PR0502MB3880;
	23:BueZDDouDg6PzROrIWGAuZGBuaROgxHhG0n33Tq?=
	=?us-ascii?Q?GeOai4Bb8dFd+v7RROiWPQ5bFTXQyVXFWbO3PqQFGgqulb7XYeZ9NjszFcRA?=
	=?us-ascii?Q?BU8g+xDFl5IFNVmNqpY+8Vq8wdhlC4ET0aEKRJRPaL2dD5eJSJ8m2v6g+8/x?=
	=?us-ascii?Q?jVtQQBzdVASuP5W6OD36N5iK6mg7O328qrLVDWikdIdwYCDE7vjPDMVMjKKn?=
	=?us-ascii?Q?3PccYV4NpzKZUseAJTaatHrQSrbqOvTt3SRtyPaB09kFBIfwiJOs27+xHhtc?=
	=?us-ascii?Q?mZWnIKYtvwKcIXTDdwu9yEkL0nNBkL7/oXaVGwJOwFq1IDzUwJgZHFWB6V3q?=
	=?us-ascii?Q?5NcwEqXpSRJHnM3BM3YKa8WKgqbexYbnF3Xp8V++S4HevfsYNy2djbK/gDBl?=
	=?us-ascii?Q?b0aMBnIrqRT6blMNFBE8/G13MChs8eC2rm5zMxBGadwPvE4HeyYexSDC1iUD?=
	=?us-ascii?Q?YYvD4C3iYrEUGvy//R4sicQ6duKFYUV1FgTAZMeRgTeiSTRMyDrlOqzLZ/9w?=
	=?us-ascii?Q?CIeJsFK4ucYJdSGwGF0gCym5fne04cjlkfTCx2ZswYigegtGf+n4bAKFif+l?=
	=?us-ascii?Q?WMZNfH1g4BF8bIsUhPouQBWgSEA2HbpPCUz2Pz8c8a2aE1fZExDfae7d3ijs?=
	=?us-ascii?Q?3FVJHHRaheffr9D6uAO2IzDCnwkTOBvJJvqY2hIVdVrdHhIv+62HajgYI+c0?=
	=?us-ascii?Q?fcZnRNE06NRLeurY3aCGk/1/yl/ZNzMiRoTpzww18NKhP6zuSWPATNh3YbGg?=
	=?us-ascii?Q?h+Rqz7/X3Uuf6gq/FA8VVzi3S8PvXxQ8iqbOlH0dwhyIfjnHwFKisprNSrj5?=
	=?us-ascii?Q?EjpVYdxtGiMoMukNTsagIeCVxRmqJKj3qZd0JEMppIWIurSqpm+xRWuB7eTx?=
	=?us-ascii?Q?qjeaiPpGB5I1iTbUSXYwFd1fk5cc0Au/9Avt46Rt58mCPPLH2ooP/i5yFPr+?=
	=?us-ascii?Q?Kox+f5EW8iSpoZ8etLgeO/E1m5QGPgsd2pYmxACo6gZs8lFnDGl2RIA4CS63?=
	=?us-ascii?Q?sBf6Lq05HWp2byukSvNnPfckWUF7mh/o4CNqYtVW9ECpxROaitHzlqbS23SP?=
	=?us-ascii?Q?rNrv2KANUGTpyOv1ld7XvtQv/zcVfFYvTQZVdfgxxSXnhtTZu9brynJaay6F?=
	=?us-ascii?Q?PuQ3IndXZq4kWPfzHtMmDJW9g5fjgVo3+hgyXChv8AlzIeFG6YPX/chq1jEm?=
	=?us-ascii?Q?tLTtgJYgcGt8segX6fVXAJRT31LD2HnV4TuReHpoibmxNsBcvQN6oAcbk4zJ?=
	=?us-ascii?Q?YMZvBna34ABy1Nl+bJ7aR2Q2XpjB34HLelrnqYr+VTnh9vBuOYVCShV9cR2n?=
	=?us-ascii?Q?ghOjGDYms0m6Ne54giBIC7vNV4gYoX8LakRDvaDb40OTkij6kh7H/42cn+oV?=
	=?us-ascii?Q?23vOyRVZe950Tr0ZR1MSXbKjqqJON0AI8aWNtaI2uJoD3cvD0v5Pg4NeD7Qu?=
	=?us-ascii?Q?euqU4TqGVfblnUrLghxI6MIL3LVUfM+W4ocJea59n5Q0qSVo4aFpRrPpeWEO?=
	=?us-ascii?Q?iZingRitsffZKAPjH6xK6a3FbfX5Sma0K67o=3D?=
X-Microsoft-Antispam-Message-Info: wdfA7IYiZm2ZPVOX+Kl+HnFps+6bUPb4wRyN94CxSAPDT/detPzGG30o09vkkBJFlQ2FkmCBazVUvv3EVUWUrrVI09kVcXq7NCsYMItfYY7btxOTjkTrOtABoFgxut7FG2OkciRSY+wiM5nxQ136i/lBgfYQnuQxCtoLU9u2ayerw/cEF5f0D6ltN5Ji76cEE3bXdQ/cB+ou6Bjn2U1cuQoQGfgTPU8wa48p5SbkBdMJinDidVJDW85GiJBZJwvgNQ88xwUaMCxYsUC353ITD4NFIvIfE1BMdjH3Y7SaUj5zwWArgyd2i5Zsf0xgbumbX4juhf3bkQZGwQPMaRL9fAQJXrbdRxKVh+KHeX4qU6tAbPr3ZLeiMXm7s97kdNKIPASmQ546yXF7CCLn2U3mgwLKIoN7rsiBaj2cjuxrdtY=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2019 15:07:57.8011 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af4ae4fd-b760-402e-6357-08d6980e5d22
X-MS-Exchange-CrossTenant-Id: 6868843b-f012-4c95-a18e-bab826cca9ac
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6868843b-f012-4c95-a18e-bab826cca9ac;
	Ip=[51.136.18.164]; Helo=[azr-iqsuite11]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0502MB3880
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0502MB3880;
	23:a8uIJ7zJn0zr1FnwcOW22ZphA3FlhN9efT+DKmjCgeE+k/wwPD7pr66EFwyaT40S6v1H9lS2KiM3ctVB8mwU8i0PzSSVkEf1vnawv3Xi0n8HRu/LNumfnYXzOo2hrLsjUF/Lw7YtF86nBZ5cK/eTuA==;
	23:ClOZWi57QYgvTtBww4chHHPAdf/Z4T+vt6repU3XiLEUgcBjGYg4YFchQoy89Ui9fzOpPLnZvTvJtXqXZO1yfFlfSX73RJMP+l5+n/KcR2qxgGAAo6jm0o8FFht+l58kW3w5QRhqfml550GE9Dp3IA==
X-OriginatorOrg: phoenixcontact.com
Subject: Re: version upgrade to python-click - patch
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
X-List-Received-Date: Sat, 23 Feb 2019 01:08:11 -0000
X-Groupsio-MsgNum: 121554
Content-Language: de-DE
Content-Type: multipart/mixed;
	boundary="_002_AM6PR05MB635702A03A8C85CA0B17D0FDDB7E0AM6PR05MB6357eurp_"

--_002_AM6PR05MB635702A03A8C85CA0B17D0FDDB7E0AM6PR05MB6357eurp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sIA0KDQpUaGFua3MgZm9yIHRoZSByZXBseSwgSSBoYXZlIHRyaWVkIHNldmVyYWwg
dGltZXMgb3ZlciB0aGUgbGFzdCBmZXcgZGF5cyB0byBzdWJzY3JpYmUgdG8gdGhlIGRldmVs
IGxpc3Qgc28gSSBjYW4gc2VuZCB0aGUgcGF0Y2ggdGhlcmUgYnV0IGl0IGRvZXNuJ3Qgc2Vl
bSB0byB3b3JrLCBzbyBzZW5kaW5nIGl0IGhlcmUgaW5zdGVhZC4gUGF0Y2ggaXMgYXR0YWNo
ZWQuDQoNClRoZSBjaGFuZ2VzIHdvcmtlZCBhcyBJIGFwcGxpZWQgdGhlbSBpbiBvdXIgZmly
bXdhcmUsIGFuZCBJIGNsb25lZCB5b3VyIHJlcG8gbG9jYWxseSwgY2FyZWZ1bGx5IHB1dCB0
aGUgY2hhbmdlcyBpbiBhbmQgY3JlYXRlZCB0aGUgcGF0Y2guIEFtIG5vdCBzdXJlIGV4YWN0
bHkgaG93IHRvIHRlc3QgaXQgZnJvbSB3aXRoaW4geW91ciByZXBvLiBJZiB5b3UgY2FuIGZp
cmUgaXQgdXAgYW5kIHB1dCB0aGUgZm9sbG93aW5nIGludG8gdGhlIHRlcm1pbmFsOg0KDQpw
eXRob24zIC1jICJpbXBvcnQgY2xpY2s7IHByaW50KGNsaWNrLl9fdmVyc2lvbl9fKSINCg0K
YW5kIGl0IHJldHVybnMg4oCcNy4w4oCdIHRoZW4gaXQgaXMgcHJvYmFibHkgd29ya2luZy4g
V291bGQgbm90IGh1cnQgdG8gZG8gdGhlIHNhbWUgd2l0aCBweXRob24yLiANCg0KUmVnYXJk
cywNCkZlbGl4IFNub3cNCg0KLS0tLS1VcnNwcsO8bmdsaWNoZSBOYWNocmljaHQtLS0tLQ0K
Vm9uOiBSYW5keSBNYWNMZW9kIFttYWlsdG86cmFuZHkubWFjbGVvZEB3aW5kcml2ZXIuY29t
XSANCkdlc2VuZGV0OiBEaWVuc3RhZywgMTIuIEZlYnJ1YXIgMjAxOSAxOTowNg0KQW46IEZl
bGl4IFNub3cgPGZzbm93QHBob2VuaXhjb250YWN0LmNvbT47IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQpCZXRyZWZmOiBSZTogW09FLWNvcmVdIHZlcnNpb24gdXBncmFkZSB0
byBweXRob24tY2xpY2sNCg0KT24gMi8xMi8xOSA1OjAyIEFNLCBGZWxpeCBTbm93IHdyb3Rl
Og0KPiBIZWxsbywNCj4gDQo+IGl0IHNlZW1zIHRoYXQgdGhlIGxhdGVzdCB2ZXJzaW9uIG9m
IHB5dGhvbi1jbGljayBpbiBvcGVuLWVtYmVkZGVkIGlzIDYuNyA6DQo+IA0KPiBodHRwczov
L2xheWVycy5vcGVuZW1iZWRkZWQub3JnL2xheWVyaW5kZXgvcmVjaXBlLzUyMTM2Lw0KPiAN
Cj4gVGhpcyB3YXMgcmVsZWFzZWQgaW4gSmFudWFyeSAyMDE3LCBidXQgNy4wIGNhbWUgb3V0
IGluIFNlcHRlbWJlciAyMDE4Og0KPiANCj4gaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L2Ns
aWNrLyNoaXN0b3J5DQo+IA0KPiBJIGhhdmUgaGFkIGEgY29uc2lkZXJhYmxlIHN0cnVnZ2xl
IHdpdGggY2xpY2sgb24gb3VyIGVtYmVkZGVkIGxpbnV4IA0KPiBhcm91bmQgbG9jYWxlLg0K
PiANCj4gSXQgd2FzIGEgaGFyZCByZXF1aXJlbWVudCBhbmQgdGhlcmUgYXJlIHdlcmUgYSBs
b3Qgb2YgY29tcGxhaW50cyBwcmlvciANCj4gdG8gdmVyc2lvbiA3LjANCj4gDQo+IEhlcmUg
YXJlIGEgZmV3IGV4YW1wbGVzOg0KPiANCj4gaHR0cHM6Ly9naXRodWIuY29tL05peE9TL25p
eHBrZ3MvcHVsbC80MTg0Mw0KPiANCj4gaHR0cHM6Ly9naXRodWIuY29tL05peE9TL25peHBr
Z3MvaXNzdWVzLzQwMTQ2DQo+IA0KPiBodHRwczovL2dpdGh1Yi5jb20vTml4T1Mvbml4cGtn
cy9pc3N1ZXMvMzg5OTENCj4gDQo+IEkgYmVsaWV2ZSB0aGV5IHJlbW92ZWQgdGhlIGhhcmQg
ZGVwZW5kZW5jeSBpbiB0aGlzIHB1bGwgcmVxdWVzdCAtDQo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9wYWxsZXRzL2NsaWNrL3B1bGwvODgwDQo+IA0KPiB3aGljaCB3ZW50IGludG8gdmVyc2lv
biA3LjANCj4gDQo+IElmIHlvdSBsb29rIGF0IHRoZSBjb2RlIG9mIHRoYXQgcmVxdWVzdCB0
aGVyZSBpcyB2ZXJ5IGxpdHRsZSB3aGljaCANCj4gZml4ZXMgdGhpcywgYnV0IGl0IHdvdWxk
IHByb2JhYmx5IHN0aWxsIGJlIGNsZWFuZXIgYXQgbGVhc3QgbG9uZyB0ZXJtIA0KPiB0byBo
YXZlIHRoZSBuZXdlciB2ZXJzaW9uIG9mIGNsaWNrIHRoYW4gdG8gcGF0Y2ggdGhhdCBpbiBv
dXIgc3lzdGVtLsKgIA0KPiBUaGUgbG9jYWxlIGlzc3VlIGlzIG9uZSBvZiBhIGxvbmcgbGlz
dCBvZiBjaGFuZ2VzIGluIDcuMCANCj4gaHR0cDovL2NsaWNrLnBhbGxldHNwcm9qZWN0cy5j
b20vZW4vNy54L2NoYW5nZWxvZy8NCg0KVGhhbmtzIGZvciBwb2ludGluZyB0aGF0IG91dC4N
Cg0KQ2FuIHlvdSB1cGRhdGUgdGhlIHJlY2lwZSwgdGVzdCBpdCBhbmQgc2VuZCBhIHBhdGNo
IHRvOg0KICAgIG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQph
cyBwZXI6DQogICAgaHR0cHM6Ly93d3cub3BlbmVtYmVkZGVkLm9yZy93aWtpL0hvd190b19z
dWJtaXRfYV9wYXRjaF90b19PcGVuRW1iZWRkZWQNCg0KLi4vUmFuZHkNCg0KPiANCj4gQWN0
dWFsbHksIGNsaWNrIGlzIG5vdCBleHBsaWNpdGx5IG1lbnRpb25lZCBpbiB0aGUgYmIgZmls
ZSwgYnV0IA0KPiBweXRob24tZmxhc2sgaXMsIGFuZCB0aGF0IHNvbWVob3cgaW5zdGFsbHMg
Y2xpY2sgd2l0aCBpdCwgSSB0aGluayBhcyANCj4gdGhlcmUgaXMgYW5vdGhlciByZWNpcGUg
Zm9yIHB5dGhvbi1mbGFzayB3aGljaCBpbmNsdWRlcyBjbGljay4NCj4gDQo+IENoZWVycywN
Cj4gDQo+IEZlbGl4DQo+IA0KPiAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4N
Cj4gDQo+IFBIT0VOSVggQ09OVEFDVCBDeWJlciBTZWN1cml0eSBHbWJIDQo+IA0KPiBSaWNo
YXJkLVdpbGxzdMOkdHRlci1TdHJhw59lIDYNCj4gDQo+IEQtMTI0ODkgQmVybGluDQo+IA0K
PiDjgIANCj4gDQo+IFJlZ2lzdGVyIENvdXJ0OiBBRyBDaGFybG90dGVuYnVyZywgSFIgQiAy
MDI5MDgNCj4gDQo+IEdlc2Now6RmdHNmw7xocmVyL0dlbmVyYWwgTWFuYWdlcjogS2lsaWFu
IEdvbG0NCj4gDQo+IC8vDQo+IA0KDQoNCi0tDQojIFJhbmR5IE1hY0xlb2QNCiMgV2luZCBS
aXZlciBMaW51eA0KDQouLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4NClBIT0VO
SVggQ09OVEFDVCBDeWJlciBTZWN1cml0eSBHbWJIIA0KUmljaGFyZC1XaWxsc3TDpHR0ZXIt
U3RyYcOfZSA2ICANCkQtMTI0ODkgQmVybGluICANCiANClJlZ2lzdGVyIENvdXJ0OiBBRyBD
aGFybG90dGVuYnVyZywgSFIgQiAyMDI5MDggDQpHZXNjaMOkZnRzZsO8aHJlci9HZW5lcmFs
IE1hbmFnZXI6IEtpbGlhbiBHb2xtDQo=

--_002_AM6PR05MB635702A03A8C85CA0B17D0FDDB7E0AM6PR05MB6357eurp_
Content-Type: application/octet-stream;
	name="0001-upgrade-python-click-from-6.7-to-7.0.patch"
Content-Description: 0001-upgrade-python-click-from-6.7-to-7.0.patch
Content-Disposition: attachment;
	filename="0001-upgrade-python-click-from-6.7-to-7.0.patch"; size=2324;
	creation-date="Thu, 21 Feb 2019 15:05:17 GMT";
	modification-date="Tue, 19 Feb 2019 10:38:03 GMT"
Content-Transfer-Encoding: base64

RnJvbSA0OTQyYTBhODc4N2MyOTVmNjBhOWQ2ZjgyZTUwZTA2NDU1Mjc3OGM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGZWxpeCBTbm93IDxmc25vd0BwaG9lbml4Y29udGFjdC5jb20+
CkRhdGU6IFR1ZSwgMTkgRmViIDIwMTkgMTE6MDY6MDEgKzAxMDAKU3ViamVjdDogW1BBVENIXSB1
cGdyYWRlIHB5dGhvbi1jbGljayBmcm9tIDYuNyB0byA3LjAKCi0tLQogbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWNsaWNrLmluYyAgICAgICAgICAgICAgfCA4ICsr
KysrLS0tCiAuLi4vcHl0aG9uL3tweXRob24tY2xpY2tfNi43LmJiID0+IHB5dGhvbi1jbGlja183
LjAuYmJ9ICAgICAgICAgICB8IDAKIC4uLi9weXRob24ve3B5dGhvbjMtY2xpY2tfNi43LmJiID0+
IHB5dGhvbjMtY2xpY2tfNy4wLmJifSAgICAgICAgIHwgMAogMyBmaWxlcyBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24ve3B5dGhvbi1jbGlja182LjcuYmIgPT4gcHl0aG9uLWNsaWNrXzcuMC5i
Yn0gKDEwMCUpCiByZW5hbWUgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5
dGhvbjMtY2xpY2tfNi43LmJiID0+IHB5dGhvbjMtY2xpY2tfNy4wLmJifSAoMTAwJSkKCmRpZmYg
LS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tY2xpY2su
aW5jIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWNsaWNrLmlu
YwppbmRleCBjODE1NDViMTUuLjYwYmM0NmY4MiAxMDA2NDQKLS0tIGEvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWNsaWNrLmluYworKysgYi9tZXRhLXB5dGhvbi9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tY2xpY2suaW5jCkBAIC02LDEwICs2LDEwIEBA
IExpbmUgSW50ZXJmYWNlIENyZWF0aW9uIEtpdCIuIEl0J3MgaGlnaGx5IGNvbmZpZ3VyYWJsZSBi
dXQgY29tZXMgd2l0aCBcCiBzZW5zaWJsZSBkZWZhdWx0cyBvdXQgb2YgdGhlIGJveC4iCiBIT01F
UEFHRSA9ICJodHRwOi8vY2xpY2sucG9jb28ub3JnLyIKIExJQ0VOU0UgPSAiQlNEIgotTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDllOGI3ODY5Zjk0YmE5ZTlhN2IyNjBk
NTNjNjVkYWIiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnJzdDttZDU9YzEz
ZWQ4OTBiMjEwYTg4MmMxNzc4MjE2Njk0Yzk4YzciCiAKLVNSQ19VUklbbWQ1c3VtXSA9ICJmYzRj
YzAwYzQ4NjM4MzMyMzBkM2FmOTJhZjQ4YWJkNCIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmMTU1
MTZkZjQ3OGQ1YTU2MTgwZmJmODBlNjhmMjA2MDEwZTZkMTYwZmMzOWZhNTA4YjY1ZTAzNWZkNzUx
MzBiIgorU1JDX1VSSVttZDVzdW1dID0gIjdmNTNkNTBmN2I3MzczZWJjNzk2M2Y5ZmY2OTc0NTBh
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjViOTRiNDk1MjFmNjQ1NjY3MGZkYjMwY2Q4MmE0ZWNh
OTQxMjc4OGE5M2ZhNmRkNmRmNzJjOTRkNWE4ZmYyZDciCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VY
ID0gImNsaWNrLyg/UDxwdmVyPlxkKyhcLlxkKykrKS8iCiAKQEAgLTIxLDMgKzIxLDUgQEAgUkRF
UEVORFNfJHtQTn0gKz0gIlwKICAgICAiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2
ZXNkayIKKworUFlQSV9QQUNLQUdFID0gIkNsaWNrIgpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWNsaWNrXzYuNy5iYiBiL21ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jbGlja183LjAuYmIKc2ltaWxhcml0eSBp
bmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbi1jbGlja182LjcuYmIKcmVuYW1lIHRvIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbi1jbGlja183LjAuYmIKZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfNi43LmJiIGIvbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja183LjAuYmIKc2ltaWxhcml0eSBp
bmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtY2xpY2tfNi43LmJiCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzcuMC5iYgotLSAKMi4xMS4wCgo=

--_002_AM6PR05MB635702A03A8C85CA0B17D0FDDB7E0AM6PR05MB6357eurp_--
