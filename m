Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.31622.1588540282865570110
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 14:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Cg75Dgbn;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2850; q=dns/txt; s=axis-central1;
  t=1588540283; x=1620076283;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=g6nxjwdL3M00y/EgdWXonKtAr1F2ZCrQ8jPSFv7vacg=;
  b=Cg75Dgbn0kEfUTgkVsetqT3NVvpdOjIWKHrLubX5B7gSVpO2AzTghi68
   Pp3PA4OHQUQ3m9vJxm9TjsFIB6Obg8ab+S3Z62o5OToOU6v5x5Ryy82kz
   lbG/JxyX/2QweUJh7+tAsp5PAV16BmvyaQXMEREolHhCE9XauAJGy7o1p
   xHG+a27z2O3HOjpqv9VntOpLdzwh6UdlBoqT7dsckApyCpn69xCXUcda2
   WeM6U7OLv0WlLim/F4sBCN7BEZpuZ7vKSyOKPBTiK8ukXsvqDhuu/Htwq
   uaKfaT1i10O3zyh9+EZU1IRV/W/YmI2wnPtyUXNwGtkH7BdwBtUua/3M4
   g==;
IronPort-SDR: 0VqDjomg+omIBqt898b2tJeWmJJoQUaKeWAjfcaSMzqMfbyGhl7gMPNYy1oQmlEZC5HS+B62GN
 UcEF/sNPusXt0gf7b4tRTBGynKclZ0VIiRcLYAG7XssIrAFW7ySjc2NLhsJNXmubQTXW7W92M7
 agzWH7VzLmZU1lpZuXO8oqyIXEFGTcOm7c8KMO5yv0XpPlnK1ilB/ycmekmKEAM9OlytBdIcy8
 6Ye3jg7O4A1OHnq/m0kYWJLwr5ywwsF9qGk/mKRNODp6hVZLQDE4mpegNd5g9XFwXjkYlPoEhu
 QUI=
X-IronPort-AV: E=Sophos;i="5.73,349,1583190000"; 
   d="scan'208";a="8102856"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Subject: Re: [OE-core] Failure when generating image with latest OE-Core
Thread-Topic: [OE-core] Failure when generating image with latest OE-Core
Thread-Index: AdYgnokoBlYXr3hfQ7m1x9gIEqBGdAAIHhWAAC0CDHA=
Date: Sun, 3 May 2020 21:11:18 +0000
Message-ID: <88997047dd91475ab55db266f86e7501@XBOX03.axis.com>
References: <0a65790cfa0f43659d0cec942d729b1a@XBOX03.axis.com>
 <104c5a968efb5c054f171c124eb5ae689090bc1f.camel@linuxfoundation.org>
