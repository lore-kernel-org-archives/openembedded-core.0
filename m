Return-Path: <ray.kinsella@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA8476E2E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 15:03:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Sep 2015 08:03:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,547,1437462000"; d="scan'208";a="771142141"
Received: from irsmsx151.ger.corp.intel.com ([163.33.192.59])
	by orsmga001.jf.intel.com with ESMTP; 17 Sep 2015 08:03:30 -0700
Received: from irsmsx107.ger.corp.intel.com ([169.254.10.252]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.237]) with mapi id
	14.03.0248.002; Thu, 17 Sep 2015 16:03:29 +0100
From: "Kinsella, Ray" <ray.kinsella@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] openssl: remove lock data_word from x86cpuid.pl
Thread-Index: AQHQ8VoCUA+RiLif40+UoOInWVgCyQ==
Date: Thu, 17 Sep 2015 15:03:28 +0000
Message-ID: <1442502208.12473.4.camel@intel.com>
Accept-Language: en-IE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.252.23.10]
MIME-Version: 1.0
Subject: [meta-oe][PATCH] openssl: remove lock data_word from x86cpuid.pl
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
X-List-Received-Date: Thu, 17 Sep 2015 15:03:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <750C6A71E61C614CA2C175F858EBB35B@intel.com>
Content-Transfer-Encoding: base64

VGhlIGNtcHhjaGcgaW5zdHJ1Y3Rpb24gaXMgZW5jb2RlZCBpbiBmdW5jdGlvbnMgc3VjaCBhcyBP
UEVOU1NMX2F0b21pY19hZGQNCmFzIGEgcGVybGFzbSBkYXRhX3dvcmQuIFRoaXMgaGFzIHRoZSBl
ZmZlY3Qgb2YgaGlkaW5nIHRoZSBpbnN0cnVjdGlvbiBmcm9tIA0KdGhlIGFzc2VtYmxlci4gU3Ry
aXBwaW5nIHRoZSBMT0NLIHByZWZpeCBvbiBjbXB4Y2hnIHZpYSB0aGUgYXNzZW1ibGVyIHdpdGgg
DQotLW1vbWl0LWxvY2stcHJlZml4PXllcyB0aGVuIGJlY29tZXMgaW1wb3NzaWJsZSAocmVxdWly
ZWQgb24gdGhlIEludGVsIFgxMDAwKS4gDQpUaGlzIHBhdGNoIGNvbnZlcnRzIHRoZSBkYXRhX3dv
cmQgaW50byBwZXJsYXNtIGluc3RydWN0aW9ucy4NCg0KU2lnbmVkLW9mZi1ieTogUmF5IEtpbnNl
bGxhIDxyYXkua2luc2VsbGFAaW50ZWwuY29tPg0KLS0tDQogLi4uL29wZW5zc2wvcmVtb3ZlLWxv
Y2stZGF0YV93b3JkLWZyb20teDg2Y3B1aWQucGwucGF0Y2ggICB8ICAgMTIgKysrKysrKysrKysr
DQogbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMS4wLjJkLmJiICAg
ICAgICB8ICAgIDEgKw0KIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC9y
ZW1vdmUtbG9jay1kYXRhX3dvcmQtZnJvbS14ODZjcHVpZC5wbC5wYXRjaA0KDQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvcmVtb3ZlLWxvY2st
ZGF0YV93b3JkLWZyb20teDg2Y3B1aWQucGwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L29wZW5zc2wvb3BlbnNzbC9yZW1vdmUtbG9jay1kYXRhX3dvcmQtZnJvbS14ODZjcHVpZC5w
bC5wYXRjaA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAuLmU5NjllOTENCi0t
LSAvZGV2L251bGwNCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVu
c3NsL3JlbW92ZS1sb2NrLWRhdGFfd29yZC1mcm9tLXg4NmNwdWlkLnBsLnBhdGNoDQpAQCAtMCww
ICsxLDEyIEBADQorLS0tIG9wZW5zc2wtMS4wLjJkL2NyeXB0by94ODZjcHVpZC5wbC5vcmlnCTIw
MTUtMDktMTYgMjE6MTE6MDEuOTI3MzIyMjUyICswMTAwDQorKysrIG9wZW5zc2wtMS4wLjJkL2Ny
eXB0by94ODZjcHVpZC5wbAkyMDE1LTA5LTE2IDIxOjE0OjQ1Ljc5NTMxNDk5MiArMDEwMA0KK0BA
IC0yNzUsNyArMjc1LDggQEANCisgJnNldF9sYWJlbCgic3BpbiIpOw0KKyAJJmxlYQkoImVieCIs
JkRXUCgwLCJlYXgiLCJlY3giKSk7DQorIAkmbm9wCSgpOw0KKy0JJmRhdGFfd29yZCgweDFhYjEw
ZmYwKTsJIyBsb2NrOwljbXB4Y2hnCSVlYngsKCVlZHgpCSMgJWVheCBpcyBlbnZvbHZlZCBhbmQg
aXMgYWx3YXlzIHJlbG9hZGVkDQorKwkmbG9jawkoKTsNCisrCSZjbXB4Y2hnKCZEV1AoMCwiZWR4
IiksICJlYngiKTsgIyAlZWF4IGlzIGVudm9sdmVkIGFuZCBpcyBhbHdheXMgcmVsb2FkZWQNCisg
CSZqbmUJKCZsYWJlbCgic3BpbiIpKTsNCisgCSZtb3YJKCJlYXgiLCJlYngiKTsJIyBPcGVuU1NM
IGV4cGVjdHMgdGhlIG5ldyB2YWx1ZQ0KKyAJJnBvcAkoImVieCIpOw0KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzEuMC4yZC5iYiBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzEuMC4yZC5iYg0KaW5kZXggMzJk
OGRjZS4uZGUyZWMxYSAxMDA2NDQNCi0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3Bl
bnNzbC9vcGVuc3NsXzEuMC4yZC5iYg0KKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
cGVuc3NsL29wZW5zc2xfMS4wLjJkLmJiDQpAQCAtMzMsNiArMzMsNyBAQCBTUkNfVVJJICs9ICJm
aWxlOi8vY29uZmlndXJlLXRhcmdldHMucGF0Y2ggXA0KICAgICAgICAgICAgIGZpbGU6Ly9vcGVu
c3NsLWZpeC1kZXMucG9kLWVycm9yLnBhdGNoIFwNCiAgICAgICAgICAgICBmaWxlOi8vTWFrZWZp
bGVzLXB0ZXN0LnBhdGNoIFwNCiAgICAgICAgICAgICBmaWxlOi8vcHRlc3QtZGVwcy5wYXRjaCBc
DQorICAgICAgICAgICAgZmlsZTovL3JlbW92ZS1sb2NrLWRhdGFfd29yZC1mcm9tLXg4NmNwdWlk
LnBsLnBhdGNoIFwNCiAgICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwNCiAgICAgICAgICAg
ICBmaWxlOi8vY3J5cHRvX3VzZV9iaWdpbnRfaW5feDg2LTY0X3BlcmwucGF0Y2ggXA0KICAgICAg
ICAgICAgIGZpbGU6Ly9vcGVuc3NsLTEuMC4yYS14MzItYXNtLnBhdGNoIFwNCi0tIA0KMS43LjEw
LjQNCg0K

