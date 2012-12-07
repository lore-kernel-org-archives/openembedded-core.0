Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.m.rifenbark@intel.com>) id 1Th836-0004x2-Qb
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Dec 2012 01:13:45 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Dec 2012 15:58:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,241,1355126400"; d="scan'208";a="253870496"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by orsmga002.jf.intel.com with ESMTP; 07 Dec 2012 15:58:10 -0800
Received: from orsmsx152.amr.corp.intel.com (10.22.226.39) by
	ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Fri, 7 Dec 2012 15:58:10 -0800
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.81]) by
	ORSMSX152.amr.corp.intel.com ([169.254.8.236]) with mapi id
	14.01.0355.002; Fri, 7 Dec 2012 15:58:10 -0800
From: "Rifenbark, Scott M" <scott.m.rifenbark@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Robert P. J. Day"
	<rpjday@crashcourse.ca>
Thread-Topic: [OE-core] what exactly is the proper way to use FILESEXTRAPATHS?
Thread-Index: AQHN1JWf1/jBIhKM7EKaWd6octcBj5gOBCiA
Date: Fri, 7 Dec 2012 23:58:10 +0000
Message-ID: <41DEA4B02DBDEF40A0F3B6D0DDB1237946ACB783@ORSMSX101.amr.corp.intel.com>
References: <alpine.DEB.2.02.1212061522350.31684@oneiric>
	<1354835735.12928.15.camel@ted>
	<alpine.DEB.2.02.1212061818500.3731@oneiric>
	<1354896691.12928.34.camel@ted>
