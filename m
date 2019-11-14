Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CD6E27F87E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 01:53:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2019 17:53:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,302,1569308400"; d="scan'208";a="379422354"
Received: from kmsmsx154.gar.corp.intel.com ([172.21.73.14])
	by orsmga005.jf.intel.com with ESMTP; 13 Nov 2019 17:53:30 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.88]) by
	KMSMSX154.gar.corp.intel.com ([169.254.12.98]) with mapi id
	14.03.0439.000; Thu, 14 Nov 2019 09:53:28 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>
Thread-Topic: [OE-core] [PATCH 04/20] OEQA: update ltp runtimes to use new
	structure
Thread-Index: AQHVmo5Psdm3MGTGx0eELvjwqIK2bA==
Date: Thu, 14 Nov 2019 01:53:27 +0000
Message-ID: <311c7903f0bab6d468e88beeb8bf06c5216d753b.camel@intel.com>
References: <cover.1573532188.git.akuster808@gmail.com>
	<d7989c4c53d9d41354b45316063b44b0d3162f2c.1573532188.git.akuster808@gmail.com>
In-Reply-To: <d7989c4c53d9d41354b45316063b44b0d3162f2c.1573532188.git.akuster808@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.16.51]
MIME-Version: 1.0
Subject: Re: [PATCH 04/20] OEQA: update ltp runtimes to use new structure
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
X-List-Received-Date: Thu, 14 Nov 2019 01:53:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1E77181AC606249A3B994A399483D20@intel.com>
Content-Transfer-Encoding: base64

SGkgQXJtaW4NCg0KT24gTW9uLCAyMDE5LTExLTExIGF0IDIwOjMzIC0wODAwLCBBcm1pbiBLdXN0
ZXIgd3JvdGU6DQo+ICAgICAgIyBMVFAgcnVudGltZSB0ZXN0cw0KPiAgICAgIEBPRVRlc3REZXBl
bmRzKFsnc3NoLlNTSFRlc3QudGVzdF9zc2gnXSkNCj4gICAgICBAT0VIYXNQYWNrYWdlKFsibHRw
Il0pDQo+IEBAIC0xMTEsOCArMzQsMTAgQEAgY2xhc3MgTHRwVGVzdChMdHBUZXN0QmFzZSk6DQo+
ICAgICAgQE9FVGVzdERlcGVuZHMoWydsdHAuTHRwVGVzdC50ZXN0X2x0cF9oZWxwJ10pDQo+ICAg
ICAgZGVmIHRlc3RfbHRwX2dyb3VwcyhzZWxmKToNCj4gICAgICAgICAgZm9yIGx0cF9ncm91cCBp
biBzZWxmLmx0cF9ncm91cHM6IA0KPiAtICAgICAgICAgICAgc2VsZi5ydW5sdHAobHRwX2dyb3Vw
KQ0KPiArICAgICAgICAgICAgc2VsZi5jbWQgPSAnL29wdC9sdHAvcnVubHRwIC1mICVzIC1wIC1x
IC1yIC9vcHQvbHRwIC1sDQo+IC9vcHQvbHRwL3Jlc3VsdHMvJXMgLUkgMSAtZCAvb3B0L2x0cCcg
JSAobHRwX2dyb3VwLCBsdHBfZ3JvdXApDQo+ICsgICAgICAgICAgICBzZWxmLnJ1bmx0cChsdHBf
Z3JvdXAsICdsdHByZXN1bHQnKQ0KPiAgDQo+ICAgICAgQE9FVGVzdERlcGVuZHMoWydsdHAuTHRw
VGVzdC50ZXN0X2x0cF9ncm91cHMnXSkNCj4gICAgICBkZWYgdGVzdF9sdHBfcnVubHRwX2N2ZShz
ZWxmKToNCj4gLSAgICAgICAgc2VsZi5ydW5sdHAoImN2ZSIpDQo+ICsgICAgICAgIHNlbGYuY21k
ID0gJy9vcHQvbHRwL3J1bmx0cCAtZiBjdmUgLXAgLXEgLXIgL29wdC9sdHAgLWwNCj4gL29wdC9s
dHAvcmVzdWx0cy9jdmUgLUkgMSAtZCAvb3B0L2x0cCcNCj4gKyAgICAgICAgc2VsZi5ydW5sdHAo
J2N2ZScpDQoNCg0KTG9va3MgbGlrZSB0aGlzIGlzIGNhdXNpbmc6DQoNCk5PVEU6IFJ1bm5pbmcg
dGFzayA3MzEgb2YgNzMxICgvaG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FlbXV4ODYtNjQt
DQpsdHAvYnVpbGQvbWV0YS9yZWNpcGVzLXNhdG8vaW1hZ2VzL2NvcmUtaW1hZ2Utc2F0by5iYjpk
b190ZXN0aW1hZ2UpDQpOT1RFOiByZWNpcGUgY29yZS1pbWFnZS1zYXRvLTEuMC1yMDogdGFzayBk
b190ZXN0aW1hZ2U6IFN0YXJ0ZWQNClRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToN
CiAgRmlsZSAiL2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9xZW11eDg2LTY0LQ0KbHRwL2J1
aWxkL21ldGEvbGliL29lcWEvY29yZS9kZWNvcmF0b3IvX19pbml0X18ucHkiLCBsaW5lIDM2LCBp
bg0Kd3JhcHBlZF9mDQogICAgcmV0dXJuIGZ1bmMoKmFyZ3MsICoqa3dhcmdzKQ0KICBGaWxlICIv
aG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FlbXV4ODYtNjQtDQpsdHAvYnVpbGQvbWV0YS9s
aWIvb2VxYS9ydW50aW1lL2Nhc2VzL2x0cC5weSIsIGxpbmUgMzgsIGluDQp0ZXN0X2x0cF9ncm91
cHMNCiAgICBzZWxmLnJ1bmx0cChsdHBfZ3JvdXAsICdsdHByZXN1bHQnKQ0KVHlwZUVycm9yOiBy
dW5sdHAoKSB0YWtlcyAyIHBvc2l0aW9uYWwgYXJndW1lbnRzIGJ1dCAzIHdlcmUgZ2l2ZW4NCg0K
aHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy85
NS9idWlsZHMvMzI1DQoNClRoYW5rcywNCg0KQW51ag0K

