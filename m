Return-Path: <Yong.Lee@johnsonoutdoors.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.203])
	by mail.openembedded.org (Postfix) with ESMTP id 4223860746
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 18:37:17 +0000 (UTC)
Received: from [216.82.242.36] by server-11.bemta-8.messagelabs.com id
	0C/71-01902-F588FE95; Tue, 24 Oct 2017 18:37:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VSe0hTcRTe79677SreuE7N40rLRWTC1AXBJKj
	oj+iPAguptNDu6rYt97B7VxoUrbIsR5QWlbM3aSKBWhNUstT+sOxFNszKHuIQ3HxCD8tm3bu7
	Xv9953znfOd8h0PiqlqFmmSLHSxnYywaRSTRN9+j0+YdH8/JmPq0TN//bUypP/bKjVZia1rc7
	5RrnjXWoiwsV262GezF2+Smjh9H5YUjScUTd64pnag5qQxFkgTtxmHSWYqLgYquwODx0/tyKe
	hE8OHkGSGIIBV0BjSfekqIOJZOhiMl07iIcToXKqr8oXwMnQJfhl8iqWYxDAUGMQmvhp8uX0i
	HoBfCTFOLUsQUvRX6AqUhHRXdikFDmVbEEfR6GHONhHoRPRu+dt/CpFnx8MZ3JYSBpuHG3ee4
	hONgeHBG0CeF+jw4XLVUSs+D9hMPFRJOhJ4rLiT6ArpTCb1n34d10qCpfBRJeB1UPzmES0WVC
	Epv1ocHpMJQyUy4YRn017eFVQvgxsQAJjV45TDcdVopEXOh3H0hrFSuAE9fRdhmAYx6g3LpXG
	p45z2BTqNU9z/u3IILXLhefWu6lE6Gs64BpTt0sGh4VOkjriKiDqXwLLeX5bRL9GkGzmw0Oay
	M2aLVZejTrCzPM0bWwhj4tO12620kfMpBmQw1o+maLZ0ogcQ0cVSWcTxHNctg37HPxPCmfG6P
	heU70VyS1ACVUCpw0RxrZIt3mi3Cu/2mgYzSxFKzhIdTUXwhY+XNRonqRpnkxbY3PzDS13s5i
	JFDlQEnriJsdhurjqcuiHq02GDaY/sj9/uBe1CiOoZCMplMFVXIclaz43/ej+JJpImhvKJKlN
	nm+DPVLyyECQslrhgRF3Iwfym1EzVy5T7DAqBownHOGsj3znEc6J9syO4a+dBwfXdWcpMzGpa
	n769JKttcjb1NDEBuS/Czvib7SNWmjl11ug5L48qP2fHfc2RFj9e+3nhJ3jrQXv/Aw2CDG3a0
	+Va1HdMuip2yTi482ZLrrxv8eS/ze9H0eDRTol9eaPGcP/8ieFBD8CZGl4pzPPMLKgQmDrsDA
	AA=
X-Env-Sender: Yong.Lee@johnsonoutdoors.com
X-Msg-Ref: server-8.tower-94.messagelabs.com!1508870238!186792127!1
X-Originating-IP: [216.32.180.49]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15808 invoked from network); 24 Oct 2017 18:37:18 -0000
Received: from mail-by2nam03lp0049.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) (216.32.180.49)
	by server-8.tower-94.messagelabs.com with AES256-SHA256 encrypted SMTP;
	24 Oct 2017 18:37:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=johnsonoutdoorsinc.onmicrosoft.com; s=selector1-johnsonoutdoors-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=YuRZ7zptWhjir/hnjW0w8V6Y8HVMgeiI50clNG1rP5s=;
	b=ngJ8izcm9wSAUGakyLGGZ2qB8meFoM4CReYG/sLBnjL5unJub5ppfASeRGHnGbkFeagrm4XSzt3Qm2mrZf02fhx9RKXjQWow/iXdouK5PodT+QDw0u7XqMlqpu7AT3yZot7lqok5923X86YHcI+RK1OjOpxDci47EqqK/CeToXw=
Received: from SN1PR13MB0272.namprd13.prod.outlook.com (10.162.98.29) by
	SN1PR13MB0191.namprd13.prod.outlook.com (10.162.105.28) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.178.2; Tue, 24 Oct 2017 18:37:17 +0000
Received: from SN1PR13MB0272.namprd13.prod.outlook.com ([10.162.98.29]) by
	SN1PR13MB0272.namprd13.prod.outlook.com ([10.162.98.29]) with mapi id
	15.20.0178.003; Tue, 24 Oct 2017 18:37:17 +0000
