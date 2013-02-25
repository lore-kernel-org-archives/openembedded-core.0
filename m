Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1U9srM-0007SW-Uq
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 08:52:42 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Feb 2013 23:36:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,732,1355126400"; d="scan'208";a="205912399"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Feb 2013 23:36:09 -0800
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Mon, 25 Feb 2013 07:36:07 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.108]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.144]) with mapi id
	14.01.0355.002; Mon, 25 Feb 2013 07:36:07 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] connman: enable connman client
Thread-Index: AQHOETifbYRAaCvDQ0eC1/cks2ycTpiHHqYAgAMOh0CAAAVxMA==
Date: Mon, 25 Feb 2013 07:36:06 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16205BE9@IRSMSX102.ger.corp.intel.com>
References: <1361563821-7683-1-git-send-email-cristian.iorga@intel.com>
	<7EF31BEB21E340DBAFB08ABD4321A269@intel.com> 
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: enable connman client
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
X-List-Received-Date: Mon, 25 Feb 2013 07:52:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWxzbywgcGxlYXNlIG5vdGUgdGhhdCB0b29scy10ZXN0IGFuZCB0b29scy13aXNwciB1c2UgYWxz
byB0aGUgJHtTfSBkaXIgaW4gaW5zdGFsbCwgc28gbXkgY29kZSBpcyBpbiBhY2NvcmRhbmNlIHRv
IHByZXZpb3VzIGNvZGUgKHByaW9yIGFydHdvcmsgOi0pICkuDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBJb3JnYSwgQ3Jpc3RpYW4gDQpTZW50OiBNb25kYXksIEZlYnJ1YXJ5
IDI1LCAyMDEzIDk6MTkgQU0NClRvOiBCdXJ0b24sIFJvc3MNCkNjOiBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSRTogW09FLWNvcmVdIFtQQVRDSF0g
Y29ubm1hbjogZW5hYmxlIGNvbm5tYW4gY2xpZW50DQoNCkhlbGxvIFJvc3MsDQoNCjEuIEFzIGZh
ciBhcyBJIGhhdmUgc2VlbiwgYnVpbGRpbmcgdGhlIGNvbm5tYW5jdGwgaXMgdGhlIGRlZmF1bHQs
IHRoZXJlIGlzIG5vIC0tZW5hYmxlLWNsaWVudC4NCglNYXliZSBJIGFtIHdyb25nLCBJIGhhdmUg
ZXh0cmFjdGVkIHRoaXMgaW5mbyBmcm9tIHRoZSBkb2N1bWVudGF0aW9uLg0KMi4gTGlrZSB5b3Ug
c2FpZCwgYXQgdGhlIG1vbWVudCwgdGhlIGNsaWVudCBleGVjdXRhYmxlIGlzIHByb2R1Y2VkIGRp
cmVjdGx5IGluIHRoZSBzb3VyY2UgZGlyZWN0b3J5LCBoZW5jZSBteSBpbnN0YWxsIGNvbW1hbmQu
DQoJSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgd2lsbCBiZSB0aGUgc2FtZSB0aGluZyBpZiBJ
IGNoYW5nZSBpbnRvIGJ1aWxkIGRpcmVjdG9yeT8NCg0KUmVnYXJkcywNCkNyaXN0aWFuDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSb3NzIEJ1cnRvbiBbbWFpbHRvOnJvc3Mu
YnVydG9uQGludGVsLmNvbV0gDQpTZW50OiBTYXR1cmRheSwgRmVicnVhcnkgMjMsIDIwMTMgMTA6
MzQgQU0NClRvOiBJb3JnYSwgQ3Jpc3RpYW4NCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gY29ubm1hbjog
ZW5hYmxlIGNvbm5tYW4gY2xpZW50DQoNCkhpIENyaXN0aWFuLA0KDQpPbiBGcmlkYXksIDIyIEZl
YnJ1YXJ5IDIwMTMgYXQgMjA6MTAsIENyaXN0aWFuIElvcmdhIHdyb3RlOiANCj4gLSAtLWRpc2Fi
bGUtY2xpZW50IFwNCg0KSSdkIHByZWZlciB0byBzZWUgYW4gZXhwbGljaXQgLS1lbmFibGUtY2xp
ZW50IGhlcmUgdG8gbWFrZSBpdCBjbGVhciB3aGF0IHdlJ3JlIHR1cm5pbmcgb24gYW5kIG9mZi4N
CiANCj4gKyBpbnN0YWxsIC1tIDA3NTUgJHtTfS9jbGllbnQvY29ubm1hbmN0bCAke0R9JHtiaW5k
aXJ9DQoNCiR7U30gKHNvdXJjZSkgc2hvdWxkIGJlICR7Qn0gKGJ1aWxkKSwgYWx0aG91Z2ggYXQg
dGhlIG1vbWVudCB0aGV5IGFyZSB0aGUgc2FtZSBkaXJlY3RvcnkgSSd2ZSBiZWVuIHNsb3dseSB3
b3JraW5nIG9uIGNoYW5naW5nIHRoYXQuDQoNCkFsc28gdGhlIGZhY3QgdGhhdCB5b3UgaGF2ZSB0
byBkbyB0aGlzIGlzIGRlcHJlc3NpbmcuICBJIHdvbmRlciB3aHkgdXBzdHJlYW0gZG9lc24ndCB3
YW50IHRvIGluc3RhbGwgYW55IG9mIHRoZSB0b29scz8NCg0KUm9zcyANCg0KDQo=


