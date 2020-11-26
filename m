Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.72])
 by mx.groups.io with SMTP id smtpd.web09.5948.1606401896666387477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2020 06:44:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=Fwm19Af7;
 spf=pass (domain: siemens.com, ip: 40.107.5.72, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3ny80VtLtlo0AMp2n4FG3xiFtJ/IfAKkORcwzoHEBUyYYIpb93IZFK1Y8E62SwGPxb+8kiLo3WwfOV8qkkpPZ7K8LAuJ+t5ECdU7IyB7Af0uEte2MMm+TTniaTZ+TvqAJn7CVyzREcLA7Dtetg2aL98Lx7z7aaQ4f9STrTCO8KLt8hAnO3CYO00Na86THdPH9BiwF/q0sVQo1cYzTK/RL5iqj8de87aSLGxshOieNsKpSP20I0Ubt/OdDo1wpytxfAYLAoK2C4JghsIMVPd26kUgvSyYSBH0LI/4cD73HOZGKxKml237xVCoWF8OtzpgIEFugTrbeb8tzpunJzAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3oxNZ3NXlRdY/sX47dgnR53owmwon8B4q92nQ1+8FA=;
 b=X1TNJgZtBpMPnNlAtVRMgxWd2LC9magDd1/6wxosK1mhiRMnQlCJ6EJd01c3W90t6yDr3hx6Dew+S7s6GjxzNjGk9hkDx+O1Srt4zJPr11bj9wafmOuVIctHZ16C3SdWQqs2+h0LMd9HHqy6mY0TD1lSX7LTH/qWoNX83ZhrVf7npSgeV1CJeR3O1D8WkTDY0HTTMKp99MB7tC+ZDTRKlUcyxQcVt/7ElS8HnvKeMlmVzxMUtJbcC+gLzCYJjorqNLGDnuCbGPsKqazZ5+H0q0wQGsyFrzg8hbzlQ2zD/bMCj5fWEMX5VKJgwvndgVUhbS96WIRlqLxmyCK766zLvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3oxNZ3NXlRdY/sX47dgnR53owmwon8B4q92nQ1+8FA=;
 b=Fwm19Af7KviA6GMsfp+Agryy0KGNoM63LT8DIXxAHSoLBZhssqY2T97mAMNxj/YeFGcZkI1jkAPoPYkQi9RfiyWccaioYpAeuAllVtl4tFVC0oc7Ad72UhlEAzDyIVdKxfiZ070ZLrfh0AB9ehDGa1+P87WpRceyjgba/Bw8754=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB7PR10MB2476.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.25; Thu, 26 Nov
 2020 14:44:54 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dd4e:81f8:cb7e:a1eb]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dd4e:81f8:cb7e:a1eb%3]) with mapi id 15.20.3611.025; Thu, 26 Nov 2020
 14:44:54 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>
Subject: Re: [OE-core][PATCH v2] kernel-dummy: fix executing unexpected tasks
Thread-Topic: [OE-core][PATCH v2] kernel-dummy: fix executing unexpected tasks
Thread-Index: AQHWxAG3vXtJfSTiVEy+l36TOwSWD6nafCGw
Date: Thu, 26 Nov 2020 14:44:54 +0000
Message-ID: 
 <DB8PR10MB39775710E456F17F2FAE85A792F90@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20201125165417.29781-1-andrej.valek@siemens.com>
	 <20201125172045.8697-1-andrej.valek@siemens.com>
 <ef5e35d36905471304587803bd685ce2297ae889.camel@linuxfoundation.org>
In-Reply-To: 
 <ef5e35d36905471304587803bd685ce2297ae889.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2020-11-26T14:44:52Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=cde31830-bc45-4100-8407-2d3d4fb1ea3f;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=siemens.com;
