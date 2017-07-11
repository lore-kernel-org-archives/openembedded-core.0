Return-Path: <wei.tee.ng@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5EE3D7772F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 05:36:01 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jul 2017 22:36:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,344,1496127600"; d="scan'208";a="123640062"
Received: from pgsmsx106.gar.corp.intel.com ([10.221.44.98])
	by orsmga005.jf.intel.com with ESMTP; 10 Jul 2017 22:36:01 -0700
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.183]) by
	PGSMSX106.gar.corp.intel.com ([10.221.44.98]) with mapi id
	14.03.0319.002; Tue, 11 Jul 2017 13:35:59 +0800
From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH v3 2/2] initramfs-framwork: module to support
	boot live image
Thread-Index: AQHS+aQG73ibKdmvNkG0I/VrqzSsk6JOG1ag
Date: Tue, 11 Jul 2017 05:36:00 +0000
Message-ID: <CBAEED2EB06BF94889E80B47A33FE329ED9C42@PGSMSX105.gar.corp.intel.com>
References: <cover.1499294682.git.wei.tee.ng@intel.com>
	<ee38977370db92520a2e0d81e76189be3661f787.1499294682.git.wei.tee.ng@intel.com>
	<CAP9ODKrfpfKumQpxZgyr46yZtNk08q12WfNYM73E+sn96CTx=w@mail.gmail.com>
In-Reply-To: <CAP9ODKrfpfKumQpxZgyr46yZtNk08q12WfNYM73E+sn96CTx=w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: "Wold, Saul" <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/2] initramfs-framwork: module to support boot live image
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
X-List-Received-Date: Tue, 11 Jul 2017 05:36:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCBJIGhhZCBzcXVhc2ggdGhlIGNoYW5nZXMgaW50byBhIHNpbmdsZSBjb21taXQgYW5kIGNv
cnJlY3RlZCB0aGUgdHlwbyBhbHNvLiBUaGUgY2hhbmdlcyBpcyBiZWluZyBzdWJtaXR0ZWQgdG8g
dGhlIG1haWxpbmcgbGlzdC4NClRoYW5rcyBhIGxvdCENCg0KUmVnYXJkcywNCldlaSBUZWUgDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBPdGF2aW8gU2FsdmFkb3IgW21haWx0
bzpvdGF2aW8uc2FsdmFkb3JAb3NzeXN0ZW1zLmNvbS5icl0gDQpTZW50OiBUdWVzZGF5LCBKdWx5
IDExLCAyMDE3IDE6NDMgQU0NClRvOiBOZywgV2VpIFRlZSA8d2VpLnRlZS5uZ0BpbnRlbC5jb20+
DQpDYzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXIgPG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+OyBXb2xkLCBTYXVsIDxzYXVs
LndvbGRAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjMgMi8yXSBp
bml0cmFtZnMtZnJhbXdvcms6IG1vZHVsZSB0byBzdXBwb3J0IGJvb3QgbGl2ZSBpbWFnZQ0KDQpP
biBUaHUsIEp1bCA2LCAyMDE3IGF0IDM6MjggUE0sICA8d2VpLnRlZS5uZ0BpbnRlbC5jb20+IHdy
b3RlOg0KPiBGcm9tOiAiTmcsIFdlaSBUZWUiIDx3ZWkudGVlLm5nQGludGVsLmNvbT4NCj4NCj4g
c2V0dXAtbGl2ZSBtb2R1bGUgaXMgYSBuZXcgbW9kdWxlIGJlaW5nIGludHJvZHVjZWQgdG8gaW50
ZWdyYXRlIHRoZSANCj4gZnVuY3Rpb25hbGl0eSBvZiBpbml0LWxpdmUuc2ggaW50byBuZXcgc2Ny
aXB0bGV0IGluIG9yZGVyIHRvIHN1cHBvcnQgDQo+IHRoZSBsaXZlIGJvb3QgaW1hZ2UuIFRoZSB1
ZGV2LWV4dHJhY29uZiByZGVwZW5kcyBpcyBiZWluZyBhZGRlZCB0byANCj4gcGVyZm9ybSBhdXRv
bW91bnRpbmcuIEl0IGdldHMgdG8gcnVuIGJlZm9yZSB0aGUgcm9vdGZzIGFuZCBmaW5pc2ggDQo+
IG1vZHVsZS4NCj4NCj4gW1lPQ1RPICMxMTcwMV0NCj4NCj4gU2lnbmVkLW9mZi1ieTogTmcsIFdl
aSBUZWUgPHdlaS50ZWUubmdAaW50ZWwuY29tPg0KDQpJIHRoaW5rIHRoaXMgcGF0Y2ggY291bGQg
YmUgc3F1YXNoZWQgb250byB0aGUgZmlyc3QgYXMgaXQgaXMgcmVxdWlyZWQgZm9yIGl0IHRvIHdv
cmsuDQoNCi0tIA0KT3RhdmlvIFNhbHZhZG9yICAgICAgICAgICAgICAgICAgICAgICAgICAgICBP
LlMuIFN5c3RlbXMNCmh0dHA6Ly93d3cub3NzeXN0ZW1zLmNvbS5iciAgICAgICAgaHR0cDovL2Nv
ZGUub3NzeXN0ZW1zLmNvbS5icg0KTW9iaWxlOiArNTUgKDUzKSA5OTgxLTc4NTQgICAgICAgICAg
ICBNb2JpbGU6ICsxICgzNDcpIDkwMy05NzUwDQo=

