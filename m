Return-Path: <Tom.Hochstein@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0146.outbound.protection.outlook.com [207.46.100.146])
	by mail.openembedded.org (Postfix) with ESMTP id D9DBD606A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 23:44:16 +0000 (UTC)
Received: from BN3PR03MB1415.namprd03.prod.outlook.com (10.163.34.22) by
	CY1PR0301MB0729.namprd03.prod.outlook.com (10.160.159.147) with
	Microsoft
	SMTP Server (TLS) id 15.1.355.16; Thu, 10 Dec 2015 23:44:14 +0000
Received: from BN3PR03MB1415.namprd03.prod.outlook.com ([10.163.34.22]) by
	BN3PR03MB1415.namprd03.prod.outlook.com ([10.163.34.22]) with mapi id
	15.01.0355.012; Thu, 10 Dec 2015 23:44:13 +0000
From: Tom Hochstein <Tom.Hochstein@freescale.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v2] weston-init: Use weston-launch for XWayland
Thread-Index: AQHRMPmALsSJbcFusk2hKGoDPOxxRp6/km0AgAVQISA=
Date: Thu, 10 Dec 2015 23:44:13 +0000
Message-ID: <BN3PR03MB1415A9FC4E4B3D1B7773F618E8E90@BN3PR03MB1415.namprd03.prod.outlook.com>
References: <1449001866-29286-1-git-send-email-tom.hochstein@freescale.com>
	<60070.10.252.17.232.1449008484.squirrel@linux.intel.com>
	<BN3PR03MB1415F09661073294ECA6D2A2E8090@BN3PR03MB1415.namprd03.prod.outlook.com>
	<CAP9ODKr8E+mYH3rY-XKLnaWMUr0r9bLQhfAmp9iru1vvYQ0MZg@mail.gmail.com>
	<56659548.8090509@linux.intel.com>
In-Reply-To: <56659548.8090509@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Tom.Hochstein@freescale.com; 
x-originating-ip: [24.206.70.76]
x-microsoft-exchange-diagnostics: 1; CY1PR0301MB0729;
	5:A0lxTWRNCIa90lbCO+PYo1U4btL1MSVgLIfyvxgYjt7E5XUPlK3FbxZpm/F0seuOY++YW6hlCc+99CwByqf9Dp4CNiO7qE7+hxLsY5GCmiJA580e0HHNCtFlcknbjjt6fA6shJpzFMautKvLbHZI5A==;
	24:XNf9JeHAhL0A+cESuszyCEtmhjucGXtbaE7TX5Elyp67Yn9ZMRI8fdFHnuc2SDYwDAdO2LolYTG1VyUbLe5COK2a2ZR53aSE1yvMxA0Y5Bo=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB0729;
x-microsoft-antispam-prvs: <CY1PR0301MB07299BD29CA71348E06F5347E8E90@CY1PR0301MB0729.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(101931422205132);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(8121501046)(5005006)(10201501046)(3002001);
	SRVR:CY1PR0301MB0729; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB0729; 
x-forefront-prvs: 078693968A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(13464003)(24454002)(377454003)(479174004)(199003)(189002)(2950100001)(5003600100002)(77096005)(15975445007)(110136002)(5001960100002)(97736004)(122556002)(76176999)(54356999)(50986999)(189998001)(74316001)(40100003)(2900100001)(92566002)(19580395003)(76576001)(19580405001)(5002640100001)(19300405004)(99286002)(33656002)(66066001)(101416001)(81156007)(5004730100002)(5008740100001)(102836003)(3846002)(586003)(86362001)(6116002)(105586002)(93886004)(87936001)(106116001)(106356001)(1220700001)(1096002)(10400500002)(562404015);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB0729;
	H:BN3PR03MB1415.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: freescale.com does not designate
	permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2015 23:44:13.4496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB0729
