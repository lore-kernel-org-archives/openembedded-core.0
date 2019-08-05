Return-Path: <chris.laplante@agilent.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr790047.outbound.protection.outlook.com [40.107.79.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5BDF37E71C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 16:39:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=T3wE7qrQAceVc7qgsOXHBRprzJWmRNgqfrGbD6tXpoBS+yuCONdQR5u/PPuAew1PejPZqIw+74yZWTuMNrX3GNqOBL85Xms3dKnYKwTqO2314pal5jgxynzJO/iL6+m3x56rSLG64T1ljjp05dePi24m4QpS1BEct8UFD8elT8GweWf/1Wg/2mOSHsnfyRrDDeMf+nJO0A7VhSdadHr1YZEeXVuv2RdgQhOjryePdWR+sqAOWwAgY3ClgZmSXUgC31i0C4z6WuMNJc2PZLTYMG3NMztnmc444IVfilpX6rUG/5YZODxYYuxlGrjksaV/E1t2S387Q/CxA/33+hHjuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=IDLOlKE4fa5iaoj8Sp6N37Qak5DMeFv2nwLiMRLC1b8=;
	b=YsbqJJRskdW8ZEJ23+hmX+c/MWtz9Ms5XiYKGT9t5rT4vDm9QC4DycKb2E/1URlUCIFD+f6wrxMCzY7pa/s7scSrF2oYTxRy34yF8ThmceNLWLuf+8rXXX0iGfRT3oGyhx2nI76AOBDMRKByyNVt4JPWSiCI35h06XuUaaG3pgiXdP/zyB2ikcsN5sCA9fbZpQA3AEiwef8/sHHpvLvCdOpqitJmeCHLf5TsGqtm2CPkU64ceg3InptIE5U5SSErWthIzQUjMWmSKXwbq/80muIkKE9c+mMtUm9GJEzvTDS9Tio1VEq/v4Npb5ISFnGxHTs0yIKcC4W6KBcfJqQnWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=agilent.com;dmarc=pass action=none
	header.from=agilent.com;dkim=pass header.d=agilent.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=IDLOlKE4fa5iaoj8Sp6N37Qak5DMeFv2nwLiMRLC1b8=;
	b=qwp+NZCFZHwEnC+QOj4Sb7+Pvh1msoUzFcvtqp2Mp1fr5ondq3ZzHyOahnj+nYtaWHiwuFe3vPmK66uLja2zAyM/4Mnx67IRFVyf1x7SpL58RAihAzb8eg4TeOidjmkItd3dnfiX46ahauX5TPQqHw1I9w0Ndi0Kmsc3Sbws3ls=
Received: from CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) by
	CY4PR12MB1480.namprd12.prod.outlook.com (10.172.71.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.16; Mon, 5 Aug 2019 16:39:00 +0000
Received: from CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::4154:e959:dc1e:4abc]) by
	CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::4154:e959:dc1e:4abc%9]) with mapi id 15.20.2136.018;
	Mon, 5 Aug 2019 16:39:00 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Loic Poulain <loic.poulain@linaro.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core]  Automatic prebuilt management
