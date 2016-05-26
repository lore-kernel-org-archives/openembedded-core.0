Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE9A86E688
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 13:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id EE98C18186;
	Thu, 26 May 2016 15:41:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id a5dhroIf7Mtm; Thu, 26 May 2016 15:41:14 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 77B3A18180;
	Thu, 26 May 2016 15:41:14 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 5CAC01B74;
	Thu, 26 May 2016 15:41:14 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 51B7AA52;
	Thu, 26 May 2016 15:41:14 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 50CAE1042;
	Thu, 26 May 2016 15:41:14 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Thu, 26 May 2016 15:41:14 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1156.000;
	Thu, 26 May 2016 15:41:14 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>
Thread-Topic: [OE-core] [PATCHv2 05/16] tcl: Use SYSROOT_DIRS to add dirs to
	stage in sysroot
Thread-Index: AQHRt0Y0yJJiMcylGUqM7rkUQXjNFp/LObxQ
Date: Thu, 26 May 2016 13:41:14 +0000
Message-ID: <86b3cfaab1c3407990067447ffd990ed@XBOX02.axis.com>
References: <cover.1463042237.git.pkj@axis.com>
	<c044a00c888e3359e64270e57067df9d648f9896.1463042237.git.pkj@axis.com>
	<CALbNGRRogSXXcyLTUvq_CqS41wNqD1EjOXPpdGzH8SSKcAEorw@mail.gmail.com>
In-Reply-To: <CALbNGRRogSXXcyLTUvq_CqS41wNqD1EjOXPpdGzH8SSKcAEorw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.55]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 05/16] tcl: Use SYSROOT_DIRS to add dirs to stage in sysroot
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
X-List-Received-Date: Thu, 26 May 2016 13:41:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZWFzIE3DvGxsZXIgW21h
aWx0bzpzY2huaXR6ZWx0b255QGdvb2dsZW1haWwuY29tXQ0KPiBTZW50OiBkZW4gMjYgbWFqIDIw
MTYgMTQ6MDANCj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdA0KPiBDYzogUGF0Y2hlcyBhbmQgZGlz
Y3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXINCj4gU3ViamVjdDogUmU6IFtPRS1jb3Jl
XSBbUEFUQ0h2MiAwNS8xNl0gdGNsOiBVc2UgU1lTUk9PVF9ESVJTIHRvIGFkZA0KPiBkaXJzIHRv
IHN0YWdlIGluIHN5c3Jvb3QNCj4gDQo+IE9uIFRodSwgTWF5IDEyLCAyMDE2IGF0IDEwOjM3IEFN
LCBQZXRlciBLamVsbGVyc3RlZHQNCj4gPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4gd3Jv
dGU6DQo+ID4gLS0tDQo+ID4gIG1ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0ay90Y2xfOC42LjQu
YmIgfCA1ICstLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxl
dGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNs
dGsvdGNsXzguNi40LmJiIGIvbWV0YS9yZWNpcGVzLQ0KPiBkZXZ0b29scy90Y2x0ay90Y2xfOC42
LjQuYmINCj4gPiBpbmRleCA4ZTkyYjNlLi42MWJlODFkIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy90Y2x0ay90Y2xfOC42LjQuYmINCj4gPiArKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvdGNsdGsvdGNsXzguNi40LmJiDQo+ID4gQEAgLTY4LDEwICs2OCw3IEBAIGRv
X2luc3RhbGwoKSB7DQo+ID4gICAgICAgICBkb25lDQo+ID4gIH0NCj4gPg0KPiA+IC1TWVNST09U
X1BSRVBST0NFU1NfRlVOQ1MgKz0gInRjbF9zeXNyb290X3ByZXByb2Nlc3MiDQo+ID4gLXRjbF9z
eXNyb290X3ByZXByb2Nlc3MgKCkgew0KPiA+IC0gICAgICAgc3lzcm9vdF9zdGFnZV9kaXIgJHtE
fSR7YmluZGlyX2Nyb3Nzc2NyaXB0c30gJHtTWVNST09UX0RFU1RESVJ9JHtiaW5kaXJfY3Jvc3Nz
Y3JpcHRzfQ0KPiA+IC19DQo+ID4gK1NZU1JPT1RfRElSUyArPSAiJHtiaW5kaXJfY3Jvc3NzY3Jp
cHRzfSINCj4gPg0KPiA+ICBQQUNLQUdFUyA9KyAidGNsLWxpYiINCj4gPiAgRklMRVNfdGNsLWxp
YiA9ICIke2xpYmRpcn0vbGlidGNsOC42LnNvLioiDQo+ID4gLS0NCj4gPiAyLjEuMA0KPiA+DQo+
IFRoaXMgb25lIGJyZWFrcyBtZXRhLW9lJ3MgcG9zdGdyZXNxbC4NCj4gDQo+IEFuZHJlYXMNCg0K
QnJlYWtzIGl0IGhvdz8NCg0KLy9QZXRlcg0KDQo=

