Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 88027747E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 12:15:40 +0000 (UTC)
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com
	[10.12.135.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtprelay.synopsys.com (Postfix) with ESMTPS id 8C2A910C14B8;
	Wed, 20 Mar 2019 05:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1553083641; bh=6qKPMo2wrMwpxeQHzIoLKs2NuxhVRtC7NSNSxD1E0eE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=g7jno8AHCWXAP4YB0o5mQoK0Q0rhPw7deMTSHNeXRVZfezEU0Wguo9G0XdKMq2iYh
	+gMYIWwzyFaCSUNUdJAkBU8T3efm1csr++F94A+q3uMT9N0oqx7XIwbFKyH/8va7iH
	P+C3G/CU/OjnoOBxcy3zl57B72cNWz2Lc6gpHWUa7/uBzgw+SYpXn8Ui/ECo+g6i4+
	6mHboX20LJ4fc7QOlFKeJiWJ8Sb0yfrCB62Updi5DIj0lhTbzsDn80PYFt/0r+dbj9
	OGEbG0g8ZRLk5bOMRWJtaWHz7SLtxg5HHTUH6OVYV4tSKtneA6BZgWazilYwkEEj0j
	EkxjCvDiBjNPA==
Received: from US01WEHTC2.internal.synopsys.com
	(us01wehtc2.internal.synopsys.com [10.12.239.237])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mailhost.synopsys.com (Postfix) with ESMTPS id 2B09EA0098;
	Wed, 20 Mar 2019 12:07:21 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
	US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 20 Mar 2019 05:07:21 -0700
Received: from DE02WEMBXA.internal.synopsys.com ([fe80::a014:7216:77d:d55c])
	by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id 14.03.0415.000;
	Wed, 20 Mar 2019 13:07:20 +0100
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: qemu: backport patches to fix cves breaks qemu-system-native
Thread-Index: AdTe7+qwmvsUURxbRQOHAa7d7YdYyQAHL3MAAAIeTYA=
Date: Wed, 20 Mar 2019 12:07:19 +0000
Message-ID: <4881796E12491D4BB15146FE0209CE6468224CEA@de02wembxa.internal.synopsys.com>
References: <4881796E12491D4BB15146FE0209CE6468224B73@de02wembxa.internal.synopsys.com>
	<861e1a12b82944f7a363d4f6f10b8f54340df1fb.camel@linuxfoundation.org>
In-Reply-To: <861e1a12b82944f7a363d4f6f10b8f54340df1fb.camel@linuxfoundation.org>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.225.15.89]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu: backport patches to fix cves breaks qemu-system-native
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
X-List-Received-Date: Wed, 20 Mar 2019 12:15:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiByaWNo
YXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDIwLCAyMDE5IDM6MDQgUE0NCj4g
VG86IEFsZXhleSBCcm9ka2luIDxhbGV4ZXkuYnJvZGtpbkBzeW5vcHN5cy5jb20+OyBLYWkgS2Fu
ZyA8a2FpLmthbmdAd2luZHJpdmVyLmNvbT4NCj4gQ2M6IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25z
IGFib3V0IHRoZSBvZS1jb3JlIGxheWVyIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPg0KPiBTdWJqZWN0OiBSZTogcWVtdTogYmFja3BvcnQgcGF0Y2hlcyB0byBmaXgg
Y3ZlcyBicmVha3MgcWVtdS1zeXN0ZW0tbmF0aXZlDQo+IA0KPiBPbiBXZWQsIDIwMTktMDMtMjAg
YXQgMDc6NDIgKzAwMDAsIEFsZXhleSBCcm9ka2luIHdyb3RlOg0KPiA+IEhlbGxvIEthaSBLYW5n
LA0KPiA+DQo+ID4gWW91IHJlY2VudCBjaGFuZ2VzIGluIFFFTVUgWzFdIGxlYWQgdG8gYnVpbGQg
ZmFpbHVyZToNCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLT44LS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAtLS0tLS0tLQ0KPiA+ICMgYml0YmFrZSBx
ZW11LXN5c3RlbS1uYXRpdmUNCj4gPiAuLi4NCj4gPiA+IC4uLi9idWlsZC90bXAtZ2xpYmMvd29y
ay94ODZfNjQtbGludXgvcWVtdS1zeXN0ZW0tbmF0aXZlLzMuMS4wLQ0KPiA+ID4gcjAvcWVtdS0z
LjEuMC9ody9yZG1hL3JkbWFfYmFja2VuZC5jOjMxNjo0MjogZXJyb3I6DQo+ID4gPiAnVkVORE9S
X0VSUl9JTlZfTlVNX1NHRScgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24p
DQo+ID4gPiAgICAgICAgICBjb21wX2hhbmRsZXIoSUJWX1dDX0dFTkVSQUxfRVJSLCBWRU5ET1Jf
RVJSX0lOVl9OVU1fU0dFLA0KPiA+ID4gY3R4KTsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF4NCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLT44LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAtLS0tLS0tLQ0K
PiA+DQo+ID4gVGhhdCdzIG9idmlvdXNseSBiZWNhdXNlIG9mIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAxNS1maXgtDQo+ID4gQ1ZFLTIwMTgtMjAxMjQucGF0Y2guDQo+ID4NCj4g
PiBJJ20gd29uZGVyaW5nIGlmIHlvdSB0cmllZCB0byBidWlsZCBRRU1VIHlvdXJzZWxmPw0KPiAN
Cj4gV2UncmUgbm90IHNlZWluZyB0aGlzIG9uIHRoZSBhdXRvYnVpbGRlciwgaXMgdGhpcyBnYXRl
ZCBieSBzb21lIG5vbi0NCj4gZGVmYXVsdCBjb25maWcgb3B0aW9uPw0KDQpNYXliZS4NCg0KQnV0
IGlmIHlvdSBncmVwIGJ5IHFlbXUgc291cmNlcyB5b3UgbWF5IG5vdGljZSB0aGF0IGluZGVlZCAN
ClZFTkRPUl9FUlJfSU5WX05VTV9TR0UgaXMgbm90IGRlZmluZWQgYW55d2hlcmUuIFNvIHJlZ2Fy
ZGxlc3Mgb2YgbXkgc2V0dXANCnRoYXQgbG9va3MgbGlrZSBhIHZhbGlkIGFuZCBleHBlY3RlZCBi
dWlsZCBmYWlsdXJlLg0KDQpBdCBsZWFzdCB0aGF0IHdhcyB0aGUgY2FzZSBhZnRlciBJIGZldGNo
ZWQgT0UtY29yZSBjaGFuZ2VzIHRoaXMgbW9ybmluZy4NCg0KLUFsZXhleQ0K

