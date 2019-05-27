Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0C4DE7CBE7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 22:28:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 May 2019 15:28:39 -0700
X-ExtLoop1: 1
Received: from pgsmsx114.gar.corp.intel.com ([10.108.55.203])
	by orsmga003.jf.intel.com with ESMTP; 27 May 2019 15:28:37 -0700
Received: from pgsmsx110.gar.corp.intel.com (10.221.44.111) by
	pgsmsx114.gar.corp.intel.com (10.108.55.203) with Microsoft SMTP Server
	(TLS) id 14.3.408.0; Tue, 28 May 2019 06:28:36 +0800
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.53]) by
	PGSMSX110.gar.corp.intel.com ([169.254.13.11]) with mapi id
	14.03.0415.000; Tue, 28 May 2019 06:28:36 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "crg7475@mailbox.org"
	<crg7475@mailbox.org>
Thread-Topic: [OE-core] [PATCH 08/11] gstreamer1.0-vaapi: upgrade to version
	1.16.0
Thread-Index: AQHVFNuGXY/d7jUaZEO4E0wCVSEZ0g==
Date: Mon, 27 May 2019 22:28:36 +0000
Message-ID: <bf1e68db18dc3517178df3810324c09c3954adf8.camel@intel.com>
References: <20190526110642.5341-1-crg7475@mailbox.org>
	<20190526110642.5341-8-crg7475@mailbox.org>
In-Reply-To: <20190526110642.5341-8-crg7475@mailbox.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.65.10]
MIME-Version: 1.0
Subject: Re: [PATCH 08/11] gstreamer1.0-vaapi: upgrade to version 1.16.0
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
X-List-Received-Date: Mon, 27 May 2019 22:28:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <0583AB7890FA93418D5277B3234ABDDC@intel.com>
Content-Transfer-Encoding: base64

