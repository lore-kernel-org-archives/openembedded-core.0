Return-Path: <adrian.freihofer@siemens.com>
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60065.outbound.protection.outlook.com [40.107.6.65])
	by mail.openembedded.org (Postfix) with ESMTP id A63F56114E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 22:56:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=mkGMLhTKIK45dvQ1kTjDhvrtzdDPK8pGc3kHnkmIysRkUw/r/4+kiBtEj7PStBBQg5Kx7CNwWWJs1eZyYSCKGjHaAZnjAvu1HC4DpBcfHeKe3/PMmRp7rmc0OMQ+qBJjedTgMXtRs5WWu70/u7nAIVcFMYCKWDUvowcIPMWG1QTXEw4gxOobdz+0cEiEq+RbqB/GenowG105UP5MTQf7tCliPbcE8xWM5bLxXTzMzmM/zAjiyNRl+ftzULAtRiz5TxXqLuwrIQa4BIvSWKouDKXVIBQJDnsHoFVlKoNNMV7VBP34BgvjD1r/L5F5bnJqHraH1aw2s3AQksg3bDg1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=tCCQW7vMfqeQOT+Ak2Romko5ZNyND+mvpLaD/1jkbP0=;
	b=JCN6+agg5FK+Qhr3ntxYmixP4WXdfULlafTbITssqOVOC31FBLyfWFPPd6BggJD+jRy8tafPTslP82rY+WHyU7o2FVM6tPr9Q1gRdMX7vJVfY/zjyAmIcZ80gRfSF9rRizMWTS9HUOgh0RdU55vss1Scfxe9AVnt1L66h1kRqho399rc1FLqaiqAMesw1gMQwueAA0J7dtn1p26W/Pon/j6WF6qaXCpQohSKytuFTezR41hdQG+HWJ7pWPcXVMF8JhxJ9UQTbTvNMcHNozv51JtCpkBdxsV15aBukUEmnRN15Yy36jOev2kcjs4z5qjN+m8qAsh1eU8lGwkpVez5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=siemens.com;
	dmarc=pass action=none header.from=siemens.com; 
	dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=tCCQW7vMfqeQOT+Ak2Romko5ZNyND+mvpLaD/1jkbP0=;
	b=gzIHhIIItKAFocTZDZHiQ7j3S7lsHTuWmwRSc4kXHVTRaQP0Oka3xFHCVaIX+ohqgH+p1Sexa63aE9Q5aqbqt5zYDjfnq7OatlwTDkVlSzTInkwx9QVncfJDT2jvKxGyamNvFwFM+8KimMFo9VjFyBMoUheDS84SaRv+dma9tAM=
Received: from PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM (20.180.104.80) by
	PR3PR10MB3964.EURPRD10.PROD.OUTLOOK.COM (20.180.104.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2772.15; Thu, 5 Mar 2020 22:56:15 +0000
Received: from PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d1d3:afd:da50:b311]) by PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d1d3:afd:da50:b311%5]) with mapi id 15.20.2772.019;
	Thu, 5 Mar 2020 22:56:15 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "pbarker@konsulko.com" <pbarker@konsulko.com>
Thread-Topic: [OE-core] [PATCH] bitbake: gitsm: download submodules
Thread-Index: AQHV8gumN7CJUxSTiUGgisBt2eFRjag4XS+AgAFjZ4CAAN3XgA==
Date: Thu, 5 Mar 2020 22:56:15 +0000
Message-ID: <1292952b0e1fd7de3b123a1fbef8366cd7a22b80.camel@siemens.com>
References: <84e64ccddc46261a59bb1e281ef3294e08119abc.camel@siemens.com>
	<20200304095944.792423a0@ub1910>
	<cdda8416d63d0a7cdec45eefc8d93b1f74f175ec.camel@siemens.com>
	<20200305094209.3704f549@ub1910>