Thread-Index: AQHVS6eqNsTSJSzas0q1dY9NQfedCabsvndw
Date: Mon, 5 Aug 2019 16:39:00 +0000
Message-ID: <CY4PR12MB1653873989F017FCB269F5DD8BDA0@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <CAMZdPi_2=mFZFgwzUVis4BE7P3C4boOZmVB6_eYeLCaT0wLJaA@mail.gmail.com>
In-Reply-To: <CAMZdPi_2=mFZFgwzUVis4BE7P3C4boOZmVB6_eYeLCaT0wLJaA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1325e6c0-7000-45dc-8782-08d719c36b68
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CY4PR12MB1480; 
x-ms-traffictypediagnostic: CY4PR12MB1480:
x-microsoft-antispam-prvs: <CY4PR12MB14801A447D5D9998A0CB0D898BDA0@CY4PR12MB1480.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(346002)(376002)(396003)(39860400002)(136003)(189003)(199004)(29502001)(14444005)(186003)(52536014)(76116006)(71200400001)(110136005)(102836004)(5660300002)(6506007)(76176011)(81156014)(74316002)(86362001)(9686003)(7696005)(53936002)(26005)(6436002)(66066001)(71190400001)(68736007)(8676002)(33656002)(6246003)(316002)(55016002)(478600001)(2906002)(476003)(11346002)(486006)(66946007)(64756008)(66556008)(446003)(256004)(66476007)(99286004)(7736002)(8936002)(6116002)(2501003)(3846002)(25786009)(14454004)(229853002)(305945005)(81166006)(66446008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1480;
	H:CY4PR12MB1653.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 32KVBPhLJZmxl36agijpHGHhJrS8+vkj+KomRlIJwAwvAeQ5iPUpbI0Yj3LKGNXskJbbz3vrR+Ct1rQV99RIyry2i23skv0GDUBKTqYE6YXf+/sNO7IswitTPMuMcW4OA3I7x84ozcWMdAvOg3oki/932ZBYXcsUQxhu/BpLMOz5Sh7RG2felq2/wC3Nh2KsWp7AjRfxm0Zu61PlqnmfKxelcGWAmAeJuZGXZv6qwJPRQ+MMg1R61bZQ9+vJ7U1aW2pq6wUmYYdG8m6se6IlrDnlgFV9On3bWV8I9SjtxptJ/hMlFl8xMgbU1irgkKlGr1Pf0TqSixehz2XNHyT6dcxQ1zJx/tABvmY64iXXYVzbS9VUtqHPPrmV6ljq36ZwecnRM42ub5mo3fitlMkR4Tt8mUyrLiRiXSJ+TjAQ8xk=
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1325e6c0-7000-45dc-8782-08d719c36b68
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 16:39:00.6294 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: chris.laplante@agilent.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1480
Subject: Re: Automatic prebuilt management
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
X-List-Received-Date: Mon, 05 Aug 2019 16:39:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBCdXQgSSB3b3VsZCBsaWtlIHNvbWV0aGluZyBzbWFydGVyLCBlLmcuIGZpcnN0IHRyeWluZyB0
byBjaGVjayBpZiB0aGUgU1JDX1VSSSBpcyBhdmFpbGFibGUsIGlmIG5vdCBzd2l0Y2hpbmcgb24g
dXNpbmcgdGhlIHByZWJ1aWx0IHBhY2thZ2UgaWYgYXZhaWxhYmxlIChlLmcuDQo+IGluIGEgRElS
X1BSRUJVSUxUKS4uLg0KPiANCj4gQmVmb3JlIGdvaW5nIGZ1cnRoZXIgaXMgdGhlcmUgYWxyZWFk
eSBhbiBleGlzdGluZyBzb2x1dGlvbiBmb3IgdGhhdD8gZG8geW91IGhhdmUgYW55IHJlY29tbWVu
ZGF0aW9uIG9uIHRoZSBlYXNpZXIvYmVzdCB3YXkgdG8NCj4gYWNoaWV2ZSB0aGlzPw0KDQpJIGRv
bid0IGhhdmUgYSAiYmVzdCBwcmFjdGljZSIgcmVjb21tZW5kYXRpb24gdG8gb2ZmZXIuIEJ1dCBj
b2luY2lkZW50YWxseSBJIHN1Z2dlc3RlZCBzb21ldGhpbmcgc2ltaWxhciBmb3IgdXBzdHJlYW1p
bmcgYSBmZXcgd2Vla3MgYWdvLiBJdCB3YXMgKHJpZ2h0ZnVsbHkpIHJlamVjdGVkIGFzIHRvbyAi
aGFja3kiIGZvciBpbmNsdXNpb24gaW4gY29yZSBjb2RlLiBSZWdhcmRsZXNzLCBoZXJlJ3MgYSBi
YmNsYXNzIHdlIGN1cnJlbnRseSB1c2U6DQoNCmFkZGhhbmRsZXIgc2tpcF9ldmVudGhhbmRsZXIN
CnB5dGhvbiBza2lwX2V2ZW50aGFuZGxlcigpIHsNCiAgICB0cnk6DQogICAgICAgIGJiLmZldGNo
Mi5GZXRjaChkLmdldFZhcigiU1JDX1VSSSIpLnNwbGl0KCksIGQpDQogICAgZXhjZXB0IGJiLmZl
dGNoMi5GZXRjaEVycm9yOg0KICAgICAgICByYWlzZSBiYi5wYXJzZS5Ta2lwUmVjaXBlKCJza2lw
LWluYWNjZXNzaWJsZTogY291bGQgbm90IGFjY2VzcyB1cHN0cmVhbSByZXBvOyBjaGVjayBTUkNf
VVJJLCBhY2Nlc3MgcmlnaHRzLCBhbmQgbmV0d29yayBhdmFpbGFiaWxpdHkiKQ0KfQ0Kc2tpcF9l
dmVudGhhbmRsZXJbZXZlbnRtYXNrXSA9ICJiYi5ldmVudC5SZWNpcGVQcmVGaW5hbGlzZSINCg0K
DQpBcyB3YXMgcG9pbnRlZCBvdXQgdG8gbWUsIHRoaXMgaXMgYSBwcmV0dHkgaGVhdnktaGFuZGVk
IGFwcHJvYWNoIC0gaXQgY2FuIGZhaWwgZm9yIGFueSBudW1iZXIgb2YgcmVhc29ucywgbm90IGp1
c3QgdGhlIFVSSSBhY3R1YWxseSBiZWluZyB1bmF2YWlsYWJsZS4gU28geW91IG1heSBjb25zaWRl
ciBhIG1vcmUgc3VyZ2ljYWwgY2hlY2ssIGUuZy4gYWN0dWFsbHkgdHJ5aW5nIHRvIGZldGNoIHRo
ZSBTUkNfVVJJIGRpcmVjdGx5IHVzaW5nIHJhdyBHRVQgcmVxdWVzdHMuDQoNClRvIGltcGxlbWVu
dCB0aGUgaGFuZG92ZXIsIHlvdSdkIGhhdmUgc2VwYXJhdGUgcmVjaXBlcyBmb3IgdGhlIGJ1aWxk
LWZyb20tc291cmNlIGFuZCB0aGUgcHJlYnVpbHQgY2FzZSB3aGljaCBQUk9WSURFIHRoZSBzYW1l
IHBhY2thZ2UuIFlvdSBwcm9iYWJseSBhbHNvIHdhbnQgdG8gc2V0IFBSRUZFUlJFRF9QUk9WSURF
UiBpbiB5b3VyIGxheWVyIGNvbmYgdG8gcHJlZmVyIHRoZSBidWlsZC1mcm9tLXNvdXJjZSByZWNp
cGUuIA0KDQpBbHRlcm5hdGl2ZWx5LCB5b3UgY2FuIGRvIGl0IGFsbCBpbiBhIHNpbmdsZSByZWNp
cGUgYnkgcmV3cml0aW5nIHRoZSBTUkNfVVJJIGZyb20gd2l0aGluIHRoZSBldmVudCBoYW5kbGVy
LiBCdXQgSSB0aGluayBzZXBhcmF0ZSByZWNpcGVzIGlzIG5pY2VyLg0KDQpDaHJpcw0K

