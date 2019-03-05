Return-Path: <Rasmus.Villemoes@prevas.se>
X-Greylist: delayed 7277 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Mar 2019 11:36:56 UTC
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10137.outbound.protection.outlook.com [40.107.1.137])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF587C795
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 11:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=LgK/TMCaoPYSB8CmCfJ2RhsT/Yvdh0xeWCW4e9nedR0=;
	b=Em46W7/snVLRybOeFdfrHMVNPjEQtm57HBJgIJ03yjncYM6w5DA3pds1W5XIT/Rkt/VuNz943FfUbBVMewDN5jb2ByQY71zfsLBJtHHUyqLA6iRpCeBqTaRjHuI/HEHLGoldf/zseN8q1qH+5NsTfsEcCIUapkmI1Xiwth1E2pg=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
	VI1PR10MB0365.EURPRD10.PROD.OUTLOOK.COM (10.167.200.147) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1665.16; Tue, 5 Mar 2019 07:03:05 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
	([fe80::51c2:2f6a:3148:4a1f]) by
	VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
	([fe80::51c2:2f6a:3148:4a1f%3]) with mapi id 15.20.1665.020;
	Tue, 5 Mar 2019 07:03:05 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] rng-tools: Fix crazy defaults
Thread-Index: AQHUeAhwfGhs6ATqEkamnt2ibJzjwaX9UuEA
Date: Tue, 5 Mar 2019 07:03:04 +0000
Message-ID: <aaee4a7c-c9ae-9f76-39af-b262324d87d6@prevas.dk>
References: <1541753661-9999-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1541753661-9999-1-git-send-email-hongxu.jia@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0502CA0001.eurprd05.prod.outlook.com
	(2603:10a6:3:e3::11) To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9145dc97-d32d-443b-ea8f-08d6a1389d27
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR10MB0365; 
x-ms-traffictypediagnostic: VI1PR10MB0365:
x-microsoft-antispam-prvs: <VI1PR10MB0365BE01F0662F2AE645BFAC8A720@VI1PR10MB0365.EURPRD10.PROD.OUTLOOK.COM>
x-forefront-prvs: 0967749BC1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(39830400003)(366004)(376002)(346002)(396003)(189003)(199004)(19627235002)(72206003)(2906002)(97736004)(31686004)(6486002)(6512007)(6506007)(11346002)(5660300002)(476003)(106356001)(99286004)(2616005)(478600001)(14444005)(386003)(68736007)(42882007)(71190400001)(53936002)(3846002)(6116002)(71200400001)(26005)(25786009)(44832011)(36756003)(14454004)(305945005)(74482002)(6246003)(76176011)(446003)(7736002)(66066001)(105586002)(2201001)(186003)(81166006)(8936002)(316002)(31696002)(8976002)(52116002)(81156014)(229853002)(256004)(2501003)(102836004)(110136005)(6436002)(8676002)(486006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB0365;
	H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtWSTFQUjEwTUIwMzY1OzIzOjdiL0VXdmhGSDF3Yk92cFVsTkpERWY2M1Zh?=
	=?utf-8?B?RjVxVk9HMUJLTW5FZEk4a1VXb0g3TWJzSDBSd1FpVStEcWV3RkFKWmZQSDFD?=
	=?utf-8?B?b3RUa2NvR0s1anlaaXJwZ2hHTFBwNkx0RkQzc2ltQWQ3cS9IMnhNbTlYb2Qz?=
	=?utf-8?B?eldzbzN3RHlHRFQ1bnloS2JTVHRpdkdocGRkdXk3T00zck5EU2xJYzZmd0lK?=
	=?utf-8?B?MCtEeXR1RWNWUm5yMW41MUo3MFhIMWhoamRqWVQvTmc4SWhWRUVBWUh3bHpw?=
	=?utf-8?B?K2hGb2xnbmNJcjJVOGdZUjN3dHhjSXUrVnZZVjRNQ2g3WlY0YzNUdFJXRWQ3?=
	=?utf-8?B?YXdtVmZpN0xFNEFYcGtyWjlaS3Zyckg3NGxKVUVsK2lMc1NWSnFxOUx5Y0VN?=
	=?utf-8?B?VjZ6UGc5K1VNYzVMVVlacHNENUJWTWw5MkV0U295UCt6bVlGckhXU0xaeWFZ?=
	=?utf-8?B?RkFVYktnS21McXdFTjFuQmJOdTBTR0d0eENTWWdPRE02cENRTk9wc1VETUcv?=
	=?utf-8?B?RE9kZjZrL3JYeXRPeGlzWWhRSFVFT3BzS2U0KzQ5dTVvc2poeW9XYkVFL1hL?=
	=?utf-8?B?Y1JiYmV5VlFDeHh2aFRTKzlzUVJHZ0orWEdNNmswQWNPeEVVbzBwRWxMdkZt?=
	=?utf-8?B?c1NuTU02cWdYOXRIV1BPT041Zzh6TUJoby9Qb1U4cC95a2xIeWVVQ2pSTXdR?=
	=?utf-8?B?dXk0eGdVOUJVZ05PMVpSUmx2cjRnYkdoR3dGbXV0QTR1Tkt2VFkzMERMNWhK?=
	=?utf-8?B?RGtwNjJvbDJxcDZVZ21pczY1cEV2S2gzUnNOSUlRdlJmV1hGaXNQQ2tLWm51?=
	=?utf-8?B?L3ZJS2p3R1NtYStSTHViVFhhenhEVmFBbjcxT0UvUDdac1h5bnV1QThGQXdJ?=
	=?utf-8?B?MTNiYlY1ZXNnSnplYVllL2l6dU5NOWZjaVhjdXNhdU9KTEFLLzJqa254NFlk?=
	=?utf-8?B?VEFxUmZmajBlT21vVm1GdmxsN1BsaHFZZnR6UWo4Um4yK3VLN2QwQWhRMmJR?=
	=?utf-8?B?WW9qK2l5ZnJwU0JGVW9FbGV1UkQ3MjdWVE4rK01KZmtVVVRxMUNuM25Rc2RS?=
	=?utf-8?B?dHNmYTNWN3h0MjFPaDc0RU5oZUE2c0E5Z1JlV0E4TlhBYkxsWUVNdmNWUDZ1?=
	=?utf-8?B?a0Fnb3laaFJvMitscTNQbmhVVk5RSW9XMmw2S2JOeXpaWjFuRHVNUCtIa2xX?=
	=?utf-8?B?c3RjaDRPL0xHZ2dkWTJxWEJibmlkU0lVMEZQNEFSL2xlWTQwcVpYZEErWHpL?=
	=?utf-8?B?aEx5V2dvK0ZmdmpPaWgwU3Rka1JsTnB4bjNCRG1qeVk3NExXdTFiLy96K1pK?=
	=?utf-8?B?cUlJL3AwalRuNk5heFJGSzE2bEtFZjFjQ2NpTjhpcjIreUQ2RU5kMXgvclhs?=
	=?utf-8?B?QlR1aXhWSHJMUDJINnU0VHg0WlBpalltT3k4RC9zVFdqZzJLa1liZmxUbXZk?=
	=?utf-8?B?UFZLa2Uxd0hlTzJNSCtyNk1TV1ZCcEtPc0lRc29KVkoramZVM3kzbXdpeUdu?=
	=?utf-8?B?aENzVE1WYy9udHR4eGZhc2Q3Q20zTm9hSkdQWVdTMnluSFhWL2xiQXArSUtn?=
	=?utf-8?B?TnpHcEZEUHczT1U3djZiaW9VQ2VDRjdUQlNYMEMvQWFlOFAvYkplL3FrU2Zk?=
	=?utf-8?B?VncwbTkwWlAyVThkakx5aFZvUW5mb2xjR3M4TFkzdzNLaEhEVXIxOS9TT24x?=
	=?utf-8?B?VXpOeDZEZ0o5Qzl3eEpvcE1VR05lSjh6bjVudlZaUEJaQy9BQmp0NDFjeTRy?=
	=?utf-8?B?bDdiZkxwdk83R0ZhN3hzU0Y5RkVKT3N0dnF6VFI3bFFFMGY0R0lCQWFraXd2?=
	=?utf-8?B?WnBxRU5XU1R4VEZXbmY2c1drdkpNemV6M2ZQRVpuTzBGWWJIRWpSaGxtajZr?=
	=?utf-8?Q?kz7z6VY7Ko4=3D?=
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ce+YK7b/wA0yZhyIdOgOJqlXLUJneJObFOQpm+RIaoERf4CoOgLHztjj8ZaDTGeRAcemQ3gJMbPazkOa/AP6VUT5Fd8eBE7ewf1rCEqubLwnBrx0wK58EdjrmJOguHjklu89jyPjSqakje6IIulFb8++IA/ycPWuiqYgYsXnDNWQDT738pLrK//HEnLFb2vizUB41Y5bvAI9gdQouMgajPmNqQwqJ5Xnj/L+Y5ar1uA2/0DoPC87coR0GpdfOzIQANnpvYvL3yToMFbPxoTiC1tfmHoT6k5DRrpqN9nVXheahh1cqJRn0waCML2/LCsYQFusgXkmr2lpzFFERREyDQFBr3RjFkxsCTllgfwCxAG7BWHeLCRJvVwnWCPdXYEfHZXHxsjBJJEoMOsCPRux0RsJBXzOXo0tBvtqgxVnzhI=
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 9145dc97-d32d-443b-ea8f-08d6a1389d27
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2019 07:03:05.0105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB0365
Subject: Re: [PATCH] rng-tools: Fix crazy defaults
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
X-List-Received-Date: Tue, 05 Mar 2019 11:36:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <542C70DE5D587C48945100008310F01D@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

T24gMDkvMTEvMjAxOCAwOS41NCwgSG9uZ3h1IEppYSB3cm90ZToNCj4gU2luY2UgY29tbWl0IFtm
MWRjOWFjIHJuZy10b29sczogRml4IGNyYXp5IGRlZmF1bHRzXSBmaXhlZA0KPiBpbml0IGJhc2Vk
IG9uIHN5c3Zpbml0LCB0aGlzIGZpeCBybmdkLnNlcnZpY2UgYmFzZWQgb24gc3lzdGVtZC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4N
Cj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ybmctdG9vbHMvcm5nLXRvb2xzL3JuZ2Qu
c2VydmljZSB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3JuZy10b29s
cy9ybmctdG9vbHMvcm5nZC5zZXJ2aWNlIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcm5nLXRvb2xz
L3JuZy10b29scy9ybmdkLnNlcnZpY2UNCj4gaW5kZXggY2I4MTAyNC4uZjAzNTVkYiAxMDA2NDQN
Cj4gLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcm5nLXRvb2xzL3JuZy10b29scy9ybmdkLnNl
cnZpY2UNCj4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcm5nLXRvb2xzL3JuZy10b29scy9y
bmdkLnNlcnZpY2UNCj4gQEAgLTUsNyArNSw3IEBAIEFmdGVyPXN5c3RlbWQtdWRldi1zZXR0bGUu
c2VydmljZQ0KPiAgQmVmb3JlPXN5c2luaXQudGFyZ2V0DQo+ICANCj4gIFtTZXJ2aWNlXQ0KPiAt
RXhlY1N0YXJ0PUBTQklORElSQC9ybmdkIC1mIC1yIC9kZXYvdXJhbmRvbQ0KPiArRXhlY1N0YXJ0
PUBTQklORElSQC9ybmdkIC1mIC1yIC9kZXYvaHdybmcNCj4gIFN1Y2Nlc3NFeGl0U3RhdHVzPTY2
DQo+ICANCj4gIFtJbnN0YWxsXQ0KPiANCg0KVGhpcyBoYXMgYmVlbiBhcHBsaWVkIHRvIG1hc3Rl
ciwgYnV0IHBsZWFzZSBhcHBseSB0aGlzIHRvIHRodWQgYXMgd2VsbCAtDQpmZWVkaW5nIHRoZSBr
ZXJuZWwncyBlbnRyb3B5IHBvb2wgZnJvbSB0aGF0IHNhbWUgZW50cm9weSBwb29sIGlzIG9mDQpj
b3Vyc2UgdXR0ZXIgbm9uc2Vuc2UsIGJ1dCBzaW5jZSBybmdkIGlzIGFsc28gX2NyZWRpdGluZyB0
aG9zZSBieXRlcw0Kd2l0aCBwcm92aWRpbmcgcmVhbCBiaXRzIG9mIGVudHJvcHlfIChpb2N0bCBS
TkRBRERFTlRST1BZKSBtYWtlcyBpdCBhDQpzZWN1cml0eSBpc3N1ZS4NCg0KUmFzbXVzDQo=

