Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com [216.71.156.125])
 by mx.groups.io with SMTP id smtpd.web12.52704.1622516262158737260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 19:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fujitsu.com header.s=fj1 header.b=zXsdLY8J;
 spf=neutral (domain: fujitsu.com, ip: 216.71.156.125, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1622516260; x=1654052260;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=9DYec6Rb5wfiUTH9haC6UE1kxiFJZPU4Xy2Gbhn5zbI=;
  b=zXsdLY8JdhSKV43wEq+oZf/H0jicwpGup1MVJG7nG9v3WJk0FbUmwHh1
   oSdqM8OoLSALgkAjh9A9qx/1Y5bzBDFtwj9fGhLRSHAR3gXaI2ZiHaWaB
   uym66//s/8Q8dTtMg04oeStU5jffgxsRdgXO50OprsiJFAEIcYFeTc9EH
   YuW17qF1HlKScNr6U34qX9osX9w/J6vFI6RJ7jYKO898u3wkyGghb63kj
   tz8z8h5QFkAieo1ltkJV3zPtpjTxCsdQ9Nl25icc9iWWpEB/bonHZSTqJ
   4yzRjJpghwxKGUhUIrQLA/Vca4/c0nEClF9fYXQZnn7V8/0pdSERAaeki
   g==;
IronPort-SDR: ODBF1w7wzOrPFsU4WrsCuiZqCn1EB6eZ72gePoYQ2EGM8PXd2ExOhJi3qggxkqQ2CX413F4igY
 SqriyMdldTwRuAK6RJk4qvW+W1T5MwbDHsguvIPy4JLiJK2+FaBUiRoRcyRDkoA89HxgTE0YPz
 niXVWsZdWpzYKKd//J9ap67z6pz6kEbQqaRbaJjGKlQQVrW/DpRuB2SoGc26P0BvDeSsJFtEuu
 fOCoDtYLUF+GuQUp1nHSJBupR1MTTkgCoVbTHSK/feQYlzQpwkglSQXDe81uNqNlg9iNvlb53Q
 0q0=
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="32296919"
X-IronPort-AV: E=Sophos;i="5.83,239,1616425200"; 
   d="scan'208";a="32296919"
Received: from mail-ty1jpn01lp2059.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.59])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2021 11:57:37 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDu7Zrt+LBUIcP7qKKNdMQ4n5Zsy/PT7MNyGLWC/gI7fKIHjtQdkANJV4EhCxa/JD6zOBv3nynLqIxKBGQBPMPIhPJedEDwXKrhA280XHxLZ3yCtH0TUbkoRSVcST2EOHdlILOBU0GNdfdwaJEbBm/M4wuVeSp9OfckX0BOOHZr5bm9ODJQ1x48rN/QfSwNSygvDi/snm1KVAG2VWZ/0x+sEz2kNM6uZnRYqIxD7KJNuVXNwPdh9kfl++Mc+EHuz0GpK65ZQBVDEbyOsiLN81tc+TFl+67zIocxsuoRVkeAScbjTGQT/+lm45Nlmf1ULWnH3pN/EqTLHM1G3XAt4gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DYec6Rb5wfiUTH9haC6UE1kxiFJZPU4Xy2Gbhn5zbI=;
 b=gpiI2TqTgAM8yelFVuRxY3Gkkkq2cyu7EZ7aBRLBqxGTbhhIRqCvMEPC4eQDQN1CiL+FgHlrTyqNC8oI9uMA7EWJtq2PpbSTPNTI4QVDbFRhPwimMag1Ql8il+NI7/mP3sKIWe110rdxfDwavr9bwGEeCkESYknE0/89Pq9YzpvO3w2foSeGTYWjvrhXBONbJjW6NCBaN6joNEcmxNAD5o14cjjdUMc86W1aTBHtT2vSXPIJqTRlX59cjKo18UhpDLQFdi7ZXJ7ENmNnnhE6h3aUNMDqE424NyZOFpWjj96byeICK7PguD4gBlO5YXC/nD1M9w8disU/jl6A36NDGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DYec6Rb5wfiUTH9haC6UE1kxiFJZPU4Xy2Gbhn5zbI=;
 b=Xg7Q31ddN9VgnynKxXnB8gHv2vfkV4413Q05vplXRktPgd2zGfNLHLleh7MCavevNurnk83wSonrqfVzRDjQUaQePqj7HDE50MuVAH4UhnhYEisrv99xKXM686X2SgJSbkFFNK8C06tWsTYQRhC3z64dWMHlklJqu3JxFG0p2OI=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by OSAPR01MB1458.jpnprd01.prod.outlook.com (2603:1096:603:32::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Tue, 1 Jun
 2021 02:57:32 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::550e:c53a:917f:a825]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::550e:c53a:917f:a825%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 02:57:32 +0000
