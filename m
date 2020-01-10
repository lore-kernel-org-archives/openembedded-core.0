Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 590A07FF5F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 15:07:28 +0000 (UTC)
IronPort-SDR: PkPpxbTvqaNFvlPfMqiWpWxnsTEa5jpxPcnrGxGGzupsXF56JrZYz5GCS9NdSGsTxeBmD7sGuk
	m95eWMqkhGoZ3uBDtAHp2WAj4k6AD67QOpORqGNUp2LdVq1sKwwYpO4Kl//xBsFIYX5GrmfLmy
	XazqLjUqhS3bb2fqU5lr6Yn3RiG2O41Zy90STLJjL36BQWGnz2UC22SH9TwbeG6vh+V45HH5aK
	BftL5AAvitI0RTIGzoPyHvfbQZKLA7+Bl3ar9bdsiXAJIxk8k8y50PP/IhXr69q+XtTZuxF5Vn
	jNs=
X-IronPort-AV: E=Sophos;i="5.69,417,1571695200"; 
   d="scan'208";a="4192198"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 06/11] insane.bbclass: introduce a warning for
	mime missing in inherit
Thread-Index: AQHVxys2swJohO4gck+AACduuG7Xx6fkAKag
Date: Fri, 10 Jan 2020 15:07:29 +0000
Message-ID: <f306166e975e4b639c6bbc0259d18cbd@XBOX03.axis.com>
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
	<20200109202623.28936-7-schnitzeltony@gmail.com>
