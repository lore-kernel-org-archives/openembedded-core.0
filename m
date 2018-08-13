Return-Path: <Mark.Jonas@de.bosch.com>
Received: from de-deferred2.bosch-org.com (de-deferred2.bosch-org.com
	[139.15.180.217])
	by mail.openembedded.org (Postfix) with ESMTP id 01AC971B57;
	Mon, 13 Aug 2018 09:05:36 +0000 (UTC)
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
	by fe0vms0193.rbdmz01.com (Postfix) with ESMTPS id 41pqZT2s5vz3tq;
	Mon, 13 Aug 2018 11:05:37 +0200 (CEST)
Received: from si0vm1947.rbesz01.com (unknown [139.15.230.188])
	by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 41pqZP25MSz1XLDRD;
	Mon, 13 Aug 2018 11:05:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
	s=2015-01-21; t=1534151133;
	bh=POrmznnVCvuZwVTUe2aSGj8086oni2VDOCpwkkJYpfY=; l=10;
	h=From:From:Reply-To:Sender;
	b=fRT844D+JiTptFEFSGtuOZWoLAoEvaN/goLTr/5EfF/sE5Cqbs19gb24RFobO4n6w
	7QZyfjtPQd6KEg4Uj45qFGdnQ63EmiJkyJi/AontFtOkGYH7j3I6Nsr8I4SgfloVRk
	Q9Piy5uDvWwAuBheynXoK84TMej1Ze9xDk2S7RyM=
Received: from fe0vm1741.rbesz01.com (unknown [10.58.172.176])
	by si0vm1947.rbesz01.com (Postfix) with ESMTPS id 41pqZP1h38z6CjQfM;
	Mon, 13 Aug 2018 11:05:33 +0200 (CEST)
X-AuditID: 0a3aad15-0a3ff70000000cb3-21-5b7149dd3c72
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher AES128-SHA (128/128 bits))
	(Client did not present a certificate)
	by fe0vm1741.rbesz01.com (SMG Outbound) with SMTP id
	9E.3B.03251.DD9417B5; Mon, 13 Aug 2018 11:05:33 +0200 (CEST)
Received: from FE-MBX2050.de.bosch.com (fe-mbx2050.de.bosch.com [10.3.231.60])
	by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 41pqZN74B6zlM8K;
	Mon, 13 Aug 2018 11:05:32 +0200 (CEST)
Received: from FE-MBX2051.de.bosch.com (10.3.231.61) by
	FE-MBX2050.de.bosch.com (10.3.231.60) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Mon, 13 Aug 2018 11:05:32 +0200
Received: from FE-MBX2051.de.bosch.com ([fe80::d5b5:44fa:ef15:153e]) by
	FE-MBX2051.de.bosch.com ([fe80::d5b5:44fa:ef15:153e%6]) with mapi id
	15.01.1466.008; Mon, 13 Aug 2018 11:05:32 +0200
From: "Jonas Mark (BT-FIR/ENG1)" <Mark.Jonas@de.bosch.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [meta-oe][PATCH] directfb: fix tslib version check in
	configure.in
