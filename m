Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 8170 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 Mar 2018 10:27:16 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0052.outbound.protection.outlook.com [104.47.32.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1261B6FFC7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=TBnD/dMAe7ibMATcL90p34645KxzulXTZ69hz8St4hs=;
	b=lL4KgZO0JBQDZXtgBlLhp+PhZ3P3XI63ZNl3AhICjOs3+XT1BCChRChCVcl4+R441Yk9HS2L1wPSjDYlE687eTpU3YUNXTZomCxsobu+qKz2a8OjMQp2nYgj75KAzc60bC4nVMSSfgQU7zKOJwf6/voV1zZuk+r82xolamMnyoQ=
Received: from BY2PR02MB347.namprd02.prod.outlook.com (10.141.140.149) by
	BY2PR02MB139.namprd02.prod.outlook.com (10.242.45.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.548.13; Thu, 8 Mar 2018 07:55:39 +0000
Received: from BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) by
	BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) with mapi id
	15.20.0527.025; Thu, 8 Mar 2018 07:55:37 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: =?utf-8?B?TWFydGluIEh1bmRlYsO4bGw=?= <mnhu@prevas.dk>, Vineeth Karumanchi
	<VINEETHC@xilinx.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] kernel-fitimage.bbclass: Deploy fitImage
	without Initramfs
Thread-Index: AQHTtq60WmtNsb0gBE+vq6rkOlteyaPF93NQ
Date: Thu, 8 Mar 2018 07:55:37 +0000
Message-ID: <BY2PR02MB3479774AF4664F30E76058DB9DF0@BY2PR02MB347.namprd02.prod.outlook.com>
References: <1520433689-6357-1-git-send-email-vineethchowz.chowdary@xilinx.com>
	<2b8a0c5f-3787-23ac-d371-56c805064949@prevas.dk>