TG9va3MgbGlrZSB0aGlzIG5lZWRzIGEgZGVwZW5kZW5jeSBvbiB3YXlsYW5kLXNjYW5uZXIgYW5k
IHdheWxhbmQtDQpwcm90b2NvbHMgYXMgd2VsbCBmb3IgdGhpcyB2ZXJzaW9uPw0KDQpFcnJvciBs
b2cgZnJvbSBhdXRvYnVpbGRlcjoNCg0KaHR0cHM6Ly9lcnJvcnMueW9jdG9wcm9qZWN0Lm9yZy9F
cnJvcnMvRGV0YWlscy8yNDcxNDMvDQoNClRoYW5rcw0KQW51ag0KDQpPbiBTdW4sIDIwMTktMDUt
MjYgYXQgMTM6MDYgKzAyMDAsIENhcmxvcyBSYWZhZWwgR2lhbmkgd3JvdGU6DQo+IFNpZ25lZC1v
ZmYtYnk6IFBoaWxpcHBlIE5vcm1hbmQgPHBoaWxuQGlnYWxpYS5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IENhcmxvcyBSYWZhZWwgR2lhbmkgPGNyZzc0NzVAbWFpbGJveC5vcmc+DQo+IC0tLQ0KPiAg
Li4uLzAwMDEtdmFhcHNpbmstZG93bmdyYWRlLXRvLW1hcmdpbmFsLnBhdGNoICAgICAgICAgICAg
ICAgICB8IDQNCj4gKystLQ0KPiAgLi4ucmVhbWVyMS4wLXZhYXBpXzEuMTQuNC5iYiA9PiBnc3Ry
ZWFtZXIxLjAtdmFhcGlfMS4xNi4wLmJifSB8IDQNCj4gKystLQ0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ICByZW5hbWUgbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtDQo+IHZhYXBpXzEuMTQuNC5iYiA9
PiBnc3RyZWFtZXIxLjAtdmFhcGlfMS4xNi4wLmJifSAoOTMlKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtDQo+IHZhYXBp
LzAwMDEtdmFhcHNpbmstZG93bmdyYWRlLXRvLW1hcmdpbmFsLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LQ0KPiBtdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGkvMDAwMS12YWFwc2lu
ay1kb3duZ3JhZGUtdG8tDQo+IG1hcmdpbmFsLnBhdGNoDQo+IGluZGV4IGM4NjFmM2JlZDIuLjc5
NDVhOTIzYzkgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtdmFhcGkvMDAwMS0NCj4gdmFhcHNpbmstZG93bmdyYWRlLXRvLW1hcmdp
bmFsLnBhdGNoDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtdmFhcGkvMDAwMS0NCj4gdmFhcHNpbmstZG93bmdyYWRlLXRvLW1hcmdpbmFsLnBh
dGNoDQo+IEBAIC0yNCw3ICsyNCw3IEBAIGRpZmYgLS1naXQgYS9nc3QvdmFhcGkvZ3N0dmFhcGku
Yw0KPiBiL2dzdC92YWFwaS9nc3R2YWFwaS5jDQo+ICBpbmRleCA5YTgyNDU0Li40ZDk0ZjJiIDEw
MDY0NA0KPiAgLS0tIGEvZ3N0L3ZhYXBpL2dzdHZhYXBpLmMNCj4gICsrKyBiL2dzdC92YWFwaS9n
c3R2YWFwaS5jDQo+IC1AQCAtMjEwLDcgKzIxMCw2IEBAIHBsdWdpbl9pbml0IChHc3RQbHVnaW4g
KiBwbHVnaW4pDQo+ICtAQCAtMTk1LDcgKzE5NSw2IEBAIHBsdWdpbl9pbml0IChHc3RQbHVnaW4g
KiBwbHVnaW4pDQo+ICAgew0KPiAgICAgR3N0VmFhcGlEaXNwbGF5ICpkaXNwbGF5Ow0KPiAgICAg
R0FycmF5ICpkZWNvZGVyczsNCj4gQEAgLTMyLDcgKzMyLDcgQEAgaW5kZXggOWE4MjQ1NC4uNGQ5
NGYyYiAxMDA2NDQNCj4gICANCj4gICAgIHBsdWdpbl9hZGRfZGVwZW5kZW5jaWVzIChwbHVnaW4p
Ow0KPiAgIA0KPiAtQEAgLTIzNSwxMCArMjM0LDcgQEAgcGx1Z2luX2luaXQgKEdzdFBsdWdpbiAq
IHBsdWdpbikNCj4gK0BAIC0yMjAsMTAgKzIxOSw3IEBAIHBsdWdpbl9pbml0IChHc3RQbHVnaW4g
KiBwbHVnaW4pDQo+ICAgICBnc3RfZWxlbWVudF9yZWdpc3RlciAocGx1Z2luLCAidmFhcGlkZWNv
ZGViaW4iLA0KPiAgICAgICAgIEdTVF9SQU5LX1BSSU1BUlkgKyAyLCBHU1RfVFlQRV9WQUFQSV9E
RUNPREVfQklOKTsNCj4gICANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtDQo+IHZhYXBpXzEuMTQuNC5iYiBiL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtDQo+IHZhYXBpXzEuMTYuMC5iYg0K
PiBzaW1pbGFyaXR5IGluZGV4IDkzJQ0KPiByZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLQ0KPiB2YWFwaV8xLjE0LjQuYmINCj4gcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtDQo+IHZh
YXBpXzEuMTYuMC5iYg0KPiBpbmRleCAzODk2NDM0MTA0Li40ZDczODJhMTAxIDEwMDY0NA0KPiAt
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXZhYXBp
XzEuMTQuNC5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXZhYXBpXzEuMTYuMC5iYg0KPiBAQCAtMTMsOCArMTMsOCBAQCBTUkNfVVJJID0g
Ig0KPiBodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjLyR7UkVBTFBOfS8ke1JF
QUxQTn0tJHtQVn0udGFyLngNCj4gICAgICAgICAgICAgZmlsZTovLzAwMDEtdmFhcHNpbmstZG93
bmdyYWRlLXRvLW1hcmdpbmFsLnBhdGNoIFwNCj4gICAgICAgICAgICAgIg0KPiAgDQo+IC1TUkNf
VVJJW21kNXN1bV0gPSAiMmZhZTM0NDJmNWYyM2U3MzU0YTBjNTkyYmM3YjkwNjUiDQo+IC1TUkNf
VVJJW3NoYTI1NnN1bV0gPQ0KPiAiY2UxOGRiZmU5NjFjNmE4ZDMxMjcwMjMxNjg2MDc1NTg2YmY3
YTdkZjYyYjc3OGM4ZTdmNWVjMTQ4MjUxZDBhMyINCj4gK1NSQ19VUklbbWQ1c3VtXSA9ICI4YzNm
OWVlM2U0N2NiZGI3NWE5NGY3MTgzNDYwYjcyMSINCj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9DQo+
ICI0ZTdmY2U2MjZlZTA1OTBkY2E3NGI1YTgzNDFkMjViYWM3NjMwNzk0NTEzMWE5NzBiNDE0ZmM1
ODk1ZjUxNzFmIg0KPiAgDQo+ICBTID0gIiR7V09SS0RJUn0vJHtSRUFMUE59LSR7UFZ9Ig0KPiAg
REVQRU5EUyA9ICJsaWJ2YSBnc3RyZWFtZXIxLjAgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZQ0K
PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQiDQo+IC0tIA0KPiAyLjE3LjENCj4gDQoNCg==