Cc: Sundararaj Prabhu <Prabhu.Sundararaj@freescale.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] weston-init: Use weston-launch for XWayland
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
X-List-Received-Date: Thu, 10 Dec 2015 23:44:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIEFsZXggYW5kIE90YXZpby4NCg0KSSdtIGhvcGVmdWwgdGhhdCBJJ3ZlIGZvdW5kIHRo
ZSBndWlkYW5jZSB3ZSBuZWVkIGZyb20gdGhlIFdlc3RvbiBtYW4gcGFnZToNCg0KaHR0cDovL21h
bnBhZ2VzLnVidW50dS5jb20vbWFucGFnZXMvc2F1Y3kvbWFuMS93ZXN0b24uMS5odG1sDQoNCklu
IHBhcnRpY3VsYXIsIHRoZSBFeGFtcGxlcyBzZWN0aW9uIGxvb2tzIGxpa2UgdGhpczoNCg0KRVhB
TVBMRVMNCiAgICAgICBMYXVuY2ggV2VzdG9uIHdpdGggdGhlIERSTSBiYWNrZW5kIG9uIGEgVlQN
CiAgICAgICAgICAgICAgd2VzdG9uLWxhdW5jaA0KDQogICAgICAgTGF1bmNoIFdlc3RvbiB3aXRo
IHRoZSBEUk0gYmFja2VuZCBhbmQgWFdheWxhbmQgc3VwcG9ydA0KICAgICAgICAgICAgICB3ZXN0
b24tbGF1bmNoIC0tIC0tbW9kdWxlcz14d2F5bGFuZC5zbw0KDQogICAgICAgTGF1bmNoIFdlc3Rv
biAod2F5bGFuZC0xKSBuZXN0ZWQgaW4gYW5vdGhlciBXZXN0b24gaW5zdGFuY2UgKHdheWxhbmQt
MCkNCiAgICAgICAgICAgICAgV0FZTEFORF9ESVNQTEFZPXdheWxhbmQtMCB3ZXN0b24gLVN3YXls
YW5kLTENCg0KICAgICAgIEZyb20gYW4gWCB0ZXJtaW5hbCwgbGF1bmNoIFdlc3RvbiB3aXRoIHRo
ZSB4MTEgYmFja2VuZA0KICAgICAgICAgICAgICB3ZXN0b24NCg0KWFdheWxhbmQgc3VwcG9ydCBp
cyBzcGVjaWZpZWQgaW4gd2VzdG9uLmluaSwgc28gdGhlIGZpcnN0IHR3byBleGFtcGxlcyBjb2xs
YXBzZSB0byBvbmUgY2FzZSBmb3IgdGhlIGluaXQgc2NyaXB0LiBUaGUgdGhpcmQgZXhhbXBsZSwg
bmVzdGVkIFdlc3RvbiwgaXMgc29tZXRoaW5nIHRoZSBpbml0IHNjcmlwdCBoYXMgbmV2ZXIgc3Vw
cG9ydGVkLCBzbyBJIHByb3Bvc2UgY29udGludWluZyB0byBub3Qgc3VwcG9ydCBpdC4gVGhlIGZv
dXJ0aCBjb25kaXRpb24gSSBwcm9wb3NlIHRvIHN1cHBvcnQgYnkgY2hlY2tpbmcgZm9yICRESVNQ
TEFZLiBTbyB5b3UgZW5kIHVwIHdpdGggc29tZXRoaW5nIGxpa2UgdGhpczoNCgkNCiAgICAgICAg
IyBUaGVyZSBhcmUgbXVsdGlwbGUgd2F5cyB0byBzdGFydCB3ZXN0b24uDQogICAgICAgIGlmIFsg
IiRXQVlMQU5EX0RJU1BMQVkiIF07IHRoZW4NCiAgICAgICAgICAgIGVjaG8gLWUgIlxhRXJyb3I6
IFdlc3RvbiBpcyBhbHJlYWR5IHJ1bm5pbmcuIg0KICAgICAgICAgICAgZWNobyAiVGhpcyBzY3Jp
cHQgZG9lcyBub3Qgc3VwcG9ydCBsYXVuY2hpbmcgV2VzdG9uIG5lc3RlZC4iDQogICAgICAgICAg
ICBleGl0IDENCiAgICAgICAgZWxzZSBpZiBbICIkRElTUExBWSIgXTsgdGhlbg0KICAgICAgICAg
ICAgZWNobyAiTGF1bmNoaW5nIFdlc3RvbiB3aXRoIHRoZSB4MTEgYmFja2VuZCINCiAgICAgICAg
ICAgIG9wZW52dCAtcyB3ZXN0b24gLS0gLS1sb2c9L3Zhci9sb2cvd2VzdG9uLmxvZyAkT1BUQVJH
Uw0KICAgICAgICBlbHNlDQogICAgICAgICAgICBlY2hvICJMYXVuY2hpbmcgV2VzdG9uIHdpdGgg
dGhlIERSTSBiYWNrZW5kIg0KICAgICAgICAgICAgZXhwb3J0IFhER19DT05GSUdfSE9NRT0vZXRj
DQogICAgICAgICAgICBvcGVudnQgLXYgLS0gd2VzdG9uLWxhdW5jaCAtLSAtLWxvZz0vdmFyL2xv
Zy93ZXN0b24ubG9nICRPUFRBUkdTDQogICAgICAgIGZpDQoNCkkgc3RpbGwgbmVlZCB0byB0ZXN0
IHRoaXMgKGFuZCBhcHBseSB0aGUgZGVzaWduIGluIHN5c3RlbWQpLCBidXQgSSB3YW50ZWQgeW91
ciBmZWVkYmFjayBvbiB0aGUgYXBwcm9hY2guDQoNClRvbQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogQWxleGFuZGVyIEthbmF2aW4gW21haWx0bzphbGV4YW5kZXIua2FuYXZp
bkBsaW51eC5pbnRlbC5jb21dIA0KU2VudDogTW9uZGF5LCBEZWNlbWJlciAwNywgMjAxNSA4OjE5
IEFNDQpUbzogSG9jaHN0ZWluIFRvbS1SNjA4NzQgPFRvbS5Ib2Noc3RlaW5AZnJlZXNjYWxlLmNv
bT4NCkNjOiBPdGF2aW8gU2FsdmFkb3IgPG90YXZpby5zYWx2YWRvckBvc3N5c3RlbXMuY29tLmJy
PjsgU3VuZGFyYXJhaiBQcmFiaHUtQjM2ODc2IDxQcmFiaHUuU3VuZGFyYXJhakBmcmVlc2NhbGUu
Y29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjJdIHdlc3Rvbi1pbml0OiBVc2Ugd2VzdG9uLWxhdW5jaCBm
b3IgWFdheWxhbmQNCg0KT24gMTIvMDcvMjAxNSAwNDoxMyBQTSwgT3RhdmlvIFNhbHZhZG9yIHdy
b3RlOg0KPj4gV2UncmUgd29uZGVyaW5nIGhvdyBiZXN0IHRvIGZpeCB0aGlzLg0KPj4NCj4+IFRo
ZSBXZXN0b24gd2Vic2l0ZSBzZWVtcyB0byBnaXZlIHRoZSBhbnN3ZXIgZm9yIGEgcnVuLXRpbWUg
c29sdXRpb24sIHdoaWNoIGlzIGJhc2ljYWxseSAnaWYgJERJU1BMQVkgaXMgc2V0IHVzZSB3ZXN0
b24sIG90aGVyd2lzZSB1c2Ugd2VzdG9uLWxhdW5jaCcuDQo+Pg0KPj4gaHR0cDovL3dheWxhbmQu
ZnJlZWRlc2t0b3Aub3JnL2J1aWxkaW5nLmh0bWwNCj4+DQo+PiBJcyB0aGF0IHRoZSByaWdodCBh
cHByb2FjaD8gQW5vdGhlciBwb3NzaWJpbGl0eSBpcyB0byBtYWtlIGl0IGEgYnVpbGQtdGltZSBz
b2x1dGlvbiB3aGVyZSB0aGUgYnNwIGxheWVyIHNldHMgYSB2YXJpYWJsZSBjb250cm9sbGluZyB0
aGUgc2VsZWN0aW9uLg0KPg0KPiBSdW50aW1lIGlzIGFsd2F5cyBiZXR0ZXIsIHdoZW4gcG9zc2li
bGUuDQoNCkkgZ3Vlc3MgeW91IG5lZWQgdG8gZGlnIGRlZXBlciBpbnRvIHdoYXQgd2VzdG9uLWxh
dW5jaCBhY3R1YWxseSBkb2VzLCBhbmQgd2hpY2ggYXJlIHRoZSBzY2VuYXJpb3Mgd2hlbiBpdCBz
aG91bGQgYmUgdXNlZDsgdGhlIGRvY3VtZW50YXRpb24gaXNuJ3QgcGFydGljdWxhcmx5IGhlbHBm
dWwgaGVyZSwgc28gbWF5YmUgeW91IG5lZWQgdG8gYXNrIHRoZSB1cHN0cmVhbSBkZXZlbG9wZXJz
Lg0KDQpBbHNvLCB3aGF0ZXZlciBmaXggeW91IGNvbWUgdXAgd2l0aCwgaXQgc2hvdWxkIGFsc28g
YmUgcHJvdmlkZWQgZm9yIHRoZSBzaXR1YXRpb24gd2hlbiBhIG5hdGl2ZSBzeXN0ZW1kIHVuaXQg
ZmlsZSBpcyB1c2VkIGluc3RlYWQgb2YgdGhlIGluaXQgc2NyaXB0IChhIHBhdGNoIGZvciB0aGF0
IGhhcyBiZWVuIHBvc3RlZCBoZXJlLCBhbmQgc2hvdWxkIHNob3cgdXAgaW4gbWFzdGVyIHNob3J0
bHkpLg0KDQpBbGV4DQoNCg==

