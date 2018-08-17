Return-Path: <Mark.Jonas@de.bosch.com>
Received: from de-deferred1.bosch-org.com (de-deferred1.bosch-org.com
	[139.15.180.216])
	by mail.openembedded.org (Postfix) with ESMTP id 7C1BB78FB3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 12:09:03 +0000 (UTC)
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
	by si0vms0224.rbdmz01.com (Postfix) with ESMTPS id 41sMSH71Dfz1MT
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 14:09:03 +0200 (CEST)
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
	by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 41sMSD6WQMz4f3klG;
	Fri, 17 Aug 2018 14:09:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
	s=2015-01-21; t=1534507740;
	bh=POrmznnVCvuZwVTUe2aSGj8086oni2VDOCpwkkJYpfY=; l=10;
	h=From:From:Reply-To:Sender;
	b=iI8WpMJXbwQNHfYS2tbCEraXz5Zg17oZ7j9Bmp6zP01zpI7qaUHzdtQW9GJ7hdQ/n
	RPrVIfbzu8BsSnjtRCrUZT3G2HqRpOadsHEdK9NPH/Vvk33OdpQcrh2AoCY93oSTNi
	bQm9vIciofX/oVZrUk5JNxMoPRvLAypRSF/Uf6Q4=
Received: from fe0vm1740.rbesz01.com (unknown [10.58.172.176])
	by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 41sMSD6C29z2gj;
	Fri, 17 Aug 2018 14:09:00 +0200 (CEST)
X-AuditID: 0a3aad14-9abff7000000690f-b2-5b76baddd74c
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher AES128-SHA (128/128 bits))
	(Client did not present a certificate)
	by fe0vm1740.rbesz01.com (SMG Outbound) with SMTP id
	BC.50.26895.DDAB67B5; Fri, 17 Aug 2018 14:09:01 +0200 (CEST)
Received: from FE-MBX2051.de.bosch.com (fe-mbx2051.de.bosch.com [10.3.231.61])
	by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 41sMSD3zGvzlbG3;
	Fri, 17 Aug 2018 14:09:00 +0200 (CEST)
Received: from FE-MBX2051.de.bosch.com (10.3.231.61) by
	FE-MBX2051.de.bosch.com (10.3.231.61) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Fri, 17 Aug 2018 14:09:00 +0200
Received: from FE-MBX2051.de.bosch.com ([fe80::d5b5:44fa:ef15:153e]) by
	FE-MBX2051.de.bosch.com ([fe80::d5b5:44fa:ef15:153e%6]) with mapi id
	15.01.1466.008; Fri, 17 Aug 2018 14:09:00 +0200
From: "Jonas Mark (BT-FIR/ENG1)" <Mark.Jonas@de.bosch.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [meta-oe][PATCH] directfb: fix tslib version check in
	configure.in
