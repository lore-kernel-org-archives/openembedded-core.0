Return-Path: <swee.aun.khor@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3FF9071D9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 02:28:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jul 2017 19:28:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,404,1496127600"; d="scan'208";a="114640674"
Received: from pgsmsx104.gar.corp.intel.com ([10.221.44.91])
	by orsmga002.jf.intel.com with ESMTP; 23 Jul 2017 19:28:25 -0700
Received: from pgsmsx102.gar.corp.intel.com ([169.254.6.4]) by
	PGSMSX104.gar.corp.intel.com ([10.221.44.91]) with mapi id
	14.03.0319.002; Mon, 24 Jul 2017 10:28:25 +0800
From: "Khor, Swee Aun" <swee.aun.khor@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] openssl: Support musl-x32 build
Thread-Index: AQHTAsNjvPF1HV97tU2Cgwd3khNKtqJiQ0Sw
Date: Mon, 24 Jul 2017 02:28:23 +0000
Message-ID: <28423BAF0BC5B94BADBD663D77F7839024EF9E85@PGSMSX102.gar.corp.intel.com>
References: <cover.1500495522.git.swee.aun.khor@intel.com>
	<82e8a77a71e50e2cc00318226a42ced7d6a0909c.1500495522.git.swee.aun.khor@intel.com>
	<1500711616.22282.110.camel@linuxfoundation.org>
In-Reply-To: <1500711616.22282.110.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] openssl: Support musl-x32 build
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
X-List-Received-Date: Mon, 24 Jul 2017 02:28:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzLiBXaWxsIGZpeCB0aGF0IGFuZCByZXN1Ym1pdCB0aGUgcGF0Y2guIA0KDQpSZWdhcmRz
LA0KU3dlZUF1bg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUmljaGFyZCBQ
dXJkaWUgW21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXSANClNlbnQ6
IFNhdHVyZGF5LCBKdWx5IDIyLCAyMDE3IDQ6MjAgUE0NClRvOiBLaG9yLCBTd2VlIEF1biA8c3dl
ZS5hdW4ua2hvckBpbnRlbC5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAxLzJdIG9wZW5zc2w6IFN1cHBv
cnQgbXVzbC14MzIgYnVpbGQNCg0KT24gV2VkLCAyMDE3LTA3LTE5IGF0IDEzOjI5IC0wNzAwLCBz
d2VlLmF1bi5raG9yQGludGVsLmNvbSB3cm90ZToNCj4gRnJvbTogc3dlZWF1biA8c3dlZS5hdW4u
a2hvckBpbnRlbC5jb20+DQo+IA0KPiBTdXBwb3J0IG11c2wteDMyIGJ1aWxkIHdoaWNoIHRvIGJ1
aWxkIG9wZW5zc2wgd2l0aCAzMiBiaXRzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogc3dlZWF1biA8
c3dlZS5hdW4ua2hvckBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvb3BlbnNzbC9vcGVuc3NsLmluYyB8IDUgKysrLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsLmluYw0KPiBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsLmluYw0KPiBpbmRleCBjZTI5NWU4Li5hNTZi
ZDZlIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3Bl
bnNzbC5pbmMNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5z
c2wuaW5jDQo+IEBAIC02Niw3ICs2Niw4IEBAIGRvX2NvbmZpZ3VyZSAoKSB7DQo+IMKgCWNhc2Ug
JG9zIGluDQo+IMKgCWxpbnV4LWdudWVhYmkgfFwNCj4gwqAJbGludXgtZ251c3BlIHxcDQo+IC0J
bGludXgtbXVzbCopDQo+ICsJbGludXgtbXVzbGVhYmkgfFwNCj4gKwlsaW51eC1tdXNsc3BlKQ0K
PiDCoAkJb3M9bGludXgNCj4gwqAJCTs7DQo+IMKgCQkqKQ0KDQpJIHRoaW5rIHRoZXJlIGlzIGEg
YnVnIGhlcmUgaWYgb3M9bGludXgtbXVzbCB3aGljaCBsaWtlbHkgY2F1c2VkOg0KDQpodHRwczov
L2F1dG9idWlsZGVyLnlvY3RvLmlvL2J1aWxkZXJzL25pZ2h0bHktbXVzbC9idWlsZHMvMzY0DQoN
CkNoZWVycywNCg0KUmljaGFyZA0KDQo=