From: "Lee, Yong" <Yong.Lee@johnsonoutdoors.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] GCC 4.9 and Morty
Thread-Index: AdNMzpQ2HTI1rJifRmC47v2zQhqE5AAFjESAAAHOKNAAAP5xAAABq48A
Date: Tue, 24 Oct 2017 18:37:17 +0000
Message-ID: <SN1PR13MB02724610FD9D9566559C56CA92470@SN1PR13MB0272.namprd13.prod.outlook.com>
References: <SN1PR13MB027295287B467702CA7967E692470@SN1PR13MB0272.namprd13.prod.outlook.com>
	<CAMKF1sokNFnWVOuOTu31VJQ=Y-cjNON_cO9Ch1Ca8YfeVrNSiw@mail.gmail.com>
	<SN1PR13MB02720FA5FB44DB41FCBD8EE792470@SN1PR13MB0272.namprd13.prod.outlook.com>
	<CAMKF1soogaY_w=yHc722fN7CtXJ3bSzb0kh_3S1ej5h_aUybbA@mail.gmail.com>
In-Reply-To: <CAMKF1soogaY_w=yHc722fN7CtXJ3bSzb0kh_3S1ej5h_aUybbA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [12.48.212.2]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN1PR13MB0191;
	6:yDt5EFFOiZWUE6PU9l6HkVSxqZc5uUG/mXY3CnWkt13+Y+a5ef3XJ+E43CQS7s6Mv0djFPRUOPq3/+gHjkqPPKOnDgCpv92YSUpFXa/6NYse6sT17VTltH/sKi81ePjw7+U3WGTpef4MmcdLXmvh3/Ja6zCHT5opIBjBBEf7o2MIEO/LfRQEEb9kXvvVHPBV1I+I98wqUF3jUpOIxlVTFiTECSA8KR9WBlxdhfZwnRiDNR3pJhY2NbiWzf2O7wuaWaGWrgIz6CGjPUCh15CV9q75idrkmoc0ivVi60kf5xf0RTt8OOeso5mg59itUILGAWv7zXDtNoIaVx46dOsgHAHYxFaqgAE+pywzdSz5Ddo=;
	5:AyX9uW+t7WadhDlr6F43NFVq10X+1ZYbdsNIDbuAaBGzLxxE46a8dj1uEjCgfh6xNOuu7oNFm+5pTdAMVshF3Wq/f/dcdVnr9s9WKClj4BwN1ebVjpQVMIdzYQFO6g8sySpNA01ZiAzRFwiOGQLG7OAFYPHlogsl7Ad83f5Q2aA=;
	24:GNMo+Vi9b+hYdQR5+RAdWPTkGm+b+12PYHlyvbfExYO+lfoigNSvYrBjdJv1vadudtj1rkQBF0DcA/6ei2GB+3CBL9Lil8DPMwFwsem8HEA=;
	7:oxJqsWuw2D8gtbvAv29x+Z3plo+zYwnpo5vSfEqNwIJ7gLhP8mH5HOIRpdBi4wuAaOs+upxBoRWuDzkGyGX5mG7LVLBW7FTi78naw965bLkukA3kfhUGeg/7Lq7AtUkCkjdoNUGHq4yBPixq1ySUbQCyEv7jKDS1k2eAvz5KgkmGlftZPbvKdtH0LYppwJyxz0TMxrdms2bC9SQG5UQ4x/VXGUeKDIfzahPq1BIkt3y7Prri4fdSNUx9wkavnFtk
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 51780690-a991-4910-c7ce-08d51b0e40c6
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603199);
	SRVR:SN1PR13MB0191; 