Thread-Index: AdQ2Iqgw1madm27sQL2eoCaC2vXKMA==
Date: Fri, 17 Aug 2018 12:09:00 +0000
Message-ID: <76d5914a10d947d698c0dabfd0633a21@de.bosch.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.142.147]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA22TbUxbZRTHeXpbeqlc9rSlclYoczXToZPB3BwBQ4zZh8UP6qYmzppgkQtt
	7AvpbStdjDKI3SgYgW28tJUsseBG5vriEhkSCmVK2RIxsCVQMXtxEsY2MLoXkNl5LxfWfvDL
	k//zP+d3znnOzSUJWROpJPUmK20xaQ3qVIlQUvyt6oXf+u2agsbQhqKZ5QVx0dJsi+gVwd7w
	V6fFe38OnkRvCt6TvFxBG/R22rK99AOJLjayQlTPbqq57+sW1qKHuS6URgLeCcPTfyMXkpAy
	fFgAQ545MX8ZQHDs0om1yx0E7aPTIv4yhOBr3w0Bx6fiYjjcc1HM6Uy8G5YbelO5JAKPIXAu
	3F4NyLEGjp4aZwGSTXofnN4cPj8fam/9hDgtxFvAFbq4qilcAqP3Y6saYRUEAuMEpwmcBaHZ
	ByJ+bgy+Ad4HrICbv8dFXHnAm8Hb8SonCZwH/v7tPLkZjjVeE/PVpTDWeUPYjBTupKLuBOFO
	ItxJxAkk7EWKSrrAbizcvbMg31JOMwcLCvM/NBtDiP8mmX1oJVIZQZhE6nTKH7JrZCKtnXEY
	I2gXKVArqH3fs1ZGubnCodMyujKLzUAzaiWFUlJSZPLHNmMrN+oZRm82RRCQhDqTOvANy1EV
	WsdB2mLmsQjKJoXqLMq0r0Ijw1VaK/0RTVfTlvVoCUmqgRo4x4JSC11F11TqDdb1sFrF93wy
	OZLcVkCmRdCLZDrbe1M/15up1hoZfdUavpHHZetuAr2A3iBj9U2tBPlw8Th7zjS2tRIyocls
	opVZ1BauFuYonc30eBplDnX5B0YjUyQFEhXn0RRi9ymnxByczv4GiTmA6pN7D8ika2YC2uFj
	GRxOh8D1Yjh/dwJBeHoSgT9+h4Au3xUhfNc1mQaPAuwR7B58AkY6AhT0fjlHQdjTmgGHXIMZ
	cG9hNgP+6Ty+AZaidRhut0QxTJydksL1qbAcohMTWXCkuQOgy/0XwJG7cYBfLl3LgUcnP1dB
	cOl8LiydnsuFez7PU3Buvudp8F69+QzE/23fCmdil7dCsOHo8/PsjgXsjtuwjduxVWv9nx2v
	uYnHKWuR19GzsfFdTdo2U3CmR7XiWvTVO6daBuv3jB0a3mUrcezHhtjys5oaiP84Li274mx6
	La9ZL9HltX8c9ewo++xCp+gtsv/XOm3fmT1/ZreKF4Ohd9q2NQ19EpFMnq0rGhktfdvfIHh9
	+A91aerVkuzMT295vNGu/S9FH3Q7/eSpLxbUQkanLXyOsDDa/wCYWVXLnwQAAA==
