Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ionutx.radu@intel.com>) id 1UcCoe-0007Us-W2
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 12:50:47 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 May 2013 03:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,670,1363158000"; d="scan'208";a="302188532"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by azsmga001.ch.intel.com with ESMTP; 14 May 2013 03:32:31 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 14 May 2013 11:32:28 +0100
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.193]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.126]) with mapi id
	14.03.0123.003; Tue, 14 May 2013 11:32:28 +0100
From: "Radu, IonutX" <ionutx.radu@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 3/9] js: updated from 1.7.0+1.8.0rc1 to
	185-1.0.0
Thread-Index: AQHOS/n6Fw31se45Uk2WymvQvsF6qZj7T1MAgAAePACACRblgw==
Date: Tue, 14 May 2013 10:32:27 +0000
Message-ID: <958794DC787AD345A1A41BCD3015B650319A0B@IRSMSX102.ger.corp.intel.com>
References: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
	<1368024119-4149-4-git-send-email-ionutx.radu@intel.com>
	<CAJTo0LbwTmE1Un=GFVWQok=38Ljzeg0PSJ5ZhqZRQ0b_efD3Vg@mail.gmail.com>,
	<518A80A4.5050901@linux.intel.com>
In-Reply-To: <518A80A4.5050901@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.137]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] js: updated from 1.7.0+1.8.0rc1 to 185-1.0.0
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
X-List-Received-Date: Tue, 14 May 2013 10:50:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJvbTogU2F1bCBXb2xk
IFtzZ3dAbGludXguaW50ZWwuY29tXQpTZW50OiBXZWRuZXNkYXksIE1heSAwOCwgMjAxMyA3OjQz
IFBNClRvOiBSYWR1LCBJb251dFgKQ2M6IEJ1cnRvbiwgUm9zczsgb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZwpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAzLzld
IGpzOiB1cGRhdGVkIGZyb20gMS43LjArMS44LjByYzEgdG8gMTg1LTEuMC4wCgpPbiAwNS8wOC8y
MDEzIDA3OjU1IEFNLCBCdXJ0b24sIFJvc3Mgd3JvdGU6Cj4gT24gOCBNYXkgMjAxMyAxNTo0MSwg
SW9udXQgUmFkdSA8aW9udXR4LnJhZHVAaW50ZWwuY29tPiB3cm90ZToKPj4gU2lnbmVkLW9mZi1i
eTogSW9udXQgUmFkdSA8aW9udXR4LnJhZHVAaW50ZWwuY29tPgo+Cj4gSXMgdGhlcmUgYW55dGhp
bmcgaW4gb2UtY29yZSB0aGF0IHN0aWxsIG5lZWRzIHRoaXM/ICBJIHN1c3BlY3Qgd2Ugb25seQo+
IGhhZCBpdCBmb3IgV2ViLCBidXQgYXMgd2UgZHJvcHBlZCB0aGUgbm9uLXdlYmtpdCBXZWIgYSB3
aGlsZSBiYWNrIEkKPiBkb24ndCB0aGluayB3ZSdyZSBhY3R1YWxseSBidWlsZGluZyB0aGlzIGF0
IGFsbCAoYXBhcnQgZnJvbSBpbiB3b3JsZAo+IGJ1aWxkcykgc28gc2hvdWxkIHdlIGRpc2N1c3Mg
bW92aW5nIGl0IHRvIG1ldGEtb2U/Cj4KQWdyZWVkLCB3ZSBzaG91bGQgbW92ZSB0aGlzIHJlY2lw
ZSB0byBtZXRhLW9lIGFuZCByZW1vdmUgaXQgZnJvbSBvZS1jb3JlCmF0IHRoaXMgdGltZS4KClNh
dSEKCkkgbW92ZWQgdG8gbWV0YS1vZSwgYnV0IHRoZXJlIGFyZSBidWlsZCBlcnJvcnMuIEkgdHJ5
IHRvIGZpeCB0aGVtIGFzIHNvb24gYXMgcG9zc2libGUuCgpJb251yJsKCj4gUm9zcwo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBPcGVuZW1iZWRk
ZWQtY29yZSBtYWlsaW5nIGxpc3QKPiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnCj4gaHR0cDovL2xpc3RzLmxpbnV4dG9nby5vcmcvY2dpLWJpbi9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5lbWJlZGRlZC1jb3JlCj4K


