Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6442C6C3EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 09:37:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2018 01:37:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,231,1539673200"; d="scan'208";a="89182930"
Received: from pgsmsx108.gar.corp.intel.com ([10.221.44.103])
	by orsmga007.jf.intel.com with ESMTP; 14 Nov 2018 01:37:42 -0800
Received: from kmsmsx155.gar.corp.intel.com ([169.254.15.19]) by
	PGSMSX108.gar.corp.intel.com ([169.254.8.100]) with mapi id
	14.03.0415.000; Wed, 14 Nov 2018 17:37:41 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 01/12] build-appliance: Drop test which is
	already	automated
Thread-Index: AQHUeDig1wikiz6h+06OayQK/VaC5KVLX7jwgAAjwgCAA2taIP//lIqAgACHTaA=
Date: Wed, 14 Nov 2018 09:37:40 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D0434811FA22@KMSMSX155.gar.corp.intel.com>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D0434811E1D4@KMSMSX155.gar.corp.intel.com>
	<3c2a7b56677a1eb00aace62b4608055810e9f9f8.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D0434811F952@KMSMSX155.gar.corp.intel.com>
	<389bf0dd9a15dce53d94e4ae426d47099d083ae6.camel@linuxfoundation.org>
In-Reply-To: <389bf0dd9a15dce53d94e4ae426d47099d083ae6.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMmE0NTE0NGEtNTcyOC00MWQ1LWI0YTktYWJmNGNhOTFlZDBkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNk94eEh1eitWRHB1V2hQZjROdldvQURSc0ZLM3Fhbkk5dGJRaCt3a2NhY2UxSzRKZjhOYVpwdXR4anZZbkM4diJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH 01/12] build-appliance: Drop test which is already	automated
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
X-List-Received-Date: Wed, 14 Nov 2018 09:37:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T2ssIG5vdGVkLCBJIGFncmVlZC4gTGV0IG1lIGluaXRpYWxpemUgdGhlIGJ1aWxkLWFwcGxpYW5j
ZSB0ZXN0Y2FzZXMgY29uc29saWRhdGlvbi4gVGhhbmsgeW91IGZvciB5b3VyIGlucHV0cyBhbmQg
ZmVlZGJhY2tzLiANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IHJpY2hhcmQu
cHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcgW21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZv
dW5kYXRpb24ub3JnXSANClNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMTQsIDIwMTggNTozMiBQ
TQ0KVG86IFllb2gsIEVlIFBlbmcgPGVlLnBlbmcueWVvaEBpbnRlbC5jb20+OyBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQ
QVRDSCAwMS8xMl0gYnVpbGQtYXBwbGlhbmNlOiBEcm9wIHRlc3Qgd2hpY2ggaXMgYWxyZWFkeSBh
dXRvbWF0ZWQNCg0KT24gV2VkLCAyMDE4LTExLTE0IGF0IDA4OjA1ICswMDAwLCBZZW9oLCBFZSBQ
ZW5nIHdyb3RlOg0KPiA+IEluIHRoYXQgY2FzZSB3b3VsZG4ndCBpdCBtYWtlIG1vcmUgc2Vuc2Ug
dG8gY29tYmluZSB0aGVzZSBzdGVwcyB3aXRoIA0KPiA+IHNvbWUgb2YgdGhlIG90aGVyIGJ1aWxk
IGFwcGxpYW5jZSB0ZXN0cz8gV2UgY291bGQgYWRkIGFuIGV4dHJhIHN0ZXAgDQo+ID4gd2hlcmUg
dGhlIHRlc3RlciBidWlsZHMgYnVpbGQtYXBwbGlhbmNlIHJhdGhlciB0aGFuIGhhdmluZyBtdWx0
aXBsZSANCj4gPiB0ZXN0cyB3aGljaCBzdGFydCAibGF1bmNoIGJ1aWxkIGFwcGxpYW5jZSI/DQo+
IA0KPiBJbiBnZW5lcmFsLCBQcm9zICYgQ29ucyBmb3IgbWVyZ2luZyB0ZXN0IGNhc2VzLCBQcm9z
OiByZWR1Y2VkIHRoZSANCj4gbnVtYmVyIG9mIHRlc3QgY2FzZXMgJiBtYWtpbmcgaXQgc2ltcGxl
ciBmb3IgcmVhZGluZywgQ29uczogbG9zcyBvZiANCj4gbG93ZXIgbGV2ZWwgdHJhY2tpbmcgb24g
dGhlIHRlc3Qgc3RhdHVzLg0KPiBFeGFtcGxlOiBjdXJyZW50bHkgd2UgaGF2ZSBtdWx0aXBsZSB0
ZXN0IGNhc2VzIGZvciBidWlsZC1hcHBsaWFuY2UgDQo+IHdoZXJlIGVhY2ggdGVzdCBjYXNlcyB0
ZXN0aW5nIHRoZSBhYmlsaXR5IHRvIHVzZSBidWlsZC1hcHBsaWFuY2UtIA0KPiBpbWFnZSB0byBi
aXRiYWtlIGRpZmZlcmVudCB0eXBlIG9mIGltYWdlcyAocmVjZW50bHkgd2UgZGV0ZWN0IHRoYXQg
DQo+IGJ1aWxkLWFwcGxpYW5jZS1pbWFnZSB3YXMgYWJsZSB0byBidWlsZCBjb3JlLWltYWdlLW1p
bmltYWwgJiBjb3JlLSANCj4gaW1hZ2Utc2F0by1zZGsgYnV0IGl0IGZhaWxlZCB0byBidWlsZCB0
aGUgYnVpbGQtYXBwbGlhbmNlLWltYWdlKSwgaWYgDQo+IHdlIG1lcmdlIG11bHRpcGxlIHRlc3Qg
Y2FzZXMgaW50byBnZW5lcmFsIA0KPiB0ZXN0X2J1aWxkX2FwcGxpYW5jZV9jYW5fYnVpbGRfaW1h
Z2VzLCB0aGVuIHdlIHdpbGwgbG9zcyB0aGUgDQo+IHZpc2liaWxpdGllcyBvbiB3aGljaCB0eXBl
IG9mIGltYWdlcyBmYWlsZWQgd2hlbiB0aGlzIHRlc3QgZmFpbGVkLCANCj4gdW5sZXNzIHdlIGxv
b2tlZCBpbnRvIHRoZSB0ZXN0IGxvZyBpZiB0ZXN0IGxvZyB3ZXJlIGdlbmVyYXRlZC4NCg0KSWYg
YSBzdGVwIGZhaWxzLCBRQSB3aWxsIHdyaXRlIGEgYnVnIHJlcG9ydCBmb3IgdGhlIGZhaWx1cmUu
IEknZCBoYXZlIHRob3VnaHQgaXQgd291bGQgYmUgcXVpdGUgY2xlYXIgaW4gdGhpcyBjYXNlIHdo
YXQgdGhlIGZhaWxpbmcgc3RlcCB3YXM/DQpRQSB3b3VsZCBhbHNvIGFsd2F5cyBpbmNsdWRlIGEg
ZmFpbGluZyBidWlsZCBsb2cgaW4gc3VjaCBhIGNhc2Ugd2hpY2ggc2hvdWxkIGFsc28gbWFrZSB0
aGUgcHJvYmxlbSBxdWl0ZSBjbGVhci4NCg0KRXZlbiBpZiB0aGUgc3RlcCB3YXMgImJpdGJha2Ug
Y29yZS1pbWFnZS1taW5pbWFsIGNvcmUtaW1hZ2Utc2F0byBidWlsZC0gYXBwbGlhbmNlLWltYWdl
IC1rIiwgdGhlIGxvZ3Mgc2hvdWxkIHN0aWxsIGNsZWFybHkgc2hvdyB3aGF0IGl0IHdhcyB0aGF0
IGZhaWxlZD8NCg0KQ2hlZXJzLA0KDQpSaWNoYXJkDQoNCg==