x-originating-ip: [165.225.200.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9f78ff5b-0d3f-470e-436d-08d89219d670
x-ms-traffictypediagnostic: DB7PR10MB2476:
x-microsoft-antispam-prvs: 
 <DB7PR10MB2476B016A063B8B570B7A26392F90@DB7PR10MB2476.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uQkFkDbTKUCAyIP3zIIh6aShkDUHAK1qMSapx/j/3Lf6BsnyKQ6JNsq+wm8Go7lbx4bcsgB0p+LDW+l33kVupE8VSYSxGgj3hsIRYc0vNCcjcHs8JQJWjN4P1+GWil+86QSnDiZ3RtN5vR0wQ9w9wj37BCsKlf4/rzJ0PGiAArftEhQe1UlGRmvB7Ikrghw0+ybMtX2USkU+vEMpPONEqaNllb/Umh1UG7hu/7w8MhaLVsqvAt2JTq7Kh+uW+C4+yPngeU1Wwk7uIRifkhG+8GyEX86nZ+0YDxWa3DtfIuSD1mxD3dlrhFmce4QyqOrL6C8NRlNDVtD72gICsL5QuQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(86362001)(8936002)(6506007)(83380400001)(55236004)(316002)(186003)(7696005)(26005)(33656002)(478600001)(8676002)(4326008)(110136005)(71200400001)(5660300002)(9686003)(4001150100001)(66446008)(64756008)(55016002)(2906002)(66946007)(66476007)(76116006)(66556008)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?Qkl3eHhZL05HNWhOeWxMc1FHS3QvSDE5eFpDcDJVY21ScWRrM1YzaWhxckxq?=
 =?utf-8?B?VUxKVFNTQ3o1V2dJeXVHYW1lenZGYWxUNnVxTmFQSHl4UWRSY3Yvbm5RSSta?=
 =?utf-8?B?czZ2MzByZjRsbVQrS1E5STV2QkFZdkpGeVh0dnJkc1pva1BzcnFWc0dIaGEw?=
 =?utf-8?B?Ti94aExPcUlCMHMrbG8wR0R0TVdZc1pjRDVnemdXMEsyUE5YKzhuc0EwY0lY?=
 =?utf-8?B?MnVWZUt4Z1hrSS9GM1ZKODBZZW1oYUMvT3ZFamtCWkFjUlE2R2NlbEJjMlJT?=
 =?utf-8?B?THNkNFlQOUlXK3dYMHFKbWZFbHA2Z1NGS0ZEYXZRQzZtRW5tTEZWQXM0a2pt?=
 =?utf-8?B?dEVXdnNRY2UybnBhV0UxYVo1TkNTRlB3UnptUlI3akgzV2N2YXdWMllOMURh?=
 =?utf-8?B?cmJ3cGJUTlROTE5PV0lValJJQWtwZGRMRllRalNEeGRiUjVwUE1Hblc2YXN0?=
 =?utf-8?B?MDNoUlc0ZjZvS3I4elVsamJnTGJkblZoS3hBWDVWQ05abk8remx0MkdFN3o1?=
 =?utf-8?B?MXNKSU5XMmVIRHN5M2ZCaWxaaVE5ZE1sZ3F2Z3Jhb2gyNXhnUHZtaGFzWVFz?=
 =?utf-8?B?VDM2azFVMGNXRCtwQklDOGxMbGRYczk2U29IWmZ5MG01QmtuTU0wN2xxMUNk?=
 =?utf-8?B?anZsZnRBTXJzVzNyQjVVMytTNTVmemlIaVgzeHFWdmczeEc2YXZVSGdhVllY?=
 =?utf-8?B?ZklRa2xXdDg3dlVFcE1rc1NObkdYdnZpb3RyTnR1cUYwbEIwMlZBMFlGSWFE?=
 =?utf-8?B?aVFaMk1vblBzS0lTWFNTNlRhazFlRFBUbFQ3TGJkcTdHRFFVeXNRUGNHYitu?=
 =?utf-8?B?Q3EyT2QvNTNheXJwUVJjZ2IzUkEvYkxqcTJIc3FyMzYrOWpXUlhJMUNxVVBC?=
 =?utf-8?B?d1FoWk1LRmpoQnc3VVBucmd6QXB6a2ZjR0E0QWNKaXVEK3hwcSt2dUdEVG5r?=
 =?utf-8?B?MVpvOWZkQWJVWU1FeE1oR3hLVmJRcWZqbUMxU3FickZyY0ZmMWY4NDIvdWt1?=
 =?utf-8?B?ancyNVZkNmVzaVoydERxd0dIYkw3MENvOE5QRWZqdFlQNklreXFVTXhRbHNK?=
 =?utf-8?B?SUloZlBaM3B5UnUyK2tKa3Ixak9SZzR6TmV2aXhGY1dpcjJ5bmhNRlFrMEVw?=
 =?utf-8?B?aWRKbUpxSmJXUVZBZE9YUUNvRW9ka2E5a1MvSUxzSm9zdnZVQ2lFQ0ZMdDV0?=
 =?utf-8?B?eHQ2blp4SXFkSHRUOHI3V3hsNWRwNTl4ODFVSEtNWkdIajhtdElYaFNGZ3hv?=
 =?utf-8?B?OUVzcUIrUXVxNDRncXNrT0M0T3pyRmtiWVN0bEZYejFFK0RjUTdoL1JuNnJj?=
 =?utf-8?Q?dX/4+a80+aB7w=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f78ff5b-0d3f-470e-436d-08d89219d670
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2020 14:44:54.1249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: afSddYxT15EHvRpZl5By1F3VWswQWaNMDBRGDw5LX5Xb1Wg8MiNkUkz4jEifQT67i/WTDJqiDIzwie9eeAC5LGxJ1/f/B6zH5hYwTBPg6xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2476
Content-Class: 
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gUmljaGFyZCwNCg0KTm8gaXQncyBub3QgYSBsZWZ0b3Zlci4gSSd2ZSBqdXN0IGNvcGll
ZCBpdCBmcm9tIGtlcm5lbC5iYmNsYXNzLCB3aGVyZSB0aGlzIHRhc2sgaXMgd3JpdHRlbiBjb3Jy
ZWN0bHkuIEJ1dCB5b3UgY2FuIGNoYW5nZSBpdCB0byBwcmV2aW91cyB2ZXJzaW9uIEkgZ3Vlc3Mu
DQoNClJlZ2FyZHMsDQpBbmRyZWoNCg0KPiBPbiBXZWQsIDIwMjAtMTEtMjUgYXQgMTg6MjAgKzAx
MDAsIEFuZHJlaiBWYWxlayB3cm90ZToNCj4+ICAtIGNvcnJlY3RseSBzYXZlIGZpbGVzIGludG8g
c3N0YXRlDQo+PiAgIC0gZml4OiBFUlJPUjogVGFzayBsaW51eC1kdW1teS5kb19mZXRjaCBhdHRl
bXB0ZWQgdG8gZXhlY3V0ZSANCj4+IHVuZXhwZWN0ZWRseQ0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZWogVmFsZWsgPGFuZHJlai52YWxla0BzaWVtZW5zLmNvbT4NCj4+IC0tLQ0KPj4gIG1l
dGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgtZHVtbXkuYmIgfCA2ICsrKystLQ0KPj4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LWR1bW15LmJiIGIvbWV0
YS9yZWNpcGVzLSANCj4+IGtlcm5lbC9saW51eC9saW51eC1kdW1teS5iYiBpbmRleCA2MmNmNmY1
ZWE2Li4xNDk4ZGEzOTJjIDEwMDY0NA0KPj4gLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51
eC9saW51eC1kdW1teS5iYg0KPj4gKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51
eC1kdW1teS5iYg0KPj4gQEAgLTUsMTAgKzUsMTIgQEAgd2hlcmUgeW91IHdpc2ggdG8gYnVpbGQg
dGhlIGtlcm5lbCBleHRlcm5hbGx5IGZyb20gDQo+PiB0aGUgYnVpbGQgc3lzdGVtLiINCj4+ICBT
RUNUSU9OID0gImtlcm5lbCINCj4+ICANCj4+ICBMSUNFTlNFID0gIkdQTHYyIg0KPj4gLUxJQ19G
SUxFU19DSEtTVU0gPQ0KPj4gImZpbGU6Ly8ke1dPUktESVJ9L0NPUFlJTkcuR1BMO21kNT03NTE0
MTkyNjBhYTk1NDQ5OWY3YWJhYWJhYTg4MmJiZSINCj4+ICtMSUNfRklMRVNfQ0hLU1VNID0NCj4+
ICJmaWxlOi8vQ09QWUlORy5HUEw7bWQ1PTc1MTQxOTI2MGFhOTU0NDk5ZjdhYmFhYmFhODgyYmJl
Ig0KPj4gIA0KPj4gIFBST1ZJREVTICs9ICJ2aXJ0dWFsL2tlcm5lbCINCj4+ICANCj4+ICtpbmhl
cml0IGRlcGxveQ0KPj4gKw0KPj4gIFBBQ0tBR0VTX0RZTkFNSUMgKz0gIl5rZXJuZWwtbW9kdWxl
LS4qIg0KPj4gIFBBQ0tBR0VTX0RZTkFNSUMgKz0gIl5rZXJuZWwtaW1hZ2UtLioiDQo+PiAgUEFD
S0FHRVNfRFlOQU1JQyArPSAiXmtlcm5lbC1maXJtd2FyZS0uKiINCj4+IEBAIC02MCw2ICs2Miw2
IEBAIGRvX2RlcGxveSgpIHsNCj4+ICB9DQo+PiAgDQo+PiAgYWRkdGFzayBidW5kbGVfaW5pdHJh
bWZzIGFmdGVyIGRvX2luc3RhbGwgYmVmb3JlIGRvX2RlcGxveSAtYWRkdGFzayANCj4+IGRlcGxv
eSBhZnRlciBkb19pbnN0YWxsDQo+PiArYWRkdGFzayBkZXBsb3kgYWZ0ZXIgZG9fcG9wdWxhdGVf
c3lzcm9vdCBkb19wYWNrYWdlZGF0YQ0KPg0KPiBJcyB0aGlzIGEgbGVmdG92ZXIgZnJvbSB0aGUg
cHJldmlvdXMgdmVyc2lvbiBvZiB0aGUgcGF0Y2g/IFdlIGRvbid0IG5vcm1hbGx5IG5lZWQgdGhv
c2UgY29uc3RyYWludHM/DQo+DQo+IENoZWVycywNCj4NCj4gUmljaGFyZA0KDQo=
