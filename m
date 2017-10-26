Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8A4A478145
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 20:51:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9QKpM2p001209
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 Oct 2017 13:51:22 -0700 (PDT)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.180]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Thu, 26 Oct 2017 13:51:21 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] qemumips64: no qemu-usermode
	for n32
Thread-Index: AQHTTR8s0kMOz2Cf2U6eCCrAriSAYqL0Hs0AgADBOoCAAGWwgP//m4+ggAF+TSOAAIanAP//tZlg
Date: Thu, 26 Oct 2017 20:51:20 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84CF438A56@ALA-MBC.corp.ad.wrs.com>
References: <20171024232359.63328-1-jslater@windriver.com>
	<CAJ86T=V_Miu6Ui_zBOWzKRtPTbv6HE_O3B_Y5swmzRap2JgaAw@mail.gmail.com>
	<52a0c834-6e5f-3bbc-7e99-206607dab4a4@linux.intel.com>
	<CAJ86T=UV_XVjq6SEvc_9-46b1W+N_v6aBjvJOEorov5NYpTLcQ@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84CF437C9D@ALA-MBC.corp.ad.wrs.com>
	<007BD92917A2324FA403BCF9A464CF84CF43876F@ALA-MBC.corp.ad.wrs.com>
	<CAJ86T=XbzgBuJgs4s=8MphbTM4OLU5JqBA_pL7ABCkM49u80vA@mail.gmail.com>
In-Reply-To: <CAJ86T=XbzgBuJgs4s=8MphbTM4OLU5JqBA_pL7ABCkM49u80vA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.157.209]
MIME-Version: 1.0
Cc: OE Core mailing
 list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qemumips64: no qemu-usermode for n32
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
X-List-Received-Date: Thu, 26 Oct 2017 20:51:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSB0aGluayB2YWx1ZXMgZm9yIHRoZSBCQUNLRklMTF9DT05TSURFUkVEIGNhbiBiZSB1c2VkLCBi
dXQgb25seSBpZiB0aGV5IGFyZSBsaXRlcmFscy4gIEkgZG9uJ3QgdGhpbmsgYW55IHZhcmlhYmxl
IGV4cGFuc2lvbiBvY2N1cnMgd2hlbiBnZXRWYXIoKSBpcyB1c2VkIGF0IHRoZSBwb2ludCBvZiBi
YWNrZmlsbGluZy4gIEkgdGhpbmsgdGhlIGEgYmV0dGVyIHdheSBvZiBzZXR0aW5nIE1BQ0hJTkUg
b3IgRElTVFJPX0ZFQVRVUkVTIHdvdWxkIGJlIHRvIGRpcmVjdGx5IGFwcGVuZC9yZW1vdmUgIHVz
aW5nIG92ZXJyaWRlcy4gIEluIGFueSBjYXNlLCBJIGRvIG5vdCBiZWxpZXZlIGFueSBvZiB0aGUg
Q09OU0lERVJFRCBkZWZpbml0aW9ucyB3b3JrLg0KDQpKb2UNCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IEFuZHJlIE1jQ3VyZHkgW21haWx0bzphcm1jY3VyZHlAZ21haWwuY29t
XSANClNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDI2LCAyMDE3IDExOjA5IEFNDQpUbzogU2xhdGVy
LCBKb3NlcGgNCkNjOiBBbGV4YW5kZXIgS2FuYXZpbjsgT0UgQ29yZSBtYWlsaW5nIGxpc3QNClN1
YmplY3Q6IFJlOiBbT0UtY29yZV0gW29lLWNvcmVdW1BBVENIIDEvMV0gcWVtdW1pcHM2NDogbm8g
cWVtdS11c2VybW9kZSBmb3IgbjMyDQoNCk9uIFRodSwgT2N0IDI2LCAyMDE3IGF0IDEwOjE1IEFN
LCBTbGF0ZXIsIEpvc2VwaCA8am9lLnNsYXRlckB3aW5kcml2ZXIuY29tPiB3cm90ZToNCj4gT2th
eSwgSSBkb24ndCBrbm93IHdoeSwgYnV0IGF0IHRoZSB0aW1lIG9mIGJhY2tmaWxsaW5nIHRoZSBD
T05TSURFUkVEIGxpc3QgaXMgZW1wdHkhICBUaGlzIGlzIG5vdCB0cnVlIGlmIEkgdXNlICI9IiB0
byBzZXQgaXQgdW5jb25kaXRpb25hbGx5IGluIGFyY2gtbWlwcy5pbmMsIGJ1dCBpdCBJUyB0cnVl
IGlmIEkgdHJ5IHRvIHNldCBpdCB2aWEgYW55dGhpbmcgaW52b2x2aW5nIGFuIG92ZXJyaWRlIChp
bmNsdWRpbmcgYXBwZW5kKS4NCj4NCj4gSXNuJ3QgZ2V0VmFyKCkgc3VwcG9zZWQgdG8gZXhwYW5k
IHRoZSB2YXJpYWJsZT8gIFB1dCBwcmludCBtc2cncyBpbiBtZXRhL2xpYi9vZS91dGlscy5weSB0
byBzZWUgdGhpcyBiZWhhdmlvci4NCg0KZmVhdHVyZXNfYmFja2ZpbGwoKSBpcyBjYWxsZWQgZnJv
bSBtZXRhL2NsYXNzZXMvYmFzZS5iYmNsYXNzIC0+DQpiYXNlX2V2ZW50aGFuZGxlcigpIGluIHJl
c3BvbnNlIHRvIGJiLmV2ZW50LkNvbmZpZ1BhcnNlZCAoaWUgIndoZW4gdGhlIGJhc2UgY29uZmln
dXJhdGlvbjsgd2hpY2ggY29uc2lzdHMgb2YgYml0YmFrZS5jb25mLCBiYXNlLmJiY2xhc3MgYW5k
IGFueSBnbG9iYWwgSU5IRVJJVCBzdGF0ZW1lbnRzOyBoYXMgYmVlbiBwYXJzZWQiKSBzbyBhbnl0
aGluZyBhc3NpZ25lZCB0byBESVNUUk9fRkVBVFVSRVNfQkFDS0ZJTExfQ09OU0lERVJFRCBvciBN
QUNISU5FX0ZFQVRVUkVTX0JBQ0tGSUxMX0NPTlNJREVSRUQgYWZ0ZXIgdGhhdCBldmVudCB3b24n
dCBiZSBzZWVuLi4uDQo=

