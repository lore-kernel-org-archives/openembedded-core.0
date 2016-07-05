Return-Path: <carol.zhu@nxp.com>
X-Greylist: delayed 100642 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Jul 2016 09:45:34 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0067.outbound.protection.outlook.com [104.47.33.67])
	by mail.openembedded.org (Postfix) with ESMTP id EC41B60119
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 09:45:34 +0000 (UTC)
Received: from BLUPR0301CA0041.namprd03.prod.outlook.com (10.162.113.179) by
	BL2PR03MB1889.namprd03.prod.outlook.com (10.164.115.29) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.534.8; Tue, 5 Jul 2016 09:30:47 +0000
Received: from BY2FFO11FD023.protection.gbl (2a01:111:f400:7c0c::171) by
	BLUPR0301CA0041.outlook.office365.com (2a01:111:e400:5259::51) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.528.16 via
	Frontend Transport; Tue, 5 Jul 2016 09:30:47 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD023.mail.protection.outlook.com (10.1.15.212) with Microsoft
	SMTP Server (TLS) id 15.1.523.9 via Frontend Transport;
	Tue, 5 Jul 2016 09:30:47 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id u659Uiwo006846;
	Tue, 5 Jul 2016 02:30:45 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jul 2016 17:29:08 +0800
Message-ID: <1467710948-16681-1-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131121846472056134;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(68736007)(4326007)(5820100001)(11100500001)(50226002)(2906002)(97736004)(8676002)(36756003)(50986999)(87936001)(7846002)(356003)(81156014)(81166006)(2870700001)(8666005)(104016004)(305945005)(47776003)(92566002)(19580395003)(6806005)(2351001)(69596002)(230783001)(110136002)(105606002)(77096005)(85426001)(189998001)(19580405001)(106466001)(23676002)(8936002)(50466002)(586003)(33646002)(229853001)(15975445007)(575784001)(86362001)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR03MB1889;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD023;
	1:eCjAXRmKsWRnZ3E+m2yFvG2bH1djQH5E9nznxM11Fcw6yC19MhvNsEzWs3JFvKsVJOHdp5hIPZsZmMKtbSMb8kBkUW5NBrQk0i12NGzAvxHMUqkQ0GOHCjyjUKH2zn9HN6PjxesTz3HYgEr9aCeqDekJGBOzuWKQJUg1hdaMYU2f8Fwy9NwXL8qHWnwucmW2lulSRV1AjDS9cYAAjIq0IZtWOPwU1O//9gx7Myp4SADC9Ff2RqhekUXGs8qPlSeii0dKI5amt90Im+HlwW7GkUj8U3u4pdKRmk9oQ5Qx8ovAhu+URIkhos5DYdbQiwdpnvnokjYRsmUnEcF0ih/ipNAfODrH5qPikSAz4sd/jwGxPTdvH5z3+p/jUCKBlGjjCHLwRUDJH4c0TMDoSk951BaUEX/a2HRcMgt1GYku5p2M8/d3TvgQqH/8c566B9Z9jBz9Er8tMdcDbgn5UVrKTv2POxRWUJvIIaz71TmwxB8/vuREcXqbOb6iEbWXkOf6foHKZBIW0w3Ny6n9PM8MRXkH4xEYSojHa5/YZq02pl65J+0PsVRdBI9k41+ZF0tUwjInNLhBpfa32/rWgunWvpXd2ktHPmRQx8MJ4X1RfLA9+JcxJKGvJpxPRO653rqYyJ8eOgFmX0ulvvpY61An0hhAFsfJ5D7Quy/mUmZ3O//XSP0HIRxlEug7eg3EQDZo7/HjvYpkSAjXwIxXTVmkq+amepsznE0qKBZXN8SpvINrwprhwu4L+qAlGTDkCgJvG/2zjlubfHwkkA7i+4AEPg==
