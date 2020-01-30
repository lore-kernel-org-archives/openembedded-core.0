Return-Path: <anuj.mittal@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 7E52260D31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 22:45:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jan 2020 14:45:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,382,1574150400"; d="scan'208";a="430184767"
Received: from pgsmsx112-dag.png.intel.com (HELO PGSMSX112.gar.corp.intel.com)
	([10.108.55.234])
	by fmsmga006.fm.intel.com with ESMTP; 30 Jan 2020 14:45:38 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.131]) by
	PGSMSX112.gar.corp.intel.com ([169.254.3.207]) with mapi id
	14.03.0439.000; Fri, 31 Jan 2020 06:45:38 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/5] stress-ng: upgrade 0.10.15 -> 0.10.16
Thread-Index: AQHV0Odpb1RwKzNylkaGTdZ4CumRm6gDVg2A
Date: Thu, 30 Jan 2020 22:45:37 +0000
Message-ID: <2fa3f5b181b91e08037d3662fb48e26589c0a46f.camel@intel.com>
References: <20200122054636.10681-1-anuj.mittal@intel.com>
In-Reply-To: <20200122054636.10681-1-anuj.mittal@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.179.152]
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] stress-ng: upgrade 0.10.15 -> 0.10.16
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <09134C5448F074468B0EE050AFF7A901@intel.com>
Content-Transfer-Encoding: base64

UGluZw0KDQpPbiBXZWQsIDIwMjAtMDEtMjIgYXQgMTM6NDYgKzA4MDAsIEFudWogTWl0dGFsIHdy
b3RlOg0KPiBTaWduZWQtb2ZmLWJ5OiBBbnVqIE1pdHRhbCA8YW51ai5taXR0YWxAaW50ZWwuY29t
Pg0KPiAtLS0NCj4gIC4uLi9zdHJlc3Mtbmcve3N0cmVzcy1uZ18wLjEwLjE1LmJiID0+IHN0cmVz
cy1uZ18wLjEwLjE2LmJifSAgfCA0DQo+ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ICByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3N0cmVzcy1uZy97c3RyZXNzLW5nXzAuMTAuMTUuYmIgPT4NCj4gc3RyZXNzLW5nXzAuMTAuMTYu
YmJ9ICg4MyUpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVz
cy1uZy9zdHJlc3MtbmdfMC4xMC4xNS5iYg0KPiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdHJl
c3Mtbmcvc3RyZXNzLW5nXzAuMTAuMTYuYmINCj4gc2ltaWxhcml0eSBpbmRleCA4MyUNCj4gcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4xMC4x
NS5iYg0KPiByZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3Mt
bmdfMC4xMC4xNi5iYg0KPiBpbmRleCA1NDAyMTMwZmRhLi5lNjdiODJhNTI3IDEwMDY0NA0KPiAt
LS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3RyZXNzLW5nL3N0cmVzcy1uZ18wLjEwLjE1LmJi
DQo+ICsrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTAu
MTYuYmINCj4gQEAgLTgsOCArOCw4IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiDQo+IGZpbGU6Ly9D
T1BZSU5HO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyINCj4gIFNSQ19VUkkg
PSAiDQo+IGh0dHBzOi8va2VybmVsLnVidW50dS5jb20vfmNraW5nL3RhcmJhbGxzLyR7QlBOfS8k
e0JQfS50YXIueHogXA0KPiAgICAgICAgICAgICBmaWxlOi8vMDAwMS1Eby1ub3QtcHJlc2VydmUt
b3duZXJzaGlwLXdoZW4taW5zdGFsbGluZy0NCj4gZXhhbXBsZS1qby5wYXRjaCBcDQo+ICAgICAg
ICAgICAgICINCj4gLVNSQ19VUklbbWQ1c3VtXSA9ICIzMDNhNzI3NmUzYTllM2RkMDNiZTZjYWJj
OWU4NGE3NSINCj4gLVNSQ19VUklbc2hhMjU2c3VtXSA9DQo+ICIxZDBjYThhMmYyODdlMTNjMmQz
NmMwMWU4NzRkMTZkNjdiY2IzNjhkOGQyNjU2MzMyNGM5YWFmMGRkYjEwMGMxIg0KPiArU1JDX1VS
SVttZDVzdW1dID0gImEzMzdjZDViMTQxMmM1M2M1ODBlOTVlZTJhOWZjNzdiIg0KPiArU1JDX1VS
SVtzaGEyNTZzdW1dID0NCj4gImVhYmZmZmNmZmNmNTNlNjc3NjUxODEyODA0NTZjMjA0YWQwMDIx
NDMzOWNmZGIzZWUyNzY5ZDU4YjRhN2UzMDQiDQo+ICANCj4gIERFUEVORFMgPSAiY29yZXV0aWxz
LW5hdGl2ZSINCj4gIA0KPiAtLSANCj4gMi4yMS4xDQo+IA0K

