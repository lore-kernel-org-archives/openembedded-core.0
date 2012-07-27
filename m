Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooper@ti.com>) id 1SuszC-0000EC-F4
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 00:26:18 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6RMAgpq011677;
	Fri, 27 Jul 2012 17:10:42 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6RMAgJp018849;
	Fri, 27 Jul 2012 17:10:42 -0500
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 27 Jul 2012 17:10:42 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Phil Blundell <philb@gnu.org>
Thread-Topic: [OE-core] [PATCH] busybox: Add inetd related files
Thread-Index: AQHNbDDyczkOegqkskuOdWtHL2yzAJc94K4A//+ygYCAAFkaAP//xDKQ
Date: Fri, 27 Jul 2012 22:10:41 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C27A973@DFLE30.ent.ti.com>
References: <1343418723-28606-1-git-send-email-fcooper@ti.com>
	<1343419294.4470.82.camel@x121e.pbcl.net>
	<8F29D6B095ED194EA1980491A5E029710C27A73D@DFLE30.ent.ti.com>
	<1343421786.4470.84.camel@x121e.pbcl.net>
In-Reply-To: <1343421786.4470.84.camel@x121e.pbcl.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: Add inetd related files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2012 22:26:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBwYXRjaCB3YXMgbWVhbnQgZm9yIHRoZSBkZW56aWwgYnJhbmNoIGFuZCBJIGFsc28gZm9y
Z290IHRvIGJ1bXAgdGhlIFBSIGluIHRoZSBidXN5Ym94XzEuMTkuNC5iYiBmaWxlLiBTbyBJIHJl
amVjdGVkIHRoaXMgcGF0Y2ggaW4gUGF0Y2h3b3JrcyBhbmQgc3VibWl0dGVkIGFuIHVwZGF0ZWQg
b25lLiBJIGFsc28gbWFkZSBhIHR3ZWFrIHRoYXQgYWRkcmVzc2VzIHlvdXIgY29uY2Vybi4NCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBoaWwgQmx1bmRlbGwgW21haWx0bzpw
aGlsYkBnbnUub3JnXSANClNlbnQ6IEZyaWRheSwgSnVseSAyNywgMjAxMiAzOjQzIFBNDQpUbzog
Q29vcGVyIEpyLiwgRnJhbmtsaW4NCkNjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0
aGUgb2UtY29yZSBsYXllcg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGJ1c3lib3g6
IEFkZCBpbmV0ZCByZWxhdGVkIGZpbGVzDQoNCk9uIEZyaSwgMjAxMi0wNy0yNyBhdCAyMDoyNiAr
MDAwMCwgQ29vcGVyIEpyLiwgRnJhbmtsaW4gd3JvdGU6DQo+IFRoZSBzZWN0aW9uIHlvdSBtZW50
aW9uZWQgaXMgd2l0aGluIHRoZSBmaWxlIGluZXRkIHdoaWNoIEkgYW0gYWRkaW5nIHRvIHRoZSBT
UkNfVVJJIGxpc3QgaW4gdGhlIGJ1c3lib3hfMS4xOS40LmJiIGZpbGUuIFRoZSB2YXJpYWJsZSAk
e3NiaW5kaXJ9IHdvbid0IGJlIGV4cGFuZGVkLiANCg0KUmlnaHQsIHNvIHlvdSBuZWVkIHRvIGFy
cmFuZ2UgZm9yIGl0IHRvIGdldCBleHBhbmRlZC4gIElmIHlvdSBoYXJkY29kZQ0KdGhlIHBhdGgs
IHRoZSBzY3JpcHQgd2lsbCBqdXN0IGZhaWwgdW5sZXNzICR7c2JpbmRpcn0gaGFwcGVucyB0byBi
ZSBzZXQNCnRvIC91c3Ivc2Jpbi4NCg0KcC4NCg0KDQo=


