Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 674 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Feb 2019 16:24:11 UTC
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 2AAFF6C4A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 16:24:10 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x1CGCv4m016864
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 12 Feb 2019 17:12:57 +0100
Received: from DEFTHW99ERHMSX.ww902.siemens.net
	(defthw99erhmsx.ww902.siemens.net [139.22.70.133])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id x1CGCvCk024026
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 12 Feb 2019 17:12:57 +0100
Received: from DENBGAT9ERGMSX.ww902.siemens.net (139.22.70.137) by
	DEFTHW99ERHMSX.ww902.siemens.net (139.22.70.133) with Microsoft SMTP
	Server (TLS) id 14.3.435.0; Tue, 12 Feb 2019 17:12:57 +0100
Received: from DENBGAT9EL2MSX.ww902.siemens.net ([169.254.9.6]) by
	DENBGAT9ERGMSX.ww902.siemens.net ([139.22.70.137]) with mapi id
	14.03.0435.000; Tue, 12 Feb 2019 17:12:56 +0100
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH] cmake: update to 3.13.4
Thread-Index: AQHUwrW7092zeYSXQUK5eT2RLXDNraXb/CMAgABZasA=
Date: Tue, 12 Feb 2019 16:12:55 +0000
Message-ID: <355BE46A91031048906B695426A8D8E61C3E402B@DENBGAT9EL2MSX.ww902.siemens.net>
References: <20190212093048.25238-1-pascal.bach@siemens.com>
	<CAP9ODKoCKPHhLPbFDKGz3wvJPb1_yH4wG04DtwKQwXw6-uTHLw@mail.gmail.com>
In-Reply-To: <CAP9ODKoCKPHhLPbFDKGz3wvJPb1_yH4wG04DtwKQwXw6-uTHLw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.17]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: update to 3.13.4
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
X-List-Received-Date: Tue, 12 Feb 2019 16:24:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgT3RhdmlvDQoNCj4gSGVsbG8gUGFzY2FsLA0KPiANCj4gT24gVHVlLCBGZWIgMTIsIDIwMTkg
YXQgNzo1MSBBTSBQYXNjYWwgQmFjaCA8cGFzY2FsLmJhY2hAc2llbWVucy5jb20+DQo+IHdyb3Rl
Og0KPiA+IEFsbCBwYXRjaGVzIGhhdmUgYmVlbiByZWJhc2VkIG9uIHRvcCBvZiB0aGUgMy4xMy40
IHJlbGVhc2UuDQo+IA0KPiBNb3N0IHBhdGNoZXMgaGFkIG5vIGNoYW5nZXMgKGV2ZW4gb24gcmFu
Z2VzKSBhbmQgaXQnZCBiZSBnb29kIHRvIGF2b2lkDQo+IHRvdWNoaW5nIHRob3NlIGZpbGVzIHNv
IHdlIGNhbiBrZWVwIHRoZSBwYXRjaCB0byB0aGUgc21hbGxlciBjaGFuZ2VzZXQNCj4gcG9zc2li
bGUuIFdoYXQgZG8geW91IHRoaW5rPw0KDQpNYWtlcyBzZW5zZSB0byBtZS4gRG8geW91IGhhdmUg
YSBwcm9wb3NlZCB3b3JrZmxvdyB0byBkbyB0aGF0IG9yIHdvdWxkIHlvdSBqdXN0IG1hbnVhbGx5
IGluc3BlY3QgdGhlIGZpbGVzIGFuZCBjb21taXQgb25seSB0aGUgcmVsZXZhbnQgY2hhbmdlcz8N
Cg0KSSB3aWxsIHNlbmQgYSB2MiB3aGVyZSBJIHRyeSB0byBkbyB0aGlzLg0KDQpQYXNjYWwNCg==

