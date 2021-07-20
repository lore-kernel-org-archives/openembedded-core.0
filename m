Received: from esa20.fujitsucc.c3s2.iphmx.com (esa20.fujitsucc.c3s2.iphmx.com [216.71.158.65])
 by mx.groups.io with SMTP id smtpd.web09.4477.1626763721722096002
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jul 2021 23:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=EIxqEBdm;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.65, mailfrom: ito-yuichi@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1626763723; x=1658299723;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iOcragwTCw5MCwUkEOcSk78vBvF4rM+jzjLMihsCWvI=;
  b=EIxqEBdmk4Zi14CzI+l9l+sJwOeHU9mBYIserPM8W0rdoi0bZKr18eMf
   dSL6L9wji241Phw052HH1RP0HBCtX4Tdbx36B3eTRrY61qq34Z/LAVbw/
   KwKJcGIjVvMLJSnGjRDlRlUw5DvICFCcOeEQlzLTf4GU0uSVKQljXXLyd
   IB2rJ3Bd99XfGXCGr86A+eR16xktVvt1ykVDgJeXotehGSAFnpeq9YdY/
   xJIueZACbFh1uciCqA69z076I+YF/3VQK+2HoZM6G/ZB1nwTVafEzQ4In
   09nOsg9ofnkYVJKPcw55nsUoM7LTHB7Y+7RhGbcp0ZSCPLP8XS1bAZ1Kp
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="35200745"
X-IronPort-AV: E=Sophos;i="5.84,254,1620658800"; 
   d="scan'208";a="35200745"
Received: from mail-ty1jpn01lp2057.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.57])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2021 15:48:39 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhqO3n+rQQ3stwUwn1jieBjqtbfmL0GgJ5hn3byj+J0+DltCq/z+zkcb7w143lBUHYH2o2/eQKL7JlqrJiJT37v7zPSk9KW3ibKaCi9YZyljTzAhyNnlvbUV2lVuhyJF24DIpPZlabu9E5KFvmPSZk4kYVdAwEgTpIWQUjbv1CHxGa/VaqILvl4pHFtxJuazSrtff1FScS67gJV6QvHkmljnNtOeCnk4mTk+C4I+9PjFM4FlKz4bG3v2DlqcpqJf8OZDmfr/HhO4Tj/lGbsiJWq3n0uHPf1LNIwK2YkQy32LdlGECXINC+zCSlLE89mLGkMUe7MmqJr4xAWoYN+EKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOcragwTCw5MCwUkEOcSk78vBvF4rM+jzjLMihsCWvI=;
 b=i3UmUNsMGXMBQiapS0nxOCWxK1BhkAA8Cua/W1kkhlc6MGzA2oZ5DB3OuRPovlUGnmajOgsiEN/raoHzNjT41l4CHXSHVPM68YpaxFwpJmvoBE04Cl/VBAeDe+4D+uSKdN5XFnSZ6F+XvR3vExi+buKljCjA+a6EQG+BkfF0mY/lnbgVdFmND5x+h32rXt1hALDe2xLxk395ePas5pXjBMeSE43Cht17qqtHGwugkdWu8F/HtzrVdNuQ3WAZx6nIovz1eZy5YdO0ys/qgGGtLqR+u2AcdP14XrmIWHRCfuF3pAUst5CykrQvnoe+aZj7vX+qY82sKkP9Sj76eAh6ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOcragwTCw5MCwUkEOcSk78vBvF4rM+jzjLMihsCWvI=;
 b=ZV2hoaE95tG/eCP9gCFOPEo1Hrkvh+E4eQBbLQE08HB17QKGA8ULj12NMZxXzGJKt5XW9BLSiFyXaH1m+Tjn/M3r89rtEO3hfj5NRIva2tysnfzwlC1Wqugcb5+633Ixt+OCxGDSysCXfyQeEPCGVV5rVT7NGYLRUdAkqppFBo8=