Cc: "openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Fri, 17 Aug 2018 12:09:03 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KSSBhbHJlYWR5IHNlbnQgYW4gdXBkYXRlZCB2ZXJzaW9uIG9mIHRoZSBw
YXRjaCB0byB0aGUNCm9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIG1h
aWxpbmcgbGlzdCBiZWNhdXNlIGFuDQphdXRvbWF0aWMgc3lzdGVtIGluZm9ybWVkIG1lIHRoYXQg
SSBoaXQgdGhlIHdyb25nIG1haWxpbmcgbGlzdC4gSQ0KcHJvcG9zZSB0byBzd2l0Y2ggdG8gb3Bl
bmVtYmVkZGVkLWRldmVsIGZvciBmdXJ0aGVyIGRpc2N1c3Npb25zLg0KDQpbbWV0YS1vZSx2Ml0g
ZGlyZWN0ZmI6IGZpeCB0c2xpYiB2ZXJzaW9uIGNoZWNrIGluIGNvbmZpZ3VyZS5pbg0KaHR0cHM6
Ly9wYXRjaHdvcmsub3BlbmVtYmVkZGVkLm9yZy9wYXRjaC8xNTM0NzAvDQoNClNhZGx5LCB0aGVy
ZSBoYXNuJ3QgYmVlbiBhbnkgcmVhY3Rpb24geWV0Lg0KDQo+ID4gRnJvbTogR3VhbiBCZW4gPGJl
bi5ndWFuQGNuLmJvc2NoLmNvbT4NCj4gPg0KPiA+IFRoZSBwYXRjaCBtYWtlcyBzdXJlIHRoYXQg
dGhlIG9sZCBhcyB3ZWxsIGFzIHRoZSBuZXcgdHNsaWIgcGtnLWNvbmZpZw0KPiA+IG1ldGFkYXRh
IGZpbGUgbmFtaW5nIHN0eWxlIGlzIGhhbmRsZWQgY29ycmVjdGx5Lg0KPiA+DQo+ID4gdHNsaWIg
MC4wIHRvIDEuMCBjcmVhdGVkIG9ubHkgYSB0c2xpYi08VkVSU0lPTj4ucGMgcGtnLWNvbmZpZw0K
PiA+IG1ldGFkYXRhDQo+ID4gZmlsZS4NCj4gPg0KPiA+IFdpdGggdHNsaWIgMS4xIHRoZSB0c2xp
Yi08VkVSU0lPTj4ucGMgcGhhc2Ugb3V0IHdhcyBzdGFydGVkLg0KPiA+IEFkZGl0aW9uYWxseSwg
dGhlIHBrZy1jb25maWcgbWV0YWRhdGEgZmlsZSB0c2xpYi5wYyB3YXMgYWRkZWQuDQo+ID4NCj4g
PiBTaW5jZSB0c2xpYiAxLjYgdGhlIHRzbGliLTxWRVJTSU9OPi5wYyBtZXRhZGF0YSBmaWxlIGlz
IGRlcHJlY2F0ZWQuDQo+ID4gTm93LCB0aGVyZSBpcyBvbmx5IGEgdHNsaWIucGMuDQo+IA0KPiBJ
J20gYSBsaXR0bGUgY29uZnVzZWQgYWJvdXQgd2h5IE9FIG5lZWRzIHRoaXMgcGF0Y2g/IFN1cmVs
eSBPRSBpcyB1c2luZw0KPiB0aGUgbW9yZSByZWNlbnQgdHNsaWIgcmVsZWFzZXMgYW5kIHRoZXJl
Zm9yZSB3ZSBkb24ndCBuZWVkIHRoaXMgcGF0Y2g/DQoNCk9FIG5lZWRzIHRoaXMgcGF0Y2ggYmVj
YXVzZSBpdCB1c2VzIERpcmVjdEZCJ3MgYnVpbGQgc3lzdGVtIGFuZCB0aGF0IGlzDQpicm9rZW4g
d2l0aCB0aGUgbW9zdCByZWNlbnQgdHNsaWIgcmVsZWFzZXMuDQoNCkluIHRoZSBiZWdpbm5pbmcg
dHNsaWIgb25seSBoYWQgYSB0c2xpYi08VkVSU0lPTj4ucGMgZm9yIHBrZ2NvbmZpZy4NCg0KU3Rh
cnRpbmcgd2l0aCB0c2xpYiAxLjEsIHRzbGliLnBjIGFuZCB0c2xpYi08VkVSU0lPTj4ucGMgd2Vy
ZSBjcmVhdGVkDQpmb3IgcGtnY29uZmlnLiBBbmQgdGhlIHRzbGliLTxWRVJTSU9OPi5wYyBmaWxl
IHdhcyBkZWNsYXJlZCB0byBiZQ0KZGVwcmVjYXRlZC4NCg0KRnJvbSB0c2xpYiAxLjYgb24gb25s
eSB0aGUgdHNsaWIucGMgZmlsZSBpcyBhdmFpbGFibGUuDQoNCkRpcmVjdEZCJ3MgY29uZmlndXJl
LmluIGlzIG5vdCBhd2FyZSB0aGF0IHRoZXJlIGlzIGEgc2l0dWF0aW9uIHdpdGhvdXQNCmEgdHNs
aWItPFZFUlNJT04+LnBjIGZpbGUuIFRodXMgaXQgd2lsbCBub3QgZmluZCB0c2xpYiBhbmQgdGhp
cyBjYXVzZXMNCnRoYXQgdGhlIHRzbGliIGlucHV0IGRyaXZlciB3b24ndCBiZSBidWlsdC4NCg0K
RGlyZWN0RkIgMS43Ljc6DQoNCmVuYWJsZV90c2xpYj1ubw0KaWYgdGVzdCAiJGNoZWNrZm9yX3Rz
bGliIiA9ICJ5ZXMiOyB0aGVuDQogIFBLR19DSEVDS19NT0RVTEVTKFtUU0xJQl0sIFt0c2xpYi0x
LjAgPj0gMS4wLjBdLCBbZW5hYmxlX3RzbGliPXllc10sIFtlbmFibGVfdHNsaWI9bm9dKQ0KICBp
ZiB0ZXN0ICIkZW5hYmxlX3RzbGliIiA9ICJubyI7IHRoZW4NCiAgICAgUEtHX0NIRUNLX01PRFVM
RVMoW1RTTElCXSwgW3RzbGliLTAuMF0sIFtlbmFibGVfdHNsaWI9eWVzXSwgW2VuYWJsZV90c2xp
Yj1ubw0KICAgICAgIEFDX01TR19XQVJOKFsqKiogbm8gdHNsaWIgLS0gdHNsaWIgZHJpdmVyIHdp
bGwgbm90IGJlIGJ1aWx0Ll0pXSkNCiAgZmkNCmZpDQoNCg0KUGF0Y2hlZDoNCg0KZW5hYmxlX3Rz
bGliPW5vDQppZiB0ZXN0ICIkY2hlY2tmb3JfdHNsaWIiID0gInllcyI7IHRoZW4NCiAgUEtHX0NI
RUNLX01PRFVMRVMoW1RTTElCXSwgW3RzbGliID49IDEuMV0sIFtlbmFibGVfdHNsaWI9eWVzXSwg
W2VuYWJsZV90c2xpYj1ub10pDQogIGlmIHRlc3QgIiRlbmFibGVfdHNsaWIiID0gIm5vIjsgdGhl
bg0KICAgIFBLR19DSEVDS19NT0RVTEVTKFtUU0xJQl0sIFt0c2xpYi0xLjAgPj0gMS4wXSwgW2Vu
YWJsZV90c2xpYj15ZXNdLCBbZW5hYmxlX3RzbGliPW5vXSkNCiAgICBpZiB0ZXN0ICIkZW5hYmxl
X3RzbGliIiA9ICJubyI7IHRoZW4NCiAgICAgIFBLR19DSEVDS19NT0RVTEVTKFtUU0xJQl0sIFt0
c2xpYi0wLjBdLCBbZW5hYmxlX3RzbGliPXllc10sIFtlbmFibGVfdHNsaWI9bm8NCiAgICAgICAg
QUNfTVNHX1dBUk4oWyoqKiBubyB0c2xpYiAtLSB0c2xpYiBkcml2ZXIgd2lsbCBub3QgYmUgYnVp
bHQuXSldKQ0KICAgIGZpDQogIGZpDQpmaQ0KDQpHcmVldGluZ3MsDQpNYXJrDQoNCkJ1aWxkaW5n
IFRlY2hub2xvZ2llcywgUGFuZWwgU29mdHdhcmUgRmlyZSAoQlQtRklSL0VORzEpIA0KQm9zY2gg
U2ljaGVyaGVpdHNzeXN0ZW1lIEdtYkggfCBQb3N0ZmFjaCAxMSAxMSB8IDg1NjI2IEdyYXNicnVu
biB8IEdFUk1BTlkgfCB3d3cuYm9zY2hzZWN1cml0eS5jb20NCg0KU2l0ejogU3R1dHRnYXJ0LCBS
ZWdpc3RlcmdlcmljaHQ6IEFtdHNnZXJpY2h0IFN0dXR0Z2FydCBIUkIgMjMxMTggDQpBdWZzaWNo
dHNyYXRzdm9yc2l0emVuZGVyOiBTdGVmYW4gSGFydHVuZzsgR2VzY2jDpGZ0c2bDvGhydW5nOiBU
YW5qYSBSw7xja2VydCwgQW5kcmVhcyBCYXJ0eiwgVGhvbWFzIFF1YW50ZSwgQmVybmhhcmQgU2No
dXN0ZXINCg==

