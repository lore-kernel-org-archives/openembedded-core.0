Return-Path: <zhenhua.luo@nxp.com>
X-Greylist: delayed 16273 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Jul 2016 08:39:47 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0071.outbound.protection.outlook.com [104.47.2.71])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE3D6013D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 08:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Fzy6viBd5si4mg6Uc+FTHd5IVgCTWZfLUnZNu6b/DRE=;
	b=qO1qZhHYsh1RyUJaAXh36qujjExIgGjHUvjQ2vbnmk43WG3BbiHtxqTtH7z188Xq6s3fAUVFepZzmjAqgoK9J3zrjGwmW5KwhNT0Hkgx3fb1nv3ZP1tms//1DnCtJlFERIDp2ecrUdi4oZSuk8g6uvv+nOvNhxESyUjxz6a4RFw=
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com (10.160.49.142) by
	AM3PR04MB0677.eurprd04.prod.outlook.com (10.160.3.156) with Microsoft
	SMTP Server (TLS) id 15.1.528.16; Wed, 6 Jul 2016 04:08:33 +0000
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::fccb:8806:e246:e925]) by
	DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::fccb:8806:e246:e925%18]) with mapi id 15.01.0539.013;
	Wed, 6 Jul 2016 04:08:32 +0000
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [oe-core][PATCH] tcl: fix INCLUDE_SPEC and LIB_SPEC
Thread-Index: AQHR1oVsqmkkzAgxYk+slMEiZoerOKAJ8ySAgADIQHA=
Date: Wed, 6 Jul 2016 04:08:32 +0000
Message-ID: <DB3PR04MB068453822CFC44651DA07C02EE3A0@DB3PR04MB0684.eurprd04.prod.outlook.com>
References: <1467699658-4985-1-git-send-email-zhenhua.luo@nxp.com>
	<CAMKF1soJ0_8FcopQ4ipqLv+Bgi9qFyvTOUKVshdxvcEphRi6sw@mail.gmail.com>
