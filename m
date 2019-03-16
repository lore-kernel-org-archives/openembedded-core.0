Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 646EF6BF3E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Mar 2019 09:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id AF156183D0;
	Sat, 16 Mar 2019 10:21:58 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Cxl-oa4IenuX; Sat, 16 Mar 2019 10:21:57 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id AB87518347;
	Sat, 16 Mar 2019 10:21:57 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97ABD1E084;
	Sat, 16 Mar 2019 10:21:57 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BFF61E081;
	Sat, 16 Mar 2019 10:21:57 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Sat, 16 Mar 2019 10:21:57 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 7D9B72F9C;
	Sat, 16 Mar 2019 10:21:57 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sat, 16 Mar 2019 10:21:57 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Sat, 16 Mar 2019 10:21:57 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: Can't build product that uses DEFAULTTUNE="arm926ejs"
Thread-Index: AdTXwGozNpZtoMkdRIy3RTSRsKSVkf//8tAA//9TFpCABwLhAP/+Hurg
Date: Sat, 16 Mar 2019 09:21:57 +0000
Message-ID: <395432d08f074e08aafc06ed5d2e4610@XBOX04.axis.com>
References: <d33eaa8904924405a9a5870faac183e0@XBOX04.axis.com>
	<CAMKF1souJ1e1GG6qHvSsSYi6v84FriBjwP3Fifp10e8Z2mK-_g@mail.gmail.com>
	<56f123443c35462c81076bffe4f7fb5c@XBOX04.axis.com>
	<CAMKF1spb01NPYDa04X30oiVoY_GyrVKcXYyfUWaNkcduTNdr+A@mail.gmail.com>
