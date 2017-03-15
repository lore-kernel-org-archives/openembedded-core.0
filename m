Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 19F5773056
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489597829; x=1521133829;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=MaHx/wBAYpQ3Rl7oOfiKHSHjZ8VZaRwb1koaXO3tndA=;
	b=q3e5oAxRcVFiy8yNZdLcXJc59vn1PzIDWKohLqxpSUmqdG0j325w/IFf
	dt4jI5PHxDM64XAWWODRcScnVlCAFQ==;
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 10:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,169,1486454400"; d="scan'208";a="75766127"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
	by orsmga005.jf.intel.com with ESMTP; 15 Mar 2017 10:10:11 -0700
Received: from fmsmsx106.amr.corp.intel.com ([169.254.5.63]) by
	FMSMSX103.amr.corp.intel.com ([169.254.2.47]) with mapi id
	14.03.0248.002; Wed, 15 Mar 2017 10:10:11 -0700
From: "Ibarra Lopez, Humberto" <humberto.ibarra.lopez@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>, "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 1/3] rpm: add support for remote package
	feeds via PACKAGE_FEED_URIS variable
Thread-Index: AQHSnX1KJhnvMrv49061xob9uZSeEKGWNlIA///SDxCAAH68AP//i3Mw
Date: Wed, 15 Mar 2017 17:10:10 +0000
Message-ID: <F187383F84EB304A88D055C3049588791BCF0B43@FMSMSX106.amr.corp.intel.com>
References: <20170314172749.6643-1-alexander.kanavin@linux.intel.com>
	<CAJTo0LY4pN1n2s9Qe1FSesSRFUcWFLdsQQ6Z2J8-DZqGeBK14Q@mail.gmail.com>
	<9ca28013-06c6-c668-2e42-1d13a75d4331@linux.intel.com>
	<F187383F84EB304A88D055C3049588791BCF0AF1@FMSMSX106.amr.corp.intel.com>
	<1489594104.13980.67.camel@linuxfoundation.org>
In-Reply-To: <1489594104.13980.67.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.106]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] rpm: add support for remote package feeds via PACKAGE_FEED_URIS variable
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
X-List-Received-Date: Wed, 15 Mar 2017 17:10:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVhaCwgaXQgZG9lcyBzb3VuZCBvZmYgYnV0IHdlIGNvdWxkIHVzZSBpdC4gV2UgY291bGQgcHV0
IGEgbW9jayB2YWx1ZSBpbiB0aGUgaXAgdG8gdGhlIFBBQ0tBR0VfRkVFRF9VUklTIHZhciB0byBi
dWlsZCB0aGlzIGltYWdlIGFuZCBvbmNlIGl0IGJvdGhzIHVwZGF0ZSB0aGF0IHZhbHVlIHdpdGgg
dGhlIHJlYWwgb25lLiBXZSB3b3VsZCBoYXZlIHRvIGNoZWNrIHRoYXQgdGhlIG1vY2sgdmFsdWUg
d2FzIGNvcnJlY3RseSBzZXQgYmVmb3JlIHVwZGF0aW5nIHNvIHdlIGNhbiB0ZXN0IHRoZSB2YXIg
YmVpbmcgY29ycmVjdGx5IHNldDsgYW5kIHRoZW4gY2hlY2sgdGhhdCB0aGUgZmVlZHMgYXJlIHVw
ZGF0ZWQgY29ycmVjdGx5IG9uY2UgYSB2YWxpZCBpcCBpcyB0aGVyZS4gSSB3aWxsIGxvb2sgaW50
byB0aGlzLg0KDQpIdW1iZXJ0bw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
UmljaGFyZCBQdXJkaWUgW21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3Jn
XSANClNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggMTUsIDIwMTcgMTA6MDggQU0NClRvOiBJYmFycmEg
TG9wZXosIEh1bWJlcnRvIDxodW1iZXJ0by5pYmFycmEubG9wZXpAaW50ZWwuY29tPjsgQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXhhbmRlci5rYW5hdmluQGxpbnV4LmludGVsLmNvbT47IEJ1cnRvbiwg
Um9zcyA8cm9zcy5idXJ0b25AaW50ZWwuY29tPg0KQ2M6IE9FLWNvcmUgPG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRD
SCAxLzNdIHJwbTogYWRkIHN1cHBvcnQgZm9yIHJlbW90ZSBwYWNrYWdlIGZlZWRzIHZpYSBQQUNL
QUdFX0ZFRURfVVJJUyB2YXJpYWJsZQ0KDQpPbiBXZWQsIDIwMTctMDMtMTUgYXQgMTU6MzggKzAw
MDAsIEliYXJyYSBMb3BleiwgSHVtYmVydG8gd3JvdGU6DQo+IFNvcnJ5LCBtaXNzZWQgdGhlIHBy
ZXZpb3VzIG1haWwuDQo+IA0KPiBJIGFtIG5vdCBzdXJlIGhvdyB0byBpbXByb3ZlIHRoZSBoYXJk
Y29kaW5nIHRoZXJlLCBJIGRvbid0IGxpa2UgaXQgDQo+IGVpdGhlciwgYnV0IGNvdWxkbid0IGZp
bmQgYW4gYWx0ZXJuYXRpdmUuIFRoZSB0aGluZyBpcyB0aGF0IHdlIG5lZWQgDQo+IHRoZSBpcCBv
ZiB0aGUgaG9zdCBhcyBzZWVuIGZyb20gdGhlIHRhcmdldCB0byBydW4gdGVzdGltYWdlLCBidXQg
d2UgDQo+IGRvbuKAmXQgaGF2ZSB0aGUgZXhhY3QgdmFsdWUgZm9yIHRoYXQgb25lIHVudGlsIHFl
bXUgaXMgdXAuIFRoZSBpc3N1ZSANCj4gaGVyZSBpcyB0aGF0IHdlIG5lZWQgdG8gZ2l2ZSB0aGlz
IGlwIHRvIHRoZSBjb25mIGluIHRoZSANCj4gUEFDS0FHRV9GRUVEX1VSSVMgYmVmb3JlIGJ1aWxk
aW5nIHNvIHdlIGNhbiBnZXQgYW4gaW1hZ2Ugd2l0aCB0aGlzIHZhciANCj4gdG8gbGF0ZXIgdXNl
IGluIHRlc3RpbWFnZS4NCj4gDQo+IElmIHNvbWVvbmUgaGFzIGEgYmV0dGVyIGlkZWEgdG8gZ2V0
IHJpZCBvZiB0aGlzIGhhcmRjb2RpbmcsIGl0IHdvdWxkIA0KPiBiZSBncmVhdCB0byBrbm93Lg0K
DQpXZSBjb3VsZCBydW4gYSBzZWQgY29tbWFuZCBpbnNpZGUgdGhlIGltYWdlIGFmdGVyIGl0IGJv
b3RzIGJ1dCBiZWZvcmUgdHJpZ2dlcmluZyB0aGUgdGVzdHMgdG8gcHV0IHRoZSBjb3JyZWN0IElQ
L3BvcnQgbnVtYmVyIGludG8gdGhlIGZpbGU/DQoNCk5vdCBhIHBlcmZlY3QgdGVzdCBidXQgc2lt
cGxlIGFuZCBwcm9iYWJseSBnb29kIGVub3VnaCBmb3IgdGhpcz8NCg0KQ2hlZXJzLA0KDQpSaWNo
YXJkDQo=