x-ms-traffictypediagnostic: SN1PR13MB0191:
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-microsoft-antispam-prvs: <SN1PR13MB0191E352772C8D710710B01992470@SN1PR13MB0191.namprd13.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231020)(100000703101)(100105400095)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123555025)(20161123562025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:SN1PR13MB0191; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:SN1PR13MB0191; 
x-forefront-prvs: 047001DADA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(346002)(39830400002)(376002)(189002)(199003)(24454002)(13464003)(6116002)(97736004)(53376002)(3280700002)(77096006)(5660300001)(86362001)(229853002)(6916009)(5890100001)(2906002)(2950100002)(66066001)(6506006)(4326008)(6246003)(53546010)(3660700001)(7696004)(39060400002)(33656002)(55016002)(966005)(6436002)(53936002)(9686003)(99286003)(6306002)(72206003)(93886005)(3846002)(50986999)(305945005)(74316002)(76176999)(54356999)(14454004)(478600001)(105586002)(8936002)(189998001)(102836003)(81166006)(7736002)(316002)(81156014)(2900100001)(25786009)(8676002)(106356001)(101416001)(68736007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR13MB0191;
	H:SN1PR13MB0272.namprd13.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: johnsonoutdoors.com does not
	designate permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: johnsonoutdoors.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51780690-a991-4910-c7ce-08d51b0e40c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2017 18:37:17.1804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 16ab962a-71e7-495f-a8ed-d682f863e008
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR13MB0191
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: GCC 4.9 and Morty
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
X-List-Received-Date: Tue, 24 Oct 2017 18:37:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmsgeW91Lg0KSSBzd2l0Y2hlZCB0byBpbnRlcm5hbCB0b29sY2hhaW4gYW5kIGJ1aWxkaW5n
IEdDQyA1LjQgKGluY2x1ZGVkIGluIG1ldGEpIGlzIGNvbXBsZXRlIGFuZCBpcyBvbnRvIGdsaWJj
Lg0KDQpJbiBzdW1tYXJ5LCBUSSBTREsgYXBwZWFycyB0byBiZSBicm9rZW4gYXMgdGhlIG5vbmUt
ZGVmYXVsdCBHQ0MgdmVyc2lvbiBpbmNsdWRlZCBpbiB0aGVpciBwYWNrYWdlIChpZS4gTGluYXJv
IDQuOSBhbmQgTGluYXJvIDUuMikgZmFpbHMgdG8gYnVpbGQuDQoNCkFkYW0NCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtoZW0gUmFqIFttYWlsdG86cmFqLmtoZW1AZ21haWwu
Y29tXSANClNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMjQsIDIwMTcgMTo0NiBQTQ0KVG86IExlZSwg
WW9uZyA8WW9uZy5MZWVAam9obnNvbm91dGRvb3JzLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIEdDQyA0Ljkg
YW5kIE1vcnR5DQoNCk9uIFR1ZSwgT2N0IDI0LCAyMDE3IGF0IDEwOjMzIEFNLCBMZWUsIFlvbmcg
PFlvbmcuTGVlQGpvaG5zb25vdXRkb29ycy5jb20+IHdyb3RlOg0KPiBUaGFua3MgUmFqIGZvciB0
aGUgaW5wdXQuIEF0dGFjaGVkIHRoZSBsb2dzLiBQbGVhc2UgdGFrZSBhIGxvb2suDQo+IFRoZSAu
ZGlmZiBmaWxlIGlzIGJhc2VkIG9uIHRoZSB0b29sY2hhaW4tbGluYXJvLmluYyBmaWxlIHNoaXBw
ZWQgd2l0aCBUSSdzIFNESyBbMV0uDQo+DQoNCllvdXIgY2hhbmdlcyBsb29rIGZpbmUuDQoNCj4g
SSB3aWxsIHRyeSB0byBjb25maWd1cmUgdGhlIFNESyB0byB1c2UgdGhlIGludGVybmFsIHRvb2xj
aGFpbiBhbmQgc2VlIGlmIEkgY2FuIGRlY291cGxlIG15c2VsZiBmcm9tIHRoZSBleHRlcm5hbCB0
b29sY2hhaW4gdG8gc2ltcGxpZnkgdGhpbmdzLg0KPg0KDQp5b3UgbWlnaHQgaGF2ZSB0byBidWcg
eW91ciBTREsgcHJvdmlkZXIgZm9yIGdjYyA0LjkgYnVpbGQgaXNzdWUNCg0KDQo+IEFkYW0NCj4N
Cj4gWzFdIA0KPiBodHRwOi8vYXJhZ28tcHJvamVjdC5vcmcvZ2l0Lz9wPW1ldGEtYXJhZ28uZ2l0
O2E9YmxvYjtmPW1ldGEtYXJhZ28tZGlzDQo+IHRyby9jb25mL2Rpc3Ryby9pbmNsdWRlL3Rvb2xj
aGFpbi1saW5hcm8uaW5jO2g9MjBhNjUxNzRmMjY5YzFlMWE1OTg0YzUNCj4gNDc2YTJhYjRlNWRm
YzQyYjU7aGI9cmVmcy9oZWFkcy9tb3J0eQ0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBLaGVtIFJhaiBbbWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbV0NCj4gU2VudDog
VHVlc2RheSwgT2N0b2JlciAyNCwgMjAxNyAxMjoyNiBQTQ0KPiBUbzogTGVlLCBZb25nIDxZb25n
LkxlZUBqb2huc29ub3V0ZG9vcnMuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIEdDQyA0LjkgYW5kIE1v
cnR5DQo+DQo+ICpFWFRFUk5BTCBFTUFJTCoNCj4NCj4NCj4gT24gVHVlLCBPY3QgMjQsIDIwMTcg
YXQgNjo1NiBBTSwgTGVlLCBZb25nIDxZb25nLkxlZUBqb2huc29ub3V0ZG9vcnMuY29tPiB3cm90
ZToNCj4+IEkgaGF2ZSBhIGJ1bmNoIG9mIGFwcHMgdGhhdCByZXF1aXJlIGFuIG9sZCB2ZXJzaW9u
IG9mIEdDQyAoNC45IG9yIGxlc3MpLg0KPj4NCj4+IFRoZXJlIGFyZSBhIGZldyB2ZXJzaW9ucyBv
ZiBHQ0MgYXZhaWxhYmxlIGluIG15IE1vcnR5IGJhc2VkIFNESy4NCj4+DQo+Pg0KPj4NCj4+IGJ1
aWxkQDZlMzU0MDhlOGZhNTp+L3Rpc2RrL2J1aWxkJCBiaXRiYWtlLWxheWVycyBzaG93LXJlY2lw
ZXMgZ2NjDQo+Pg0KPj4gV0FSTklORzogTm8gcmVjaXBlcyBhdmFpbGFibGUgZm9yOg0KPj4NCj4+
DQo+PiAvaG9tZS9idWlsZC90aXNkay9zb3VyY2VzL21ldGEtb3BlbmFtcC9yZWNpcGVzLWJzcC9k
ZXZpY2UtdHJlZS9kZXZpY2UNCj4+IC0NCj4+IHRyZWUtZ2VuZXJhdGlvbl8lLmJiYXBwZW5kDQo+
Pg0KPj4gUGFyc2luZyByZWNpcGVzLi5kb25lLg0KPj4NCj4+ID09PSBNYXRjaGluZyByZWNpcGVz
OiA9PT0NCj4+DQo+PiBnY2M6DQo+Pg0KPj4gICBtZXRhLWxpbmFyby10b29sY2hhaW4gbGluYXJv
LTQuOQ0KPj4NCj4+ICAgbWV0YS1saW5hcm8tdG9vbGNoYWluIGxpbmFyby02LjINCj4+DQo+PiAg
IG1ldGEgICAgICAgICAgICAgICAgIDYuMi4wDQo+Pg0KPj4gICBtZXRhICAgICAgICAgICAgICAg
ICA1LjQuMA0KPj4NCj4+ICAgbWV0YS1saW5hcm8tdG9vbGNoYWluIGxpbmFyby01LjMNCj4+DQo+
PiAgIG1ldGEtbGluYXJvLXRvb2xjaGFpbiBsaW5hcm8tNS4yDQo+Pg0KPj4NCj4+DQo+PiBJbW1l
ZGlhdGVseSBJIGhhdmUgc2V0IHRoZSBQUkVGRVJSRURfVkVSU0lPTiBvZiBnY2MgdG8gNC45IGJ1
dCANCj4+IGJpdGJha2UgZG9lcyBub3QgZ28gYmV5b25kIGNvbmZpZ3VyYXRpb24uDQo+Pg0KPj4N
Cj4NCj4gUGxlYXNlIHBvc3QgdGhlIGVycm9yIGFuZCBjaGFuZ2UgeW91IGRpZCB0byBlbmFibGUg
NC45DQo+DQo+Pg0KPj4gSSBiZWxpZXZlIDQuOSArIG1vcnR5IGNvbWJpbmF0aW9uIGhhcyBub3Qg
YmVlbiB0ZXN0ZWQgYXQgYWxsLiBJIA0KPj4gdW5kZXJzdGFuZCBteSBhcHBzIG5lZWQgdG8gZ2V0
IHVwZGF0ZWQsIGJ1dCB0aGF04oCZcyBub3QgbXkgY2FsbC4NCj4NCj4gT0UtY29yZSBhbmQgeW9j
dG8gcmVsZWFzZXMgYnkgZGVmYXVsdCBkbyBub3QgdGVzdCB0b29sY2hhaW5zIGNvbWluZyANCj4g
ZnJvbSBvdGhlciBsYXllcnMgc28gZXNzZW50aWFsbHkgNi4yIGlzIHdoYXRzIHRoZSBkZWZhdWx0
IGNvbXBpbGVyIA0KPiB3aXRoIG1vcnR5IGFuZCB0aGF0cyB3aGF0IGlzIG1vc3QgdGVzdGVkIGhv
d2V2ZXIsIG90aGVycyBtaWdodCBoYXZlIA0KPiB0ZXN0ZWQgdGhlIG90aGVyIGNvbWJpbmF0aW9u
cyB3aXRoIG1vcnR5LA0K