Thread-Index: AdQy5MlMTm9GQRazc0qVl2QIymEVgQ==
Date: Mon, 13 Aug 2018 09:05:32 +0000
Message-ID: <28266ca6a2a84f8ea75c4d991010e215@de.bosch.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.142.147]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA22TbUxbVRjHe3oLvRQuHm7b9bHSJWsy35AOdMsIGKOyD5iYsGWLRjrFAhfa
	rW/2tghLpuCiQDcyZINBrc1IgGDjpEVFMha6FNyQZYJMCe5FWZ04WEBCWGSLgPdyYe0Hv5z8
	z/85v+d5znPuJQm6nlSTJquTcVgNZm28TCLLPqdJv/Xae/qMq1cUWTcfzEuzfhrsILKWpz+N
	e5nIC33+pTTvx2AX2isukL1YwphN5Yxjx0vvyoyLl6oIe62mInTVK61CXalulEAC3gnHmvuk
	vKZxjRgCvQVuJOP0BQTuc/eQsJlDEKr/XipsLiIYnXOvI/E4G2o6r6xrBd4ND+r88fwhAneK
	4fz92Xg+IMd6OPXFqNiNSO7QQfjEmypIHfR06Hkpwduh9kYGLymcA23daTyHsAYCgVGC1wRW
	Qc/0P3FCzxjaLwg+YCXM/LEax6OAt4G35VVeEvgZ6D6/QyC3wenjt9dbpHAK/NB6R9KAlJ6Y
	pJ4o4YkhPDHEWSTxI2Upk1Fuydy9M1PnKGLYIxmZumKbpQcJj6LsQwszpWGESaRNotq4B6Lj
	DOVspSWMdpFirZKqV3BWcpGtpNJoYI2FDpeZYbVqColEIlr+yGZdRRYTy5ps1jACktAqqDGR
	XU9TJYbKI4zDJmBh9AQp0aoo/y6jnsZlBidzmGHsjGMzmkOSWqDu5HEFUxxMGVNRajI7N8Na
	jVBzS2wktqyYTAijF8gkrvabfAqKtRssrKlsA39cwOlNN4qOoHzy+rETjQT5799N3HrzeHMj
	QUusNiujVlFBPhfmKaPL+qgbdSr1xpBNTytjAtGMs2gScfOUUxM8nMT9B9E+gOqTe9+iUzbM
	KPR8O8fgmkQIRLJhaGmc+3h/vYage3WOAF/77xK427Iiha991xJgLcAtwY6BRBhsCVDgP3mX
	gtBnjclQ7R5IhoetTY/B8vBHGMa/mUyByGRIDsPj4yqobWgB8HkWAcZ+vp0Ka10fayC4PLQV
	vFMzT8LqypmnIVh3Kg0mrw9yS2skDeZHOp+DpfuX0+FkcySdr6ub5WYs5mZcrFifsdPg/J8Z
	b7jRy6mr0L2nzLr+fW//mU/lH42cvrTf22s/3K7663L/xCFieG2feUk0xeZ9devbE2Wu5l7T
	B7+80zPR9oqdTJTnFt+othx4mL93xWefb+r8cLQiZ0B9CDf4pgtbDy78lutz7Z/pK3zdNrZQ
	4Jza87736AFcutgvk383Nl1Ebx05s6XOX52756JWwhoNmc8SDtbwH8MuFeGgBAAA
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] directfb: fix tslib version check in configure.in
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
X-List-Received-Date: Mon, 13 Aug 2018 09:05:37 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KSSBhbHJlYWR5IHNlbnQgYW4gdXBkYXRlZCB2ZXJzaW9uIG9mIHRoZSBw
YXRjaCB0byB0aGUNCm9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIG1h
aWxpbmcgbGlzdC4gQW4gYXV0b21hdGljDQpzeXN0ZW0gaW5mb3JtZWQgbWUgdGhhdCBJIGhpdCB0
aGUgd3JvbmcgbWFpbGluZyBsaXN0LiBJIGFtIG5vdw0KaW50ZW50aW9uYWxseSBjcm9zcy1wb3N0
aW5nIHRoaXMgcmVwbHkgdG8gYm90aCBsaXN0cy4gSG9wZWZ1bGx5LCBmdXJ0aGVyDQpkaXNjdXNz
aW9ucyB3aWxsIG9ubHkgdGFrZSBwbGFjZSBhdCBvcGVuZW1iZWRkZWQtZGV2ZWwuDQoNClttZXRh
LW9lLHYyXSBkaXJlY3RmYjogZml4IHRzbGliIHZlcnNpb24gY2hlY2sgaW4gY29uZmlndXJlLmlu
DQpodHRwczovL3BhdGNod29yay5vcGVuZW1iZWRkZWQub3JnL3BhdGNoLzE1MzQ3MC8NCg0KPiA+
IEZyb206IEd1YW4gQmVuIDxiZW4uZ3VhbkBjbi5ib3NjaC5jb20+DQo+ID4NCj4gPiBUaGUgcGF0
Y2ggbWFrZXMgc3VyZSB0aGF0IHRoZSBvbGQgYXMgd2VsbCBhcyB0aGUgbmV3IHRzbGliIHBrZy1j
b25maWcNCj4gPiBtZXRhZGF0YSBmaWxlIG5hbWluZyBzdHlsZSBpcyBoYW5kbGVkIGNvcnJlY3Rs
eS4NCj4gPg0KPiA+IHRzbGliIDAuMCB0byAxLjAgY3JlYXRlZCBvbmx5IGEgdHNsaWItPFZFUlNJ
T04+LnBjIHBrZy1jb25maWcNCj4gPiBtZXRhZGF0YQ0KPiA+IGZpbGUuDQo+ID4NCj4gPiBXaXRo
IHRzbGliIDEuMSB0aGUgdHNsaWItPFZFUlNJT04+LnBjIHBoYXNlIG91dCB3YXMgc3RhcnRlZC4N
Cj4gPiBBZGRpdGlvbmFsbHksIHRoZSBwa2ctY29uZmlnIG1ldGFkYXRhIGZpbGUgdHNsaWIucGMg
d2FzIGFkZGVkLg0KPiA+DQo+ID4gU2luY2UgdHNsaWIgMS42IHRoZSB0c2xpYi08VkVSU0lPTj4u
cGMgbWV0YWRhdGEgZmlsZSBpcyBkZXByZWNhdGVkLg0KPiA+IE5vdywgdGhlcmUgaXMgb25seSBh
IHRzbGliLnBjLg0KDQpJbiB0aGUgYmVnaW5uaW5nIHRzbGliIG9ubHkgaGFkIGEgdHNsaWItPFZF
UlNJT04+LnBjIGZvciBwa2djb25maWcuDQoNClN0YXJ0aW5nIHdpdGggdHNsaWIgMS4xLCB0c2xp
Yi5wYyBhbmQgdHNsaWItPFZFUlNJT04+LnBjIHdlcmUgY3JlYXRlZA0KZm9yIHBrZ2NvbmZpZy4g
QW5kIHRoZSB0c2xpYi08VkVSU0lPTj4ucGMgZmlsZSB3YXMgZGVjbGFyZWQgdG8gYmUNCmRlcHJl
Y2F0ZWQuDQoNCkZyb20gdHNsaWIgMS42IG9uIG9ubHkgdGhlIHRzbGliLnBjIGZpbGUgaXMgYXZh
aWxhYmxlLg0KDQpEaXJlY3RGQidzIGNvbmZpZ3VyZS5pbiBpcyBub3QgYXdhcmUgdGhhdCB0aGVy
ZSBpcyBhIHNpdHVhdGlvbiB3aXRob3V0DQphIHRzbGliLTxWRVJTSU9OPi5wYyBmaWxlLiBUaHVz
IGl0IHdpbGwgbm90IGZpbmQgdHNsaWIgYW5kIHRoaXMgY2F1c2VzDQp0aGF0IHRoZSB0c2xpYiBp
bnB1dCBkcml2ZXIgd29uJ3QgYmUgYnVpbHQuDQoNCkRpcmVjdEZCIDEuNy43Og0KDQplbmFibGVf
dHNsaWI9bm8NCmlmIHRlc3QgIiRjaGVja2Zvcl90c2xpYiIgPSAieWVzIjsgdGhlbg0KICBQS0df
Q0hFQ0tfTU9EVUxFUyhbVFNMSUJdLCBbdHNsaWItMS4wID49IDEuMC4wXSwgW2VuYWJsZV90c2xp
Yj15ZXNdLCBbZW5hYmxlX3RzbGliPW5vXSkNCiAgaWYgdGVzdCAiJGVuYWJsZV90c2xpYiIgPSAi
bm8iOyB0aGVuDQogICAgIFBLR19DSEVDS19NT0RVTEVTKFtUU0xJQl0sIFt0c2xpYi0wLjBdLCBb
ZW5hYmxlX3RzbGliPXllc10sIFtlbmFibGVfdHNsaWI9bm8NCiAgICAgICBBQ19NU0dfV0FSTihb
KioqIG5vIHRzbGliIC0tIHRzbGliIGRyaXZlciB3aWxsIG5vdCBiZSBidWlsdC5dKV0pDQogIGZp
DQpmaQ0KDQoNClBhdGNoZWQ6DQoNCmVuYWJsZV90c2xpYj1ubw0KaWYgdGVzdCAiJGNoZWNrZm9y
X3RzbGliIiA9ICJ5ZXMiOyB0aGVuDQogIFBLR19DSEVDS19NT0RVTEVTKFtUU0xJQl0sIFt0c2xp
YiA+PSAxLjFdLCBbZW5hYmxlX3RzbGliPXllc10sIFtlbmFibGVfdHNsaWI9bm9dKQ0KICBpZiB0
ZXN0ICIkZW5hYmxlX3RzbGliIiA9ICJubyI7IHRoZW4NCiAgICBQS0dfQ0hFQ0tfTU9EVUxFUyhb
VFNMSUJdLCBbdHNsaWItMS4wID49IDEuMF0sIFtlbmFibGVfdHNsaWI9eWVzXSwgW2VuYWJsZV90
c2xpYj1ub10pDQogICAgaWYgdGVzdCAiJGVuYWJsZV90c2xpYiIgPSAibm8iOyB0aGVuDQogICAg
ICBQS0dfQ0hFQ0tfTU9EVUxFUyhbVFNMSUJdLCBbdHNsaWItMC4wXSwgW2VuYWJsZV90c2xpYj15
ZXNdLCBbZW5hYmxlX3RzbGliPW5vDQogICAgICAgIEFDX01TR19XQVJOKFsqKiogbm8gdHNsaWIg
LS0gdHNsaWIgZHJpdmVyIHdpbGwgbm90IGJlIGJ1aWx0Ll0pXSkNCiAgICBmaQ0KICBmaQ0KZmkN
Cg0KR3JlZXRpbmdzLA0KTWFyaw0KDQpCdWlsZGluZyBUZWNobm9sb2dpZXMsIFBhbmVsIFNvZnR3
YXJlIEZpcmUgKEJULUZJUi9FTkcxKSANCkJvc2NoIFNpY2hlcmhlaXRzc3lzdGVtZSBHbWJIIHwg
UG9zdGZhY2ggMTEgMTEgfCA4NTYyNiBHcmFzYnJ1bm4gfCBHRVJNQU5ZIHwgd3d3LmJvc2Noc2Vj
dXJpdHkuY29tDQoNClNpdHo6IFN0dXR0Z2FydCwgUmVnaXN0ZXJnZXJpY2h0OiBBbXRzZ2VyaWNo
dCBTdHV0dGdhcnQgSFJCIDIzMTE4IA0KQXVmc2ljaHRzcmF0c3ZvcnNpdHplbmRlcjogU3RlZmFu
IEhhcnR1bmc7IEdlc2Now6RmdHNmw7xocnVuZzogVGFuamEgUsO8Y2tlcnQsIEFuZHJlYXMgQmFy
dHosIFRob21hcyBRdWFudGUsIEJlcm5oYXJkIFNjaHVzdGVyDQo=

