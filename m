Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 8B8606D061
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 21:30:21 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 03F9D10C0A70;
	Mon, 26 Nov 2018 13:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1543267822; bh=yS9awlVEk6xMa2hLiF5H9LgkE71GrkyUYkKolZU+Zp8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=LY+hDfesutzRqRIPpWSdmpsU4h36TcNsX2i7oXzV0ODGEJs/UNBUcqS7BEoedoOOb
	9iHZ+7EVlBQMlDcI2fIIVPfzTbbj4sDt1nFPcvYSqrJ0LZH2K5lC8fxO352rt+4EAO
	zRuIcxQ7tMwrOMasSW5VoMyP4fVdK85qti65IKZcZxhHQCME6+2Rd5ZEu4f9OIrr1l
	x7DOBaqDyTkt7UdwBjDbRCTfe6VB9npaukIi+w23deEbgqxJwcN7rmgr6eAgOxbveg
	s+RMN8p8ZDrbXPglVeWqLrUTdG/6s6G+op29itMMAX33lTbbhFRKdwPy5bmwAlKwRz
	FgGIQVO2EQyNA==
Received: from US01WEHTC3.internal.synopsys.com
	(us01wehtc3.internal.synopsys.com [10.15.84.232])
	by mailhost.synopsys.com (Postfix) with ESMTP id 4C5D055B0;
	Mon, 26 Nov 2018 13:30:21 -0800 (PST)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
	US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Mon, 26 Nov 2018 13:30:21 -0800
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
	by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
	14.03.0415.000; Mon, 26 Nov 2018 22:30:19 +0100
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
Thread-Topic: [PATCH v7] u-boot: Add mkenvimage tool
Thread-Index: AQHUgrbjLyqv9A0wCU69BCrmiPWOHKVe9ciAgAOSeAA=
Date: Mon, 26 Nov 2018 21:30:18 +0000
Message-ID: <8950e9f58055a8667d20ff83de1f8acd14b7f303.camel@synopsys.com>
References: <20181122225820.2553-1-abrodkin@synopsys.com>
	<CAMKF1sqbHtV1UYiXre_1sNEzyFWJw3mRs_hcuVzu+us_r0OWVg@mail.gmail.com>
In-Reply-To: <CAMKF1sqbHtV1UYiXre_1sNEzyFWJw3mRs_hcuVzu+us_r0OWVg@mail.gmail.com>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.2 (3.30.2-2.fc29) 
x-originating-ip: [10.225.15.87]
MIME-Version: 1.0
Cc: "marex@denx.de" <marex@denx.de>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH v7] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Mon, 26 Nov 2018 21:30:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B846BE9869EB34B8007B73486E8B47B@internal.synopsys.com>
Content-Transfer-Encoding: base64

SGkgS2hlbSwNCg0KDQpPbiBTYXQsIDIwMTgtMTEtMjQgYXQgMDY6NTcgLTA4MDAsIEtoZW0gUmFq
IHdyb3RlOg0KPiANCj4gaHR0cDovL2Vycm9ycy55b2N0b3Byb2plY3Qub3JnL0Vycm9ycy9EZXRh
aWxzLzIwMjE4NS8NCg0KTG9va2luZyBhdCB0aGUgdGFyZ2V0IG5hbWUgInUtYm9vdC10b29scy0x
XzIwMTguMTEtcjAgZG9fY29tcGlsZSINCkkgdGhpbmsgaXQgbWlnaHQgaGF2ZSBzb21ldGhpbmcg
dG8gZG8gd2l0aCBidW1wIG9mIFUtQm9vdCB0byB2MjAxOC4xMQ0KYW5kIHRoZSBlcnJvciBtZXNz
YWdlIGluIHF1ZXN0aW9uIHdhcyBhZGRlZCBpbiB2MjAxOC4xMS1yYzEsDQpzZWUgaHR0cDovL2dp
dC5kZW54LmRlLz9wPXUtYm9vdC5naXQ7YT1jb21taXRkaWZmO2g9YTQ5NThhNzEwMTdmYjE0MjU0
MmY5NzdjODQzYzVmY2U3NjlmYzZlYQ0KDQpUaGUgcHJvYmxlbSBpcyB3ZSB1c2UgInNhbmRib3hf
ZGVmY29uZmlnIiBhcyBhIGR1bW15IGRlZmNvbmZpZw0KYmVjYXVzZSBvdGhlcndpc2UgKG5vdCBj
b25maWd1cmVkKSBVLUJvb3QncyBidWlsZC1zeXN0ZW0gd29uJ3QNCmFsbG93IHVzIHRvIHByb2Nl
ZWQgYW5kIGluIGl0cyB0dXJuIG1lbnRpb25lZCBwYXRjaCBhZGRzIGEgY2hlY2sNCmZvciBhIHRh
cmdldCBwbGF0Zm9ybSBsaWtlICJpZiBkZWZpbmVkKF9feDg2XzY0X18pIiB3aGljaA0Kd2UgZXNz
ZW50aWFsbHkgZG9uJ3Qgc2F0aXNmeSBhbmQgc28gd2UgZmFpbC4NCg0KVGhlcmUncmUgdGhlIGZv
bGxvd2luZyBzb2x1dGlvbnM6DQogMS4gUmV2ZXJ0IG1lbnRpb25lZCBwYXRjaA0KIDIuIERpc2Fi
bGUgIkNPTkZJR19FRklfTE9BREVSIg0KDQpSZXZlcnRpbmcgaXMgbm90IG5pY2UgYW5kIG5vdCBm
dXR1cmUtcHJvb2YuDQpEaXNhYmxpbmcgb2YgIkNPTkZJR19FRklfTE9BREVSIiBtaWdodCBiZSBk
b25lIGluIGEgY291cGxlIG9mIHdheXMNCmxpa2U6DQogMS4gUGF0Y2hpbmcgc2FuZGJveF9kZWZj
b25maWcNCiAyLiBGaWx0ZXJpbmcgIkNPTkZJR19FRklfTE9BREVSIiBmcm9tICJzYW5kYm94X2Rl
ZmNvbmZpZyIgcmlnaHQgYmVmb3JlDQogICAgZXhlY3V0aW9uIG9mICJtYWtlIHNhbmRib3hfZGVm
Y29uZmlnIg0KDQpJIHRoaW5rIGxhdHRlciBvcHRpb24gaXMgdGhlIHNpbXBsZXN0IGFuZCBjbGVh
bmVzdC4NCg0KU2hvdWxkIEkgc2VuZCBhIHBhdGNoIGZvciB0aGF0Pw0KDQotQWxleGV5DQo=

