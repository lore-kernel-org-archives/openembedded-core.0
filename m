Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 22BAB78267
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 16:59:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jan 2018 08:59:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,501,1508828400"; d="scan'208";a="23957134"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
	by orsmga002.jf.intel.com with ESMTP; 03 Jan 2018 08:59:10 -0800
Received: from orsmsx163.amr.corp.intel.com (10.22.240.88) by
	ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Wed, 3 Jan 2018 08:59:10 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.15]) by
	ORSMSX163.amr.corp.intel.com ([169.254.9.51]) with mapi id
	14.03.0319.002; Wed, 3 Jan 2018 08:59:10 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/1] rpm_4.14.0: clamp timestamps by default
Thread-Index: AQHThB/BxdJqQeJhbkKjdvsYagJqOKNiXNqA///+ktA=
Date: Wed, 3 Jan 2018 16:59:09 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6404A265A@ORSMSX112.amr.corp.intel.com>
References: <1514934973-80578-1-git-send-email-juro.bystricky@intel.com>
	<1514934973-80578-2-git-send-email-juro.bystricky@intel.com>
	<fc0ebed5-abd0-9926-3c57-6443d7f22241@linux.intel.com>
In-Reply-To: <fc0ebed5-abd0-9926-3c57-6443d7f22241@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTg2N2ZlMmMtNDE2Ny00YmIwLWFkYTQtNzljNDIyYjE5YTcxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiIwMG5HTm82WDcwWFBwOUFDNFg0VHk4UytxVGhoSTg0dmF6NVE4eHY0aldidm04MnI3NTJCdkRDbzQ4a0cxbkpMIn0=
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>
Subject: Re: [PATCH 1/1] rpm_4.14.0: clamp timestamps by default
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
X-List-Received-Date: Wed, 03 Jan 2018 16:59:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHRoZSBuZWNlc3NpdHkgb2YgdGhpcy4gV2hhdCBt
YXR0ZXJzIGZvcg0KPiByZXByb2R1Y2liaWxpdHkgaXMgdGhhdCBycG1zIGluc3RhbGwgdGhlIHNh
bWUgZmlsZXM7IHdoeSBpcyBpdCBpbXBvcnRhbnQNCj4gdGhhdCB0aGUgcnBtIGZpbGUgaXRzZWxm
IGhhcyBleGFjdGx5IHNhbWUgYnVpbGQgdGltZSBhbmQgaXMgb3RoZXJ3aXNlDQo+IGlkZW50aWNh
bCBiaXQgYnkgYml0Pw0KPiANCg0KVGhlcmUgaXMgYWN0dWFsbHkgYSBkZW1hbmQgZm9yIGJpbmFy
eSByZXByb2R1Y2libGUgcGFja2FnZXMuDQpTZWUgZm9yIGV4YW1wbGUgaHR0cHM6Ly93aWtpLmRl
Ymlhbi5vcmcvUmVwcm9kdWNpYmxlQnVpbGRzL0Fib3V0DQpEZWJpYW4gcGFja2FnZXMgYWxyZWFk
eSBjbGFtcCB0aW1lc3RhbXBzIGJ5IGRlZmF1bHQuIEkgYW0gbm90IGV2ZW4gc3VyZSB5b3UgY2Fu
IGRpc2FibGUgdGhpcyANCihzaG9ydCBvZiB1bnNldHRpbmcgU09VUkNFX0NPREVfRVBPQ0gpLiBU
aGUgc2FtZSBmdW5jdGlvbmFsaXR5IGV4aXN0cyBmb3IgUlBNIHBhY2thZ2VzLA0KZXhjZXB0IGl0
IGlzIG5vdCB0aGUgZGVmYXVsdCBiZWhhdmlvci4NCg0KPiBBIHRlY2huaWNhbGl0eTogZG8gbm90
IHBhdGNoIG1uYWNyb3MuaW4sIHNldCB0aGUgbWFjcm8gZGlyZWN0bHkgZnJvbQ0KPiBwYWNrYWdl
X3JwbS5iYmNsYXNzLg0KPg0KDQpZZXMsIEkgY29uc2lkZXJlZCB0aGlzIChzZWUgdGhlIFtwYXRj
aCAwLzFdKS4gSSBjaG9zZSB0byBwYXRjaCBtYWNyb3MuaW4gaW4gdGhlIA0KcmVjaXBlIHJwbV80
LjE0LjAgaW5zdGVhZCBiZWNhdXNlIHRoZSBuZXcgbWFjcm8gaXMgaW50cm9kdWNlZCBpbiBSUE0g
NC4xNC4wLiANCkkgYXNzdW1lZCB3ZSBkaWQgbm90IHdhbnQgdG8gaGF2ZSBSUE0gdmVyc2lvbiBk
ZXBlbmRlbmNpZXMgaW4gcGFja2FnZV9ycG0uYmJjbGFzcy4gDQpCdXQgSSBoYXZlIG5vIHN0cm9u
ZyBmZWVsaW5ncyByZWdhcmRpbmcgdGhpcywgSSBhbSBwcmV0dHkgc3VyZSB0aGUgbmV3IG1hY3Jv
IGlzIGhlcmUNCnRvIHN0YXkgaW4gdGhlIGZ1dHVyZSBhbmQgaXQgaXMgdW5saWtlbHkgYW55b25l
IHdvdWxkIHdhbnQgdG8gdXNlIGEgcHJlLTQuMTQuMCANCnZlcnNpb24gb2YgUlBNIGVpdGhlci4g
SWYgeW91IHRoaW5rIHBhdGNoaW5nIHBhY2thZ2VfcnBtLmJiY2xhc3MgbWFrZXMgbW9yZSBzZW5z
ZSwNCkkgY2FuIHNlbmQgaW4gYW5vdGhlciBwYXRjaC4NCiANCkp1cm8NCg==

