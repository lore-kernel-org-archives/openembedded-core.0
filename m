Return-Path: <Rasmus.Villemoes@prevas.se>
X-Greylist: delayed 75514 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 02 Mar 2019 20:12:49 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140110.outbound.protection.outlook.com [40.107.14.110])
	by mail.openembedded.org (Postfix) with ESMTP id 1131F7C799
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Mar 2019 20:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=LgK/TMCaoPYSB8CmCfJ2RhsT/Yvdh0xeWCW4e9nedR0=;
	b=IARPC+smLss3OOVdleQpmu3uVcUYw373Io2LjnWGz1o/vltO4kk6ejnVHDVur032cWn57rN+fQN9zfzupPV1x9xnrRJ8XDnxK+jRB/VHo0yt45pTVYeZUcukbO/GGGYkFL2BF0SnelTGxjxdHiDXi/MOxyqX+004rRveTtdAuIk=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
	VI1PR10MB0511.EURPRD10.PROD.OUTLOOK.COM (10.167.201.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1665.16; Fri, 1 Mar 2019 11:38:32 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d49:d85b:58bf:cd5b]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d49:d85b:58bf:cd5b%6]) with mapi id 15.20.1643.022;
	Fri, 1 Mar 2019 11:38:32 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] rng-tools: Fix crazy defaults
