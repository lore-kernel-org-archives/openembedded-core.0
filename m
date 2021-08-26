Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web09.28146.1629971917273437991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 02:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=AS0eoxnu;
 spf=pass (domain: siemens.com, ip: 40.107.21.83, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoD1UcfOzRkgeXgx2IFi6+QAfLYU//H++EtJdTO1STXA/oTve+CzeffS5iWr83wQXBV5Zawcy4jg5SjUs/dl6odhXawzh9guJFcaakidqphwqceUSCEdExrLZz0IlbrCIQMJa/v8VNPTL9Vowo4LpsY5/o/QrRrjKvI8Xn7E1k8Heq826kbA2l/d/crRgok5c26ELfcWYkY4PJXzZt7JhI/mAkZbt1nFPkcPf3W/D5aJQGlgG+spadKu/+x3feFP8OYopDDxIAU44uV4i/QamdVV17sQgo2tLNk8iz91jmsSg7dOgrl3T4ewvfgKpmod2vI5/Cia21oXxM30397jvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxOTm0hdLbxWVFv1M8xgCRWA8fKExT6bZz4XkWoop0Q=;
 b=V6/gaOTbaTkvf12o5Qb8QtVyQzGGunw3FDlJzyBT35mkXCduEFK75wWPLIkLv8ZjtvBdIjyLG3+n1BvHrrIRjIXaTa0NwAu3krZfAERX7/Rd3JxpBD+mmCyPl0VVM0Sz2WQNQFQkj3dVIVYfXoHbohJb6n9q34fbnUJpQyszDylYfmpV+b36g9F+ooVGx/igsEVJSWZCfwW5pEwe5Kx+zZ28og2nvb5aDQev3A3Jd8HYdBuJmbVsDxSHePIVk6q/S+CaRYR0vGfOYLMafVErnUJLIlLXgI8am3gu99fpZlSERJWsRXSwARXqKtLBWF4mkyaVjhG8DQjdYU0AOEc4aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxOTm0hdLbxWVFv1M8xgCRWA8fKExT6bZz4XkWoop0Q=;
 b=AS0eoxnudQQHt8hAWNd+r7ss7qGHn8/HZdG3PHvlt1txKzj9H8CsKRBN4SQwSfRLOrLdOeV+HcwNCrwYJb4vgFSWdzaPyM784J+9z9yU/s1i/ijnpZQbbrEXrmhUIjiVQtOw8SG1zkLe7V61e96byv9qxyvBoP3Ejo0nkLMdj2g=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB8PR10MB3708.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:137::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 09:58:34 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a95f:bc47:e21e:adac]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a95f:bc47:e21e:adac%9]) with mapi id 15.20.4436.022; Thu, 26 Aug 2021
 09:58:34 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: "armccurdy@gmail.com" <armccurdy@gmail.com>, "steve@sakoman.com"
	<steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>
Subject: Re: [OE-core][PATCH] vim: add option to disable NLS support
Thread-Topic: [OE-core][PATCH] vim: add option to disable NLS support
Thread-Index: AQHXmDmyq6OWCTGY0EC5q1c7gKrRnKuBUePwgABWRoCAAI+9kIADWYCA
Date: Thu, 26 Aug 2021 09:58:34 +0000
Message-ID: <452907b1c72251c6a445882c7dea2ea2dc1b913e.camel@siemens.com>
References: <20210823101205.29267-1-andrej.valek@siemens.com>
	 <ce3005b3-6213-9528-2c82-c4f612f3b549@gmail.com>
	 <DB8PR10MB3977E6C2E704FF73707CA62492C49@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
	 <CAJ86T=V2zSGf3ebYWFh-2-QZ1w55Xsz+6nbkcR9jayh9ANyraQ@mail.gmail.com>
	 <DB8PR10MB3977DC6B069FA94E5EB4399992C59@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <DB8PR10MB3977DC6B069FA94E5EB4399992C59@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 175f0d6d-ba3a-45ff-e21f-08d968781157