X-MS-Office365-Filtering-Correlation-Id: 2fa411e8-039a-4284-9d46-08d3a4b70bb9
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB1889;
	2:4XKaiQAR/7zgOG79JYmAkgJwaya41pRbxBpSiBp3ChYvsWJBRI5q9nGY6x4X4QTO2N/Gw0mvVXNoL0T9okiYLHS4VH1A6qUBr3euwdOF9vIZMinKwj0mCu1sfJkBshkhLGqRS/CqX2GxGiUaU29asRgE2FvNpr1LXML+oQANMZJVLGoPsZQN3ZV4JTdFMxQM;
	3:0PCdPWFOkhhQWqyENTf/O2gGCtLcxn/zkvXp5chxxJgTIRmcKKLPgl0KAYd/HoVjkKDtnWLbt8rg3u++RX7LbecqIY66FXXkkw47Q83+BBvoa7mMpDPrcDIx6R+leI+qs3OlS4H4TuWH7u1obPEiRvIroG3A14vBBfCU+tbTwHzUGfsFzyPK4eVvETpIem80DmxX/Pdo5SeXkPWHR7Ivjx8X5GxkH4xtVxfpiSZli9I=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2PR03MB1889;
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB1889;
	25:+qt5crxqzSWUV2y99mvBtQfdl2u9aaT8UJ//vLnEJR6l6tOhdUC4ciZWlHBqhxmP3zdcXB2EMvLRLWWV0BDHehdX87hNfuRNAdCU0Hna4OxoKlNkGBZ2L0EIsoxaQcSaoCqyR9MvmsFf01F9PW3KwMiwTu7hqHBAzULGVAbZDZ/kpz7L4cVQ4iuVCwzGIH0Hqqh5Yo7KIGVFmyRYEgUj+Q4Zl1Lvk3xAMc0PIyjgtSPrb4nLzVeJX0VWZg6RtVa8zHjoXzQ6Pc3J/rjtWZh9GxpvJJpYNGOBx453xf1aDUv3MPl+rHiLGIiA8oKnJBv5vNHqxSqaQwymAMUGiVzHxdh+NdJ5gf0qEV8y1+r8lv5Vb5AfmDmzwRMymmG0SHAd++oimUz/2ehI34g+ZE5v807ITNFFtCiDC3GzTh9IJGVfLLBWDbO0Xeu46N50ENOX93xnRX3LHBb971S8tuX9QdL74J7niE2/qyy3uUk6q9I96zWnS89J4ROONjuCuH/i0TJYFEsysy4o0W7xgwZP65Wg/K7F3BcnCk8qOPIURNh3dld3VJYO4NlrIY0Z8KjjGnxU7HZfdqeByG9C6qqJox+smkdTmkWWvFtFSd6xX5vgBQnAMRGax9b5NZ9562cWC7uDrLDgLagHW5Hi8S6aCeopSyoqUy1vOvJaozOpvXarXox4qGGb5YM1MsAgu9wM6LMx2iWCUXLhRR2LEzjWUcWUfb+KzibRnKDqqY+DCQafavdscSp0L6Qq8S64PUNsFVe63bwmNcbugx/xSe9/w3TjVrHI1xtAF15lfVt/9g2PpkYb1wXnpnvfFtz8AaR6UgujCrhYeBC345po57+dvnnGI7ztl4cMM8Rk2whZmFY=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB1889;
	31:ElJaM25iRVczNdB60ZT2/25d4+0tUxjUOeLzV/vHqLKgwxmQLU2Q0Bu/xEbAWORzHtRuzk3lkNyThJW8Ue6hZyf6umjUu0NlWMMFOvJI6xwVFComZ0K9QC+IjDvEcoTjH7+YKsYhMR5GLDHMRSfHi31ZlLW9jfmiLvkLuICnWka9r2HKAMe+AUX8KSJ5XXCR/6JDtaSHLo9M2SrOa4u0lg==;
	4:OIBpdDL9okP4nvRTVn1Bia1iIm5qdO8vFMXqMZxEzcYKc2mYDF06JWC3Zyg+ihDjDLaEOypvdutTm5rGmGx7rKDrjEyXxkE2iwqxSafyX5iR5WtXRdISrCxDYem4+2Uc2F6CY72sadI3UH+Wk59gNER0pm/iiNYY/zQ+qw6QjCufp3ovz1oVnZjL7Zs6WPUdJOODrqUjqqfgFZRxqqFYxJVQKV//QHE+TVwf39tEJBpu1l5ViRJg/hu5Pk/5ft6cgT9G3e1eoaQYzKMWLEJQpRoUv1dlREOEORZ1APA3+TeCCFlf2xBfJb7RR3NTuey03H2AvsP8z6nudWLCBeyqxMb5hlE6ng/FoxB5hCxojEl8QMo3SGoe0Ah84TB/GMX93WTjaWgpAKWRwCkGW7cYn4gwu4Sw+t8QOS4H5p+NMOcRVR2+6VWai0zSPaoaZ8NWjReVBck1YcHqviXH9YYkpYJkhPrTV/TkgSqPPyGMYNlBdAjnhJ2Zlx13fuuF+fFYnqRnvtJmNXl9IFOC7EdYLh5r5GK9VX3HQK1HPwxEtIo/o7qRNRjX11tCwurOLXcR