In-Reply-To: <CAMKF1soJ0_8FcopQ4ipqLv+Bgi9qFyvTOUKVshdxvcEphRi6sw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=zhenhua.luo@nxp.com; 
x-originating-ip: [199.59.226.141]
x-ms-office365-filtering-correlation-id: 2b272e8f-040b-48ac-f6cd-08d3a55331e1
x-microsoft-exchange-diagnostics: 1; AM3PR04MB0677;
	6:JfP1mAsELwSMyr3BohUAMAaeorvU57UkHsvmLSsKDs2YGNpyWI/yLzw3lk4s3hEvaDbqw7kgQYZ9EROsqTLXS8rt9SnEx8/bvgc09zNVHuzoOwSeUY3PEzjsWCSzMkOcWwOnLaKdtzCI+uiOTLzC7KN6Kh1vfy0d+TnfkFmFJhAgqTliy97582S8ntgUq9t9o5mEBF7INI60dETR8HXd4eKkBHox6Bm0R1c3tou87vIaIkKHglrxWQUPeY7wwULW2BhH64fJ+LTfdMtIsje0V0d1a6Oju7co/dZERfotzJd3nE9U7LSkKphPtY0xqrtp4IwMserKjlPsUEOiCkCzqQ==;
	5:vi9jyrw3QCBkDaoqYY0Ty9WQUhXZxyeP/tIoi/c/X8TqVu2W5+6N3S9Q3l7VKeAq05eo+FhO/3Y9/PNdCEjks4gr1w998XAw6q2XhM/C4A6qqVmEXDsLFeLWVTP6wCkBg9xKngFg6gkVp7o6zR9i5Q==;
	24:iA3u82O9GEKA4CouEhw3hBeJdIsbl0iNX2okPEjWNGRBEljO1V4a0HoywdyBQJN1a8whzWz6ubAf8gGG+Y657ZlbDwWADDX0Zk3RJoTwXEQ=;
	7:zTHCPNK0oMJIP7AIxspKJt1QM+AAcHvM2x1YpaH1uI8ndtOSLl51DZbZdR4EFXmqVuDGgV6rAZ11M+q+Pc/bzBioD4q6RxEBhTb6EMfutQzgwpbogrIWGbhHrPfii2kG9Ne2Mehxm+AoahlyoQBYmeiikhPjDOsd3Y6hFPoWc/EHz4pCvEKXf+EsA3X8WxDN3PKfjp1401y0+7UO5ARCkxWhNKfc2Cito0tn/vh5X88w3ecNmP6sK4thKHg1COBc
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR04MB0677;
x-microsoft-antispam-prvs: <AM3PR04MB06777A1CA5C9FAD92306BA90EE3A0@AM3PR04MB0677.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:AM3PR04MB0677; BCL:0; PCL:0; RULEID:; SRVR:AM3PR04MB0677; 
x-forefront-prvs: 0995196AA2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(199003)(13464003)(189002)(24454002)(377454003)(106356001)(87936001)(9686002)(68736007)(105586002)(106116001)(102836003)(6116002)(5250100002)(3846002)(15975445007)(1720100001)(110136002)(97736004)(81166006)(81156014)(8676002)(19580405001)(19580395003)(586003)(2950100001)(2900100001)(189998001)(4326007)(101416001)(76576001)(50986999)(76176999)(54356999)(5003600100003)(7736002)(7696003)(7846002)(92566002)(74316002)(66066001)(305945005)(5002640100001)(3660700001)(33656002)(86362001)(2906002)(8936002)(3280700002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR04MB0677;
	H:DB3PR04MB0684.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2016 04:08:32.4070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR04MB0677
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcl: fix INCLUDE_SPEC and LIB_SPEC
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
X-List-Received-Date: Wed, 06 Jul 2016 08:39:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiBbbWFpbHRvOnJh
ai5raGVtQGdtYWlsLmNvbV0NCj4gU2VudDogVHVlc2RheSwgSnVseSAwNSwgMjAxNiAxMToxNiBQ
TQ0KPiBUbzogWmhlbmh1YSBMdW8gPHpoZW5odWEubHVvQG54cC5jb20+DQo+IENjOiBQYXRjaGVz
IGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllciA8b3BlbmVtYmVkZGVkLQ0K
PiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0g
W29lLWNvcmVdW1BBVENIXSB0Y2w6IGZpeCBJTkNMVURFX1NQRUMgYW5kIExJQl9TUEVDDQo+IA0K
PiBPbiBNb24sIEp1bCA0LCAyMDE2IGF0IDExOjIwIFBNLCBaaGVuaHVhIEx1byA8emhlbmh1YS5s
dW9AbnhwLmNvbT4gd3JvdGU6DQo+ID4gVENMX0lOQ0xVREVfU1BFQyAtSSs8aW5jbHVkZWRpcj4g
YW5kIFRDTF9MSUJfU1BFQyAtTCske2xpYmRpcn0gYnJlYWsNCj4gPiB0aGUgY3Jvc3MtY29tcGls
ZSBvZiBwYWNrYWdlcyB3aGljaCByZXF1aXJlIHRjbCBoZWFkZXJzIGFuZCBsaWJyYXJpZXMuDQo+
ID4NCj4gPiBPbmUgZXhhbXBsZSBpcyB0aGF0IHBvc3RncmVzcWwgY29uZmlndXJlIGZhaWxlZCBh
dCB0aGUgZm9sbG93aW5nIGVycm9yOg0KPiA+IHwgY2hlY2tpbmcgZm9yIHRjbC5oLi4uIG5vDQo+
ID4gfCBjb25maWd1cmU6IGVycm9yOiBoZWFkZXIgZmlsZSA8dGNsLmg+IGlzIHJlcXVpcmVkIGZv
ciBUY2wNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFpoZW5odWEgTHVvIDx6aGVuaHVhLmx1b0Bu
eHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGsvdGNsXzgu
Ni41LmJiIHwgMiAtLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGsvdGNsXzguNi41LmJi
DQo+ID4gYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGsvdGNsXzguNi41LmJiDQo+ID4gaW5k
ZXggNDZmYzhhNy4uZDc1MjMyYiAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdGNsdGsvdGNsXzguNi41LmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Rj
bHRrL3RjbF84LjYuNS5iYg0KPiA+IEBAIC01Niw4ICs1Niw2IEBAIGRvX2luc3RhbGwoKSB7DQo+
ID4gICAgICAgICBsbiAtc2YgdGNsc2g4LjYgJHtEfSR7YmluZGlyfS90Y2xzaCR7VkVSfQ0KPiA+
ICAgICAgICAgc2VkIC1pICJzKy1MJHtCfSstTCR7U1RBR0lOR19MSUJESVJ9K2ciIHRjbENvbmZp
Zy5zaA0KPiA+ICAgICAgICAgc2VkIC1pICJzKyR7V09SS0RJUn0rJHtTVEFHSU5HX0lOQ0RJUn0r
ZyIgdGNsQ29uZmlnLnNoDQo+ID4gLSAgICAgICBzZWQgLWkgInMsLUwke2xpYmRpcn0sLUw9JHts
aWJkaXJ9LGciIHRjbENvbmZpZy5zaA0KPiA+IC0gICAgICAgc2VkIC1pICJzLC1JJHtpbmNsdWRl
ZGlyfSwtST0ke2luY2x1ZGVkaXJ9LGciIHRjbENvbmZpZy5zaA0KPiANCj4gZG9lcyB0aGlzIG5v
dyBpbmNsdWRlIHNvbWUgb2YgeW91ciBob3N0IGhlYWRlcnMgaW4gYnVpbGQgdGhlbiA/DQpbTHVv
IFpoZW5odWEtQjE5NTM3XSBUaGUgcGF0Y2ggZG9lcyB0aGUgZm9sbG93aW5nIGNoYW5nZXMgZm9y
IHRjbENvbmZpZy5zaC4gV2l0aG91dCB0aGUgY2hhbmdlLCB0Y2wuaCBjYW4ndCBiZSBmb3VuZCB3
aGVuIGNyb3NzIGJ1aWxkaW5nIHBhY2thZ2VzKGUuZy4gcG9zdGdyZXNxbCkgd2hpY2ggZGVwZW5k
IG9uIHRjbC4gSSBoYXZlIGNyb3NzLWNvbXBpbGVkIHNldmVyYWwgcGFja2FnZXMocG9zdGdyZXNx
bCwgZXhwZWN0LCBydWJ5LCB0aykgdGhhdCBoYXZlIHRjbCBkZXBlbmRlbmN5IGFuZCBzZWUgbm8g
aXNzdWUuICANCgkxLiB0bXAvc3lzcm9vdHMvcWVtdWFybTY0L3Vzci9iaW4vY3Jvc3NzY3JpcHRz
L3RjbENvbmZpZy5zaA0KCSMgU3RyaW5nIHRvIHBhc3MgdG8gbGlua2VyIHRvIHBpY2sgdXAgdGhl
IFRjbCBsaWJyYXJ5IGZyb20gaXRzDQoJICMgaW5zdGFsbGVkIGRpcmVjdG9yeS4NCgktVENMX0xJ
Ql9TUEVDPSctTD0vaG9tZS9ianNpbWljcy93b3Jrc3BhY2UvcG9reS1vcy9xZW11cHBjL3RtcC9z
eXNyb290cy9xZW11YXJtNjQvdXNyL2xpYiAtbHRjbDguNicNCgkrVENMX0xJQl9TUEVDPSctTC9o
b21lL2Jqc2ltaWNzL3dvcmtzcGFjZS9wb2t5LW9zL3FlbXVwcGMvdG1wL3N5c3Jvb3RzL3FlbXVh
cm02NC91c3IvbGliIC1sdGNsOC42Jw0KIA0KCSAjIFN0cmluZyB0byBwYXNzIHRvIHRoZSBjb21w
aWxlciBzbyB0aGF0IGFuIGV4dGVuc2lvbiBjYW4NCgkgIyBmaW5kIGluc3RhbGxlZCBUY2wgaGVh
ZGVycy4NCgktVENMX0lOQ0xVREVfU1BFQz0nLUk9L2hvbWUvYmpzaW1pY3Mvd29ya3NwYWNlL3Bv
a3ktb3MvcWVtdXBwYy90bXAvc3lzcm9vdHMvcWVtdWFybTY0L3Vzci9pbmNsdWRlL3RjbDguNicN
CgkrVENMX0lOQ0xVREVfU1BFQz0nLUkvaG9tZS9ianNpbWljcy93b3Jrc3BhY2UvcG9reS1vcy9x
ZW11cHBjL3RtcC9zeXNyb290cy9xZW11YXJtNjQvdXNyL2luY2x1ZGUvdGNsOC42Jw0KIA0KCSMg
U3RyaW5nIHRvIHBhc3MgdG8gbGlua2VyIHRvIHBpY2sgdXAgdGhlIFRjbCBzdHViIGxpYnJhcnkg
ZnJvbSBpdHMNCgkgIyBpbnN0YWxsZWQgZGlyZWN0b3J5Lg0KCS1UQ0xfU1RVQl9MSUJfU1BFQz0n
LUw9L2hvbWUvYmpzaW1pY3Mvd29ya3NwYWNlL3Bva3ktb3MvcWVtdXBwYy90bXAvc3lzcm9vdHMv
cWVtdWFybTY0L3Vzci9saWIgLWx0Y2xzdHViOC42Jw0KCStUQ0xfU1RVQl9MSUJfU1BFQz0nLUwv
aG9tZS9ianNpbWljcy93b3Jrc3BhY2UvcG9reS1vcy9xZW11cHBjL3RtcC9zeXNyb290cy9xZW11
YXJtNjQvdXNyL2xpYiAtbHRjbHN0dWI4LjYnDQogDQoJMi4gdG1wL3N5c3Jvb3RzL3FlbXVhcm02
NC91c3IvbGliL3RjbENvbmZpZy5zaA0KCSMgU3RyaW5nIHRvIHBhc3MgdG8gbGlua2VyIHRvIHBp
Y2sgdXAgdGhlIFRjbCBsaWJyYXJ5IGZyb20gaXRzDQoJICMgaW5zdGFsbGVkIGRpcmVjdG9yeS4N
CgktVENMX0xJQl9TUEVDPSctTD0vdXNyL2xpYiAtbHRjbDguNicNCgkrVENMX0xJQl9TUEVDPSct
TC91c3IvbGliIC1sdGNsOC42Jw0KIA0KCSAjIFN0cmluZyB0byBwYXNzIHRvIHRoZSBjb21waWxl
ciBzbyB0aGF0IGFuIGV4dGVuc2lvbiBjYW4NCgkgIyBmaW5kIGluc3RhbGxlZCBUY2wgaGVhZGVy
cy4NCgktVENMX0lOQ0xVREVfU1BFQz0nLUk9L3Vzci9pbmNsdWRlL3RjbDguNicNCgkrVENMX0lO
Q0xVREVfU1BFQz0nLUkvdXNyL2luY2x1ZGUvdGNsOC42Jw0KIA0KCSMgU3RyaW5nIHRvIHBhc3Mg
dG8gbGlua2VyIHRvIHBpY2sgdXAgdGhlIFRjbCBzdHViIGxpYnJhcnkgZnJvbSBpdHMNCgkgIyBp
bnN0YWxsZWQgZGlyZWN0b3J5Lg0KCS1UQ0xfU1RVQl9MSUJfU1BFQz0nLUw9L3Vzci9saWIgLWx0
Y2xzdHViOC42Jw0KCStUQ0xfU1RVQl9MSUJfU1BFQz0nLUwvdXNyL2xpYiAtbHRjbHN0dWI4LjYn
DQoNCg0KQmVzdCBSZWdhcmRzLCANCg0KWmhlbmh1YQ0KDQo+ID4gICAgICAgICBpbnN0YWxsIC1k
ICR7RH0ke2JpbmRpcl9jcm9zc3NjcmlwdHN9DQo+ID4gICAgICAgICBpbnN0YWxsIC1tIDA3NTUg
dGNsQ29uZmlnLnNoICR7RH0ke2JpbmRpcl9jcm9zc3NjcmlwdHN9DQo+ID4gICAgICAgICBpbnN0
YWxsIC1tIDA3NTUgdGNsQ29uZmlnLnNoICR7RH0ke2xpYmRpcn0NCj4gPiAtLQ0KPiA+IDIuNy40
DQo+ID4NCj4gPiAtLQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+ID4gT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+ID4gT3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCg==

