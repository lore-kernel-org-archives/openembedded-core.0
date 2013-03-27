Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UKgHT-0001Lp-JE
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 03:40:05 +0100
Received: from mail53-ch1-R.bigfish.com (10.43.68.250) by
	CH1EHSOBE005.bigfish.com (10.43.70.55) with Microsoft SMTP Server id
	14.1.225.23; Wed, 27 Mar 2013 02:23:02 +0000
Received: from mail53-ch1 (localhost [127.0.0.1])	by mail53-ch1-R.bigfish.com
	(Postfix) with ESMTP id 1852E4201CA;
	Wed, 27 Mar 2013 02:23:02 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -5
X-BigFish: VS-5(zz709fI98dI9371I936eI542I1432Izz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275ch17326ah8275dhz2dh2a8h668h839h8e2h8e3h93fhd25hf0ah1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail53-ch1 (localhost.localdomain [127.0.0.1]) by mail53-ch1
	(MessageSwitch) id 136435098020060_26451;
	Wed, 27 Mar 2013 02:23:00 +0000 (UTC)
Received: from CH1EHSMHS010.bigfish.com (snatpool3.int.messaging.microsoft.com
	[10.43.68.229])	by mail53-ch1.bigfish.com (Postfix) with ESMTP id
	EC5D92C011A;	Wed, 27 Mar 2013 02:22:59 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS010.bigfish.com
	(10.43.70.10) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 27 Mar 2013 02:22:57 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.152]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0328.011; Wed, 27 Mar 2013 02:22:57 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] Build issue of nativesdk toolchain
Thread-Index: Ac4qLmNha/4WXqRpTjqKPSeDHxVfDQACmpwAABWtKUA=
Date: Wed, 27 Mar 2013 02:22:56 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A0148975D@039-SN2MPN1-022.039d.mgd.msft.net>
References: <CA452391058F6D4E9715FB2C29D9312A01488D34@039-SN2MPN1-022.039d.mgd.msft.net>
	<1364312670.3097.79.camel@ted>
