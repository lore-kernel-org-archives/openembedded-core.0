Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
	helo=VA3EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RQx8H-00043l-6x
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 09:15:41 +0100
Received: from mail134-va3-R.bigfish.com (10.7.14.254) by
	VA3EHSOBE004.bigfish.com (10.7.40.24) with Microsoft SMTP Server id
	14.1.225.22; Thu, 17 Nov 2011 08:08:43 +0000
Received: from mail134-va3 (localhost [127.0.0.1])	by
	mail134-va3-R.bigfish.com (Postfix) with ESMTP id 7F1823C0377;
	Thu, 17 Nov 2011 08:07:56 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371K98dKzz1202hzz6d524hz2dh2a8h668h839h8e2h8e3h941h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail134-va3 (localhost.localdomain [127.0.0.1]) by mail134-va3
	(MessageSwitch) id 1321517276389963_28723;
	Thu, 17 Nov 2011 08:07:56 +0000 (UTC)
Received: from VA3EHSMHS011.bigfish.com (unknown [10.7.14.240])	by
	mail134-va3.bigfish.com (Postfix) with ESMTP id 573C0280044;
	Thu, 17 Nov 2011 08:07:56 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS011.bigfish.com
	(10.7.99.21) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 17 Nov 2011 08:08:42 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Thu, 17 Nov 2011 02:09:14 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "niqingliang@insigma.com.cn" <niqingliang@insigma.com.cn>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] What is the strategy to update eglibc?
Thread-Index: AQHMpQAxwe2aU5rnBUKa27qVcaUK8g==
Date: Thu, 17 Nov 2011 08:09:13 +0000
Message-ID: <CAEsOVNfm3pCCko+AN_G9agTuLG6C13YtiXW73yajy_7EMrqmgA@mail.gmail.com>
References: <4EAE0428.2020209@windriver.com>
	<CAMKF1spV_BiCTo1YCoKL7XUTqRWtFJFYP4yB16FoyETjYzAuxg@mail.gmail.com>
	<4EC47257.5030302@windriver.com>
	<1321497356.1264.26.camel@localhost.localdomain>
In-Reply-To: <1321497356.1264.26.camel@localhost.localdomain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Saul Wold <saul.wold@intel.com>
Subject: Re: What is the strategy to update eglibc?
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
X-List-Received-Date: Thu, 17 Nov 2011 08:15:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
Content-ID: <C9B5CE0D0E5E894883DCDA99CC6EF46B@freescale.net>
Content-Transfer-Encoding: base64

T24gV2VkLCBOb3YgMTYsIDIwMTEgYXQgODozNSBQTSwgTmkgUWluZ2xpYW5nDQo8bmlxaW5nbGlh
bmdAaW5zaWdtYS5jb20uY24+IHdyb3RlOg0KPiBpdCBsb29rcyBsaWtlIHRoZXJlIGlzIDIuMTQg
YmIgZmlsZSBhbHJlYWR5LCB3aHkgdGhlIGRlZmF1bHQgZWdsaWJjIHN0YXkNCj4gb24gMi4xMz8N
Cg0KLi4vbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3RjbW9kZS1kZWZhdWx0LmluYzpQUkVGRVJS
RURfVkVSU0lPTl9lZ2xpYmMNCiAgICAgICAgICAgICAgICAgID89ICIke0VHTElCQ1ZFUlNJT059
Ig0KLi4vbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3RjbW9kZS1kZWZhdWx0LmluYzpFR0xJQkNW
RVJTSU9OID89ICIyLjEzIg0KDQpTb21lb25lIG5lZWRzIHRvIGJ1bXAgdGhlIGRlZmF1bHQgdmVy
c2lvbi4NCg0KLU0=



