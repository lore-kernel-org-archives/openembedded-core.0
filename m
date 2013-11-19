Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F09B6D838
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 12:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 198E43C26C9;
	Tue, 19 Nov 2013 13:16:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wxJxkRZ3AYCl; Tue, 19 Nov 2013 13:16:22 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 3095611FBA;
	Tue, 19 Nov 2013 13:16:22 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 198E0B51;
	Tue, 19 Nov 2013 13:16:22 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 0DD92B4D;
	Tue, 19 Nov 2013 13:16:22 +0100 (CET)
Received: from xmail3.se.axis.com (xmail3.se.axis.com [10.0.5.75])
	by thoth.se.axis.com (Postfix) with ESMTP id 0BDE73404E;
	Tue, 19 Nov 2013 13:16:22 +0100 (CET)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail3.se.axis.com
	([10.0.5.75]) with mapi; Tue, 19 Nov 2013 13:16:21 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Nov 2013 13:16:20 +0100
Thread-Topic: [OE-core] [PATCH 00/14] Improvements to pybootchartgui
Thread-Index: Ac7iWfSVk0GAGYeATX+Ta42m+hiumgB/6dKw
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7A4A57E5403@xmail3.se.axis.com>
References: <cover.1384535211.git.pkj@axis.com>
	<CAJTo0LY4tWcawLzOcO4o3LSPoQqod8DKD-BWoMOrmsx5XndDkw@mail.gmail.com>
In-Reply-To: <CAJTo0LY4tWcawLzOcO4o3LSPoQqod8DKD-BWoMOrmsx5XndDkw@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/14] Improvements to pybootchartgui
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
X-List-Received-Date: Tue, 19 Nov 2013 12:16:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCdXJ0b24sIFJvc3MgW21haWx0
bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb21dDQo+IFNlbnQ6IGRlbiAxNiBub3ZlbWJlciAyMDEzIDAw
OjI1DQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQNCj4gQ2M6IE9FLWNvcmUNCj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0ggMDAvMTRdIEltcHJvdmVtZW50cyB0byBweWJvb3RjaGFydGd1
aQ0KPiANCj4gSGksDQo+IA0KPiBPbiAxNSBOb3ZlbWJlciAyMDEzIDE3OjA4LCBQZXRlciBLamVs
bGVyc3RlZHQNCj4gPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4gd3JvdGU6DQo+ID4gVGhp
cyBjb3JyZWN0cyBhbmQgaW1wcm92ZXMgcHlib290Y2hhcnRndWkuIEl0IHN0YXJ0cyBieSBpbXBv
cnRpbmcgdGhlDQo+ID4gcmVsZXZhbnQgcGFydHMgZm9yIHB5Ym9vdGNoYXJ0Z3VpIGZyb20gdGhl
IGxhdGVzdCB2ZXJzaW9uICgwLjE0LjUpIG9mDQo+ID4gYm9vdGNoYXJ0MiBmcm9tICJodHRwczov
L2dpdGh1Yi5jb20vbW1lZWtzL2Jvb3RjaGFydCIuIEl0IHRoZW4NCj4gY29ycmVjdHMNCj4gPiBh
IGNvdXBsZSBvZiBwcm9ibGVtcyAoZS5nLiwgWCBzY2FsaW5nLCBYIG9mZnNldCBvZiB0aGUgY2hh
cnQsIGFuZA0KPiBoZWFkZXINCj4gPiBoZWlnaHQpLCBhbmQgZmluYWxseSBhZGRzIGEgY291cGxl
IG9mIGltcHJvdmVtZW50cyAoZS5nLiwgZGlzYWJsZQ0KPiA+IGlycmVsZXZhbnQgb3B0aW9ucywg
ZHJhdyBhIGxvdCBsZXNzIHRpY2tzLCBhbmQgdXNlICJTaG93IG1vcmUiIHRvDQo+IHNob3cNCj4g
PiBhbGwgcHJvY2Vzc2VzKS4NCj4gDQo+IEV4Y2VsbGVudCBzdHVmZiwgdGhhbmtzIGZvciB3b3Jr
aW5nIG9uIHRoaXMuICBTb21lIHRpbWUgYWdvIEkgc3Bva2UgdG8NCj4gdGhlIGJvb3RjaGFydDIg
bWFpbnRhaW5lcnMgYW5kIHRoZXkgd2VyZSBvcGVuIHRvIGdlbmVyYWxpc2luZyB0aGVpcg0KPiBj
b2RlIGFuZCBtZXJnaW5nIG91ciBjb2RlYmFzZXMgLSBpcyB0aGlzIHNvbWV0aGluZyB5b3UnZCBi
ZQ0KPiBpbnRlcmVzdGluZyBpbiBsb29raW5nIGF0Pw0KPiANCj4gUm9zcw0KDQpVbmZvcnR1bmF0
ZWx5IEkgZG8gbm90IHRoaW5rIHNvIGF0IHRoaXMgdGltZS4NCg0KLy9QZXRlcg0KDQo=

