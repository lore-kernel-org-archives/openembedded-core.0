Return-Path: <tom.hochstein@nxp.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0081.outbound.protection.outlook.com [157.55.234.81])
	by mail.openembedded.org (Postfix) with ESMTP id BAEAB731F3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 20:24:04 +0000 (UTC)
Received: from AMSPR04MB309.eurprd04.prod.outlook.com (10.242.107.15) by
	VI1PR0401MB1822.eurprd04.prod.outlook.com (10.165.235.12) with
	Microsoft SMTP
	Server (TLS) id 15.1.365.19; Fri, 8 Jan 2016 20:24:04 +0000
Received: from AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) by
	AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) with mapi id
	15.01.0361.006; Fri, 8 Jan 2016 20:24:03 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Prabhu Sundararaj
	<prabhu.sundararaj@nxp.com>
Thread-Topic: [OE-core] [<OE-core][PATCH v2 1/4] weston-init: Handle Weston
	startup correctly.
Thread-Index: AQHRPWoZd5NzVhHUf0qXIhCIICsIxZ7wXkyw
Date: Fri, 8 Jan 2016 20:24:03 +0000
Message-ID: <AMSPR04MB3099B953E49163966003598E2F60@AMSPR04MB309.eurprd04.prod.outlook.com>
References: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
	<CAP9ODKryNw_GeZ7_87+geio0H54_GMuJ0fFkXvHfFVezqGGbEg@mail.gmail.com>
	<BLUPR03MB1411A316AD75000948872FC9E8E10@BLUPR03MB1411.namprd03.prod.outlook.com>
	<CAP9ODKpDTaDRndcdMYygHqO60fh5NU9uxyw-193rm=mtFdLyrw@mail.gmail.com>
	<BLUPR03MB1411453A7700F557F173C5ABE8E20@BLUPR03MB1411.namprd03.prod.outlook.com>
	<CAP9ODKqoROWExozvMQ6KRekgDLX_AHvy4+7yDwXKGOVJ0onjqw@mail.gmail.com>
In-Reply-To: <CAP9ODKqoROWExozvMQ6KRekgDLX_AHvy4+7yDwXKGOVJ0onjqw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
x-originating-ip: [192.88.168.49]
x-microsoft-exchange-diagnostics: 1; VI1PR0401MB1822;
	5:OR9fONGUmRJS/QYOIOpN3UyGo08hW41HWEiEYeyQ9VzJwbB7IjXguzKIvLAIG9nrvAMxgUBgJJpBZt1ZMIWApQt32/WcF2s2xOfZ31Bncz919xFyolwjiIDAjYPb26SxofxzbdBp/fB/7P3+Zd8p9w==;
	24:App5Kd+kEs/d2qz7+991o94mFYgo4Asdr4Pe+rSOpzrxMgt31MixfNiPBmZuWCy3KcS6dANs5d9gWuuNJPlQ778jhdRHW9WWSLjtEmgE9xs=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:VI1PR0401MB1822;