In-Reply-To: <20200305094209.3704f549@ub1910>
Accept-Language: de-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=adrian.freihofer@siemens.com; 
x-originating-ip: [165.225.73.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 70511d96-05f4-4c54-e331-08d7c158689d
x-ms-traffictypediagnostic: PR3PR10MB3964:
x-microsoft-antispam-prvs: <PR3PR10MB396446C8A0AE772ED34E25778EE20@PR3PR10MB3964.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 03333C607F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(199004)(189003)(5660300002)(86362001)(498600001)(4326008)(81156014)(81166006)(8676002)(6916009)(55236004)(36756003)(6486002)(8936002)(2906002)(66574012)(6512007)(66446008)(66556008)(2616005)(91956017)(6506007)(66476007)(76116006)(26005)(66946007)(186003)(71200400001)(64756008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:PR3PR10MB3964;
	H:PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: siemens.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W/GIvHD4IF1XDovRRrCIh5I6wDS/HzhMgiardZLXYF8YWy/PtDYXEyDd5EbavXNXpOTpsL066NurH0J1CxWkucxXcGO+F3n0aOcNI5x1TbBzZndmxTITVSt6R2U26DqoaDz0Qqsu50XD4zQ3xX6CB6Zpv81vp54KhqzyaIsr0TgJIKUsUfH+w1knrmVQhuX5BNDm6LKAgOxbWqKr9ppu6QIeihkoqw0bOvqdCCxI8FZ3I7Kb2WBXNWLtklUthIC+ghROyi2nbITzZdYLoqEENkQsk3ZXarcbFJcSadoQ1/4/VTwlnCk4BTpUFNPp0tIdYEPa8YDLUu43L+2lWr0Z4xQ2K3hJcDFrNcrxf3NHUSuzRnoztwKA4I6IvTKBQN+wUbWjei/Tk4FWNLPZPmmp2R/WbaBsEK1r5OpXFlcaVeMio7W5ysE/0JtAJ4Hc0MO7
x-ms-exchange-antispam-messagedata: l4TbiDoKlJJm2Besw136jT1Ablx2r0NYEKjD15MJ4aDsuGsgd9jRDnVOlS607sg0XXBI2TZ/iR2g2L37rxosXFLsCl0wQxFkeJEnn8w+cSCdn1JeK9meaAQomgAJFwneCKJCdnM+RtLMI6RtqL9sEA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70511d96-05f4-4c54-e331-08d7c158689d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2020 22:56:15.1495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kfVJqpCxvpTxT+OKdcOFLG99/VQtPSEuMzD/jd+1RQhiCgCFA+m553e1QuE7w1AuNfButmGyopfaB+oM6PEw+ooIUPBR1GPZr+9dmyeWYFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3964
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake: gitsm: download submodules
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
X-List-Received-Date: Thu, 05 Mar 2020 22:56:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <29EBDF81B12EC84A98FBDEEA2C69E5D1@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTAzLTA1IGF0IDA5OjQyICswMDAwLCBQYXVsIEJhcmtlciB3cm90ZToNCj4g
T24gV2VkLCA0IE1hciAyMDIwIDEyOjMwOjEwICswMDAwDQo+ICJGcmVpaG9mZXIsIEFkcmlhbiIg
PGFkcmlhbi5mcmVpaG9mZXJAc2llbWVucy5jb20+IHdyb3RlOg0KPiANCj4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFBhdWwgQmFya2VyIDxwYmFya2VyQGtvbnN1bGtv
LmNvbT4NCj4gPiBUbzogIkZyZWlob2ZlciwgQWRyaWFuIiA8YWRyaWFuLmZyZWlob2ZlckBzaWVt
ZW5zLmNvbT4NCj4gPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyA8DQo+ID4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gPiBT
dWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gYml0YmFrZTogZ2l0c206IGRvd25sb2FkIHN1
Ym1vZHVsZXMNCj4gPiBEYXRlOiBXZWQsIDA0IE1hciAyMDIwIDA5OjU5OjQ0ICswMDAwDQo+ID4g
DQo+ID4gT24gV2VkLCA0IE1hciAyMDIwIDA4OjEyOjI3ICswMDAwDQo+ID4gIkZyZWlob2Zlciwg
QWRyaWFuIiA8YWRyaWFuLmZyZWlob2ZlckBzaWVtZW5zLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4g
PiBUaGUgdW5wYWNrIGZ1bmN0aW9uIGZhaWxlZCBiZWNhdXNlIHRoZSBzdWJtb2R1bGVzIHdlcmUg
bm90DQo+ID4gPiBkb3dubG9hZGVkLg0KPiA+ID4gQ2FsbGluZyBkb3dubG9hZCBiZWZvcmUgdW5w
YWNrIGZvciBlYWNoIHN1Ym1vZHVsZSBzb2x2ZXMgdGhpcw0KPiA+ID4gaXNzdWUuDQo+ID4gPiAN
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBGcmVpaG9mZXIgPGFkcmlhbi5mcmVpaG9mZXJA
c2llbWVucy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBiaXRiYWtlL2xpYi9iYi9mZXRjaDIvZ2l0
c20ucHkgfCAxICsNCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPiA+
IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2JpdGJha2UvbGliL2JiL2ZldGNoMi9naXRzbS5weQ0KPiA+
ID4gYi9iaXRiYWtlL2xpYi9iYi9mZXRjaDIvZ2l0c20ucHkNCj4gPiA+IGluZGV4IGM2MjI3NzFk
MjEuLjM3MTVlOTgyNGYgMTAwNjQ0DQo+ID4gPiAtLS0gYS9iaXRiYWtlL2xpYi9iYi9mZXRjaDIv
Z2l0c20ucHkNCj4gPiA+ICsrKyBiL2JpdGJha2UvbGliL2JiL2ZldGNoMi9naXRzbS5weQ0KPiA+
ID4gQEAgLTE4NCw2ICsxODQsNyBAQCBjbGFzcyBHaXRTTShHaXQpOg0KPiA+ID4gIA0KPiA+ID4g
ICAgICAgICAgICAgIHRyeToNCj4gPiA+ICAgICAgICAgICAgICAgICAgbmV3ZmV0Y2ggPSBGZXRj
aChbdXJsXSwgZCwgY2FjaGU9RmFsc2UpDQo+ID4gPiArICAgICAgICAgICAgICAgIG5ld2ZldGNo
LmRvd25sb2FkKCkNCj4gPiA+ICAgICAgICAgICAgICAgICAgbmV3ZmV0Y2gudW5wYWNrKHJvb3Q9
b3MucGF0aC5kaXJuYW1lKG9zLnBhdGguam9pDQo+ID4gPiBuKHJlDQo+ID4gPiBwbw0KPiA+ID4g
X2NvbmYsICdtb2R1bGVzJywgbW9kdWxlKSkpDQo+ID4gPiAgICAgICAgICAgICAgZXhjZXB0IEV4
Y2VwdGlvbiBhcyBlOg0KPiA+ID4gICAgICAgICAgICAgICAgICBsb2dnZXIuZXJyb3IoJ2dpdHNt
OiBzdWJtb2R1bGUgdW5wYWNrIGZhaWxlZDogJXMNCj4gPiA+ICVzJw0KPiA+ID4gJQ0KPiA+ID4g
KHR5cGUoZSkuX19uYW1lX18sIHN0cihlKSkpICANCj4gPiANCj4gPiBZb3Ugc2hvdWxkbid0IGJl
IHRyeWluZyB0byBkb3dubG9hZCBzdWJtb2R1bGVzIGluIHRoZSBkb191bnBhY2sNCj4gPiBzdGVw
Lg0KPiA+IElmDQo+ID4gdGhleSdyZSBtaXNzaW5nIGF0IHRoaXMgc3RhZ2UgaXQgcHJvYmFibHkg
aW5kaWNhdGVzIGEgZmV0Y2ggaXNzdWUuDQo+ID4gDQo+ID4gQmFzaWNhbGx5IHRydWUsIGJ1dCB0
aGUgaW5mb3JtYXRpb24gYWJvdXQgd2hpY2ggc3VibW9kdWxlcyBuZWVkIHRvDQo+ID4gYmUNCj4g
PiBkb3dubG9hZGVkIGlzIG5vdCBhdmFpbGFibGUgYmVmb3JlIHRoZSB0b3AgbGV2ZWwgcmVwbyBo
YXMgYmVlbg0KPiA+IHVucGFja2VkLiBJIGd1ZXNzIHRoZSBzb2x1dGlvbiBtdXN0IGJlIHNvbWV0
aGluZyBsaWtlOg0KPiA+IA0KPiA+IGZldGNoIHRvcC1sZXZlbA0KPiA+IHVucGFjayB0b3AtbGV2
ZWwNCj4gPiBmb3JlYWNoIHN1Ym1vZHVsZToNCj4gPiAgIGZldGNoIHN1Ym1vZHVsZQ0KPiA+ICAg
dW5wYWNrIHN1Ym1vZHVsZQ0KPiA+IA0KPiA+IFdoYXQncyB0aGUgZXhhY3QgZXJyb3IgdGhhdCB5
b3UncmUgc2VlaW5nPw0KPiA+IA0KPiA+IERvbid0IHJlbWViZXIgZXhhY3RseS4gQnV0IHdoZW4g
SSBkZWJ1Z2dlZCB0aGUgZmxvdywgaXQgYmVjYW1lDQo+ID4gb2J2aW91cywNCj4gPiB0aGF0IHRo
ZSBzdWJtb2R1bGVzIGFyZSBub3QgZG93bmxvYWRlZC4NCj4gPiANCj4gPiBUaGlzIGNvdWxkIGJl
IHJlbGF0ZWQgdG8gdGhlIGlzc3VlIEkgc2F3IHdoZW4gdGhlIGZldGNoZXIgdXNlcyBnaXQNCj4g
PiBzaGFsbG93DQo+ID4gdGFyYmFsbHMgZnJvbSBhIG1pcnJvciAtIGlmIHRoYXQncyB0aGUgY2Fz
ZSBJJ20gcGxhbm5pbmcgdG8gZ2V0DQo+ID4gdGhhdA0KPiA+IGZpeGVkDQo+ID4gdGhpcyB3ZWVr
ZW5kLg0KPiA+IA0KPiA+IFllcywgdGhlIHByb2JsZW0gb2NjdXJzIHdpdGggZ2l0IHNoYWxsb3dz
LiBUaGUgcGF0Y2ggc29sdmVzIGl0IHdpdGgNCj4gPiBhbmQNCj4gPiB3aXRob3V0IHNoYWxsb3dz
IGZvciB1cy4NCj4gPiANCj4gPiBBbHNvLCB5b3VyIGVtYWlsIGNsaWVudCBzZWVtcyB0byBoYXZl
IGNoZXdlZCB0aGUgcGF0Y2ggdXAuIEl0J3MNCj4gPiBiZXN0IHRvDQo+ID4gc2VuZA0KPiA+IHBh
dGNoZXMgdXNpbmcgYGdpdCBzZW5kLWVtYWlsYCBvbmx5Lg0KPiA+IA0KPiA+IFNvcnJ5LCB3ZSBz
d2l0Y2hlZCB0byBhIG5ldyBlLW1haWwgc29sdXRpb24uIEkgaGF2ZSB0byBhZGFwdCBteQ0KPiA+
IHNldHVwLg0KPiANCj4gVGhlIHByb2JsZW0gd2l0aCB5b3VyIHBhdGNoIGlzIHRoYXQgaXQgd291
bGQgcmVxdWlyZSBuZXR3b3JrIGFjY2Vzcw0KPiBkdXJpbmcNCj4gZG9fdW5wYWNrIHdoaWNoIHRo
ZW4gYnJlYWtzIG91ciBhYmlsaXR5IHRvIGRvIG9mZmxpbmUgYnVpbGRzLg0KRmV0Y2hpbmcgaW4g
dGhlIHVucGFjayB0YXNrIGlzIHByb2JhYmx5IHJlYWxseSB3cm9uZywgSSBhZ3JlZS4NCkhvd2V2
ZXIsIGl0IGFsc28gd29ya3Mgb24gb3VyIENJIGluZnJhc3RydWN0dXJlIHdoaWNoIHJ1bnMgd2l0
aG91dA0KSW50ZXJuZXQgY29ubmVjdGl2aXR5Lg0KPiANCj4gRG8geW91IG9ubHkgc2VlIHRoaXMg
aXNzdWUgd2hlbiBmZXRjaGluZyBmcm9tIGdpdCBzaGFsbG93IG1pcnJvcg0KPiB0YXJiYWxscz8N
Cg0KT24gb3VyIENJIHdoaWNoIHdvcmtzIHdpdGggZ2l0c2hhbGxvdyBhcmNoaXZlcywgZmV0Y2hp
bmcgZGlkIG5vdCB3b3JrDQphdCBhbGwuIE9uIG1hY2hpbmVzIHdpdGggSW50ZXJuZXQgYWNjZXNz
IHdlIGFsc28gaGFkIHByb2JsZW1zLCBidXQgSSBkaWQgbm90IGNvbXBsZXRlbHkgYW5hbHl6ZSB3
aGF0IGhhcHBlbmVkLiBUaGUgb3ZtZiBwYWNrYWdlIGZyb20gcG9reSB3YXMgY2F1c2luZyB0aGUg
dHJvdWJsZXMgaW4gb3VyIGNhc2UuDQoNCj4gSWYgc28sIHRoZSBtaXJyb3IgdGFyYmFsbHMgbmVl
ZCB0byBiZSBleHRyYWN0ZWQgZHVyaW5nIGRvX2ZldGNoIGJ1dA0KPiBub3QgcGxhY2VkIGluIHRo
ZSB1c3VhbCAnZ2l0MicgZGlyZWN0b3J5IChhcyBmdXR1cmUgZmV0Y2hlcyBjYW4ndA0KPiBjb3Bl
IHdpdGggc2hhbGxvdyBjbG9uZXMgaW4gdGhhdCBkaXJlY3RvcnkpLg0KDQpEbyB5b3UgYWxyZWFk
eSBoYXZlIGFuIGlkZWEgaG93IHRoaXMgY291bGQgYmUgaW1wbGVtZW50ZWQ/DQoNCj4gDQo+IEZp
eGluZyB0aGlzIGFsc28gaGFzIHNvbWUgaW1wYWN0IG9uIGFyY2hpdmVyLmJiY2xhc3MgYXMgdGhh
dCBhbHNvDQo+IG5lZWRzIHRvIGJlIGFibGUgdG8gd2FsayB0aGUgdHJlZSBvZiBzdWJtb2R1bGVz
IGNvcnJlY3RseS4NClllcy4NCj4gDQo=

