Return-Path: <topi.kuutela@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 02C5D739BE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 10:37:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 06 Aug 2015 03:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,622,1432623600"; d="scan'208";a="778035493"
Received: from irsmsx107.ger.corp.intel.com ([163.33.3.99])
	by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2015 03:36:51 -0700
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.216]) by
	IRSMSX107.ger.corp.intel.com ([169.254.10.245]) with mapi id
	14.03.0224.002; Thu, 6 Aug 2015 11:36:50 +0100
From: "Kuutela, Topi" <topi.kuutela@intel.com>
To: "Kukkonen, Jussi" <jussi.kukkonen@intel.com>
Thread-Topic: [OE-core] [PATCH] python3: security: disable -pie -fpie from
	Python3 compilation CFLAGS when security_flags is inherited.
Thread-Index: AQHQ0C3tTfuMxilbi0W1+Sf20gCypZ3+tL6AgAARMHA=
Date: Thu, 6 Aug 2015 10:36:49 +0000
Message-ID: <795E302D968A1641B93780C6FFA20EDC15D38A6F@IRSMSX101.ger.corp.intel.com>
References: <1438854871-24599-1-git-send-email-topi.kuutela@intel.com>
	<CAHiDW_FpxxeLm+UeHeb24015XhW8xV4R+_OBVg1wx2qN2V0aaA@mail.gmail.com>
