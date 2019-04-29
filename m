Return-Path: <f.suligoi@asem.it>
Received: from smtp.asem.it (smtp.asem.it [151.1.184.197])
	by mail.openembedded.org (Postfix) with ESMTP id A0C1D7DBB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 15:08:49 +0000 (UTC)
Received: from webmail.asem.it by asem.it (smtp.asem.it)
	(SecurityGateway 5.5.0) with ESMTP id SG003839992.MSG 
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 17:08:48 +0200S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
	(172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 29 Apr 2019 17:08:49 +0200
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
	mapi id 15.01.1261.035; Mon, 29 Apr 2019 17:08:49 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/2] kernel: redirect merge_config.sh error
	output to file
Thread-Index: AQHU/pZcEYpxgV48DEyWBLQ/vRbWs6ZTPMzA
Date: Mon, 29 Apr 2019 15:08:48 +0000
Message-ID: <7094485f5f1247ecb0dbac38a986e11e@asem.it>
References: <1556546164-28522-1-git-send-email-f.suligoi@asem.it>
	<CADkTA4OGumcEbwQzO9CP_20NhYHWz-tMJ5VCHWuV6VVnQuj8PA@mail.gmail.com>
In-Reply-To: <CADkTA4OGumcEbwQzO9CP_20NhYHWz-tMJ5VCHWuV6VVnQuj8PA@mail.gmail.com>
Accept-Language: it-IT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.17.208]
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A0B0202.5CC71381.008E, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel: redirect merge_config.sh error output to file
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
X-List-Received-Date: Mon, 29 Apr 2019 15:08:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UsDQoNCj4gT24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMTA6MDEgQU0gRmxhdmlvIFN1
bGlnb2kgPG1haWx0bzpmLnN1bGlnb2lAYXNlbS5pdD4gd3JvdGU6DQo+IEluIHRoZSB0YXNrOg0K
PiANCj4gZG9fa2VybmVsX2NvbmZpZ21lDQo+IA0KPiB0aGUgZXJyb3JzIGR1cmluZyBleGVjdXRp
b24gb2YgdGhlICJtZXJnZV9jb25maWcuc2giIHNjcmlwdCBhcmUNCj4gY3VycmVudGx5IGxvc3Qu
DQo+IEJ1dCB0aGVzZSBlcnJvcnMgYXJlIHZlcnkgdXNlZnVsIGZvciBkZWJ1Z2dpbmcsIHdoZW4g
dGhlcmUgYXJlDQo+IHByb2JsZW1zIGR1cmluZyB0aGUga2VybmVsIGNvbmZpZ3VyYXRpb24gZnJh
Z21lbnRzIGFzc2VtYmx5Lg0KPiANCj4gVGhpcyBpcyB0aGUgcmVhc29uIHRvIHNhdmUgYWxzbyB0
aGUgZXJyb3IgbG9nLCBpbiBhZGRpdGlvbiB0byB0aGUNCj4gZXhpc3RpbmcgbG9nLg0KPiANCj4g
RXJyb3JzIGFyZSBwaWNrZWQgdXAgaW4gYSBzZXBhcmF0ZSB0YXNrLiBXaGF0IGVycm9ycyB3ZXJl
IHlvdSB0cmlnZ2VyaW5nIHRoYXQgdGhlIGV4aXN0aW5nIGF1ZGl0IHdhc24ndCBzZWVpbmcgPw0K
PiANCj4gQnJ1Y2UNCiANCkZvciBob3cgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZSBhbmQgZm9yIHRo
ZSByZWFzb24gb2YgdGhlc2UgdHdvIHBhdGNoZXMsDQpzZWUgbXkgYW5zd2VyIHRvIHRoZSBzZWNv
bmQgcGF0Y2g6DQoNCltPRS1jb3JlXSBbUEFUQ0ggMi8yXSBrZXJuZWw6IGNoZWNrIGZvciBlbXB0
eSAuY29uZmlnIGZpbGUgYWZ0ZXIgbWVyZ2VfY29uZmlnLnNoDQoNClRoYW5rcywNCg0KRmxhdmlv
DQo=