Thread-Index: AQHUeAhwfGhs6ATqEkamnt2ibJzjwaX3VoOA
Date: Fri, 1 Mar 2019 11:38:32 +0000
Message-ID: <de6d5241-13a3-b433-a7b9-396fded4c29a@prevas.dk>
References: <1541753661-9999-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1541753661-9999-1-git-send-email-hongxu.jia@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0701CA0089.eurprd07.prod.outlook.com
	(2603:10a6:3:64::33) To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb5b9756-6dbe-43a8-596d-08d69e3a6e83
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR10MB0511; 
X-MS-TrafficTypeDiagnostic: VI1PR10MB0511:|VI1PR10MB0511:|VI1PR10MB0511:
x-microsoft-antispam-prvs: <VI1PR10MB05111F641F55116315EE168C8A760@VI1PR10MB0511.EURPRD10.PROD.OUTLOOK.COM>
x-forefront-prvs: 09634B1196
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39850400004)(136003)(346002)(376002)(366004)(189003)(199004)(6436002)(6512007)(229853002)(6486002)(8936002)(106356001)(105586002)(2351001)(478600001)(5640700003)(72206003)(97736004)(2906002)(8976002)(3846002)(6116002)(68736007)(6916009)(53936002)(14454004)(19627235002)(4326008)(71190400001)(71200400001)(256004)(42882007)(44832011)(446003)(476003)(25786009)(31696002)(6246003)(186003)(11346002)(2616005)(8676002)(81156014)(81166006)(486006)(36756003)(74482002)(31686004)(316002)(2501003)(102836004)(6506007)(386003)(52116002)(76176011)(26005)(5660300002)(14444005)(305945005)(7736002)(66066001)(99286004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB0511;
	H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtWSTFQUjEwTUIwNTExOzIzOmhzMkJKZ29MTHh3dk0relZ3bVJVaWI3aHNH?=
	=?utf-8?B?NFVjQXV3c0JlRE1zbnc5Z29xNHRSancyZjhQRTJiZGZFaTg5USt5L1JXSUk2?=
	=?utf-8?B?Z0xwaTR0eHhKYmJFM2FsQmNFbVlISkkvSnNDTkNjSkoxQmkzMzNnb1k3KzZu?=
	=?utf-8?B?LzZMMUJaa3dYbVVvcGxZZHBSTGpUZmtJUWJrQ0hOdTdiM01KNTNOZU8yQW44?=
	=?utf-8?B?UWc3TjM3ai9rdWEzeXNZRmNOTjd5SUdBNk1KTXZOQmd5b3RVNzVzQXlacWpn?=
	=?utf-8?B?R0ZyLzc1akVSTVFPQmFqdG1kNTVwNmJWWi9XbUVacUVxTnpkaWsvUTNNWGdV?=
	=?utf-8?B?d1BFajJiRk9WcEVYNzdvRjBZWUlaZ213RDhhdGVpNHoyWElKMkZZQVBxdjI1?=
	=?utf-8?B?M1JnTUJiUWtzK1BQTHNoSTdrajY1ZDlBUGd3L2c5NllGZXczeVN5S25TRHpv?=
	=?utf-8?B?UGcxMlNoV1F5Q0c1YVl5clBodnBQMTlMNjMxRnhudUJWOU9SZ1VBVW1qM1pa?=
	=?utf-8?B?OEJmbnpKK3dXUDZHZmhhRDExc3ZqQTVjMDVmbGpPMk5BamdPeW0wREdwV2ww?=
	=?utf-8?B?VjIwSWZPK0NML1cyN2lzc3VweE9ZbmdzNWRveDZpU3RDK2N2VEJhdW12NWZ1?=
	=?utf-8?B?bmtkTzJuQ1pVR25yNllxa2NYVlZraFNFd1dNMUJBUEdtMFAyZDM0TkM5elpo?=
	=?utf-8?B?d3l6d21FUVJtRmJTNzQ2dWRNVGJsQjFFREZpck5BWXdLRUE0M1JwK0pEM2lI?=
	=?utf-8?B?WkVOTzlURmJlWGU2ODlLeHY0L1o2c3hwWXFXcDYxTmRmd3VlMWp2V1AwbWQ2?=
	=?utf-8?B?NDRzMDg0VjZnRVFkZk5MY1pEaWw1cFArOCtpSnBDRER1aDFjaW1WLzBJWGVX?=
	=?utf-8?B?bVRRWFhBVm4ra0k2S0xLTS9ZZ3ByQVRGVC9mdndrejFXU0tFaU5vUEo4d3pi?=
	=?utf-8?B?aWkyYmtKVk5zWGlrZTAwcHpCZVZDOFJzWmpoVDB3bEhXUnUxMjlJQ2xRdXFC?=
	=?utf-8?B?bWJxVGN1L3VKekJJK015eGsvVHk0OUhGWStydDlCam1HajA1ZWRDTmYyS25k?=
	=?utf-8?B?cklDSThBNy81dDFuNU4wbUltOU0zMWZWc0JxQ2tTWXl3L2RvVkhXTHJxT0JK?=
	=?utf-8?B?UXIzQXNaVmhlaU9tSS9tYWQ1dUZlVU1vTS9nZk1kSEdmRmE5WWVRSk9Held3?=
	=?utf-8?B?bmp6R3A3aDZKanUxQUIrZzFSYTkvLzF5bWxlcWNRMDRJSGE4Um9nK3BSdkdk?=
	=?utf-8?B?T3p5ZTZJeHI2WGJpUkFPSnNFTWRvN2gxZngrRmszZlkrb0JGUlprL2cxK2tT?=
	=?utf-8?B?SE5mdnhaeVRXYi8rR2syMDBlemdkdlJwMFBUOHh0L1g0ZUh2aFZLUmxucDJa?=
	=?utf-8?B?QnBRQVRqK3BOanU2eWtJdG52N0hCVmNCWEdwQTZsNEsxN0UzSXZXaHRjNU83?=
	=?utf-8?B?TllCM3JjdEppRUVnVzZtUzNpS2FLTjlOcHFuRGhZNDdtY1BzNkNmQytiTGRy?=
	=?utf-8?B?emc3VHgzWW9aTktNYVRsSnNlYWtnM2F5MktjVmFseTVQQXEvVytpNTZxQXhh?=
	=?utf-8?B?bU8yQlFEUDJHc25jck4zakZKQVJnTCtSK3kvNTZZRXYxKzhIdkltYWhVeHhM?=
	=?utf-8?B?VkpIVEhIWk9WUmJUL0kxaG9sOWVsdmxMbXhlRWdWallvVjV4U0Y1ZTNjVjlv?=
	=?utf-8?B?NFJWdU5YclVjSC9mVjAxc1BoOHpIU2lLckFsaCtob3c1OG5UdHVaUERuVU9h?=
	=?utf-8?B?SjFiNFc2ZXVVM2lnek5KNFRrTGMvOHVoMmhyd0xTQllUa1dwUk91WXVTMnRs?=
	=?utf-8?B?VWlaNW5pUDdKZndNSUZ2K08vcG9PQXBKZ28rd244dkNWNE9NSDQ5V1BEZHAw?=
	=?utf-8?B?VUFmbVpaOFhrSWc4dGlQSVBKNzNuZXZ6ZjFjSGg1UnJaUTVhV2E3VWhFOWVn?=
	=?utf-8?B?a1phUnc4Mit3PT0=?=
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gb8/EP2dH2vcdDylKIFjQ0QrOvqddPuVTIwq0AA/cpY20Vh/fAJKKaQ/HWxw6Bems811Iz9wJkYF8Xfru5/Moa2DSnW2yeWNHzuLwqGcyr4Q2S9ZeYvrNDshPz8DY4xz4Im3WG07gg07XHt0/U1Y5igQ0hn1eS+/31XSugJVUErvIdJ+98tE8Dcg9dwjfzY88yEPUN1FNqzJqketWdjq2zQT8xB13BgWjDkWJbkLb6Hegb3LUGSrUHeX/fxsRw5OItZmDZVhkPP6U+8hfVGP6Y1KA0t4OP8UzwMG4i878hLUgGYp5x5svi7y36k7vQoREYGCFnwy7qiFup7iW/pYGkKXhh9YfsRU1Cy1e/37DH/QNPWaAP6eFILUf8NT1l8x9O0kYSJBHdOsEh/TxY61IGvUuHFc3/3JqpquJsHbW40=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5b9756-6dbe-43a8-596d-08d69e3a6e83
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2019 11:38:31.6235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB0511
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0511;
	23:YDJTFG0SPAO6t1yDxMBOJPa3hNdtyJDJ3ZCXHfK1KW7PxolgXGnuyKeWfhCfU6wp1iv3zqPYWm1N2LjLvh1pPAAYRhJIM9ani5D65N6ksvFkg01+4NNLGwbeuQOFXWcwrMPDQXE7uVQ+uE8aUxjqUw==
X-OriginatorOrg: prevas.dk
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
X-List-Received-Date: Sat, 02 Mar 2019 20:12:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D84A783F9D882D4E890A24B8C69A7D77@EURPRD10.PROD.OUTLOOK.COM>
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

