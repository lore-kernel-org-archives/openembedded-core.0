Received: from esa1.hc324-48.eu.iphmx.com (esa1.hc324-48.eu.iphmx.com [207.54.68.119])
 by mx.groups.io with SMTP id smtpd.web10.8686.1612534916207501004
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=bVTQFT/H;
 spf=pass (domain: bmw.de, ip: 207.54.68.119, mailfrom: prvs=6636a3d1c=michael.ho@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1612534916; x=1644070916;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=tIr8XUCAK/47lXgcI5jMAy/Oj0/E++H/zjrtZJ7MZ5o=;
  b=bVTQFT/HuDGBcW+kwanwxuBhS25b8PoTDGacN68lfKJh8q/gH52h8cwb
   pijJoWbze0kMolTfOMGQdBkat/RzM8ioCBy/hciSKVOOWr9etiexaxsUy
   C4sLd3rRW6HgijRD5/kvDTzmf1PNJS/CA4zQAMjzROXJhERXB3k/EXs4z
   s=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa1.hc324-48.eu.iphmx.com with ESMTP/TLS; 05 Feb 2021 15:21:53 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw6.muc with ESMTP/TLS;
 05 Feb 2021 15:21:53 +0100
Received: from smucm09l.bmwgroup.net (HELO smucm09l.europe.bmw.corp) ([160.48.96.44])
 by esabb2.muc with ESMTP/TLS; 05 Feb 2021 15:21:53 +0100
Received: from smucm09k.europe.bmw.corp (160.48.96.43) by smucm09l.europe.bmw.corp
 (160.48.96.44) with Microsoft SMTP Server (TLS;
 Fri, 5 Feb 2021 15:21:52 +0100
Received: from smucm09k.europe.bmw.corp ([160.48.96.43]) by
 smucm09k.europe.bmw.corp ([160.48.96.43]) with mapi id 15.00.1497.010; Fri, 5
 Feb 2021 15:21:52 +0100
From: "Michael Ho" <Michael.Ho@bmw.de>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] rootfs.py: expose prepared_index and ipk_repo_workdir for OpkgPM
Thread-Topic: [OE-core] [PATCH] rootfs.py: expose prepared_index and
 ipk_repo_workdir for OpkgPM
Thread-Index: AQHW+5w1APlpe3yRokqLFSDXrmJXWqpJbhmAgAAvLQA=
Date: Fri, 5 Feb 2021 14:21:52 +0000
Message-ID: <6C6D328B-C39B-42E2-9AFF-60E013C57917@bmw.de>
References: <1612515106-377011-1-git-send-email-michael.ho@bmw.de>
 <1612515106-377011-2-git-send-email-michael.ho@bmw.de>
 <2148a893a9deec135bfa733be2a4ec6c99e9201e.camel@linuxfoundation.org>
In-Reply-To: <2148a893a9deec135bfa733be2a4ec6c99e9201e.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-GB
Content-Type: text/plain; charset="utf-8"
Content-ID: <13862D903F1BF14F9D89A23549007301@bmwmail.corp>
Content-Transfer-Encoding: base64

SGkgUlAsDQoNClRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzLiBTb3VuZHMgZ29vZCB0byBtZS4gSSds
bCBzZW5kIGFub3RoZXIgcGF0Y2hzZXQuDQoNCkknbGwgc2VlIGlmIEkgY2FuIGFsc28gc2V0IHVw
IGEgcmVuYW1pbmcgcGF0Y2ggZm9yIHRoZSBvdGhlciBJUEtHIHZhcmlhYmxlcyBmb3INCnJldmll
dyBjb21tZW50cy4NCg0KS2luZCByZWdhcmRzLA0KTWljaGFlbA0KDQotLSANCkJNVyBDYXIgSVQg
R21iSA0KTWljaGFlbCBIbw0KU3BlemlhbGlzdCBFbnR3aWNrbHVuZyDigJMgQnVpbGQgYW5kIFJl
bGVhc2UgRW5naW5lZXJpbmcNCkxpc2UtTWVpdG5lci1TdHJhw59lIDE0DQo4OTA4MSBVbG0NCg0K
VGVsLjogwq0rNDktNzMxLTM3ODA0LTA3MQ0KTW9iaWw6ICs0OS0xNTItNTQ5ODAtNDcxDQpGYXg6
ICs0OS03MzEtMzc4MDQtMDAxDQpNYWlsOiBtaWNoYWVsLmhvQGJtdy1jYXJpdC5kZSANCldlYjog
aHR0cDovL3d3dy5ibXctY2FyaXQuZGUgPGh0dHA6Ly93d3cuYm13LWNhcml0LmRlLz4NCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCkJNVyBDYXIgSVQgR21iSA0KR2VzY2jDpGZ0c2bDvGhyZXI6IEthaS1Vd2Ug
QmFsc3p1d2VpdCB1bmQgTWljaGFlbCBCw7Z0dHJpY2gNClNpdHogdW5kIFJlZ2lzdGVyZ2VyaWNo
dDogTcO8bmNoZW4gSFJCIDEzNDgxMA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIA0KDQrvu79PbiAwNS4w
Mi4yMSwgMTM6MzMsICJSaWNoYXJkIFB1cmRpZSIgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmc+IHdyb3RlOg0KDQogICAgT24gRnJpLCAyMDIxLTAyLTA1IGF0IDA5OjUxICswMTAw
LCBNaWNoYWVsIEhvIHdyb3RlOg0KICAgID4gRnJvbTogTWljaGFlbCBIbyA8TWljaGFlbC5Ib0Bi
bXcuZGU+DQogICAgPiANCiAgICA+IFRoZSBPcGtnUE0gY2xhc3MgaGFzIHNldmVyYWwgY29uc3Ry
dWN0b3Igb3B0aW9ucyB0aGF0IGFsbG93cyBmb3Igc2tpcHBpbmcNCiAgICA+IHRoZSBpcGsgcmVw
b3NpdG9yeSBzZXQgdXAgYW5kIGNvbnRyb2xsaW5nIHRoZSBpcGsgcmVwb3NpdG9yeSBkaXJlY3Rv
cnkuIFRoaXMNCiAgICA+IGNvbW1pdCBleHBvc2VzIHRoZXNlIG9wdGlvbiB2aWEgdGhlIE9wa2dS
b290ZnMgY2xhc3Mgc28gb3RoZXJzIGNhbiBtYWtlIHVzZQ0KICAgID4gb2YgdGhlbSBpZiB0aGV5
IHdpc2ggdG8uDQogICAgPiANCiAgICA+IEFkZHMgdGhlIGJpdGJha2UgdmFyaWFibGVzICJJUEtH
UkVQT19UQVJHRVRfUFJFUEFSRUQiIGFuZCAiSVBLR1JFUE9fVEFSR0VUIg0KICAgID4gdG8gYWN0
IGFzIHRoZSBpbnRlcmZhY2VzLg0KICAgID4gDQogICAgPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVs
IEhvIDxNaWNoYWVsLkhvQGJtdy5kZT4NCiAgICA+IC0tLQ0KICAgID4gIG1ldGEvbGliL29lL3Bh
Y2thZ2VfbWFuYWdlci9pcGsvcm9vdGZzLnB5IHwgMTQgKysrKysrKysrKysrLS0NCiAgICA+ICAx
IGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCiAgICA+IA0K
ICAgID4gZGlmZiAtLWdpdCBhL21ldGEvbGliL29lL3BhY2thZ2VfbWFuYWdlci9pcGsvcm9vdGZz
LnB5IGIvbWV0YS9saWIvb2UvcGFja2FnZV9tYW5hZ2VyL2lway9yb290ZnMucHkNCiAgICA+IGlu
ZGV4IDI2ZGJlZTYuLjYzMTNiNzIgMTAwNjQ0DQogICAgPiAtLS0gYS9tZXRhL2xpYi9vZS9wYWNr
YWdlX21hbmFnZXIvaXBrL3Jvb3Rmcy5weQ0KICAgID4gKysrIGIvbWV0YS9saWIvb2UvcGFja2Fn
ZV9tYW5hZ2VyL2lway9yb290ZnMucHkNCiAgICA+IEBAIC0xMjksNiArMTI5LDE0IEBAIGNsYXNz
IFBrZ1Jvb3RmcyhEcGtnT3BrZ1Jvb3Rmcyk6DQogICAgPiAgICAgICAgICBzZWxmLm1hbmlmZXN0
ID0gUGtnTWFuaWZlc3QoZCwgbWFuaWZlc3RfZGlyKQ0KICAgID4gICAgICAgICAgc2VsZi5vcGtn
X2NvbmYgPSBzZWxmLmQuZ2V0VmFyKCJJUEtHQ09ORl9UQVJHRVQiKQ0KICAgID4gICAgICAgICAg
c2VsZi5wa2dfYXJjaHMgPSBzZWxmLmQuZ2V0VmFyKCJBTExfTVVMVElMSUJfUEFDS0FHRV9BUkNI
UyIpDQogICAgPiArICAgICAgICBzZWxmLm9wa2dfcmVwbyA9IHNlbGYuZC5nZXRWYXIoIklQS0dS
RVBPX1RBUkdFVCIpDQogICAgPiArICAgICAgICBzZWxmLm9wa2dfcmVwb19wcmVwYXJlZCA9IHNl
bGYuZC5nZXRWYXIoIklQS0dSRVBPX1RBUkdFVF9QUkVQQVJFRCIpDQogICAgPiArDQogICAgPiAr
ICAgICAgICBrd2FyZ3MgPSB7fQ0KICAgID4gKyAgICAgICAgaWYgc2VsZi5vcGtnX3JlcG86DQog
ICAgPiArICAgICAgICAgICAga3dhcmdzWyJpcGtfcmVwb193b3JrZGlyIl0gPSBzZWxmLm9wa2df
cmVwbw0KICAgID4gKyAgICAgICAgaWYgc2VsZi5vcGtnX3JlcG9fcHJlcGFyZWQ6DQogICAgPiAr
ICAgICAgICAgICAga3dhcmdzWyJwcmVwYXJlX2luZGV4Il0gPSBGYWxzZQ0KICAgID4gIA0KICAg
ID4gDQoNCiAgICBJdCBzZWVtcyByZWFzb25hYmxlIHRvIGV4cG9zZSB0aGVtLCBJJ2QganVzdCBz
dWdnZXN0IHRoYXQgd2UgZG9uJ3QgcHV0DQogICAgdGhlbSBpbiBzZWxmIGhlcmUgYnV0IGRvIHNv
bWV0aGluZyBsaWtlOg0KDQogICAgKyAgICAgICAgaWYgc2VsZi5kLmdldFZhcigiSVBLR1JFUE9f
VEFSR0VUIik6DQogICAgKyAgICAgICAgICAgIGt3YXJnc1siaXBrX3JlcG9fd29ya2RpciJdID0g
c2VsZi5vcGtnX3JlcG8NCiAgICArICAgICAgICBpZiBzZWxmLmQuZ2V0VmFyKCJJUEtHUkVQT19U
QVJHRVRfUFJFUEFSRUQiKToNCiAgICArICAgICAgICAgICAga3dhcmdzWyJwcmVwYXJlX2luZGV4
Il0gPSBGYWxzZQ0KDQogICAgYW5kIG15IG9ubHkgb3RoZXIgY29uY2VybiBpcyB0aGUgbmFtaW5n
LiBTb21laG93IHdlIG5lZWQgdG8gZ2V0IGZyb20NCiAgICB0aGUgbWVzcyB3ZSdyZSBjdXJyZW50
bHkgaW4gdG8gc29tZSBraW5kIG9mIG1vcmUgY29uc2lzdGVudCBhbmQNCiAgICB1bmRlcnN0YW5k
YWJsZSBuYW1pbmcgb2YgdmFyaWFibGVzLg0KDQogICAgT1BLR19ST09URlNfRkVFRF9XT1JLRElS
DQogICAgT1BLR19ST09URlNfUkVCVUlMRElOREVYDQoNCiAgICBtYXliZT8NCg0KICAgIEknZCBh
bHNvIHllcywgd2Ugc2hvdWxkIGRvY3VtZW50IHRoZW0uDQoNCiAgICBDaGVlcnMsDQoNCiAgICBS
aWNoYXJkDQoNCg==
