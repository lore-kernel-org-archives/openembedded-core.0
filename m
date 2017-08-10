Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F2FB7780A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 20:37:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Aug 2017 13:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,354,1498546800"; d="scan'208";a="1161402570"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by orsmga001.jf.intel.com with ESMTP; 10 Aug 2017 13:36:46 -0700
Received: from orsmsx163.amr.corp.intel.com (10.22.240.88) by
	ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Thu, 10 Aug 2017 13:36:45 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.170]) by
	ORSMSX163.amr.corp.intel.com ([169.254.9.158]) with mapi id
	14.03.0319.002; Thu, 10 Aug 2017 13:36:45 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH v3 07/11] image_types.bbclass: improve cpio
	image reproducibility
Thread-Index: AQHTETfNezyyTe07D0a7mibHNN2fmKJ8x3WAgAEzssCAAIAkAP//kLTg
Date: Thu, 10 Aug 2017 20:36:44 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6119E129E@ORSMSX112.amr.corp.intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
	<1502300913-40295-8-git-send-email-juro.bystricky@intel.com>
	<CAJ86T=Ud6Yh6m6+=n6DNaOm06fU+fc0L6ZhAoA32dDNSpTfWxg@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6119E1224@ORSMSX112.amr.corp.intel.com>
	<CAJ86T=WNn=gYeqUmODRxWOit_j9CGKj12Vy+xPvfzpifepL_ow@mail.gmail.com>
In-Reply-To: <CAJ86T=WNn=gYeqUmODRxWOit_j9CGKj12Vy+xPvfzpifepL_ow@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 07/11] image_types.bbclass: improve cpio image reproducibility
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
X-List-Received-Date: Thu, 10 Aug 2017 20:37:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+PiBJcyBpdCB1c2VmdWwgdG8ga2VlcCB0aGUgb3B0aW9uIHVzaW5nIGNwaW8gZnJvbSB0aGUg
aG9zdD8gV2h5IG5vdA0KPiA+PiBhbHdheXMgdXNlIGNwaW8tbmF0aXZlPw0KPiA+DQo+ID4gSSBn
dWVzcyBpdCBpcyBhIGp1ZGdlbWVudCBjYWxsIHdoaWNoIHRvb2xzIHRvIGJ1aWxkIGFuZCB3aGlj
aCB0b29scyB0bw0KPiB1c2UgZnJvbSB0aGUgaG9zdC4gTm90IGJ1aWxkaW5nIHRvb2xzIHdoaWNo
IGFyZSBndWFyYW50ZWVkIHRvIGJlIG9uIHRoZQ0KPiBob3N0IHNhdmVzIGJ1aWxkIHRpbWUuDQo+
IA0KPiBJIGd1ZXNzIGJ1aWxkIHRpbWUgZm9yIGNwaW8tbmF0aXZlIHdpbGwgYmUgc29tZXdoZXJl
IGluIHRoZSBub2lzZSBmb3INCj4gYSB0eXBpY2FsIGJ1aWxkLiBBdm9pZGluZyB0aGUgZXh0cmEg
Y29tcGxleGl0eSAoY29kZSArIHRlc3QgYW5kIFFBKSBvZg0KPiBtYWludGFpbmluZyBzdXBwb3J0
IGZvciBib3RoIGNwaW8gZnJvbSB0aGUgaG9zdCBhbmQgY3Bpby1uYXRpdmUgd291bGQNCj4gc2Vl
bSB0byBiZSBmYXIgbW9yZSBvZiBhbiBpc3N1ZS4gVGhlcmUncyBubyBndWFyYW50ZWUgdGhhdCBj
cGlvIGlzDQo+IGF2YWlsYWJsZSBvbiB0aGUgaG9zdCAoaXQgY3VycmVudGx5IG5lZWRzIHRvIGJl
IGluc3RhbGxlZCBtYW51YWxseSBpZg0KPiBidWlsZGluZyB3aXRoaW4gdGhlIHVidW50dToxNi4w
NCBkb2NrZXIgaW1hZ2UsIGZvciBleGFtcGxlKS4NCj4gDQoNCkxvb2tpbmcgYXQgdGhlIEhPU1RU
T09MUyBpbiBwb2t5L21ldGEvY29uZi9iaXRiYWtlLmNvbmYgSSBzZWUgImNwaW8iIGlzIGxpc3Rl
ZCBhbW9uZyByZXF1aXJlZCB0b29scy4gU28gYXQgbGVhc3QgZm9yICJwb2t5IiBhIG1pc3Npbmcg
Y3BpbyB3b3VsZC9zaG91bGQgZ2VuZXJhdGUgYW4gZXJyb3IuDQoNCj4gPiBBbHNvLCB0aGUgbmVl
ZCBmb3IgY3Bpby1uYXRpdmUgd2l0aCB0aGUgcmVwcm9kdWNpYmxlIG9wdGlvbnMgaXQgaXMgZ29p
bmcNCj4gdG8gYmUgZmFpcmx5IHJhcmUuDQo+IA0KPiBJJ20gbm90IHN1cmUgSSBhZ3JlZSB0aGF0
IHdhbnRpbmcgcmVwcm9kdWNpYmxlIGJ1aWxkcyBpcyBhIHJhcmUNCj4gcmVxdWlyZW1lbnQgYnV0
IGlmIGl0IGlzIHRoZW4gaXNuJ3QgZWxpbWluYXRpbmcgYSByYXJlbHkgdXNlZCBjb2RlDQo+IHBh
dGggYW4gYXJndW1lbnQgKmluIGZhdm91ciBvZiogc3dpdGNoaW5nIHRvIGEgc2luZ2xlIHNvbHV0
aW9uIHdoaWNoDQo+IHN1cHBvcnRzIGJvdGggY2FzZXM/DQoNCkFncmVlZC4gSSBkb24ndCBoYXZl
IGEgcHJvYmxlbSB3aXRoIGRlZmF1bHRpbmcgdG8gY3Bpby1uYXRpdmUsDQppdCB3b3VsZCBzb2x2
ZSBhIGZldyBwcm9ibGVtcyBhcyB3ZWxsLCBidXQgSSB0aGluayBzb21lIGtpbmQgb2YgY29uc2Vu
c3VzIGlzIG5lZWRlZCBmaXJzdC4NCg0K

