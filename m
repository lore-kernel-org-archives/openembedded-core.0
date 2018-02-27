Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE54700F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 15:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A8DC31859E;
	Tue, 27 Feb 2018 16:23:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id qKL9qqDZuSw5; Tue, 27 Feb 2018 16:23:32 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id E8542184AF;
	Tue, 27 Feb 2018 16:23:32 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C9D721A084;
	Tue, 27 Feb 2018 16:23:32 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF0C81A07E;
	Tue, 27 Feb 2018 16:23:32 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 27 Feb 2018 16:23:32 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id B39B4123E;
	Tue, 27 Feb 2018 16:23:32 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Tue, 27 Feb 2018 16:23:32 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Tue, 27 Feb 2018 16:23:32 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Maxin B. John" <maxin.john@intel.com>
Thread-Topic: [OE-core] [PATCH 2/3] piglit: upgrade to current git master
Thread-Index: AQHTr8daBmlKyFVdbUqdwJmtpyNF06O4XcfA
Date: Tue, 27 Feb 2018 15:23:32 +0000
Message-ID: <3bfe61278db543eebcf07e019f5dd758@XBOX02.axis.com>
References: <1519735027-10472-1-git-send-email-maxin.john@intel.com>
	<1519735027-10472-2-git-send-email-maxin.john@intel.com>
In-Reply-To: <1519735027-10472-2-git-send-email-maxin.john@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] piglit: upgrade to current git master
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
X-List-Received-Date: Tue, 27 Feb 2018 15:23:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBNYXhpbiBC
LiBKb2huDQo+IFNlbnQ6IGRlbiAyNyBmZWJydWFyaSAyMDE4IDEzOjM3DQo+IFRvOiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFtPRS1jb3JlXSBb
UEFUQ0ggMi8zXSBwaWdsaXQ6IHVwZ3JhZGUgdG8gY3VycmVudCBnaXQgbWFzdGVyDQo+IA0KPiBV
cGdyYWRlIHRvIHJldmlzaW9uOg0KPiA0Y2UwODg3ZTJmN2Y4NDhkMmJlMmU0MzVhMmQwZjNjODBl
NDRlYTNiDQo+IA0KPiByZW1vdmUgYmFja3BvcnRlZCBwYXRjaDoNCj4gICAgICAgICAwMDAxLXRl
c3RzLWVnbC1lZ2wtY29udGV4dC1wcmlvcml0eS5jLVVzZS1waWdsaXRfZWdsX2dldF8ucGF0Y2gN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1heGluIEIuIEpvaG4gPG1heGluLmpvaG5AaW50ZWwuY29t
Pg0KPiANCj4gaSMgWW91ciBicmFuY2ggaXMgYWhlYWQgb2YgJ29yaWdpbi9tYXN0ZXInIGJ5IDIg
Y29tbWl0cy4NCiAgXg0KSSBndWVzcyB0aGF0IHdhcyBhbiBhY2NpZGVudGFsIGtleSBwcmVzcyB0
dXJuaW5nIHRoZSBjb21tZW50IGludG8gDQphbiBhY3R1YWwgcGFydCBvZiB0aGUgY29tbWl0IG1l
c3NhZ2UuIDspDQoNCj4gU2lnbmVkLW9mZi1ieTogTWF4aW4gQi4gSm9obiA8bWF4aW4uam9obkBp
bnRlbC5jb20+DQoNCi8vUGV0ZXINCg0K