X-Microsoft-Antispam-PRVS: <BL2PR03MB1889F27790370A52CDA00F68E9390@BL2PR03MB1889.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(158362468548515);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13024025)(13023025)(13017025)(13015025)(13018025)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:BL2PR03MB1889; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BL2PR03MB1889; 
X-Forefront-PRVS: 0994F5E0C5
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTDJQUjAzTUIxODg5OzIzOjdWdnRSd0ErMG1nbkJ6alYzdnVBNWZmNllO?=
	=?utf-8?B?cGRoSzZzVkxVZGNjay9jYjZwTmVseVNlM29wQkx3akV6NXhESnNua2NJUFVE?=
	=?utf-8?B?MmRzdWxyUXpLMWlsSkp5bnNWcFFYQ2NXZzVnNWlTWGdTYU1tdE9VSjRCeStP?=
	=?utf-8?B?SHVuMDF2RklSeWIrTjdKRXp3ZlA3NHQ2N216S2FKNythT2FyVU9rWkJvazMr?=
	=?utf-8?B?WmpjT1paTTVKMEliWDBNTGlrM2RLbUdEUnVHNmVaWUFVbDdUdjJKS3BrZzYw?=
	=?utf-8?B?bVlRTDBjZXp5bzJGbVhZQ3VxWFd6cWd5UmFDZGMvMWlvTlM2MURjRmdqT1Ny?=
	=?utf-8?B?OExqQVJZOWhYWFdnUGJQamZ5VUc0anBoSWtVU1RyS2o1azMyN1YyTlJtSFpB?=
	=?utf-8?B?ODQ1R1Z5ckE4aU95NnpzN2xCNXdTZzQzd0M5WGJyQ0VqcWdiRENuNkpxWHpk?=
	=?utf-8?B?bzNSQ1RmNXhaTkpsNDRmeXRwRHhPa0ltSWkzYkdwcG5MMWFJODVlMTJnaXBq?=
	=?utf-8?B?dFdYR2FXYkhWU01kbHE4blRSR0ZUK2ozc1pCbmlrQ01pd0hKRWNrNWVMOTdQ?=
	=?utf-8?B?cjg2UDNrNmkzSzdGdUNjS3hmaEw1bEhrOHRYb1NFTVh3TGVHNmRvY2pISmd3?=
	=?utf-8?B?SGZVVXNUMjJBcXhJUjBoNVdyT2VRbXBhcUlzd0xScDhXTERrajFoK3ZHQVBZ?=
	=?utf-8?B?MVBaSEJUWUVpOGQ0cHJFUmtkcTBnNXoxMG12Zms2S05lKzBmbElEeHh2Y1c0?=
	=?utf-8?B?cWE4dkFUQ3Z1N2ZHcjdjaUNEQnRKVGJJREVXTjBEdFBMMFhyazdLMDRWUjVJ?=
	=?utf-8?B?UTU4MWVyby80YzBxQkR2RTFvU2FYSUZBTjNWRGRuaUc0L2xTYVdHNDZWYkpH?=
	=?utf-8?B?aFRUV1VOaVNzN1dKbklncXNGSkVWUDZNRUsvcjRJQ2VSZzlQZWZEZy9KeEZT?=
	=?utf-8?B?bWxNU3RPd3cvUVAyR1FUR2tJTkRCQ2NDM3NNL0dUb2JGT2FjTDluZjNiUW5s?=
	=?utf-8?B?Y3VaWjB6eENrZHlsS1NZaGlZNDVmT3dOQ1lYVGgwNnd3VXF4enNEUGxDbFJV?=
	=?utf-8?B?YnhXQmlHTlhzazRUa2tZVGZJUDdXcWRxdkZPbkx0YkV1bEQ5QUVtY3VSYnJp?=
	=?utf-8?B?bnh6UW9pMzRxaldCL0d4RCtoeDFPd2NnUmt6dGExenVscmcyVzJOWjJUbXRw?=
	=?utf-8?B?UjZCeDJUakxONko3U1BxeFR0azdjcVJhbnZaZFF0elVrWG5UcHJFdDBKZDNI?=
	=?utf-8?B?ODFhcWtKYzVSbkpOTnZyVHp6QUYzU0ZkbE8vWVQ3YjRHMG9mU2RHamUwMlhI?=
	=?utf-8?B?WTliMktubEk0dmc1dzNVRnlLSDJpOVZNaStrRVlQSnUrSGwvWGdEaW1ieVFO?=
	=?utf-8?B?aE9JeVpuLzJQQ2Rhdzd1RXQ0VWYrV0tsVmRacmVRWGZnQjJLOGJDdEd6eGJn?=
	=?utf-8?B?TDR5aWdRVkpKdm1Bb3ZweVMzUUp3UDZUY1ZWNmY3SzdlUEFsUW5uK1ptdVp1?=
	=?utf-8?B?N0w1bEdJSkxjdTdJTFZ3cWh6bW8veUF1di9BMnd0c25pSWxHNEVDS1VaSk5v?=
	=?utf-8?B?UmJ6VWQ5cUVyRDZUQlhJTWdYVTFQV3VvV1lXVXJ3b1dqcU1yS2o3bVZ4Wldt?=
	=?utf-8?B?M2dRcnVYTVBhNXZvRk9wRHpIZC9za05Mc1pKOWhTT2thL2JhK29veHFnPT0=?=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB1889;
	6:8RqwJ/SKHCurLza336KLa+Qx6Kty5aYi4JLGNfPdBHosNyulJW5sq6APvENixFyXsxvtJgwEwMGUavgKWJeaAMCocaN2opoOrjcSDEn9VDtf6nqAtUp0wYzzmVtN2MATDmL9WsocW6hkMXhFKMcOeoPj1HVpsEwjAKilQHcy+66ynkENBRMjVdMtPxsAeO4yDYSflmHQs2Yiagx6Ci5T310NoyUAjoEP7fEzk9EdUaQyVCpcZYPtrpUVj5wJ6BhbgRrl2INFWkS2JSY3wezTcZA6tipIJSvWKQjoGgfuDVE=;
	5:k8rzUlD+mtcnZ0rryGkOoEnnWQhn1fiGbJu/0lvkHM1UIf/zaWsz5FNUHqE+B9uCrFwpJuNtg9YiPFdAT0WRyrClDk3zLXT85Ven4ULgha0rIHcjxxrea01w4lbYrQJrO84iBm2epAfpsRDD/b1LwrjN76OBOMAXyj4zUj0MvsU=;
	24:+PPEL+DKb2ePy8C2jv3/OT0uiZbyRsAvMjkOloY+QKHL4KUdZpd6PNmwbQm97ThiWz0pN1NPkxVcGJmnrx63+EgjvOZQ5ElCPMm35lj9QxU=;
	7:QllsUCdG9Dh5BteQIA9SLvBC0UjiKMoy7H6wGTSeB0kWdYFjDVgc4Nx4pwxY5kQzKoyVO28wPTVJJ8QCQ4aG9fD+3o9jyO1Wa+FwaacGs+AsjFW1BnATa45VLJSaMHEbLJ8QFzBSyTc8SiGyMNCxTuS/L8a7gzGTiNX+AzwHmu4CVc4nu8kvn/7C95llQZUavgP0wf255eb+0KTRFm0eLW7z1yAf+ZF7hntYsh38GRIsAuAt7aTsccI6o2V8eur+
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2016 09:30:47.0964 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR03MB1889
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH v2 1/6] gstreamer1.0-plugins-bad: Enable gldeinterlace on OpenGL ES
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
X-List-Received-Date: Tue, 05 Jul 2016 09:45:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Enable gldeinterlace on OpenGL ES to improve performance.

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...lplugin-enable-gldeinterlace-on-OpenGL-ES.patch | 634 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb    |   1 +
 2 files changed, 635 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch
