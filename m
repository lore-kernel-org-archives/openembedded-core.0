Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.4626.1607997774083284061
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 18:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: tHoVSPJQtG68vGfvPIU3wgHAuNQAqd9GNNm0XceRkIVviJRD518D3zEwj3XEFMGzgJiXGJi2+w
 yV4oEwo3WLlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="161865432"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="161865432"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 18:02:48 -0800
IronPort-SDR: Hn4onG0FJw5KQmFZD/J7a1PxcJjKWOWi+GiupP8/R42kSy92UdX5N+2kdQDTgV0nqFQ8Na7x8K
 zxGFB6BU0xvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="351675468"
Received: from kmsmsx602.gar.corp.intel.com ([172.21.219.142])
  by orsmga002.jf.intel.com with ESMTP; 14 Dec 2020 18:02:47 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx602.gar.corp.intel.com (172.21.219.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 15 Dec 2020 10:02:46 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Tue, 15 Dec 2020 10:02:46 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "ross@burtonini.com" <ross@burtonini.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd-boot: allow building for Arm targets
Thread-Topic: [OE-core] [PATCH] systemd-boot: allow building for Arm targets
Thread-Index: AQHWzxIZsNhwpiIHFUuQE1HAnKN7Wqn1fjuAgACjngCAABMdAIAAs4wA
Date: Tue, 15 Dec 2020 02:02:46 +0000
Message-ID: <42fadff1502d88c67287e08f1a04e845c36296c5.camel@intel.com>
References: <20201210163242.3329917-1-ross.burton@arm.com>
	 <732073f5112c4d4ff8d2e6d72832bb53823e81f4.camel@intel.com>
	 <CAAnfSTtMRjAJx4d7KHP4eMa5YO3=uCf0_RpjToDT8bUPLcwGQQ@mail.gmail.com>
	 <CAAnfSTtRg5EfEZqHWpFb+Bqzx61Pa7h8Kxd5ND61avW34JxiiQ@mail.gmail.com>
In-Reply-To: <CAAnfSTtRg5EfEZqHWpFb+Bqzx61Pa7h8Kxd5ND61avW34JxiiQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <29880897BE189F499252661D57431DDF@intel.com>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIwLTEyLTE0IGF0IDE1OjIwICswMDAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4g
T24gTW9uLCAxNCBEZWMgMjAyMCBhdCAxNDoxMSwgUm9zcyBCdXJ0b24gPHJvc3NAYnVydG9uaW5p
LmNvbT4gd3JvdGU6DQo+ID4gQ2FuIHdlIGp1c3QgbW92ZSB0aGUgY29udGVudHMgb2YgdGhhdCBh
cHBlbmQgaW50byBjb3JlPw0KPiANCj4gRldJVywgZ290IGEgcGF0Y2ggZG9pbmcganVzdCB0aGF0
IGxvY2FsbHkuDQo+IA0KDQpUaGFua3MgYSBsb3QsIFJvc3MuDQoNClRoYW5rcywNCg0KQW51ag0K
