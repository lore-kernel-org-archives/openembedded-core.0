Return-Path: <amarnath.valluri@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 15BB87838D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 10:28:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Jun 2017 03:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,343,1493708400"; d="scan'208";a="1160795303"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jun 2017 03:28:50 -0700
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.126]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.9]) with mapi id
	14.03.0319.002; Thu, 15 Jun 2017 11:28:49 +0100
From: "Valluri, Amarnath" <amarnath.valluri@intel.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v5] image.bbclass: create root symlinks in
	nativesdk target sysroot
Thread-Index: AQHS5cItKytTqiNp7kyv6rKNJq6qLw==
Date: Thu, 15 Jun 2017 10:28:49 +0000
Message-ID: <1497522578.39827.17.camel@intel.com>
References: <c575a866af5f4e5bbf8af4ca2128cecf@XBOX02.axis.com>
	<1497515577-40707-1-git-send-email-amarnath.valluri@intel.com>
	<ba4d34ea616f45249fb2bed1c4a4e3a3@XBOX02.axis.com>
In-Reply-To: <ba4d34ea616f45249fb2bed1c4a4e3a3@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.170]
MIME-Version: 1.0
Subject: Re: [PATCH v5] image.bbclass: create root symlinks in nativesdk target sysroot
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
X-List-Received-Date: Thu, 15 Jun 2017 10:28:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <89BF5C2A9213224FAD83A5FD45581355@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE3LTA2LTE1IGF0IDA5OjMyICswMDAwLCBQZXRlciBLamVsbGVyc3RlZHQgd3Jv
dGU6DQo+ID4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBvcGVu
ZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBbbWFpbHRv
Om9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVo
YWxmDQo+ID4gT2YNCj4gPiBBbWFybmF0aCBWYWxsdXJpDQo+ID4gU2VudDogZGVuIDE1IGp1bmkg
MjAxNyAxMDozMw0KPiA+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+ID4gU3ViamVjdDogW09FLWNvcmVdIFtQQVRDSCB2NV0gaW1hZ2UuYmJjbGFzczogY3Jl
YXRlIHJvb3Qgc3ltbGlua3MNCj4gPiBpbg0KPiA+IG5hdGl2ZXNkayB0YXJnZXQgc3lzcm9vdA0K
PiA+IA0KPiA+IFRvIG1hdGNoIHdpdGggdGhlIHRhcmdldCBpbWFnZSwgdGhlIGdlbmVyYXRlZCBu
YXRpdmVzZGsncyB0YXJnZXQNCj4gPiBzeXNyb290IGFsc28NCj4gPiBzaG91bGQgaGF2ZSB0aGUg
cm9vdCBzeW1saW5rcygvbGliKiwgL2Jpbi8sIC9zYmluKS4gU28sIGV4dGVuZGVkDQo+ID4gdGhl
DQo+ID4gJ2NyZWF0ZV9tZXJnZWRfdXNyX3N5bWxpbmtzJyB0byByZXVzZSBzeW1saW5rIGNyZWF0
aW9uIHBhcnQgZXZlbg0KPiA+IGZvciBuYXRpdmVzZGsNCj4gPiB1c2luZyBQT1BVTEFURV9TREtf
UFJFX1RBUkdFVF9DT01NQU5ELg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEFtYXJuYXRoIFZh
bGx1cmkgPGFtYXJuYXRoLnZhbGx1cmlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgbWV0YS9j
bGFzc2VzL2ltYWdlLmJiY2xhc3MgfCAyOSArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0K
PiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+
ID4gDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9pbWFnZS5iYmNsYXNzDQo+ID4gYi9t
ZXRhL2NsYXNzZXMvaW1hZ2UuYmJjbGFzcw0KPiA+IGluZGV4IDJhM2MxZTMuLjdjNWNmYzUgMTAw
NjQ0DQo+ID4gLS0tIGEvbWV0YS9jbGFzc2VzL2ltYWdlLmJiY2xhc3MNCj4gPiArKysgYi9tZXRh
L2NsYXNzZXMvaW1hZ2UuYmJjbGFzcw0KPiA+IEBAIC02MjAsMjEgKzYyMCwzMiBAQCBhZGR0YXNr
IGJ1bmRsZV9pbml0cmFtZnMgYWZ0ZXINCj4gPiBkb19pbWFnZV9jb21wbGV0ZQ0KPiA+IA0KPiA+
IMKgIyBQcmVwYXJlIHRoZSByb290IGxpbmtzIHRvIHBvaW50IHRvIHRoZSAvdXNyIGNvdW50ZXJw
YXJ0cy4NCj4gPiDCoGNyZWF0ZV9tZXJnZWRfdXNyX3N5bWxpbmtzKCkgew0KPiA+IC3CoMKgwqDC
oGluc3RhbGwgLWQgJHtJTUFHRV9ST09URlN9JHtiYXNlX2JpbmRpcn0NCj4gPiAke0lNQUdFX1JP
T1RGU30ke2Jhc2Vfc2JpbmRpcn0gJHtJTUFHRV9ST09URlN9JHtiYXNlX2xpYmRpcn0NCj4gPiAt
wqDCoMKgwqBsbnIgJHtJTUFHRV9ST09URlN9JHtiYXNlX2JpbmRpcn0gJHtJTUFHRV9ST09URlN9
L2Jpbg0KPiA+IC3CoMKgwqDCoGxuciAke0lNQUdFX1JPT1RGU30ke2Jhc2Vfc2JpbmRpcn0gJHtJ
TUFHRV9ST09URlN9L3NiaW4NCj4gPiAtwqDCoMKgwqBsbnIgJHtJTUFHRV9ST09URlN9JHtiYXNl
X2xpYmRpcn0gJHtJTUFHRV9ST09URlN9LyR7YmFzZWxpYn0NCj4gPiArwqDCoMKgwqByb290PSIk
MSINCj4gPiArwqDCoMKgwqBpbnN0YWxsIC1kICRyb290JHtiYXNlX2JpbmRpcn0gJHJvb3Qke2Jh
c2Vfc2JpbmRpcn0NCj4gPiAkcm9vdCR7YmFzZV9saWJkaXJ9DQo+ID4gK8KgwqDCoMKgbG5yICRy
b290JHtiYXNlX2JpbmRpcn0gJHJvb3QvYmluDQo+ID4gK8KgwqDCoMKgbG5yICRyb290JHtiYXNl
X3NiaW5kaXJ9ICRyb290L3NiaW4NCj4gPiArwqDCoMKgwqBsbnIgJHJvb3Qke2Jhc2VfbGliZGly
fSAkcm9vdC8ke2Jhc2VsaWJ9DQo+ID4gDQo+ID4gwqDCoMKgwqDCoGlmIFsgIiR7bm9uYXJjaF9i
YXNlX2xpYmRpcn0iICE9ICIke2Jhc2VfbGliZGlyfSIgXTsgdGhlbg0KPiA+IC3CoMKgwqDCoMKg
wqDCoGluc3RhbGwgLWQgJHtJTUFHRV9ST09URlN9JHtub25hcmNoX2Jhc2VfbGliZGlyfQ0KPiA+
IC3CoMKgwqDCoMKgwqDCoGxuciAke0lNQUdFX1JPT1RGU30ke25vbmFyY2hfYmFzZV9saWJkaXJ9
DQo+ID4gJHtJTUFHRV9ST09URlN9L2xpYg0KPiA+ICvCoMKgwqDCoMKgwqDCoGluc3RhbGwgLW0g
MDc1NSAtZCAkcm9vdCR7bm9uYXJjaF9iYXNlX2xpYmRpcn0NCj4gTWVoLCBtaXNzZWQgdGhpcyB0
aGUgZmlyc3QgdGltZSwgYnV0IHlvdSByZWludHJvZHVjZSBhbiB1bm5lY2Vzc2FyeQ0KPiAtbSAw
NzU1IGhlcmUuDQpPT3BzISEhIHRoZXJlIHdlbnQgc29tZXRoaW5nIHdyb25nIHdoaWxlIHJlYmFz
aW5nIG15IGNoYW5nZXMsIGkgd2lsbA0KcmVzZW5kIHRoZSBwYXRjaCwgdGhhbnNrIGZvciBwb2lu
dGluZy4NCg0KLSBBbWFybmF0aA==

