Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 356806011C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Feb 2019 00:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B7A151830E;
	Sun, 10 Feb 2019 01:34:29 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id J5WYu4k54Zjn; Sun, 10 Feb 2019 01:34:28 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id C368A182BF;
	Sun, 10 Feb 2019 01:34:28 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB4221E057;
	Sun, 10 Feb 2019 01:34:28 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9ED261E056;
	Sun, 10 Feb 2019 01:34:28 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Sun, 10 Feb 2019 01:34:28 +0100 (CET)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id 901742B1E;
	Sun, 10 Feb 2019 01:34:28 +0100 (CET)
Received: from xbox12.axis.com (10.0.5.26) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sun, 10 Feb 2019 01:34:28 +0100
Received: from XBOX04.axis.com (10.0.5.18) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Sun, 10 Feb 2019 01:34:28 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Sun, 10 Feb 2019 01:34:28 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] glibc-locale: Rewrite do_install using install
	utility instead of cp
Thread-Index: AQHUv8H4S05K/Dw9N0KsF3v09ipIeaXYMMiQ
Date: Sun, 10 Feb 2019 00:34:27 +0000
Message-ID: <fee2404e2b1647a389091ae2b7de3fb3@XBOX04.axis.com>
References: <20190208005611.8039-1-raj.khem@gmail.com>
	<2b5d0361200b48969cbbb269ca2272ee@XBOX04.axis.com>
	<CAMKF1sr-s=7m1-0kajeNYesLZ9qpmHhNu7mS1-bEfjunvfPigQ@mail.gmail.com>
