Return-Path: <Mark.Jonas@de.bosch.com>
Received: from de-deferred2.bosch-org.com (de-deferred2.bosch-org.com
	[139.15.180.217])
	by mail.openembedded.org (Postfix) with ESMTP id E6C457915B;
	Tue, 21 Aug 2018 08:36:57 +0000 (UTC)
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
	by fe0vms0193.rbdmz01.com (Postfix) with ESMTPS id 41vkYk2qv8z3RQ;
	Tue, 21 Aug 2018 10:36:58 +0200 (CEST)
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
	by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 41vkYh2Fj3z1XLFj4;
	Tue, 21 Aug 2018 10:36:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
	s=2015-01-21; t=1534840616;
	bh=POrmznnVCvuZwVTUe2aSGj8086oni2VDOCpwkkJYpfY=; l=10;
	h=From:From:Reply-To:Sender;
	b=dyMK2GRGFOKZpIKZJ3eyZGzeMOWFtKJgqYkCsfpRqiP+lFMbrmGtmo5Mb3eH7MY7u
	aFugEjzf85MTETIxSMdg6TkIFIRLohW+KaE8eYlANO/jHZPUXTMOC6964A+BAsOOhi
	Vl0rbAfcn8ts9Mlkk1EGon7o36AWTIyfvo/yNEXA=
Received: from si0vm2083.rbesz01.com (unknown [10.58.172.176])
	by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 41vkYh1njcz3rq;
	Tue, 21 Aug 2018 10:36:56 +0200 (CEST)
X-AuditID: 0a3aad17-93bff70000000e54-0c-5b7bcf1c82b6
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher AES128-SHA (128/128 bits))
	(Client did not present a certificate)
	by si0vm2083.rbesz01.com (SMG Outbound) with SMTP id
	06.A8.03668.C1FCB7B5; Tue, 21 Aug 2018 10:36:44 +0200 (CEST)
Received: from FE-MBX2050.de.bosch.com (fe-mbx2050.de.bosch.com [10.3.231.60])
	by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 41vkYh0BgVz6D6mNk; 
	Tue, 21 Aug 2018 10:36:56 +0200 (CEST)
Received: from FE-MBX2051.de.bosch.com (10.3.231.61) by
	FE-MBX2050.de.bosch.com (10.3.231.60) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Tue, 21 Aug 2018 10:36:55 +0200
Received: from FE-MBX2051.de.bosch.com ([fe80::dd3b:6759:60a1:e2]) by
	FE-MBX2051.de.bosch.com ([fe80::dd3b:6759:60a1:e2%6]) with mapi id
	15.01.1466.009; Tue, 21 Aug 2018 10:36:55 +0200
From: "Jonas Mark (BT-FIR/ENG1)" <Mark.Jonas@de.bosch.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [meta-oe][PATCH] directfb: fix tslib version check in
	configure.in