In-Reply-To: <CAHiDW_FpxxeLm+UeHeb24015XhW8xV4R+_OBVg1wx2qN2V0aaA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: security: disable -pie -fpie from Python3 compilation CFLAGS when security_flags is inherited.
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
X-List-Received-Date: Thu, 06 Aug 2015 10:37:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U2V2ZXJhbCBQeXRob24zIG1vZHVsZXMgcmVxdWlyZSB1c2Ugc2hhcmVkIG9iamVjdHMgYnV0IC1w
aWUgYW5kIC1mcGllIEdDQyBvcHRpb25zIGFyZSBub3QgY29tcGF0aWJsZSB3aXRoIC1zaGFyZWQu
IFRoaXMgY2F1c2VzIGxpbmtlciBlcnJvciB3aGljaCBhcmUgbm90IGRpc3BsYXllZCBkdXJpbmcg
Yml0YmFrZSBleGVjdXRpb24gKHVubGVzcyB2ZXJib3NlIG9wdGlvbnMgYXJlIHVzZWQpIGJ1dCB0
aGUgLnNvIGZpbGVzIGFyZSBub3QgZ2VuZXJhdGVkIG9yIGluY2x1ZGVkIGluIHRoZSBpbWFnZS4g
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVzc2kgS3Vra29uZW4g
W21haWx0bzpqdXNzaS5rdWtrb25lbkBpbnRlbC5jb21dDQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1
c3QgNiwgMjAxNSAxOjMxIFBNDQo+IFRvOiBLdXV0ZWxhLCBUb3BpDQo+IENjOiBQYXRjaGVzIGFu
ZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcg0KPiBTdWJqZWN0OiBSZTogW09F
LWNvcmVdIFtQQVRDSF0gcHl0aG9uMzogc2VjdXJpdHk6IGRpc2FibGUgLXBpZSAtZnBpZSBmcm9t
DQo+IFB5dGhvbjMgY29tcGlsYXRpb24gQ0ZMQUdTIHdoZW4gc2VjdXJpdHlfZmxhZ3MgaXMgaW5o
ZXJpdGVkLg0KPiANCj4gT24gNiBBdWd1c3QgMjAxNSBhdCAxMjo1NCwgVG9waSBLdXV0ZWxhIDx0
b3BpLmt1dXRlbGFAaW50ZWwuY29tPiB3cm90ZToNCj4gPiBTaWduZWQtb2ZmLWJ5OiBUb3BpIEt1
dXRlbGEgPHRvcGkua3V1dGVsYUBpbnRlbC5jb20+DQo+IA0KPiBDb3VsZCB5b3UgYWRkIGFuIGV4
cGxhbmF0aW9uIHdoeSB0aGlzIGNoYW5nZSBpcyBkb25lPyBBbHNvLCBtYXliZSBjdXQgdGhlDQo+
IHRoZSBzdWJqZWN0IGxpbmUgbGVuZ3RoIHRvIHNvbWV0aGluZyBtb3JlIHJlYXNvbmFibGUgaWYg
eW91J3JlIHJlLXN1Ym1pdHRpbmcuDQo+IA0KPiBKdXNzaQ0KPiANCj4gPiAtLS0NCj4gPiAgbWV0
YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3NlY3VyaXR5X2ZsYWdzLmluYyB8IDEgKw0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL2Nv
bmYvZGlzdHJvL2luY2x1ZGUvc2VjdXJpdHlfZmxhZ3MuaW5jDQo+ID4gYi9tZXRhL2NvbmYvZGlz
dHJvL2luY2x1ZGUvc2VjdXJpdHlfZmxhZ3MuaW5jDQo+ID4gaW5kZXggMzcyNDk3Mi4uZmY2MDBm
YSAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvc2VjdXJpdHlfZmxh
Z3MuaW5jDQo+ID4gKysrIGIvbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3NlY3VyaXR5X2ZsYWdz
LmluYw0KPiA+IEBAIC04Miw2ICs4Miw3IEBAIFNFQ1VSSVRZX0NGTEFHU19wbi1weXRob24taW1h
Z2luZyA9DQo+ICIke1NFQ1VSSVRZX05PX1BJRV9DRkxBR1N9Ig0KPiA+ICBTRUNVUklUWV9DRkxB
R1NfcG4tcHl0aG9uLXB5Y3VybCA9ICIke1NFQ1VSSVRZX05PX1BJRV9DRkxBR1N9Ig0KPiA+ICBT
RUNVUklUWV9DRkxBR1NfcG4tcHl0aG9uLXNtYXJ0cG0gPQ0KPiAiJHtTRUNVUklUWV9OT19QSUVf
Q0ZMQUdTfSINCj4gPiAgU0VDVVJJVFlfQ0ZMQUdTX3BuLXB5dGhvbi1udW1weSA9ICIke1NFQ1VS
SVRZX05PX1BJRV9DRkxBR1N9Ig0KPiA+ICtTRUNVUklUWV9DRkxBR1NfcG4tcHl0aG9uMyA9ICIk
e1NFQ1VSSVRZX05PX1BJRV9DRkxBR1N9Ig0KPiA+ICBTRUNVUklUWV9DRkxBR1NfcG4tdGNsID0g
IiR7U0VDVVJJVFlfTk9fUElFX0NGTEFHU30iDQo+ID4gIFNFQ1VSSVRZX0NGTEFHU19wbi10aWZm
ID0gIiR7U0VDVVJJVFlfTk9fUElFX0NGTEFHU30iDQo+ID4gIFNFQ1VSSVRZX0NGTEFHU19wbi12
YWxncmluZCA9ICIke1NFQ1VSSVRZX05PX1BJRV9DRkxBR1N9Ig0KPiA+IC0tDQo+ID4gMi40LjMN
Cj4gPg0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IEludGVsIEZpbmxhbmQgT3kNCj4gPiBSZWdpc3Rl
cmVkIEFkZHJlc3M6IFBMIDI4MSwgMDAxODEgSGVsc2lua2kgQnVzaW5lc3MgSWRlbnRpdHkgQ29k
ZToNCj4gPiAwMzU3NjA2IC0gNCBEb21pY2lsZWQgaW4gSGVsc2lua2kNCj4gPg0KPiA+IFRoaXMg
ZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVy
aWFsIGZvcg0KPiA+IHRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpLiBB
bnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbg0KPiA+IGJ5IG90aGVycyBpcyBzdHJpY3RseSBwcm9o
aWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQNCj4gPiByZWNpcGllbnQsIHBsZWFz
ZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLg0KPiA+DQo+ID4gLS0N
Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+
IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiA+IE9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW50ZWwgRmlu
bGFuZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6IFBMIDI4MSwgMDAxODEgSGVsc2lua2kgCkJ1c2lu
ZXNzIElkZW50aXR5IENvZGU6IDAzNTc2MDYgLSA0IApEb21pY2lsZWQgaW4gSGVsc2lua2kgCgpU
aGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBt
YXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykuIEFu
eSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90aGVycyBpcyBzdHJpY3RseSBwcm9oaWJpdGVk
LiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQKcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0
aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllcy4K