x-ms-traffictypediagnostic: DB8PR10MB3708:
x-microsoft-antispam-prvs: 
 <DB8PR10MB37085AC0DBE1FC8B8AE4858A92C79@DB8PR10MB3708.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1dVA9UtEtQ1s/5GsRSY+oF+1iUKPkppo0s3rAdTBz2/wBUQSXm2iSWkOmoSsO8q5+EPcZBZqV2noT9GxBy+SBh34RRVrHUwc1ag//Bi8IoHb+dMpeXIuYxdw6+BWO7VAvbgiWRBujimznQGw87x0+jEfDICgJ1WaELPx+nIgndhjPEfjaOYTJb+QX7s+m2efJX7t/PVQPhjImj7e2BB4s+1tOobXd3pVuACNUWzww1/fc9Fn+SjwmgpY/RrG0I1S3dMZXiud3dpgIBkZFIi/kb+SG3HFxBvq85jTy2HDQ2AJv/GjnUAzVQhxSk4wvn2fSyIMkJFsqV/W3zEpsB6QPdf2255kLK9zaHFuw8eX6tG468DXVGmYMTK282cB47HZz6HgT0jdnTbR4+yi8Qsk+9GCsjQ7AosWcq2RGHOxGVJUm8GR5gFv7147jI6vc9BfpfISlAQnkettw16wvamhg6BDMH18BggNoBksGYp7nE80vMeLakiO79bbJE5/wlCiu3RDRdV3yFb4axvDO5dxYplHg49+NM37OYYiJRggu09zufYRcnMvJfwkwsq90NbiSJfutqrD2oPhHPANNr3ctxj3IL+gk9NB0cM2+U6+ITU5Qjjm2HRRe1lQGr26KPdBtAMQ9EOEEn7L4aeeM8a58nM65gFD8YsE8RSAjsJgnsRDY1chXnhnUts+jWb1g4v6t8L3PJDXVijPNKF0L5+sbUMaBeIEXohR4hvMbtlboFCNsbdTDZ+V7gMWbzoIlN8GgEyJpp8K9+R7IxXCt9LNxP/N+YyrMtJHAJ2szPuvD+s=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(6486002)(110136005)(54906003)(186003)(26005)(38100700002)(122000001)(478600001)(5660300002)(6506007)(38070700005)(316002)(2906002)(45080400002)(8936002)(71200400001)(2616005)(966005)(4326008)(66946007)(36756003)(6512007)(86362001)(91956017)(53546011)(66446008)(83380400001)(64756008)(76116006)(8676002)(66556008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TTltdG1memFKajJPdnk3Rmg2NGZsTE55Qm5lUTZJSDFBaWtxdU1SdmlXOVg1?=
 =?utf-8?B?M2JwL2dyUjM2Wm0wMnJjNzJvSzhSMXhLa3ZDcTNObC9Hd016Y1ArNE53RUM0?=
 =?utf-8?B?aGVCTkFWYWplb3ZhZnBvQ0FlY0dwME9GeE9jNzBGRm1CYS9PSFhobkYybUtP?=
 =?utf-8?B?NWZCY3haWm5XbHJlMXNpY3VwNFIzWkp2aTJMdGVPb003TTlwYmhYcWs3aUsw?=
 =?utf-8?B?L2dpNzhzU2F1WXhxdXFrSG02a2dPZVRwaElMMjBVNFNpVDlzUDJWTThyck9P?=
 =?utf-8?B?dUt1blB5dTg2S2ZETEZEMUEwZFVTUXdzM09VNy9RWTdjU0lWeDVFL05lS3ZZ?=
 =?utf-8?B?d04rODRTSVYrU0RpQStYL2FZYXNNVVZOVVlTNlFTdjZXM3U3QlI2WlIvdmNO?=
 =?utf-8?B?QnYvMnBEalJObk9KbzBicm1xblprSmF0aE5mbktibzlxbnFSYXlQRTFOdG1a?=
 =?utf-8?B?OCtvVHA5M2x5RVVWNHVBUG05bTM3L1FvYkNVNndvWmozbEZEM0RqTmg0SFpl?=
 =?utf-8?B?M0JGekc1Mzc4Rnk0VXd2K09RZjNBTXIySHNtV0NaZ3ZhUndvenBwdTUzYzNZ?=
 =?utf-8?B?ZDZKU0dJNm5ydmhKYTkvZlhEODNnb0l2V2NELzRGNmMxYWovMTBla2NoWGtI?=
 =?utf-8?B?V0tIQUtzdDFEYnRud3FkRjV5bDdFTU9FT0c0ZW1sZE8xc0tSTUNhQ1puKzRo?=
 =?utf-8?B?bmtFS21zY2cxTE1XMFd4OVdLR01NR0dPdG1QdDJtODU3S1hiVHBrQXZVNTBz?=
 =?utf-8?B?WGJxbmQ1RE1BQnA0Y3FKZWNtYUVweFRUeVpBT1IyT3lwRHZDWEtZNnMwWmFj?=
 =?utf-8?B?R0J4NkdOamU0MWtnR3pEMEs4YlVnZjVvYkhmUG1Qb0xpZnJsSTYrTWlrdThD?=
 =?utf-8?B?dkJNTEJIZWhSWWd6VHdmWTdkSUhWZ0RaWjYxS1hpbzhrd2tsMHppWnVTVktC?=
 =?utf-8?B?MytYc0FRU0txY2lKMitDNjVlT1gvb1NSd3VtTEtIQXpSeEdZVmVEQTdmOEY3?=
 =?utf-8?B?ZUlNdlVmT3dybjM3elZBU0dtVGw5Z1BQSWYxVFJSWGhIMFZEcnVhbkwyRjlW?=
 =?utf-8?B?WDhJaDNSU29MWVNnTmhsVWo4azJhUVV4c21CRWVlek9FcE9TaWxDYzlMbVBS?=
 =?utf-8?B?bEpSNmtmaSsvVmJDelhSMExnWElMTXIwRWVueVFrRXkrL0VjaExsSVJYRDJR?=
 =?utf-8?B?OUNsdHhpRXpvc3J0bDZGVjBxRGZ4Um1hOVJQQU14QmEwcXhtVGRCbXI3VEhB?=
 =?utf-8?B?N0QxMmdudThXWU1LNXJtN0pXTDBDZUpiVEZRTXJRN2dOc2wvQkI4R0pmd0I1?=
 =?utf-8?B?bmJFRk55aG5JRTQ1SXROa0ZObFRJSlZqb0dlRXFmME9GMEtEdU9mNmQxd1Iw?=
 =?utf-8?B?Z1FkWGNBV1BBTURVU21IZTVQd0ZTMzI4aGVQZXdQdW1tcHRhWXhRajYzRjZw?=
 =?utf-8?B?YVQ0TmkvVnhhajlPMW1EN3FzTjA4eDZ2aUUyckVuVDQzSGEwNzlIaEN1ZVMx?=
 =?utf-8?B?OFUrZERhZHNOQm1iaW9RVnNqVGJqMHNnM1I0UUR5SzdSVlQzZ1NlY0hBMUJq?=
 =?utf-8?B?YVRFTWxaSHJ4RkVrcDFPMGZzSmNwNTZrcDViMmRDWWxPQWkwUmxJYnVVbFVv?=
 =?utf-8?B?RnBmMGdJRnJ0VUZIdzdMeFAvcjRQNG01a2hXLzRzUWV5emFaU2xpazNZRUdH?=
 =?utf-8?B?WkJtZnRlVlFST2d1UWk5UWU1dUJRcEVhSGZ0WTFnODFjSmdKdVpGaHVpU2Y1?=
 =?utf-8?Q?tu3QXbvh+StqxdSEgTnHfRXMALgHUe5xAYO59i3?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 175f0d6d-ba3a-45ff-e21f-08d968781157
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2021 09:58:34.5394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4xoXV+frlS07iWNi2IbbtdksHAVBtm44hyvdULku2qJNUsn1jUAAxWg1UFOuEBTczzGG162Wd+30q/3PYBNsV9fyqFsEXK/0evjMj2xe3Gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3708
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E31E84E02E855C4382A5C239FBFA4CC6@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCklzIHRoZXJlIGFueSBwcm9ibGVtLCB3aGljaCBzaG91bGQgSSBmaXg/DQpJIHdv
dWxkIGxpa2UgdG8gaW5jbHVkZSB0aGlzIGZlYXR1cmUgaW50byBkdW5mZWxsIGlmIHBvc3NpYmxl
Lg0KDQpUaGFua3MsDQpBbmRyZWoNCg0KT24gVHVlLCAyMDIxLTA4LTI0IGF0IDA2OjU2ICswMDAw
LCBWYWxlaywgQW5kcmVqIChBRFYgRCBFVSBTSyBTSS1CUDEpDQp3cm90ZToNCj4gSGkgYWxsLA0K
PiANCj4gT2YgY291cnNlLCB0aGF0IEkgdHJpZWQgaXQgYW5kIGl0IHdvcmtzLg0KPiAuLi4NCj4g
Y29uZmlndXJlLmFjOjQ1MTc6IFlvdSBzaG91bGQgcnVuIGF1dG91cGRhdGUuDQo+IE5PVEU6IFJ1
bm5pbmcgLi9jb25maWd1cmXCoCAtLWJ1aWxkPXg4Nl82NC1saW51eCAtLWhvc3Q9eDg2XzY0LXBv
a3ktDQo+IGxpbnV4IC4uLiAtLWRpc2FibGUtc3RhdGljwqAgZW5hYmxlX2FjbD15ZXMgLS1lbmFi
bGUtZ3VpPWd0azMNCj4gZW5hYmxlX25scz15ZXMgLS1kaXNhYmxlLXNlbGludXggLS13aXRoLWZl
YXR1cmVzPWJpZyAtLXdpdGgteCANCj4gY29uZmlndXJlOiBXQVJOSU5HOiB1bnJlY29nbml6ZWQg
b3B0aW9uczogLS1kaXNhYmxlLXNpbGVudC1ydWxlcywgLS0NCj4gZGlzYWJsZS1kZXBlbmRlbmN5
LXRyYWNraW5nLCAtLXdpdGgtbGlidG9vbC1zeXNyb290LCAtLWRpc2FibGUtc3RhdGljDQo+IGNv
bmZpZ3VyZTogbG9hZGluZyBzaXRlIHNjcmlwdCAvaG9tZS9wcm9qZWN0cy95b2N0by9xZW11eDg2
LQ0KPiA2NC9sYXllcnMvYnVpbGQvbWV0YS9zaXRlL2VuZGlhbi1saXR0bGUNCj4gY29uZmlndXJl
OiBsb2FkaW5nIHNpdGUgc2NyaXB0IC9ob21lL3Byb2plY3RzL3lvY3RvL3FlbXV4ODYtDQo+IDY0
L2xheWVycy9idWlsZC9tZXRhL3NpdGUvY29tbW9uLWxpbnV4DQo+IC4uLg0KPiBjaGVja2luZyBo
b3cgdG8gcnVuIG1hbiB3aXRoIGEgc2VjdGlvbiBuci4uLiBtYW4NCj4gY2hlY2tpbmcgLS1kaXNh
YmxlLW5scyBhcmd1bWVudC4uLiBubw0KPiBjaGVja2luZyBmb3IgbXNnZm10Li4uIG1zZ2ZtdA0K
PiBjaGVja2luZyBmb3IgTkxTLi4uIGdldHRleHQoKSB3b3Jrcw0KPiBjaGVja2luZyBmb3IgYmlu
ZF90ZXh0ZG9tYWluX2NvZGVzZXQuLi4geWVzDQo+IC4uLg0KPiANCj4gU28gZG9lcyBpdCBtZWFu
LCB0aGF0IEkgc2hvdWxkIHVzZSB0aGUgLS1lbmFibGUgaW5zdGVhZCBhbnl3YXk/DQo+IA0KPiBB
bmRyZWoNCj4gDQo+ID4gT24gTW9uLCBBdWcgMjMsIDIwMjEgYXQgMTA6MTIgQU0gQW5kcmVqIFZh
bGVrDQo+ID4gPGFuZHJlai52YWxla0BzaWVtZW5zLmNvbT4gd3JvdGU6DQo+ID4gPiANCj4gPiA+
IEhlbGxvIEtoZW0sDQo+ID4gPiANCj4gPiA+IEkgbG9va2VkIGV4YWN0bHkgaW50byBjb25maWd1
cmUuYWMgd2hpY2ggYXJndW1lbnRzIGFyZSBleHBlY3RpbmcNCj4gPiA+IGZvciB0aG9zZSBvcHRp
b25zLiBTbyBJIHRoaW5rLCBpdCBoYXMgdG8gYmUgbWVudGlvbmVkIGV4cGxpY2l0bHkuDQo+ID4g
DQo+ID4gQXNzdW1pbmcgY29uZmlndXJlLmFjIGlzIGJhc2VkIGFyb3VuZCBBQ19BUkdfRU5BQkxF
IC8gQUNfQVJHX1dJVEgNCj4gPiB0aGVuIGFuIGV4cGxpY2l0IG9wdGlvbiBpcyBub3QgcmVxdWly
ZWQuIEEgZGVmYXVsdCB2YWx1ZSBvZiAieWVzIg0KPiA+IHdpbGwgYmUgc2V0IGZvciAtLWVuYWJs
ZS1mb28gLyAtLXdpdGgtZm9vIGFuZCBhIGRlZmF1bHQgdmFsdWUgb2YNCj4gPiAibm8iIHdpbGwg
YmUgc2V0IGZvciAtLWRpc2FibGUtZm9vIC8gLS13aXRob3V0LWZvby4NCj4gPiANCj4gPiBIb3dl
dmVyLCBhcGFydCBmcm9tIHRoYXQsIHlvdSd2ZSBhbHNvIGRyb3BwZWQgdGhlIGxlYXZpbmcgIi0t
IiBmcm9tDQo+ID4gdmFyaW91cyAtLWVuYWJsZS1mb28gb3B0aW9ucyBhbmQgY29udmVydGVkIGRh
c2hlcyB0byB1bmRlcnNjb3JlcywNCj4gPiBhbGwgb2Ygd2hpY2ggbG9va3Mgd3JvbmcuIEhvdyB3
ZXJlIHRoZSBjaGFuZ2VzIHRlc3RlZD8NCj4gPiANCj4gPiA+IFJlZ2FyZHMsDQo+ID4gPiBBbmRy
ZWoNCj4gPiA+IA0KPiA+ID4gPiBPbiA4LzIzLzIxIDM6MTIgQU0sIEFuZHJlaiBWYWxlayB3cm90
ZToNCj4gPiA+ID4gPiAtIFNvbWUgZGlzdHJpYnV0aW9ucyB3aXRoIFVURi04IGxvY2FsZSBoYXZl
IHByb2JsZW0gd2hlbg0KPiA+ID4gPiA+IE5hdGlvbmFsIExhbmd1YWdlDQo+ID4gPiA+ID4gwqAg
U3VwcG9ydCBpcyBlbmFibGVkLiBBZGQgdGhlcmUgYW4gb3B0aW9uIHRvIGRpc2FibGUgaXQuDQo+
ID4gPiA+ID4gLSByZWZyZXNoIG9wdGlvbnMgYmFzZWQgb24gY29uZmlndXJlLmFjDQo+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmVqIFZhbGVrIDxhbmRyZWoudmFsZWtA
c2llbWVucy5jb20+DQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gwqAgbWV0YS9yZWNpcGVzLXN1
cHBvcnQvdmltL3ZpbS5pbmMgfCA4ICsrKysrLS0tDQo+ID4gPiA+ID4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPiA+ID4gPiANCj4gPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdmltL3ZpbS5pbmMNCj4gPiA+ID4g
PiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS92aW0uaW5jDQo+ID4gPiA+ID4gaW5kZXggMTdk
MWMyNGE3Yy4uN2NjNDc4ODRmMiAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC92aW0vdmltLmluYw0KPiA+ID4gPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L3ZpbS92aW0uaW5jDQo+ID4gPiA+ID4gQEAgLTU0LDE5ICs1NCwyMSBAQCBkb19jb21waWxlKCkg
ew0KPiA+ID4gPiA+IMKgwqDCoMKgwqAgYXV0b3Rvb2xzX2RvX2NvbXBpbGUNCj4gPiA+ID4gPiDC
oCB9DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gLSNBdmFpbGFibGUgUEFDS0FHRUNPTkZJRyBvcHRp
b25zIGFyZSBndGtndWksIGFjbCwgeDExLCB0aW55DQo+ID4gPiA+ID4gK3NlbGludXgsIGVsZnV0
aWxzLCBubHMNCj4gPiA+ID4gPiDCoCBQQUNLQUdFQ09ORklHID8/PSAiIg0KPiA+ID4gPiA+IMKg
IFBBQ0tBR0VDT05GSUcgKz0gIiBcDQo+ID4gPiA+ID4gwqDCoMKgwqDCoCAke0BiYi51dGlscy5m
aWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdhY2wgc2VsaW51eCcsDQo+ID4gPiA+ID4gZCl9IFwN
Cj4gPiA+ID4gPiDCoMKgwqDCoMKgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVS
RVMnLCAneDExJywgJ3gxMQ0KPiA+ID4gPiA+IGd0a2d1aScsIA0KPiA+ID4gPiA+ICcnLCBkKX0g
XA0KPiA+ID4gPiA+ICvCoMKgwqAgbmxzIFwNCj4gPiA+ID4gPiDCoCAiDQo+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gwqAgUEFDS0FHRUNPTkZJR1tndGtndWldID0gIi0tZW5hYmxlLWd1aT1ndGszLC0t
ZW5hYmxlLQ0KPiA+ID4gPiA+IGd1aT1ubyxndGsrMyINCj4gPiA+ID4gPiAtUEFDS0FHRUNPTkZJ
R1thY2xdID0gIi0tZW5hYmxlLWFjbCwtLWRpc2FibGUtYWNsLGFjbCwiDQo+ID4gPiA+ID4gK1BB
Q0tBR0VDT05GSUdbYWNsXSA9ICJlbmFibGVfYWNsPSJ5ZXMiLC0tZGlzYWJsZS1hY2wsYWNsLCIN
Cj4gPiA+ID4gDQo+ID4gPiA+IGlzICd5ZXMnIG5lZWRlZCB0byBiZSBleHBsaWNpdCA/IEkgdGhv
dWdodCAtLWVuYWJsZS1YWVogbWVhbnQNCj4gPiA+ID4gaXQgDQo+ID4gPiA+IGltcGxpY2l0bHkN
Cj4gPiA+ID4gDQo+ID4gPiA+ID4gwqAgUEFDS0FHRUNPTkZJR1t4MTFdID0gIi0td2l0aC14LC0t
d2l0aG91dC14LHh0LCINCj4gPiA+ID4gPiDCoCBQQUNLQUdFQ09ORklHW3RpbnldID0gIi0td2l0
aC1mZWF0dXJlcz10aW55LC0td2l0aC0NCj4gPiA+ID4gPiBmZWF0dXJlcz1iaWcsLCINCj4gPiA+
ID4gPiAtUEFDS0FHRUNPTkZJR1tzZWxpbnV4XSA9ICItLWVuYWJsZS1zZWxpbnV4LC0tZGlzYWJs
ZS0NCj4gPiA+ID4gPiBzZWxpbnV4LGxpYnNlbGludXgsIg0KPiA+ID4gPiA+ICtQQUNLQUdFQ09O
RklHW3NlbGludXhdID0gImVuYWJsZV9zZWxpbnV4PSJ5ZXMiLC0tZGlzYWJsZS0NCj4gPiA+ID4g
PiBzZWxpbnV4LGxpYnNlbGludXgsIg0KPiA+ID4gPiA+IMKgIFBBQ0tBR0VDT05GSUdbZWxmdXRp
bHNdID0gIi0tZW5hYmxlLWVsZi1jaGVjaywsZWxmdXRpbHMsIg0KPiA+ID4gPiA+ICtQQUNLQUdF
Q09ORklHW25sc10gPSAiZW5hYmxlX25scz0ieWVzIiwtLWRpc2FibGUtbmxzLCwiDQo+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gwqAgRVhUUkFfT0VDT05GID0gIiBcDQo+ID4gPiA+ID4gwqDCoMKgwqDC
oCAtLWRpc2FibGUtZ3BtIFwNCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiANCg0K
