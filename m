Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 143AE6C138
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 06:56:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 22:56:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,231,1539673200"; d="scan'208";a="104225481"
Received: from kmsmsx151.gar.corp.intel.com ([172.21.73.86])
	by fmsmga002.fm.intel.com with ESMTP; 13 Nov 2018 22:56:16 -0800
Received: from pgsmsx110.gar.corp.intel.com (10.221.44.111) by
	KMSMSX151.gar.corp.intel.com (172.21.73.86) with Microsoft SMTP Server
	(TLS) id 14.3.408.0; Wed, 14 Nov 2018 14:56:15 +0800
Received: from kmsmsx155.gar.corp.intel.com ([169.254.15.19]) by
	PGSMSX110.gar.corp.intel.com ([169.254.13.219]) with mapi id
	14.03.0415.000; Wed, 14 Nov 2018 14:56:15 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/4] qemurunner: Add support for slirp
Thread-Index: AQHUezYEV3QlCyZcpUWT8B/flxp3kqVN1jeAgADsv9A=
Date: Wed, 14 Nov 2018 06:56:15 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D0434811F912@KMSMSX155.gar.corp.intel.com>
References: <1542101577-59901-1-git-send-email-ee.peng.yeoh@intel.com>
	<1542101577-59901-2-git-send-email-ee.peng.yeoh@intel.com>
	<b26d278cf4a89f6a10aa3895efb84256ed0f6be9.camel@linuxfoundation.org>
