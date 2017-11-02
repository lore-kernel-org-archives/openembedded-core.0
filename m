Return-Path: <Yong.Lee@johnsonoutdoors.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0B1F06078E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 13:58:36 +0000 (UTC)
Received: from [216.82.242.46] by server-2.bemta-8.messagelabs.com id
	CD/D3-02046-D842BF95; Thu, 02 Nov 2017 13:58:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VSa0gUYRTdb2Z2dyq3vtbXdc2sMWiz3NZK3Ii
	gIEijoqI/a88xJ3dqHzazxvqnLItSCx9Iuatl9BSNpKXCMsmMSg2NVEpCA2szdDOKpDLT2nHs
	9e/ce+6553yXjya1l1U6mnM5OcHOWhnVZKpr1o34uBNzRszG/tYI0+gFv8rUPfxBvYJIKn+Wp
	0xqu16JNhApSt6e6nDtVFq+d79XZjSaXHUDlWQ28iXmock0hT0kdJUWKqVCi4sJeFvUSsjFfQ
	SnxkoDxSRahY1QW9BK5SGaDsFzoff8NqlN4hQoLhugJByM9fClvwNJOATPgz7/G0LGKVBQNaK
	WpBSeA0Vup9TW4K3gLXBPWD0j4VrLIbVETMIGeDf0aXwPwmHwteUqIXuFw0tfxTgGjOHi3aek
	jEOh/82YUsbR0JDbpJJxFLRX5CPJAHCjGtrqhibEBrhZNIikQIDXQXF1pDzjRvCx/rFanokF3
	1gDKc0gvB0OlyXI7WXQXVM/sX8vdHkfkLK2UwlFZ95OhJgB3S/aKZnIUUH1k3vjS7UBxWDnqF
	K+lg56OnNRIYr1/PM4T8CPDByv5s5CuT0bSvJ71Z7xg02HZrePOoeoKqQXOWE/J8QtWmJIFfh
	0i9PG8ta4eKPJYONEkU3nrGyqaNjlsHlR4J8cVChQLWr1mxtRBE0woZqe69/N2qmpjrQsCyta
	dgiZVk5sRDNomgHNsZgRs3a6wKVzrt28NfDZftNABzEhmjKJ1ogZrE3k02WqBS2ly+tf/iBo3
	/OzowTd5/Znk1rK7rBzunDNTkmAJYEl0/5n3e/v246idMEapFAotEEZnGDjnf/zAyicRkywJk
	PaEsTbnX9cBwKBiECgNfBNCuRk/1K6bGTfOFyq77jr29xMsq5X/tu3lgl1TnNkaMdtx+J8I7p
	kCWWSk/VZibN/9DiMM43T1jOmVafTfs5/PeqJaWrhV1Yy+3qPTwkb9m7Zk1MWUR792Xlyl3VL
	3fJzROkBQT/r+NPalKj2Jssj74LVD69sGGs4qhuuXNpcwmceSdiEXqzNZyjRwsbHkoLI/gJ/A
	p2FuQMAAA==
X-Env-Sender: Yong.Lee@johnsonoutdoors.com
X-Msg-Ref: server-13.tower-96.messagelabs.com!1509631115!89359000!1
X-Originating-IP: [216.32.180.49]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32227 invoked from network); 2 Nov 2017 13:58:36 -0000
Received: from mail-by2nam03lp0049.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) (216.32.180.49)
	by server-13.tower-96.messagelabs.com with AES256-SHA256 encrypted SMTP;
	2 Nov 2017 13:58:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=johnsonoutdoorsinc.onmicrosoft.com; s=selector1-johnsonoutdoors-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2LorLB+bf7D5+EVrKxuNQKhePDyWTdfQzXL/7D/Xewk=;
	b=naxQNrHYETK9PDZgvz9d/nLqKggUexwAODH9Ud2/3svtSGnzUeezOx8BsV4XXOYSUiQ57VaqMWBun2Kw8o2n5dkE6PC6lM5ncBwovhYRspgxSO/B//qcIUs44HBZwVZsa+ZlOXhEH19mHVGxX9Co1fLj81Ahf0ABh2hsLtDUHvw=
