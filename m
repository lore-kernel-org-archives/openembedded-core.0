Return-Path: <william.c.randle@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 24161602D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 15:47:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jun 2016 08:47:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,466,1459839600"; d="scan'208";a="996662507"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
	by orsmga002.jf.intel.com with ESMTP; 13 Jun 2016 08:47:14 -0700
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
	ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Mon, 13 Jun 2016 08:47:12 -0700
Received: from orsmsx105.amr.corp.intel.com ([169.254.2.201]) by
	ORSMSX156.amr.corp.intel.com ([10.22.240.22]) with mapi id
	14.03.0248.002; Mon, 13 Jun 2016 08:47:12 -0700
From: "Randle, William C" <william.c.randle@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "paul.eggleton@linux.intel.com"
	<paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 0/9] Show progress during build and eSDK install
Thread-Index: AQHRxSHKdSlSf5RSfEybyN9QAQ3y2J/oAMYA
Date: Mon, 13 Jun 2016 15:47:11 +0000
Message-ID: <1465832830.31160.9.camel@intel.com>
References: <cover.1465787274.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1465787274.git.paul.eggleton@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.76.61]
MIME-Version: 1.0
Subject: Re: [PATCH 0/9] Show progress during build and eSDK install
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
X-List-Received-Date: Mon, 13 Jun 2016 15:47:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <08F3052E4F7BDD44B736BF4188DC3CFF@intel.com>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDE2LTA2LTEzIGF0IDE1OjEzICsxMjAwLCBQYXVsIEVnZ2xldG9uIHdyb3RlOg0K
PiANCj4gSSBoYXZlIGNvbnRlbXBsYXRlZCBhbmQgZXZlbiBwcm90b3R5cGVkIGdvaW5nIGEgc3Rl
cCBmdXJ0aGVyIGFuZCB1c2luZyB0aGUNCj4gY291bnQgb2YgbGluZXMgaW4gdGhlIG91dHB1dCB0
byB0cmFjayBwcm9ncmVzcyBmb3IgKmFsbCogbG9uZy1ydW5uaW5nIHRhc2tzLA0KPiB3aGljaCBk
b2VzIHdvcmsgcmVhc29uYWJseSB3ZWxsIC0gdGhlIGNhdmVhdCBpcyB5b3UgYWN0dWFsbHkgbmVl
ZCB0aGUNCj4gZXhwZWN0ZWQgbGluZSBjb3VudCBhaGVhZCBvZiB0aW1lIGZvciBlYWNoIHRhc2ss
IHNvIHlvdSBoYXZlIHRvIGJlIGFibGUgdG8NCj4gZ2V0IHRoYXQgZnJvbSBzb21ld2hlcmUuIEnC
oMKgaGF2ZW4ndCB3b3JrZWQgb3V0IGEgcHJhY3RpY2FsIG1lYW5zIG9mDQo+IGRlbGl2ZXJpbmcg
dGhhdCwgc3VnZ2VzdGlvbnMgd291bGQgYmUgdmVyeSBtdWNoIHdlbGNvbWUgLSBteSBwcm90b3R5
cGUgc3R1ZmYNCj4gaXMgb24gcG9reS1jb250cmliIHBhdWxlL3Byb2dyZXNzLXdpcCBhbmQgcmVs
aWVzIG9uIHNvbWVvbmUgcHJvZmlsaW5nIGENCj4gYnVpbGQgY29udGFpbmluZyBhbGwgdGhlIHRh
c2tzIGJlZm9yZWhhbmQgYW5kIHRoYXQgaW5mb3JtYXRpb24gc29tZWhvdyBiZWluZw0KPiBtYWRl
IGF2YWlsYWJsZSB0byBldmVyeW9uZSBlbHNlLg0KDQpDb3VsZCB0aGlzIGJlIGRvbmUgc29tZXdo
YXQgYW5hbGFnb3VzIHRvIHRoZSB3YXkgdGhlIHNzdGF0ZSBzdHVmZiB3b3JrcywgaW4gdGhlDQpz
ZW5zZSB5b3UgY291bGQgc3BlY2lmeSBhIGxvY2FsIG9yIHJlbW90ZSBsaW5lIGNvdW50IG1pcnJv
ciwgb3IgdXNlIGEgbG9jYWwNCmRpcmVjdG9yeS4gVGhlIGZpcnN0IHRpbWUgYSB1bmlxdWUgdGFz
ayBpcyBydW4sIHRoZSBsaW5lIGNvdW50IGZyb20gdGhlIG91dHB1dA0KaXMgc2F2ZWQgaW4gdGhl
IGxpbmUgY291bnQgZGIuIE9uIHN1YnNlcXVlbnQgcnVucywgaXQgd291bGQgZGV0ZWN0IHRoZXJl
J3MNCmFscmVhZHkgYW4gZW50cnkgaW4gdGhlIGRiIGFuZCB3b3VsZCBiZSBhYmxlIHRvIHByb3Zp
ZGUgdGhlIHByb2dyZXNzIHJlcG9ydC4NCg0KU2ltaWxhciB0byB0aGUgd2F5IGFuIGF1dG9idWls
ZGVyIGNhbiBjcmVhdGUgYSBzaGFyZWQgc3N0YXRlIG1pcnJvciwgd2hlbiBhIHRhc2sNCmlzIHJ1
biBvbiBhbiBhdXRvYnVpbGRlciwgaXQgY291bGQgc2F2ZSB0aGUgbGluZSBjb3VudCBhbmQgbWFr
ZSBpdCBhdmFpbGFibGUgdG8NCm90aGVyIGNvbnN1bWVycywgc28gb24gZmlyc3QgcnVuIHlvdSB3
b3VsZCBnZXQgYSBwcm9ncmVzcyByZXBvcnQsIHJhdGhlciB0aGFuDQpoYXZpbmcgdG8gYm9vdHN0
cmFwIHRoZSBsaW5lIGNvdW50cyBmaXJzdC4NCg0KwqAgwqAgLUJpbGw=

