Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 92AC578425
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 20:58:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 12:58:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,403,1511856000"; d="scan'208";a="24160403"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by fmsmga004.fm.intel.com with ESMTP; 23 Jan 2018 12:58:02 -0800
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
	ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Tue, 23 Jan 2018 12:48:44 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.34]) by
	ORSMSX156.amr.corp.intel.com ([169.254.8.156]) with mapi id
	14.03.0319.002; Tue, 23 Jan 2018 12:44:29 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH v2] libc6: improve reproducibility
Thread-Index: AQHTk9SzdEQ3ddroq0yF6y1bvBcPvaOCI2cA///Jv+A=
Date: Tue, 23 Jan 2018 20:44:28 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B64051B447@ORSMSX112.amr.corp.intel.com>
References: <1516661989-26346-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spfw=Z6UJRM6x5GD7bUs=yJdTe2YbDT3n4naBM-0_N6+w@mail.gmail.com>
In-Reply-To: <CAMKF1spfw=Z6UJRM6x5GD7bUs=yJdTe2YbDT3n4naBM-0_N6+w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTI2NTQyM2MtNzU1ZS00NWE5LTlhNzctMjI2ZDMxOTNiZTkxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiI4VUNzSXVcLzBldVY1UHkrbDhtbGYzVnBVdnpcL3kwU2RKc080U014akY1Z2FrQjFnSHI2anhUREk4VTdSejBaOE8ifQ==
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libc6: improve reproducibility
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
X-List-Received-Date: Tue, 23 Jan 2018 20:58:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+ID4NCj4gPiBwbHVyYWwuYzogcGx1cmFsLnkNCj4gPiAgICAgICAgICQoQklTT04pICQoQklT
T05GTEFHUykgJEAgJF4NCj4gPg0KPiA+IElmIHRoZSBhYm92ZSBydWxlIGRvZXMgbm90IGZpcmUs
IHdlIHVzZSBhICJmYWxsYmFjayIgcGx1cmFsLmMsIG90aGVyd2lzZQ0KPiA+IHdlIHVzZSBwbHVy
YWwuYyByZS1nZW5lcmF0ZWQgZnJvbSBwbHVyYWwueS4NCj4gPiBUaGUgZml4IGlzIHRvIGFsd2F5
cyByZXF1aXJlIGJpc29uIHRvIGJlIGluc3RhbGxlZCBhbmQgdW5jb25kaXRpb25hbGx5DQo+ID4g
cmUtZ2VuZXJhdGUgcGx1cmFsLmMuIChUaGlzIGlzIGFjaGlldmVkIGJ5IHRvdWNoaW5nIHBsdXJh
bC55KS4NCj4gPg0KPiA+IFtZT0NUTyAjMTIyOTFdDQo+IA0KPiAyLjI3IHdpbGwgYmUgdGhlcmUg
Zm9yIG5leHQgcmVsZWFzZS4gU28gSSB3b25kZXIgaWYgd2Ugc2hvdWxkIGp1c3Qgd2FpdC4NCg0K
QUZBSUsgMi4yNyB3aWxsIGFsd2F5cyBnZW5lcmF0ZSBwbHVyYWwuYyAocGx1cmFsLmMgd2lsbCBu
b3QgYmUgcGFydCBvZiB0aGUgZGlzdHJvIGF0IGFsbCkuIFNvICJ0b3VjaGluZyIgcGx1cmFsLnkg
aXMgbm90IG5lZWRlZC4gQnV0IHdlIHN0aWxsIG5lZWQgdG8gYWRkIGJpc29uLW5hdGl2ZSB0byBE
RVBFTkRTDQoNCkRFUEVORFMgKz0gImdwZXJmLW5hdGl2ZSBiaXNvbi1uYXRpdmUiDQoNCg0K

