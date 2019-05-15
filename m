Return-Path: <anuj.mittal@intel.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 May 2019 01:24:58 UTC
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6FCDE7D3F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 01:24:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 May 2019 18:17:52 -0700
X-ExtLoop1: 1
Received: from pgsmsx107.gar.corp.intel.com ([10.221.44.105])
	by orsmga008.jf.intel.com with ESMTP; 14 May 2019 18:17:51 -0700
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.8]) by
	PGSMSX107.gar.corp.intel.com ([169.254.7.67]) with mapi id
	14.03.0415.000; Wed, 15 May 2019 09:17:48 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "Kexin.Hao@windriver.com" <Kexin.Hao@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Liezhi.Yang@windriver.com"
	<Liezhi.Yang@windriver.com>, "randy.macleod@windriver.com"
	<randy.macleod@windriver.com>, "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 2/5] valgrind: do not strip the package or
	ptests
Thread-Index: AQHVCgk4NUHu3XzzLEuPnDLvcdKOuqZqItiAgAA/BICAADzsAIAAAvsAgAA8EgA=
Date: Wed, 15 May 2019 01:17:48 +0000
Message-ID: <d1dfc8f9a2dbfd891a6e14dbf837580667537925.camel@intel.com>
References: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
	<20190514035716.27376-2-Randy.MacLeod@windriver.com>
	<4588fa927b2e10223bab39d65aab4184db783f49.camel@linuxfoundation.org>
	<8f1030b6-b831-7ac8-88e3-1208272d7533@windriver.com>
	<19e3463fcf6a41f0c35b7227760bd1f2cf6aeac5.camel@linuxfoundation.org>
	<c6d172d4-80f4-d91b-662f-b9b1de85f032@windriver.com>
In-Reply-To: <c6d172d4-80f4-d91b-662f-b9b1de85f032@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.20.37]
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] valgrind: do not strip the package or ptests
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
X-List-Received-Date: Wed, 15 May 2019 01:24:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D673C9C5D2F7C942909DE845238E0111@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDE5LTA1LTE0IGF0IDE3OjQyIC0wNDAwLCBSYW5keSBNYWNMZW9kIHdyb3RlOg0K
PiA+IFdlIGFsc28gaGF2ZSBhIHByb2JsZW0gdGhhdCBpdHMgb3ZlcmZsb3dpbmcgdGhlIDRHQiBs
aW1pdCBvbiBzb21lDQo+ID4gaW1hZ2UNCj4gPiBzaXplcyB3aXRoIHRoZSBkZWJ1ZyBpbmZvIGlu
Y2x1ZGVkIDovDQo+IA0KPiBUaGVyZSdzIGFuIGVuaGFuY2VtZW50IHRvIHRyYWNrIHRoYXQ6DQo+
ICAgIGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTMw
MjUNCj4gS2V2aW4gb3ducyBpdCBhbmQgaGFzIGl0IHNjaGVkdWxlZCBmb3IgMi44IE0yLg0KDQpD
aGVlIFlhbmcgaGFkIHNlbnQgcGF0Y2hlcyB0aGF0IGFkZCAnaW5zdGFsbCcgZmVhdHVyZSB0byBh
IHdpYyBpbWFnZSANCmFzIGEgZmlyc3Qgc3RlcCB0b3dhcmRzIGFjaGlldmluZyB0aGlzIC4uLiBJ
dCdkIGJlIGdyZWF0IGlmIHRob3NlIGNhbg0KYmUgcmV2aWV3ZWQ6DQoNCmh0dHBzOi8vcGF0Y2h3
b3JrLm9wZW5lbWJlZGRlZC5vcmcvc2VyaWVzLzE3NDc4Lw0KDQpUaGFua3MsDQoNCkFudWoNCg==