In-Reply-To: <1354896691.12928.34.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what exactly is the proper way to use FILESEXTRAPATHS?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Dec 2012 00:13:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TmV3IGJ1ZyBmaWxlZC4uLg0KDQpodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvc2hv
d19idWcuY2dpP2lkPTM1NTINCg0KU2NvdHQNCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+RnJvbTogUmljaGFyZCBQdXJkaWUgW21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnXQ0KPlNlbnQ6IEZyaWRheSwgRGVjZW1iZXIgMDcsIDIwMTIgODoxMiBBTQ0KPlRv
OiBSb2JlcnQgUC4gSi4gRGF5OyBSaWZlbmJhcmssIFNjb3R0IE0NCj5DYzogT0UgQ29yZSBtYWls
aW5nIGxpc3QNCj5TdWJqZWN0OiBSZTogW09FLWNvcmVdIHdoYXQgZXhhY3RseSBpcyB0aGUgcHJv
cGVyIHdheSB0byB1c2UNCj5GSUxFU0VYVFJBUEFUSFM/DQo+DQo+T24gVGh1LCAyMDEyLTEyLTA2
IGF0IDE4OjIwIC0wNTAwLCBSb2JlcnQgUC4gSi4gRGF5IHdyb3RlOg0KPj4gT24gVGh1LCA2IERl
YyAyMDEyLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToNCj4+DQo+PiA+IE9uIFRodSwgMjAxMi0xMi0w
NiBhdCAxNToyNyAtMDUwMCwgUm9iZXJ0IFAuIEouIERheSB3cm90ZToNCj4+ID4gPiBjb250aW51
aW5nIG15IHRyZWsgdGhyb3VnaCBjb2RpbmcgcGVkYW50cnkgYW5kIHdhcyB3b25kZXJpbmcgYWJv
dXQNCj4+ID4gPiB0aGUgZXhhY3QgcHVycG9zZSBvZiB0aGUgY29tbW9uIGxpbmUgaW4gLmJiYXBw
ZW5kIGZpbGVzOg0KPj4gPiA+DQo+PiA+ID4gRklMRVNFWFRSQVBBVEhTX3ByZXBlbmQgOj0gIiR7
VEhJU0RJUn0vJHtQTn06Ig0KPj4gPiA+DQo+PiA+ID4gb3Igc29tZSBzbGlnaHQgdmFyaWF0aW9u
IHRoZXJlb2YuDQo+PiA+ID4NCj4+ID4gPiAgIGkgKnRob3VnaHQqIGkga25ldyB3aGF0IGl0IGRp
ZCwgc28gaSBkaWQgYSBzbWFsbCBleHBlcmltZW50IHdpdGgNCj50aGUNCj4+ID4gPiBtZXRhLXRp
IGxheWVyIGFuZCBuZXRiYXNlIChzaW5jZSBpIHdhcyBhbHJlYWR5IG1lc3NpbmcgYXJvdW5kIHdp
dGgNCj4+ID4gPiBpdCksIGFuZCBpIHJlcGxhY2VkIHRoZSBjb250ZW50cyBvZiB0aGUgbmV0YmFz
ZSAuYmJhcHBlbmQgZmlsZQ0KPndpdGgNCj4+ID4gPiB0aGUgc2luZ2xlIGxpbmU6DQo+PiA+ID4N
Cj4+ID4gPiBGSUxFU0VYVFJBUEFUSFNfcHJlcGVuZCA6PSAicmRheSINCj4+ID4gPg0KPj4gPiA+
IGFuZCBjaGVja2VkIHRoZSBlbnZpcm9ubWVudCBmb3IgdGhlIHZhbHVlIG9mIEZJTEVTUEFUSCBm
b3IgdGhlDQo+bmV0YmFzZQ0KPj4gPiA+IHJlY2lwZSBhbmQsIGFmdGVyIGZvcm1hdHRpbmcgdG8g
cmVhZCBpdCBjbGVhcmx5LCB3aGF0IGkgc2F3IHdhczoNCj4+ID4gPg0KPj4gPiA+IEZJTEVTUEFU
SD0icmRheS9saW51eC1nbnVlYWJpDQo+PiA+ID4gcmRheS9hcm0NCj4+ID4gPiByZGF5L2J1aWxk
LWxpbnV4DQo+PiA+ID4gcmRheS9wbi1uZXRiYXNlDQo+PiA+ID4gcmRheS9iZWFnbGVib2FyZA0K
Pj4gPiA+IHJkYXkvb21hcDMNCj4+ID4gPiByZGF5L2FybXY3YQ0KPj4gPiA+IHJkYXkvDQo+PiA+
ID4gcmRheS9jbGFzcy10YXJnZXQNCj4+ID4gPiByZGF5L2ZvcmNldmFyaWFibGUNCj4+ID4gPiBy
ZGF5L2xpYmMtZ2xpYmMNCj4+ID4gPiByZGF5Lw0KPj4gPiA+IC9ob21lL3JwamRheS9PRS9kaXN0
L2xheWVycy9vZS1jb3JlL21ldGEvcmVjaXBlcy0NCj5jb3JlL25ldGJhc2UvbmV0YmFzZS01LjAv
bGludXgtZ251ZWFiaQ0KPj4gPiA+IC9ob21lL3JwamRheS9PRS9kaXN0L2xheWVycy9vZS1jb3Jl
L21ldGEvcmVjaXBlcy0NCj5jb3JlL25ldGJhc2UvbmV0YmFzZS01LjAvYXJtDQo+PiA+ID4gL2hv
bWUvcnBqZGF5L09FL2Rpc3QvbGF5ZXJzL29lLWNvcmUvbWV0YS9yZWNpcGVzLQ0KPmNvcmUvbmV0
YmFzZS9uZXRiYXNlLTUuMC9idWlsZC1saW51eA0KPj4gPiA+IC9ob21lL3JwamRheS9PRS9kaXN0
L2xheWVycy9vZS1jb3JlL21ldGEvcmVjaXBlcy0NCj5jb3JlL25ldGJhc2UvbmV0YmFzZS01LjAv
cG4tbmV0YmFzZQ0KPj4gPiA+IC9ob21lL3JwamRheS9PRS9kaXN0L2xheWVycy9vZS1jb3JlL21l
dGEvcmVjaXBlcy0NCj5jb3JlL25ldGJhc2UvbmV0YmFzZS01LjAvYmVhZ2xlYm9hcmQNCj4+ID4g
PiAvaG9tZS9ycGpkYXkvT0UvZGlzdC9sYXllcnMvb2UtY29yZS9tZXRhL3JlY2lwZXMtDQo+Y29y
ZS9uZXRiYXNlL25ldGJhc2UtNS4wL29tYXAzDQo+PiA+ID4gLi4uIHNuaXAgLi4uDQo+PiA+ID4N
Cj4+ID4gPiAgIHdoYXQgdGhlIGhlY2s/ICBpZiB0aGF0J3Mgd2hhdCBGSUxFU0VYVFJBUEFUSFMg
aXMgc3VwcG9zZWQgdG8NCj5kbywNCj4+ID4gPiB0aGF0IGlzIGRlZmluaXRlbHkgKm5vdCogaG93
IGl0J3MgYmVpbmcgdXNlZCBpbiBtYW55LCBtYW55DQo+YmJhcHBlbmQNCj4+ID4gPiBmaWxlcy4N
Cj4+ID4gPg0KPj4gPiA+ICAgaXMgdGhlcmUgYW4gZXhwbGFuYXRpb24gc29tZXdoZXJlIGFzIHRv
IHdoYXQgdGhlIGFib3ZlIGlzDQo+c3VwcG9zZWQNCj4+ID4gPiB0byByZXByZXNlbnQ/DQo+PiA+
DQo+PiA+IFdoYXQgaXMgcHV6emxpbmcgYWJvdXQgdGhlIGFib3ZlPyBJdHMgZG9pbmcgd2hhdCBp
dCB3YXMgZGVzaWduZWQgdG8NCj5kby4NCj4+ID4NCj4+ID4gVGhlIGlkZWEgaXMgdG8gYWRkIHRo
ZSBkaXJlY3RvcnkgbGlzdGVkIHRvIHRoZSBzZXQgb2YgZGlyZWN0b3JpZXMNCj50aGF0DQo+PiA+
IGdldCAiYXV0b2dlbmVyYXRlZCIgZnJvbSBPVkVSUklERVMgYXMgc2VhcmNoIGxvY2F0aW9ucy4g
V2hhdCBkaWQgeW91DQo+PiA+IGV4cGVjdCBpdCB0byBkbz8NCj4+DQo+PiAgIGkgYW0sIHJpZ2h0
IHRoaXMgbWludXRlLCBsb29raW5nIGF0IHRoZSBleHBsYW5hdGlvbiBvZg0KPj4gRklMRVNFWFRS
QVBBVEhTIGluIHRoZSBwb2t5IHJlZmVyZW5jZSBtYW51YWwgZ2xvc3NhcnkuICBpIHNlZQ0KPj4g
YWJzb2x1dGVseSBubyBtZW50aW9uIG9mIHRoZSB3b3JkICJPVkVSUklERVMiLg0KPj4NCj4+ICAg
c2lnbmluZyBvZmYgZm9yIHRoZSBldmVuaW5nIGFzIGknbSBzdGFydGluZyB0byBnZXQgYW5ub3ll
ZCAuLi4NCj4NCj5JdCBzb3VuZHMgbGlrZSB0aGUgZG9jcyBhcmUgbWlzc2luZyBzb21lIGRldGFp
bHMgYWJvdXQgaG93IHRoaXMgd29ya3MNCj5hbmQgd2hhdCBpdHMgZGVzaWduZWQgdG8gZG8uIFdl
IHNob3VsZCBhZGQgdGhlIGluZm9ybWF0aW9uIGFuZCB0aGVyZSBhcmUNCj5zZXZlcmFsIG9mIHVz
IHdobyB3aWxsIGhhcHBpbHkgd29yayB3aXRoIFNjb3R0IG9uIGZpeGluZyB0aGF0Lg0KPg0KPkdl
dHRpbmcgYW5ub3llZCBpc24ndCBnb2luZyB0byBoZWxwLg0KPg0KPkknZCBhbHNvIGFkZCB0aGF0
IHdlJ3JlIGFib3V0IHRvIGNoYW5nZSB0aGUgd2F5IHRoaXMgd29ya3MgYSBsaXR0bGUgc28NCj53
ZSdkIHBlcmhhcHMgYmV0dGVyIGhvbGQgb2ZmIGZpeGluZyB0aGUgbWFudWFsIHVudGlsIHdlJ3Zl
IG1hZGUgdGhhdA0KPmNoYW5nZSAod2hpY2ggd2lsbCBzaW1wbGlmeSB0aGUgbGlzdHMgb2Ygc2Vh
cmNoIHBhdGhzIHlvdSd2ZSBiZWVuIHNlZWluZw0KPmZ1cnRoZXIpLg0KPg0KPlNjb3R0OiBMb29r
cyBsaWtlIHdlIG5lZWQgdG8gdHdlYWsgdGhlIG1hbnVhbCBpbiB0aGlzIGxvY2F0aW9uLiBDb3Vs
ZA0KPnlvdSBvcGVuIGEgYnVnIG9yIG90aGVyd2lzZSB0cmFjayB0aGlzIHBsZWFzZT8NCj4NCj5D
aGVlcnMsDQo+DQo+UmljaGFyZA0KPg0KDQo=


