Return-Path: <shohei.maruyama@cybertrust.co.jp>
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
	(mail-eopbgr1400133.outbound.protection.outlook.com [40.107.140.133])
	by mail.openembedded.org (Postfix) with ESMTP id E4E257F820
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 11:39:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=fmk00zSJYO7kbV49Fb+/AKVNXaWkm+ArKuBuON/0gpXdkqmcqMTiC74qL/r50gYalE8tcb4NJOGvPgD4ZchiN+C8xVwTiVfLSfyHzdiwikmD07vYsRaqUrfJpWLJQKw0X+nT1l8x6BcT14uBZmeNGLkrkBXcyJllO3GUP5NhlRQrMl9VycjUdEL3lsbLcuzXa1R1nd7UvaCU6NmYUxsnF1mvDBk4Cl5xXKcsRpYBZKEg46M8aQhrRBi1XP8v0X+JP5H6VtAN8XNEul06C8lq3CL7628MsUx8feefJ78TsbwyG7KZFf4fUPcvU+456xub45LNbPtSN/wtC/1NIXP+UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vos9YHkrFJ548DNvFSbg52iIo3+K555396lnZBboYJU=;
	b=EheE+5AHecYS0J643d1kC03+Q3PGaNCNWr0PjI6dHG57xzuKC1MLN53idd9bLeHsErVBUmXWS7kMc7cF9dnPQBYQv19kvszNvzLtWsWFoTqBQxY9qqD66mwxGqdsQAfYhafEslYoc6jaXdHY18ob5KThYlKfaeW930SahbvdVfmCWwAsA2JM0m7T9YcKXEiD+z37K9eucNJywsRJM1Gh6ERrJqmt5+vqZSbZWnKD5GjSiJ+J9Z1MChgGBQdRq5Zd5Vm2RqSk+BfFGS/4PLxnU9ptQrjT1Id+tz6H+VwezfxICzkCC4CSMiOwmo9d8yUJbT9iTQacxo5T5HmvkTRmew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cybertrust.co.jp; dmarc=pass action=none
	header.from=cybertrust.co.jp; dkim=pass header.d=cybertrust.co.jp;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intra01.onmicrosoft.com; s=selector1-intra01-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vos9YHkrFJ548DNvFSbg52iIo3+K555396lnZBboYJU=;
	b=iR/ItC0DlsmByp7f3k29Gi039PZ5VgutkUoL5Q4HthA4PQAu6o36DqY/3Ltnokl66nlfV0bkv1CNwlltl3c5bpFIVt7LIp/koI0e1/aZns4d14NuU9+0WcQxvNycb1YTOppvE7pVsH+5U0xOkTywJ7/hYLkvJt8z3rncGOuDCvo=
