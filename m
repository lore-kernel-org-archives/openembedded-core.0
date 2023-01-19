Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35537C004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 12:59:31 +0000 (UTC)
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.252])
 by mx.groups.io with SMTP id smtpd.web10.44315.1674133161354569579
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 04:59:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yadro.com header.s=mta-01 header.b=YnMwn+bp;
 spf=pass (domain: yadro.com, ip: 89.207.88.252, mailfrom: s.zhmylev@yadro.com)
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id 226D23419F9
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 15:59:18 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:content-id:content-transfer-encoding:content-type:content-type
	:date:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mta-01; bh=/tpa1UPo9QcVD+zppm
	svPUddc5w8Ot437G2sHGxPDq4=; b=YnMwn+bpIGmbtW73FQt7J5HZqPK2+yvgsA
	8cZWQEs3PTyWEFmKaNGc4ZqPgI3lGV0gFDWVCqyNyhjTlYoFm7ile0qFvEMdbOie
	5/V2s9/CLBc6NwkPE2+FPbd0bsegCMlXJ73BAQ5KCLHPskHFRneZ+N0APYHXg1jn
	HndHHf7Wg=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id 1554E34191A
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 15:59:18 +0300 (MSK)
Received: from T-EXCH-10.corp.yadro.com (172.17.11.60) by
 T-EXCH-08.corp.yadro.com (172.17.11.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Thu, 19 Jan 2023 15:59:17 +0300
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-10.corp.yadro.com (172.17.11.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Thu, 19 Jan 2023 15:59:17 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Thu,
 19 Jan 2023 15:59:17 +0300
From: Sergey Zhmylev <s.zhmylev@yadro.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] meson: use TRANSLATED_TARGET_ARCH in cross
 builds
Thread-Topic: [OE-core] [PATCH] meson: use TRANSLATED_TARGET_ARCH in cross
 builds
Thread-Index: AQHZK/8C5m9GiICTWU2IdW1QC85sba6lgWSA
Date: Thu, 19 Jan 2023 12:59:17 +0000
Message-ID: <1ffdde39ffed7b1643a2f1ee609f13d28b2e83f3.camel@yadro.com>
References: <173BB490748AAD1C.24231@lists.openembedded.org>
In-Reply-To: <173BB490748AAD1C.24231@lists.openembedded.org>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.3.38]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A878F75744C8B542A4B837CD7498765E@yadro.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 12:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176136

QWNjaWRlbnRhbGx5IEkndmUgc2VudCBhbiBpbmNvbXBsZXRlIHBhdGNoLCBwbGVhc2UgaWdub3Jl
Lg0KDQpTZXJnZWkNCg0KDQoNCk9uIFRodSwgMjAyMy0wMS0xOSBhdCAxNToxMCArMDMwMCwgU2Vy
Z2V5IFpobXlsZXYgd3JvdGU6DQo+IEZyb206IFNlcmdlaSBaaG15bGV2IDxzLnpobXlsZXZAeWFk
cm8uY29tPg0KPiANCj4gVEFSR0VUX0FSQ0ggZm9yIG1vc3Qgb2YgeDg2XzY0IG1hY2hpbmVzIHNl
dHMgYWRkaXRpb25hbA0KPiAtbWFyY2ggcGFyYW1ldGVyIGluIG1lc29uIGNvbmZpZ3VyYXRpb24s
IHdoaWNoIGlzIG5vdCBzdXBwb3J0ZWQNCj4gZHVyaW5nIGJ1aWxkIGFuZCBzZXZlcmFsIG1lc29u
IHJlY2lwZXMgZmFpbC7CoCBUaGUgcGF0Y2ggbWFrZXMNCj4gbWVzb24uYmJjbGFzcyB1c2UgVFJB
TlNMQVRFRF9UQVJHRVRfQVJDSCBpbnN0ZWFkIG9mIFRBUkdFVF9BUkNIDQo+IGluIG9yZGVyIHRv
IHByb3Blcmx5IHNldCAtbWFyY2ggZm9yIGNyb3NzIGJ1aWxkcy4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFNlcmdlaSBaaG15bGV2IDxzLnpobXlsZXZAeWFkcm8uY29tPg0KPiAtLS0NCj4gwqBtZXRh
L2NsYXNzZXMtcmVjaXBlL21lc29uLmJiY2xhc3MgfCAyICstDQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9j
bGFzc2VzLXJlY2lwZS9tZXNvbi5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzLQ0KPiByZWNpcGUvbWVz
b24uYmJjbGFzcw0KPiBpbmRleCA0ODY4OGJlZDc1Li42NWZkODBmYzdlIDEwMDY0NA0KPiAtLS0g
YS9tZXRhL2NsYXNzZXMtcmVjaXBlL21lc29uLmJiY2xhc3MNCj4gKysrIGIvbWV0YS9jbGFzc2Vz
LXJlY2lwZS9tZXNvbi5iYmNsYXNzDQo+IEBAIC05Nyw3ICs5Nyw3IEBAIGVuZGlhbiA9ICcke0Bt
ZXNvbl9lbmRpYW4oJ0hPU1QnLCBkKX0nDQo+IMKgW3RhcmdldF9tYWNoaW5lXQ0KPiDCoHN5c3Rl
bSA9ICcke0BtZXNvbl9vcGVyYXRpbmdfc3lzdGVtKCdUQVJHRVRfT1MnLCBkKX0nDQo+IMKgY3B1
X2ZhbWlseSA9ICcke0BtZXNvbl9jcHVfZmFtaWx5KCdUQVJHRVRfQVJDSCcsIGQpfScNCj4gLWNw
dSA9ICcke1RBUkdFVF9BUkNIfScNCj4gK2NwdSA9ICcke1RSQU5TTEFURURfVEFSR0VUX0FSQ0h9
Jw0KPiDCoGVuZGlhbiA9ICcke0BtZXNvbl9lbmRpYW4oJ1RBUkdFVCcsIGQpfScNCj4gwqBFT0YN
Cj4gwqANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2
ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAo
IzE3NjEzNSk6DQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRl
ZC1jb3JlL21lc3NhZ2UvMTc2MTM1DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL210Lzk2Mzc1NjE3LzcyMjA1NDYNCj4gR3JvdXAgT3duZXI6IG9wZW5l
bWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6
IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC0NCj4gY29yZS91
bnN1YsKgW3MuemhteWxldkB5YWRyby5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+
IA0K


