Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE007.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RZtBs-0006OS-E6
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Dec 2011 00:52:20 +0100
Received: from mail80-tx2-R.bigfish.com (10.9.14.236) by
	TX2EHSOBE007.bigfish.com (10.9.40.27) with Microsoft SMTP Server id
	14.1.225.23; Sun, 11 Dec 2011 23:45:25 +0000
Received: from mail80-tx2 (localhost [127.0.0.1])	by mail80-tx2-R.bigfish.com
	(Postfix) with ESMTP id F3022300350;
	Sun, 11 Dec 2011 23:45:24 +0000 (UTC)
X-SpamScore: -10
X-BigFish: VS-10(zz9371I1432N98dKzz1202hzz6d524hz2dh2a8h668h839h8e2h8e3h941h62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail80-tx2 (localhost.localdomain [127.0.0.1]) by mail80-tx2
	(MessageSwitch) id 1323647124720734_9470;
	Sun, 11 Dec 2011 23:45:24 +0000 (UTC)
Received: from TX2EHSMHS026.bigfish.com (unknown [10.9.14.248])	by
	mail80-tx2.bigfish.com (Postfix) with ESMTP id A9440280019;
	Sun, 11 Dec 2011 23:45:24 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS026.bigfish.com
	(10.9.99.126) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Sun, 11 Dec 2011 23:45:24 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.28]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Sun, 11 Dec 2011 17:45:25 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "niqingliang@insigma.com.cn" <niqingliang@insigma.com.cn>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] inheirt multi bbclass using variable
Thread-Index: AQHMuF709y+usLyeVkKtYW4/7KTlYw==
Date: Sun, 11 Dec 2011 23:45:25 +0000
Message-ID: <CAEsOVNd8AsZNrzcsP4RsK0zURAkkh7hJ6W=BwNKVRnkADxDEhg@mail.gmail.com>
References: <1323419740.1294.70.camel@localhost.localdomain>
In-Reply-To: <1323419740.1294.70.camel@localhost.localdomain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: inheirt multi bbclass using variable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Sun, 11 Dec 2011 23:52:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
Content-ID: <66D76E9EEE096F48B3C647B5DDCBFB34@freescale.net>
Content-Transfer-Encoding: base64

T24gRnJpLCBEZWMgOSwgMjAxMSBhdCAyOjM1IEFNLCBOaSBRaW5nbGlhbmcgPG5pcWluZ2xpYW5n
QGluc2lnbWEuY29tLmNuPiB3cm90ZToNCj4gSSdtIHRyeWluZyB0byBpbmhlcml0IG11bHRpIGJi
Y2xhc3MgdXNpbmcgdmFyaWFibGU6DQo+DQo+IElNQUdFX0VYVFJBX0NMQVNTRVMgPSAiaW1hZ2Ut
dGltZXpvbmUgaW1hZ2UtY2xlYXJib290IGltYWdlLXByZCINCj4gaW5oZXJpdCAke0lNQUdFX0VY
VFJBX0NMQVNTRVN9DQo+DQo+IGFuZCBnb3QgZXJyb3I6DQo+IEVSUk9SOiBDb3VsZCBub3QgaW5o
ZXJpdCBmaWxlIGNsYXNzZXMvaW1hZ2UtdGltZXpvbmUgaW1hZ2UtY2xlYXJib290DQo+IGltYWdl
LXByZC5iYmNsYXNzDQo+DQo+IHdoeSBpdCB0cmVhdCB0aGUgdmFyaWFibGUgYXMgYSBzaW5nbGUg
Y2xhc3M/DQo+IGhvdyB0byByZXNvbHZlIHRoZSBwcm9ibGVtPw0KDQpUaGVyZSBhcmUgc29tZSBp
c3N1ZXMgd2l0aCBpbmhlcml0LiBJJ3ZlIHNlZW4gYSBzaW1pbGFyIGlzc3VlIHdpdGg6DQoNCklN
QUdFX0VYVFJBX0NMQVNTRVMgPSAiIg0KaW5oZXJpdCAke0lNQUdFX0VYVFJBX0NMQVNTRVN9DQoN
CkVSUk9SOiBDb3VsZCBub3QgaW5oZXJpdCBmaWxlIGNsYXNzZXMvLmJiY2xhc3MNCg0KSSdkIHN1
Z2dlc3QgZmlsaW5nIGEgYnVnIGFnYWluc3QgYml0YmFrZSB1bmxlc3Mgc29tZW9uZSBlbHNlIGhh
cyBzb21lDQphZHZpY2UgaGVyZS4NCg0KLU0=



