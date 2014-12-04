Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bn0102.outbound.protection.outlook.com [157.56.110.102])
	by mail.openembedded.org (Postfix) with ESMTP id 936A4601F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 05:54:05 +0000 (UTC)
Received: from BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) by
	BY2PR03MB222.namprd03.prod.outlook.com (10.242.36.146) with Microsoft
	SMTP Server (TLS) id 15.1.26.15; Thu, 4 Dec 2014 05:54:04 +0000
Received: from BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) by
	BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) with Microsoft
	SMTP Server (TLS) id 15.1.26.15; Thu, 4 Dec 2014 05:54:01 +0000
Received: from BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) by
	BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) with mapi id
	15.01.0026.003; Thu, 4 Dec 2014 05:54:01 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH v2 2/2] u-boot.inc : add compile multiple
	u-boot feature
Thread-Index: AQHQDi12BooiIzFRiUmmnkhIHFa10Zx+8EaA
Date: Thu, 4 Dec 2014 05:54:00 +0000
Message-ID: <BY2PR03MB441142EAFF01BCE33C8218D84780@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1416806674-15725-1-git-send-email-B40290@freescale.com>
	<CAP9ODKpC_enxcMuq6GHQ-AaH+JTj4BOcJFyaPFkKW1xWUGeDsg@mail.gmail.com>
