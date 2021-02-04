Received: from esa8.hc324-48.eu.iphmx.com (esa8.hc324-48.eu.iphmx.com [207.54.65.242])
 by mx.groups.io with SMTP id smtpd.web09.7920.1612446312753883533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 05:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=nOVPW1Il;
 spf=pass (domain: bmw.de, ip: 207.54.65.242, mailfrom: prvs=6625637df=michael.ho@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1612446312; x=1643982312;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=S+6AvKifB2pADIfISTB7CeQySk3Ov8S+2IPSaf24Sck=;
  b=nOVPW1Il0JMy29EvmyDD7FBgsu+s+K4J1MVKT9rM4G8MkPQYFmowIYLq
   XC2px+JvvUTEDJmM0GTeAnhahLrKb9o1E/T3TezguuGYDb6IJRTAPM9Ay
   ddY5eI8AX0rW1jHY7f1b7kbF+rj53cItWi3yavHnoeEyZufjEtYxJ2tQu
   Y=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa8.hc324-48.eu.iphmx.com with ESMTP/TLS; 04 Feb 2021 14:44:55 +0100
Received: from esabb4.muc ([160.50.100.33])  by esagw3.muc with ESMTP/TLS;
 04 Feb 2021 14:44:43 +0100
Received: from smucm09j.bmwgroup.net (HELO smucm09j.europe.bmw.corp) ([160.48.96.42])
 by esabb4.muc with ESMTP/TLS; 04 Feb 2021 14:44:43 +0100
Received: from smucm09k.europe.bmw.corp (160.48.96.43) by smucm09j.europe.bmw.corp
 (160.48.96.42) with Microsoft SMTP Server (TLS;
 Thu, 4 Feb 2021 14:44:43 +0100
Received: from smucm09k.europe.bmw.corp ([160.48.96.43]) by
 smucm09k.europe.bmw.corp ([160.48.96.43]) with mapi id 15.00.1497.010; Thu, 4
 Feb 2021 14:44:43 +0100
From: "Michael Ho" <Michael.Ho@bmw.de>
To: <tomasz.dziendzielski@gmail.com>,
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] license_image: Introduce SKIP_LICENSE_MANIFEST_RECIPES variable to prevent from trying to use license recipeinfo file from image recipes
Thread-Topic: [OE-core] [PATCH] license_image: Introduce
 SKIP_LICENSE_MANIFEST_RECIPES variable to prevent from trying to use license
 recipeinfo file from image recipes
Thread-Index: AQHW+u7O4DCEUh72tkmAOHx4mHk5L6pIAeoA
Date: Thu, 4 Feb 2021 13:44:43 +0000
Message-ID: <94F738B3-138E-4115-81E7-9214AA5175E8@bmw.de>
References: <20210204121323.1696-1-tomasz.dziendzielski@gmail.com>
In-Reply-To: <20210204121323.1696-1-tomasz.dziendzielski@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-GB
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A4E468C8D87424FBB57342081D646DD@bmwmail.corp>
Content-Transfer-Encoding: base64

SGksDQoNCkkgc3VibWl0dGVkIHNvbWV0aGluZyBzaW1pbGFyIGF3aGlsZSBiYWNrIHRvIHRoaXMg
bWFpbGluZyBsaXN0Lg0KDQpodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtY29yZS9tZXNzYWdlLzE0NjYwNz9wPSwsLDIwLDAsMCwwOjpyZWxldmFuY2UsLE1pY2hh
ZWwuSG8lNDBibXcuZGUsMjAsMiwwLDc5NjE5Mjg3DQoNCklmIHlvdXJzIG1ha2VzIG1vcmUgc2Vu
c2UgKEkgZGlkbid0IHRoaW5rIHRoZXJlJ3MgZXZlciBhIGNhc2Ugd2hlcmUgYW4gaW1hZ2UNCnJl
Y2lwZSBhY3R1YWxseSBoYXMgYSBsaWNlbnNlKSB0aGVuIG15IHBhdGNoIHNob3VsZCBwcm9iYWJs
eSBiZSBza2lwcGVkIG92ZXINCmZvciB5b3Vycy4NCg0KS2luZCByZWdhcmRzLA0KTWljaGFlbCBI
bw0KDQotLSANCkJNVyBDYXIgSVQgR21iSA0KTWljaGFlbCBIbw0KU3BlemlhbGlzdCBFbnR3aWNr
bHVuZyDigJMgQnVpbGQgYW5kIFJlbGVhc2UgRW5naW5lZXJpbmcNCkxpc2UtTWVpdG5lci1TdHJh
w59lIDE0DQo4OTA4MSBVbG0NCg0KVGVsLjogwq0rNDktNzMxLTM3ODA0LTA3MQ0KTW9iaWw6ICs0
OS0xNTItNTQ5ODAtNDcxDQpGYXg6ICs0OS03MzEtMzc4MDQtMDAxDQpNYWlsOiBtaWNoYWVsLmhv
QGJtdy1jYXJpdC5kZSANCldlYjogaHR0cDovL3d3dy5ibXctY2FyaXQuZGUgPGh0dHA6Ly93d3cu
Ym13LWNhcml0LmRlLz4NCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkJNVyBDYXIgSVQgR21iSA0KR2VzY2jD
pGZ0c2bDvGhyZXI6IEthaS1Vd2UgQmFsc3p1d2VpdCB1bmQgTWljaGFlbCBCw7Z0dHJpY2gNClNp
dHogdW5kIFJlZ2lzdGVyZ2VyaWNodDogTcO8bmNoZW4gSFJCIDEzNDgxMA0KLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KIA0KDQrvu79PbiAwNC4wMi4yMSwgMTM6MTEsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIG9uIGJlaGFsZiBvZiBUb21hc3ogRHppZW5kemllbHNraSIgPG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgb24gYmVoYWxmIG9mIHRvbWFz
ei5kemllbmR6aWVsc2tpQGdtYWlsLmNvbT4gd3JvdGU6DQoNCiAgICBJZiBpbWFnZSByZWNpcGUg
ZGVwZW5kcyBvbiBhbm90aGVyIGltYWdlIHJlY2lwZSBpdCB3aWxsIHRyeSB0byB1c2UNCiAgICBs
aWNlbnNlIHJlY2lwZWluZm8gdGhhdCBpcyBub3QgZGVwbG95ZWQuIEl0IHdpbGwgcmVzdWx0IGlu
Og0KICAgIHwgRXhjZXB0aW9uOiBGaWxlTm90Rm91bmRFcnJvcjogW0Vycm5vIDJdIE5vIHN1Y2gg
ZmlsZSBvciBkaXJlY3Rvcnk6DQogICAgfCAnVE1QRElSL2RlcGxveS9saWNlbnNlcy9mb28taW1h
Z2UvcmVjaXBlaW5mbycNCg0KICAgIFdlIGNhbid0IGRldGVybWluZSBpbiBhIHNpbXBsZSBhbmQg
ZWZmaWNpZW50IHdheSBpZiBkZXBlbmRlbmN5IHJlY2lwZQ0KICAgIGluaGVyaXRzIGltYWdlLmJi
Y2xhc3MsIHNvIGxldCdzIGludHJvZHVjZSBTS0lQX0xJQ0VOU0VfTUFOSUZFU1RfUkVDSVBFUw0K
ICAgIHZhcmlhYmxlIHRoYXQgd2lsbCBjb250YWluIGxpc3Qgb2YgcmVjaXBlcyB0aGF0IHNob3Vs
ZCBiZSBza2lwcGVkLg0KDQogICAgU2lnbmVkLW9mZi1ieTogVG9tYXN6IER6aWVuZHppZWxza2kg
PHRvbWFzei5kemllbmR6aWVsc2tpQGdtYWlsLmNvbT4NCiAgICAtLS0NCiAgICAgbWV0YS9jbGFz
c2VzL2xpY2Vuc2VfaW1hZ2UuYmJjbGFzcyB8IDMgKystDQogICAgIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KICAgIGRpZmYgLS1naXQgYS9tZXRhL2Ns
YXNzZXMvbGljZW5zZV9pbWFnZS5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL2xpY2Vuc2VfaW1hZ2Uu
YmJjbGFzcw0KICAgIGluZGV4IDhmZDg4Y2ZiMmQuLmUyZjMxNzgzMDYgMTAwNjQ0DQogICAgLS0t
IGEvbWV0YS9jbGFzc2VzL2xpY2Vuc2VfaW1hZ2UuYmJjbGFzcw0KICAgICsrKyBiL21ldGEvY2xh
c3Nlcy9saWNlbnNlX2ltYWdlLmJiY2xhc3MNCiAgICBAQCAtMjIzLDcgKzIyMyw4IEBAIGRlZiBn
ZXRfZGVwbG95ZWRfZGVwZW5kZW5jaWVzKGQpOg0KICAgICAgICAgcG4gPSBkLmdldFZhcigiUE4i
LCBUcnVlKQ0KICAgICAgICAgZGVwZW5kcyA9IGxpc3Qoc2V0KFtkZXBbMF0gZm9yIGRlcA0KICAg
ICAgICAgICAgICAgICAgICAgICAgIGluIGxpc3QodGFza2RhdGEudmFsdWVzKCkpDQogICAgLSAg
ICAgICAgICAgICAgICAgICAgaWYgbm90IGRlcFswXS5lbmRzd2l0aCgiLW5hdGl2ZSIpIGFuZCBu
b3QgZGVwWzBdID09IHBuXSkpDQogICAgKyAgICAgICAgICAgICAgICAgICAgaWYgbm90IGRlcFsw
XS5lbmRzd2l0aCgiLW5hdGl2ZSIpIGFuZCBub3QgZGVwWzBdID09IHBuDQogICAgKyAgICAgICAg
ICAgICAgICAgICAgYW5kIGRlcFswXSBub3QgaW4gKGQuZ2V0VmFyKCJTS0lQX0xJQ0VOU0VfTUFO
SUZFU1RfUkVDSVBFUyIsIFRydWUpIG9yICIiKS5zcGxpdCgpXSkpDQoNCiAgICAgICAgICMgVG8g
dmVyaWZ5IHdoYXQgd2FzIGRlcGxveWVkIGl0IGNoZWNrcyB0aGUgcm9vdGZzIGRlcGVuZGVuY2ll
cyBhZ2FpbnN0DQogICAgICAgICAjIHRoZSBTU1RBVEVfTUFOSUZFU1RTIGZvciAiZGVwbG95IiB0
YXNrLg0KICAgIC0tIA0KICAgIDIuMzAuMA0KDQoNCg==
