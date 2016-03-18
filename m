Return-Path: <william.c.randle@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 812466FFEC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 01:30:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 17 Mar 2016 18:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,352,1455004800"; d="scan'208";a="913504196"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by orsmga001.jf.intel.com with ESMTP; 17 Mar 2016 18:30:29 -0700
Received: from orsmsx114.amr.corp.intel.com (10.22.240.10) by
	ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 17 Mar 2016 18:30:29 -0700
Received: from orsmsx105.amr.corp.intel.com ([169.254.2.68]) by
	ORSMSX114.amr.corp.intel.com ([169.254.8.18]) with mapi id
	14.03.0248.002; Thu, 17 Mar 2016 18:30:29 -0700
From: "Randle, William C" <william.c.randle@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] grub: add -Wno-error=trampolines to native CFLAGS
Thread-Index: AQHRgLXALnkf0fCfUEWw9QtDw+arVg==
Date: Fri, 18 Mar 2016 01:30:28 +0000
Message-ID: <1458264628.9397.10.camel@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.79.100]
MIME-Version: 1.0
Subject: [PATCH v2] grub: add -Wno-error=trampolines to native CFLAGS
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
X-List-Received-Date: Fri, 18 Mar 2016 01:30:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB79E63926697340BAAD151225621238@intel.com>
Content-Transfer-Encoding: base64

UHJldmlvdXMgcGF0Y2ggd2FzIG5vdCBhZ2FpbnN0IG1hc3Rlci4gVXBkYXRlZCBhZ2FpbnN0IG1h
c3RlciBicmFuY2guDQoNCkZpeGVzIFlPQ1RPIDkyMDENCkFkZHMgLVduby1lcnJvcj10cmFtcG9s
aW5lcyB0byBuYXRpdmUgQ0ZMQUdTIHByZXZlbnQgbXVsdGlwbGUgY29tcGlsZQ0KZXJyb3JzIHdo
ZW4gdXNpbmcgZ2NjIDUuMy4wIGZvciBnZW50b28uDQoNClNpZ25lZC1vZmYtYnk6IEJpbGwgUmFu
ZGxlIDx3aWxsaWFtLmMucmFuZGxlQGludGVsLmNvbT4NCi0tLQ0KwqBtZXRhL3JlY2lwZXMtYnNw
L2dydWIvZ3J1Yi1lZmlfMi4wMC5iYiB8IDQgKysrKw0KwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtYnNwL2dydWIvZ3J1Yi1lZmlf
Mi4wMC5iYiBiL21ldGEvcmVjaXBlcy1ic3AvZ3J1Yi9ncnViLWVmaV8yLjAwLmJiDQppbmRleCA0
ZTgwZTE4Li5jYTczMjM0IDEwMDY0NA0KLS0tIGEvbWV0YS9yZWNpcGVzLWJzcC9ncnViL2dydWIt
ZWZpXzIuMDAuYmINCisrKyBiL21ldGEvcmVjaXBlcy1ic3AvZ3J1Yi9ncnViLWVmaV8yLjAwLmJi
DQpAQCAtMzUsNiArMzUsMTAgQEAgRVhUUkFfT0VDT05GID0gIi0td2l0aC1wbGF0Zm9ybT1lZmkg
LS1kaXNhYmxlLWdydWItbWtmb250IFwNCsKgDQrCoEVYVFJBX09FQ09ORiArPSAiJHtAYmIudXRp
bHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdsYXJnZWZpbGUnLCAnLS1lbmFibGUtbGFy
Z2VmaWxlIGFjX2N2X3NpemVvZl9vZmZfdD04JywgJy0tZGlzYWJsZS1sYXJnZWZpbGUnLCBkKX0i
DQrCoA0KKyMgbGRtLmM6MTE0Ojc6IGVycm9yOiB0cmFtcG9saW5lIGdlbmVyYXRlZCBmb3IgbmVz
dGVkIGZ1bmN0aW9uICdob29rJyBbLVdlcnJvcj10cmFtcG9saW5lc10NCisjIGFuZCBtYW55IG90
aGVyIHBsYWNlcyBpbiB0aGUgZ3J1YiBjb2RlIHdoZW4gY29tcGlsZWQgd2l0aCBzb21lIG5hdGl2
ZSBnY2MgNS4zIGNvbXBpbGVycw0KK0NGTEFHU19hcHBlbmRfY2xhc3MtbmF0aXZlID0gIiAtV25v
LWVycm9yPXRyYW1wb2xpbmVzIg0KKw0KwqBkb19pbnN0YWxsX2NsYXNzLW5hdGl2ZSgpIHsNCsKg
wqDCoMKgaW5zdGFsbCAtZCAke0R9JHtiaW5kaXJ9DQrCoMKgwqDCoGluc3RhbGwgLW0gNzU1IGdy
dWItbWtpbWFnZSAke0R9JHtiaW5kaXJ9DQotLQ0KMi41LjANCg==

