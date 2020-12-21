Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.1298.1608580365061442050
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 11:52:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=JOo/xp5C;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1608580365;
  x=1640116365;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZTj97c5PsWkFNk8NVsfYKjfTaFvrEraQxLQORUmEusY=;
  b=JOo/xp5C+7IKSFYsaZS0sZl/hjUnTBAVrzuOeaDyYrY8ET0hPv9JxCLu
   D84yZAqB/FoRZ8yLt7wfP9/MM1tSLTAh4EmNBbaFnKlWJ5hIVktxWTk01
   JErlsPz2Y5X0fAM9jYjQr6O5WF3R9CcytpXHs8uYuI2r6SiJPiIDbcupt
   vYNV1ojr6PxExQFt0Dp/qzS3WuIbItVxmC84WfgAFic73j9h5p3Y6rGPo
   feWPK+urKBOknucE/WU/NyhNtYeWpavwAtPCZpHO5wowyp6uSYV48TBKl
   2oog+VYM/92nnFR7jKJUOskEHpu7bPN6bQkhFEj35kNMlVuY7TCNyBBGt
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "OE Core
	(openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
CC: Anuj Mittal <anuj.mittal@intel.com>, Steve Sakoman <steve@sakoman.com>
Subject: Re: [OE-core] Process for backports
Thread-Topic: [OE-core] Process for backports
Thread-Index: AdbXnKtm+a/764B0TJWzKfDpKztmv///+70A//+SPPA=
Date: Mon, 21 Dec 2020 19:52:41 +0000
Message-ID: <b9561f5d1e4f48988bf4b0d6d783e11d@XBOX03.axis.com>
References: <6a47db6d94714b2f9d306d540218c7c9@XBOX03.axis.com>
 <b5eaed3ad23e95d46438d6fc5451186a38100a5c.camel@linuxfoundation.org>
In-Reply-To: <b5eaed3ad23e95d46438d6fc5451186a38100a5c.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDIxIGRlY2VtYmVy
IDIwMjAgMTU6MTANCj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0
QGF4aXMuY29tPjsgT0UgQ29yZQ0KPiAob3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZykgPG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0K
PiBDYzogQW51aiBNaXR0YWwgPGFudWoubWl0dGFsQGludGVsLmNvbT47IFN0ZXZlIFNha29tYW4N
Cj4gPHN0ZXZlQHNha29tYW4uY29tPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFByb2Nlc3Mg
Zm9yIGJhY2twb3J0cw0KPiANCj4gT24gTW9uLCAyMDIwLTEyLTIxIGF0IDEzOjMwICswMDAwLCBQ
ZXRlciBLamVsbGVyc3RlZHQgd3JvdGU6DQo+ID4gSSB0aG91Z2h0IHRoZSBwcm9jZXNzIGZvciBi
YWNrcG9ydGluZyBjaGFuZ2VzIGluIE9FLUNvcmUgd2FzOg0KPiA+DQo+ID4gbWFzdGVyIC0+IGdh
dGVzZ2FydGggLT4gZHVuZmVsbCAtPiAuLi4NCj4gPg0KPiA+IEhvd2V2ZXIsIEkganVzdCBub3Rp
Y2VkIHRoYXQgdGhlIGxhdGVzdCBHYXRlc2dhcnRoIHJlbGVhc2UgKDI0LjAuMSkNCj4gPiBpcyBz
dGlsbCBhdCAyMDIwYiBvZiB0aW1lem9uZSwgd2hlcmVhcyBEdW5mZWxsICgyMy4wLjQpIGhhcyAy
MDIwZC4NCj4gPiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nIGhlcmUsIG9yIGlzIHRoaXMganVzdCBh
IG1pc3MgaW4gY29tbXVuaWNhdGlvbj8NCj4gDQo+IFdlJ3JlIHdvcmtpbmcgdGhyb3VnaCB3aGF0
IHRoZSBwcm9jZXNzZXMgbWVhbiBpbiBwcmFjdGlzZSBhbmQgdGhlcmUgYXJlDQo+IGEgZmV3IGlz
c3VlczoNCj4gDQo+ICogU3RldmUgZG9lc24ndCBoYXZlIHRoZSBiYW5kd2lkdGggdG8gaGFuZGxl
IEdhdGVzZ2FydGggYW5kIER1bmZlbGwNCj4gKiBCbG9ja2luZyBEdW5mZWxsIG9uIEdhdGVzZ2Fy
dGggaXNuJ3QgZmFpciB0byBTdGV2ZSBvciBydW5uaW5nIHRoZSBMVFMNCj4NCj4gVGhlIGludGVu
dCBpcyB0byBrZWVwIGJvdGggcm91Z2hseSBpbiBzeW5jIGJ1dCBJJ3ZlIG5vdCBtYWRlIGl0IGEN
Cj4gImhhcmQiIHN0b3AgYXMgaXQgd2FzIGp1c3QgZ29pbmcgdG8gY2F1c2UgdGhpbmdzIHRvIGdy
aW5kIHRvIGEgaGFsdCBhbmQNCj4gaGVscCBub2JvZHkuDQo+IA0KPiBJZiBwZW9wbGUgc3BvdCB0
aGluZ3MgbGlrZSB0aGlzIHBsZWFzZSBmbGFnIHRoZW0gdXAgYW5kIHdlJ2xsIGdldCB0aGVtDQo+
IHJlc29sdmVkLg0KDQpDb25zaWRlciB0aW1lem9uZSBmbGFnZ2VkLiA7KQ0KIA0KPiBDaGVlcnMs
DQo+IA0KPiBSaWNoYXJkDQoNCi8vUGV0ZXINCg0K