In-Reply-To: <CAMKF1spb01NPYDa04X30oiVoY_GyrVKcXYyfUWaNkcduTNdr+A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Can't build product that uses DEFAULTTUNE="arm926ejs"
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
X-List-Received-Date: Sat, 16 Mar 2019 09:21:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPg0KPiBTZW50OiBkZW4gMTUgbWFycyAyMDE5IDA2OjA5DQo+IFRvOiBQZXRlciBL
amVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gQ2M6IE9FIENvcmUg
KG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcpIDxvcGVuZW1iZWRkZWQt
DQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gU3ViamVjdDogUmU6IENhbid0IGJ1
aWxkIHByb2R1Y3QgdGhhdCB1c2VzIERFRkFVTFRUVU5FPSJhcm05MjZlanMiDQo+IA0KPiBPbiBN
b24sIE1hciAxMSwgMjAxOSBhdCA2OjQ5IEFNIFBldGVyIEtqZWxsZXJzdGVkdA0KPiA8cGV0ZXIu
a2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+
ID4gPiBTZW50OiBkZW4gMTEgbWFycyAyMDE5IDA1OjI0DQo+ID4gPiBUbzogUGV0ZXIgS2plbGxl
cnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+ID4gPiBDYzogT0UgQ29yZSAo
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZykNCj4gPG9wZW5lbWJlZGRl
ZC0NCj4gPiA+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gPiA+IFN1YmplY3Q6IFJl
OiBDYW4ndCBidWlsZCBwcm9kdWN0IHRoYXQgdXNlcyBERUZBVUxUVFVORT0iYXJtOTI2ZWpzIg0K
PiA+ID4NCj4gPiA+IE9uIFN1biwgTWFyIDEwLCAyMDE5IGF0IDk6MjAgUE0gUGV0ZXIgS2plbGxl
cnN0ZWR0DQo+ID4gPiA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gPiA+
ID4NCj4gPiA+ID4gSSdtIHRyeWluZyB0byBidWlsZCB3aXRoIG1hc3RlciBvZiBPRS1jb3JlIGFu
ZCBvbmUgb2Ygb3VyDQo+IHByb2R1Y3RzDQo+ID4gPiA+IG5vdyBmYWlscyB3aXRoOg0KPiA+ID4g
Pg0KPiA+ID4gPiBFUlJPUjogIE9FLWNvcmUncyBjb25maWcgc2FuaXR5IGNoZWNrZXIgZGV0ZWN0
ZWQgYSBwb3RlbnRpYWwNCj4gbWlzY29uZmlndXJhdGlvbi4NCj4gPiA+ID4gICAgIEVpdGhlciBm
aXggdGhlIGNhdXNlIG9mIHRoaXMgZXJyb3Igb3IgYXQgeW91ciBvd24gcmlzaw0KPiBkaXNhYmxl
IHRoZSBjaGVja2VyDQo+ID4gPiA+ICAgICAoc2VlIHNhbml0eS5jb25mKS4gRm9sbG93aW5nIGlz
IHRoZSBsaXN0IG9mIHBvdGVudGlhbA0KPiBwcm9ibGVtcyAvIGFkdmlzb3JpZXM6DQo+ID4gPiA+
DQo+ID4gPiA+ICAgICBFcnJvciwgdGhlIFBBQ0tBR0VfQVJDSFMgdmFyaWFibGUgKGFsbCBhbnkg
bm9hcmNoIGFybSBhcm12NA0KPiBhcm12NHQgYXJtdjUNCj4gPiA+ID4gICAgIGFybXY1dCBhcm12
NWUgYXJtdjV0ZSBhcm05MjZlanN0ZSBhcm05MjZlanNlIDxCU1AgbmFtZQ0KPiB3aXRoaGVsZD4p
IGZvcg0KPiA+ID4gPiAgICAgREVGQVVMVFRVTkUgKGFybTkyNmVqcykgZG9lcyBub3QgY29udGFp
biBUVU5FX1BLR0FSQ0gNCj4gKGFybTkyNmVqc3QpLg0KPiA+ID4gPg0KPiA+ID4gPiBJIGJlbGll
dmUgdGhpcyBpcyBkdWUgdG8gY29tbWl0IGFjODNkMjJlIChhcm0tdHVuZXM6IFJlbW92ZSAtDQo+
IG1hcmNoDQo+ID4gPiA+IG9wdGlvbiBpZiBtY3B1IGlzIGFscmVhZHkgYWRkZWQpLiBJZiBJIGJ1
aWxkIHdpdGggVGh1ZCwNCj4gVFVORV9QS0dBUkNIDQo+ID4gPiA+IGlzICJhcm05MjZlanN0ZSIu
IFRoZSAgbGFjayBvZiB0aGUgImUiIGF0IHRoZSBlbmQgd2hlbiBidWlsZGluZw0KPiB3aXRoDQo+
ID4gPiA+IG1hc3RlciBzZWVtcyB0byBiZSBkdWUgdG8gdGhlIGRlZmluaXRpb24gb2YgQVJNUEtH
U0ZYX0RTUCBhcw0KPiA+ID4gPiAiJHtAYmIudXRpbHMuY29udGFpbnMoJ1RVTkVfRkVBVFVSRVMn
LCBbICdhcm12NScsICdkc3AnIF0sICdlJywNCj4gJycsIGQpfSINCj4gPiA+ID4gYW5kIHRoZSBm
YWN0IHRoYXQgYWZ0ZXIgY29tbWl0IGFjODNkMjJlLCBUVU5FX0ZFQVRVUkVTIG5vIGxvbmdlcg0K
PiA+ID4gPiBjb250YWlucyAnYXJtdjUnLg0KPiA+ID4NCj4gPiA+IHJpZ2h0IHRoaXMgc2hvdWxk
IG5vdyBjaGVjayBmb3IgYXJtdjV0DQo+ID4NCj4gPiBUaGVyZSBpcyBubyBhcm12NXQgdG8gY2hl
Y2sgZm9yLg0KPiA+DQo+ID4gPiBhcm12NSBoYXMgYmVlbiByZW1vdmVkIGZyb20gdXBzdHJlYW0g
Z2NjIGFzIHdlbGwuIFNvIHdlIG9ubHkNCj4gc3VwcG9ydA0KPiA+ID4gYXJtdjV0IHZhcmlhbnRz
Lg0KPiA+ID4NCj4gPiA+ID4gLy9QZXRlcg0KPiA+DQo+ID4gSSBhbSBieSBubyBtZWFucyBhbnkg
ZXhwZXJ0IG9uIHRoZSB0dW5pbmcgZmlsZXMgKGFjdHVhbGx5IHRoZXkgbW9zdGx5DQo+ID4gc2Vl
bSBsaWtlIGJsYWNrIG1hZ2ljKSwgYnV0IEkgZGV2aXNlZCBhbiBhbHRlcm5hdGl2ZSBzb2x1dGlv
biBmb3INCj4gPiBwcmVmZXJyaW5nIC1tY3B1IG92ZXIgLW1hcmNoIHRoYXQgSSB0aGluayBpcyBs
ZXNzIGludmFzaXZlIGFuZCB3aXRob3V0DQo+ID4gdW53YW50ZWQgc2lkZSBlZmZlY3RzLiBJIHdp
bGwgcHVibGlzaCBpdCBzaG9ydGx5Lg0KPiANCj4gSSBzYXcgeW91IHNlbnQgY291cGxlIG9mIHBh
dGNoIHRvIGFkZHJlc3MgdGhpcywgaG93ZXZlciBJIHRoaW5rIGl0IGNhbg0KPiBiZSBhZGRyZXNz
ZWQgYSBiaXQgZGlmZmVyZW50bHkgYW5kIHBhdGNoIGNvdWxkIGJlIHNpbXBsZS4gSSB3b3VsZCBi
ZSANCj4ga2VlbiBpZiB5b3UgdHJ5IGl0IG91dCBhbmQgc2VlIGlmIHRoYXQgZml4ZXMgeW91ciBw
cm9ibGVtDQo+IA0KPiBodHRwczovL3BhdGNod29yay5vcGVuZW1iZWRkZWQub3JnL3BhdGNoLzE1
OTU5MS8NCj4gDQo+ID4gLy9QZXRlcg0KDQpXaGlsZSBJIGFncmVlIHRoYXQgeW91ciBwYXRjaCB3
aWxsIHNvbHZlIHRoZSBwcm9ibGVtIHdpdGggYXJtOTI2ZWpzLCBJIA0KYmVsaWV2ZSB0aGVyZSBh
cmUgYWR2YW50YWdlcyBpbiBhcHBseWluZyBteSBwYXRjaGVzIGluc3RlYWQuIEluIGFkZGl0aW9u
IA0KdG8gZml4aW5nIHRoZSBwcm9ibGVtIHdpdGggYXJtOTI2ZWpzLCBteSBwYXRjaGVzIChwYXRj
aCBzZXQgNCwgbm90IHBhdGNoIA0Kc2V0IDIgdGhhdCBpcyBjdXJyZW50bHkgb24gbWFzdGVyLW5l
eHQpIGFsc286DQoNCiogbWFrZSBpdCBzbyB0aGF0IHRoZXJlIGlzIG5vIGNoYW5nZSB0byBUVU5F
X0ZFQVRVUkVTLA0KKiBtYWtlIGl0IGV4cGxpY2l0IHdoZXRoZXIgLW1jcHUgb3IgLW1hcmNoIGlz
IHVzZWQsIGFuZA0KKiBtYWtlIHRoZSBleHRyYSBhcmd1bWVudHMgYWRkZWQgdG8gLW1jcHUgb3Ig
LW1hcmNoIGZvciBhcm12OCBleHBsaWNpdC4NCg0KVGhhdCBsYXN0IHBvaW50IHdhcyBzb21ldGhp
bmcgdGhhdCBjb25mdXNlZCBtZSB3aGVuIEkgcmVhZCB0aGUgb3JpZ2luYWwgDQp0dW5lIGZpbGVz
LiBJIGRpZCBub3QgcmVhbGl6ZSB0aGF0IHRob3NlIGV4dHJhIGZlYXR1cmVzIHdlcmUgYWRkZWQg
dG8gDQp3aGF0ZXZlciAtbWNwdSBvciAtbWFyY2ggaGFwcGVuZWQgdG8gYmUgYWRkZWQgdG8gVFVO
RV9DQ0FSR1MgYmVmb3JlIHRoZSANCmFyY2gtYXJtdjhhLmluYyBmaWxlIHdhcyBpbmNsdWRlZCAo
ZXNwZWNpYWxseSBhcyBpdCB3YXMgd3JpdHRlbiB0byBtYWtlIA0KaXQgbG9vayBhcyB0aGV5IHdl
cmUgb25seSBhZGRlZCB0byB0aGUgLW1hcmNoIG9wdGlvbikuDQoNCi8vUGV0ZXINCg0K