In-Reply-To: <1364312670.3097.79.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.134]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build issue of nativesdk toolchain
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
X-List-Received-Date: Wed, 27 Mar 2013 02:40:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RlNMIGdjYyBzb3VyY2UgaXMgdXNlZCBmb3IgZm9sbG93aW5nIGdjYyB2YXJpYW50cywgYW5kIG90
aGVyIGdjYyB2YXJpYW50cyB1c2UgWW9jdG8gZGVmYXVsdCBzb3VyY2UuICIrZnNsIiBzdWZmaXgg
aXMgYXBwZW5kZWQgaW50byBQViBpbiBiZWxvdyBnY2MgcmVjaXBlcy4gTXkgdW5kZXJzdGFuZGlu
ZyBpcyB0aGF0IGJlbG93IGdjYyB2YXJpYW50cyBzaG91bGQgdXNlIGEgZGlmZmVyZW50IGJ1aWxk
IGZvbGRlciB3aXRoIGdjYy1jcm9zc3NkaywgYW0gSSBtaXN1bmRlcnN0YW5kaW5nIHNvbWV0aGlu
Zz8gDQoNCkkgbWlnaHQgbmVlZCB0byB1bmlmeSB0aGUgc291cmNlIGZvciBhbGwgZ2NjIHZhcmlh
bnRzIGlmIFlvY3RvIGRvZXNuJ3Qgc3VwcG9ydCBhYm92ZSBzY2VuYXJpby4gIA0KDQpHY2MgdmFy
aWFudHMgd2l0aCBGU0wgc291cmNlOiANCmdjY180LjcuYmJhcHBlbmQgICAgICAgIGdjYy1jcm9z
cy1jYW5hZGlhbl80LjcuYmJhcHBlbmQgIGdjYy1mc2wuaW5jICAgICAgICAgICAgICAgbGliZ2Nj
XzQuNy5iYmFwcGVuZA0KZ2NjLWNyb3NzXzQuNy5iYmFwcGVuZCAgZ2NjLWNyb3NzLWluaXRpYWxf
NC43LmJiYXBwZW5kICAgZ2NjLXJ1bnRpbWVfNC43LmJiYXBwZW5kDQoNCiQgY2F0IGdjYy1mc2wu
aW5jIA0KUFYgPSAiNC43LjIrZnNsIg0KDQpCSU5WID0gIjQuNy4yIg0KDQpTUkNSRVYgPSAiYzg4
YTJmODUxMTk3YTEwMzI5NjE3NWUwYTdhMWNiOTRhYjkxYmNjMyINCg0KU1JDX1VSSSA9ICJnaXQ6
Ly9naXQuYW0uZnJlZXNjYWxlLm5ldC9naXRvbGl0ZS9zZGsvZ2NjLmdpdDtkZXN0c3VmZml4PWdj
Yy0ke1BWfSBcDQogICAgICAgIGZpbGU6Ly9vcHRpb25hbF9saWJzdGRjLnBhdGNoIFwNCiAgICAg
ICAgZmlsZTovL3VzZS1kZWZhdWx0cy5oLWFuZC10LW9lLWluLUIucGF0Y2ggXA0KICAgICAgICBm
aWxlOi8vR0xJQkNfRFlOQU1JQ19MSU5LRVIucGF0Y2ggXA0KIg0KDQpGSUxFU0VYVFJBUEFUSFNf
cHJlcGVuZCA6PSAiJHtUSElTRElSfS9maWxlczoiIA0KDQpCZWxvdyBpcyB0aGUgY29udGVudCBv
ZiB0aGUgYmJhcHBlbmQ6IA0KcmVxdWlyZSBnY2MtZnNsLmluYw0KDQoNCkJlc3QgUmVnYXJkcywN
Cg0KWmhlbmh1YQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmlj
aGFyZCBQdXJkaWUgW21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXQ0K
PiBTZW50OiBUdWVzZGF5LCBNYXJjaCAyNiwgMjAxMyAxMTo0NSBQTQ0KPiBUbzogTHVvIFpoZW5o
dWEtQjE5NTM3DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gQnVpbGQgaXNzdWUgb2YgbmF0aXZlc2RrIHRvb2xj
aGFpbg0KPiANCj4gT24gVHVlLCAyMDEzLTAzLTI2IGF0IDE0OjI5ICswMDAwLCBMdW8gWmhlbmh1
YS1CMTk1Mzcgd3JvdGU6DQo+ID4gV2hlbiBJIGJ1aWxkIG5hdGl2ZXNkayB0b29sY2hhaW4gd2l0
aCByZWNlbnQgcG9reSArIG1ldGEtZnNsLXBwYyArIEZTTA0KPiBTREsgc3BlY2lmaWMgbGF5ZXJz
LCBidWlsZCBpc3N1ZSBzaW1pbGFyIHRvIGVycm9yLTEgaGFwcGVucy4gVGhpcyBpc3N1ZQ0KPiBt
aWdodCBhcHBlYXIgZm9yIGRpZmZlcmVudCBnY2MgcmVsYXRlZCBwYWNrYWdlIGR1cmluZyBkaWZm
ZXJlbnQgdHJpYWwsDQo+IGUuZy4gbGliZ2NjLCBnY2MsIGdjYy1jcm9zcy1pbml0aWFsLCBnY2Mt
Y3Jvc3NzZGssIGV0Yy4NCj4gPg0KPiA+IFdoZW4gSSByZXZlcnQNCj4gaHR0cDovL2dpdC55b2N0
b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kvcG9reS9jb21taXQvP2lkPTliZmQ5MjI0M2VjZWQ5
Mg0KPiAxZjE2NmQ4NGI1YTcyZDZmNzc0ZTEzNDEzLCBlcnJvci0xIGJ1aWxkIGlzc3VlIGdvZXMg
YXdheSwgZXJyb3ItMiBhcHBlYXJzLA0KPiBlcnJvci0yIGFsc28gY2FuJ3QgYmUgcmVwcm9kdWNl
ZCBldmVyeSB0aW1lLiBEb2VzIGFueW9uZSBldmVyIG1lZXQgdGhlDQo+IHNpbWlsYXIgYnVpbGQg
aXNzdWUgYW5kIGFueSBjb21tZW50IG9uIHRoZSBidWlsZCBlcnJvcj8NCj4gDQo+IEl0IHNvdW5k
cyBsaWtlIHlvdSd2ZSBjaGFuZ2VzIGluIGdjYyBiZXR3ZWVuIHNvbWUgb2YgdGhlIGRpZmZlcmVu
dA0KPiB2YXJpYW50cywgZS5nLiBkaWZmZXJlbnQgcGF0Y2ggc2V0cyBvciBTUkNfVVJJLg0KPiAN
Cj4gZ2NjIHVzZXMgYSBzaGFyZWQgc291cmNlIGRpcmVjdG9yeSBzbyB0aGUgc2FtZSBwYXRjaHNl
dCBtdXN0IGJlIHVzZWQgZm9yDQo+IGFsbCB2YXJpYW50cy4gSXQgaGFzIG5vdGhpbmcgdG8gZG8g
d2l0aCB0aGUgYWJvdmUgY29tbWl0Lg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KPiAN
Cg0K



