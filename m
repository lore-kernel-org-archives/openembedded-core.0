Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4F5BD6C24E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 00:59:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 16:59:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,230,1539673200"; d="scan'208";a="100039898"
Received: from pgsmsx103.gar.corp.intel.com ([10.221.44.82])
	by orsmga003.jf.intel.com with ESMTP; 13 Nov 2018 16:59:23 -0800
Received: from kmsmsx155.gar.corp.intel.com ([169.254.15.19]) by
	PGSMSX103.gar.corp.intel.com ([169.254.2.155]) with mapi id
	14.03.0415.000; Wed, 14 Nov 2018 08:59:21 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/4] qemurunner: Add support for slirp
Thread-Index: AQHUezYEV3QlCyZcpUWT8B/flxp3kqVN1jeAgACdlJA=
Date: Wed, 14 Nov 2018 00:59:20 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D0434811F735@KMSMSX155.gar.corp.intel.com>
References: <1542101577-59901-1-git-send-email-ee.peng.yeoh@intel.com>
	<1542101577-59901-2-git-send-email-ee.peng.yeoh@intel.com>
	<b26d278cf4a89f6a10aa3895efb84256ed0f6be9.camel@linuxfoundation.org>
In-Reply-To: <b26d278cf4a89f6a10aa3895efb84256ed0f6be9.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDYwZTM5ZjQtZTY2NS00NTY3LWJjZDUtZTc4YzM1OGFmMzUxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoid1RXZ1dcL2ZXcFZvcHBsMEE3ZytPRGFocGcyU3FBMGs1MXNEU1B3eVpxK1dJMjkxakdjVGlBczJLTE1GSjhLZTQifQ==
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
X-List-Received-Date: Wed, 14 Nov 2018 00:59:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TGV0IG1lIGV4cGFuZCB0aGUgdGVzdGluZyB0byBzZWxmdGVzdCAmIHJ1bnRpbWUgdGVzdCBhcyB3
ZWxsLg0KSSB3aWxsIHBlcmZvcm0gYSB0cmFjaW5nIG9uIHRoZSBkZXBlbmRlbmN5IHRvIGRlY2lk
ZSBpZiB0aGlzIG5lZWQgbW9yZSB0ZXN0aW5nLiANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IFJpY2hhcmQgUHVyZGllIFttYWlsdG86cmljaGFyZC5wdXJkaWVAbGludXhmb3Vu
ZGF0aW9uLm9yZ10gDQpTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDE0LCAyMDE4IDc6MzQgQU0N
ClRvOiBZZW9oLCBFZSBQZW5nIDxlZS5wZW5nLnllb2hAaW50ZWwuY29tPjsgb3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFU
Q0ggMi80XSBxZW11cnVubmVyOiBBZGQgc3VwcG9ydCBmb3Igc2xpcnANCg0KT24gVHVlLCAyMDE4
LTExLTEzIGF0IDE3OjMyICswODAwLCBZZW9oIEVlIFBlbmcgd3JvdGU6DQo+IEVuYWJsZSBxZW11
cnVubmVyIGZvciBzbGlycC4gUmV0cmlldmVkIHRoZSBwb3J0IGZyb20gbG9jYWxob3N0IHRvIA0K
PiBjb25uZWN0IHRvIHFlbXUuDQo+IA0KPiBbWU9DVE8jMTA3MTNdDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBZZW9oIEVlIFBlbmcgPGVlLnBlbmcueWVvaEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgbWV0
YS9saWIvb2VxYS91dGlscy9xZW11cnVubmVyLnB5IHwgMTcgKysrKysrKysrKysrKy0tLS0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KDQogIEZp
bGUgIi9tZWRpYS9idWlsZDEvcG9reS9tZXRhL2xpYi9vZXFhL2NvcmUvZGVjb3JhdG9yL19faW5p
dF9fLnB5IiwgbGluZSAzMiwgaW4gd3JhcHBlZF9mDQogICAgcmV0dXJuIGZ1bmMoKmFyZ3MsICoq
a3dhcmdzKQ0KICBGaWxlICIvbWVkaWEvYnVpbGQxL3Bva3kvbWV0YS9saWIvb2VxYS9zZWxmdGVz
dC9jYXNlcy9kZXZ0b29sLnB5IiwgbGluZSAxMjgyLCBpbiB0ZXN0X2RldnRvb2xfZGVwbG95X3Rh
cmdldA0KICAgIHdpdGggcnVucWVtdSh0ZXN0aW1hZ2UpIGFzIHFlbXU6DQogIEZpbGUgIi91c3Iv
bGliL3B5dGhvbjMuNi9jb250ZXh0bGliLnB5IiwgbGluZSA4MSwgaW4gX19lbnRlcl9fDQogICAg
cmV0dXJuIG5leHQoc2VsZi5nZW4pDQogIEZpbGUgIi9tZWRpYS9idWlsZDEvcG9reS9tZXRhL2xp
Yi9vZXFhL3V0aWxzL2NvbW1hbmRzLnB5IiwgbGluZSAzMjcsIGluIHJ1bnFlbXUNCiAgICBxZW11
ID0gb2VxYS50YXJnZXRjb250cm9sLlFlbXVUYXJnZXQocmVjaXBlZGF0YSwgdGFyZ2V0bG9nZ2Vy
LCBpbWFnZV9mc3R5cGUpDQogIEZpbGUgIi9tZWRpYS9idWlsZDEvcG9reS9tZXRhL2xpYi9vZXFh
L3RhcmdldGNvbnRyb2wucHkiLCBsaW5lIDE0OCwgaW4gX19pbml0X18NCiAgICBsb2dnZXIgPSBs
b2dnZXIpDQpUeXBlRXJyb3I6IF9faW5pdF9fKCkgbWlzc2luZyAxIHJlcXVpcmVkIHBvc2l0aW9u
YWwgYXJndW1lbnQ6ICd1c2Vfc2xpcnAnDQoNCkknbSB0aGVyZWZvcmUgbm90IHN1cmUgaG93IG11
Y2ggdGVzdGluZyB0aGlzIGhhcyBoYWQ/DQoNCkNoZWVycywNCg0KUmljaGFyZA0KDQoNCg==

