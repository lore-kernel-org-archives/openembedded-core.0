Return-Path: <jose.perez.carranza@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DECE160620
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 22:04:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 09 Nov 2016 14:04:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,615,1473145200"; d="scan'208";a="1083047398"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
	by fmsmga002.fm.intel.com with ESMTP; 09 Nov 2016 14:04:39 -0800
Received: from fmsmsx102.amr.corp.intel.com (10.18.124.200) by
	fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Wed, 9 Nov 2016 14:04:39 -0800
Received: from fmsmsx101.amr.corp.intel.com ([169.254.1.27]) by
	FMSMSX102.amr.corp.intel.com ([169.254.10.34]) with mapi id
	14.03.0248.002; Wed, 9 Nov 2016 14:04:38 -0800
From: "Perez Carranza, Jose" <jose.perez.carranza@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
Thread-Topic: krogoth 2.1.2 status
Thread-Index: AQHSOoUROU4BtORkUUKK7D12UEegP6DRJvBA
Date: Wed, 9 Nov 2016 22:04:38 +0000
Message-ID: <0A5D9A624DF90343892F8F3FE7DE525A0205D3B3@fmsmsx101.amr.corp.intel.com>
References: <1478694607.23123.176.camel@linuxfoundation.org>
In-Reply-To: <1478694607.23123.176.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOGU1N2Q0YWUtNmJhZC00YmIyLWJmMzUtMDgxZDZmZGZjNjM3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6IkZnbzI4cG5UU3pvRFBlZzF5MGFzTXBnK2JDVlZwZlQ5VCtXN1BVNHlHSFk9In0=
x-originating-ip: [10.1.200.106]
MIME-Version: 1.0
Subject: Re: krogoth 2.1.2 status
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
X-List-Received-Date: Wed, 09 Nov 2016 22:04:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgDQoNCkJhc2VkIG9uIGJlbG93IGNvbW1lbnRzIHdlIHdpbGwgc3RhcnQgdGhlIFFBIGN5Y2xl
IGZvciAyLjEuMiwgd2Ugd2lsbCBzdGFydCB0b21vcnJvdyBvbmNlIHRoZSBRQSBjeWNsZSBmb3Ig
bWV0YS1pbnRlbCBpcyBmaW5pc2hlZC4gDQoNClJlZ2FyZHMsDQpKb3PDqQ0KDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQu
cHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddIA0KU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciA5
LCAyMDE2IDY6MzAgQU0NClRvOiBvcGVuZW1iZWRkZWQtY29yZSA8b3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZz47IEFybWluIEt1c3RlciA8YWt1c3RlcjgwOEBnbWFpbC5j
b20+DQpDYzogUGVyZXogQ2FycmFuemEsIEpvc2UgPGpvc2UucGVyZXouY2FycmFuemFAaW50ZWwu
Y29tPjsgSm9sbGV5LCBTdGVwaGVuIEsgPHN0ZXBoZW4uay5qb2xsZXlAaW50ZWwuY29tPjsgRGVs
Z2FkbywgU29uaWEgPHNvbmlhLmRlbGdhZG9AaW50ZWwuY29tPg0KU3ViamVjdDoga3JvZ290aCAy
LjEuMiBzdGF0dXMNCg0KSSByYW4gYSBrcm9nb3RoIDIuMS4yIGJ1aWxkLiBJdCBkaWQgaGF2ZSBz
b21lIGlzc3VlczoNCg0KKiBvbmUgcnVudGltZSBzYW5pdHkgdGVzdCBoYWQgYSB0aW1lb3V0IGlz
c3VlDQoqIHNvbWUgdXJscyBhcmUgc3RhbGUgKHBlcnBldHVhbCBwcm9ibGVtKQ0KKiBtdXNsIHJ1
bnRpbWUgdGVzdGluZyBmYWlscyAobmV2ZXIgdGVzdGVkIG9uIGtyb2dvdGggcHJldmlvdXNseSkN
Ciogbm8teDExIHJ1bnRpbWUgdGVzdGluZyBoYWQgYSBmYWlsdXJlIChuZXZlciB0ZXN0ZWQgb24g
a3JvZ290aA0KcHJldmlvdXNseSkNCg0KSSBzdXNwZWN0IHdlIGNhbiBjYWxsIHRoaXMgZ29vZCBl
bm91Z2ggdG8gcHV0IGludG8gUUEgYnV0IHRoZXJlIHdlcmUgZW5vdWdoICdmYWlsdXJlcycgSSB3
YW50ZWQgdG8gc2VuZCB0aGlzIG91dCBpbiBjYXNlIHNvbWVvbmUgb2JqZWN0cy4NCg0KUGFydCBv
ZiB0aGUgcHJvYmxlbSBoZXJlIGlzIHdlIGFwcGx5IG91ciBjdXJyZW50IGF1dG9idWlsZGVyIHRl
c3Qgc2V0dXAgdG8gdGhlIG9sZGVyIHJlbGVhc2VzIGFzIHdlbGwuIEknbSBhd2FyZSB0aGVyZSBt
YXkgYmUgYmV0dGVyIHdheXMgdG8gZG8gdGhpcyBidXQgSSBkb24ndCBrbm93IGFueW9uZSB3aXRo
IHRpbWUgdG8gd29yayBvbiB0aGF0LCB3ZSBoYXZlIG90aGVyIG1vcmUgcHJlc3NpbmcgcHJvYmxl
bXMuDQoNCkNoZWVycywNCg0KUmljaGFyZA0KDQo=

