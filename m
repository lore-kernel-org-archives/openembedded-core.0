Return-Path: <B28495@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe001.messaging.microsoft.com [216.32.181.181])
	by mail.openembedded.org (Postfix) with ESMTP id B4A176BE44
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 10:03:29 +0000 (UTC)
Received: from mail79-ch1-R.bigfish.com (10.43.68.241) by
	CH1EHSOBE002.bigfish.com (10.43.70.52) with Microsoft SMTP Server id
	14.1.225.22; Tue, 10 Sep 2013 10:03:31 +0000
Received: from mail79-ch1 (localhost [127.0.0.1])	by mail79-ch1-R.bigfish.com
	(Postfix) with ESMTP id EA091600A1;
	Tue, 10 Sep 2013 10:03:30 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I542I1432Izz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h1de097h8275bhz2dh2a8h839h8e2h8e3h93fhd25hf0ah1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5hbe9i1155h)
Received: from mail79-ch1 (localhost.localdomain [127.0.0.1]) by mail79-ch1
	(MessageSwitch) id 1378807408852588_15021;
	Tue, 10 Sep 2013 10:03:28 +0000 (UTC)
Received: from CH1EHSMHS008.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.246])	by mail79-ch1.bigfish.com (Postfix) with ESMTP id
	CB45EC025A; Tue, 10 Sep 2013 10:03:28 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS008.bigfish.com
	(10.43.70.8) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 10 Sep 2013 10:03:28 +0000
Received: from 039-SN2MPN1-013.039d.mgd.msft.net ([169.254.3.102]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.03.0158.002; Tue, 10 Sep 2013 10:03:27 +0000
From: Liu Ting-B28495 <B28495@freescale.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [oe-core][PATCH] libcroco: disable Bsymbolic if it
	is not supported on some hosts
Thread-Index: AQHOrfAki5HFA0j0Fk6+HbxLdhMjDpm+tmIAgAAGSKA=
Date: Tue, 10 Sep 2013 10:03:27 +0000
Message-ID: <AF604684617F454390621992F367F1690BB21135@039-SN2MPN1-013.039d.mgd.msft.net>
References: <1378795010-807-1-git-send-email-b28495@freescale.com>
	<CAJTo0LbM2CF4_vnvCZejQB6kMUtqazbbG3UKk1TUSUKBfvGzog@mail.gmail.com>
In-Reply-To: <CAJTo0LbM2CF4_vnvCZejQB6kMUtqazbbG3UKk1TUSUKBfvGzog@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.193.20.135]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcroco: disable Bsymbolic if it is not supported on some hosts
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
X-List-Received-Date: Tue, 10 Sep 2013 10:03:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCdXJ0b24sIFJvc3MgW21haWx0
bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb21dDQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAxMCwg
MjAxMyA1OjM2IFBNDQo+IFRvOiBMaXUgVGluZy1CMjg0OTUNCj4gQ2M6IE9FLWNvcmUNCj4gU3Vi
amVjdDogUmU6IFtPRS1jb3JlXSBbb2UtY29yZV1bUEFUQ0hdIGxpYmNyb2NvOiBkaXNhYmxlIEJz
eW1ib2xpYyBpZiBpdA0KPiBpcyBub3Qgc3VwcG9ydGVkIG9uIHNvbWUgaG9zdHMNCj4gDQo+IE9u
IDEwIFNlcHRlbWJlciAyMDEzIDA3OjM2LCAgPGIyODQ5NUBmcmVlc2NhbGUuY29tPiB3cm90ZToN
Cj4gPiArRVhUUkFfT0VDT05GICs9ICJlbmFibGVfQnN5bWJvbGljPWF1dG8iDQo+IA0KPiBTdXJl
bHkgeW91IG1lYW4gIi0tZW5hYmxlLUJzeW1ib2xpYz1hdXRvIiwgYXMgdGhhdCdzIHdoYXQgdGhl
IG9wdGlvbiBpcw0KPiBjYWxsZWQuDQo+IA0KDQpZZWFoLCB5b3UgYXJlIHJpZ2h0LiBQYXRjaCB2
MiBoYXMgYmVlbiBzZW50IG91dC4gVGhhbmtzLg0KDQotVGluZw0KDQo+IFJvc3MNCg0K


