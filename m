Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0133.outbound.protection.outlook.com [157.56.111.133])
	by mail.openembedded.org (Postfix) with ESMTP id 8814C76248
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 09:22:45 +0000 (UTC)
Received: from BN3PR0301MB1169.namprd03.prod.outlook.com (10.160.156.143) by
	BN3PR0301MB1316.namprd03.prod.outlook.com (10.161.210.28) with
	Microsoft SMTP
	Server (TLS) id 15.1.231.11; Wed, 29 Jul 2015 09:22:43 +0000
Received: from BN3PR0301MB1172.namprd03.prod.outlook.com (10.160.156.146) by
	BN3PR0301MB1169.namprd03.prod.outlook.com (10.160.156.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Wed, 29 Jul 2015 09:22:42 +0000
Received: from BN3PR0301MB1172.namprd03.prod.outlook.com ([10.160.156.146]) by
	BN3PR0301MB1172.namprd03.prod.outlook.com ([10.160.156.146]) with
	mapi id 15.01.0225.018; Wed, 29 Jul 2015 09:22:42 +0000
From: Zhu Carol <B54851@freescale.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Thread-Topic: [OE-core] [poky][PATCH v2 4/6] gstreamer1.0-plugins-base: Add
	video-frame related patch
Thread-Index: AQHQyBwnGpjm06dKlUqHlVeUv8zv7p3viJuAgADKpBCAAGrhAIABcBUg
Date: Wed, 29 Jul 2015 09:22:42 +0000
Message-ID: <BN3PR0301MB1172D32B8B54AF37974C4345868C0@BN3PR0301MB1172.namprd03.prod.outlook.com>
References: <1437996407-29463-1-git-send-email-b54851@freescale.com>
	<1437996407-29463-5-git-send-email-b54851@freescale.com>
	<CAP9ODKqYBs8XdR2+xL5ixxPRqSt2tMK1PbLmkAcg_Srhx5suMw@mail.gmail.com>
	<DM2PR0301MB118383021F988F9AD22C44AB868D0@DM2PR0301MB1183.namprd03.prod.outlook.com>
	<CAP9ODKrv04uCiQjEBS_0MV5i39j8UccuOBoZ-Ti0XMx5wOqm7A@mail.gmail.com>
In-Reply-To: <CAP9ODKrv04uCiQjEBS_0MV5i39j8UccuOBoZ-Ti0XMx5wOqm7A@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ossystems.com.br; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [192.158.241.86]
x-microsoft-exchange-diagnostics: 1; BN3PR0301MB1169;
	5:Qj4ZisJNHT7OUG1oYPC9I0HSTyPe9VPo1IEFCThGSN/4wcPrM2TSiTqqcSeaiJjKN31YncC2avDeArN9FafNzVQC8Ofr6jIeZdhTgqCgsago3X/dL8nRBrWP42SDdlWs0fYoQGbSf3QXLYICs48bkQ==;
	24:GdhjSz84M15oqLI74KrjZrCQuy68P4vJwm/RmOMCvDxxbHNLWlNebYX8womyb1WGXIlNEPMg0BJHwLCkmDr8heGtLSfUAeb+gltgR66Nii8=;
	20:kDT5qZWkZIm3XpruXLNE0se5x1+NbBivCDx9ibTQGQ4alUORj4sCoWqAOGnr2LHF0Gbuac9CYC98unyl54YeZQ==
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0301MB1169;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0301MB1316; 
bn3pr0301mb1169: X-MS-Exchange-Organization-RulesExecuted
x-microsoft-antispam-prvs: <BN3PR0301MB11693843511B926B1801E78C868C0@BN3PR0301MB1169.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR0301MB1169; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0301MB1169; 
x-forefront-prvs: 0652EA5565
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(13464003)(377454003)(189998001)(110136002)(19580395003)(102836002)(5003600100002)(92566002)(106116001)(46102003)(77096005)(87936001)(5001960100002)(2900100001)(74316001)(15975445007)(2950100001)(2656002)(76576001)(66066001)(86362001)(5002640100001)(33656002)(54356999)(5001920100001)(62966003)(93886004)(40100003)(77156002)(230783001)(16601075003)(50986999)(19580405001)(76176999);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1169;
	H:BN3PR0301MB1172.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2015 09:22:42.4963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1169
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1316;
	2:Fh3Ev42IH6ckh3uVSZ6k4yENzZskgP6fmZI/V7DQbRI0uII263ke+G+r0PepZmWUWJzqcXJ+FUtJ8EanEQvh8Us9n4N/R27LdHdSjVvJIr4cvO6ATx0nR1bls350o5ExZ7GnieTFJfqcKSCrtbjv4xvrTJXYI2uU9yTT0ef+06k=;
	3:Thz8KiL5+djJsTUlJaqICYkuxxnIwqEXDpOkxsbQKT0AksU2htXtAxtd+RvxqJUn5DABRfoC2oO7N+J0vk/uPpNQgRJq5VbxxeRkgW2DZqKTV08+yIlG5s3a9kYCaOIVW45W1G4rR35tDnckn+y+0Q==;
	25:75VYdK9RM6G76BR54rJt5HKO9VttVShM4c/wbTaTjmZDHjPY9NUBXHXKDZ3rX+FnHRt2FNErbbH57LlO8Feeoi3EDv1do0WLcDxznKWy6NgeV9a1+++ZDgaUtpekcEtnvClqjBfRFTEnT7/DBL9dsWmFqGn1uvYCJxLp6T0zjt0/g2lllDwL+yl2kc2bdnjDv/ULV1OnwD+Va0OltkIxysGGqUVP7qGVRCbMqHfbfuIwP9KovPj1yaA8QDAn61RCQjzyQyEfbmmgeJbvVPFR0Q==
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1316;
	20:S7wnefJVumoymhJQescxhu0JNvUzrfn5qzpzqpnPPBpihHmWKdsOSKRPH8EO5uhHPAf656h/nUQ4MYvQSGsGkEQqB/wkJyLKccvYzRFmGRCiDkhWh853mLDgIM39rsiMWcNThLiKi9uv9g00yw9w9jN0YEPG8tVoAIr938wwO7HMDmlNWBfyNP4HjaWNDNydnl64EP03SLfFWbclj9Uhov+hHqUq7SsLW2zyxH4vKlvJ1Ne8wCNW/gum6xWtdhd4Ljoa9OoXtirxjQiKdt9JhhNTlaUGYVG2edOIdIRCE3DXWN8oIGQQm9g3WwkiDxE7UPrcLBmo6AhvM4L4bhD6ii+qNqWDZh8IqKJ/SFAs4VLV1Ilfbv87L/eFWF3QLNhFXtEaJTW1vTG3SlLZsOYyoKzW6DlI3C0icJ4nexYMQds8SKJvTU3TMC/GdEG0qHRhOf2dMJnSXeIa+fWibUx3WUaTy3Bp4HDcMQdkJKVcuJ3SLramOxuMRccztDYDbPN2;
	23:xnbMM+v7v9ghic3rtINIB3ADyV6AbXSWV2vdqYkodbQgLhOnuaQFF8FSpbQQbPmAFyuPDVC+cRsQqYtQSiUgmgTm2l5/3oVMg3q+j3gUsepXS48QSFEwd94pjpnpf5FvXWFhu7EqFqTOqh7FZjlX7d6oBYJCyAx181teOXOd9Z7t1o6yj0FPfV5h/zlaj7Ox
X-OriginatorOrg: freescale.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v2 4/6] gstreamer1.0-plugins-base: Add video-frame related patch
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
X-List-Received-Date: Wed, 29 Jul 2015 09:22:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgT3RhdmlvLA0KICAgVGhlIDEuNC4yIGZpeCBpcyB1Z2x5LCBzbyBbT0UtY29yZV0gW3Bva3ld
W1BBVENIIHYzIDUvNl0gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZTogQWRkIHZpZGVvZmlsdGVy
IHJlbGF0ZWQgcGF0Y2ggaXMgdXNlZCB0byByZXZlcnQgaXQuDQogICBBY3R1YWxseSB0aGVzZSBw
YXRjaGVzIGFyZSBhbGwgYmFjayBwb3J0IGZyb20gMS41LjEsIEkgd2lsbCBjaGFuZ2UgdGhlIFVw
c3RyZWFtLVN0YXR1cyBhbmQgbWVyZ2UgdGhlc2UgdHdvIHBhdGNoZXMgdG9nZXRoZXIuDQoNCkIu
Ui4NCkNhcm9sDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBPdGF2aW8gU2Fs
dmFkb3IgW21haWx0bzpvdGF2aW8uc2FsdmFkb3JAb3NzeXN0ZW1zLmNvbS5icl0gDQpTZW50OiBU
dWVzZGF5LCBKdWx5IDI4LCAyMDE1IDc6MTkgUE0NClRvOiBaaHUgWXVxaW5nLUI1NDg1MQ0KQ2M6
IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyDQpTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFtwb2t5XVtQQVRDSCB2MiA0LzZdIGdzdHJlYW1lcjEuMC1wbHVnaW5z
LWJhc2U6IEFkZCB2aWRlby1mcmFtZSByZWxhdGVkIHBhdGNoDQoNCk9uIFR1ZSwgSnVsIDI4LCAy
MDE1IGF0IDI6MjMgQU0sIFpodSBDYXJvbCA8QjU0ODUxQGZyZWVzY2FsZS5jb20+IHdyb3RlOg0K
PiBIaSBPdGF2aW8sDQo+ICAgIFJlYWxseSBzb3JyeSBmb3IgdGhlIFVwc3RyZWFtLVN0YXR1cyBm
b3JtYXQgZXJyb3IsIHdlIGp1c3Qga2VwdCB0aGUgc2FtZSB3aXRoIHNvbWUgcGF0Y2hlcyBvbiBm
aWRvIGJyYW5jaCwgbWF5YmUgdGhleSBhcmUgb2xkIHZlcnNpb24uIEFuZCBJIHN0aWxsIGhhdmUg
YSBsaXR0bGUgY29uZnVzaW9uIGFib3V0IHRoZSB0aGlyZCBjb21tZW50LiBNeSBxdWVzdGlvbiBh
cmUgYXMgZm9sbG93ZWQuDQoNCk5vIHByb2JsZW07IHRoYW5rcyBieSBiZWluZyByZXNwb25zaXZl
IHdpdGggdGhlIGZlZWRiYWNrLiBDb21tZW50cyBiZWxvdy4uLg0KDQouLi4NCj4+ICtVcHN0cmVh
bSBTdGF0dXM6IEFjY2VwdGVkDQo+PiAraHR0cHM6Ly9idWd6aWxsYS5nbm9tZS5vcmcvc2hvd19i
dWcuY2dpP2lkPTczNjExOA0KPg0KPiBUaGUgZmllbGQgaXM6DQo+DQo+IFVwc3RyZWFtLVN0YXR1
czogU3VibWl0dGVkIFtodHRwczovLy4uLl0NCj4NCj4gW1l1cWluZyBaaHUtYjU0ODUxXTogdGhl
IFVwc3RyZWFtLVN0YXR1cyBvZiB0aGlzIHBhdGNoIGlzICJBY2NlcHRlZCIsIEkgYW0gbm90IHZl
cnkgY2xlYXIgYWJvdXQgeW91ciBjb21tZW50cyAiU3VibWl0dGVkIiwgZG8geW91IG1lYW4gSSBz
aG91bGQgYWRkIHRoZSB3ZWIgc2l0ZSBpbiB0aGUgc2FtZSBsaW5lIHdpdGggVXBzdHJlYW0tU3Rh
dHVzPw0KPiBKdXN0IGxpa2UgdGhpczoNCj4gVXBzdHJlYW0tU3RhdHVzOiAgQWNjZXB0ZWQgDQo+
IFtodHRwczovL2J1Z3ppbGxhLmdub21lLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9NzM2MTE4XQ0KDQpB
Y2NlcHRlZCB3b3VsZCBiZSB3aGVuIHVwc3RyZWFtIHNheXMgaXQgd2lsbCBhcHBseSBpdCBmb3Ig
bmV4dCByZWxlYXNlIGJ1dCB5b3UgZG9uJ3Qga25vdyB3aGVuLg0KDQpMb29raW5nIGF0IHRoZSBi
dWcsIGl0IHNlZW1lZCBpdCB3YXMgbm90IGJlZW4gYXBwbGllZCB5ZXQgc28gaXQgd291bGQgYmUg
c3VibWl0dGVkLg0KDQo+IEkndmUgcmVhZCB0aGUgZ3VpZGUgbGluZSwgaGVyZSBpcyBteSB1bmRl
cnN0YW5kaW5nOg0KPiBVcHN0cmVhbS1TdGF0dXM6ICBQZW5kaW5nDQo+IFVwc3RyZWFtLVN0YXR1
czogIFN1Ym1pdHRlZCBbd2hlcmVdDQo+IFVwc3RyZWFtLVN0YXR1czogIEFjY2VwdGVkDQo+IFVw
c3RyZWFtLVN0YXR1czogIEJhY2twb3J0IFtmcm9tIHdoZXJlXQ0KPiBVcHN0cmVhbS1TdGF0dXM6
ICBEZW5pZWQNCj4gVXBzdHJlYW0tU3RhdHVzOiAgSW5hcHByb3ByaWF0ZSBbcmVhc29uXQ0KPg0K
PiBKdXN0IG9iZXkgdGhpcywgcmlnaHQ/DQoNClllcy4NCg0KPiBTbyB0aGF0IGlzDQo+IFVwc3Ry
ZWFtLVN0YXR1czogIEFjY2VwdGVkDQo+IFRoYXQncyBpdCA/DQoNClRvIGJlIGhvbmVzdCwgdGhp
cyBzcGVjaWZpYyBjYXNlIHNlZW1zIHRvIGhhdmUgYmVlbiBhZGRyZXNzZWQgaW4gMS40LjIgaW4g
YSBkaWZmZXJlbnQgd2F5Ow0KDQpodHRwOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZ3N0cmVhbWVy
L2dzdC1wbHVnaW5zLWJhc2UvY29tbWl0Lz9oPTEuNCZpZD1mNzExMjg4YzdjODZjMzNhZWQxOGY1
MmVkNmQ3Nzg3ZDE5Yjc3NDFkDQoNClNvIHRoaXMgY291bGQgYmUgZHJvcHBlZC4NCg0KLS0gDQpP
dGF2aW8gU2FsdmFkb3IgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE8uUy4gU3lzdGVtcw0K
aHR0cDovL3d3dy5vc3N5c3RlbXMuY29tLmJyICAgICAgICBodHRwOi8vY29kZS5vc3N5c3RlbXMu
Y29tLmJyDQpNb2JpbGU6ICs1NSAoNTMpIDk5ODEtNzg1NCAgICAgICAgICAgIE1vYmlsZTogKzEg
KDM0NykgOTAzLTk3NTANCg==

