Return-Path: <B40290@freescale.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe006.messaging.microsoft.com [213.199.154.209])
	by mail.openembedded.org (Postfix) with ESMTP id CB4E66B7C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 09:54:07 +0000 (UTC)
Received: from mail57-am1-R.bigfish.com (10.3.201.228) by
	AM1EHSOBE013.bigfish.com (10.3.207.135) with Microsoft SMTP Server id
	14.1.225.22; Thu, 15 Aug 2013 09:54:07 +0000
Received: from mail57-am1 (localhost [127.0.0.1])	by mail57-am1-R.bigfish.com
	(Postfix) with ESMTP id 760D8440187;
	Thu, 15 Aug 2013 09:54:07 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I542I4015Izz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h8275bh8275dh1de097hz2dh2a8h668h839h8e2h8e3h93fhd25hf0ah1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5hbe9i1155h)
Received: from mail57-am1 (localhost.localdomain [127.0.0.1]) by mail57-am1
	(MessageSwitch) id 137656044658608_472;
	Thu, 15 Aug 2013 09:54:06 +0000 (UTC)
Received: from AM1EHSMHS006.bigfish.com (unknown [10.3.201.254])	by
	mail57-am1.bigfish.com (Postfix) with ESMTP id 0B25660227;
	Thu, 15 Aug 2013 09:54:06 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS006.bigfish.com
	(10.3.207.106) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 15 Aug 2013 09:54:05 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.10]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.03.0136.001; Thu, 15 Aug 2013 09:54:04 +0000
From: Guo Chunrong-B40290 <B40290@freescale.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] genext2fs: fix memory corruption on powerpc
Thread-Index: AQHOmZX6/S2eLokeVkq/fzhfUzDY5ZmWBmFg
Date: Thu, 15 Aug 2013 09:54:04 +0000
Message-ID: <B21730BB6DA1D24B83348D9301EA417E1043E323@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1376547819-3322-1-git-send-email-B40290@freescale.com>
	<CAJTo0La1OQdOpOzv0u3UcoMpdvm9dHPL_tHzqvXW-E0GT=Omfw@mail.gmail.com>
In-Reply-To: <CAJTo0La1OQdOpOzv0u3UcoMpdvm9dHPL_tHzqvXW-E0GT=Omfw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.206]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] genext2fs: fix memory corruption on powerpc
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
X-List-Received-Date: Thu, 15 Aug 2013 09:54:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sDQogSSBzdWJtaXR0ZWQgdGhlIHBhdGNoIHRvIHVwc3RyZWFtKGdlbmV4dDJmcyApLg0K
IFNvLEkgd2lsbCBzdWJtaXQgbmV3IHBhdGNoIGZvciAgVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0
ZWQgLg0KDQpUaGFua3MsDQpjaHVucm9uZw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogQnVydG9uLCBSb3NzIFttYWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29tXSANClNlbnQ6
IFRodXJzZGF5LCBBdWd1c3QgMTUsIDIwMTMgNTowMSBQTQ0KVG86IEd1byBDaHVucm9uZy1CNDAy
OTANCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gZ2VuZXh0MmZzOiBmaXggbWVtb3J5IGNvcnJ1cHRpb24g
b24gcG93ZXJwYw0KDQpPbiAxNSBBdWd1c3QgMjAxMyAwNzoyMywgQ2h1bnJvbmcgR3VvIDxCNDAy
OTBAZnJlZXNjYWxlLmNvbT4gd3JvdGU6DQo+ICtVcHN0cmVhbS1TdGF0dXM6IGluYXBwcm9wcmlh
dGUNCg0KSG93IGlzIHRoaXMgaW5hcHByb3ByaWF0ZSBmb3IgdXBzdHJlYW0/ICBXZSBkb24ndCB3
YW50IHRvIGRlbGliZXJhdGVseSBob3JkZSBub24tdHJpdmlhbCBwYXRjaGVzIGFzIGl0IG1lYW5z
IG1vcmUgd29yayBpbiB0aGUgZnV0dXJlLg0KDQpSb3NzDQoNCg==


