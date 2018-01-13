Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6ADEF71B9E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jan 2018 14:09:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jan 2018 06:09:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,353,1511856000"; d="scan'208";a="19049111"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jan 2018 06:09:31 -0800
Received: from fmsmsx102.amr.corp.intel.com (10.18.124.200) by
	fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Sat, 13 Jan 2018 06:09:31 -0800
Received: from fmsmsx157.amr.corp.intel.com ([169.254.14.149]) by
	FMSMSX102.amr.corp.intel.com ([169.254.10.49]) with mapi id
	14.03.0319.002; Sat, 13 Jan 2018 06:09:30 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] libc6: improve reproducibility
Thread-Index: AQHTi+ju1fTBCNhxMkagqz46xhmtlKNyG/iA//+7kYA=
Date: Sat, 13 Jan 2018 14:09:30 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6404EA9FC@FMSMSX157.amr.corp.intel.com>
References: <1515791062-54281-1-git-send-email-juro.bystricky@intel.com>
	<1515838273.29722.133.camel@linuxfoundation.org>
In-Reply-To: <1515838273.29722.133.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjIxZjg1Y2UtYmUyZC00ZWJiLTlkMDMtYjU0NTY5YjdiMDJiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJyQXNCQ0lTalNmampwTW9BQ1NjK1MyZ1wvN04wWktydWtuWFV2dHBOVjFFbTNSZjk2XC9NVU0xcHhBTGNGQ1wvZjFFIn0=
x-originating-ip: [10.1.200.107]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>
Subject: Re: [PATCH] libc6: improve reproducibility
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
X-List-Received-Date: Sat, 13 Jan 2018 14:09:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+IEhpIEp1cm8sDQo+IA0KPiBDYW4geW91IHB1dCBhIGNvbW1lbnQgYWxvbmdzaWRlIHRoZSB0
b3VjaCBpbiB0aGUgcmVjaXBlIGFzIHdlJ3JlIG5vdA0KPiBnb2luZyB0byBrbm93IHdoeSB3ZSdy
ZSBkb2luZyB0aGlzIGluIGEgZmV3IHllYXJzIHRpbWUuLi4NCj4gDQoNClN1cmUsIG5vIHByb2Js
ZW0uIEkgd2lsbCBzZW5kIHYyLiBCVFcsIHRoaXMgd2FzIGZpeGVkIGluIHVwc3RyZWFtIGdsaWJj
LCBzbyB0aGUgInRvdWNoIiBsaW5lIGNhbiBiZSByZW1vdmVkIG9uY2Ugd2UgdXBncmFkZSBnbGli
Yy4gSSB3aWxsIHB1dCB0aGlzIGluIHRoZSBjb21tZW50IGFzIHdlbGwuIChXZSBzdGlsbCBkZXBl
bmQgb24gYmlzb24tbmF0aXZlKQ0KDQo=

