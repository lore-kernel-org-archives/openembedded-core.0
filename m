Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.3935.1624517510680924547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 23:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: HI6Nx3cmWsW4ZNiFpl9bDyhaDQjF5E2xvtScHD43+iIIkzGqfe0t+5uVGePYJoA88xd0oWZd6O
 jVOK2pl25/fA==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="194548493"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="194548493"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2021 23:51:48 -0700
IronPort-SDR: QID35KGJAMS/fdjaKhyCGnoew7YjMdM/Z1Yw8C8ls8KQOhM2WBC2S3NyyWJ/omsWQjqHklHv2g
 d7jf59XGVmrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="454942543"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jun 2021 23:51:44 -0700
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 24 Jun 2021 14:51:44 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2242.008;
 Thu, 24 Jun 2021 14:51:44 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"sander.visser.2@consultant.volvo.com" <sander.visser.2@consultant.volvo.com>
Subject: Re: [OE-core] Curl CVE-2021-22876 backport in hardknott
Thread-Topic: [OE-core] Curl CVE-2021-22876 backport in hardknott
Thread-Index: AddowXoZJo54LY/gRJuZdOeZFV4Z////gbeA
Date: Thu, 24 Jun 2021 06:51:43 +0000
Message-ID: <be1586b7e4492069aed01964790f8d419fc5aaa4.camel@intel.com>
References: <AM9PR05MB8794557053459960C7945AC4C5079@AM9PR05MB8794.eurprd05.prod.outlook.com>
In-Reply-To: <AM9PR05MB8794557053459960C7945AC4C5079@AM9PR05MB8794.eurprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E3730887CC5DD4ABAC760B3606A5079@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIxLTA2LTI0IGF0IDA2OjIzICswMDAwLCBTYW5kZXIgVmlzc2VyIHdyb3RlOg0K
PiBIaQ0KPiDCoA0KPiAwMDAyLXRyYW5zZmVyLXN0cmlwLWNyZWRlbnRpYWxzLWZyb20tdGhlLWF1
dG8tcmVmZXJlci1oZWEucGF0Y2ggZG9lcw0KPiBub3QgYWxsb3cgYnVpbGRpbmcgb2YgQ3VybCB3
aXRob3V0IFBBQ0tBR0VDT05GSUcg4oCccHJveHnigJ0NCj4gwqANCg0KSSB0aGluayB3ZSBuZWVk
IHRoaXMgdG9vOg0KDQpodHRwczovL2dpdGh1Yi5jb20vY3VybC9jdXJsL2NvbW1pdC8yYzI2ZWVl
ZjEyZjAyMDRmYjg1ZDZiZjQwYjRlN2ExZTJkZGNkZjI0LnBhdGNoDQoNCkkgd2lsbCBzZW5kIGEg
cGF0Y2ggYW5kIGluY2x1ZGUgdGhpcyBpbiBteSBuZXh0IHF1ZXVlLg0KDQpUaGFua3MsDQoNCkFu
dWoNCg==