Received: from SN1PR13MB0272.namprd13.prod.outlook.com (10.162.98.29) by
	SN1PR13MB0320.namprd13.prod.outlook.com (10.163.202.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.197.4; Thu, 2 Nov 2017 13:58:34 +0000
Received: from SN1PR13MB0272.namprd13.prod.outlook.com ([10.162.98.29]) by
	SN1PR13MB0272.namprd13.prod.outlook.com ([10.162.98.29]) with mapi id
	15.20.0197.013; Thu, 2 Nov 2017 13:58:34 +0000
From: "Lee, Yong" <Yong.Lee@johnsonoutdoors.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [OE-core] GCC 4.9 and Morty
Thread-Index: AdNMzpQ2HTI1rJifRmC47v2zQhqE5AAFjESAAAHOKNAAAP5xAAABq48AAFeyygAAAKCjAAFimbdg
Date: Thu, 2 Nov 2017 13:58:34 +0000
Message-ID: <SN1PR13MB0272DC905D9380B274174699925C0@SN1PR13MB0272.namprd13.prod.outlook.com>
References: <SN1PR13MB027295287B467702CA7967E692470@SN1PR13MB0272.namprd13.prod.outlook.com>
	<CAMKF1sokNFnWVOuOTu31VJQ=Y-cjNON_cO9Ch1Ca8YfeVrNSiw@mail.gmail.com>
	<SN1PR13MB02720FA5FB44DB41FCBD8EE792470@SN1PR13MB0272.namprd13.prod.outlook.com>
	<CAMKF1soogaY_w=yHc722fN7CtXJ3bSzb0kh_3S1ej5h_aUybbA@mail.gmail.com>
	<SN1PR13MB02724610FD9D9566559C56CA92470@SN1PR13MB0272.namprd13.prod.outlook.com>
	<20171026122500.GT9221@denix.org> <20171026124258.GU9221@denix.org>
In-Reply-To: <20171026124258.GU9221@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [12.48.212.2]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN1PR13MB0320;
	6:/dmO3/dWuUDkRpHpgafOEqMMZ5N2K1TRH0ME7FEgVUGbyQVnNzVUE130JYvABGAs8KW/XKbUbnOXsY1BTaMH79/fnXXvl/+OIuuRBIHHNxJwcLxVV9egnSgv0TZlyCn3vamJCUq8mRVTiX2fxVq6+ch9Z4wZFfE/wS93nM11SXPoGuLGtELSgqgZbY5mwpF/qr/g84xmZDoRDuCQypSRp4sEbHQj8vYPQANowscw8dtSU7/YAg38vYMmAa+zUL2CXGk6jbK9ZjGP4X4zlpOn0/YSCh1gSB+jL4M0SvuBRa7NMhXyMN0bob2AZZYEOWYf3tahWDzeSGadO9Hh8TTyhxvxrRHkqm6l/CHiXHY+ZGw=;
	5:2uTesCm71RhpcbabmI58BcPvhexgN5GcCsJzyTxTWIX1enRnlB6TCmvf5Cu7hfTdE+p+2mdsVMP/w4yBb5/et3gL1fV0TB0Jz1aAymplEYuQk8eyN5T/1Iyo/30vgOjRjsGKQYZmsyAwOX/sSqrMlNcqTE6RqKTJVvydDumTopc=;
	24:uvvRR2WpyctUprdZlh5/0OgM4wSX1laZNmOR0A4HwMmHDRIdAXt/VwbpqVhzr83Q3VyKDyodr6/6yr+GwVBw6e470TTcgikZg+SldheNZ4g=;
	7:OYbUnHEqmtiraCERAdAGDaWAY5Q94sM0cMUXaYuum8mbFMJyaYiuZwNp5bck625D3/FCShBaq0+9a2bgP7tzz3E1CJffD2VpR2oTqDTDpSARsmCpm8f+2J7qEH4toJak2hP2FAyNY6KcyFk7Ht1hUEs3xT+Ezbz2FXHdPGjL2Gq2CDc6zwSaEMCuNScQcQ2J2sHz8WgSH4FId9CgV6hNuRSq1UJIhB0juKGbdl3LdSRUrOmvDJWCIU8z5VOSDb0B
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 10be1063-5a48-4494-394e-08d521f9cedb
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603238);
	SRVR:SN1PR13MB0320; 