In-Reply-To: <2b8a0c5f-3787-23ac-d371-56c805064949@prevas.dk>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [73.231.161.32]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2PR02MB139;
	7:ycNeu4+KBrpXs9IScqpxviQbhelhFNXo97TL5biy+XKtNDx0U/jJBU8Ma7R9arcpU1Ahc1fPNSQQpTMfJ07wwGJSz2ZfMI+Ca165ARXLOj3Y4SldChTjLDgWMOiOXC1J9exAJuEjIEkuy4wdiX8A9jnWP2uSnc9VB3sSuarx6c6U7bRSHstFbrqGUvQQNz85M6rgYvPdFx/InKj7fzYee44o5teSNAyeXzJzC8dtWx7xwVK6x0Jsa/WUOXYFHBJd
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(39860400002)(39380400002)(376002)(346002)(366004)(396003)(189003)(377424004)(199004)(13464003)(6506007)(33656002)(53546011)(106356001)(186003)(2501003)(7736002)(305945005)(8936002)(478600001)(81156014)(26005)(81166006)(74316002)(77096007)(66066001)(8676002)(102836004)(3280700002)(55016002)(9686003)(53936002)(3846002)(3660700001)(229853002)(6246003)(6116002)(6436002)(5660300001)(105586002)(86362001)(97736004)(316002)(2906002)(76176011)(110136005)(7696005)(68736007)(2950100002)(25786009)(72206003)(2900100001)(99286004)(14454004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB139;
	H:BY2PR02MB347.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f24a3c33-077d-45a0-4a59-08d584c9fb07
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:BY2PR02MB139; 
x-ms-traffictypediagnostic: BY2PR02MB139:
x-microsoft-antispam-prvs: <BY2PR02MB1392D498F9944DC4F932923B9DF0@BY2PR02MB139.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249)(192813158149592);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040501)(2401047)(8121501046)(5005006)(3002001)(3231220)(944501244)(52105095)(93006095)(93001095)(10201501046)(6055026)(6041288)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:BY2PR02MB139; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB139; 
x-forefront-prvs: 060503E79B
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: Nv0BXhFa0KP2+eLfHDBBvFhRFl9NwHkmWet7APs4/U4YqbBHqtrVZpEf8eE2R/cLUKwwGn+mL8rhFQe5tfkgQmdKzRDWayiPRWLUNkfktWlS7BExnAD4FucHgxSt+ol10tJ0Dwmg14ITNWXz09fGPMwwcb6Ab7YRh5rDDEdYTjX/9YyDfy06pgYm3/mHdCk4ugirAvnFm4jPcjEKUxZ8jkY4SwrAOGJ83aBuSheZeGHcOXetHyJeONj5iLmAyxnPHv9Ofct1biXeMXoduPEJG8YIo7VNg3wc5n/JB1bTKyX1HN/JfEK62wXnQRSnFGcXnQa4O+YHkQ3XuAzAVjZxUQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f24a3c33-077d-45a0-4a59-08d584c9fb07
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2018 07:55:37.6082 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB139
Subject: Re: [PATCH] kernel-fitimage.bbclass: Deploy fitImage without Initramfs
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
X-List-Received-Date: Thu, 08 Mar 2018 10:27:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTWFydGluLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hcnRp
biBIdW5kZWLDuGxsIFttYWlsdG86bW5odUBwcmV2YXMuZGtdDQo+IFNlbnQ6IFdlZG5lc2RheSwg
TWFyY2ggMDcsIDIwMTggMTE6MjYgUE0NCj4gVG86IFZpbmVldGggS2FydW1hbmNoaSA8VklORUVU
SENAeGlsaW54LmNvbT47IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnOyBNYW5qdWt1bWFyIEhhcnRoaWtvdGUgTWF0aGENCj4gPE1BTkpVS1VNQHhpbGlueC5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBrZXJuZWwtZml0aW1hZ2UuYmJjbGFz
czogRGVwbG95IGZpdEltYWdlIHdpdGhvdXQNCj4gSW5pdHJhbWZzDQo+IA0KPiBIaSBWaW5lZXRo
LA0KPiANCj4gT24gMjAxOC0wMy0wNyAxNTo0MSwgVmluZWV0aCBDaG93ZGFyeSBLYXJ1bWFuY2hp
IHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggZGVwbG95cyBmaXRJbWFnZSAobGludXguYmluICsgZHRi
ICkuDQo+ID4gVGhlIHVzZSBjYXNlIGlzIHRvIGhhdmUgMiBwYXJ0aW9uZWQgc2QgY2FyZCwgd2l0
aCBGQVQgcGFydGl0aW9uIGhhdmluZw0KPiA+IGJvb3Rsb2FkZXIgKyBmaXRJbWFnZSBhbmQNCj4g
PiBleHQ0IHBhcnRpb24gaGF2aW5nIHJvb3Rmcy4NCj4gPg0KPiA+IFNpZ25lbi1vZmYtYnk6IFZp
bmVldGggQ2hvd2RhcnkgS2FydW1hbmNoaQ0KPiA+IDx2aW5lZXRoY2hvd3ouY2hvd2RhcnlAeGls
aW54LmNvbT4NCj4gPiAtLS0NCj4gPiAgIG1ldGEvY2xhc3Nlcy9rZXJuZWwtZml0aW1hZ2UuYmJj
bGFzcyB8IDUgKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMva2VybmVsLWZpdGltYWdlLmJiY2xhc3MN
Cj4gPiBiL21ldGEvY2xhc3Nlcy9rZXJuZWwtZml0aW1hZ2UuYmJjbGFzcw0KPiA+IGluZGV4IDUw
YTkxZTEuLjI1ODg0ZDUgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9jbGFzc2VzL2tlcm5lbC1maXRp
bWFnZS5iYmNsYXNzDQo+ID4gKysrIGIvbWV0YS9jbGFzc2VzL2tlcm5lbC1maXRpbWFnZS5iYmNs
YXNzDQo+ID4gQEAgLTQ2NCw2ICs0NjQsMTAgQEAga2VybmVsX2RvX2RlcGxveV9hcHBlbmQoKSB7
DQo+ID4gICAgICAgICAgICAgICAgICBsaW51eF9iaW5fYmFzZV9uYW1lPSJmaXRJbWFnZS1saW51
eC5iaW4tJHtQVn0tJHtQUn0tJHtNQUNISU5FfS0NCj4gJHtEQVRFVElNRX0iDQo+ID4gICAgICAg
ICAgICAgICAgICBsaW51eF9iaW5fc3ltbGlua19uYW1lPWZpdEltYWdlLWxpbnV4LmJpbi0ke01B
Q0hJTkV9DQo+ID4gICAgICAgICAgICAgICAgICBpbnN0YWxsIC1tIDA2NDQgbGludXguYmluDQo+
ID4gJHtERVBMT1lESVJ9LyR7bGludXhfYmluX2Jhc2VfbmFtZX0uYmluDQo+ID4gKyAgICAgICAg
ICAgICAgIGZpdGltYWdlX2Jhc2VfbmFtZT0iZml0SW1hZ2UtJHtQVn0tJHtQUn0tJHtNQUNISU5F
fS0NCj4gJHtEQVRFVElNRX0iDQo+ID4gKyAgICAgICAgICAgICAgIGZpdGltYWdlX3N5bWxpbmtf
bmFtZT1maXRJbWFnZS0ke01BQ0hJTkV9DQo+ID4gKyAgICAgICAgICAgICAgIGluc3RhbGwgLW0g
MDY0NCBhcmNoLyR7QVJDSH0vYm9vdC9maXRJbWFnZQ0KPiA+ICsgJHtERVBMT1lESVJ9LyR7Zml0
aW1hZ2VfYmFzZV9uYW1lfS5iaW4NCj4gPiArDQo+IA0KPiBJc24ndCB0aGlzIGFscmVhZHkgaGFu
ZGxlZCBieSB0aGUgImxpbnV4X2Jpbl9iYXNlX25hbWUiIHZhcmlhYmxlIGp1c3QgYWJvdmUgKGku
ZS4NCj4gZml0SW1haGUtbGludXguYmluLSR7TUFDSElORX0pLiBJIGhhdmUgdmFyaW91cyBmaXRp
bWFnZXMsIGFuZCBhcyBmYXIgYXMgSSByZWNhbGwsIGENCj4gbm9uLWluaXRyYW1mcyBmaXRpbWFn
ZSBpcyBhbHJlYWR5IGRlcGxveWVkLg0KPiANClRoaXMgcGF0Y2ggc2VlbXMgdG8gZG8gdGhlIHJp
Z2h0IHRoaW5nLg0KDQpsaW51eC5iaW4gaXMgYmVpbmcgY29waWVkIGFzIGZpdEltYWdlLWxpbnV4
LmJpbi0ke01BQ0hJTkV9ICwgYW5kIEkgdGhpbmsgaXQgaXMgaW5jb3JyZWN0Lg0KSXQgc2hvdWxk
IGJlIGZpdEltYWdlLCB3aGljaCBpcyBnZW5lcmF0ZWQgaW4gZG9fYXNzZW1ibGVfZml0aW1hZ2UN
Cg0KSWYgeW91IGxvb2sgYXQgaW5pdHJhbWZzIGNhc2U6DQppbnN0YWxsIC1tIDA2NDQgYXJjaC8k
e0FSQ0h9L2Jvb3QvZml0SW1hZ2UtJHtJTklUUkFNRlNfSU1BR0V9ICR7REVQTE9ZRElSfS8ke2Zp
dF9pbml0cmFtZnNfYmFzZV9uYW1lfS5iaW4gd2hpY2ggaXMgY29ycmVjdA0KDQpUaGFua3MsDQpN
YW5qdQ0KDQo=

