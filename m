Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 746B37CD17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 01:41:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Mar 2019 18:41:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,468,1544515200"; d="scan'208";a="133264093"
Received: from kmsmsx154.gar.corp.intel.com ([172.21.73.14])
	by orsmga003.jf.intel.com with ESMTP; 11 Mar 2019 18:41:19 -0700
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.121]) by
	KMSMSX154.gar.corp.intel.com ([169.254.12.175]) with mapi id
	14.03.0415.000; Tue, 12 Mar 2019 09:41:18 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] [PATCH] linux-yocto/5.0: fix system tap for arm
Thread-Index: AQHU17zva7+l6f7fpUGCH+UJEdSBeKYGs8cA
Date: Tue, 12 Mar 2019 01:41:18 +0000
Message-ID: <682c60768727b20cd0ff14a2765dc60775116243.camel@intel.com>
References: <20190311034537.7190-1-bruce.ashfield@gmail.com>
In-Reply-To: <20190311034537.7190-1-bruce.ashfield@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.22.38]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto/5.0: fix system tap for arm
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
X-List-Received-Date: Tue, 12 Mar 2019 01:41:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC4A2451B7C80F46AFD6E2175CB48C42@intel.com>
Content-Transfer-Encoding: base64

T24gU3VuLCAyMDE5LTAzLTEwIGF0IDIzOjQ1IC0wNDAwLCBicnVjZS5hc2hmaWVsZEBnbWFpbC5j
b20gd3JvdGU6DQo+IC1TUkNSRVZfbWFjaGluZV9xZW11YXJtID89ICIxZmJlY2FkMGU2YTY4YjZj
NTdiNGY2ZWY4MjA3ZTdlOTBlYTc2NGEzIg0KPiAtU1JDUkVWX21hY2hpbmVfcWVtdWFybTY0ID89
DQo+ICIxYTBkYTdlNTBiNzdjODI4NDFlZmI1MDFjNjQ4ZGJhY2E2OTllYWMyIg0KPiAtU1JDUkVW
X21hY2hpbmVfcWVtdW1pcHMgPz0NCj4gImQ5ZGQ2ZDRjZmU2ODllZmQ1Y2I3YmJhY2QxMThhMzg4
OGFjN2M1MTciDQo+IC1TUkNSRVZfbWFjaGluZV9xZW11cHBjID89ICIxYTBkYTdlNTBiNzdjODI4
NDFlZmI1MDFjNjQ4ZGJhY2E2OTllYWMyIg0KPiAtU1JDUkVWX21hY2hpbmVfcWVtdXg4NiA/PSAi
MWEwZGE3ZTUwYjc3YzgyODQxZWZiNTAxYzY0OGRiYWNhNjk5ZWFjMiINCj4gLVNSQ1JFVl9tYWNo
aW5lX3FlbXV4ODYtNjQgPz0NCj4gIjFhMGRhN2U1MGI3N2M4Mjg0MWVmYjUwMWM2NDhkYmFjYTY5
OWVhYzIiDQo+IC1TUkNSRVZfbWFjaGluZV9xZW11bWlwczY0ID89DQo+ICI1ZjA3MjQ0NTEyNmU2
YTllNDRmOTQzNWE1NTJmNGZjZjZmYzE1NDk5Ig0KPiAtU1JDUkVWX21hY2hpbmUgPz0gIjFhMGRh
N2U1MGI3N2M4Mjg0MWVmYjUwMWM2NDhkYmFjYTY5OWVhYzIiDQo+IC1TUkNSRVZfbWV0YSA/PSAi
NGZhYTQ0MTk4ODRkMmJiZTY1ZjYzN2JlZmQ3MWExZTk1NjI5ZWFhZSINCj4gK1NSQ1JFVl9tYWNo
aW5lX3FlbXVhcm0gPz0gIjIzYjUzODA3M2ZkYzgwM2IwYTc0OWRlNzc2Nzc1MDg2NzFlMjQ2YWYi
DQo+ICtTUkNSRVZfbWFjaGluZV9xZW11YXJtNjQgPz0NCj4gIjM3YzhmMmEzZGYxZTMxNTQwODc1
MzhhMjcyMjhmYWQwYzZlMTcyYzUiDQo+ICtTUkNSRVZfbWFjaGluZV9xZW11bWlwcyA/PQ0KPiAi
NTBiNWI3MDlhYzZiMWQxNGFjODE1ZjlhMDAyYzUwYTE5NjMwNmIwMiINCj4gK1NSQ1JFVl9tYWNo
aW5lX3FlbXVwcGMgPz0gIjM3YzhmMmEzZGYxZTMxNTQwODc1MzhhMjcyMjhmYWQwYzZlMTcyYzUi
DQo+ICtTUkNSRVZfbWFjaGluZV9xZW11eDg2ID89ICIzN2M4ZjJhM2RmMWUzMTU0MDg3NTM4YTI3
MjI4ZmFkMGM2ZTE3MmM1Ig0KPiArU1JDUkVWX21hY2hpbmVfcWVtdXg4Ni02NCA/PQ0KPiAiMzdj
OGYyYTNkZjFlMzE1NDA4NzUzOGEyNzIyOGZhZDBjNmUxNzJjNSINCj4gK1NSQ1JFVl9tYWNoaW5l
X3FlbXVtaXBzNjQgPz0NCj4gIjgzMjI1MTViYTdhODU4YzQ3Mzg2Yjk1YzZlNzIwMWM4YTNhNDEx
NzUiDQo+ICtTUkNSRVZfbWFjaGluZSA/PSAiMzdjOGYyYTNkZjFlMzE1NDA4NzUzOGEyNzIyOGZh
ZDBjNmUxNzJjNSINCj4gK1NSQ1JFVl9tZXRhID89ICI4ZmJkMTE5YmQ5NTQ0NDNiMWNhZTQ5NmQ3
Nzk3YzQ1OGZhYTAyNDk1Ig0KDQpMb29rcyBsaWtlIHRoZXNlIGNvbW1pdHMgd2VyZW4ndCBhY3R1
YWxseSBwdXNoZWQuDQoNCkkgc3RpbGwgc2VlIDFhMGRhN2U1MCBhcyB0aGUgbGF0ZXN0IG9uIHY1
LjAvc3RhbmRhcmQvYmFzZSBhbmQgdGhpcyBpcw0KcmVzdWx0aW5nIGluIGZhaWx1cmVzIGZvciBt
YXN0ZXItbmV4dCBvbiBhdXRvYnVpbGRlciAuLi4NCg0KVGhhbmtzLA0KQW51ag0K