In-Reply-To: <CAMKF1sr-s=7m1-0kajeNYesLZ9qpmHhNu7mS1-bEfjunvfPigQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc-locale: Rewrite do_install using install utility instead of cp
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
X-List-Received-Date: Sun, 10 Feb 2019 00:34:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPg0KPiBTZW50OiBkZW4gOCBmZWJydWFyaSAyMDE5IDE2OjIxDQo+IFRvOiBQZXRl
ciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gQ2M6IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBbUEFUQ0hdIGdsaWJjLWxvY2FsZTogUmV3cml0ZSBkb19pbnN0YWxsIHVzaW5nDQo+IGlu
c3RhbGwgdXRpbGl0eSBpbnN0ZWFkIG9mIGNwDQo+IA0KPiBPbiBGcmksIEZlYiA4LCAyMDE5IGF0
IDEyOjQ0IEFNIFBldGVyIEtqZWxsZXJzdGVkdA0KPiA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMu
Y29tPiB3cm90ZToNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+
IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiA8b3BlbmVtYmVkZGVkLQ0KPiA+ID4gY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IE9uIEJlaGFsZiBPZiBLaGVtIFJhag0KPiA+ID4gU2VudDogZGVuIDggZmVicnVhcmkgMjAx
OSAwMTo1Ng0KPiA+ID4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gPiA+IFN1YmplY3Q6IFtPRS1jb3JlXSBbUEFUQ0hdIGdsaWJjLWxvY2FsZTogUmV3cml0
ZSBkb19pbnN0YWxsIHVzaW5nDQo+ID4gPiBpbnN0YWxsIHV0aWxpdHkgaW5zdGVhZCBvZiBjcA0K
PiA+ID4NCj4gPiA+IFRoaXMgaGFzIGJlZW4gYSBjb25zdGFudCBzb3VyY2Ugb2YgdHJvdWJsZSBm
b3IgYnVpbGQgZmFpbHVyZXMgZHVlDQo+IHRvDQo+ID4gPiBob3N0LXVzZXItY29udGFtaW5hdGVk
IFFBIGVycm9ycyBvZiBzb3J0DQo+ID4gPg0KPiA+ID4gRVJST1I6IFFBIElzc3VlOiBnbGliYy1s
b2NhbGU6IC9nbGliYy1iaW5hcnktbG9jYWxlZGF0YS1jYS0NCj4gPiA+IGVzK3ZhbGVuY2lhL3Vz
ci9saWIvbG9jYWxlL2NhX0VTQHZhbGVuY2lhL0xDX01PTkVUQVJZIGlzIG93bmVkIGJ5DQo+IHVp
ZA0KPiA+ID4gMzAwNCwgd2hpY2ggaXMgdGhlIHNhbWUgYXMgdGhlIHVzZXIgcnVubmluZyBiaXRi
YWtlLiBUaGlzIG1heSBiZQ0KPiBkdWUgdG8NCj4gPiA+IGhvc3QgY29udGFtaW5hdGlvbiBbaG9z
dC11c2VyLWNvbnRhbWluYXRlZF0NCj4gPiA+DQo+ID4gPiBTbyBmYXIgd2UgaGF2ZSB0cmllZCB0
byBtb3VsZCBjcCBjb21tYW5kIGludG8gbm90IGNhcnJ5aW5nIHRoZQ0KPiBidWlsZA0KPiA+ID4g
dXNlciBwZXJtaXNzaW9ucyBpbnRvIGluc3RhbGwgYXJlYSBidXQgaXQgaXMgbmV2ZXIgZW50aXJl
bHkgZml4ZWQNCj4gc2luY2UNCj4gPiA+IHRoZSBpc3N1ZSBrZWVwcyBwb3BwaW5nIHVwIGluIHZh
cmlvdXMgc2NlbmVzDQo+ID4gPg0KPiA+ID4gVGhpcyBwYXRjaCByZXBsYWNlcyB1c2Ugb2YgY3Ag
d2l0aCBpbnN0YWxsIHV0aWxpdHkgYW5kIHNwZWNpZmllcw0KPiBpbnN0YWxsDQo+ID4gPiBtb2Rl
IGZvciBmaWxlcyBleHBsY2l0bHkNCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYmMvZ2xpYmMtbG9jYWxlLmluYyB8IDQxICsrKysrKysrKysrKy0tLS0tLS0tDQo+IC0t
LS0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25z
KC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2ds
aWJjLWxvY2FsZS5pbmMNCj4gYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliYy1sb2NhbGUu
aW5jDQo+ID4gPiBpbmRleCA2Mzg0ZjljYmYxLi45Y2NlNjFiZjBiIDEwMDY0NA0KPiA+ID4gLS0t
IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmMtbG9jYWxlLmluYw0KPiA+ID4gKysrIGIv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmMtbG9jYWxlLmluYw0KPiA+ID4gQEAgLTcxLDI4
ICs3MSwyNyBAQCBGSUxFU19sb2NhbGVkZWYgPSAiJHtiaW5kaXJ9L2xvY2FsZWRlZiINCj4gPiA+
DQo+ID4gPiAgTE9DQUxFVFJFRVNSQyA9ICIke0NPTVBPTkVOVFNfRElSfS8ke1BBQ0tBR0VfQVJD
SH0vZ2xpYmMtc3Rhc2gtDQo+IGxvY2FsZSINCj4gPiA+DQo+ID4gPiAtZG9faW5zdGFsbCAoKSB7
DQo+ID4gPiAtICAgICBta2RpciAtcCAke0R9JHtiaW5kaXJ9ICR7RH0ke2RhdGFkaXJ9DQo+ID4g
PiAtICAgICBpZiBbIC1uICIkKGxzICR7TE9DQUxFVFJFRVNSQ30vJHtiaW5kaXJ9KSIgXTsgdGhl
bg0KPiA+ID4gLSAgICAgICAgICAgICBjcCAtUiAtLW5vLWRlcmVmZXJlbmNlIC0tcHJlc2VydmU9
bW9kZSxsaW5rcw0KPiAke0xPQ0FMRVRSRUVTUkN9LyR7YmluZGlyfS8qICR7RH0ke2JpbmRpcn0N
Cj4gPiA+IC0gICAgIGZpDQo+ID4gPiAtICAgICBpZiBbIC1uICIkKGxzICR7TE9DQUxFVFJFRVNS
Q30vJHtsb2NhbGVkaXJ9KSIgXTsgdGhlbg0KPiA+ID4gLSAgICAgICAgICAgICBta2RpciAtcCAk
e0R9JHtsb2NhbGVkaXJ9DQo+ID4gPiAtICAgICAgICAgICAgIGNwIC1SIC0tbm8tZGVyZWZlcmVu
Y2UgLS1wcmVzZXJ2ZT1tb2RlLGxpbmtzDQo+ICR7TE9DQUxFVFJFRVNSQ30vJHtsb2NhbGVkaXJ9
LyogJHtEfSR7bG9jYWxlZGlyfQ0KPiA+ID4gLSAgICAgZmkNCj4gPiA+IC0gICAgIGlmIFsgJHtA
ZC5nZXRWYXIoJ1BBQ0tBR0VfTk9fR0NPTlYnKX0gLWVxIDAgXTsgdGhlbg0KPiA+ID4gLSAgICAg
ICAgICAgICBta2RpciAtcCAke0R9JHtsaWJkaXJ9DQo+ID4gPiAtICAgICAgICAgICAgIGlmIFsg
LWUgJHtMT0NBTEVUUkVFU1JDfS8ke2xpYmRpcn0vZ2NvbnYgXTsgdGhlbg0KPiA+ID4gLSAgICAg
ICAgICAgICAgICAgICAgIGNwIC1SIC0tbm8tZGVyZWZlcmVuY2UgLS1wcmVzZXJ2ZT1tb2RlLGxp
bmtzDQo+ICR7TE9DQUxFVFJFRVNSQ30vJHtsaWJkaXJ9L2djb252ICR7RH0ke2xpYmRpcn0NCj4g
PiA+IC0gICAgICAgICAgICAgZmkNCj4gPiA+IC0gICAgICAgICAgICAgaWYgWyAtZSAke0xPQ0FM
RVRSRUVTUkN9LyR7ZGF0YWRpcn0vaTE4biBdOyB0aGVuDQo+ID4gPiAtICAgICAgICAgICAgICAg
ICAgICAgY3AgLVIgLS1uby1kZXJlZmVyZW5jZSAtLXByZXNlcnZlPW1vZGUsbGlua3MNCj4gJHtM
T0NBTEVUUkVFU1JDfS8ke2RhdGFkaXJ9L2kxOG4gJHtEfSR7ZGF0YWRpcn0NCj4gPiA+IC0gICAg
ICAgICAgICAgZmkNCj4gPiA+IC0gICAgIGZpDQo+ID4gPiAtICAgICBpZiBbIC1lICR7TE9DQUxF
VFJFRVNSQ30vJHtkYXRhZGlyfS9sb2NhbGUgXTsgdGhlbg0KPiA+ID4gLSAgICAgICAgICAgICBj
cCAtUiAtLW5vLWRlcmVmZXJlbmNlIC0tcHJlc2VydmU9bW9kZSxsaW5rcw0KPiAke0xPQ0FMRVRS
RUVTUkN9LyR7ZGF0YWRpcn0vbG9jYWxlICR7RH0ke2RhdGFkaXJ9DQo+ID4gPiArY29weV9sb2Nh
bGVfZmlsZXMoKSB7DQo+ID4gPiArICAgICBsb2NhbCBkaXI9JDEgbW9kZT0kMg0KPiA+ID4gKw0K
PiA+ID4gKyAgICAgWyAtZSAiJHtMT0NBTEVUUkVFU1JDfSRkaXIiIF0gfHwgcmV0dXJuIDANCj4g
PiA+ICsNCj4gPiA+ICsgICAgIGZvciBkIGluIC4gJChmaW5kICIke0xPQ0FMRVRSRUVTUkN9JGRp
ciIgLXR5cGUgZCAtcHJpbnRmICclUA0KPiAnKTsgZG8NCj4gPiA+ICsgICAgICAgICAgICAgaW5z
dGFsbCAtZCAke0R9JGRpci8kZA0KPiA+ID4gKyAgICAgICAgICAgICBmaW5kICIke0xPQ0FMRVRS
RUVTUkN9JGRpci8kZCIgLW1heGRlcHRoIDEgLXR5cGUgZiBcDQo+ID4gPiArICAgICAgICAgICAg
IC1leGVjIGluc3RhbGwgLW0gJG1vZGUgLXQgIiR7RH0kZGlyLyRkIiB7fSBcOw0KPiA+DQo+ID4g
SSBrbm93IEkgYW0gYSBzdWNrZXIgZm9yIGRldGFpbHMsIGJ1dCBwbGVhc2UgYWxpZ24gdGhlIGJy
b2tlbiBmaW5kDQo+IGxpbmUgc28NCj4gPiB0aGF0IGl0IGlzIG1vcmUgb2J2aW91cyB0aGF0IHRo
ZSBzZWNvbmQgbGluZSBpcyBhIGNvbnRpbnVhdGlvbiwgaS5lLjoNCj4gPg0KPiA+ICAgICAgICAg
ICAgICAgICBmaW5kICIke0xPQ0FMRVRSRUVTUkN9JGRpci8kZCIgLW1heGRlcHRoIDEgLXR5cGUg
ZiBcDQo+ID4gICAgICAgICAgICAgICAgICAgICAgLWV4ZWMgaW5zdGFsbCAtbSAkbW9kZSAtdCAi
JHtEfSRkaXIvJGQiIHt9IFw7DQo+ID4NCj4gDQo+IFlvdSBhcmUgZG9pbmcgZ29vZCBoZXJlLCBJ
IHJlYWxseSBhcHByZWNpYXRlIHRoZSBmZWVkYmFjay4gRG8geW91DQo+IHRoaW5rIGFsaWduaW5n
IGl0DQo+IHVuZGVyIGJlZ2lubmluZyBvZiBxdW90ZSBpcyBtb3JlIHJlYWRhYmxlIG9yIGFsaWdu
aW5nIHdoZXJlIGZpbmQgY21kDQo+IGJlZ2lucyBpcyBiZXR0ZXIgPw0KPiBJIHdpbGwgbWFrZSB0
aGlzIGFzIGEgZm9sbG93dXAgcGF0Y2ggYW5kIHNlbmQgaXQgd2l0aCBuZXh0IGxvdCBvZg0KPiBt
aW5vciBjaGFuZ2VzIHRoYXQgSSBoYXZlIGluDQo+IHF1ZXVlLg0KDQpUaGUgcGF0Y2gsIGFzIGl0
IHdhcyBpbnRlZ3JhdGVkIHRvIG1hc3RlciwgaXMgZmluZS4NCg0KPiA+ID4gKyAgICAgZG9uZQ0K
PiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+ICtkb19pbnN0YWxsKCkgew0KPiA+ID4gKyAgICAgY29w
eV9sb2NhbGVfZmlsZXMgJHtiaW5kaXJ9IDA3NTUNCj4gPiA+ICsgICAgIGNvcHlfbG9jYWxlX2Zp
bGVzICR7bG9jYWxlZGlyfSAwNjQ0DQo+ID4gPiArICAgICBpZiBbICR7UEFDS0FHRV9OT19HQ09O
Vn0gLWVxIDAgXTsgdGhlbg0KPiA+ID4gKyAgICAgICAgICAgICBjb3B5X2xvY2FsZV9maWxlcyAk
e2xpYmRpcn0vZ2NvbnYgMDc1NQ0KPiA+ID4gKyAgICAgICAgICAgICBjb3B5X2xvY2FsZV9maWxl
cyAke2RhdGFkaXJ9L2kxOG4gMDY0NA0KPiA+ID4gICAgICAgZmkNCj4gPiA+IC0gICAgIGNwIC1S
IC0tbm8tZGVyZWZlcmVuY2UgLS1wcmVzZXJ2ZT1tb2RlLGxpbmtzDQo+ICR7TE9DQUxFVFJFRVNS
Q30vU1VQUE9SVEVEICR7V09SS0RJUn0NCj4gPiA+ICsgICAgIGNvcHlfbG9jYWxlX2ZpbGVzICR7
ZGF0YWRpcn0vbG9jYWxlIDA2NDQNCj4gPiA+ICsgICAgIGluc3RhbGwgLW0gMDY0NCAke0xPQ0FM
RVRSRUVTUkN9L1NVUFBPUlRFRA0KPiAke1dPUktESVJ9L1NVUFBPUlRFRA0KPiA+ID4gIH0NCj4g
PiA+DQo+ID4gPiAgaW5oZXJpdCBsaWJjLXBhY2thZ2UNCj4gPiA+IC0tDQo+ID4gPiAyLjIwLjEN
Cj4gPg0KPiA+IC8vUGV0ZXINCj4gPg0KDQovL1BldGVyDQoNCg==