Received: from TYCPR01MB5599.jpnprd01.prod.outlook.com (2603:1096:400:41::9)
 by TYYPR01MB6729.jpnprd01.prod.outlook.com (2603:1096:400:ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Tue, 20 Jul
 2021 06:48:35 +0000
Received: from TYCPR01MB5599.jpnprd01.prod.outlook.com
 ([fe80::a0a3:8a30:7d79:db67]) by TYCPR01MB5599.jpnprd01.prod.outlook.com
 ([fe80::a0a3:8a30:7d79:db67%4]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 06:48:35 +0000
From: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>
To: 'akuster808' <akuster808@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] cve-check: Add allowlist that is same function of whitelist.
Thread-Topic: [OE-core] [PATCH] cve-check: Add allowlist that is same function
 of whitelist.
Thread-Index: AQHXanKtSp8zYPvAjEKvHUlVZf/v6qs0zWoAgBa3EhA=
Date: Tue, 20 Jul 2021 06:48:35 +0000
Message-ID: 
 <TYCPR01MB559974130EF14CC85D5D621B8FE29@TYCPR01MB5599.jpnprd01.prod.outlook.com>
References: <20210623085633.3186982-1-ito-yuichi@fujitsu.com>
 <b7b05b428677e6d8f39c700ff4ce212a9baa8918.camel@linuxfoundation.org>
 <7ddffb54-dbc6-e221-fa69-5dff83ef5983@gmail.com>
In-Reply-To: <7ddffb54-dbc6-e221-fa69-5dff83ef5983@gmail.com>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfRW5hYmxlZD10cnVlOyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJh?=
 =?utf-8?B?Yy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRlPTIwMjEtMDctMjBUMDY6MDE6?=
 =?utf-8?B?MzRaOyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0?=
 =?utf-8?B?ZmVjZTA1MF9NZXRob2Q9U3RhbmRhcmQ7IE1TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?utf-8?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX05hbWU9RlVKSVRTVS1SRVNU?=
 =?utf-8?B?UklDVEVE4oCLOyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9TaXRlSWQ9YTE5ZjEyMWQtODFlMS00ODU4LWE5ZDgt?=
 =?utf-8?B?NzM2ZTI2N2ZkNGM3OyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1h?=
 =?utf-8?B?YjRkLTNiMGY0ZmVjZTA1MF9BY3Rpb25JZD03ZTZkNDBjMS1mMmFkLTRjNTQt?=
 =?utf-8?B?ODA1NS00YTE5NGZiODRhOWQ7IE1TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00?=
 =?utf-8?B?MmFjLWFiNGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA=?=
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad98a7cf-f6d6-4a71-6fa8-08d94b4a65cc
x-ms-traffictypediagnostic: TYYPR01MB6729:
x-microsoft-antispam-prvs: 
 <TYYPR01MB672943D6BF5435687856DDF88FE29@TYYPR01MB6729.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mML5/0r6DMqBAaanT8hqUqxTRPDGSbC0nHykJK2+9CkLnFyYQD8aw/+0OKVJV6zDXwSOpQjbw3BIMsERp1lDPuXnHJO23qFFU0TAUVWFq9Wqap1e5eMbmP/e5hVk+sjP79EU9mi2eY4jJpi12Gny/NR6OmB1C5aDzmMUT7D63D6Hg3XnTjh5FbxBuWVX2hp104ZnTaMSyKPUozFvCE4F/mPGoFaKa905QH/xYtaPH3Tl4JWNfk1Mgp3X0Uy/JpXaBC7vQamueppyezV9PhHgoAFqLvhArBrA2/heHIYzRcjkAAaEhKuSIzXam0Yg5LqHoEWiMEz40yOoccRw3W2wn2l22VBCX5uAiXFBCW/nddmQxIbOWYJ4PRJcwKiTxE2NLEyngnhMlRXWIBdTKSkGzePO/T/sssK4HC7gs6HU0N3Z/aMl9l5XPWDsNcjI10+HYSd2lmKlFsWyTJ76lhWFg7JZTwOg1/Cc2oK14SyVzDfFJV4ZSz9rJyjnjHDIu11UQhS1xlRwanbwWQXIrcSlfxxGYXqPaPsNHQ70yyhTMHz9pzazq/B7JqRLeCJtEEjtTk5EKl2fgHzrhhGngIAGCFbmia/wr4ctjRNOmbt/x2Q0zXZ4ZwG3hcdpuOHJe5Iabs91x3TkqEdtVvx5Jrq8FcQQMr8HXHq62b1UWrDq5vDsybezCnxAxKcnJ8CNx/xXT9CPRhZrWpsRNs+nk864dPa0QKQ43h4MhrXQ7MYtaqUUmZHfpy/XHfelRc5eSR36oR50B7L2Abrutrm6E4f1TZSYCMYyUUfOxpbesLOh59Ngwj592PrH2Rqo297Txim4NDxDSiexMbEwrq315dhwNA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5599.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(6916009)(76116006)(966005)(66946007)(83380400001)(4326008)(54906003)(64756008)(316002)(66556008)(86362001)(71200400001)(66446008)(66476007)(6506007)(55016002)(7696005)(478600001)(38100700002)(53546011)(5660300002)(52536014)(85182001)(26005)(33656002)(2906002)(8676002)(9686003)(186003)(122000001)(8936002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TGZDOGpZZUl4STBWWUFpNTV5VDFVNVQvdWxSTzA1cHJKelR1cENHOTB6dk04?=
 =?utf-8?B?MmlVakxmNjJRYURIN012WmZEVlNCZGFNeGREQ0NMcVJoSnZGRHZHcWh4MDZQ?=
 =?utf-8?B?U05NanhRUFJQeDNVUlN2ZHcvYk13UDlFdHM5bUx1OXhoaGRjSUxiMzNKMzBM?=
 =?utf-8?B?VTVmeWp3MmZKTmY4VWVHSUJnSDdFaXR4aWR6czRPYWl5Yk5tM01neG1WVkRU?=
 =?utf-8?B?SU9qd1dybGdJdFZuSi8wQmYwNXlheTZGd0F4T2lsNHlRcU9VSENRaW80bUp4?=
 =?utf-8?B?Qy9rcGZLb3NISFJzTG53ZVdycU03WjZZdW9HektFemJ2WXIxTzFEOU1pRzlS?=
 =?utf-8?B?TG1vendSRWZ0aERmYkdQQlo2bFdYek5DazV6eUdudlZkZmNWSHdQakcwQmw4?=
 =?utf-8?B?T1Zxa1REMGdnRU1rc3B3aXcyalhKbUpGN1B4ZElobXE4NXp4amV4ZWg5MjRP?=
 =?utf-8?B?RVlNNDFHZ2pHRXJHL2ZGUm1hSkhyY2tsT3hXWWx6ZWxEeStOdFRMbzlXQ01E?=
 =?utf-8?B?cEpSSC9zb2NFT0k0amZxN3JoeG1XT0w5TFdEL1F0TmNXUUlSdkJ2Y3dvN3B6?=
 =?utf-8?B?V0FNRWxzZ0pRU1RxYzBQczcvNXBpZUh6dkRRY3N5N2JUV2ZMRnloL20rWGR2?=
 =?utf-8?B?ck43OGJFYnh4YmpYeHlaMG94U2IvY2dCbGJPQzkreTdVVkdBTXRCZndicnow?=
 =?utf-8?B?WTRTZ2JyK20rNE8xNURlQVEzbkhwVnlwQ1FaUVZhNnEwRXhsWDZhYTlqelJT?=
 =?utf-8?B?UDdlbXpPaFRSVEtSdW1reksxNUZBUVIrSXFFZzJnNE92K2grYWFjdVhiVHJN?=
 =?utf-8?B?bllrMThQWWxId2xtZUpFU0VKMDJTb0F0VUZrL3BBUURtQlMxajRiS1BzSEtl?=
 =?utf-8?B?bzBhNTdtZGdpKytmdy92M1kzV3d3T3NmL1NGcjkrQzErLzBIc0kzT25kUWNK?=
 =?utf-8?B?MHRvYUZ1Nll2Nk9nbnFTOHhFQmhGWDVJeFFhbHg2MEZISG00aXJYc2VtQTRC?=
 =?utf-8?B?MGlpREJ3eGFLSXBxWjVDaDBtU1pkeEJXWjU4UXpSRVdkeTNUNFg2eE9CRTNx?=
 =?utf-8?B?VWQ0dmdBQy9nMVp0bmxFbXF3L0lhdVBFRE5mNG0yUlNoUldNUE0rQWNZNldq?=
 =?utf-8?B?Ui9EYkVsbkRrWTdWL0EvMjM3Y3BjZDNMZ2ttSHRGNko4alBkcHdyWG8wTzZz?=
 =?utf-8?B?YzV2Q2RucEpOZXRadnl6Y0NzWG9WbndQNXRWdGFuSWxwS0NGVGU3cW04SVlz?=
 =?utf-8?B?REpTRld3QTRSUnZFWlRONXRzckZ1QzNFMHhiUGExL3Z6bkFDQUt4Y2JYVmpG?=
 =?utf-8?B?TmxIOVBka0w0aEZnRmVENEh4MnlZZ2E2OU5oY3Q4NC9ET1VUUDMvV1k0eGVZ?=
 =?utf-8?B?TGJkTTh2TlRHMzNnbmdlTXRvNDFBdXRMaDZ2L2llWkdzcU5xeDJKZUI3RWZo?=
 =?utf-8?B?b1F2Tk1RSitjOXh3Zm9lcE9NbzJpMFYxVlRXRElTQ1JadUxzK082MjFrakRn?=
 =?utf-8?B?WFVPUXk0d29xV0tkNWFkYktLNDlqeUdrNUY0SmNqcGllWmV0Ry9qOFdoK21w?=
 =?utf-8?B?Uml5QXFVMmFYeENNZTZOV3NQQURlS25NQkNLVEhmZU1sTEVuUnIrd2ZzNjd3?=
 =?utf-8?B?UzNwa21kQkU3Y24xWUwzSG9VbEpRL05sbHFpdzVobTY2WWNUNkI4b0NpTXNO?=
 =?utf-8?B?Z3p1U1BXMGFwQklrN0ZDNU45VWcwNkQzRVJRWUtOcStPSnAydWpmZGRMNkJV?=
 =?utf-8?Q?fabpOf39XJ89TKpQ5kEoaxApQfJVPrHMFu6lG1x?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5599.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad98a7cf-f6d6-4a71-6fa8-08d94b4a65cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 06:48:35.6369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N70Aw4Y7tXSRnsYY0zXEj9oi3BOrw08tBhPqAMYGCt6GH6Rwezi+0HcRGc/VXOFXZ1ZjO+Gy1SR1c4Tg1IX/AzJAE7N6dE0poe7C8XVixcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6729
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SEksIEFybWluDQoNClRoYW5rcyBmb3IgaW5mb3JtYXRpb24gb2Ygd2lraS4NCkkgY3JlYXRlZCBh
Y2NvdW50IGFuZCBhZGQgQ1ZFX0NIRUNLX1dISVRFTElTVCBpbiBWYXJpYWJsZXMuDQoNCkFjY29y
ZGluZyB0byB0aGlzIG1lc3NhZ2UsIENWRV9DSEVDS19QTl9XSElURUxJU1QgaXMgZGVwcmVjYXRl
IGFuZCBzaG91bGQgcmVtb3ZlIGl0Lg0KaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cv
b3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNDI1MDUNCg0KVGhhbmtzLA0KDQpZdWljaGkgSXRv
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYWt1c3RlcjgwOCA8YWt1
c3RlcjgwOEBnbWFpbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgNiwgMjAyMSA0OjA5IEFN
DQo+IFRvOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9y
Zz47IEl0bywgWXVpY2hpL+S8iuiXpCDmnIkNCj4g5LiAIDxpdG8teXVpY2hpQGZ1aml0c3UuY29t
Pjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFtQQVRDSF0gY3ZlLWNoZWNrOiBBZGQgYWxsb3dsaXN0IHRoYXQgaXMgc2Ft
ZQ0KPiBmdW5jdGlvbiBvZiB3aGl0ZWxpc3QuDQo+IA0KPiANCj4gDQo+IE9uIDYvMjYvMjEgMzow
NCBBTSwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+ID4gT24gV2VkLCAyMDIxLTA2LTIzIGF0IDE3
OjU2ICswOTAwLCBpdG8teXVpY2hpQGZ1aml0c3UuY29tIHdyb3RlOg0KPiA+PiBUaGUgTGludXgg
dGVhbSBwbGFuIHRvIHJlbW92ZWQgcmVmZXJlbmNlcyB0byByYWNpYWxseS1jaGFyZ2VkIGphcmdv
bg0KPiA+PiBmcm9tIHRoZWlyIGNvZGUgZm9yIG1vcmUgbmV1dHJhbCBhbmQgaW5jbHVzaXZlIGxh
bmd1YWdlLg0KPiA+PiBTbyByZXBsYWNlIHVzZSBvZiAid2hpdGVsaXN0IiB3aXRoICJhbGxvd2xp
c3QiIGluIGN2ZS1jaGVjay4NCj4gPj4NCj4gPj4gRmlyc3QsIHdlIGFkZCBDVkVfQ0hFQ0tfQUxM
T1dMSVNUIGFuZCBpdCBpcyBjb25zaWRlcmVkIHBhdGNoZWQgYXMNCj4gPj4gd2VsbCBhcyBDVkVf
Q0hFQ0tfV0hJVEVMSVNULg0KPiA+PiBXZSBwbGFuIHRvIHJlcGxhY2UgYWJvdXQgb3RoZXIgd29y
ZCBsYXRlciBhbmQgZXZlbnR1YWx5LCByZXBsYWNlIGFsbA0KPiA+PiAid2hpdGVsaXN0IiB0byAi
YWxsb3dsaXN0Ii4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogWXVpY2hpIEl0byA8aXRvLXl1
aWNoaUBmdWppdHN1LmNvbT4NCj4gPiBUaGUgVFNDIGRpZCBkaXNjdXNzIHRoaXMgYW5kIHByb3Bv
c2VkIGEgcGxhbiBvbiBob3cgd2Ugc2hvdWxkIGdvIGFib3V0DQo+ID4gYWRkcmVzc2luZyB0aGVz
ZSBpc3N1ZXM6DQo+ID4NCj4gPg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9v
cGVuZW1iZWRkZWQtYXJjaGl0ZWN0dXJlL3RvcGljL2luY2x1DQo+ID4gc2l2ZV9sYW5ndWFnZV9z
dW1tYXJ5Lzc1ODIxODE5DQo+ID4NCj4gPiBJIGFwcHJlY2lhdGUgdGhpcyBwYXRjaCBoYXMgZ29v
ZCBpbnRlbnQgYnV0IEkgd291bGQgcmVhbGx5IGxpa2UgdG8gc2VlDQo+ID4gYSB3aWRlciBwbGFu
IG9uIGhvdyB3ZSBhZGRyZXNzIHRoaXMgcmF0aGVyIHRoYW4gY2hhbmdpbmcgc2luZ2xlDQo+ID4g
dmFyaWFibGVzIHBpZWNlbWVhbC4NCj4gPg0KPiA+IEZvciBleGFtcGxlIHdlIG1heSB3YW50IHRv
IHN0YW5kYXJkaXNlIG9uIHRoZSB0ZXJtICJJR05PUkUiIHJhdGhlcg0KPiA+IHRoYW4gIkFMTE9X
IiBvciBldmVuICJGSUxURVIiIG9yICJWRVJJRklFRCIgb3Igc29tZXRoaW5nIG1vcmUgc3BlY2lm
aWMNCj4gPiB0byB0aGUgbWVhbmluZyBvZiBDVkVzIGFuZCBDVkUgY2hlY2tpbmcuDQo+ID4NCj4g
PiBUaGVyZSBpcyBhbiBvcHBvcnR1bml0eSB0byB0cnkgYW5kIG1ha2UgdGhlIG1ldGFkYXRhIGFu
ZCB2YXJpYWJsZQ0KPiA+IG5hbWVzIG1vcmUgY29uc2lzdGVudCBhbmQgdW5kZXJzdGFuZGFibGUg
YnV0IGlmIHdlIGp1c3QgY2hhbmdlIHNpbmdsZQ0KPiA+IHRoaW5ncyBhdCBhIHRpbWUgdGhpcyBv
cHBvcnR1bml0eSB3b3VsZCBiZSBtaXNzZWQuDQo+IA0KPiBJIGhhdmUgY3JlYXRlZCBhIHdpa2kg
cGFnZSB0byBjb2xsYXRlIG91ciB0aG91Z2h0cyBhbmQgYWdyZWVtZW50cyB0byBoZWxwIHVzDQo+
IG1vdmUgZm9yZXdvcmQgaW4gYSBjb2hlcmVudCBtYW5uZXIgdG8gYWRkcmVzcyByZW5hbWluZyBz
b21lIHRyb3VibGluZw0KPiB2YXJpYWJsZSBuYW1lcy4NCj4gaHR0cHM6Ly93aWtpLnlvY3RvcHJv
amVjdC5vcmcvd2lraS9JbmNsdXNpdmVfbGFuZ3VhZ2UNCj4gDQo+IEkgbG9nZ2VkIHNvbWUgdmFy
aWFibGUgbmFtZXMgYWxvbmcgd2l0aCBhIGZldyByZW5hbWluZyBleGFtcGxlcy4gTWF5YmUNCj4g
dGhpcyBjYW4gdHVybiBpbnRvIGEgcGxhbj8/Pw0KPiANCj4gU2luY2UgaXQncyBhIHdpa2ksIHBs
ZWFzZSBlZGl0IGFjY29yZGluZ2x5Lg0KPiANCj4gLSBhcm1pbg0KPiANCj4gDQo+IENoZWVycywN
Cj4gPiBSaWNoYXJkDQo+ID4NCj4gPg0KPiA+IA0KPiA+DQoNCg==
