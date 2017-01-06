Return-Path: <saul.wold@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A5CFB71C50
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 20:11:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 06 Jan 2017 12:11:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,326,1477983600"; d="scan'208";a="1090836310"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2017 12:11:49 -0800
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.184]) by
	ORSMSX105.amr.corp.intel.com ([169.254.2.184]) with mapi id
	14.03.0248.002; Fri, 6 Jan 2017 12:11:49 -0800
From: "Wold, Saul" <saul.wold@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] nfs-utils: remove -f exports from nfsserver
Thread-Index: AQHSaFkcZu98zM8JREu5O9FPduniEw==
Date: Fri, 6 Jan 2017 20:11:48 +0000
Message-ID: <1483733506.5388.2.camel@intel.com>
References: <1482451659-8896-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1482451659-8896-1-git-send-email-sgw@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.254.112.7]
MIME-Version: 1.0
Subject: Re: [PATCH] nfs-utils: remove -f exports from nfsserver
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
X-List-Received-Date: Fri, 06 Jan 2017 20:11:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <45864486E4CAC844A682BDF7EDEBF2AD@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE2LTEyLTIyIGF0IDE2OjA3IC0wODAwLCBTYXVsIFdvbGQgd3JvdGU6DQo+IFRo
ZSB1cHN0cmVhbSBwcm9qZWN0IHJlbW92ZSB0aGF0IG9wdGlvbiBhcyBpdCB3YXMgcXVvdGU6DQo+
IMKgwqDCoMKgSXQgaXMgY29tcGxldGVseSBpbmVmZmVjdGl2ZS4NCj4gDQpSb3NzOiBQaW5nDQoN
ClNhdSENCg0KPiBbWU9DVE8gIzEwODQzXQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2F1bCBXb2xk
IDxzZ3dAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBtZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L25mcy11dGlscy9uZnMtdXRpbHMvbmZzc2VydmVyIHwgMiArLQ0KPiDCoDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy9uZnNzZXJ2ZXINCj4g
Yi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvbmZzc2VydmVy
DQo+IGluZGV4IDdlZDkzYTUuLmQ1ZTljMzggMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy9uZnNzZXJ2ZXINCj4gKysrIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzL25mc3NlcnZlcg0KPiBAQCAt
NDAsNyArNDAsNyBAQCB0ZXN0ICIkTkZTX1NFUlZFUlMiICE9ICIiICYmIHRlc3QgIiRORlNfU0VS
VkVSUyINCj4gLWd0IDAgJiYgdGVzdCAiJE5GU19TRVJWRVJTIiAtbA0KPiDCoCNtb3VudGQNCj4g
wqBzdGFydF9tb3VudGQoKXsNCj4gwqAJZWNobyAtbiAnc3RhcnRpbmcgbW91bnRkOiAnDQo+IC0J
c3RhcnQtc3RvcC1kYWVtb24gLS1zdGFydCAtLWV4ZWMgIiRORlNfTU9VTlREIiAtLSAiLWYNCj4g
L2V0Yy9leHBvcnRzICRAIg0KPiArCXN0YXJ0LXN0b3AtZGFlbW9uIC0tc3RhcnQgLS1leGVjICIk
TkZTX01PVU5URCIgLS0gIiRAIg0KPiDCoAllY2hvIGRvbmUNCj4gwqB9DQo+IMKgc3RvcF9tb3Vu
dGQoKXsNCj4gLS3CoA0KPiAyLjcuNA0KPiA=