In-Reply-To: <CAP9ODKpC_enxcMuq6GHQ-AaH+JTj4BOcJFyaPFkKW1xWUGeDsg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.52]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB441;UriScan:;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB441;
x-forefront-prvs: 041517DFAB
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(13464003)(377454003)(24454002)(189002)(199003)(51704005)(54356999)(76176999)(54206007)(54606007)(110136001)(50986999)(62966003)(74316001)(68736005)(66066001)(64706001)(86362001)(20776003)(77096005)(33656002)(101416001)(15975445006)(107046002)(31966008)(95666004)(106356001)(99286002)(77156002)(105586002)(106116001)(15202345003)(122556002)(40100003)(16601075003)(76576001)(46102003)(92726001)(92566001)(4396001)(97736003)(21056001)(120916001)(87936001)(19580395003)(19580405001)(2656002)(99396003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB441;
	H:BY2PR03MB441.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB222;
X-OriginatorOrg: freescale.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] u-boot.inc : add compile multiple u-boot feature
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
X-List-Received-Date: Thu, 04 Dec 2014 05:54:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gT3RhdmlvIFNhbHZhZG9yLCAgICAgICAgICAgICAgICAgICAgICAgICAgDQoNClRoYW5r
IHlvdSBmb3IgeW91ciBjb21tZW50cy4NCkkgaGFkIHN1Ym1pdHRlZCAgcGF0Y2ggdjMgLg0KUGxl
YXNlICByZXZpZXcgIHRoZW0gLg0KDQpUaGFua3MNCkNodW5yb25nDQoNCg0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3RhdmlvLnNhbHZhZG9yQGdtYWlsLmNvbSBbbWFpbHRv
Om90YXZpby5zYWx2YWRvckBnbWFpbC5jb21dIE9uIEJlaGFsZiBPZiBPdGF2aW8gU2FsdmFkb3IN
ClNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDAyLCAyMDE0IDg6NDMgUE0NClRvOiBHdW8gQ2h1bnJv
bmctQjQwMjkwDQpDYzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUg
bGF5ZXINClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHYyIDIvMl0gdS1ib290LmluYyA6
IGFkZCBjb21waWxlIG11bHRpcGxlIHUtYm9vdCBmZWF0dXJlDQoNCkhlbGxvIENodW5yb25nLA0K
DQpPbiBNb24sIE5vdiAyNCwgMjAxNCBhdCAzOjI0IEFNLCBDaHVucm9uZyBHdW8gPEI0MDI5MEBm
cmVlc2NhbGUuY29tPiB3cm90ZToNCj4gU2lnbmVkLW9mZi1ieTogQ2h1bnJvbmcgR3VvIDxCNDAy
OTBAZnJlZXNjYWxlLmNvbT4NCj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJv
b3QuaW5jIHwgNTYgDQo+ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pDQo+DQo+
IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3QuaW5jIA0KPiBiL21l
dGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC5pbmMNCj4gaW5kZXggYzY5NWI3My4uYmQ3NjI0
MSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LmluYw0KPiAr
KysgYi9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3QuaW5jDQo+IEBAIC02MywyNSArNjMs
MzIgQEAgZG9fY29tcGlsZSAoKSB7DQo+ICAgICAgICAgICAgICAgICBlY2hvICR7VUJPT1RfTE9D
QUxWRVJTSU9OfSA+ICR7U30vLnNjbXZlcnNpb24NCj4gICAgICAgICBmaQ0KPg0KPiAtICAgICAg
IG9lX3J1bm1ha2UgJHtVQk9PVF9NQUNISU5FfQ0KPiAtICAgICAgIG9lX3J1bm1ha2UgJHtVQk9P
VF9NQUtFX1RBUkdFVH0NCj4gKyAgICBmb3IgdHlwZSBpbiAke1VCT09UX01BQ0hJTkV9OyBkbw0K
PiArICAgICAgICBvZV9ydW5tYWtlIE89JHt0eXBlfSAke3R5cGV9DQo+ICsgICAgICAgIG9lX3J1
bm1ha2UgTz0ke3R5cGV9ICR7VUJPT1RfTUFLRV9UQVJHRVR9DQo+ICsgICAgICAgIGNwICAke1N9
LyR7dHlwZX0vJHtVQk9PVF9CSU5BUll9ICAke1N9LyR7dHlwZX0vdS1ib290LSR7dHlwZX0uYmlu
DQo+ICsgICAgZG9uZQ0KPiArDQo+ICB9DQoNClRoZSBvdXQgb2YgdHJlZSBidWlsZCBoYXMgY2F1
c2VkIHNvbWUgaGVhZGFjaGUgaW4gb25lIG9mIG91ciBpbnRlcm5hbCBjdXN0b21lciBsYXllcnM7
IGl0IHdhcyBpbmRlZWQgY2F1c2VkIGJ5IGEgImJ1ZyIgaW4gdGhlIHJlc3BlY3RpdmUgcmVjaXBl
IGJ1dCBJIHRoaW5rIGl0IGlzIHdvcnRoIG1lbnRpb24gdGhhdCBpdCBub3cgYnVpbGRzIHVzaW5n
IG91dCBvZiB0cmVlIGluIHRoZSBjb21taXQgbG9nIHNvIHBlb3BsZSBhcmUgYXdhcmUuDQoNClRo
ZXJlIGFyZSB0d28gdGhpbmdzIHdoaWNoIGhhcyBjYXRjaCBteSBhdHRlbnRpb24gaGVyZToNCg0K
ICogZmlsZW5hbWUgdWdseW5lc3M6IHRoZSBmaWxlbmFtZSBpbiBkZXBsb3kgZGlyIGlzIHVzaW5n
IHRoZSBVQk9PVF9NQUNISU5FIGhvd2V2ZXIgdGhlIFVCT09UX0NPTkZJRyAnbmFtZScgd291bGQg
YmUgYmV0dGVyIGFzIGl0IGlzIG1vcmUgbWVhbmluZ2Z1bC4NCg0KICogZGlmZmljdWx0eSB0byBm
aWd1cmUgdGhlIGJpbmFyeSB3aGVuIGdlbmVyYXRpbmcgdGhlIHJvb3RmczogaW4gbWV0YS1mc2wt
YXJtLCBmb3IgZXhhbXBsZSwgd2UgZ2VuZXJhdGUgdGhlIC5zZGNhcmQgcm9vdGZzIGFuZCB1c2lu
ZyB0aGUgcGF0Y2ggd2Ugbm93IGhhdmUuLi4NCg0KRVJST1I6IEVycm9yOiBUaGUgaW1hZ2UgY3Jl
YXRpb24gc2NyaXB0DQonLi4uL3RtcC93b3JrL2lteDZxc2FicmVzZC1vZWwtbGludXgtZ251ZWFi
aS9jb3JlLWltYWdlLW1pbmltYWwvMS4wLXIwL3RlbXAvY3JlYXRlX2ltYWdlLnNkY2FyZCcNCnJl
dHVybmVkIDE6DQowKzAgcmVjb3JkcyBpbg0KMCswIHJlY29yZHMgb3V0DQowIGJ5dGVzICgwIEIp
IGNvcGllZCwgMS4zMzk1ZS0wNSBzLCAwLjAga0Ivcw0KTW9kZWw6ICAoZmlsZSkNCkRpc2sgLi4u
L3RtcC9kZXBsb3kvaW1hZ2VzL2lteDZxc2FicmVzZC9jb3JlLWltYWdlLW1pbmltYWwtaW14NnFz
YWJyZXNkLTIwMTQxMjAyMTIzNDM3LnJvb3Rmcy5zZGNhcmQ6DQo2Ny4xTUINClNlY3RvciBzaXpl
IChsb2dpY2FsL3BoeXNpY2FsKTogNTEyQi81MTJCIFBhcnRpdGlvbiBUYWJsZTogbXNkb3MgRGlz
ayBGbGFnczoNCg0KTnVtYmVyICBTdGFydCAgIEVuZCAgICAgU2l6ZSAgICBUeXBlICAgICBGaWxl
IHN5c3RlbSAgRmxhZ3MNCiAxICAgICAgNDE5NGtCICAxMi42TUIgIDgzODlrQiAgcHJpbWFyeSAg
ICAgICAgICAgICAgIGxiYQ0KIDIgICAgICAxMi42TUIgIDYyLjlNQiAgNTAuM01CICBwcmltYXJ5
DQoNCmRkOiBvcGVuaW5nIGAuLi4vdG1wL2RlcGxveS9pbWFnZXMvaW14NnFzYWJyZXNkL3UtYm9v
dC1pbXg2cXNhYnJlc2QuaW14JzoNCk5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCldBUk5JTkc6
IC4uLi90bXAvd29yay9pbXg2cXNhYnJlc2Qtb2VsLWxpbnV4LWdudWVhYmkvY29yZS1pbWFnZS1t
aW5pbWFsLzEuMC1yMC90ZW1wL2NyZWF0ZV9pbWFnZS5zZGNhcmQ6MQ0KZXhpdCAxIGZyb20NCiAg
ZGQgaWY9Li4uL3RtcC9kZXBsb3kvaW1hZ2VzL2lteDZxc2FicmVzZC91LWJvb3QtaW14NnFzYWJy
ZXNkLmlteA0Kb2Y9Li4uL3RtcC9kZXBsb3kvaW1hZ2VzL2lteDZxc2FicmVzZC9jb3JlLWltYWdl
LW1pbmltYWwtaW14NnFzYWJyZXNkLTIwMTQxMjAyMTIzNDM3LnJvb3Rmcy5zZGNhcmQNCmNvbnY9
bm90cnVuYyBzZWVrPTIgc2tpcD0wIGJzPTUxMg0KDQpFUlJPUjogRnVuY3Rpb24gZmFpbGVkOiBk
b19yb290ZnMNCkVSUk9SOiBMb2dmaWxlIG9mIGZhaWx1cmUgc3RvcmVkIGluOg0KLi4uL3RtcC93
b3JrL2lteDZxc2FicmVzZC1vZWwtbGludXgtZ251ZWFiaS9jb3JlLWltYWdlLW1pbmltYWwvMS4w
LXIwL3RlbXAvbG9nLmRvX3Jvb3Rmcy4zMTQxNQ0KRVJST1I6IFRhc2sgNyAoLi4uL3Bva3kvbWV0
YS9yZWNpcGVzLWNvcmUvaW1hZ2VzL2NvcmUtaW1hZ2UtbWluaW1hbC5iYiwNCmRvX3Jvb3Rmcykg
ZmFpbGVkIHdpdGggZXhpdCBjb2RlICcxJw0KDQpEbyB5b3UgaGF2ZSBhbnkgaWRlYSBob3cgd2Ug
Y291bGQgYWRkcmVzcyB0aG9zZSBpc3N1ZXM/DQoNCi0tIA0KT3RhdmlvIFNhbHZhZG9yICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBPLlMuIFN5c3RlbXMNCmh0dHA6Ly93d3cub3NzeXN0ZW1z
LmNvbS5iciAgICAgICAgaHR0cDovL2NvZGUub3NzeXN0ZW1zLmNvbS5icg0KTW9iaWxlOiArNTUg
KDUzKSA5OTgxLTc4NTQgICAgICAgICAgICBNb2JpbGU6ICsxICgzNDcpIDkwMy05NzUwDQo=