In-Reply-To: <104c5a968efb5c054f171c124eb5ae689090bc1f.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6IGRlbiAzIG1h
aiAyMDIwIDAwOjIwDQo+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnOyBBbGV4YW5kZXIgS2FuYXZpbg0KPiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtPRS1jb3JlXSBGYWlsdXJlIHdoZW4gZ2VuZXJhdGluZyBpbWFnZSB3aXRoIGxh
dGVzdCBPRS1Db3JlDQo+IA0KPiBPbiBTYXQsIDIwMjAtMDUtMDIgYXQgMTY6MjcgKzAwMDAsIFBl
dGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPiBBZnRlciB1cGdyYWRpbmcgdG8gdGhlIGxhdGVz
dCBtYXN0ZXIgb2YgT0UtQ29yZSwgSSBnZXQgdGhlIGZvbGxvd2luZw0KPiA+IGVycm9yIHdoZW4g
YnVpbGRpbmcgYW4gaW1hZ2U6DQo+ID4NCj4gPiBETkYgdmVyc2lvbjogNC4yLjIxDQo+ID4gY2Fj
aGVkaXI6IDxpbWFnZSB3b3JrZGlyPi9yb290ZnMvdmFyL2NhY2hlL2RuZg0KPiA+IEFkZGVkIG9l
LXJlcG8gcmVwbyBmcm9tIDxpbWFnZSB3b3JrZGlyPi9vZS1yb290ZnMtcmVwbw0KPiA+IFVzZXIt
QWdlbnQ6IGZhbGxpbmcgYmFjayB0byAnbGliZG5mJzogY291bGQgbm90IGRldGVjdCBPUyBvciBi
YXNlYXJjaA0KPiA+IHJlcG86IHVzaW5nIGNhY2hlIGZvcjogb2UtcmVwbw0KPiA+IG9lLXJlcG86
IHVzaW5nIG1ldGFkYXRhIGZyb20gU2F0IDAyIE1heSAyMDIwIDA0OjA0OjAxIFBNIFVUQy4NCj4g
PiBFeGNsdWRlcyBpbiBkbmYuY29uZjogcm5nLXRvb2xzLCBzaGFyZWQtbWltZS1pbmZvLCB1ZGV2
LWh3ZGINCj4gPiAtLT4gU3RhcnRpbmcgZGVwZW5kZW5jeSByZXNvbHV0aW9uDQo+ID4gSGlzdG9y
eSBkYXRhYmFzZSBjYW5ub3QgYmUgY3JlYXRlZDogPGltYWdlDQo+ID4gd29ya2Rpcj4vcm9vdGZz
L3Zhci9saWIvZG5mL2hpc3Rvcnkuc3FsaXRlLiBFcnJvcjogU1FMaXRlIGVycm9yIG9uDQo+ID4g
IjptZW1vcnk6IjogRXhlY3V0aW5nIGFuIFNRTCBzdGF0ZW1lbnQgZmFpbGVkOiBubyBzdWNoIGNv
bHVtbjogMS4yDQo+ID4gLS0tPiBQYWNrYWdlIDxpbnRlcm5hbCBwYWNrYWdlPiA8dmVyc2lvbj4g
d2lsbCBiZSBpbnN0YWxsZWQNCj4gPiBIaXN0b3J5IGRhdGFiYXNlIGNhbm5vdCBiZSBjcmVhdGVk
OiA8aW1hZ2UNCj4gPiB3b3JrZGlyPi9yb290ZnMvdmFyL2xpYi9kbmYvaGlzdG9yeS5zcWxpdGUu
IEVycm9yOiBTUUxpdGUgZXJyb3Igb24NCj4gPiAiOm1lbW9yeToiOiBFeGVjdXRpbmcgYW4gU1FM
IHN0YXRlbWVudCBmYWlsZWQ6IG5vIHN1Y2ggY29sdW1uOiAxLjINCj4gPiBFcnJvcjogU1FMaXRl
IGVycm9yIG9uICI6bWVtb3J5OiI6IEV4ZWN1dGluZyBhbiBTUUwgc3RhdGVtZW50IGZhaWxlZDoN
Cj4gPiBubyBzdWNoIGNvbHVtbjogMS4yDQo+ID4NCj4gPiBJIGFzc3VtZSBpdCBpcyByZWxhdGVk
IHRvIHRoZSByZWNlbnQgcnBtL2RuZiB1cGRhdGUuDQo+ID4gQW55IGlkZWFzIG9uIHdoYXQncyBn
b2luZyBvbj8NCj4gDQo+IFdhcyB0aGlzIGEgYnVpbGQgZnJvbSBzY3JhdGNoIHdpdGggYSBjbGVh
biBUTVBESVIgb3IgYW4gZXhpc3RpbmcgYnVpbGQNCj4gZGlyZWN0b3J5Pw0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gUmljaGFyZA0KDQpPaywgSSBmaWd1cmVkIG91dCB0aGUgcHJvYmxlbS4gSW4gYWNj
b3JkYW5jZSB3aXRoIA0KaHR0cHM6Ly9zcWxpdGUub3JnL3F1aXJrcy5odG1sI2RibHF1b3RlLCB3
ZSBoYXZlIGFkZGVkOg0KDQpDRkxBR1MgKz0gIi1EU1FMSVRFX0RRUz0wIg0KQlVJTERfQ0ZMQUdT
ICs9ICItRFNRTElURV9EUVM9MCINCg0KaW4gYW4gc3FsaXRlM18lLmJiYXBwZW5kLiBUaGlzIGNh
dXNlcyBhbiBTUUwgc3RhdGVtZW50IHRoYXQgbWlncmF0ZXMgdGhlIA0KaGlzdG9yeSBkYXRhYmFz
ZSB0byB2ZXJzaW9uIDEuMiB0byBmYWlsLg0KDQpJIHdpbGwgc2VuZCBhIHBhdGNoIHRvIGF2b2lk
IHRoZSBwcm9ibGVtLg0KDQovL1BldGVyDQoNCg==