x-ms-office365-filtering-correlation-id: 89241b21-0e82-4826-b9a5-08d31869a6dd
x-microsoft-antispam-prvs: <VI1PR0401MB1822D38055DD1A0FCF698AFEE2F60@VI1PR0401MB1822.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(101931422205132);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:VI1PR0401MB1822; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0401MB1822; 
x-forefront-prvs: 0815F8251E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(199003)(377454003)(189002)(13464003)(24454002)(51444003)(74316001)(4326007)(19580405001)(93886004)(5001960100002)(19580395003)(2900100001)(92566002)(189998001)(122556002)(87936001)(97736004)(81156007)(15975445007)(77096005)(2950100001)(5001770100001)(586003)(40100003)(5004730100002)(66066001)(1220700001)(3846002)(6116002)(102836003)(2906002)(1096002)(76176999)(54356999)(50986999)(5008740100001)(5003600100002)(5002640100001)(16601075003)(76576001)(10400500002)(561944003)(106356001)(105586002)(101416001)(106116001)(86362001)(33656002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0401MB1822;
	H:AMSPR04MB309.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2016 20:24:03.5022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB1822
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [<OE-core][PATCH v2 1/4] weston-init: Handle Weston startup correctly.
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
X-List-Received-Date: Fri, 08 Jan 2016 20:24:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgT3RhdmlvLA0KDQpJJ20gc3RpbGwgbm90IGNsZWFyIG9uIHlvdXIgcHJvcG9zYWwuIEhlcmUg
aXMgbXkgbGFzdCBwcm9wb3NlZCB3ZXN0b24tc3RhcnQgc2NyaXB0IChjYWxsZWQgZnJvbSBzeXN2
aW5pdCBhbmQgc3lzdGVtZCk6DQoNCiMhIC9iaW4vc2gNCiMgVGhlcmUgYXJlIG11bHRpcGxlIHdh
eXMgdG8gc3RhcnQgd2VzdG9uLg0KaWYgWyAiJFdBWUxBTkRfRElTUExBWSIgXTsgdGhlbg0KICAg
IGVjaG8gLWUgIlxhRXJyb3I6IFdlc3RvbiBpcyBhbHJlYWR5IHJ1bm5pbmcuIg0KICAgIGVjaG8g
IlRoaXMgc2NyaXB0IGRvZXMgbm90IHN1cHBvcnQgbGF1bmNoaW5nIFdlc3RvbiBuZXN0ZWQuIg0K
ICAgIGV4aXQgMQ0KZWxzZQ0KICAgIGlmIFsgIiRESVNQTEFZIiBdOyB0aGVuDQogICAgICAgIGVj
aG8gIkxhdW5jaGluZyBXZXN0b24iDQogICAgICAgIG9wZW52dCAtcyAtLSBzaCAtYyAid2VzdG9u
IC0tICRPUFRBUkdTID4gL3Zhci9sb2cvd2VzdG9uLmxvZyAyPiYxIg0KICAgIGVsc2UNCiAgICAg
ICAgZWNobyAiTGF1bmNoaW5nIFdlc3RvbiINCiAgICAgICAgZXhwb3J0IFhER19DT05GSUdfSE9N
RT0vZXRjDQogICAgICAgIGlmIFsgLWYgL3Vzci9saWIvd2VzdG9uL3h3YXlsYW5kLnNvIF07IHRo
ZW4NCiAgICAgICAgICAgIG1rZGlyIC1wIC90bXAvLlgxMS11bml4DQogICAgICAgICAgICBPUFRB
UkdTPSItLW1vZHVsZXM9eHdheWxhbmQuc28gJE9QVEFSR1MiDQogICAgICAgIGZpDQogICAgICAg
IG9wZW52dCAkT1BFTlZUX0FSR1MgLS0gc2ggLWMgIndlc3Rvbi1sYXVuY2ggLS0gJE9QVEFSR1Mg
PiAvdmFyL2xvZy93ZXN0b24ubG9nIDI+JjEiDQogICAgZmkNCmZpDQoNCkRvIHlvdSB3YW50IHRv
IG1vdmUgdGhpcyB3aG9sZSBzY3JpcHQgdG8gd2VzdG9uLWxhdW5jaD8gSSB0aGluayB0aGF0IGRv
ZXNuJ3QgbWFrZSBzZW5zZSBiZWNhdXNlIGl0IHdvdWxkIHVuZXhwZWN0ZWRseSBjaGFuZ2UgdGhl
IGZ1bmRhbWVudGFsIGJlaGF2aW9yIG9mIHdlc3Rvbi1sYXVuY2ggZm9yIHRoZSB1c2VyLg0KDQpP
ciBkbyB5b3Ugd2FudCB0byBrZWVwIHdlc3Rvbi1zdGFydCBhbmQganVzdCBtb3ZlIHRoZSB3ZXN0
b24tbGF1bmNoIHBvcnRpb24gb2YgdGhlIHNjcmlwdCAodGhlIGxhc3QgZWxzZS1zdGF0ZW1lbnQp
IHRvIHRoZSBuZXcgd2VzdG9uLWxhdW5jaCBzY3JpcHQsIHNvbWV0aGluZyBsaWtlIHRoaXM6DQoN
CiMhIC9iaW4vc2gNCmV4cG9ydCBYREdfQ09ORklHX0hPTUU9L2V0Yw0KaWYgWyAtZiAvdXNyL2xp
Yi93ZXN0b24veHdheWxhbmQuc28gXTsgdGhlbg0KICAgIG1rZGlyIC1wIC90bXAvLlgxMS11bml4
DQogICAgTU9EVUxFUz0iLS1tb2R1bGVzPXh3YXlsYW5kLnNvIg0KICAgIE9QVEFSR1M9IiRNT0RV
TEVTICRPUFRBUkdTIg0KZmkNCmlmIFsgJFVTRV9PUEVOVlQgXTsgdGhlbg0KICAgIG9wZW52dCAk
T1BFTlZUX0FSR1MgLS0gc2ggLWMgIi91c3IvYmluL3dlc3Rvbi13cmFwcGVkL3dlc3Rvbi1sYXVu
Y2ggLS0gJE9QVEFSR1MgPiAvdmFyL2xvZy93ZXN0b24ubG9nIDI+JjEiDQplbHNlDQogICAgL3Vz
ci9iaW4vd2VzdG9uLXdyYXBwZWQvd2VzdG9uLWxhdW5jaCAiJEAiDQpGaQ0KDQpSZWdhcmRpbmcg
eW91ciBpZGVhIGZvciB0aGUgc2VwYXJhdGUgeHdheWxhbmQgc2NyaXB0IGZpbGUsIHRoZXJlIGlz
IGEgdXNhZ2UgcHJvYmxlbSBpZiB0aGUgdXNlciB3YW50cyB0byBjaGFuZ2UgaGlzIGRlcGxveWVk
IGltYWdlIGZyb20gV2F5bGFuZCB0byBYV2F5bGFuZC4gU2luY2UgdGhlIHNjcmlwdCBmaWxlIGlz
IG5vdCB0aGVyZSwgaXQgaXMgaGFyZCB0byBrbm93IHRoZSBhcHByb3ByaWF0ZSBzZXR0aW5ncyBm
b3IgdGhpcyByZWNvbmZpZ3VyYXRpb24uDQoNCkluc3RlYWQsIEkgcHJvcG9zZSB0byBhZGQgYSBu
ZXcgdmFyaWFibGUgaW4gdGhlIHNjcmlwdCBjYWxsZWQgJ1VTRV9YV0FZTEFORCcsIHRvIGJlIGlu
aXRpYWxpemVkIGJ5IFlvY3RvIGJhc2VkIG9uIHVzZXIgcHJlZmVyZW5jZSwgYW5kIGVhc2lseSBj
aGFuZ2VkIGFmdGVyIGRlcGxveW1lbnQ6DQoNCiMhIC9iaW4vc2gNClVTRV9YV0FZTEFORD0iMSIN
CmlmIFsgJFVTRV9YV0FZTEFORCA9ICIxIiBdOyB0aGVuDQogICAgbWtkaXIgLXAgL3RtcC8uWDEx
LXVuaXgNCiAgICBNT0RVTEVTPSItLW1vZHVsZXM9eHdheWxhbmQuc28iDQogICAgT1BUQVJHUz0i
JE1PRFVMRVMgJE9QVEFSR1MiDQpGaQ0KDQpEbyB5b3UgdGhpbmsgSSBzaG91bGQgcHVyc3VlIHlv
dXIgcHJvcG9zZWQgaWRlYSBvZiBhIG5ldyBpbWFnZSBvciBESVNUUk9fRkVBVFVSRSB0byBjb250
cm9sIHRoZSBpbml0aWFsIHN0YXRlIG9mIFVTRV9YV0FZTEFORD8NCg0KVG9tDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBPdGF2aW8gU2FsdmFkb3IgW21haWx0bzpvdGF2aW8u
c2FsdmFkb3JAb3NzeXN0ZW1zLmNvbS5icl0gDQpTZW50OiBNb25kYXksIERlY2VtYmVyIDIxLCAy
MDE1IDU6MjQgQU0NClRvOiBUaG9tYXMgSG9jaHN0ZWluIDxUb20uSG9jaHN0ZWluQGZyZWVzY2Fs
ZS5jb20+DQpDYzogUHJhYmh1IFN1bmRhcmFyYWogPFByYWJodS5TdW5kYXJhcmFqQGZyZWVzY2Fs
ZS5jb20+OyBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllciA8
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gWzxPRS1jb3JlXVtQQVRDSCB2MiAxLzRdIHdlc3Rvbi1pbml0OiBIYW5kbGUgV2Vz
dG9uIHN0YXJ0dXAgY29ycmVjdGx5Lg0KDQpIZWxsbyBUb20sDQoNCk9uIFNhdCwgRGVjIDE5LCAy
MDE1IGF0IDQ6MDggUE0sIFRvbSBIb2Noc3RlaW4gPFRvbS5Ib2Noc3RlaW5AZnJlZXNjYWxlLmNv
bT4gd3JvdGU6DQo+IENhbiB5b3UgYmUgbW9yZSBleHBsaWNpdCBhYm91dCB3aGF0IHlvdSBtZWFu
IGJ5IHdlc3Rvbi1sYXVuY2ggd3JhcHBlcj8gRG8geW91IHdhbnQgdG8gaGlkZSB0aGUgY3VycmVu
dCB3ZXN0b24tbGF1bmNoIGJpbmFyeSBhbmQgcmVwbGFjZSBpdCBieSBhIG5ldyB3ZXN0b24tbGF1
bmNoIHdyYXBwZXI/IFdoYXQgaGFwcGVucyB0byBteSBwcm9wb3NlZCB3ZXN0b24tc3RhcnQsIHdo
aWNoIGlzIGl0c2VsZiBhIHdyYXBwZXI/IERvZXMgaXRzIGZ1bmN0aW9uYWxpdHkgbW92ZSBpbnRv
IHdlc3Rvbi1sYXVuY2g/DQoNClllczsgbXkgcHJvcG9zYWwgaXMgdG8gdXNlIHdlc3Rvbi1sYXVu
Y2ggdG8gaGlkZSB0aGUgcmVhbCBiaW5hcnkgYW5kIGNhbGwgaXQgaW50ZXJuYWxseS4gVGhpcyBh
bGxvd3MgZm9yIGV2ZXJ5b25lIHVzaW5nIHdlc3Rvbi1sYXVuY2ggKGV2ZW4gb24gdGVybWluYWwg
b3Igc2VyaWFsIGNvbnNvbGUpIHRvIGJlbmVmaXQgZnJvbSBpdCBvdGhlcndpc2UgcGVvcGxlIHdp
bGwgYmUgYXdhcmUgb2YgdGhlIGN1c3RvbSBzY3JpcHQuDQoNCj4gQ2FuIHlvdSBoZWxwIG1lIHVu
ZGVyc3RhbmQgdGhlIHJhdGlvbmFsZSBmb3IgdGhlIGV4dHJhIFhXYXlsYW5kIHNjcmlwdD8gVGhl
IGV4aXN0aW5nIHdlc3RvbiByZWNpcGUgaW5zdGFsbHMgeHdheWxhbmQuc28gd2hlbiB0aGUgWFdh
eWxhbmQgcGFja2FnZSBpcyBzcGVjaWZpZWQuIEluIHlvdXIgcHJvcG9zYWwsIHRoZSB3ZXN0b24g
cmVjaXBlIHdvdWxkIGFsc28gaW5zdGFsbCB0aGUgZXh0cmEgc2NyaXB0IHdoZW4gdGhlIFhXYXls
YW5kIHBhY2thZ2UgaXMgc3BlY2lmaWVkLiBTaW5jZSB0aGUgc2FtZSBYV2F5bGFuZCBwYWNrYWdl
IG1lY2hhbmlzbSBpcyB1c2VkIGluIGJvdGggY2FzZXMsIHRoZSBiZW5lZml0IG9mIHRoZSBleHRy
YSBzY3JpcHQgaXNuJ3QgY2xlYXIgdG8gbWUuDQoNCkJlY2F1c2UgaXQgd291bGQgYWxsb3cgZm9y
IHNhbWUgZGlzdHJvIHRvIGdlbmVyYXRlIG9uZSBYV2F5bGFuZCBiYXNlZCBpbWFnZVsxXSBhbmQg
YW5vdGhlciBwdXJlIFdheWxhbmQgaW1hZ2VbMl0uDQoNCjEuIHhzZXJ2ZXIteG9yZy14d2F5bGFu
ZCAoYSkgLT4gd2VzdG9uLW1vZHVsZS14d2F5bGFuZCAoYikNCg0KICAgU28gKGEpIGluY2x1ZGVz
IHRoZSBpbm5lciBzY3JpcHQgd2hpY2ggc2F5cyB0byB3ZXN0b24tbGF1bmNoIHdyYXBwZXIgdG8g
bG9hZCB0aGUgeHdheWxhbmQuc28gbW9kdWxlLiAoYikgaXMgc3BsaXQgb3V0IGZyb20gbm9ybWFs
IHdlc3RvbiBwYWNrYWdlIHNvIGl0IGF2b2lkcyB1bm5lZWRlZCBydW50aW1lIGRlcGVuZGVuY2ll
cy4NCg0KMi4gd2VzdG9uDQoNCiAgd2VzdG9uIGluY2x1ZGVzIGp1c3QgdGhlIG5vcm1hbCB3ZXN0
b24gYml0cyBzbyBhbGxvd2luZyBwdXJlIFdlc3RvbiBpbWFnZXMgd2l0aG91dCBtYW51YWwgY2hh
bmdlcy4NCg0KLS0gDQpPdGF2aW8gU2FsdmFkb3IgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE8uUy4gU3lzdGVtcw0KaHR0cDovL3d3dy5vc3N5c3RlbXMuY29tLmJyICAgICAgICBodHRwOi8v
Y29kZS5vc3N5c3RlbXMuY29tLmJyDQpNb2JpbGU6ICs1NSAoNTMpIDk5ODEtNzg1NCAgICAgICAg
ICAgIE1vYmlsZTogKzEgKDM0NykgOTAzLTk3NTANCg0K

