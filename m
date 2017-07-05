Return-Path: <wei.tee.ng@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4C04660123
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 01:03:47 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jul 2017 18:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,309,1496127600"; d="scan'208";a="282152504"
Received: from pgsmsx103.gar.corp.intel.com ([10.221.44.82])
	by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2017 18:03:45 -0700
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.183]) by
	PGSMSX103.gar.corp.intel.com ([10.221.43.235]) with mapi id
	14.03.0319.002; Wed, 5 Jul 2017 09:03:44 +0800
From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH v2 1/3] initramfs-framework: udev: Add a
	runtime dependency on udev-extraconf
Thread-Index: AQHS9DllXz1+lu0qO0+IBeNrRM7Jx6JC2c0AgABQZQCAAUB7AA==
Date: Wed, 5 Jul 2017 01:03:45 +0000
Message-ID: <CBAEED2EB06BF94889E80B47A33FE329ED6E35@PGSMSX105.gar.corp.intel.com>
References: <cover.1498782014.git.wei.tee.ng@intel.com>
	<340dcd3ae5be23d6f1395d4f8bb6fd25f7a95c6e.1498782014.git.wei.tee.ng@intel.com>
	<CAP9ODKoZ48A6Qp1TEvvt2mwE-LEvArjTEQim=FHE9ksvCG1U2w@mail.gmail.com>
	<CBAEED2EB06BF94889E80B47A33FE329ED6B5E@PGSMSX105.gar.corp.intel.com>
	<CAP9ODKo2hNUgt1VioyhK6Y=s-qp+bcXH1R17hWzG6yGEkUY67w@mail.gmail.com>
In-Reply-To: <CAP9ODKo2hNUgt1VioyhK6Y=s-qp+bcXH1R17hWzG6yGEkUY67w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] initramfs-framework: udev: Add a runtime dependency on udev-extraconf
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
X-List-Received-Date: Wed, 05 Jul 2017 01:03:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgDQoNClRoZSBleGlzdGluZyBsaXZlLWJvb3QgcGFja2FnZSBpcyBjb25zaXN0cyBvZiB1ZGV2
IGFuZCB1ZGV2LWV4dHJhY29uZi4gKGh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2Nn
aXQuY2dpL3Bva3kvdHJlZS9tZXRhL3JlY2lwZXMtY29yZS9pbml0cmRzY3JpcHRzL2luaXRyYW1m
cy1saXZlLWJvb3RfMS4wLmJiICkgTm93IEkgYW0gd29ya2luZyBvbiBpbnRlZ3JhdGUgdGhpcyBp
bnRvIHRoZSBpbml0cmFtZnMtZnJhbWV3b3JrIG1vZGVsLiBCZWNhdXNlIHdoZW4gaXQgaXMgdXNp
bmcgdGhlIGluaXRyYW1mcy1mcmFtZXdvcmsgbWV0aG9kLCB0aGUgaW1hZ2UgY291bGQgbm90IGF1
dG9tb3VudCAgd2hpY2ggZGVwZW5kcyBvbiB1ZGV2LWV4dHJhY29uZi4gVGhlcmVmb3JlLCBJIGFk
ZGVkIHRoZSBydW50aW1lIGRlcGVuZGVuY3kgb24gdWRldi1leHRyYWNvbmYgaW4gbXkgcmVjaXBl
IGZpbGUgKGh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3Bva3kvdHJl
ZS9tZXRhL3JlY2lwZXMtY29yZS9pbml0cmRzY3JpcHRzL2luaXRyYW1mcy1mcmFtZXdvcmtfMS4w
LmJiICkgIHRvIGluY2x1ZGUgdGhlIHNhbWUgZmVhdHVyZXMgYXMgdGhlIGxpdmUtYm9vdCBwYWNr
YWdlLiANCg0KUGxlYXNlIGNvcnJlY3QgaXQgaWYgSSBnZXQgaXQgd3JvbmcuIA0KDQpSZWdhcmRz
LA0KV2VpIFRlZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogT3RhdmlvIFNh
bHZhZG9yIFttYWlsdG86b3RhdmlvLnNhbHZhZG9yQG9zc3lzdGVtcy5jb20uYnJdIA0KU2VudDog
VHVlc2RheSwgSnVseSA0LCAyMDE3IDk6NTAgUE0NClRvOiBOZywgV2VpIFRlZSA8d2VpLnRlZS5u
Z0BpbnRlbC5jb20+DQpDYzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNv
cmUgbGF5ZXIgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCB2MiAxLzNdIGluaXRyYW1mcy1mcmFtZXdvcms6IHVk
ZXY6IEFkZCBhIHJ1bnRpbWUgZGVwZW5kZW5jeSBvbiB1ZGV2LWV4dHJhY29uZg0KDQpPbiBNb24s
IEp1bCAzLCAyMDE3IGF0IDEwOjExIFBNLCBOZywgV2VpIFRlZSA8d2VpLnRlZS5uZ0BpbnRlbC5j
b20+IHdyb3RlOg0KPiBZZXMsIGl0J3MgbWFpbmx5IHRvIHN1cHBvcnQgdGhlIGxpdmUgYm9vdCBp
bWFnZS4gVGhlcmVmb3JlIHRoZSB1ZGV2LWV4dHJhY29uZiBpcyBiZWluZyBhZGRlZCBpbiB0aGUg
cmRlcGVuZHMuDQo+IFRoZSB3cm9uZyB0aGF0IHlvdSBtZW50aW9uZWQgaXMgYmVjYXVzZSBvZiB0
aGUgY29tbWl0IG1lc3NhZ2Ugd2FzIG5vdCBjb252ZXkgaW4gdGhlIGNvcnJlY3Qgd2F5Pw0KPiBU
aGUgaW5pdHJhbWZzLWZyYW1ld29yayBjdXJyZW50bHkgaXMgbm90IGhhbmRsaW5nIGxpdmUgYm9v
dCBzdXBwb3J0LiBQZXJoYXBzLCAiSW4gb3JkZXIgdG8gaW1wbGVtZW50IGluaXRyYW1mcy1mcmFt
ZXdvcmsgZm9yIGxpdmUgYm9vdCBzdXBwb3J0IiB3aWxsIGJlIGJldHRlcj8NCg0KTW92ZSBpdCB0
byBsaXZlLWJvb3QgcGFja2FnZSByZGVwZW5kcy4NCg0KSSBkb24ndCB3YW50IGF1dG9tb3VudCB3
aGVuIGFkZGluZyB1ZGV2IG9ubHkgaXQgc2VlbXMgd3JvbmcuDQoNCi0tIA0KT3RhdmlvIFNhbHZh
ZG9yICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPLlMuIFN5c3RlbXMNCmh0dHA6Ly93d3cu
b3NzeXN0ZW1zLmNvbS5iciAgICAgICAgaHR0cDovL2NvZGUub3NzeXN0ZW1zLmNvbS5icg0KTW9i
aWxlOiArNTUgKDUzKSA5OTgxLTc4NTQgICAgICAgICAgICBNb2JpbGU6ICsxICgzNDcpIDkwMy05
NzUwDQo=

