Return-Path: <william.c.randle@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 485E565CB6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 01:09:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 17 Mar 2016 18:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,352,1455004800"; d="scan'208";a="766481375"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by orsmga003.jf.intel.com with ESMTP; 17 Mar 2016 18:09:18 -0700
Received: from orsmsx160.amr.corp.intel.com (10.22.226.43) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 17 Mar 2016 18:09:18 -0700
Received: from orsmsx105.amr.corp.intel.com ([169.254.2.68]) by
	ORSMSX160.amr.corp.intel.com ([169.254.13.48]) with mapi id
	14.03.0248.002; Thu, 17 Mar 2016 18:09:17 -0700
From: "Randle, William C" <william.c.randle@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] grub: add -Wno-error=trampolines to native CFLAGS
Thread-Index: AQHRgLLLZfHQooAahE+iOGWaJV1/Rg==
Date: Fri, 18 Mar 2016 01:09:17 +0000
Message-ID: <1458263357.9397.6.camel@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.79.100]
MIME-Version: 1.0
Subject: [PATCH] grub: add -Wno-error=trampolines to native CFLAGS
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
X-List-Received-Date: Fri, 18 Mar 2016 01:09:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <02B043CEE4DFA94783762D65026172BF@intel.com>
Content-Transfer-Encoding: base64

Rml4ZXMgWU9DVE8gOTIwMS4NCkFkZHMgLVduby1lcnJvcj10cmFtcG9saW5lcyB0byBuYXRpdmUg
Q0ZMQUdTIHByZXZlbnQgbXVsdGlwbGUgY29tcGlsZQ0KZXJyb3JzIHdoZW4gdXNpbmcgZ2NjIDUu
My4wIGZvciBnZW50b28uDQpUaGlzIGlzIGEgbGVzcyAiaW52YXNpdmUiIGZpeCB0aGFuIHRoZSBv
bmUgcHJvcG9zZWQgZWFybGllciBieQ0KTWFydGluIEphbnNhIGFuZCwgaW4gbXkgdGVzdGluZywg
c29sdmVzIHRoZSBwcm9ibGVtLg0KDQpTaWduZWQtb2ZmLWJ5OiBCaWxsIFJhbmRsZSA8d2lsbGlh
bS5jLnJhbmRsZUBpbnRlbC5jb20+DQotLS0NCsKgbWV0YS9yZWNpcGVzLWJzcC9ncnViL2dydWIt
ZWZpXzIuMDAuYmIgfCA0ICsrKysNCsKgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0K
DQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWJzcC9ncnViL2dydWItZWZpXzIuMDAuYmIgYi9t
ZXRhL3JlY2lwZXMtYnNwL2dydWIvZ3J1Yi1lZmlfMi4wMC5iYg0KaW5kZXggZWNjNmM5YS4uNThl
ZjYxZSAxMDA2NDQNCi0tLSBhL21ldGEvcmVjaXBlcy1ic3AvZ3J1Yi9ncnViLWVmaV8yLjAwLmJi
DQorKysgYi9tZXRhL3JlY2lwZXMtYnNwL2dydWIvZ3J1Yi1lZmlfMi4wMC5iYg0KQEAgLTMzLDYg
KzMzLDEwIEBAIEVYVFJBX09FQ09ORiA9ICItLXdpdGgtcGxhdGZvcm09ZWZpIC0tZGlzYWJsZS1n
cnViLW1rZm9udCBcDQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLS1lbmFibGUt
ZWZpZW11PW5vIC0tcHJvZ3JhbS1wcmVmaXg9JycgXA0KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoC0tZW5hYmxlLWxpYmx6bWE9bm8gLS1lbmFibGUtZGV2aWNlLW1hcHBlcj1ubyAt
LWVuYWJsZS1saWJ6ZnM9bm8iDQoNCisjIGxkbS5jOjExNDo3OiBlcnJvcjogdHJhbXBvbGluZSBn
ZW5lcmF0ZWQgZm9yIG5lc3RlZCBmdW5jdGlvbiAnaG9vaycgWy1XZXJyb3I9dHJhbXBvbGluZXNd
DQorIyBhbmQgbWFueSBvdGhlciBwbGFjZXMgaW4gdGhlIGdydWIgY29kZSB3aGVuIGNvbXBpbGVk
IHdpdGggc29tZSBuYXRpdmUgZ2NjIDUuMyBjb21waWxlcnMNCitDRkxBR1NfYXBwZW5kX2NsYXNz
LW5hdGl2ZSA9ICIgLVduby1lcnJvcj10cmFtcG9saW5lcyINCisNCsKgZG9faW5zdGFsbF9jbGFz
cy1uYXRpdmUoKSB7DQrCoMKgwqDCoGluc3RhbGwgLWQgJHtEfSR7YmluZGlyfQ0KwqDCoMKgwqBp
bnN0YWxsIC1tIDc1NSBncnViLW1raW1hZ2UgJHtEfSR7YmluZGlyfQ0KLS0NCjIuNy4yDQo=

