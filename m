Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3FDE278522
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 21:14:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAHLEVj2026244
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 17 Nov 2017 13:14:32 -0800
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.97]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Fri, 17 Nov 2017 13:14:31 -0800
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] nss: pay attention to CFLAGS
Thread-Index: AQHTXkMf3kOO/2pyMkibT1LD4t5M8qMWXGWAgAK34qA=
Date: Fri, 17 Nov 2017 21:14:31 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84CF45529C@ALA-MBC.corp.ad.wrs.com>
References: <20171115185409.12050-1-jslater@windriver.com>
	<CAMKF1srAN=7-=Tt1MYGW45Qm==UFyCfFs9396NOj1u0LhMSfcQ@mail.gmail.com>
In-Reply-To: <CAMKF1srAN=7-=Tt1MYGW45Qm==UFyCfFs9396NOj1u0LhMSfcQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.157.209]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] nss: pay attention to CFLAGS
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
X-List-Received-Date: Fri, 17 Nov 2017 21:14:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SXQgaXMgaW50ZW50aW9uYWwgdGhhdCBuc3MgdHJpZXMgdG8gY29uZmlndXJlIENGTEFHUyBmb3Ig
dGhlIHBhcnRpY3VsYXIgYnVpbGQgZW52aXJvbm1lbnQuICBBbm90aGVyIGFwcHJvYWNoIHdlIGNv
dWxkIHRha2UgaGVyZSB3b3VsZCBiZSB0byBvbmx5IHB1dCBpbiB0aGUgcHJlZml4LW1hcHBpbmcg
b3B0aW9ucyAoYW5kIC1nKS4NCg0KSm9lDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IEtoZW0gUmFqIFttYWlsdG86cmFqLmtoZW1AZ21haWwuY29tXSANClNlbnQ6IFdlZG5l
c2RheSwgTm92ZW1iZXIgMTUsIDIwMTcgMTE6MzkgQU0NClRvOiBTbGF0ZXIsIEpvc2VwaA0KQ2M6
IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyDQpTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFtvZS1jb3JlXVtQQVRDSCAxLzFdIG5zczogcGF5IGF0dGVudGlvbiB0
byBDRkxBR1MNCg0KT24gV2VkLCBOb3YgMTUsIDIwMTcgYXQgMTA6NTQgQU0sIEpvZSBTbGF0ZXIg
PGpzbGF0ZXJAd2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+IG5zcyBpZ25vcmVzIENGTEFHUyBzbyB3
ZSBzdWdnZXN0IHRoZW0gdmlhIENDLg0KDQppcyB0aGF0IGEgbGltaXRhdGlvbiBvciBpbnRlbnRp
b25hbCBpbiBuc3MgYnVpbGQgc3lzdGVtLg0KDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEpvZSBTbGF0
ZXIgPGpzbGF0ZXJAd2luZHJpdmVyLmNvbT4NCj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9uc3MvbnNzXzMuMzMuYmIgfCA3ICsrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L25zcy9uc3NfMy4zMy5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25zcy9uc3NfMy4z
My5iYg0KPiBpbmRleCBlM2Q0Zjk2Li4wNmQ4MWNlIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9uc3MvbnNzXzMuMzMuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bnNzL25zc18zLjMzLmJiDQo+IEBAIC0xMDQsNyArMTA0LDEyIEBAIGRvX2NvbXBpbGUoKSB7DQo+
ICAgICAgIyBXZSBjYW4gbW9kaWZ5IENDIGluIHRoZSBlbnZpcm9ubWVudCwgYnV0IGlmIHdlIHNl
dCBpdCB2aWEgYW4NCj4gICAgICAjIGFyZ3VtZW50IHRvIG1ha2UsIG5zaW5zdGFsbCwgYSBob3N0
IHByb2dyYW0sIHdpbGwgYWxzbyBidWlsZCB3aXRoIGl0IQ0KPiAgICAgICMNCj4gLSAgICBleHBv
cnQgQ0M9IiR7Q0N9IC1nIg0KPiArICAgICMgbnNzIHByZXR0eSBtdWNoIGRvZXMgaXRzIG93biB0
aGluZyB3aXRoIENGTEFHUywgc28gd2UgcHV0IHRoZW0gaW50byBDQy4NCj4gKyAgICAjIE9wdGlt
aXphdGlvbiB3aWxsIGdldCBjbG9iYmVyZWQsIGJ1dCBtb3N0IG9mIHRoZSBzdHVmZiB3aWxsIHN1
cnZpdmUuDQo+ICsgICAgIyBUaGUgbW90aXZhdGlvbiBmb3IgdGhpcyBpcyB0byBwb2ludCB0byB0
aGUgY29ycmVjdCBwbGFjZSBmb3IgZGVidWcNCj4gKyAgICAjIHNvdXJjZSBmaWxlcyBhbmQgQ0ZM
QUdTIGRvZXMgdGhhdC4gIE5vdGhpbmcgdXNlcyBDQ0MuDQo+ICsgICAgIw0KPiArICAgIGV4cG9y
dCBDQz0iJHtDQ30gJHtDRkxBR1N9Ig0KPiAgICAgIG1ha2UgLUMgLi9uc3MgQ0NDPSIke0NYWH0g
LWciIFwNCj4gICAgICAgICAgT1NfVEVTVD0ke09TX1RFU1R9IFwNCj4gICAgICAgICAgUlBBVEg9
IiR7UlBBVEh9Ig0KPiAtLQ0KPiAyLjcuNA0KPg0KPiAtLQ0KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5n
IGxpc3QNCj4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBodHRw
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1j
b3JlDQo=

