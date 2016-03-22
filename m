Return-Path: <william.c.randle@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id AE7C560797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 17:26:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 22 Mar 2016 10:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,378,1455004800"; d="scan'208";a="673929190"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2016 10:26:10 -0700
Received: from orsmsx105.amr.corp.intel.com ([169.254.2.68]) by
	ORSMSX103.amr.corp.intel.com ([169.254.5.227]) with mapi id
	14.03.0248.002; Tue, 22 Mar 2016 10:26:10 -0700
From: "Randle, William C" <william.c.randle@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] sanity.bbclass: check host tool dependencies on change
	in NATIVELBSSTRING
Thread-Index: AQHRhF+QEDjarODoMECAIe/NKBK2LZ9mLHSA
Date: Tue, 22 Mar 2016 17:26:10 +0000
Message-ID: <1458667571.2399.2.camel@intel.com>
References: <1458667398-3399-1-git-send-email-william.c.randle@intel.com>
In-Reply-To: <1458667398-3399-1-git-send-email-william.c.randle@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.6.123]
MIME-Version: 1.0
Subject: Re: [PATCH] sanity.bbclass: check host tool dependencies on change in NATIVELBSSTRING
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
X-List-Received-Date: Tue, 22 Mar 2016 17:26:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1EC9F17EE573A4789E14BC6E031FC40@intel.com>
Content-Transfer-Encoding: base64