x-ms-traffictypediagnostic: SN1PR13MB0320:
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-microsoft-antispam-prvs: <SN1PR13MB0320FA664F3750BCDC83501E925C0@SN1PR13MB0320.namprd13.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(10201501046)(3002001)(3231020)(93006095)(93001095)(6041248)(20161123555025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:SN1PR13MB0320; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:SN1PR13MB0320; 
x-forefront-prvs: 047999FF16
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(346002)(376002)(24454002)(189002)(199003)(13464003)(229853002)(105586002)(106356001)(189998001)(7736002)(72206003)(316002)(6916009)(53546010)(2950100002)(33656002)(6436002)(81156014)(8936002)(25786009)(81166006)(68736007)(478600001)(101416001)(76176999)(77096006)(54356999)(966005)(6506006)(8676002)(50986999)(7696004)(14454004)(4326008)(97736004)(6246003)(5890100001)(55016002)(3280700002)(93886005)(6116002)(102836003)(2900100001)(3846002)(99286004)(9686003)(2906002)(1720100001)(6306002)(74316002)(86362001)(3660700001)(66066001)(305945005)(53936002)(5660300001)(53376002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR13MB0320;
	H:SN1PR13MB0272.namprd13.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: johnsonoutdoors.com does not
	designate permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: johnsonoutdoors.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10be1063-5a48-4494-394e-08d521f9cedb
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2017 13:58:34.2590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 16ab962a-71e7-495f-a8ed-d682f863e008
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR13MB0320
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
X-List-Received-Date: Thu, 02 Nov 2017 13:58:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIERlbnlzIGZvciB0aGUgcG9pbnRlcnMuIEhhdmUgc3Vic2NyaWJlZCB0byBtZXRhLWFy
YWdvLg0KTXkgcXVlc3Rpb25zIHdpbGwgYmUgbW9yZSBhcHByb3ByaWF0ZWx5IHBvc3RlZC4NCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IERlbnlzIERteXRyaXllbmtvIFttYWls
dG86ZGVuaXNAZGVuaXgub3JnXSANClNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDI2LCAyMDE3IDg6
NDMgQU0NClRvOiBMZWUsIFlvbmcgPFlvbmcuTGVlQGpvaG5zb25vdXRkb29ycy5jb20+DQpDYzog
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtP
RS1jb3JlXSBHQ0MgNC45IGFuZCBNb3J0eQ0KDQpPbiBUaHUsIE9jdCAyNiwgMjAxNyBhdCAwODoy
NTowMEFNIC0wNDAwLCBEZW55cyBEbXl0cml5ZW5rbyB3cm90ZToNCj4gT24gVHVlLCBPY3QgMjQs
IDIwMTcgYXQgMDY6Mzc6MTdQTSArMDAwMCwgTGVlLCBZb25nIHdyb3RlOg0KPiA+IFRoYW5rIHlv
dS4NCj4gPiBJIHN3aXRjaGVkIHRvIGludGVybmFsIHRvb2xjaGFpbiBhbmQgYnVpbGRpbmcgR0ND
IDUuNCAoaW5jbHVkZWQgaW4gDQo+ID4gbWV0YSkgaXMgY29tcGxldGUgYW5kIGlzIG9udG8gZ2xp
YmMuDQo+ID4gDQo+ID4gSW4gc3VtbWFyeSwgVEkgU0RLIGFwcGVhcnMgdG8gYmUgYnJva2VuIGFz
IHRoZSBub25lLWRlZmF1bHQgR0NDIA0KPiA+IHZlcnNpb24gaW5jbHVkZWQgaW4gdGhlaXIgcGFj
a2FnZSAoaWUuIExpbmFybyA0LjkgYW5kIExpbmFybyA1LjIpIGZhaWxzIHRvIGJ1aWxkLg0KPiAN
Cj4gVGhlcmUncyBub3RoaW5nIHdyb25nIHdpdGggVEkgU0RLIC0gdGhlIGlzc3VlIGlzIG9mdGVu
IHdpdGggdGhlIExpbmFybyANCj4gcHJlYnVpbHQgdG9vbGNoYWluIGNoYW5naW5nIGxpdHRsZSB0
aGluZ3MgZnJvbSB2ZXJzaW9uIHRvIHZlcnNpb24gYW5kIA0KPiBicmVha2luZyBjb3JyZXNwb25k
aW5nIHJlY2lwZXMuIFVuZm9ydHVuYXRlbHksIGV4dGVybmFsIHRvb2xjaGFpbiBpcyANCj4gcmVx
dWlyZWQsIGhlbmNlIEkgb25seSBzdXBwb3J0IDEgc3BlY2lmaWMgTGluYXJvIHRvb2xjaGFpbiB2
ZXJzaW9uIHBlciANCj4gcmVsZWFzZSAtIDcueCBpbiByb2NrbywgNi54IGluIG1vcnR5LCA1Lngg
aW4ga3JvZ290aCwgNC45IGluIGZpZG8sIA0KPiBldGMuIFNvLCBpZiB5b3UgbmVlZCBhIGRpZmZl
cmVudCBMaW5hcm8gdG9vbGNoYWluIHZlcnNpb24sIGVpdGhlciANCj4gc3dpdGNoIHRvIGEgY29y
cmVzcG9uZGluZyByZWxlYXNlIHNldHVwLCBvciB0cnkgcG9ydGluZyB0aG9zZSByZWNpcGVzLg0K
PiBBbHRlcm5hdGl2ZWx5LCB5b3UgY2FuIGFsd2F5cyBzd2l0Y2ggdG8gaW50ZXJuYWwgdG9vbGNo
YWluIGJ5IHNpbXBseSANCj4gcGFzc2luZyBUT09MQ0hBSU5fVFlQRT1pbnRlcm5hbCB0byBUSSBT
REsgYnVpbGQuIEl0J3Mgbm90IHRoZSBkZWZhdWx0IA0KPiBhbmQgZG9lc24ndCBnZXQgdGVzdGVk
IHZlcnkgbXVjaCBhZ2FpbnN0IFRJIFNESywgYnV0IEkgdHJ5IHRvIGVuc3VyZSANCj4gbm90aGlu
ZyBpcyBicm9rZW4gaW4gZWFjaCByZWxlc2FlLiBUaG91Z2gsIGdjYzcgaXMgc3RpbGwgd29yayBp
biBwcm9ncmVzcy4NCg0KQlRXLCBtZXRhLWFyYWdvIGhhcyBpdHMgb3duIG1haWxpbmcgbGlzdCwg
YXMgd2VsbCBhcyBtZXRhLWxpbmFybyBoYXMgb25lIHRvby4gDQpDb21wbGFpbmluZyB0byBPRS1D
b3JlIGFib3V0IHNwZWNpZmljcyBsaWtlIHRoaXMgaXMgbGlrZSBwb3N0aW5nIHRvIExLTUwgYWJv
dXQgaXNzdWVzIHdpdGggeW91ciBMaW51eCBkaXN0cm8uLi4gQXMgS2hlbSBzYWlkIC0gYXNrIHlv
dXIgU0RLIHByb3ZpZGVyLiBBbmQgbWF5YmUgdHJ5IGRvaW5nIHRoYXQgZmlyc3QgLSBjb3VsZCBw
cm9iYWJseSBzYXZlIHlvdSBhIGxvdCBvZiBoZWFkYWNoZS4uLg0KDQoNCj4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEtoZW0gUmFqIFttYWlsdG86cmFqLmtoZW1AZ21h
aWwuY29tXQ0KPiA+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMjQsIDIwMTcgMTo0NiBQTQ0KPiA+
IFRvOiBMZWUsIFlvbmcgPFlvbmcuTGVlQGpvaG5zb25vdXRkb29ycy5jb20+DQo+ID4gQ2M6IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIEdDQyA0LjkgYW5kIE1vcnR5DQo+ID4gDQo+ID4gT24gVHVlLCBPY3QgMjQsIDIw
MTcgYXQgMTA6MzMgQU0sIExlZSwgWW9uZyA8WW9uZy5MZWVAam9obnNvbm91dGRvb3JzLmNvbT4g
d3JvdGU6DQo+ID4gPiBUaGFua3MgUmFqIGZvciB0aGUgaW5wdXQuIEF0dGFjaGVkIHRoZSBsb2dz
LiBQbGVhc2UgdGFrZSBhIGxvb2suDQo+ID4gPiBUaGUgLmRpZmYgZmlsZSBpcyBiYXNlZCBvbiB0
aGUgdG9vbGNoYWluLWxpbmFyby5pbmMgZmlsZSBzaGlwcGVkIHdpdGggVEkncyBTREsgWzFdLg0K
PiA+ID4NCj4gPiANCj4gPiBZb3VyIGNoYW5nZXMgbG9vayBmaW5lLg0KPiA+IA0KPiA+ID4gSSB3
aWxsIHRyeSB0byBjb25maWd1cmUgdGhlIFNESyB0byB1c2UgdGhlIGludGVybmFsIHRvb2xjaGFp
biBhbmQgc2VlIGlmIEkgY2FuIGRlY291cGxlIG15c2VsZiBmcm9tIHRoZSBleHRlcm5hbCB0b29s
Y2hhaW4gdG8gc2ltcGxpZnkgdGhpbmdzLg0KPiA+ID4NCj4gPiANCj4gPiB5b3UgbWlnaHQgaGF2
ZSB0byBidWcgeW91ciBTREsgcHJvdmlkZXIgZm9yIGdjYyA0LjkgYnVpbGQgaXNzdWUNCj4gPiAN
Cj4gPiANCj4gPiA+IEFkYW0NCj4gPiA+DQo+ID4gPiBbMV0NCj4gPiA+IGh0dHA6Ly9hcmFnby1w
cm9qZWN0Lm9yZy9naXQvP3A9bWV0YS1hcmFnby5naXQ7YT1ibG9iO2Y9bWV0YS1hcmFnbw0KPiA+
ID4gLWRpcw0KPiA+ID4gdHJvL2NvbmYvZGlzdHJvL2luY2x1ZGUvdG9vbGNoYWluLWxpbmFyby5p
bmM7aD0yMGE2NTE3NGYyNjljMWUxYTU5DQo+ID4gPiA4NGM1IDQ3NmEyYWI0ZTVkZmM0MmI1O2hi
PXJlZnMvaGVhZHMvbW9ydHkNCj4gPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+ID4gRnJvbTogS2hlbSBSYWogW21haWx0bzpyYWoua2hlbUBnbWFpbC5jb21dDQo+ID4g
PiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDI0LCAyMDE3IDEyOjI2IFBNDQo+ID4gPiBUbzogTGVl
LCBZb25nIDxZb25nLkxlZUBqb2huc29ub3V0ZG9vcnMuY29tPg0KPiA+ID4gQ2M6IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+IFN1YmplY3Q6IFJlOiBbT0Ut
Y29yZV0gR0NDIDQuOSBhbmQgTW9ydHkNCj4gPiA+DQo+ID4gPiAqRVhURVJOQUwgRU1BSUwqDQo+
ID4gPg0KPiA+ID4NCj4gPiA+IE9uIFR1ZSwgT2N0IDI0LCAyMDE3IGF0IDY6NTYgQU0sIExlZSwg
WW9uZyA8WW9uZy5MZWVAam9obnNvbm91dGRvb3JzLmNvbT4gd3JvdGU6DQo+ID4gPj4gSSBoYXZl
IGEgYnVuY2ggb2YgYXBwcyB0aGF0IHJlcXVpcmUgYW4gb2xkIHZlcnNpb24gb2YgR0NDICg0Ljkg
b3IgbGVzcykuDQo+ID4gPj4NCj4gPiA+PiBUaGVyZSBhcmUgYSBmZXcgdmVyc2lvbnMgb2YgR0ND
IGF2YWlsYWJsZSBpbiBteSBNb3J0eSBiYXNlZCBTREsuDQo+ID4gPj4NCj4gPiA+Pg0KPiA+ID4+
DQo+ID4gPj4gYnVpbGRANmUzNTQwOGU4ZmE1On4vdGlzZGsvYnVpbGQkIGJpdGJha2UtbGF5ZXJz
IHNob3ctcmVjaXBlcyBnY2MNCj4gPiA+Pg0KPiA+ID4+IFdBUk5JTkc6IE5vIHJlY2lwZXMgYXZh
aWxhYmxlIGZvcjoNCj4gPiA+Pg0KPiA+ID4+DQo+ID4gPj4gL2hvbWUvYnVpbGQvdGlzZGsvc291
cmNlcy9tZXRhLW9wZW5hbXAvcmVjaXBlcy1ic3AvZGV2aWNlLXRyZWUvZGUNCj4gPiA+PiB2aWNl
DQo+ID4gPj4gLQ0KPiA+ID4+IHRyZWUtZ2VuZXJhdGlvbl8lLmJiYXBwZW5kDQo+ID4gPj4NCj4g
PiA+PiBQYXJzaW5nIHJlY2lwZXMuLmRvbmUuDQo+ID4gPj4NCj4gPiA+PiA9PT0gTWF0Y2hpbmcg
cmVjaXBlczogPT09DQo+ID4gPj4NCj4gPiA+PiBnY2M6DQo+ID4gPj4NCj4gPiA+PiAgIG1ldGEt
bGluYXJvLXRvb2xjaGFpbiBsaW5hcm8tNC45DQo+ID4gPj4NCj4gPiA+PiAgIG1ldGEtbGluYXJv
LXRvb2xjaGFpbiBsaW5hcm8tNi4yDQo+ID4gPj4NCj4gPiA+PiAgIG1ldGEgICAgICAgICAgICAg
ICAgIDYuMi4wDQo+ID4gPj4NCj4gPiA+PiAgIG1ldGEgICAgICAgICAgICAgICAgIDUuNC4wDQo+
ID4gPj4NCj4gPiA+PiAgIG1ldGEtbGluYXJvLXRvb2xjaGFpbiBsaW5hcm8tNS4zDQo+ID4gPj4N
Cj4gPiA+PiAgIG1ldGEtbGluYXJvLXRvb2xjaGFpbiBsaW5hcm8tNS4yDQo+ID4gPj4NCj4gPiA+
Pg0KPiA+ID4+DQo+ID4gPj4gSW1tZWRpYXRlbHkgSSBoYXZlIHNldCB0aGUgUFJFRkVSUkVEX1ZF
UlNJT04gb2YgZ2NjIHRvIDQuOSBidXQgDQo+ID4gPj4gYml0YmFrZSBkb2VzIG5vdCBnbyBiZXlv
bmQgY29uZmlndXJhdGlvbi4NCj4gPiA+Pg0KPiA+ID4+DQo+ID4gPg0KPiA+ID4gUGxlYXNlIHBv
c3QgdGhlIGVycm9yIGFuZCBjaGFuZ2UgeW91IGRpZCB0byBlbmFibGUgNC45DQo+ID4gPg0KPiA+
ID4+DQo+ID4gPj4gSSBiZWxpZXZlIDQuOSArIG1vcnR5IGNvbWJpbmF0aW9uIGhhcyBub3QgYmVl
biB0ZXN0ZWQgYXQgYWxsLiBJIA0KPiA+ID4+IHVuZGVyc3RhbmQgbXkgYXBwcyBuZWVkIHRvIGdl
dCB1cGRhdGVkLCBidXQgdGhhdOKAmXMgbm90IG15IGNhbGwuDQo+ID4gPg0KPiA+ID4gT0UtY29y
ZSBhbmQgeW9jdG8gcmVsZWFzZXMgYnkgZGVmYXVsdCBkbyBub3QgdGVzdCB0b29sY2hhaW5zIA0K
PiA+ID4gY29taW5nIGZyb20gb3RoZXIgbGF5ZXJzIHNvIGVzc2VudGlhbGx5IDYuMiBpcyB3aGF0
cyB0aGUgZGVmYXVsdCANCj4gPiA+IGNvbXBpbGVyIHdpdGggbW9ydHkgYW5kIHRoYXRzIHdoYXQg
aXMgbW9zdCB0ZXN0ZWQgaG93ZXZlciwgb3RoZXJzIA0KPiA+ID4gbWlnaHQgaGF2ZSB0ZXN0ZWQg
dGhlIG90aGVyIGNvbWJpbmF0aW9ucyB3aXRoIG1vcnR5LA0KPiA+IC0tDQo+ID4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBPcGVuZW1iZWRkZWQt
Y29yZSBtYWlsaW5nIGxpc3QNCj4gPiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuZW1iZWRkZWQtY29yZQ0KPiAtLQ0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KPiBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4g
T3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBodHRwOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo=