new file mode 100755
index 0000000..51f4eb4
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch
@@ -0,0 +1,634 @@
+From 8a0e97f7e672301cc76e394855e8c7a3448b0249 Mon Sep 17 00:00:00 2001
+From: Haihua Hu <jared.hu@nxp.com>
+Date: Fri, 8 Apr 2016 16:47:15 +0800
+Subject: [PATCH 4/6] [glplugin] enable gldeinterlace on OpenGL ES
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+1.Porting the exist deinterlace shader and OpenGL callback
+  to be compatible with OpenGL ES.
+2.Add a our blur vertical shader to gldeinterlace.
+3.Add a property named “method” to let user choose which
+  deinterlace function to use. Default to choose blur vertical
+  method for better performance.
+
+Upstream-Status: Backport [1.9.1]
+
+https://bugzilla.gnome.org/show_bug.cgi?id=764873
+
+Signed-off-by: Haihua Hu <jared.hu@nxp.com>
+---
+ ext/gl/Makefile.am        |   4 +-
+ ext/gl/gstgldeinterlace.c | 344 +++++++++++++++++++++++++++++++++++-----------
+ ext/gl/gstgldeinterlace.h |   6 +-
+ ext/gl/gstopengl.c        |  13 +-
+ 4 files changed, 275 insertions(+), 92 deletions(-)
+
+diff --git a/ext/gl/Makefile.am b/ext/gl/Makefile.am
+index 5d55f54..46419a7 100644
+--- a/ext/gl/Makefile.am
++++ b/ext/gl/Makefile.am
+@@ -40,6 +40,7 @@ libgstopengl_la_SOURCES = \
+ 	gstglfilterapp.c \
+ 	gstglviewconvert.c \
+ 	gstglstereosplit.c \
++	gstgldeinterlace.c \
+ 	gstglstereomix.c
+ 
+ noinst_HEADERS = \
+@@ -63,20 +64,19 @@ noinst_HEADERS = \
+ 	gstglfilterapp.h \
+ 	gstglstereosplit.h \
+ 	gstglstereomix.h \
++	gstgldeinterlace.h \
+ 	gstglviewconvert.h
+ 
+ # full opengl required
+ if USE_OPENGL
+ libgstopengl_la_SOURCES += \
+ 	gstglfilterglass.c \
+-	gstgldeinterlace.c \
+ 	gltestsrc.c \
+ 	gstgltestsrc.c \
+ 	gstglmosaic.c
+ 
+ noinst_HEADERS += \
+ 	gstglfilterglass.h \
+-	gstgldeinterlace.h \
+ 	gltestsrc.h \
+ 	gstgltestsrc.h \
+ 	gstglmosaic.h \
+diff --git a/ext/gl/gstgldeinterlace.c b/ext/gl/gstgldeinterlace.c
+index bd0eff0..c1250dc 100644
+--- a/ext/gl/gstgldeinterlace.c
++++ b/ext/gl/gstgldeinterlace.c
+@@ -43,7 +43,8 @@ GST_DEBUG_CATEGORY_STATIC (GST_CAT_DEFAULT);
+ 
+ enum
+ {
+-  PROP_0
++  PROP_0,
++  PROP_METHOD
+ };
+ 
+ #define DEBUG_INIT \
+@@ -57,17 +58,23 @@ static void gst_gl_deinterlace_set_property (GObject * object,
+ static void gst_gl_deinterlace_get_property (GObject * object,
+     guint prop_id, GValue * value, GParamSpec * pspec);
+ 
++static gboolean gst_gl_deinterlace_start (GstBaseTransform * trans);
+ static gboolean gst_gl_deinterlace_reset (GstBaseTransform * trans);
+-static gboolean gst_gl_deinterlace_init_shader (GstGLFilter * filter);
++static gboolean gst_gl_deinterlace_init_fbo (GstGLFilter * filter);
+ static gboolean gst_gl_deinterlace_filter (GstGLFilter * filter,
+     GstBuffer * inbuf, GstBuffer * outbuf);
+ static gboolean gst_gl_deinterlace_filter_texture (GstGLFilter * filter,
+     guint in_tex, guint out_tex);
+-static void gst_gl_deinterlace_callback (gint width, gint height,
++static void gst_gl_deinterlace_vfir_callback (gint width, gint height,
++    guint texture, gpointer stuff);
++static void gst_gl_deinterlace_greedyh_callback (gint width, gint height,
+     guint texture, gpointer stuff);
+ 
+ /* *INDENT-OFF* */
+ static const gchar *greedyh_fragment_source =
++  "#ifdef GL_ES\n"
++  "precision mediump float;\n"
++  "#endif\n"
+   "uniform sampler2D tex;\n"
+   "uniform sampler2D tex_prev;\n"
+   "uniform float max_comb;\n"
+@@ -75,35 +82,35 @@ static const gchar *greedyh_fragment_source =
+   "uniform float motion_sense;\n"
+   "uniform float width;\n"
+   "uniform float height;\n"
++  "varying vec2 v_texcoord;\n"
+ 
+   "void main () {\n"
+-  "  vec2 texcoord = gl_TexCoord[0].xy;\n"
+-  "  if (int(mod(texcoord.y * height, 2.0)) == 0) {\n"
+-  "    gl_FragColor = vec4(texture2D(tex_prev, texcoord).rgb, 1.0);\n"
++  "  if (int(mod(v_texcoord.y * height, 2.0)) == 0) {\n"
++  "    gl_FragColor = vec4(texture2D(tex_prev, v_texcoord).rgb, 1.0);\n"
+   "  } else {\n"
+   "    vec2 texcoord_L1_a1, texcoord_L3_a1, texcoord_L1, texcoord_L3, texcoord_L1_1, texcoord_L3_1;\n"
+   "    vec3 L1_a1, L3_a1, L1, L3, L1_1, L3_1;\n"
+ 
+-  "    texcoord_L1 = vec2(texcoord.x, texcoord.y - 1.0 / height);\n"
+-  "    texcoord_L3 = vec2(texcoord.x, texcoord.y + 1.0 / height);\n"
++  "    texcoord_L1 = vec2(v_texcoord.x, v_texcoord.y - 1.0 / height);\n"
++  "    texcoord_L3 = vec2(v_texcoord.x, v_texcoord.y + 1.0 / height);\n"
+   "    L1 = texture2D(tex_prev, texcoord_L1).rgb;\n"
+   "    L3 = texture2D(tex_prev, texcoord_L3).rgb;\n"
+-  "    if (texcoord.x == 1.0 && texcoord.y == 1.0) {\n"
++  "    if (v_texcoord.x == 1.0 && v_texcoord.y == 1.0) {\n"
+   "      L1_1 = L1;\n"
+   "      L3_1 = L3;\n"
+   "    } else {\n"
+-  "      texcoord_L1_1 = vec2(texcoord.x + 1.0 / width, texcoord.y - 1.0 / height);\n"
+-  "      texcoord_L3_1 = vec2(texcoord.x + 1.0 / width, texcoord.y + 1.0 / height);\n"
++  "      texcoord_L1_1 = vec2(v_texcoord.x + 1.0 / width, v_texcoord.y - 1.0 / height);\n"
++  "      texcoord_L3_1 = vec2(v_texcoord.x + 1.0 / width, v_texcoord.y + 1.0 / height);\n"
+   "      L1_1 = texture2D(tex_prev, texcoord_L1_1).rgb;\n"
+   "      L3_1 = texture2D(tex_prev, texcoord_L3_1).rgb;\n"
+   "    }\n"
+ 
+-  "    if (int(ceil(texcoord.x + texcoord.y)) == 0) {\n"
++  "    if (int(ceil(v_texcoord.x + v_texcoord.y)) == 0) {\n"
+   "      L1_a1 = L1;\n"
+   "      L3_a1 = L3;\n"
+   "    } else {\n"
+-  "      texcoord_L1_a1 = vec2(texcoord.x - 1.0 / width, texcoord.y - 1.0 / height);\n"
+-  "      texcoord_L3_a1 = vec2(texcoord.x - 1.0 / width, texcoord.y + 1.0 / height);\n"
++  "      texcoord_L1_a1 = vec2(v_texcoord.x - 1.0 / width, v_texcoord.y - 1.0 / height);\n"
++  "      texcoord_L3_a1 = vec2(v_texcoord.x - 1.0 / width, v_texcoord.y + 1.0 / height);\n"
+   "      L1_a1 = texture2D(tex_prev, texcoord_L1_a1).rgb;\n"
+   "      L3_a1 = texture2D(tex_prev, texcoord_L3_a1).rgb;\n"
+   "    }\n"
+@@ -113,8 +120,8 @@ static const gchar *greedyh_fragment_source =
+   "    vec3 avg_1 = (L1_1 + L3_1) / 2.0;\n"
+   "    vec3 avg_s = (avg_a1 + avg_1) / 2.0;\n"
+   "    vec3 avg_sc = (avg_s + avg) / 2.0;\n"
+-  "    vec3 L2 = texture2D(tex, texcoord).rgb;\n"
+-  "    vec3 LP2 = texture2D(tex_prev, texcoord).rgb;\n"
++  "    vec3 L2 = texture2D(tex, v_texcoord).rgb;\n"
++  "    vec3 LP2 = texture2D(tex_prev, v_texcoord).rgb;\n"
+   "    vec3 best;\n"
+   "    if (abs(L2.r - avg_sc.r) < abs(LP2.r - avg_sc.r)) {\n"
+   "      best.r = L2.r;\n" "    } else {\n"
+@@ -144,8 +151,87 @@ static const gchar *greedyh_fragment_source =
+   "    gl_FragColor = vec4(last, 1.0);\n"
+   "  }\n"
+   "}\n";
++
++const gchar *vfir_fragment_source =
++  "#ifdef GL_ES\n"
++  "precision mediump float;\n"
++  "#endif\n"
++  "uniform sampler2D tex;\n"
++  "uniform float width;\n"
++  "uniform float height;\n"
++  "varying vec2 v_texcoord;\n"
++  "void main()\n"
++  "{\n"
++  "  vec2 topcoord, botcoord;\n"
++  "  vec4 cur_color, top_color, bot_color;\n"
++  "  topcoord.x = v_texcoord.x;\n"
++  "  botcoord.x = v_texcoord.x;\n"
++  "  if (v_texcoord.y == 0.0 || v_texcoord.y == 1.0) {\n"
++  "    topcoord.y = v_texcoord.y ;\n"
++  "    botcoord.y = v_texcoord.y ;\n"
++  "  }\n"
++  "  else {\n"
++  "    topcoord.y = v_texcoord.y - 1.0/height;\n"
++  "    botcoord.y = v_texcoord.y + 1.0/height;\n"
++  "  }\n"
++  "  cur_color = texture2D(tex, v_texcoord);\n"
++  "  top_color = texture2D(tex, topcoord);\n"
++  "  bot_color = texture2D(tex, botcoord);\n"
++  "  gl_FragColor = 0.5*cur_color + 0.25*top_color + 0.25*bot_color;\n"
++  "}";
+ /* *INDENT-ON* */
+ 
++/* dont' forget to edit the following when a new method is added */
++typedef enum
++{
++  GST_GL_DEINTERLACE_VFIR,
++  GST_GL_DEINTERLACE_GREEDYH
++} GstGLDeinterlaceMethod;
++
++static const GEnumValue *
++gst_gl_deinterlace_get_methods (void)
++{
++  static const GEnumValue method_types[] = {
++    {GST_GL_DEINTERLACE_VFIR, "Blur Vertical", "vfir"},
++    {GST_GL_DEINTERLACE_GREEDYH, "Motion Adaptive: Advanced Detection",
++          "greedhy"},
++    {0, NULL, NULL}
++  };
++  return method_types;
++}
++
++#define GST_TYPE_GL_DEINTERLACE_METHODS (gst_gl_deinterlace_method_get_type ())
++static GType
++gst_gl_deinterlace_method_get_type (void)
++{
++  static GType gl_deinterlace_method_type = 0;
++  if (!gl_deinterlace_method_type) {
++    gl_deinterlace_method_type =
++        g_enum_register_static ("GstGLDeinterlaceMethod",
++        gst_gl_deinterlace_get_methods ());
++  }
++  return gl_deinterlace_method_type;
++}
++
++static void
++gst_gl_deinterlace_set_method (GstGLDeinterlace * deinterlace,
++    guint method_types)
++{
++  switch (method_types) {
++    case GST_GL_DEINTERLACE_VFIR:
++      deinterlace->deinterlacefunc = gst_gl_deinterlace_vfir_callback;
++      deinterlace->current_method = method_types;
++      break;
++    case GST_GL_DEINTERLACE_GREEDYH:
++      deinterlace->deinterlacefunc = gst_gl_deinterlace_greedyh_callback;
++      deinterlace->current_method = method_types;
++      break;
++    default:
++      g_assert_not_reached ();
++      break;
++  }
++}
++
+ static void
+ gst_gl_deinterlace_class_init (GstGLDeinterlaceClass * klass)
+ {
+@@ -163,25 +249,60 @@ gst_gl_deinterlace_class_init (GstGLDeinterlaceClass * klass)
+       "Deinterlacing based on fragment shaders",
+       "Julien Isorce <julien.isorce@mail.com>");
+ 
++  g_object_class_install_property (gobject_class,
++      PROP_METHOD,
++      g_param_spec_enum ("method",
++          "Deinterlace Method",
++          "Select which deinterlace method apply to GL video texture",
++          GST_TYPE_GL_DEINTERLACE_METHODS,
++          GST_GL_DEINTERLACE_VFIR, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
++
++  GST_BASE_TRANSFORM_CLASS (klass)->start = gst_gl_deinterlace_start;
+   GST_BASE_TRANSFORM_CLASS (klass)->stop = gst_gl_deinterlace_reset;
+ 
+   GST_GL_FILTER_CLASS (klass)->filter = gst_gl_deinterlace_filter;
+   GST_GL_FILTER_CLASS (klass)->filter_texture =
+       gst_gl_deinterlace_filter_texture;
+-  GST_GL_FILTER_CLASS (klass)->init_fbo = gst_gl_deinterlace_init_shader;
++  GST_GL_FILTER_CLASS (klass)->init_fbo = gst_gl_deinterlace_init_fbo;
+ 
+-  GST_GL_BASE_FILTER_CLASS (klass)->supported_gl_api = GST_GL_API_OPENGL;
++  GST_GL_BASE_FILTER_CLASS (klass)->supported_gl_api =
++      GST_GL_API_OPENGL | GST_GL_API_GLES2 | GST_GL_API_OPENGL3;
+ }
+ 
+ static void
+ gst_gl_deinterlace_init (GstGLDeinterlace * filter)
+ {
+-  filter->shader = NULL;
++  filter->shaderstable = NULL;
++  filter->deinterlacefunc = gst_gl_deinterlace_vfir_callback;
++  filter->current_method = GST_GL_DEINTERLACE_VFIR;
+   filter->prev_buffer = NULL;
+   filter->prev_tex = 0;
+ }
+ 
+ static gboolean
++gst_gl_deinterlace_start (GstBaseTransform * trans)
++{
++  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (trans);
++
++  deinterlace_filter->shaderstable = g_hash_table_new (g_str_hash, g_str_equal);
++
++  return GST_BASE_TRANSFORM_CLASS (parent_class)->start (trans);
++}
++
++static void
++gst_gl_deinterlace_ghash_func_clean (gpointer key, gpointer value,
++    gpointer data)
++{
++  GstGLShader *shader = (GstGLShader *) value;
++  GstGLFilter *filter = (GstGLFilter *) data;
++
++  //blocking call, wait the opengl thread has destroyed the shader
++  gst_gl_context_del_shader (GST_GL_BASE_FILTER (filter)->context, shader);
++
++  value = NULL;
++}
++
++static gboolean
+ gst_gl_deinterlace_reset (GstBaseTransform * trans)
+ {
+   GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (trans);
+@@ -189,10 +310,17 @@ gst_gl_deinterlace_reset (GstBaseTransform * trans)
+   gst_buffer_replace (&deinterlace_filter->prev_buffer, NULL);
+ 
+   //blocking call, wait the opengl thread has destroyed the shader
+-  if (deinterlace_filter->shader)
+-    gst_gl_context_del_shader (GST_GL_BASE_FILTER (trans)->context,
+-        deinterlace_filter->shader);
+-  deinterlace_filter->shader = NULL;
++  if (deinterlace_filter->shaderstable) {
++    /* release shaders in the gl thread */
++    g_hash_table_foreach (deinterlace_filter->shaderstable,
++        gst_gl_deinterlace_ghash_func_clean, deinterlace_filter);
++
++    /* clean the htable without calling values destructors
++     * because shaders have been released in the glthread
++     * through the foreach func */
++    g_hash_table_unref (deinterlace_filter->shaderstable);
++    deinterlace_filter->shaderstable = NULL;
++  }
+ 
+   return GST_BASE_TRANSFORM_CLASS (parent_class)->stop (trans);
+ }
+@@ -201,9 +329,12 @@ static void
+ gst_gl_deinterlace_set_property (GObject * object, guint prop_id,
+     const GValue * value, GParamSpec * pspec)
+ {
+-  //GstGLDeinterlace *filter = GST_GL_DEINTERLACE (object);
++  GstGLDeinterlace *filter = GST_GL_DEINTERLACE (object);
+ 
+   switch (prop_id) {
++    case PROP_METHOD:
++      gst_gl_deinterlace_set_method (filter, g_value_get_enum (value));
++      break;
+     default:
+       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+       break;
+@@ -214,9 +345,12 @@ static void
+ gst_gl_deinterlace_get_property (GObject * object, guint prop_id,
+     GValue * value, GParamSpec * pspec)
+ {
+-  //GstGLDeinterlace *filter = GST_GL_DEINTERLACE (object);
++  GstGLDeinterlace *filter = GST_GL_DEINTERLACE (object);
+ 
+   switch (prop_id) {
++    case PROP_METHOD:
++      g_value_set_enum (value, filter->current_method);
++      break;
+     default:
+       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+       break;
+@@ -224,13 +358,9 @@ gst_gl_deinterlace_get_property (GObject * object, guint prop_id,
+ }
+ 
+ static gboolean
+-gst_gl_deinterlace_init_shader (GstGLFilter * filter)
++gst_gl_deinterlace_init_fbo (GstGLFilter * filter)
+ {
+-  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (filter);
+-
+-  //blocking call, wait the opengl thread has compiled the shader
+-  return gst_gl_context_gen_shader (GST_GL_BASE_FILTER (filter)->context, 0,
+-      greedyh_fragment_source, &deinterlace_filter->shader);
++  return TRUE;
+ }
+ 
+ static gboolean
+@@ -241,7 +371,7 @@ gst_gl_deinterlace_filter_texture (GstGLFilter * filter, guint in_tex,
+ 
+   //blocking call, use a FBO
+   gst_gl_filter_render_to_target (filter, TRUE, in_tex, out_tex,
+-      gst_gl_deinterlace_callback, deinterlace_filter);
++      deinterlace_filter->deinterlacefunc, deinterlace_filter);
+ 
+   return TRUE;
+ }
+@@ -259,36 +389,104 @@ gst_gl_deinterlace_filter (GstGLFilter * filter, GstBuffer * inbuf,
+   return TRUE;
+ }
+ 
+-//opengl scene, params: input texture (not the output filter->texture)
++static GstGLShader *
++gst_gl_deinterlace_get_fragment_shader (GstGLFilter * filter,
++    const gchar * shader_name, const gchar * shader_source)
++{
++  GstGLShader *shader = NULL;
++  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (filter);
++  GstGLContext *context = GST_GL_BASE_FILTER (filter)->context;
++
++  shader = g_hash_table_lookup (deinterlace_filter->shaderstable, shader_name);
++
++  if (!shader) {
++    GError *error = NULL;
++
++    if (!(shader = gst_gl_shader_new_link_with_stages (context, &error,
++                gst_glsl_stage_new_default_vertex (context),
++                gst_glsl_stage_new_with_string (context, GL_FRAGMENT_SHADER,
++                    GST_GLSL_VERSION_NONE,
++                    GST_GLSL_PROFILE_ES | GST_GLSL_PROFILE_COMPATIBILITY,
++                    shader_source), NULL))) {
++      GST_ELEMENT_ERROR (deinterlace_filter, RESOURCE, NOT_FOUND,
++          ("Failed to initialize %s shader", shader_name), (NULL));
++    }
++
++    filter->draw_attr_position_loc =
++        gst_gl_shader_get_attribute_location (shader, "a_position");
++    filter->draw_attr_texture_loc =
++        gst_gl_shader_get_attribute_location (shader, "a_texcoord");
++  }
++
++  g_hash_table_insert (deinterlace_filter->shaderstable, (gchar *) shader_name,
++      shader);
++
++  return shader;
++}
++
+ static void
+-gst_gl_deinterlace_callback (gint width, gint height, guint texture,
++gst_gl_deinterlace_vfir_callback (gint width, gint height, guint texture,
+     gpointer stuff)
+ {
+-  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (stuff);
++  GstGLShader *shader;
+   GstGLFilter *filter = GST_GL_FILTER (stuff);
+-  GstGLFuncs *gl = GST_GL_BASE_FILTER (filter)->context->gl_vtable;
++  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (filter);
++  GstGLContext *context = GST_GL_BASE_FILTER (filter)->context;
++  GstGLFuncs *gl = context->gl_vtable;
++
++  shader = gst_gl_deinterlace_get_fragment_shader (deinterlace_filter, "vfir",
++      vfir_fragment_source);
++
++  if (!shader)
++    return;
++
++#if GST_GL_HAVE_OPENGL
++  if (USING_OPENGL (context)) {
++    gl->MatrixMode (GL_PROJECTION);
++    gl->LoadIdentity ();
++  }
++#endif
++
++  gst_gl_shader_use (shader);
++
++  gl->ActiveTexture (GL_TEXTURE0);
++  gl->BindTexture (GL_TEXTURE_2D, texture);
++
++  gst_gl_shader_set_uniform_1i (shader, "tex", 0);
++  gst_gl_shader_set_uniform_1f (shader, "width",
++      GST_VIDEO_INFO_WIDTH (&filter->out_info));
++  gst_gl_shader_set_uniform_1f (shader, "height",
++      GST_VIDEO_INFO_HEIGHT (&filter->out_info));
++
++  gst_gl_filter_draw_texture (filter, texture, width, height);
++}
++
++static void
++gst_gl_deinterlace_greedyh_callback (gint width, gint height, guint texture,
++    gpointer stuff)
++{
++  GstGLShader *shader;
++  GstGLFilter *filter = GST_GL_FILTER (stuff);
++  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (filter);
++  GstGLContext *context = GST_GL_BASE_FILTER (filter)->context;
++  GstGLFuncs *gl = context->gl_vtable;
+   guint temp;
+ 
+-  GLfloat verts[] = { -1.0, -1.0,
+-    1.0, -1.0,
+-    1.0, 1.0,
+-    -1.0, 1.0
+-  };
+-  GLfloat texcoords0[] = { 0.0f, 0.0f,
+-    1.0f, 0.0f,
+-    1.0f, 1.0f,
+-    0.0f, 1.0f
+-  };
+-  GLfloat texcoords1[] = { 0.0f, 0.0f,
+-    1.0f, 0.0f,
+-    1.0f, 1.0f,
+-    0.0f, 1.0f
+-  };
++  shader =
++      gst_gl_deinterlace_get_fragment_shader (deinterlace_filter, "greedhy",
++      greedyh_fragment_source);
+ 
+-  gl->MatrixMode (GL_PROJECTION);
+-  gl->LoadIdentity ();
++  if (!shader)
++    return;
+ 
+-  gst_gl_shader_use (deinterlace_filter->shader);
++#if GST_GL_HAVE_OPENGL
++  if (USING_OPENGL (context)) {
++    gl->MatrixMode (GL_PROJECTION);
++    gl->LoadIdentity ();
++  }
++#endif
++
++  gst_gl_shader_use (shader);
+ 
+   if (G_UNLIKELY (deinterlace_filter->prev_tex == 0)) {
+     gst_gl_context_gen_texture (GST_GL_BASE_FILTER (filter)->context,
+@@ -298,44 +496,24 @@ gst_gl_deinterlace_callback (gint width, gint height, guint texture,
+         GST_VIDEO_INFO_HEIGHT (&filter->out_info));
+   } else {
+     gl->ActiveTexture (GL_TEXTURE1);
+-    gst_gl_shader_set_uniform_1i (deinterlace_filter->shader, "tex_prev", 1);
++    gst_gl_shader_set_uniform_1i (shader, "tex_prev", 1);
+     gl->BindTexture (GL_TEXTURE_2D, deinterlace_filter->prev_tex);
+   }
+ 
+   gl->ActiveTexture (GL_TEXTURE0);
+-  gst_gl_shader_set_uniform_1i (deinterlace_filter->shader, "tex", 0);
++  gl->BindTexture (GL_TEXTURE_2D, texture);
+ 
+-  gst_gl_shader_set_uniform_1f (deinterlace_filter->shader, "max_comb",
+-      5.0f / 255.0f);
+-  gst_gl_shader_set_uniform_1f (deinterlace_filter->shader, "motion_threshold",
+-      25.0f / 255.0f);
+-  gst_gl_shader_set_uniform_1f (deinterlace_filter->shader, "motion_sense",
+-      30.0f / 255.0f);
++  gst_gl_shader_set_uniform_1i (shader, "tex", 0);
++  gst_gl_shader_set_uniform_1f (shader, "max_comb", 5.0f / 255.0f);
++  gst_gl_shader_set_uniform_1f (shader, "motion_threshold", 25.0f / 255.0f);
++  gst_gl_shader_set_uniform_1f (shader, "motion_sense", 30.0f / 255.0f);
+ 
+-  gst_gl_shader_set_uniform_1f (deinterlace_filter->shader, "width",
++  gst_gl_shader_set_uniform_1f (shader, "width",
+       GST_VIDEO_INFO_WIDTH (&filter->out_info));
+-  gst_gl_shader_set_uniform_1f (deinterlace_filter->shader, "height",
++  gst_gl_shader_set_uniform_1f (shader, "height",
+       GST_VIDEO_INFO_HEIGHT (&filter->out_info));
+ 
+-  gl->ClientActiveTexture (GL_TEXTURE0);
+-
+-  gl->EnableClientState (GL_TEXTURE_COORD_ARRAY);
+-  gl->EnableClientState (GL_VERTEX_ARRAY);
+-
+-  gl->VertexPointer (2, GL_FLOAT, 0, &verts);
+-  gl->TexCoordPointer (2, GL_FLOAT, 0, &texcoords0);
+-
+-  gl->ClientActiveTexture (GL_TEXTURE1);
+-  gl->EnableClientState (GL_TEXTURE_COORD_ARRAY);
+-  gl->TexCoordPointer (2, GL_FLOAT, 0, &texcoords1);
+-
+-  gl->DrawArrays (GL_TRIANGLE_FAN, 0, 4);
+-
+-  gl->DisableClientState (GL_VERTEX_ARRAY);
+-  gl->DisableClientState (GL_TEXTURE_COORD_ARRAY);
+-
+-  gl->ClientActiveTexture (GL_TEXTURE0);
+-  gl->DisableClientState (GL_TEXTURE_COORD_ARRAY);
++  gst_gl_filter_draw_texture (filter, texture, width, height);
+ 
+   if (texture == filter->in_tex_id) {
+     temp = filter->in_tex_id;
+diff --git a/ext/gl/gstgldeinterlace.h b/ext/gl/gstgldeinterlace.h
+index a81a2e7..58a9c0c 100644
+--- a/ext/gl/gstgldeinterlace.h
++++ b/ext/gl/gstgldeinterlace.h
+@@ -38,9 +38,13 @@ typedef struct _GstGLDeinterlaceClass GstGLDeinterlaceClass;
+ struct _GstGLDeinterlace
+ {
+   GstGLFilter  filter;
+-  GstGLShader  *shader;
++
++  GLCB	       deinterlacefunc; 
++  GHashTable   *shaderstable;
+   GstBuffer    *prev_buffer;
+   guint         prev_tex;
++
++  gint	       current_method;
+ };
+ 
+ struct _GstGLDeinterlaceClass
+diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c
+index 50676c4..135862a 100644
+--- a/ext/gl/gstopengl.c
++++ b/ext/gl/gstopengl.c
+@@ -62,6 +62,7 @@
+ #include "gstglstereosplit.h"
+ #include "gstglstereomix.h"
+ #include "gstglviewconvert.h"
++#include "gstgldeinterlace.h"
+ 
+ #if HAVE_GRAPHENE
+ #include "gstgltransformation.h"
+@@ -77,7 +78,6 @@
+ #include "gstgltestsrc.h"
+ #include "gstglfilterglass.h"
+ /* #include "gstglfilterreflectedscreen.h" */
+-#include "gstgldeinterlace.h"
+ #include "gstglmosaic.h"
+ #if HAVE_PNG
+ #include "gstgldifferencematte.h"
+@@ -226,6 +226,12 @@ plugin_init (GstPlugin * plugin)
+           GST_RANK_NONE, GST_TYPE_GL_STEREO_MIX)) {
+     return FALSE;
+   }
++
++  if (!gst_element_register (plugin, "gldeinterlace",
++          GST_RANK_NONE, GST_TYPE_GL_DEINTERLACE)) {
++    return FALSE;
++  }
++
+ #if HAVE_JPEG
+ #if HAVE_PNG
+   if (!gst_element_register (plugin, "gloverlay",
+@@ -250,11 +256,6 @@ plugin_init (GstPlugin * plugin)
+     return FALSE;
+   }
+ #endif
+-  if (!gst_element_register (plugin, "gldeinterlace",
+-          GST_RANK_NONE, GST_TYPE_GL_DEINTERLACE)) {
+-    return FALSE;
+-  }
+-
+   if (!gst_element_register (plugin, "glmosaic",
+           GST_RANK_NONE, GST_TYPE_GL_MOSAIC)) {
+     return FALSE;
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
index c7d67f8..7cd14c7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
     file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
+    file://0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch \
 "
 SRC_URI[md5sum] = "83abc2e70684e7b195f18ca2992ef6e8"
 SRC_URI[sha256sum] = "d7995317530c8773ec088f94d9320909d41da61996b801ebacce9a56af493f97"
-- 
1.9.1


