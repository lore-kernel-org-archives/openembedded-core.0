Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C04E16111E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 08:55:02 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Sep 2013 01:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,913,1371106800"; d="scan'208";a="361004525"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by azsmga001.ch.intel.com with ESMTP; 16 Sep 2013 01:55:03 -0700
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 16 Sep 2013 09:54:01 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.29]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.47]) with mapi id
	14.03.0123.003; Mon, 16 Sep 2013 09:54:00 +0100
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: Ming Liu <ming.liu@windriver.com>
Thread-Topic: [OE-core] [PATCH] openssh: use volatiles for managing
	/var/run/sshd
Thread-Index: AQHOsGEchRQTJHV8n0Kcdf+HBPDBHZnIAx0A
Date: Mon, 16 Sep 2013 08:54:00 +0000
Message-ID: <1379321654.27015.2.camel@firebird.rb.intel.com>
References: <1379063407-31988-1-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1379063407-31988-1-git-send-email-ming.liu@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.73]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: use volatiles for managing /var/run/sshd
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
X-List-Received-Date: Mon, 16 Sep 2013 08:55:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <4418F6C2910B274E98688C33AAE16FA9@intel.com>
Content-Transfer-Encoding: base64

SGkgTWluZywNCg0KT24gRnJpLCAyMDEzLTA5LTEzIGF0IDE3OjEwICswODAwLCBNaW5nIExpdSB3
cm90ZToNCj4gSXQgZml4ZXMgdGhlIGZvbGxvd2luZyBmYWlsdXJlOg0KPiAiZmF0YWw6IE1pc3Np
bmcgcHJpdmlsZWdlIHNlcGFyYXRpb24gZGlyZWN0b3J5OiAvdmFyL3J1bi9zc2hkIg0KPiANCj4g
d2hlbiBzc2hkIGlzIHN0YXJ0ZWQgdGhyb3VnaCB4aW5ldGQuDQoNCldpdGggdGhpcyBwYXRjaCBh
cHBsaWVkLCBvcGVuc3NoIGRvZXNuJ3Qgc3RhcnQgYW55bW9yZSBpbiBzdGFuZGFyZA0KaW1hZ2Vz
IChlLmcuIGNvcmUtaW1hZ2Utc2F0by1zZGspDQoNCnJvb3RAcWVtdXg4Ni02NDp+IyAvZXRjL2lu
aXQuZC9zc2hkIHJlc3RhcnQNCi92YXIvcnVuL3NzaGQgbXVzdCBiZSBvd25lZCBieSByb290IGFu
ZCBub3QgZ3JvdXAgb3Igd29ybGQtd3JpdGFibGUuDQoNCkNoZWVycywNCg0KU3RlZmFuDQoNCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IE1pbmcgTGl1IDxtaW5nLmxpdUB3aW5kcml2ZXIuY29tPg0KPiAt
LS0NCj4gIC4uLi9vcGVuc3NoL29wZW5zc2gtNi4ycDIvdm9sYXRpbGVzLjk5X3NzaGQgICAgICAg
IHwgICAgMSArDQo+ICBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF82
LjJwMi5iYiB8ICAgIDggKysrKysrLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLTYuMnAyL3ZvbGF0aWxlcy45OV9zc2hkDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gt
Ni4ycDIvdm9sYXRpbGVzLjk5X3NzaGQgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5z
c2gvb3BlbnNzaC02LjJwMi92b2xhdGlsZXMuOTlfc3NoZA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiBpbmRleCAwMDAwMDAwLi44NmU3ZjZmDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gtNi4ycDIvdm9sYXRpbGVzLjk5
X3NzaGQNCj4gQEAgLTAsMCArMSBAQA0KPiArZCBzc2hkIHNzaGQgMDc1NSAvdmFyL3J1bi9zc2hk
IG5vbmUNCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9v
cGVuc3NoXzYuMnAyLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5z
c2hfNi4ycDIuYmINCj4gaW5kZXggM2E3ZjUwZC4uYmI1Yzc5ZSAxMDA2NDQNCj4gLS0tIGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfNi4ycDIuYmINCj4gKysrIGIv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfNi4ycDIuYmINCj4gQEAg
LTI5LDcgKzI5LDggQEAgU1JDX1VSSSA9ICJmdHA6Ly9mdHAub3BlbmJzZC5vcmcvcHViL09wZW5C
U0QvT3BlblNTSC9wb3J0YWJsZS9vcGVuc3NoLSR7UFZ9LnRhci4NCj4gICAgICAgICAgICAgJHtA
YmFzZV9jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3BhbScsICcke1BBTV9TUkNfVVJJfScs
ICcnLCBkKX0gXA0KPiAgICAgICAgICAgICBmaWxlOi8vc3NoZC5zb2NrZXQgXA0KPiAgICAgICAg
ICAgICBmaWxlOi8vc3NoZEAuc2VydmljZSBcDQo+IC0gICAgICAgICAgIGZpbGU6Ly9zc2hkZ2Vu
a2V5cy5zZXJ2aWNlICINCj4gKyAgICAgICAgICAgZmlsZTovL3NzaGRnZW5rZXlzLnNlcnZpY2Ug
XA0KPiArICAgICAgICAgICBmaWxlOi8vdm9sYXRpbGVzLjk5X3NzaGQgIg0KPiAgDQo+ICBQQU1f
U1JDX1VSSSA9ICJmaWxlOi8vc3NoZCINCj4gIA0KPiBAQCAtOTIsNiArOTMsOSBAQCBkb19pbnN0
YWxsX2FwcGVuZCAoKSB7DQo+ICAJaW5zdGFsbCAtbSAwNzU1ICR7V09SS0RJUn0vaW5pdCAke0R9
JHtzeXNjb25mZGlyfS9pbml0LmQvc3NoZA0KPiAgCXJtIC1mICR7RH0ke2JpbmRpcn0vc2xvZ2lu
ICR7RH0ke2RhdGFkaXJ9L1NzaC5iaW4NCj4gIAlybWRpciAke0R9JHtsb2NhbHN0YXRlZGlyfS9y
dW4vc3NoZCAke0R9JHtsb2NhbHN0YXRlZGlyfS9ydW4gJHtEfSR7bG9jYWxzdGF0ZWRpcn0NCj4g
KwlpbnN0YWxsIC1kICR7RH0vJHtzeXNjb25mZGlyfS9kZWZhdWx0L3ZvbGF0aWxlcw0KPiArCWlu
c3RhbGwgLW0gNjQ0ICR7V09SS0RJUn0vdm9sYXRpbGVzLjk5X3NzaGQgJHtEfS8ke3N5c2NvbmZk
aXJ9L2RlZmF1bHQvdm9sYXRpbGVzLzk5X3NzaGQNCj4gKw0KPiAgICAgICAgICAjIENyZWF0ZSBj
b25maWcgZmlsZXMgZm9yIHJlYWQtb25seSByb290ZnMNCj4gIAlpbnN0YWxsIC1kICR7RH0ke3N5
c2NvbmZkaXJ9L3NzaA0KPiAgCWluc3RhbGwgLW0gNjQ0ICR7V09SS0RJUn0vc3NoZF9jb25maWcg
JHtEfSR7c3lzY29uZmRpcn0vc3NoL3NzaGRfY29uZmlnX3JlYWRvbmx5DQo+IEBAIC0xMTYsNyAr
MTIwLDcgQEAgUEFDS0FHRVMgPSsgIiR7UE59LWtleWdlbiAke1BOfS1zY3AgJHtQTn0tc3NoICR7
UE59LXNzaGQgJHtQTn0tc2Z0cCAke1BOfS1taXNjICQNCj4gIEZJTEVTXyR7UE59LXNjcCA9ICIk
e2JpbmRpcn0vc2NwLiR7QlBOfSINCj4gIEZJTEVTXyR7UE59LXNzaCA9ICIke2JpbmRpcn0vc3No
LiR7QlBOfSAke3N5c2NvbmZkaXJ9L3NzaC9zc2hfY29uZmlnIg0KPiAgRklMRVNfJHtQTn0tc3No
ZCA9ICIke3NiaW5kaXJ9L3NzaGQgJHtzeXNjb25mZGlyfS9pbml0LmQvc3NoZCINCj4gLUZJTEVT
XyR7UE59LXNzaGQgKz0gIiR7c3lzY29uZmRpcn0vc3NoL21vZHVsaSAke3N5c2NvbmZkaXJ9L3Nz
aC9zc2hkX2NvbmZpZyAke3N5c2NvbmZkaXJ9L3NzaC9zc2hkX2NvbmZpZ19yZWFkb25seSINCj4g
K0ZJTEVTXyR7UE59LXNzaGQgKz0gIiR7c3lzY29uZmRpcn0vc3NoL21vZHVsaSAke3N5c2NvbmZk
aXJ9L3NzaC9zc2hkX2NvbmZpZyAke3N5c2NvbmZkaXJ9L3NzaC9zc2hkX2NvbmZpZ19yZWFkb25s
eSAke3N5c2NvbmZkaXJ9L2RlZmF1bHQvdm9sYXRpbGVzLzk5X3NzaGQiDQo+ICBGSUxFU18ke1BO
fS1zZnRwID0gIiR7YmluZGlyfS9zZnRwIg0KPiAgRklMRVNfJHtQTn0tc2Z0cC1zZXJ2ZXIgPSAi
JHtsaWJleGVjZGlyfS9zZnRwLXNlcnZlciINCj4gIEZJTEVTXyR7UE59LW1pc2MgPSAiJHtiaW5k
aXJ9L3NzaCogJHtsaWJleGVjZGlyfS9zc2gqIg0KDQo=

