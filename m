Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3CF62133
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Dec 2016 00:31:19 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP; 30 Dec 2016 16:31:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,432,1477983600"; d="scan'208";a="48745173"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by fmsmga006.fm.intel.com with ESMTP; 30 Dec 2016 16:31:20 -0800
Received: from orsmsx157.amr.corp.intel.com (10.22.240.23) by
	ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Fri, 30 Dec 2016 16:31:19 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.14]) by
	ORSMSX157.amr.corp.intel.com ([169.254.9.130]) with mapi id
	14.03.0248.002; Fri, 30 Dec 2016 16:31:19 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] build-appliance-image: support for Toaster
Thread-Index: AQHSYuUPfjcj6MHUF0yIcv5lpYMbkKEhs2UA//+AYrA=
Date: Sat, 31 Dec 2016 00:31:18 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6118DB46D@ORSMSX112.amr.corp.intel.com>
References: <1483133732-17872-1-git-send-email-juro.bystricky@intel.com>
	<1483133732-17872-2-git-send-email-juro.bystricky@intel.com>
	<1483142704.9843.154.camel@linuxfoundation.org>
In-Reply-To: <1483142704.9843.154.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>
Subject: Re: [PATCH 1/1] build-appliance-image: support for Toaster
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
X-List-Received-Date: Sat, 31 Dec 2016 00:31:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

R29vZCBxdWVzdGlvbi4gSSBtZW50aW9uZWQgdGhpcyBpbiB0aGUgY292ZXIgbWVzc2FnZS4NCkJh
c2VkIG9uIGh0dHBzOi8vcGlwLnB5cGEuaW8vZW4vbGF0ZXN0L2luc3RhbGxpbmcvDQoNCiJwaXAg
aXMgYWxyZWFkeSBpbnN0YWxsZWQgaWYgeW91J3JlIHVzaW5nIFB5dGhvbiAyID49Mi43Ljkgb3Ig
UHl0aG9uIDMgPj0zLjQgYmluYXJpZXMgZG93bmxvYWRlZCBmcm9tIHB5dGhvbi5vcmcsIGJ1dCB5
b3UnbGwgbmVlZCB0byB1cGdyYWRlIHBpcC4iDQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgUHVyZGllIFttYWlsdG86cmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZ10NCj4gU2VudDogRnJpZGF5LCBEZWNlbWJlciAzMCwgMjAxNiA0OjA1
IFBNDQo+IFRvOiBCeXN0cmlja3ksIEp1cm8gPGp1cm8uYnlzdHJpY2t5QGludGVsLmNvbT47IG9w
ZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBqdXJvYnlz
dHJpY2t5QGhvdG1haWwuY29tDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvMV0g
YnVpbGQtYXBwbGlhbmNlLWltYWdlOiBzdXBwb3J0IGZvcg0KPiBUb2FzdGVyDQo+IA0KPiBPbiBG
cmksIDIwMTYtMTItMzAgYXQgMTM6MzUgLTA4MDAsIEp1cm8gQnlzdHJpY2t5IHdyb3RlOg0KPiA+
ICsJIyBJbnN0YWxsIG1vZHVsZXMgbmVlZGVkIGZvciB0b2FzdGVyDQo+ID4gKwlleHBvcnQgSE9N
RT0ke0lNQUdFX1JPT1RGU30vaG9tZS9idWlsZGVyDQo+ID4gKwlta2RpciAtcCAke0lNQUdFX1JP
T1RGU30vaG9tZS9idWlsZGVyLy5jYWNoZS9waXANCj4gPiArCXBpcDMgaW5zdGFsbCAtLXVzZXIg
LUkgLVUgLXYgLXINCj4gPiAke0lNQUdFX1JPT1RGU30vaG9tZS9idWlsZGVyL3Bva3kvYml0YmFr
ZS90b2FzdGVyLXJlcXVpcmVtZW50cy50eHQNCj4gPiArCWNob3duIC1SIGJ1aWxkZXIuYnVpbGRl
ciAke0lNQUdFX1JPT1RGU30vaG9tZS9idWlsZGVyLy5sb2NhbA0KPiA+ICsJY2hvd24gLVIgYnVp
bGRlci5idWlsZGVyICR7SU1BR0VfUk9PVEZTfS9ob21lL2J1aWxkZXIvLmNhY2hlDQo+IA0KPiBD
YW4gd2Ugc2FmZWx5IGFzc3VtZSB0aGF0IHRoZSBidWlsZCBtYWNoaW5lIGhhcyBwaXAzIG9uIGl0
PyBJcyB0aGF0IGluDQo+IG91ciBkZWZhdWx0IGxpc3Qgb2YgYnVpbGQgcmVxdWlyZW1lbnRzPw0K
PiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0K