VGhhdCBzaG91bGQgYmUgIk5BVElWRUxTQlNUUklORyIsIG9idmlvdXNseS4gVGhlIHBhdGNoIGlz
IGNvcnJlY3Q7IGl0J3MganVzdCB0aGUgc3ViamVjdCBsaW5lIGFuZCBpbnRybyB0ZXh0IHRoYXQg
SSBjb3BpZWQgYW5kIHBhc3RlZCB0aGUgdHlwby4NCg0KICAgIC1CaWxsDQoNCk9uIFR1ZSwgMjAx
Ni0wMy0yMiBhdCAxMDoyMyAtMDcwMCwgQmlsbCBSYW5kbGUgd3JvdGU6DQoNCldoZW4gYSB1c2Vy
IHVwZ3JhZGVzIHRoZWlyIGhvc3QgZGlzdHJvLCBpdCBtYXkgbm8gbG9uZ2VyIGhhdmUgYWxsIHRo
ZQ0KcmVxdWlyZWQgdG9vbHMgaW5zdGFsbGVkLCBidXQgdGhpcyB3b24ndCBiZSBjYXVnaHQgYnkg
Yml0YmFrZSByZXN1bHRpbmcNCmluIHBvc3NpYmxlIGJ1aWxkIGVycm9ycy4gUmF0aGVyIHRoYW4g
Y2hlY2sgZm9yIGluc3RhbGxlZCB0b29scyBvbiBldmVyeQ0Kc3RhcnR1cCwgdXNlIHRoZSBOQVRJ
VkVMQlNTVFJJTkcgY2hhbmdlIGFzIGluZGljYXRvciB0byByZXNjYW4gZm9yIGhvc3QNCnRvb2wg
ZGVwZW5kZW5jaWVzLiBTdG9yZSB0aGUgTkFUSVZFTEJTU1RSSU5HIGluIHRoZSBzYW5pdHlfaW5m
byBmaWxlLg0KDQpbWU9DVE8gIzg1ODVdDQoNClNpZ25lZC1vZmYtYnk6IEJpbGwgUmFuZGxlIDx3
aWxsaWFtLmMucmFuZGxlQGludGVsLmNvbTxtYWlsdG86d2lsbGlhbS5jLnJhbmRsZUBpbnRlbC5j
b20+Pg0KLS0tDQogbWV0YS9jbGFzc2VzL3Nhbml0eS5iYmNsYXNzIHwgMTMgKysrKysrKysrKy0t
LQ0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KDQpk
aWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL3Nhbml0eS5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL3Nh
bml0eS5iYmNsYXNzDQppbmRleCA1OTdmM2RlLi5mYWRhZDFiIDEwMDY0NA0KLS0tIGEvbWV0YS9j
bGFzc2VzL3Nhbml0eS5iYmNsYXNzDQorKysgYi9tZXRhL2NsYXNzZXMvc2FuaXR5LmJiY2xhc3MN
CkBAIC02NDEsOSArNjQxLDkgQEAgZGVmIGNoZWNrX3Nhbml0eV9zc3RhdGVfZGlyX2NoYW5nZShz
c3RhdGVfZGlyLCBkYXRhKToNCiAgICAgcmV0dXJuIHRlc3Rtc2cNCg0KIGRlZiBjaGVja19zYW5p
dHlfdmVyc2lvbl9jaGFuZ2Uoc3RhdHVzLCBkKToNCi0gICAgIyBTYW5pdHkgY2hlY2tzIHRvIGJl
IGRvbmUgd2hlbiBTQU5JVFlfVkVSU0lPTiBjaGFuZ2VzDQorICAgICMgU2FuaXR5IGNoZWNrcyB0
byBiZSBkb25lIHdoZW4gU0FOSVRZX1ZFUlNJT04gb3IgTkFUSVZFTFNCU1RSSU5HIGNoYW5nZXMN
CiAgICAgIyBJbiBvdGhlciB3b3JkcywgdGhlc2UgdGVzdHMgcnVuIG9uY2UgaW4gYSBnaXZlbiBi
dWlsZCBkaXJlY3RvcnkgYW5kIHRoZW4NCi0gICAgIyBuZXZlciBhZ2FpbiB1bnRpbCB0aGUgc2Fu
aXR5IHZlcnNpb24gY2hhbmdlcy4NCisgICAgIyBuZXZlciBhZ2FpbiB1bnRpbCB0aGUgc2FuaXR5
IHZlcnNpb24gb3IgaG9zdCBkaXN0cnVidXRpb24gaWQvdmVyc2lvbiBjaGFuZ2VzLg0KDQogICAg
ICMgQ2hlY2sgdGhlIHB5dGhvbiBpbnN0YWxsIGlzIGNvbXBsZXRlLiBnbGliLTIuMC1uYXRpdmVz
IHJlcXVyaWVzDQogICAgICMgeG1sLnBhcnNlcnMuZXhwYXQNCkBAIC05MzcsNiArOTM3LDcgQEAg
ZGVmIGNoZWNrX3Nhbml0eShzYW5pdHlfZGF0YSk6DQogICAgIGxhc3Rfc2FuaXR5X3ZlcnNpb24g
PSAwDQogICAgIGxhc3RfdG1wZGlyID0gIiINCiAgICAgbGFzdF9zc3RhdGVfZGlyID0gIiINCisg
ICAgbGFzdF9uYXRpdmVsc2JzdHIgPSAiIg0KICAgICBzYW5pdHl2ZXJmaWxlID0gc2FuaXR5X2Rh
dGEuZXhwYW5kKCIke1RPUERJUn0vY29uZi9zYW5pdHlfaW5mbyIpDQogICAgIGlmIG9zLnBhdGgu
ZXhpc3RzKHNhbml0eXZlcmZpbGUpOg0KICAgICAgICAgd2l0aCBvcGVuKHNhbml0eXZlcmZpbGUs
ICdyJykgYXMgZjoNCkBAIC05NDcsMTIgKzk0OCwxNyBAQCBkZWYgY2hlY2tfc2FuaXR5KHNhbml0
eV9kYXRhKToNCiAgICAgICAgICAgICAgICAgICAgIGxhc3RfdG1wZGlyID0gbGluZS5zcGxpdCgp
WzFdDQogICAgICAgICAgICAgICAgIGlmIGxpbmUuc3RhcnRzd2l0aCgnU1NUQVRFX0RJUicpOg0K
ICAgICAgICAgICAgICAgICAgICAgbGFzdF9zc3RhdGVfZGlyID0gbGluZS5zcGxpdCgpWzFdDQor
ICAgICAgICAgICAgICAgIGlmIGxpbmUuc3RhcnRzd2l0aCgnTkFUSVZFTFNCU1RSSU5HJyk6DQor
ICAgICAgICAgICAgICAgICAgICBsYXN0X25hdGl2ZWxzYnN0ciA9IGxpbmUuc3BsaXQoKVsxXQ0K
DQogICAgIGNoZWNrX3Nhbml0eV9ldmVyeWJ1aWxkKHN0YXR1cywgc2FuaXR5X2RhdGEpDQoNCiAg
ICAgc2FuaXR5X3ZlcnNpb24gPSBpbnQoc2FuaXR5X2RhdGEuZ2V0VmFyKCdTQU5JVFlfVkVSU0lP
TicsIFRydWUpIG9yIDEpDQogICAgIG5ldHdvcmtfZXJyb3IgPSBGYWxzZQ0KLSAgICBpZiBsYXN0
X3Nhbml0eV92ZXJzaW9uIDwgc2FuaXR5X3ZlcnNpb246DQorICAgICMgTkFUSVZFTFNCU1RSSU5H
IHZhciBtYXkgaGF2ZSBiZWVuIG92ZXJyaWRkZW4gd2l0aCAidW5pdmVyc2FsIiwgc28NCisgICAg
IyBnZXQgYWN0dWFsIGhvc3QgZGlzdHJpYnV0aW9uIGlkIGFuZCB2ZXJzaW9uDQorICAgIG5hdGl2
ZWxzYnN0ciA9IGxzYl9kaXN0cm9faWRlbnRpZmllcihzYW5pdHlfZGF0YSkNCisgICAgaWYgbGFz
dF9zYW5pdHlfdmVyc2lvbiA8IHNhbml0eV92ZXJzaW9uIG9yIGxhc3RfbmF0aXZlbHNic3RyICE9
IG5hdGl2ZWxzYnN0cjoNCiAgICAgICAgIGNoZWNrX3Nhbml0eV92ZXJzaW9uX2NoYW5nZShzdGF0
dXMsIHNhbml0eV9kYXRhKQ0KICAgICAgICAgc3RhdHVzLmFkZHJlc3VsdChjaGVja19zYW5pdHlf
c3N0YXRlX2Rpcl9jaGFuZ2Uoc3N0YXRlX2Rpciwgc2FuaXR5X2RhdGEpKQ0KICAgICBlbHNlOg0K
QEAgLTk2NCw2ICs5NzAsNyBAQCBkZWYgY2hlY2tfc2FuaXR5KHNhbml0eV9kYXRhKToNCiAgICAg
ICAgICAgICBmLndyaXRlKCJTQU5JVFlfVkVSU0lPTiAlc1xuIiAlIHNhbml0eV92ZXJzaW9uKQ0K
ICAgICAgICAgICAgIGYud3JpdGUoIlRNUERJUiAlc1xuIiAlIHRtcGRpcikNCiAgICAgICAgICAg
ICBmLndyaXRlKCJTU1RBVEVfRElSICVzXG4iICUgc3N0YXRlX2RpcikNCisgICAgICAgICAgICBm
LndyaXRlKCJOQVRJVkVMU0JTVFJJTkcgJXNcbiIgJSBuYXRpdmVsc2JzdHIpDQoNCiAgICAgc2Fu
aXR5X2hhbmRsZV9hYmljaGFuZ2VzKHN0YXR1cywgc2FuaXR5X2RhdGEpDQoNCg0K