Received: from TYAPR01MB3007.jpnprd01.prod.outlook.com (20.177.101.86) by
	TYAPR01MB4285.jpnprd01.prod.outlook.com (20.179.187.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2451.28; Wed, 20 Nov 2019 11:39:32 +0000
Received: from TYAPR01MB3007.jpnprd01.prod.outlook.com
	([fe80::ac7e:4214:cf9b:e29e]) by
	TYAPR01MB3007.jpnprd01.prod.outlook.com
	([fe80::ac7e:4214:cf9b:e29e%7]) with mapi id 15.20.2451.029;
	Wed, 20 Nov 2019 11:39:32 +0000
From: <shohei.maruyama@cybertrust.co.jp>
To: <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [PATCH] pseudo: Update checksum of the license file
Thread-Index: AQHVn2tbLXUnTBJliUWpp5/qn+xIcA==
Date: Wed, 20 Nov 2019 11:39:32 +0000
Message-ID: <f3e6ab8a8e2fad37929e16fb99ab861741319d24.camel@cybertrust.co.jp>
References: <20191120062728.105714-1-shohei.maruyama@cybertrust.co.jp>
	<CANNYZj8X0YbDb2rDFjrqVMt-gm+Y8VxOgcQpZgr8abeVJ_rgmg@mail.gmail.com>
In-Reply-To: <CANNYZj8X0YbDb2rDFjrqVMt-gm+Y8VxOgcQpZgr8abeVJ_rgmg@mail.gmail.com>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TY2PR0101CA0030.apcprd01.prod.exchangelabs.com
	(2603:1096:404:8000::16) To TYAPR01MB3007.jpnprd01.prod.outlook.com
	(2603:1096:404:7f::22)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=shohei.maruyama@cybertrust.co.jp; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [219.123.27.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0530e3b3-c3bc-4cd5-73e8-08d76dae4f73
x-ms-traffictypediagnostic: TYAPR01MB4285:
x-microsoft-antispam-prvs: <TYAPR01MB4285D5914384F09F02A3E789D64F0@TYAPR01MB4285.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39850400004)(376002)(136003)(396003)(346002)(366004)(189003)(199004)(3846002)(2906002)(8936002)(14454004)(4744005)(71200400001)(236005)(6116002)(71190400001)(54896002)(6486002)(6512007)(36756003)(26005)(81166006)(81156014)(229853002)(6436002)(86362001)(186003)(4326008)(66946007)(8676002)(118296001)(76176011)(52116002)(66556008)(102836004)(66476007)(64756008)(66446008)(6506007)(386003)(25786009)(15650500001)(476003)(4001150100001)(66066001)(486006)(11346002)(446003)(2616005)(6246003)(6916009)(7736002)(5660300002)(99286004)(478600001)(256004)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:TYAPR01MB4285;
	H:TYAPR01MB3007.jpnprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cybertrust.co.jp does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hcc9niOF1H4uO0FSJPtoaZv98L3cMVzCgx+Ric/YqyYDlrEFy7RxoS+da2c0an4Yg8T6UD79jlxLrEByFJhOGlkGRGXsrh4gJzVAShh/J+/JxlAoO+tT4z6MCSKqkkMnRUW8yNa6CUB2bcvtOqs9FSCuKayzld6nn5hKw7ISss8CG64nkJxPCg/+RFuGVx7H3RTa/FRzlQlVKP5+o7ELB0G177PFCZpLzTiUl0fA3gI25TCABb6zzUmi7Va285BkhtyzxWhqAmQExyjWmRt2BUMVXMIi2vC7rSfeyeYrX6CKRLflB+IIvBQshTmQzsHChrbrqpLABkcr8D3PhjpLZAwemv1HbZrkCqy4HLphKSmsrUY88LyO5LEeWjBJcckVPHjqnpStjZk/98XQWbV8WncjBGqR/NYhqNo8OfrSSV9iyFvJOBT6KVMWZLgQwUnR
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: cybertrust.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0530e3b3-c3bc-4cd5-73e8-08d76dae4f73
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 11:39:32.4286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72cc4624-32b4-4dab-b80a-8563e559bd82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oz87EkFaJ5lIm8qlEO3WUUoQ/OmUlsDLqgO354P3KXCNJWSAknX4antNu7I9dt6hw6SiTcl0jDn6WN6S4xZ0U2Kz1Fay0peYXSNOWg3tAaxhNWcksvfQO0l1xaZYBEEO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4285
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: Update checksum of the license file
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
X-List-Received-Date: Wed, 20 Nov 2019 11:39:33 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_f3e6ab8a8e2fad37929e16fb99ab861741319d24camelcybertrust_"

--_000_f3e6ab8a8e2fad37929e16fb99ab861741319d24camelcybertrust_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE5LTExLTIwIGF0IDEyOjIzICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCk9uIFdlZCwgMjAgTm92IDIwMTkgYXQgMDc6MjYsIDxzaG9oZWkubWFydXlhbWFAY3liZXJ0
cnVzdC5jby5qcDxtYWlsdG86c2hvaGVpLm1hcnV5YW1hQGN5YmVydHJ1c3QuY28uanA+PiB3cm90
ZToNClJlY2VudGx5IHBzZXVkby5pbmMgaGFzIGJlZW4gdXBkYXRlZCB0byBsYXRlc3QgbWFzdGVy
IChkNTBiOWM1MTFlMTdjNmY1ODJlDQpmMzliNjFlYWFhOGQ0NTU1ZWFiYmEpLCBidXQgY2hlY2tz
dW0gb2YgdGhlIGxpY2Vuc2UgZmlsZSBkaWQgbm90IGNoYW5nZS4NClRoaXMgY29tbWl0IHVwZGF0
ZXMgdGhlIGNoZWNrc3VtIHRvIGxhdGVzdCBvbmUuDQoNCkkgYW0gbm90IHN1cmUgSSBjYW4gbWFr
ZSBzZW5zZSBvZiB0aGlzLiBXaGVuIHRoZSBjaGVja3N1bSBvZiB0aGUgZmlsZSBjaGFuZ2VzIHVw
c3RyZWFtLCBiaXRiYWtlIHdpbGwgY29tcGxhaW4gYW5kIHJlZnVzZSB0byBwcm9jZWVkLCB3aGlj
aCBpcyBub3QgaGFwcGVuaW5nIHdpdGggdGhlIGN1cnJlbnQgbWFzdGVyIGJyYW5jaC4NCldoYXQg
ZXJyb3IgbWVzc2FnZSBhcmUgeW91IHNlZWluZyBhbmQgd2hhdCBjb21taXQgYXJlIHlvdSBvbj8N
Cg0KQWxleA0KDQpIaSBBbGV4LA0KDQpUaGFuayB5b3UgZm9yIHJlcGx5aW5nLg0KSSdtIHNvcnJ5
IGZvciBJIGZvcmdvdCB0byBkZXNjcmliZSBteSBzaXR1YXRpb24uIEknbSBvbiBjOWExYTYwOGY1
MTQ2ZTVkY2ZlYmM4ZTU2NmNiN2Y2Mzg4YTM5ODZmICh3YXJyaW9yKS4NCg0KUmVnYXJkcywNCg0K
U2hvaGVpIE1hcnV5YW1hDQo=

--_000_f3e6ab8a8e2fad37929e16fb99ab861741319d24camelcybertrust_
Content-Type: text/html; charset="utf-8"
Content-ID: <5DADBDEC2EC1A74ABD12F78E31D35FE8@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgZGlyPSJsdHIiPg0KPGhlYWQ+DQo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUi
IGNvbnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+DQo8L2hlYWQ+DQo8Ym9keSBzdHls
ZT0idGV4dC1hbGlnbjpsZWZ0OyBkaXJlY3Rpb246bHRyOyI+DQo8ZGl2Pk9uIFdlZCwgMjAxOS0x
MS0yMCBhdCAxMjoyMyAmIzQzOzAxMDAsIEFsZXhhbmRlciBLYW5hdmluIHdyb3RlOjwvZGl2Pg0K
PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4OyBib3JkZXIt
bGVmdDoycHggIzcyOWZjZiBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxkaXYgZGlyPSJsdHIi
Pg0KPGRpdiBkaXI9Imx0ciI+T24gV2VkLCAyMCBOb3YgMjAxOSBhdCAwNzoyNiwgJmx0OzxhIGhy
ZWY9Im1haWx0bzpzaG9oZWkubWFydXlhbWFAY3liZXJ0cnVzdC5jby5qcCI+c2hvaGVpLm1hcnV5
YW1hQGN5YmVydHJ1c3QuY28uanA8L2E+Jmd0OyB3cm90ZTo8YnI+DQo8L2Rpdj4NCjxkaXYgY2xh
c3M9ImdtYWlsX3F1b3RlIj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIHN0eWxlPSJtYXJnaW46
MCAwIDAgLjhleDsgYm9yZGVyLWxlZnQ6MnB4ICM3MjlmY2Ygc29saWQ7cGFkZGluZy1sZWZ0OjFl
eCI+DQpSZWNlbnRseSBwc2V1ZG8uaW5jIGhhcyBiZWVuIHVwZGF0ZWQgdG8gbGF0ZXN0IG1hc3Rl
ciAoZDUwYjljNTExZTE3YzZmNTgyZTxicj4NCmYzOWI2MWVhYWE4ZDQ1NTVlYWJiYSksIGJ1dCBj
aGVja3N1bSBvZiB0aGUgbGljZW5zZSBmaWxlIGRpZCBub3QgY2hhbmdlLjxicj4NClRoaXMgY29t
bWl0IHVwZGF0ZXMgdGhlIGNoZWNrc3VtIHRvIGxhdGVzdCBvbmUuPGJyPg0KPC9ibG9ja3F1b3Rl
Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+SSBhbSBub3Qgc3VyZSBJIGNhbiBtYWtlIHNlbnNl
IG9mIHRoaXMuIFdoZW4gdGhlIGNoZWNrc3VtIG9mIHRoZSBmaWxlIGNoYW5nZXMgdXBzdHJlYW0s
IGJpdGJha2Ugd2lsbCBjb21wbGFpbiBhbmQgcmVmdXNlIHRvIHByb2NlZWQsIHdoaWNoIGlzIG5v
dCBoYXBwZW5pbmcgd2l0aCB0aGUgY3VycmVudCBtYXN0ZXIgYnJhbmNoLjwvZGl2Pg0KPGRpdj5X
aGF0IGVycm9yIG1lc3NhZ2UgYXJlIHlvdSBzZWVpbmcgYW5kIHdoYXQgY29tbWl0IGFyZSB5b3Ug
b24/PC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5BbGV4PC9kaXY+DQo8L2Rpdj4NCjwv
ZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+SGkgQWxleCw8L2Rp
dj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PlRoYW5rIHlvdSBmb3IgcmVwbHlpbmcuPC9kaXY+
DQo8ZGl2PkknbSBzb3JyeSBmb3IgSSBmb3Jnb3QgdG8gZGVzY3JpYmUgbXkgc2l0dWF0aW9uLiBJ
J20gb24gYzlhMWE2MDhmNTE0NmU1ZGNmZWJjOGU1NjZjYjdmNjM4OGEzOTg2ZiAod2Fycmlvciku
PC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5SZWdhcmRzLDwvZGl2Pg0KPGRpdj48YnI+
DQo8L2Rpdj4NCjxkaXY+U2hvaGVpIE1hcnV5YW1hPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_f3e6ab8a8e2fad37929e16fb99ab861741319d24camelcybertrust_--
