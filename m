Return-Path: <cbugot@sierrawireless.com>
X-Greylist: delayed 3636 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 30 Mar 2018 15:17:36 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0063.outbound.protection.outlook.com [104.47.32.63])
	by mail.openembedded.org (Postfix) with ESMTP id CBAAE7473C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 15:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=SierraWirelessInc.onmicrosoft.com; s=selector1-sierrawireless-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=9UBmH8SzyCjz+kAAw5q8UBofMeb5c6cRM7siAl1+oGw=;
	b=ZbXqzTTM4f5bGVt8wC/M94w1SbQ61VoI5ZJhrBZrYL8zlDzup6jwS077bF/Fvy063Cxfj00UDwtShCJBn/2AaT7r8JcK0f1XqoMVoEijD01ta4yUxy09ap6E7zatN7LN2r7TLvnqSr75dTWqnmQwhv70wGRWb1iAcIHSR8bgBO8=
Received: from BY1PR02MB1147.namprd02.prod.outlook.com (10.162.108.149) by
	BY1PR02MB1145.namprd02.prod.outlook.com (10.162.108.147) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.609.10; Fri, 30 Mar 2018 12:45:04 +0000
Received: from BY1PR02MB1147.namprd02.prod.outlook.com
	([fe80::481f:1634:57e5:8f41]) by
	BY1PR02MB1147.namprd02.prod.outlook.com
	([fe80::481f:1634:57e5:8f41%14]) with mapi id 15.20.0609.012;
	Fri, 30 Mar 2018 12:45:04 +0000
From: Cuero Bugot <cbugot@sierrawireless.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] uninative: add variables to the whitelist so
	that it does not re-triger recipe parsing
Thread-Index: AdO9TH9RHM3TjEkGRgOC2+RK0UYmKwALiVWAAIPGOEAAAAwkgAImFIdg
Date: Fri, 30 Mar 2018 12:45:04 +0000
Message-ID: <BY1PR02MB11478B00DEE78E80BF02468CA3A10@BY1PR02MB1147.namprd02.prod.outlook.com>
References: <CY1PR02MB115212269AF12AA9BC2963DBA3D40@CY1PR02MB1152.namprd02.prod.outlook.com>
In-Reply-To: <CY1PR02MB115212269AF12AA9BC2963DBA3D40@CY1PR02MB1152.namprd02.prod.outlook.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=cbugot@sierrawireless.com; 
x-originating-ip: [84.14.163.134]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY1PR02MB1145;
	7:x6on/I6dH5ZJyS+UI8GF6lSIGwO91qmhTpu2UW00eg0D1qtP++WDaTUVvB3NkEFZUC0CS1LyvYY/DPYEU4ub/Zb9KKs4/X9R74zkfm8IFGzlY8YH2E5mIZDm2TZO9wtm3xnC+q0LN+x/xJHytnQ9Do1Nk8ieLbh4aM0F0nT1cz7DdjaJfV0XmWgdh7lrozjvcO+8dOcRm2p5B10aj7OvZK3mkm6lkkZNU7tWuDAwIREK+CRSQF9pZyh/T43SQvuI
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: edfc82ab-52b2-4e72-abdd-08d5963c0f5e
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(7168020)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:BY1PR02MB1145; 
x-ms-traffictypediagnostic: BY1PR02MB1145:
x-microsoft-antispam-prvs: <BY1PR02MB1145BB99A400B03292544A85A3A10@BY1PR02MB1145.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231221)(944501327)(52105095)(10201501046)(3002001)(93006095)(93001095)(6055026)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123560045)(6072148)(201708071742011);
	SRVR:BY1PR02MB1145; BCL:0; PCL:0; RULEID:; SRVR:BY1PR02MB1145; 
