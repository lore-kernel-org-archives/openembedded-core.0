Received: from esa4.fujitsucc.c3s2.iphmx.com (esa4.fujitsucc.c3s2.iphmx.com [68.232.151.214])
 by mx.groups.io with SMTP id smtpd.web09.5541.1616048856408382458
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 23:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.onmicrosoft.com header.s=selector2-fujitsu-onmicrosoft-com header.b=ZOR61Y0s;
 spf=pass (domain: fujitsu.com, ip: 68.232.151.214, mailfrom: wangmy@fujitsu.com)
IronPort-SDR: gCpVUPBHX47F3O3HZ5BEi9vpZo9qaNx///VUKPN76SA/gvI2MWN2sfTgsJ+PEvuCV6q6R9G3gA
 KNLycoEBXXFrJE6OmFFblc9Y6SgEngIYZF7VgHfJbGw5USHudeC5oGlSKF8K84nf75Uau5uwrq
 DSRKMk7zreOXmdKw2uPrwSYSRx4Y9gfqFjHra9AnXZgiYdwFGgKI1L1sf3TzlPXZEIt+Rgcrkm
 Rv2gBe7hPnKi2MUfMBFIb+Jmuj69LA+8jzO59wCmZsoIWcp9IEAE3nKncbZP44J0aVBQg7v7SS
 Xnk=
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="35996373"
X-IronPort-AV: E=Sophos;i="5.81,257,1610377200"; 
   d="scan'208";a="35996373"
Received: from mail-ty1jpn01lp2055.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.55])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2021 15:27:32 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuircXq3Lgwo+kd6vbpjC1YP5YVdBkB5WOxLijqPonYtAEJnioQzpgRq7H+dDf6qZ8DHWCtESzvgv1dzP5XVm6ugLxNiRtr8BaLS3+N0UMLJ7itDqcUvgfep+x9ng5EyrdZuaZ/LdfDu5nNu1iMw4lxTvivqgV1ipt89bfdeMqVIK18QIMO4QL0NwHCnYNFzJiWg5SnX4Vhtj0ceTliq0b+dTJYBASsYMF1ga/K8ODSvBB5YG8VIPmQzG2oi65Bg9tNaCbsHxchoWDtdOLbWPVL0c4w3xqrKWpRoq97HQcKrrO9CNMsRidT6z3TBVqPKMxVPTgwPoOTI9FITB115kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Etz1EdGGbOQHCKCl4/OAVzUYtFmC054qbgjGtQUurbw=;
 b=SsLU44BLvuiBoTanPU2IXyAf/9GXoNtJUfssF57mlOfpXQCDqoa/mT2M2SM1Ppy75Gbw1THG7JNZt5Bx0mToNQR5BRx2DhD5mXGYNLG1nRH3Ya8Rusv4aU7EQg8PDWv/i1qkaSO9sqf204PXQAzfgw/+6uDnItlHJLJ5BAFnymdwnP6tCB7PEUxJl+utzpk6CMncErfPX6NIRgQCEpGsoTG+n3oQbt6l2Nv1iQdra1drDNfbc961yFDaK0ZnAX7T4rhg84uAQq5BWzRGp1n3nSMa6LIJ7s7KYKDRdZPU/z3xeynvyOrNZ1aSqrut7V7m9bUAIZ3C6Rq5LjM9Ne+j0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Etz1EdGGbOQHCKCl4/OAVzUYtFmC054qbgjGtQUurbw=;
 b=ZOR61Y0sgE7T0am/uTWrcLTCy3P5OtEW5bhwSq05skQMFEPNAMW4dy417D7Z/NfEJAC7YXz09ND1kf5NHWQbYmi8t7H3z8bVU+N+EimVt+YddeH6Xn83WAz6zALCY6UNEIHCSEXiUF+sm60DW1Hrqmclc6U0GNgUBWGvWFdPBsA=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OSBPR01MB4455.jpnprd01.prod.outlook.com (2603:1096:604:77::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 06:27:29 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::a19e:1848:1864:bd44]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::a19e:1848:1864:bd44%4]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 06:27:28 +0000
