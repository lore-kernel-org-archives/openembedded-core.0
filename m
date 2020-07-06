Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.48164.1593994464677516049
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2020 17:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: QSw50ptA48YdSgpV4dhizvXJW0Lw+PaCXyCG4+BWGMDr3QzGAV6/sUNkS0OB2is3/QvAVVGFzr
 m0xhLvXhS+xw==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="165403297"
X-IronPort-AV: E=Sophos;i="5.75,317,1589266800"; 
   d="scan'208";a="165403297"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2020 17:14:24 -0700
IronPort-SDR: XJQL7445a0CuZYyoYLD8xPOBdQ5+nmeH8KgYRTGtaS/OJYLRUsANaeO+jDqefG1ztB/yYUBHOP
 Gp9ceM6BzIvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; 
   d="scan'208";a="282877996"
Received: from pgsmsx114.gar.corp.intel.com ([10.108.55.203])
  by orsmga006.jf.intel.com with ESMTP; 05 Jul 2020 17:14:23 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.140]) by
 pgsmsx114.gar.corp.intel.com ([169.254.4.230]) with mapi id 14.03.0439.000;
 Mon, 6 Jul 2020 08:14:22 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "bunk@stusta.de" <bunk@stusta.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [zeus][PATCH 08/10] kernel.bbclass: Fix Module.symvers support
Thread-Topic: [OE-core] [zeus][PATCH 08/10] kernel.bbclass: Fix
 Module.symvers support
Thread-Index: AQHWUkfyXx8q4IuNuEeBAWNOPLjVOKj5KhyA
Date: Mon, 6 Jul 2020 00:14:21 +0000
Message-ID: <ac1998377f6c78f868b5a34cf2d9b5f37973a7eb.camel@intel.com>
References: <cover.1593474787.git.anuj.mittal@intel.com>
	 <03248953d1eacede00971289dc9fff8d97d00464.1593474787.git.anuj.mittal@intel.com>
	 <20200704211322.GB24166@localhost>
In-Reply-To: <20200704211322.GB24166@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.71.35]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <013C7643883AFD41850F798602C0DD9D@intel.com>
Content-Transfer-Encoding: base64

SGkgQWRyaWFuLA0KDQpPbiBTdW4sIDIwMjAtMDctMDUgYXQgMDA6MTMgKzAzMDAsIEFkcmlhbiBC
dW5rIHdyb3RlOg0KPiBQbGVhc2UgZHJvcCB0aGlzIHBhdGNoOg0KPiBodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE0MDIzMw0KPiANCg0K
VGhhbmsgZm9yIHJldmlld2luZyB0aGUgc2VyaWVzLiBJIGJlbGlldmUgdGhpcyB3YXMgcmVzb2x2
ZWQgYnkNCg0KaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNv
cmUvbWVzc2FnZS8xNDAyMzcNCg0KPw0KDQpUaGFua3MsDQoNCkFudWoNCg==