Thread-Index: AdQ5KVmK3bpdqoosTnKoB6aL8gqjJQ==
Date: Tue, 21 Aug 2018 08:36:55 +0000
Message-ID: <664116f8b9fb427aaa911962e77f1a3d@de.bosch.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.142.137.25]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA22Tb0xbZRTGeXv751K47G1L7YHBAs2c/yKw4WLDFmPiFslmojPxw4bLLHKh
	jbTF3oIUsoxVhAJGEGWwDmqd7WSEbe22GFxYwRYTxAyEGVYdBh0L6Ui2aQNbUVe87YW1H/zy
	5r7Pc37POffcXJKQOshMUqs30Ua9ulIpFPPFReeyn8+aqi8puLSUoppbvSdSTftdhKrphg2p
	woufClRzwRDvZUHxt7bfRMUjfYOi4klPP3qDOCTeXUZXamtoY/5L74g13T97RVWnc2u9N3uE
	DehyTitKJgG/AAsuC9GKxKQUN/NgdLSFx128CK6ePyfkLncRtA/7EXcZRvBnnwdFeSEuguYz
	P4qiz+n4RVhtGYgRBG4gYDkQIqKGDJfAZ2en2FySLXobmnqzuPo8eDgbjJXw8ZMQ6H4UK6Hw
	LvjElReVEc4Gt3sqVkJgBVxcfCjgxsbgHOZ0wHK4sxBZ13PBfvwfIhpD4GfgwpV8Ds2Fz9v+
	iE1JYQn8cPI2vwPJbQmptjhhSyBsCYQD8QeQnNEW1Oh2FKgK84ylNFNXsD3vXYPuIuK+k2II
	fT1b7kOYRMpU6pirvkQqUNcwZp0P7SR5Sjk1Wc5KaaWGMrNGzWiOGKsraUaZSaGkpCSp7LHM
	VJfqtAyjNeh9CEhCmU7t97McVaY219FGA4f50GaSr1RQay26EimuUJvo92i6ijZuuLtIUgnU
	6DUWlBjpCrq2XFtp2rCV2VzPJxKdxLY8MtmHCslUtvdaNIJiqtQ6RluxjmdwuHRDjaMT6HXy
	1w8/7iTIf+93sedc24lOQsrXG/R0poI6Mclm4SilqdY/niYzi8rvZw15ghFPXEIBxO5TRomj
	cCr7a8TnAGpI1ntQKlkX49AOJ8vgIQrct4pgbHkGwcgv1xFciNwlwO6c58Ml+/VkWHOzh8fl
	TYHGNgsF/h43BQPtQQpGTnWmwfFWbxqs3FtMg79Pdm2C8LgFw8pXExhmLgckcCswIoNepyMd
	PJPfy2F8ZkYB1o4eALstBGBdjgCs9jVlwFr/R9ngCY9tgfBgcAusOE/lQO/vd7ZB5FH300vs
	jnnsjkVCc3THJrXpf3a8rsZfLrMB7dm055s39z2wdszW2yPhnRnz7QtP1XW9Uuw6dH7rQFd5
	/oOx5poDP43jq0s3/rrtOmI82rhN8NbhM/Yc7/sp0zrz3sKju618yVr7gSv3HchedWyvyu+4
	edhCNO7vF1Kbr62ernVokKPj1e/GgoOvWUI+83PzW61oOvTlQXriiw+8Z5V8RqPe/ixhZNT/
	AQfAWjSzBAAA
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 21 Aug 2018 08:36:58 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KVGhpcyBpcyBteSB0aGlyZCBhdHRlbXB0IGdldHRpbmcgbXkgcmVwbHkg
b250byB0aGUgbWFpbGluZyBsaXN0LiBJDQpzdXNwZWN0IHRoZSBmaXJzdCB0d28gYXR0ZW1wdHMg
d2VyZSBmaWx0ZXJlZCBkdWUgdG8gdGhlIGxpbmsgdG8gdGhlIHYyDQpwYXRjaCBJIGFkZGVkLiBJ
IHJlbW92ZWQgdGhlIGxpbmsgdGhpcyB0aW1lLg0KCQ0KSSBhbHJlYWR5IHNlbnQgYW4gdXBkYXRl
ZCB2ZXJzaW9uIG9mIHRoZSBwYXRjaCB0byB0aGUNCm9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIG1haWxpbmcgbGlzdCBiZWNhdXNlIGFuDQphdXRvbWF0aWMgc3lzdGVt
IGluZm9ybWVkIG1lIHRoYXQgSSBoaXQgdGhlIHdyb25nIG1haWxpbmcgbGlzdC4gSQ0KcHJvcG9z
ZSB0byBzd2l0Y2ggdG8gb3BlbmVtYmVkZGVkLWRldmVsIGZvciBmdXJ0aGVyIGRpc2N1c3Npb25z
Lg0KDQpbbWV0YS1vZSx2Ml0gZGlyZWN0ZmI6IGZpeCB0c2xpYiB2ZXJzaW9uIGNoZWNrIGluIGNv
bmZpZ3VyZS5pbg0KDQpTYWRseSwgdGhlcmUgaGFzbid0IGJlZW4gYW55IHJlYWN0aW9uIHlldC4N
Cg0KPiA+IEZyb206IEd1YW4gQmVuIDxiZW4uZ3VhbkBjbi5ib3NjaC5jb20+DQo+ID4NCj4gPiBU
aGUgcGF0Y2ggbWFrZXMgc3VyZSB0aGF0IHRoZSBvbGQgYXMgd2VsbCBhcyB0aGUgbmV3IHRzbGli
IHBrZy1jb25maWcNCj4gPiBtZXRhZGF0YSBmaWxlIG5hbWluZyBzdHlsZSBpcyBoYW5kbGVkIGNv
cnJlY3RseS4NCj4gPg0KPiA+IHRzbGliIDAuMCB0byAxLjAgY3JlYXRlZCBvbmx5IGEgdHNsaWIt
PFZFUlNJT04+LnBjIHBrZy1jb25maWcNCj4gPiBtZXRhZGF0YQ0KPiA+IGZpbGUuDQo+ID4NCj4g
PiBXaXRoIHRzbGliIDEuMSB0aGUgdHNsaWItPFZFUlNJT04+LnBjIHBoYXNlIG91dCB3YXMgc3Rh
cnRlZC4NCj4gPiBBZGRpdGlvbmFsbHksIHRoZSBwa2ctY29uZmlnIG1ldGFkYXRhIGZpbGUgdHNs
aWIucGMgd2FzIGFkZGVkLg0KPiA+DQo+ID4gU2luY2UgdHNsaWIgMS42IHRoZSB0c2xpYi08VkVS
U0lPTj4ucGMgbWV0YWRhdGEgZmlsZSBpcyBkZXByZWNhdGVkLg0KPiA+IE5vdywgdGhlcmUgaXMg
b25seSBhIHRzbGliLnBjLg0KPiANCj4gSSdtIGEgbGl0dGxlIGNvbmZ1c2VkIGFib3V0IHdoeSBP
RSBuZWVkcyB0aGlzIHBhdGNoPyBTdXJlbHkgT0UgaXMgdXNpbmcNCj4gdGhlIG1vcmUgcmVjZW50
IHRzbGliIHJlbGVhc2VzIGFuZCB0aGVyZWZvcmUgd2UgZG9uJ3QgbmVlZCB0aGlzIHBhdGNoPw0K
DQpPRSBuZWVkcyB0aGlzIHBhdGNoIGJlY2F1c2UgaXQgdXNlcyBEaXJlY3RGQidzIGJ1aWxkIHN5
c3RlbSBhbmQgdGhhdCBpcw0KYnJva2VuIHdpdGggdGhlIG1vc3QgcmVjZW50IHRzbGliIHJlbGVh
c2VzLg0KDQpJbiB0aGUgYmVnaW5uaW5nIHRzbGliIG9ubHkgaGFkIGEgdHNsaWItPFZFUlNJT04+
LnBjIGZvciBwa2djb25maWcuDQoNClN0YXJ0aW5nIHdpdGggdHNsaWIgMS4xLCB0c2xpYi5wYyBh
bmQgdHNsaWItPFZFUlNJT04+LnBjIHdlcmUgY3JlYXRlZA0KZm9yIHBrZ2NvbmZpZy4gQW5kIHRo
ZSB0c2xpYi08VkVSU0lPTj4ucGMgZmlsZSB3YXMgZGVjbGFyZWQgdG8gYmUNCmRlcHJlY2F0ZWQu
DQoNCkZyb20gdHNsaWIgMS42IG9uIG9ubHkgdGhlIHRzbGliLnBjIGZpbGUgaXMgYXZhaWxhYmxl
Lg0KDQpEaXJlY3RGQidzIGNvbmZpZ3VyZS5pbiBpcyBub3QgYXdhcmUgdGhhdCB0aGVyZSBpcyBh
IHNpdHVhdGlvbiB3aXRob3V0DQphIHRzbGliLTxWRVJTSU9OPi5wYyBmaWxlLiBUaHVzIGl0IHdp
bGwgbm90IGZpbmQgdHNsaWIgYW5kIHRoaXMgY2F1c2VzDQp0aGF0IHRoZSB0c2xpYiBpbnB1dCBk
cml2ZXIgd29uJ3QgYmUgYnVpbHQuDQoNCkRpcmVjdEZCIDEuNy43Og0KDQplbmFibGVfdHNsaWI9
bm8NCmlmIHRlc3QgIiRjaGVja2Zvcl90c2xpYiIgPSAieWVzIjsgdGhlbg0KICBQS0dfQ0hFQ0tf
TU9EVUxFUyhbVFNMSUJdLCBbdHNsaWItMS4wID49IDEuMC4wXSwgW2VuYWJsZV90c2xpYj15ZXNd
LCBbZW5hYmxlX3RzbGliPW5vXSkNCiAgaWYgdGVzdCAiJGVuYWJsZV90c2xpYiIgPSAibm8iOyB0
aGVuDQogICAgIFBLR19DSEVDS19NT0RVTEVTKFtUU0xJQl0sIFt0c2xpYi0wLjBdLCBbZW5hYmxl
X3RzbGliPXllc10sIFtlbmFibGVfdHNsaWI9bm8NCiAgICAgICBBQ19NU0dfV0FSTihbKioqIG5v
IHRzbGliIC0tIHRzbGliIGRyaXZlciB3aWxsIG5vdCBiZSBidWlsdC5dKV0pDQogIGZpDQpmaQ0K
DQoNClBhdGNoZWQ6DQoNCmVuYWJsZV90c2xpYj1ubw0KaWYgdGVzdCAiJGNoZWNrZm9yX3RzbGli
IiA9ICJ5ZXMiOyB0aGVuDQogIFBLR19DSEVDS19NT0RVTEVTKFtUU0xJQl0sIFt0c2xpYiA+PSAx
LjFdLCBbZW5hYmxlX3RzbGliPXllc10sIFtlbmFibGVfdHNsaWI9bm9dKQ0KICBpZiB0ZXN0ICIk
ZW5hYmxlX3RzbGliIiA9ICJubyI7IHRoZW4NCiAgICBQS0dfQ0hFQ0tfTU9EVUxFUyhbVFNMSUJd
LCBbdHNsaWItMS4wID49IDEuMF0sIFtlbmFibGVfdHNsaWI9eWVzXSwgW2VuYWJsZV90c2xpYj1u
b10pDQogICAgaWYgdGVzdCAiJGVuYWJsZV90c2xpYiIgPSAibm8iOyB0aGVuDQogICAgICBQS0df
Q0hFQ0tfTU9EVUxFUyhbVFNMSUJdLCBbdHNsaWItMC4wXSwgW2VuYWJsZV90c2xpYj15ZXNdLCBb
ZW5hYmxlX3RzbGliPW5vDQogICAgICAgIEFDX01TR19XQVJOKFsqKiogbm8gdHNsaWIgLS0gdHNs
aWIgZHJpdmVyIHdpbGwgbm90IGJlIGJ1aWx0Ll0pXSkNCiAgICBmaQ0KICBmaQ0KZmkNCg0KR3Jl
ZXRpbmdzLA0KTWFyaw0KDQpCdWlsZGluZyBUZWNobm9sb2dpZXMsIFBhbmVsIFNvZnR3YXJlIEZp
cmUgKEJULUZJUi9FTkcxKSANCkJvc2NoIFNpY2hlcmhlaXRzc3lzdGVtZSBHbWJIIHwgUG9zdGZh
Y2ggMTEgMTEgfCA4NTYyNiBHcmFzYnJ1bm4gfCBHRVJNQU5ZIHwgd3d3LmJvc2Noc2VjdXJpdHku
Y29tDQoNClNpdHo6IFN0dXR0Z2FydCwgUmVnaXN0ZXJnZXJpY2h0OiBBbXRzZ2VyaWNodCBTdHV0
dGdhcnQgSFJCIDIzMTE4IA0KQXVmc2ljaHRzcmF0c3ZvcnNpdHplbmRlcjogU3RlZmFuIEhhcnR1
bmc7IEdlc2Now6RmdHNmw7xocnVuZzogVGFuamEgUsO8Y2tlcnQsIEFuZHJlYXMgQmFydHosIFRo
b21hcyBRdWFudGUsIEJlcm5oYXJkIFNjaHVzdGVyDQo=

