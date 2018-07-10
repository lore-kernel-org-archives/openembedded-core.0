Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 290416093A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 23:56:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6ANuBQS025988
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Jul 2018 16:56:11 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.237]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0399.000;
	Tue, 10 Jul 2018 16:56:10 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] tiff: security fix CVE-2018-10963
Thread-Index: AQHUGKJCLQVgnSgozkq/XER0y1RXuqSJlP+A//+LTBA=
Date: Tue, 10 Jul 2018 23:56:09 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84F3508181@ALA-MBD.corp.ad.wrs.com>
References: <20180710230346.156994-1-joe.slater@windriver.com>
	<5ae15c76-ddaf-fbe5-4fac-1149af924b41@gmail.com>
In-Reply-To: <5ae15c76-ddaf-fbe5-4fac-1149af924b41@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.157.215]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] tiff: security fix CVE-2018-10963
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
X-List-Received-Date: Tue, 10 Jul 2018 23:56:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCBpdCBpcyBub3QgY2xlYXIuICBXaGF0IGl0IG1lYW5zIGlzIHRoYXQgdGhlIHBhdGNoIHdh
cyBhcHBsaWVkIHRvIDQuMC44IGNvZGUsIGJ1dCBub3QsIEkgdGhpbmssIDQuMC44IGNvZGUgYXMg
c2VlbiBvbiBvcGVuZW1iZWRkZWQtY29yZSBiZWZvcmUgNC4wLjggd2FzIG9ic29sZXRlLiAgSXQg
c3RpbGwgYXBwbGllcyBmb3IgNC4wLjkuDQoNCkpvZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogYWt1c3RlcjgwOCBbbWFpbHRvOmFrdXN0ZXI4MDhAZ21haWwuY29tXSANClNl
bnQ6IFR1ZXNkYXksIEp1bHkgMTAsIDIwMTggNDo0OCBQTQ0KVG86IFNsYXRlciwgSm9zZXBoOyBv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09F
LWNvcmVdIFtvZS1jb3JlXVtQQVRDSCAxLzFdIHRpZmY6IHNlY3VyaXR5IGZpeCBDVkUtMjAxOC0x
MDk2Mw0KDQoNCg0KT24gMDcvMTAvMjAxOCAwNDowMyBQTSwgSm9lIFNsYXRlciB3cm90ZToNCj4g
RGVuaWFsIG9mIHNlcnZpY2UgZGVzY3JpYmVkIGF0IGh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4v
ZGV0YWlsL0NWRS0yMDE4LTEwOTYzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKb2UgU2xhdGVyIDxq
b2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+DQo+IC0tLQ0KPiAgLi4uL2xpYnRpZmYvZmlsZXMvQ1ZF
LTIwMTgtMTA5NjMucGF0Y2ggICAgICAgICAgICAgfCA0MSArKysrKysrKysrKysrKysrKysrKysr
DQo+ICBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJ0aWZmL3RpZmZfNC4wLjkuYmIgICAgICB8
ICAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnRpZmYvZmlsZXMvQ1ZFLTIwMTgt
MTA5NjMucGF0Y2gNCj4NCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xp
YnRpZmYvZmlsZXMvQ1ZFLTIwMTgtMTA5NjMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9saWJ0aWZmL2ZpbGVzL0NWRS0yMDE4LTEwOTYzLnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+IGluZGV4IDAwMDAwMDAuLjEzYTFlYjUNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJ0aWZmL2ZpbGVzL0NWRS0yMDE4LTEwOTYzLnBhdGNo
DQo+IEBAIC0wLDAgKzEsNDEgQEANCj4gK0Zyb20gZGUxNDRmZDIyOGU0YmU4YWE0ODRjM2NhZjNk
ODE0YjZmYTg4YzZkOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4gK0Zyb206IEV2ZW4gUm91
YXVsdCA8ZXZlbi5yb3VhdWx0QHNwYXRpYWx5cy5jb20+DQo+ICtEYXRlOiBTYXQsIDEyIE1heSAy
MDE4IDE0OjI0OjE1ICswMjAwDQo+ICtTdWJqZWN0OiBbUEFUQ0hdIFRJRkZXcml0ZURpcmVjdG9y
eVNlYzogYXZvaWQgYXNzZXJ0aW9uLiBGaXhlcw0KPiArIGh0dHA6Ly9idWd6aWxsYS5tYXB0b29s
cy5vcmcvc2hvd19idWcuY2dpP2lkPTI3OTUuDQo+ICsgQ1ZFLTIwMTgtMTA5NjMNCj4gKw0KPiAr
LS0tDQo+ICtDVkU6IENWRS0yMDE4LTEwOTYzDQo+ICsNCj4gK1NhbWUgcGF0Y2ggYXMgYXBwbGll
ZCB0byA0LjAuOC4NCkkgZG9uJ3Qga25vdyB3aGF0IHRoYXQgbWVhbnMuIFRoZSBmaXggaXMgaW4g
NC4wLjggb3IgdGhpcyBwYXRjaCBhcHBsaWVzDQpjbGVhbmx5IHRvIDQuMC44IG9yIGFmZmVjdHMg
PCA0LjAuOC4NCi0gYXJtaW4NCg0KPiArDQo+ICtVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtn
aXRsYWIuY29tL2xpYnRpZmYvbGlidGlmZi9jb21taXQvZGUxNDRmLi4uXQ0KPiArDQo+ICtTaWdu
ZWQtb2ZmLWJ5OiBKb2UgU2xhdGVyIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+DQo+ICsNCj4g
Ky0tLQ0KPiArIGxpYnRpZmYvdGlmX2RpcndyaXRlLmMgfCAgICA3ICsrKysrLS0NCj4gKyAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiArDQo+ICtkaWZm
IC0tZ2l0IGEvbGlidGlmZi90aWZfZGlyd3JpdGUuYyBiL2xpYnRpZmYvdGlmX2RpcndyaXRlLmMN
Cj4gK2luZGV4IDI0MzBkZTYuLmMxNWEyOGQgMTAwNjQ0DQo+ICstLS0gYS9saWJ0aWZmL3RpZl9k
aXJ3cml0ZS5jDQo+ICsrKysgYi9saWJ0aWZmL3RpZl9kaXJ3cml0ZS5jDQo+ICtAQCAtNjk1LDgg
KzY5NSwxMSBAQCBUSUZGV3JpdGVEaXJlY3RvcnlTZWMoVElGRiogdGlmLCBpbnQgaXNpbWFnZSwg
aW50IGltYWdlZG9uZSwgdWludDY0KiBwZGlyb2ZmKQ0KPiArIAkJCQkJCQkJfQ0KPiArIAkJCQkJ
CQkJYnJlYWs7DQo+ICsgCQkJCQkJCWRlZmF1bHQ6DQo+ICstCQkJCQkJCQlhc3NlcnQoMCk7ICAg
Lyogd2Ugc2hvdWxkIG5ldmVyIGdldCBoZXJlICovDQo+ICstCQkJCQkJCQlicmVhazsNCj4gKysJ
CQkJCQkJCVRJRkZFcnJvckV4dCh0aWYtPnRpZl9jbGllbnRkYXRhLG1vZHVsZSwNCj4gKysJCQkJ
CQkJCSAgICAgICAgICAgICJDYW5ub3Qgd3JpdGUgdGFnICVkICglcykiLA0KPiArKwkJCQkJCQkJ
ICAgICAgICAgICAgVElGRkZpZWxkVGFnKG8pLA0KPiArKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvLT5m
aWVsZF9uYW1lID8gby0+ZmllbGRfbmFtZSA6ICJ1bmtub3duIik7DQo+ICsrCQkJCQkJCQlnb3Rv
IGJhZDsNCj4gKyAJCQkJCQl9DQo+ICsgCQkJCQl9DQo+ICsgCQkJCX0NCj4gKy0tIA0KPiArMS43
LjkuNQ0KPiArDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJ0aWZm
L3RpZmZfNC4wLjkuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJ0aWZmL3RpZmZfNC4w
LjkuYmINCj4gaW5kZXggOGMzYmJhNS4uZThlMmExMSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvbGlidGlmZi90aWZmXzQuMC45LmJiDQo+ICsrKyBiL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2xpYnRpZmYvdGlmZl80LjAuOS5iYg0KPiBAQCAtOSw2ICs5LDcgQEAgU1JD
X1VSSSA9ICJodHRwOi8vZG93bmxvYWQub3NnZW8ub3JnL2xpYnRpZmYvdGlmZi0ke1BWfS50YXIu
Z3ogXA0KPiAgICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMTctOTkzNS5wYXRjaCBcDQo+ICAgICAg
ICAgICAgIGZpbGU6Ly9DVkUtMjAxNy0xODAxMy5wYXRjaCBcDQo+ICAgICAgICAgICAgIGZpbGU6
Ly9DVkUtMjAxOC01Nzg0LnBhdGNoIFwNCj4gKyAgICAgICAgICAgZmlsZTovL0NWRS0yMDE4LTEw
OTYzLnBhdGNoIFwNCj4gICAgICAgICAgICAiDQo+ICANCj4gIFNSQ19VUklbbWQ1c3VtXSA9ICI1
NGJhZDIxMTI3OWNjOTNlYjRmY2EzMWJhOWJmZGM3OSINCg0K