In-Reply-To: <20200109202623.28936-7-schnitzeltony@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [PATCH 06/11] insane.bbclass: introduce a warning for	mime missing in inherit
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
X-List-Received-Date: Fri, 10 Jan 2020 15:07:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlLQ0KPiBib3Vu
Y2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBBbmRyZWFzIE3DvGxsZXIN
Cj4gU2VudDogZGVuIDkgamFudWFyaSAyMDIwIDIxOjI2DQo+IFRvOiBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFtPRS1jb3JlXSBbUEFUQ0ggMDYv
MTFdIGluc2FuZS5iYmNsYXNzOiBpbnRyb2R1Y2UgYSB3YXJuaW5nIGZvcg0KPiBtaW1lIG1pc3Np
bmcgaW4gaW5oZXJpdA0KPiANCj4gKiBsb29raW5nIHRocm91Z2ggbGF5ZXJzIGl0IGxvb2tzIHRo
YXQgdXNhZ2Ugb2YgbWltZS5iYmNsYXNzIGlzIHNvbWV3aGF0DQo+ICAgb3JwaGFuZWQNCj4gKiBu
b3cgdGhhdCB1cGRhdGUtbWltZS1kYXRhYmFzZSBpcyBjYWxsZWQgb25jZSBvbmx5IGF0IGltYWdl
IGNyZWF0aW9uIHRpbWUsDQo+ICAgY29zdHMgb2YgbWltZS5iYmNsYXNzIGFyZSBsaW1pdGVkDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIE3DvGxsZXIgPHNjaG5pdHplbHRvbnlAZ21haWwu
Y29tPg0KPiAtLS0NCj4gIG1ldGEvY2xhc3Nlcy9pbnNhbmUuYmJjbGFzcyB8IDEyICsrKysrKysr
KysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1n
aXQgYS9tZXRhL2NsYXNzZXMvaW5zYW5lLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMvaW5zYW5lLmJi
Y2xhc3MNCj4gaW5kZXggZjg1NmNmNmEyYi4uNDQyZTllNTExMyAxMDA2NDQNCj4gLS0tIGEvbWV0
YS9jbGFzc2VzL2luc2FuZS5iYmNsYXNzDQo+ICsrKyBiL21ldGEvY2xhc3Nlcy9pbnNhbmUuYmJj
bGFzcw0KPiBAQCAtMjgsNiArMjgsNyBAQCBXQVJOX1FBID89ICJsZGZsYWdzIHVzZWxlc3MtcnBh
dGhzIHJwYXRocyBzdGF0aWNkZXYgbGliZGlyIHhvcmctZHJpdmVyLWFiaSBcDQo+ICAgICAgICAg
ICAgICBwbi1vdmVycmlkZXMgaW5mb2RpciBidWlsZC1kZXBzIHNyYy11cmktYmFkIFwNCj4gICAg
ICAgICAgICAgIHVua25vd24tY29uZmlndXJlLW9wdGlvbiBzeW1saW5rLXRvLXN5c3Jvb3QgbXVs
dGlsaWIgXA0KPiAgICAgICAgICAgICAgaW52YWxpZC1wYWNrYWdlY29uZmlnIGhvc3QtdXNlci1j
b250YW1pbmF0ZWQgdXBwZXJjYXNlLXBuIHBhdGNoLWZ1enogXA0KPiArICAgICAgICAgICAgbWlt
ZSBcDQo+ICAgICAgICAgICAgICAiDQo+ICBFUlJPUl9RQSA/PSAiZGV2LXNvIGRlYnVnLWRlcHMg
ZGV2LWRlcHMgZGVidWctZmlsZXMgYXJjaCBwa2djb25maWcgbGEgXA0KPiAgICAgICAgICAgICAg
cGVybXMgZGVwLWNtcCBwa2d2YXJjaGVjayBwZXJtLWNvbmZpZyBwZXJtLWxpbmUgcGVybS1saW5r
IFwNCj4gQEAgLTE4NSw2ICsxODYsMTcgQEAgZGVmIHBhY2thZ2VfcWFfY2hlY2tfc3RhdGljZGV2
KHBhdGgsIG5hbWUsIGQsIGVsZiwgbWVzc2FnZXMpOg0KPiAgICAgICAgICBwYWNrYWdlX3FhX2Fk
ZF9tZXNzYWdlKG1lc3NhZ2VzLCAic3RhdGljZGV2IiwgIm5vbiAtc3RhdGljZGV2IHBhY2thZ2Ug
Y29udGFpbnMgc3RhdGljIC5hIGxpYnJhcnk6ICVzIHBhdGggJyVzJyIgJSBcDQo+ICAgICAgICAg
ICAgICAgICAgIChuYW1lLCBwYWNrYWdlX3FhX2NsZWFuX3BhdGgocGF0aCxkKSkpDQo+IA0KPiAr
UUFQQVRIVEVTVFttaW1lXSA9ICJwYWNrYWdlX3FhX2NoZWNrX21pbWUiDQo+ICtkZWYgcGFja2Fn
ZV9xYV9jaGVja19taW1lKHBhdGgsIG5hbWUsIGQsIGVsZiwgbWVzc2FnZXMpOg0KPiArICAgICIi
Ig0KPiArICAgIENoZWNrIGlmIHBhY2thZ2UgaW5zdGFsbHMgbWltZSB0eXBlcyB0byB0byAvdXNy
L3NoYXJlL21pbWUvcGFja2FnZXMNCg0KQ2hhbmdlICJ0byB0byIgdG8gInRvIi4NCg0KPiArICAg
IHdoaWxlIG5vIGluaGVyaXRpbmcgbWltZS5iYmNsYXNzDQo+ICsgICAgIiIiDQo+ICsNCj4gKyAg
ICBpZiBkLmdldFZhcigibWltZWRpciIpICsgIi9wYWNrYWdlcyIgaW4gcGF0aCBhbmQgcGF0aC5l
bmRzd2l0aCgnLnhtbCcpIGFuZCBub3QgYmIuZGF0YS5pbmhlcml0c19jbGFzcygibWltZSIsIGQp
Og0KPiArICAgICAgICBwYWNrYWdlX3FhX2FkZF9tZXNzYWdlKG1lc3NhZ2VzLCAibWltZSIsICJw
YWNrYWdlIGNvbnRhaW5zIG1pbWUgdHlwZXMgYnV0IGRvZXMgbm90IGluaGVydCBtaW1lLmJiY2xh
c3M6ICVzIHBhdGggJyVzJyIgJSBcDQo+ICsgICAgICAgICAgICAgICAgIChuYW1lLCBwYWNrYWdl
X3FhX2NsZWFuX3BhdGgocGF0aCxkKSkpDQo+ICsNCj4gIGRlZiBwYWNrYWdlX3FhX2NoZWNrX2xp
YmRpcihkKToNCj4gICAgICAiIiINCj4gICAgICBDaGVjayBmb3Igd3JvbmcgbGlicmFyeSBpbnN0
YWxsYXRpb24gcGF0aHMuIEZvciBpbnN0YW5jZSwgY2F0Y2gNCj4gLS0NCj4gMi4yMS4wDQoNCi8v
UGV0ZXINCg0K

