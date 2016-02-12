Return-Path: <henry.bruce@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 38C28731E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 01:49:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 11 Feb 2016 17:49:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,434,1449561600"; d="scan'208";a="913516180"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
	by fmsmga002.fm.intel.com with ESMTP; 11 Feb 2016 17:49:29 -0800
Received: from orsmsx113.amr.corp.intel.com (10.22.240.9) by
	ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 11 Feb 2016 17:49:27 -0800
Received: from orsmsx104.amr.corp.intel.com ([169.254.4.92]) by
	ORSMSX113.amr.corp.intel.com ([169.254.9.56]) with mapi id
	14.03.0248.002; Thu, 11 Feb 2016 17:49:27 -0800
From: "Bruce, Henry" <henry.bruce@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: opencv 2.4 build failure
Thread-Index: AQHRZTeaj0QADjT0zEOCeqYQsj3UQA==
Date: Fri, 12 Feb 2016 01:49:26 +0000
Message-ID: <1455241661.22252.10.camel@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.198.170]
MIME-Version: 1.0
Subject: opencv 2.4 build failure
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
X-List-Received-Date: Fri, 12 Feb 2016 01:49:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAF07D3C6343644CAAC2AA552C1F93AB@intel.com>
Content-Transfer-Encoding: base64

VGhhbmtzIHRvIEFsZXhhbmRlciBLYW5hdmluJ3MgcGF0Y2ggSSBjYW4gbm93IHN0YXJ0IGFuIG9w
ZW5jdiBidWlsZCBvbg0KbWFzdGVyIHdpdGhvdXQgdGhlIHgxMSBkaXN0cm8gZmVhdHVyZS4gSG93
ZXZlciB0aGUgYnVpbGQgZmFpbHMgaW4gdGhlDQpweXRob24gbW9kdWxlIGFzIE5QWV9TSVpFT0Zf
T0ZGX1QgaXMgbm90IGRlZmluZWQuIA0KDQpbIDg5JV0gQnVpbGRpbmcgQ1hYIG9iamVjdA0KbW9k
dWxlcy9weXRob24vQ01ha2VGaWxlcy9vcGVuY3ZfcHl0aG9uLmRpci9zcmMyL2N2Mi5jcHAubw0K
Li4uDQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gYnVpbGQvdG1wL3N5c3Jvb3RzL2ludGVsLWNvcmVp
Nw0KLTY0L3Vzci9saWIvcHl0aG9uMi43L3NpdGUNCi1wYWNrYWdlcy9udW1weS9jb3JlL2luY2x1
ZGUvbnVtcHkvbmRhcnJheXR5cGVzLmg6NDowLA0KICAgICAgICAgICAgICAgICBmcm9tIGJ1aWxk
L3RtcC9zeXNyb290cy9pbnRlbC1jb3JlaTcNCi02NC91c3IvbGliL3B5dGhvbjIuNy9zaXRlDQot
cGFja2FnZXMvbnVtcHkvY29yZS9pbmNsdWRlL251bXB5L25kYXJyYXlvYmplY3QuaDoxOCwNCiAg
ICAgICAgICAgICAgICAgZnJvbSBidWlsZC90bXAvd29yay9jb3JlaTctNjQtcG9reQ0KLWxpbnV4
L29wZW5jdi8yLjQuMTErZ2l0QVVUT0lOQysyYzk1NDdlMzE0DQotcjAvZ2l0L21vZHVsZXMvcHl0
aG9uL3NyYzIvY3YyLmNwcDoxNToNCmJ1aWxkL3RtcC9zeXNyb290cy9pbnRlbC1jb3JlaTctNjQv
dXNyL2xpYi9weXRob24yLjcvc2l0ZQ0KLXBhY2thZ2VzL251bXB5L2NvcmUvaW5jbHVkZS9udW1w
eS9ucHlfY29tbW9uLmg6MTQ5OjEwOiBlcnJvcjogI2Vycm9yDQpVbnN1cHBvcnRlZCBzaXplIGZv
ciB0eXBlIG9mZl90DQogICAgICAgICAjZXJyb3IgVW5zdXBwb3J0ZWQgc2l6ZSBmb3IgdHlwZSBv
ZmZfdA0KICAgICAgICAgIF4NCg0KSSdtIG5vdCBlbm91Z2ggb2YgcHl0aG9uIGd1eSB0byBmaXgg
dGhpcyBteXNlbGYuIFdoZXJlIHNob3VsZCBJIHN0YXJ0DQpsb29raW5nPyANCg0KVGhhbmtzLA0K
DQpIZW5yeSBCcnVjZQ0K

