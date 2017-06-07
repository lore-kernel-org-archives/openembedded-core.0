Return-Path: <michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 3347277DB8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 19:51:11 +0000 (UTC)
X-AuditID: 0a00029b-67dff70000003fa4-1c-5938592b9349
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	5D.32.16292.B2958395; Wed,  7 Jun 2017 14:51:10 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 7 Jun 2017 14:51:07 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Fun with npm shrinkwrap
Thread-Index: AQHS34O/sUYxsXQk+k2WZWQUfRGswKIZoSeA///NmgCAAJ7OgP//ulDw
Date: Wed, 7 Jun 2017 19:51:07 +0000
Message-ID: <655290B7709079438B7932553958E60DA13124FF@ESS-EX01.essvote.corp.local>
References: <15e918fb-c2e6-3005-6221-08601c804271@siemens.com>
	<a60f39a6-8355-82dc-20b2-5f7b3d6397b3@linux.intel.com>
	<af72aeb2-915e-0c63-60e9-18b6c7bce5ad@siemens.com>
	<615663ca-d13f-9bca-6e3d-e5dc22cfaebf@linux.intel.com>
	<3989e16e-7a69-5f0a-90e9-3fcd1ed8b14d@siemens.com>
	<655290B7709079438B7932553958E60DA1312205@ESS-EX01.essvote.corp.local>
	<6e9eccd2-6aee-7605-f934-39bc5dcca51a@siemens.com>
In-Reply-To: <6e9eccd2-6aee-7605-f934-39bc5dcca51a@siemens.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.77]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWyRiBPQ1cv0iLSoKnX2OL/421sFvdu3mS2
	uPPzHbvF1VniDiwe804GepzbuILRY/vJSUwBzFFcNimpOZllqUX6dglcGVcXNrAWzOKu2HBm
	MVsD4xeuLkZODgkBE4n/W74ydTFycQgJHGWUOHH4E5Qzk1HiwYGJjCBVbAJGEueub2IESYgI
	7GaU2PX3DBtIglnAUGLps4tACQ4OYQE9ifYF8SBhEQF9iTmrexghbDeJBy/ugNksAioS6xd9
	B2vlFQiS2DT5LwvEshnMEpduT2IBSXAK2EssXbsFrIFRQEzi+6k1TBC7xCVuPZnPBHG2gMSS
	PeeZIWxRiZeP/7FC2HIS75raWEHuYRbQlFi/Sx+iVVFiSvdDdoi9ghInZz5hmcAoOgvJ1FkI
	HbOQdMxC0rGAkWUVI1+ukV5qcXFZfkmqXnJ+7iZGYMxwMTDN3sHY0xR7iFGAg1GJh3eFgkWk
	EGtiWXFl7iFGaQ4WJXFesVCgkEB6YklqdmpqQWpRfFFpTmrxIUYmDk4QwSXVwDjr0ZHmlW0v
	bLll1XfrXZT1mji9JHnSjdPey643XbcXWu9e1J4f8nrdVqVUoQVTJrrErDuVZxdz9bmJ92b7
	m7Pu3f310jBW+evFguqgskPWh7Sci99wn87snHLwcN6tWmstFd4Ko8mTH53e6z73dYxw2p6I
	bx6uCn4hl9j0OSJtdmyZsLsp5asSS3FGoqEWc1FxIgC+SxjjfwIAAA==
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: Fun with npm shrinkwrap
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
X-List-Received-Date: Wed, 07 Jun 2017 19:51:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBJbiBmYWN0LCBtZXRhLW5vZGVqcyBpcyBhbHJlYWR5IGluIHVzZSBoZXJlLCBhbmQgSSd2ZSBi
ZWVuIHRvbGQgdG8gZ2l2ZQ0KPiAiaW5oZXJpdCBucG0tYmFzZSIgYSB0cnkuIElzIHRoYXQgd2hh
dCB5b3UgbWVhbj8NCg0KWWVzIGluaGVyaXQgbnBtLWJhc2Ugc2hvdWxkIGdpdmUgeW91IHdoYXQg
eW91IG5lZWQuIFdpdGggdGhlIGJlZm9yZSBtZW50aW9uZWQgbGltaXRhdGlvbnMuDQoNCj4gSG93
ICJ1bnJlcHJvZHVjaWJsZSIgd2lsbCBidWlsZHMgYmVjb21lPyBUaGUgbGljZW5zZSBjaGVja3Mg
YXJlIG5vdCB0aGF0DQo+IGNyaXRpY2FsIGFzIEkgd291bGRuJ3QgdHJ1c3QgdGhlbSByaWdodCBu
b3cgYW55d2F5LiBPZmZsaW5lIGJ1aWxkcw0KPiBjb3JyZWxhdGUgd2l0aCByZXByb2R1Y2libGls
dHkgLSB3ZSBuZWVkIHRvIGFyY2hpdmUgdGhlIGFydGlmYWN0cyBhbmQNCj4gZ2VuZXJhdGUgaW1h
Z2VzIHdpdGggY2hhbmdlcyBsYXRlciBvbiwgaW5kZXBlbmRlbnQgb2Ygd2hhdCBoYXBwZW5lZA0K
PiBvdXRzaWRlIG1lYW53aGlsZS4gTm90IGEga2lsbGVyIHJpZ2h0IG5vdywgYnV0IG5vdCBhbiBv
cHRpb24gb24gdGhlIGxvbmcNCj4gcnVuLg0KDQpNb3N0bHkgaXQganVzdCBtZWFucyB5b3UgbWF5
IGdldCBzbGlnaHRseSBkaWZmZXJlbnQgdmVyc2lvbnMgb2YgZGVwZW5kZW5jaWVzIG92ZXIgdGlt
ZS4NCkRlcGVuZGluZyBtb3N0bHkgb24gaG93IGxvY2tlZCBkb3duIHlvdXIgcGFja2FnZS5qc29u
IGFuZCB0aG9zZSBvZiB5b3VyIGRlcHMgYXJlLg0KaHR0cHM6Ly9kb2NzLm5wbWpzLmNvbS9taXNj
L3NlbXZlcg0KDQoNCj4gUFM6IFRvcC1wb3N0aW5nIGlzIGNvbnNpZGVyZWQgZXZpbC4NClRoZSBz
YWQgc2hhbWUgb2YgaGF2aW5nIHRvIHVzZSBPdXRsb29rLiAgTm8gSU1BUCAvIFBPUCBhbmQgZGF2
bWFpbCBoYXRlcyBtZS4NCkJvdHRvbS1wb3N0aW5nIGlzIGR5aW5nIGEgc2xvdyBkZWF0aCB0aGVz
ZSBkYXlzLiAgT25seSBzZWUgaXQgaW4gTGludXggbWFpbGluZyBsaXN0cyBmb3IgdGhlIG1vc3Qg
cGFydC4NCg0KLS0NCk1pa2UNCg0K