From: "leimaohui" <leimaohui@fujitsu.com>
To: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Khem Raj (raj.khem@gmail.com)"
	<raj.khem@gmail.com>
Subject: Re: gdb-cross-canadian-arm includes 64bit inc file when enable multilib
Thread-Topic: gdb-cross-canadian-arm includes 64bit inc file when enable
 multilib
Thread-Index: AddRDK0xN3FA8Hk9R5ynMAe5zzSX3AFhSw7g
Date: Tue, 1 Jun 2021 02:57:32 +0000
Message-ID: 
 <OS0PR01MB617893402335EC233A9D7D10A03E9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: <168274EEE5A118D1.6305@lists.openembedded.org>
In-Reply-To: <168274EEE5A118D1.6305@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72ab28d5-ff0d-44a4-6047-08d924a90077
x-ms-traffictypediagnostic: OSAPR01MB1458:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <OSAPR01MB145801366B1EAFE9A2FE50F4A03E9@OSAPR01MB1458.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:785;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mLvvPwwvGApkPysIoVwWWropTyyx9i2VOI7WT/tgAsB+DFSqIThSvpEzaL8qsgKOFVcLSXoS79lnQobwtcviC2IVIo3ecBXtuGH4NfdLoCCtLw9qLo5vdWiAzjCPvAEYtlpWP6gRkZcvoFfG4BB/5boR8/XLfLLqsVUYH1FGq4iOYLUirlJ61+b/c6+sV16lsDHOKVu2BK7ngeKPifx9x0wl3eKw7L5gpYq0k4JER0UsmMK/9QUBAQOTjxDcRKFrqJeyxgVG7s4SKyIqfxlpviZ3U9kH4ehz6XOysFIEIwJ/diWuZ3A9Goc6+/V/aT88ys12rdUm77isk22aKq880Fyp//RPNeXyofhF6A0vo0055YUZLOBCaH/JBARQy4jdbS0hQeBDHLKwdQ4znmNw61fbAOAR/xukuwsCFFvIfCGi6K/pe60JYDm8bBi4VlQzGz/shfGx+S0wioCF+0Cu8enjenMkJ2NmHsWySWShu9qnhNVubwQgPTl0RKUbZi5w688b9QankBBLXQDCJrPSus4I9z7AXur7h+qnlGuLb7+YviLnKLFMJxQuOixBdEQtHhCLVTn9nwHGGF6Wai+sR+rKKw2nuYi1EbyAe4JE4CQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(8676002)(5660300002)(33656002)(55016002)(122000001)(71200400001)(83380400001)(66476007)(38100700002)(26005)(110136005)(2906002)(86362001)(66556008)(64756008)(85182001)(186003)(9686003)(53546011)(8936002)(316002)(7696005)(6506007)(76116006)(52536014)(66946007)(66446008)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?shift_jis?B?SzVWS0JvRXNPNHZIWXRlaHE0U3JzcXlURjAvOEYwR1BMVWhoTU5Ca0I3?=
 =?shift_jis?B?dU1EU3RVUjFFYkxPRmxSSXRvZVlHZlp0dXB2cWcxOTdNZWJRcExVQ0RW?=
 =?shift_jis?B?NHMySTlyRFFxRFlKZ1FSYmFhRFpCbjBKOGI0SXo2aGZjbU5iSkd1bWJp?=
 =?shift_jis?B?cnpZeE10dTRPTCt4WkxpejVpaWZWN3RkRmM2cXZZUkNNMEJ3TVIvTXlB?=
 =?shift_jis?B?d0RTaHdpZEJ1bk1ubThhY0NYTHYyazVTMm1adDRaVHhSOFlWR21lUUlq?=
 =?shift_jis?B?NWJaWWFxbVFjdkgrS0JFV2xGK3dSVjc4Sm9BU25xdDY1a3l2MjBaUGx2?=
 =?shift_jis?B?TWdGK3JjVzg3M28yNk1LY0RPTzNtYUJSTzQreFYzaVIxakorRXlJdHNm?=
 =?shift_jis?B?K1lEYTh2bG4yTzhKVlFzeUVFQVFGdU50dUdDTXNlcWxzUC9jWk1vUSt6?=
 =?shift_jis?B?eE4wYWZvbjZ2UG14amJyaGExZTc0NHpQVTIyaTB5NXFDL1pTMEpCSUU4?=
 =?shift_jis?B?eUUzbm1zb2owY3JXSTdHWmNSQ20vb3R0WlFaTmU0QVU0dERObHJYQXgv?=
 =?shift_jis?B?Nzk1S21tdlhqYjJPOGVablFPdXdEUk9WRkphMUlxc3ByZGtBOE94czNt?=
 =?shift_jis?B?bnVUQUpwd2tMbGJFcU9oSVJNR2l1SzR3U2draDFDRXhCelFPbkwrSklI?=
 =?shift_jis?B?ZkpNK3VHdEVqeVNjWW5OS0JPSjBNb3NPM3lmanNXTEJjVkFRUVl5Zm80?=
 =?shift_jis?B?ekMva1FXV1BralVkTE1oaFBhOVdIdnhvWkxkUUMwWmV1YmZyN0dpQ3BM?=
 =?shift_jis?B?bTBvRlJ1dWhWMVhNVGNMT1lsZlZXckFZaDlFVmo2V2JCQjRaOGIzZEtM?=
 =?shift_jis?B?amQ1ZnBwMkFGVWRjRVRsLy9VSXNHVnpvbGVYdDBFa1lIQ0JmUGRXbTZS?=
 =?shift_jis?B?Z3EzOXBoL0phYllDRXRHNnZyMVlwbTBTY1pxUGZ0eHU1ejFVZHRnWFFx?=
 =?shift_jis?B?N0I1VitXS01yOTRYeXVUTkdoL213clF1SHJlZmJSaE8xKzAraG5ucnB0?=
 =?shift_jis?B?SU1YUllucVJsZkM3NHBQdW9Fb3djQ1h4THlHR0g0eEFuNnZyTWt3eUJm?=
 =?shift_jis?B?anZ4WGNKd1NicXhuKzFYaCt0a3J0RitwTkVxTjR2L3pSaElRL0J4MXFY?=
 =?shift_jis?B?YVRkQU42eGtMdnNiZ3hOQjVsWlpqSTBCNEx1bmVwUFBOZVNwY1hiNkFR?=
 =?shift_jis?B?eHlZT3F3cHg5M1BWdHYyVnh4bEorN09iQnBSUitGZVlrQXpsTlhJWTVi?=
 =?shift_jis?B?WlVJMGVtYUtESUxDdzJMa09CM05wVUpRQmdjVHh3a1RCelpkelRheGdl?=
 =?shift_jis?B?bDhNVWIweVdyS0R6N1l6NGhackt1ejRHY0pRRjBXdU4yVzFHeFI5RWhN?=
 =?shift_jis?B?T0JEaFhTUW1ObFY5Wmd2eFlKTGRXZEFmNG8zbUNoMTFWeDRYdTJ5SXkz?=
 =?shift_jis?B?Y3B5VENab21wZ2kvdy94d0tjQUFWUHpsQTRxcVk1SERCSUVBSnVQdkow?=
 =?shift_jis?B?QmlIOTJsYllyN3NJdnR0Q1UvMGl1eEQ0Q0g3Z1NHdWVUOHJlNktEMU00?=
 =?shift_jis?B?cHZMUU5LNkNBcy9hZGZNUFYxTjlLZ0xkVVErSHRCeVJRYWlDaUJyV2cv?=
 =?shift_jis?B?NWp6VXNzUzZ3a3NlUmZwa0RCYXg2NHFpbnd3Q1gxL1BXajdLNHlPL05K?=
 =?shift_jis?B?bjNNT01GUEpmQlJ0SVNJV0p0ZGdEd1RkbVA0dDVIOGhJUEJ4YjNCVkNs?=
 =?shift_jis?B?MVVBamJZSkVid2VqSVIrOFIydXBlYSt3ZjFoRS9BOTh4WmRtemFhemhB?=
 =?shift_jis?Q?k5RQfvtwTvX7Maq/wz+rY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ab28d5-ff0d-44a4-6047-08d924a90077
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2021 02:57:32.4257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Qt/axP3D/qTmqYcFHG/EMvRU8+0en2AiLT92CfaFiCO2dV0MaJMfF6vVQrU4i5ZB5Gk+tzjtT9v8Wqbsy/n8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1458
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBsZWltYW9odWkNCj4gU2VudDogV2VkbmVz
ZGF5LCBNYXkgMjYsIDIwMjEgODowMyBBTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZzsgS2hlbSBSYWoNCj4gKHJhai5raGVtQGdtYWlsLmNvbSkgPHJhai5r
aGVtQGdtYWlsLmNvbT4NCj4gU3ViamVjdDogW09FLWNvcmVdIGdkYi1jcm9zcy1jYW5hZGlhbi1h
cm0gaW5jbHVkZXMgNjRiaXQgaW5jIGZpbGUgd2hlbiBlbmFibGUNCj4gbXVsdGlsaWINCj4gDQo+
IEhpLA0KPiANCj4gSSBmb3VuZCB0aGF0IGdkYi1jcm9zcy1jYW5hZGlhbi1hcm0gaW5jbHVkZXMg
NjRiaXQgaW5jIGZpbGUgd2hlbiBJIGVuYWJsZQ0KPiBtdWx0aWxpYi4gSXQgaXMgY29ycmVjdD8g
U2hvdWxkbid0IGl0IHVzZSAzMmJpdCBpbmMgZmlsZT8NCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiAkIGxzDQo+IHRtcC93b3JrL3g4Nl82NC1uYXRpdmVzZGstcG9reXNkay1saW51
eC9nZGItY3Jvc3MtY2FuYWRpYW4tYXJtLzEwLjItcjAvcmUNCj4gY2lwZS1zeXNyb290L29wdC9w
b2t5LzMuMytzbmFwc2hvdC9zeXNyb290cy94ODZfNjQtcG9reXNkay1saW51eC91c3IvaW5jbHVk
DQo+IGUvZ251Lw0KPiBsaWItbmFtZXMtNjQuaCAgbGliLW5hbWVzLmggIGxpYmMtdmVyc2lvbi5o
ICBzdHVicy02NC5oICBzdHVicy5oICQNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiANCj4gSW4gYWRkaXRpb24sIGdjYy1jcm9zcy1jYW5hZGlhbi1hcm0gaXMgdXNpbmcgMzJiaXQg
aW5jIGZpbGUuDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gJCBscw0KPiB0bXAv
d29yay94ODZfNjQtbmF0aXZlc2RrLXBva3lzZGstbGludXgvZ2NjLWNyb3NzLWNhbmFkaWFuLWFy
bS8xMS4xLjAtcjAvcg0KPiBlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL2dudS8NCj4gbGliLW5h
bWVzLTMyLmggIGxpYi1uYW1lcy1oYXJkLmggIGxpYi1uYW1lcy5oICBsaWJjLXZlcnNpb24uaCAg
c3R1YnMtMzIuaA0KPiBzdHVicy1oYXJkLmggIHN0dWJzLmggJA0KPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+IA0KPiBCZXN0IHJlZ2FyZHMNCj4gTGVpDQo=
