Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3AF97DDA2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 14:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 52FE918494;
	Wed,  5 Jun 2019 16:31:00 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id EHcOx1ps9FEr; Wed,  5 Jun 2019 16:30:59 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7E9F9183E1;
	Wed,  5 Jun 2019 16:30:59 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DD3C1A063;
	Wed,  5 Jun 2019 16:30:59 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3298A1A062;
	Wed,  5 Jun 2019 16:30:59 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed,  5 Jun 2019 16:30:59 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id 2628C294C;
	Wed,  5 Jun 2019 16:30:59 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 5 Jun 2019 16:30:59 +0200
Received: from XBOX04.axis.com (10.0.5.18) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 5 Jun 2019 16:30:58 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Wed, 5 Jun 2019 16:30:58 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] package.bbclass: Clean up writing of runtime
	pkgdata files
Thread-Index: AQHVG6f/LBR0UFA0PEKY59QVEqyqzqaNG0cA
Date: Wed, 5 Jun 2019 14:30:58 +0000
Message-ID: <d6436c85e6624813b6d5d7dfa8f25976@XBOX04.axis.com>
References: <20190605140130.14968-1-pkj@axis.com>
	<475d4dd14074b72d371b62dec836eab666e7c807.camel@linuxfoundation.org>
In-Reply-To: <475d4dd14074b72d371b62dec836eab666e7c807.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] package.bbclass: Clean up writing of runtime pkgdata files
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
X-List-Received-Date: Wed, 05 Jun 2019 14:31:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDUganVuaSAyMDE5
IDE2OjA3DQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlz
LmNvbT47IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1
YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBwYWNrYWdlLmJiY2xhc3M6IENsZWFuIHVwIHdy
aXRpbmcgb2YNCj4gcnVudGltZSBwa2dkYXRhIGZpbGVzDQo+IA0KPiBPbiBXZWQsIDIwMTktMDYt
MDUgYXQgMTY6MDEgKzAyMDAsIFBldGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPiBUaGlzIGlu
dHJvZHVjZXMgYSB2YXJpYWJsZSwgUEtHREFUQV9WQVJTLCB0aGF0IGNvbnRhaW5zIHRoZSBuYW1l
cyBvZg0KPiA+IHRoZSB2YXJpYWJsZXMgdGhhdCBhcmUgdG8gYmUgb3V0cHV0IGluIHRoZSBydW50
aW1lIHBrZ2RhdGEgZmlsZXMuDQo+IA0KPiBJdHMgYSBnb29kIGNsZWFudXAsIEkganVzdCBrbm93
IGhvdyBwZW9wbGUgYXJlIGdvaW5nIHRvIHVzZSB0aGlzDQo+IHZhcmlhYmxlIHRvIHdyaXRlIG91
dCBhbGwga2luZCBvZiBvdGhlciBkYXRhIGludG8gcGtnZGF0YSA6KA0KDQpUaGlzIHdhcyBvZiBj
b3Vyc2UgdHJpZ2dlcmVkIGJ5IFJvYiBXYWx0b24ncyByZWNlbnQgYXR0ZW1wdCBhdCBhZGRpbmcg
DQpIT01FUEFHRSBhbmQgbXkgb3duIGVhcmxpZXIgYXR0ZW1wdCBhdCBhZGRpbmcgU1JDX1VSSS4g
QnV0IGlzIGl0IGEgDQpwcm9ibGVtIChmb3IgT0UtQ29yZSkgdGhhdCB0aGlzIHBvc3NpYmlsaXR5
IGV4aXN0cz8gQXMgbG9uZyBhcyB5b3UgZG8gDQpub3QgYWNjZXB0IHRoZSBhZGRpdGlvbiBvZiB0
aG9zZSB2YXJpYWJsZXMgaW50byBPRS1Db3JlLCB0aGVuIG5vdGhpbmcgDQpoYXMgY2hhbmdlZCBm
b3IgeW91IChleGNlcHQgdGhhdCB0aGUgY29kZSBpcyBub3cgYSBiaXQgbW9yZSB0aWR5KS4NCg0K
SG93ZXZlciwgZm9yIHVzIGl0IG1lYW5zIEkgY2FuIGdldCByaWQgb2YgdGhlIGhvcnJpYmxlIGhh
Y2sgd2UgaGF2ZSANCnRoYXQgYWRkcyBTUkNfVVJJIHRvIHRoZSBwa2dkYXRhIGZpbGVzLCBhbmQg
aW5zdGVhZCByZXBsYWNlIGl0IHdpdGggYSANCnNpbXBsZSB2YXJpYWJsZSBhZGRpdGlvbiBpbiBv
dXIgZGlzdHJvIGNvbmZpZ3VyYXRpb24uDQoNCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQov
L1BldGVyDQoNCg==

