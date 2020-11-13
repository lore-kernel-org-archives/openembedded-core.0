Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web11.5992.1605281677638459976
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 07:34:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: wFRLgQ7sNdcY0jLkbXj3Wr0oJ2fX3F2k/iY12PdJLoFCHCJST9Z199ew86lj5hW6q0f2lWtIaw
 mMtERvZ7yA6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="167909395"
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; 
   d="scan'208";a="167909395"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2020 07:34:36 -0800
IronPort-SDR: SZyzYxG9SUREUBQqu3Nya5yUJMVSNxkXHUfRoNdwY1K1M4xc+zLElmqeAlu1BNIZQHrmes39BF
 350EK15qPOTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; 
   d="scan'208";a="542690562"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by orsmga005.jf.intel.com with ESMTP; 13 Nov 2020 07:34:35 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 13 Nov 2020 23:34:34 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Fri, 13 Nov 2020 23:34:34 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "steve@sakoman.com"
	<steve@sakoman.com>
Subject: Re: [OE-core][dunfell 16/18] openssh: upgrade 8.3p1 -> 8.4p1 to fix CVE-2020-14145 and CVE-2020-15778
Thread-Topic: [OE-core][dunfell 16/18] openssh: upgrade 8.3p1 -> 8.4p1 to fix
 CVE-2020-14145 and CVE-2020-15778
Thread-Index: AQHWucy6IP7dP+8sjEy8OluyjqPma6nFq0EA
Date: Fri, 13 Nov 2020 15:34:33 +0000
Message-ID: <d69129bae24c3b73ec40105d2a7e16d90f85ace7.camel@intel.com>
References: <cover.1605278902.git.steve@sakoman.com>
	 <324a890cf711efc732e3a27325f81a27c92173d8.1605278902.git.steve@sakoman.com>
In-Reply-To: <324a890cf711efc732e3a27325f81a27c92173d8.1605278902.git.steve@sakoman.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <005C00141BBF264BAFCEDC91DD39B248@intel.com>
Content-Transfer-Encoding: base64

SGkgU3RldmUsDQoNCk9uIEZyaSwgMjAyMC0xMS0xMyBhdCAwNDo1MiAtMTAwMCwgU3RldmUgU2Fr
b21hbiB3cm90ZToNCj4gRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+DQo+IA0KPiBDVkUtMjAyMC0xNDE0NQ0KPiANCj4gVGhlIGNsaWVudCBzaWRlIGluIE9w
ZW5TU0ggNS43IHRocm91Z2ggOC4zIGhhcyBhbiBPYnNlcnZhYmxlDQo+IERpc2NyZXBhbmN5IGxl
YWRpbmcgdG8gYW4gaW5mb3JtYXRpb24gbGVhayBpbiB0aGUgYWxnb3JpdGhtDQo+IG5lZ290aWF0
aW9uLiBUaGlzIGFsbG93cyBtYW4taW4tdGhlLW1pZGRsZSBhdHRhY2tlcnMgdG8gdGFyZ2V0DQo+
IGluaXRpYWwgY29ubmVjdGlvbiBhdHRlbXB0cyAod2hlcmUgbm8gaG9zdCBrZXkgZm9yIHRoZSBz
ZXJ2ZXINCj4gaGFzIGJlZW4gY2FjaGVkIGJ5IHRoZSBjbGllbnQpLg0KDQpJIGFtIG5vdCBzdXJl
IGlmIHRoaXMgQ1ZFIHNob3VsZCBiZSBjb25zaWRlcmVkIGZpeGVkLiBQbGVhc2Ugc2VlDQpTZWN0
aW9uIDMuMToNCg0KaHR0cHM6Ly93d3cuZnppLmRlL2ZpbGVhZG1pbi91c2VyX3VwbG9hZC8yMDIw
LTA2LTI2LUZTQS0yMDIwLTIucGRmDQoNCkFsc28sIHRoaXMgaXNuJ3QgYSBidWcgZml4IHJlbGVh
c2UgYW5kIGhhcyBwb3RlbnRpYWxseSBpbmNvbXBhdGlibGUNCmNoYW5nZXMgdGhhdCBtYXkgYWZm
ZWN0IGV4aXN0aW5nIGNvbmZpZ3VyYXRpb25zIGFzIHBlciB0aGUgcmVsZWFzZQ0Kbm90ZXM6DQoN
Cmh0dHBzOi8vd3d3Lm9wZW5zc2guY29tL3R4dC9yZWxlYXNlLTguNA0KDQpUaGFua3MsDQoNCkFu
dWoNCg0K