In-Reply-To: <b26d278cf4a89f6a10aa3895efb84256ed0f6be9.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODM4NDJmMmUtMTBmZC00YmFiLWI2NTctMjc1YTlhZDFiMzZlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiR0NhZElJdWpPdGo3V0xLR09CM2dPSlFhcWlJQXQzM2pRWWQyd1A1WFlibytvYytcL1FHWmdPZUZZcSsrczlZSUIifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] qemurunner: Add support for slirp
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
X-List-Received-Date: Wed, 14 Nov 2018 06:56:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KVGhhbmsgeW91IGZvciBzaGFyaW5nIG9uIHRoZSBlcnJvciByZWxhdGVk
IHRvIG9lcWEudGFyZ2V0Y29udHJvbC5RZW11VGFyZ2V0Lg0KQWZ0ZXIgc29tZSBhbmFseXNpcywg
aGVyZSBhcmUgbXkgZmluZGluZ3M6DQoNCjEuIE9FUUEgaGFkIGNsYXNzZXMgd2l0aCB2ZXJ5IHNp
bWlsYXIgbmFtZSBhcyB3ZWxsIGFzIGludGVyZmFjZSBmb3IgY2Fycnkgb3V0IHFlbXUgYW5kIHNz
aCBvcGVyYXRpb25zLiAgRXhhbXBsZTogIlFlbXVUYXJnZXQgdnMgT0VRZW11VGFyZ2V0IiwgIlNT
SENvbnRyb2wgdnMgT0VTU0hUYXJnZXQiLiAgV2hlcmUgT0VRZW11VGFyZ2V0ICYgT0VTU0hUYXJn
ZXQgd2VyZSB1c2VkIG1haW5seSBmb3IgcnVudGltZS90ZXN0aW1hZ2UgYW5kIFFlbXVUYXJnZXQg
JiBTU0hDb250cm9sIHdlcmUgdXNlZCBmb3IgbWFpbmx5IGZvciBvZS1zZWxmdGVzdC4gIE5vdCBv
bmx5IHRoZSBuYW1lIGFuZCBpbnRlcmZhY2Ugd2VyZSBzaW1pbGFyLCB0aGVyZSBhcmUgc29tZSBk
dXBsaWNhdGVkIGNvZGVzIGJldHdlZW4gdGhlc2UgdHdvIGdyb3VwIG9mIGNsYXNzZXMuICBUaGlz
IGhhZCBpbnRyb2R1Y2VkIGFkZGl0aW9uYWwgY29tcGxleGl0eSBpbiBib3RoIGFkZGluZyBuZXcg
ZmVhdHVyZXMgYW5kIHRlc3RpbmcgKGVnLiBub3cgdGhlICJzbGlycCIgZmVhdHVyZXMgbmVlZCB0
byBiZSBhZGRlZCB0byBib3RoIGdyb3VwIG9mIGNsYXNzZXMgYW5kIHRlc3RpbmcgYm90aCkuIA0K
DQoyLiBDb2RpbmcgZGVzaWduIGJlaW5nIHVzZWQgd2VyZSBkaWZmZXJlbnQgYmV0d2VlbiB0aGVz
ZSB0d28gZ3JvdXAgb2YgY2xhc3Nlcy4gV2hlcmUgT0VRZW11VGFyZ2V0IGFuZCBPRVNTSFRhcmdl
dCB1c2VkIGluaGVyaXRhbmNlIGRlc2lnbiwgUWVtdVRhcmdldCBhbmQgU1NIQ29udHJvbCB1c2Vk
IGNvbXBvc2l0ZSBkZXNpZ24uICBUaGlzIGZ1cnRoZXIgYWRkaW5nIG1vcmUgY29tcGxleGl0eSBp
bnRvIGRldmVsb3BpbmcgbmV3IGZlYXR1cmUuDQoNClNvbHV0aW9uczoNCjEuIFNob3J0IHRlcm0g
LSBJIHdpbGwgZW5hYmxlIHNsaXJwIGludG8gYm90aCBncm91cCBvZiBjbGFzc2VzIGFuZCB0ZXN0
IHRoZW0NCjIuIExvbmcgdGVybSAtIHRoaXMgcmVxdWlyZSBzaWduaWZpY2FudCByZWZhY3Rvcmlu
ZyB0byByZW1vdmUgZHVwbGljYXRpb24gY29kZXMgYW5kIHNpbXBsaWZ5IHRoZSBjb2RlIGJhc2Ug
Zm9yIHFlbXUgYW5kIHNzaCBvcGVyYXRpb25zLiANCg0KUGxlYXNlIGxldCBtZSBrbm93IHlvdSBp
bnB1dHMgYW5kIHJlY29tbWVuZGF0aW9uLg0KDQpCZXN0IHJlZ2FyZHMsDQpZZW9oIEVlIFBlbmcg
IA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUmljaGFyZCBQdXJkaWUgW21h
aWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXSANClNlbnQ6IFdlZG5lc2Rh
eSwgTm92ZW1iZXIgMTQsIDIwMTggNzozNCBBTQ0KVG86IFllb2gsIEVlIFBlbmcgPGVlLnBlbmcu
eWVvaEBpbnRlbC5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAyLzRdIHFlbXVydW5uZXI6IEFkZCBzdXBw
b3J0IGZvciBzbGlycA0KDQpPbiBUdWUsIDIwMTgtMTEtMTMgYXQgMTc6MzIgKzA4MDAsIFllb2gg
RWUgUGVuZyB3cm90ZToNCj4gRW5hYmxlIHFlbXVydW5uZXIgZm9yIHNsaXJwLiBSZXRyaWV2ZWQg
dGhlIHBvcnQgZnJvbSBsb2NhbGhvc3QgdG8gDQo+IGNvbm5lY3QgdG8gcWVtdS4NCj4gDQo+IFtZ
T0NUTyMxMDcxM10NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFllb2ggRWUgUGVuZyA8ZWUucGVuZy55
ZW9oQGludGVsLmNvbT4NCj4gLS0tDQo+ICBtZXRhL2xpYi9vZXFhL3V0aWxzL3FlbXVydW5uZXIu
cHkgfCAxNyArKysrKysrKysrKysrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCiAgRmlsZSAiL21lZGlhL2J1aWxkMS9wb2t5L21ldGEv
bGliL29lcWEvY29yZS9kZWNvcmF0b3IvX19pbml0X18ucHkiLCBsaW5lIDMyLCBpbiB3cmFwcGVk
X2YNCiAgICByZXR1cm4gZnVuYygqYXJncywgKiprd2FyZ3MpDQogIEZpbGUgIi9tZWRpYS9idWls
ZDEvcG9reS9tZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2VzL2RldnRvb2wucHkiLCBsaW5lIDEy
ODIsIGluIHRlc3RfZGV2dG9vbF9kZXBsb3lfdGFyZ2V0DQogICAgd2l0aCBydW5xZW11KHRlc3Rp
bWFnZSkgYXMgcWVtdToNCiAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy42L2NvbnRleHRsaWIucHki
LCBsaW5lIDgxLCBpbiBfX2VudGVyX18NCiAgICByZXR1cm4gbmV4dChzZWxmLmdlbikNCiAgRmls
ZSAiL21lZGlhL2J1aWxkMS9wb2t5L21ldGEvbGliL29lcWEvdXRpbHMvY29tbWFuZHMucHkiLCBs
aW5lIDMyNywgaW4gcnVucWVtdQ0KICAgIHFlbXUgPSBvZXFhLnRhcmdldGNvbnRyb2wuUWVtdVRh
cmdldChyZWNpcGVkYXRhLCB0YXJnZXRsb2dnZXIsIGltYWdlX2ZzdHlwZSkNCiAgRmlsZSAiL21l
ZGlhL2J1aWxkMS9wb2t5L21ldGEvbGliL29lcWEvdGFyZ2V0Y29udHJvbC5weSIsIGxpbmUgMTQ4
LCBpbiBfX2luaXRfXw0KICAgIGxvZ2dlciA9IGxvZ2dlcikNClR5cGVFcnJvcjogX19pbml0X18o
KSBtaXNzaW5nIDEgcmVxdWlyZWQgcG9zaXRpb25hbCBhcmd1bWVudDogJ3VzZV9zbGlycCcNCg0K
SSdtIHRoZXJlZm9yZSBub3Qgc3VyZSBob3cgbXVjaCB0ZXN0aW5nIHRoaXMgaGFzIGhhZD8NCg0K
Q2hlZXJzLA0KDQpSaWNoYXJkDQoNCg0K

