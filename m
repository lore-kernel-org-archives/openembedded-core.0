Return-Path: <wei.tee.ng@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 794BD607A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 01:11:54 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 03 Jul 2017 18:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,306,1496127600"; d="scan'208";a="120523276"
Received: from kmsmsx151.gar.corp.intel.com ([172.21.73.86])
	by orsmga005.jf.intel.com with ESMTP; 03 Jul 2017 18:11:54 -0700
Received: from pgsmsx110.gar.corp.intel.com (10.221.44.111) by
	KMSMSX151.gar.corp.intel.com (172.21.73.86) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Tue, 4 Jul 2017 09:11:53 +0800
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.183]) by
	PGSMSX110.gar.corp.intel.com ([10.221.44.111]) with mapi id
	14.03.0319.002; Tue, 4 Jul 2017 09:11:53 +0800
From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH v2 1/3] initramfs-framework: udev: Add a
	runtime dependency on udev-extraconf
Thread-Index: AQHS9DllXz1+lu0qO0+IBeNrRM7Jx6JC2c0A
Date: Tue, 4 Jul 2017 01:11:53 +0000
Message-ID: <CBAEED2EB06BF94889E80B47A33FE329ED6B5E@PGSMSX105.gar.corp.intel.com>
References: <cover.1498782014.git.wei.tee.ng@intel.com>
	<340dcd3ae5be23d6f1395d4f8bb6fd25f7a95c6e.1498782014.git.wei.tee.ng@intel.com>
	<CAP9ODKoZ48A6Qp1TEvvt2mwE-LEvArjTEQim=FHE9ksvCG1U2w@mail.gmail.com>
In-Reply-To: <CAP9ODKoZ48A6Qp1TEvvt2mwE-LEvArjTEQim=FHE9ksvCG1U2w@mail.gmail.com>
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
X-List-Received-Date: Tue, 04 Jul 2017 01:11:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCBpdCdzIG1haW5seSB0byBzdXBwb3J0IHRoZSBsaXZlIGJvb3QgaW1hZ2UuIFRoZXJlZm9y
ZSB0aGUgdWRldi1leHRyYWNvbmYgaXMgYmVpbmcgYWRkZWQgaW4gdGhlIHJkZXBlbmRzLg0KVGhl
IHdyb25nIHRoYXQgeW91IG1lbnRpb25lZCBpcyBiZWNhdXNlIG9mIHRoZSBjb21taXQgbWVzc2Fn
ZSB3YXMgbm90IGNvbnZleSBpbiB0aGUgY29ycmVjdCB3YXk/DQpUaGUgaW5pdHJhbWZzLWZyYW1l
d29yayBjdXJyZW50bHkgaXMgbm90IGhhbmRsaW5nIGxpdmUgYm9vdCBzdXBwb3J0LiBQZXJoYXBz
LCAiSW4gb3JkZXIgdG8gaW1wbGVtZW50IGluaXRyYW1mcy1mcmFtZXdvcmsgZm9yIGxpdmUgYm9v
dCBzdXBwb3J0IiB3aWxsIGJlIGJldHRlcj8NCg0KUmVnYXJkcywNCldlaSBUZWUNCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE90YXZpbyBTYWx2YWRvciBbbWFpbHRvOm90YXZp
by5zYWx2YWRvckBvc3N5c3RlbXMuY29tLmJyXSANClNlbnQ6IFR1ZXNkYXksIEp1bHkgNCwgMjAx
NyA0OjE3IEFNDQpUbzogTmcsIFdlaSBUZWUgPHdlaS50ZWUubmdAaW50ZWwuY29tPg0KQ2M6IFBh
dGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyIDxvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBb
UEFUQ0ggdjIgMS8zXSBpbml0cmFtZnMtZnJhbWV3b3JrOiB1ZGV2OiBBZGQgYSBydW50aW1lIGRl
cGVuZGVuY3kgb24gdWRldi1leHRyYWNvbmYNCg0KT24gVGh1LCBKdW4gMjksIDIwMTcgYXQgOToz
MCBQTSwgIDx3ZWkudGVlLm5nQGludGVsLmNvbT4gd3JvdGU6DQo+IEZyb206ICJOZywgV2VpIFRl
ZSIgPHdlaS50ZWUubmdAaW50ZWwuY29tPg0KPg0KPiBJbiBvcmRlciB0byBpbXBsZW1lbnQgaW5p
dHJhbWZzLWZyYW1ld29yayBmb3IgYm9vdCB1cCBwcm9jZXNzLCBpdCANCj4gZGVwZW5kcyBvbiB1
ZGV2IHBlcmZvcm1pbmcgYXV0b21vdW50aW5nLCB3aGljaCBoYXBwZW5zIGluIHVkZXYtZXh0cmFj
b25mLg0KPiBFeHBsaWNpdGx5IGRlcGVuZCBvbiBpdCBzbyB0aGF0IHdlIGFsd2F5cyBoYXZlIGl0
IGluc3RhbGxlZC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogTmcsIFdlaSBUZWUgPHdlaS50ZWUubmdA
aW50ZWwuY29tPg0KDQpXcm9uZzsgdGhpcyBpcyBuZWVkIGZvciB0aGUgbGl2ZSBzdXBwb3J0IHNv
IHRoZSByZGVwZW5kcyBzaG91bGQgYmUgdGhlcmUuDQoNCg0KLS0gDQpPdGF2aW8gU2FsdmFkb3Ig
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIE8uUy4gU3lzdGVtcw0KaHR0cDovL3d3dy5vc3N5
c3RlbXMuY29tLmJyICAgICAgICBodHRwOi8vY29kZS5vc3N5c3RlbXMuY29tLmJyDQpNb2JpbGU6
ICs1NSAoNTMpIDk5ODEtNzg1NCAgICAgICAgICAgIE1vYmlsZTogKzEgKDM0NykgOTAzLTk3NTAN
Cg==