From: wangmy@fujitsu.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] openssh: upgrade 8.4p1 -> 8.5p1
Thread-Topic: [OE-core] [PATCH] openssh: upgrade 8.4p1 -> 8.5p1
Thread-Index: AQHXGwkxnTH+FPdTck2M0saVgTg3E6qIGmCAgAEvAgA=
Date: Thu, 18 Mar 2021 06:27:28 +0000
Message-ID: 
 <OSBPR01MB18452F81CFCC79059919C38ADC699@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1615970397-22583-1-git-send-email-wangmy@cn.fujitsu.com>
 <9e26a86873a0828bff2ce96a0ecfadc53a99d3f6.camel@linuxfoundation.org>
In-Reply-To: 
 <9e26a86873a0828bff2ce96a0ecfadc53a99d3f6.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98185ecd-ad15-41fc-cc3b-08d8e9d6e778
x-ms-traffictypediagnostic: OSBPR01MB4455:
x-microsoft-antispam-prvs: 
 <OSBPR01MB4455C1AA836ABFB98B9734F6DC699@OSBPR01MB4455.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +4JKIMVMdp9Dzo5zVJOJ/Hnj1ySueydJ+LTyBkDvVcYEsK3q+c8rngzlWeFeyKScWmg+FLiov6DHZDxqyBz7glzQ4bPaoj324uSo7nt+p0YbyQ4esn3CUWpopSwWtBN00lr2AVb+Yhf84+B1q7pKzwaXHljDp1HC3baoJbSlALjKJAHNIbijLRKnXMJOOY0v0s6Cw/n5foQJztPUBXnA49F7siswcviJhYTy0OrzUlJB9BGTJirrPHcVxezRf7oLxp4Mu8JHky9W7eqxEgomCr9zYdrVqlK9m6HV3xqbXRNHBMg3z7IVpgr0FcOjXdx6gq9toDri9bIOzIUh440YnGa1sgXH4cMv675vXU3rOrc4AI3xvObRW3990nW2egSUVTAdokmn729Z9EnxCpI7xfdZVnX6vbKeNlcxPWe2dDo+RqsJOTN+I3P6eTzD37oSE5xRgAtoRlI2nvaQ4bTsSuL96uEiCe3+flCYDAHPaYoxjYapql+7iCGbsNHetR5G7N3Xp/aH2GbEaIGraiuYxPsQ38tEiv3BIxcqibfX9gnLtNVMRXID9U28X8ww1IsAXj9wu4zEQPjBEK19WkyERcikeryirsXKFgRiBnvwTKMlQ2yQ1AnTNS/8kdj98bzUlgyRVDoR6NovVZVOSYc/2QV5mvXD4AzTMGJQ5W8sQJmnIoPiAaL1V8VnkKfilPlo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(110136005)(316002)(966005)(76116006)(66946007)(71200400001)(55016002)(186003)(86362001)(66556008)(66476007)(2906002)(33656002)(478600001)(64756008)(66446008)(9686003)(26005)(8936002)(8676002)(53546011)(6506007)(83380400001)(52536014)(85182001)(7696005)(38100700001)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?T0hmL3VhRnpBdGd4eWlUKzJCcGFISzVuY3RUYWhKV3paZFRFMXZBbmpJMHoz?=
 =?utf-8?B?N3lzQWZKR2pHWERkYkgxSUw5UW9MYTN3a0prU0d5YXJ0akZYWXUzK0UxZmhO?=
 =?utf-8?B?ZGVYSDhmNE84UkZjZmRZUEZjdFZheHJhZ1kxUU1HUForNlZRK003b2pOeGJs?=
 =?utf-8?B?dXcyMldKNFBiZmlvWUprZzZnY0ZKOGZOUmlWdVZXSStkMjF0b1o3OXRXL01R?=
 =?utf-8?B?dktTa1dHd1c4NWN1VVdQWG1rSlpHN2JxcmVmaWU5eGZ3M1V1dUU4Wm1tejNJ?=
 =?utf-8?B?amxiTVp0Nm9Cck5LNUQyZitvMzRNc2QzTWdKTW43ekxLVUsyMkl6OWlLVmVG?=
 =?utf-8?B?ZHVONFh0YkIwZzhBbFhmWElXOW1iRTdQU01aaGxNRWRlSDU1dkZZS3dFdTM4?=
 =?utf-8?B?S1puTnFaWHMrTCtWcmQxZWlDeDdFSkJIT243MFhrTXBpR25ObXhPSUM1VnBs?=
 =?utf-8?B?RGNSWkNrMGp3dWZrUytSdnlDM000SkF1LzlsT241NXJIbm9nNmplTEV4aGlN?=
 =?utf-8?B?ZzB5cVc2bWRsdnRXbC93ajYrQWcrdmdvRTBsODZtekQrMHFtVEoxM0Q1UTkx?=
 =?utf-8?B?RXZwYmNuQVhIYWs0VEY3eFVKVHlUTzRhSk1ScWJoTkRFMWhNdDRwYXM3Zko4?=
 =?utf-8?B?Vk9oUW5FR0NNMldVK3NTemJFSXBTdGJhWlJMa3ZlZGdmMlEvZldmQWsvZjRs?=
 =?utf-8?B?cFJFTThjSDViOTBWdXRKbW9PKzEyL2txME5DYlpjSkNKZnZoNzNlVUI3M3lz?=
 =?utf-8?B?M0tqczBjNWFhcFJzUTd4YXMxeENVYXJ3em1rQmJYaEc2Yi9rQzNiOXA2VWtY?=
 =?utf-8?B?WUEzSHJPMGc1TFd0VXU3VExYWWRmWHJWWmxFSThDbkVTQXllSCtOYlEvZmIz?=
 =?utf-8?B?MjdRVVdLS3BDdHEwOXBOeU5KNks2SHZxdGxQQ1RRYmZSYklnTERYSW8vaVor?=
 =?utf-8?B?c3ZtYytIczJITks5bFgzeFJrZ3pLcE5GdUVTOVhreXRTNWNLYzNHRUhlZ09V?=
 =?utf-8?B?WHI0TnIvMkNROUxJbisrU0IrcGhMOUMzNENTeFFRYWQ3TnJkQTdiNkZ1WFc5?=
 =?utf-8?B?U3RQNStrK01ZQVpRU3dBV3VadWdaU0pLL2JoOVhXM3hrcHp5K2l5R3h2SEQ2?=
 =?utf-8?B?WTZ0ZFdKOERTdjFmOTY4QUNKSyt0K2VQV1o3WVFOcnE2Nm5HUnkzQkt6ZENy?=
 =?utf-8?B?a21Ia0E1SDJsTEpZSmZya1ZEQklCa2NBc095NEU1RXFPRVo2N0R0Q2pWV0pi?=
 =?utf-8?B?ajBOQkhyNjMvQ0UxbzJxNTFSWHNoM2F0K0htOThxOVBnUnR5N2RFbGs0Nm9z?=
 =?utf-8?B?Q2dlYzNrcmZzb2FkaXNuQ2E4M3ArYURYL0NNY2JWMk16MHFUVVRpZ3IzUUt2?=
 =?utf-8?B?UUZSQVg4eUZrQkFOVk9hR2hHQU9hUnJqSmkzanI5MUcxR0lMRWF0bnM4bDFa?=
 =?utf-8?B?eHBRVFFLbjFnWnUxWHdSY2tyWlcyYlZZdEY1djRjT0lGQ0hJOVl4SXFYS0l2?=
 =?utf-8?B?TzFrWFdzbHhabUkzMXc5Um9sM2N5ZGc4Qm5IWGdXQll3OFhMRm0wZjc0MWp2?=
 =?utf-8?B?d3J1R3VzbHpKWGd4NkhuNTFZQmpnZlQ4OUFVb25LM25YbDZ0NHVtblhBbEZ6?=
 =?utf-8?B?WFo2NUhKdmE3U2hYU1lZTi9LSktvR3NGSnRrbFZQd0twQXZXbkdIaGVGUHRl?=
 =?utf-8?B?bXJ1ejAzMmphTlZBZHlLeHpQVmFCbkp1Y3VYdjZjVWNWc2VFckxoVkZrVnNC?=
 =?utf-8?Q?F6n3rvaNn0vYd6rQF9HbbTI8dJYGknYNXZXzxQM?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98185ecd-ad15-41fc-cc3b-08d8e9d6e778
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2021 06:27:28.7592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wYuE43BTfkYJJnMgX9P0h61twKEkMl5rZMhcA2zfgcGqNGoZDkbBoxE2z+V4Gx8Vz1r1n0P3CKvoBRDzDph+3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4455
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBEb2Vzbid0IHRoYXQgbWVhbiB3ZSBzaG91bGQgY2xhcmlmeSAiQlNEIiBpbiB0aGUgTElDRU5T
RSBmaWVsZCB0aGVuPw0KDQpJIHVzZSBzcGR4LXRvb2wgdG8gZmluZCBvdXQgdGhlIGZvbGxvd2lu
ZyBsaWNlbnNlcy4gRG8gSSBuZWVkIHRvIGNsYXJpZnkgdGhlbSBhbGw6DQoNCkJTRA0KQlNELTIt
Q2xhdXNlDQpCU0QtMy1DbGF1c2UNCkJTRC00LUNsYXVzZQ0KU1NILU9wZW5TU0gNCkJlZXJ3YXJl
DQpNSVQNCk1JVC1zdHlsZQ0KSVNDDQoNCsKgIC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkRl
dmVsb3BtZW50IERlcHQuSQ0KTmFuamluZyBGdWppdHN1IE5hbmRhIFNvZnR3YXJlIFRlY2guIENv
LiwgTHRkLihGTlNUKSBOby4gNiBXZW56aHUgUm9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0K
VEVMOiArODYrMjUtODY2MzA1NjYtODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04
MzMxNzY4NQ0KTUFJTDogd2FuZ215QGZ1aml0c3UuY29tDQpodHRwOi8vd3d3LmZ1aml0c3UuY29t
L2NuL2Zuc3QvDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8b3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+IFNl
bnQ6IFdlZG5lc2RheSwgTWFyY2ggMTcsIDIwMjEgODoyMyBQTQ0KPiBUbzogV2FuZywgTWluZ3l1
L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIG9w
ZW5zc2g6IHVwZ3JhZGUgOC40cDEgLT4gOC41cDENCj4gDQo+IE9uIFdlZCwgMjAyMS0wMy0xNyBh
dCAxNjozOSArMDgwMCwgV2FuZyBNaW5neXUgd3JvdGU6DQo+ID4gMGY5MDQ0MGNhNzBhYmFiOTQ3
YWNiZDc3Nzk1ZTlmMTMwOTY3OTU2Yy5wYXRjaA0KPiA+IHJlbW92ZWQgc2luY2UgaXQgaXMgaW5j
bHVkZWQgaW4gOC41cDENCj4gPg0KPiA+IExpY2Vuc2UgVXBkYXRlZCA6DQo+ID4gMi1jbGF1c2Ug
QlNEIGxpY2Vuc2UgYW5kIDQtY2xhdXNlIEJTRCBsaWNlbnNlIGFkZGVkDQo+IA0KPiBEb2Vzbid0
IHRoYXQgbWVhbiB3ZSBzaG91bGQgY2xhcmlmeSAiQlNEIiBpbiB0aGUgTElDRU5TRSBmaWVsZCB0
aGVuPw0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KPiANCj4gDQoNCg==