x-forefront-prvs: 06274D1C43
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(396003)(366004)(39380400002)(39860400002)(376002)(199004)(189003)(68736007)(6436002)(66066001)(5640700003)(6916009)(3660700001)(478600001)(25786009)(6116002)(5250100002)(9686003)(53936002)(3846002)(476003)(3280700002)(2906002)(316002)(14454004)(86362001)(55016002)(2501003)(6246003)(229853002)(33656002)(446003)(6506007)(7696005)(76176011)(99286004)(97736004)(186003)(81156014)(8676002)(561944003)(8936002)(5660300001)(2900100001)(2351001)(105586002)(102836004)(55236004)(106356001)(53546011)(81166006)(74316002)(486005)(486005)(26005)(7736002)(305945005)(11346002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR02MB1145;
	H:BY1PR02MB1147.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: sierrawireless.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 5DfHUvvrPQrfhbdSOSqYosZKqoJxzNJdE3WxVnHwVfWFNMYLH7cehYpQiVw2CjUS/n49j+gSfvmTd55FBRdBm7fCx2Of/wG774WgQKFriXjw1cjzEngPRgnOdzC8GwIyKNB+QBRJw5zDnBCJW6GTr2yLjvGNObfl02pXQj8Llbn5yjJCFPuwXW7ujS7NQH2Mwk6Bzu0JS03xNlP0LHzxWPtPvfoaSLKJXaP1peBci1bFd2WFrzRxS8akyEZzQ0dsLy48JxXZB90tUUmq7nnM3W/BlzKq5Q1Vms1y2OWXnQ6Ln0Gayr7p18j6vhKBejcLS1cqaQqcw+wUPPsr2FgfJ/pINYvVPpWVv1RQ9+Z17jATW2Ztq+wEOzkn59jp6+6GnF6NPkUA9V/BbEwzf+Bx15gcci5UoQrzrTQfFda9WZ8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: sierrawireless.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edfc82ab-52b2-4e72-abdd-08d5963c0f5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2018 12:45:04.1141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 08059a4c-2486-43dd-89e3-3a747e0dcbe8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR02MB1145
Subject: Re: [PATCH] uninative: add variables to the whitelist so that it does not re-triger recipe parsing
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
X-List-Received-Date: Fri, 30 Mar 2018 15:17:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+ID4gPiBPbiBGcmksIE1hciAxNiwgMjAxOCBhdCAxMDozMSBBTSBDdWVybyBCdWdvdCA8bWFp
bHRvOmNidWdvdEBzaWVycmF3aXJlbGVzcy5jb20+IHdyb3RlOg0KPiA+ID4gV2hlbiB1bmluYXRp
dmUgaXMgYWN0aXZhdGVkIChwb2t5J3MgZGVmYXVsdCkgaW50ZXJuYWwgZGF0YXN0b3JlIA0KPiA+
ID4gdmFyaWFibGVzIGFyZSBtb2RpZmllZCAoTkFUSVZFTFNCU1RSSU5HIGFuZCBTU1RBVEVQT1NU
VU5QQUNLRlVOQ1MpIA0KPiA+ID4gdG8gZW5hYmxlIHVuaW5hdGl2ZSBzdXBwb3J0LiBUaGlzIGlz
IGhhcHBlbmluZyBhZnRlciBwYXJzaW5nIGlzIGRvbmUgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUg
YnVpbGQuIE9uIHRoZSBuZXh0IGJpdGJha2UgY2FsbCB0aGUgcmVjaXBlIHdvdWxkIGJlIHBhcnNl
ZCBpZiB0aGUgdHdvIHZhcmlhYmxlcyBhYm92ZSB3ZXJlIG5vdCBhZGRlZCB0byB0aGUgcGFyc2lu
ZyB3aGl0ZWxpc3QgQkJfSEFTSENPTkZJR19XSElURUxJU1QuDQo+ID4gPg0KPiA+ID4gVGhlIGZp
eCBpcyB0byBhZGQgdGhlc2UgdHdvIHZhcmlhYmxlcyB0byB0aGUgcmVjaXBlIHBhcnNpbmcgDQo+
ID4gPiB3aGl0ZWxpc3QgQkJfSEFTSENPTkZJR19XSElURUxJU1QsIHRoaXMgaXMgZG9uZSBhdCBy
ZWNpcGUgcGFyc2luZyB0aW1lLCBvbmx5IHdoZW4gdW5pbmF0aXZlLmJiY2xhc3MgaXMgdXNlZC4N
Cj4NCj4gPiBJdCBzZWVtcyB5b3UgaGF2ZSBhIGNhc2Ugd2hlcmUgZGF0YSBpcyBhbHJlYWR5IHBh
cnNlZCBhbmQgdGhlbiANCj4gPiB1bmluc3RpdmUgaXMgZW5hYmxlZCBhZnRlciB0aGlzIHRoZSBy
ZXBhcnNlIGlzIGhhcHBlbmluZy4gT3IgaXMgaXQgDQo+ID4gYWx3YXlzIGhhcHBlbmluZyB3aGVu
IHVuaW5hdGl2ZSBpcyBlbmFibGVkDQo+DQo+IEl0IGlzIGFsd2F5cyBoYXBwZW5pbmcgd2hlbiB1
bmluYXRpdmUgaXMgZW5hYmxlZCAod2hpY2ggaXMgcG9reSdzIGRlZmF1bHQpLiBUaGUgMiBmaXJz
dCB0aW1lcyB5b3UgYnVpbGQgeW91IHdpbGwgaGF2ZSBhIGZ1bGwgcmVjaXBlIHBhcnNpbmcuDQo+
IFRoZSByZWFzb24gaXMgdGhhdCB0aGUgZGF0YSBpcyBlZmZlY3RpdmVseSBtb2RpZmllZCBvbiBy
ZWNlcHRpb24gb2YgQnVpbGRTdGFydGVkIGV2ZW50IHRoYXQgaGFwcGVucyBhZnRlciB0aGUgcGFy
c2luZyBpcyBkb25lLiBOZXh0IHRpbWUgeW91IHJ1biBiaXRiYWtlLCB0aGUgZGF0YXN0b3JlIHNp
Z25hdHVyZSBpcyBkaWZmZXJlbnQgYW5kIHRodXMgcmV0cmlnZ2VyIGEgcmVjaXBlIGFwcnNpbmcu
DQoNCkFueXRoaW5nIEkgY291bGQgZG8gaGVscCBtYWtlIG1lcmdlLWluIHRoaXMgcHJvcG9zYWw/
DQoNClRoeCwNCkN1ZXJvDQo=

