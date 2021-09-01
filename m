Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.5091.1630484152378356832
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 01:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=UO9I9rZw;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="215544151"
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; 
   d="scan'208";a="215544151"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2021 01:15:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; 
   d="scan'208";a="532003804"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Sep 2021 01:15:46 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 1 Sep 2021 01:15:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 1 Sep 2021 01:15:46 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 1 Sep 2021 01:15:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRYsvpHTwbtSPYUUq1GoovukpkRwBq806MoyFIfiO18EbMFEomjFOfuaFV2fnn8pmb1YiYGp76+yQTh0zHYwBXv/5hDr9XwC26CsD+ELqH0tES/IJaSw0U7GNqx7tEN2HoRv7s5H3UPgxR2g/h31VHvfoH/SbDzezZoqN06OFL+V+FCbvvZ0kcWmph6X8nN4HlrajdgFlAH/YuDkT4UJkuxYkM7tfbptK1HxEKVE6vXxqAF+5bLP7kjKzmYqkLgPO4tR8RNuHpKQe+OjBC/1NdLITDliAPQmwqWtD6tuChpJEiTYOLswqj2iUsPak1cWxGnqO58g9X10mn/JtZhF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZoygvE1IatG8Sv00ybVyR+Cz+YOfKSYu53w3tczmDE=;
 b=d6jdGJ8l83nDzvRDn5fXmoKBrEEQEOCFYes3Lkmn7WsTNcvRbtcJvtotCj8uV3k0IiQG12tONkpeYGvD16o0VPUs+DRWF9DDIpThpxdGPM3gwZfPejxXyBVdEPdA6PcJ7RAmUzV9ez5KuNDMXV8TOLi56DNvhc/HyecnSe6aDSL4k7y3mOwTWfVRPIj8AsNzrJKaUOtZZLiM41YR176Cj/362ufPJWJ5kyOdbdvSK6UnG3uT38JFSkB2e+gW3izOOdLfn7U0hNAU0wPoq7p04WWfJQxwOaoaTXuRoO2BPH9DDP+mVaJs9ls+8/KC44aMW9mjnp6u/ERE47esL3fIUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZoygvE1IatG8Sv00ybVyR+Cz+YOfKSYu53w3tczmDE=;
 b=UO9I9rZwTY0900oC5aEOsOtlZAbSRjYPn8Ir6afOIclzu+pkATkyfZX68NSNw0PZa4PoFsU38tD6HMhCYtjvEoB+A5hSc9ZxY+1+jeLHwZBBX0UoYx5jTokphrJZg19WueKaH0C/U7hJHPSgSkX9ZkKmt7QGKB5pQV4QWCoD/WE=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB2806.namprd11.prod.outlook.com (2603:10b6:a02:c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 08:15:44 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be%3]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 08:15:44 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "paul@pbarker.dev"
	<paul@pbarker.dev>
Subject: Re: [Hardknott backport request] kernel-yocto: Simplify no git repo case in do_kernel_checkout
Thread-Topic: [Hardknott backport request] kernel-yocto: Simplify no git repo
 case in do_kernel_checkout
Thread-Index: AQHXnXm6N3yGKr/rPUq5vfWLotkw+auO2CqA
Date: Wed, 1 Sep 2021 08:15:43 +0000
Message-ID: <73875876b13f03ce8abb178777f2612d9a7b420f.camel@intel.com>
References: <20210830093322.70e82a43.paul@pbarker.dev>
In-Reply-To: <20210830093322.70e82a43.paul@pbarker.dev>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 869c263b-bc04-4f23-7481-08d96d20b1f2
x-ms-traffictypediagnostic: BYAPR11MB2806:
x-microsoft-antispam-prvs: <BYAPR11MB28061D7C521D4B7DF023510BF8CD9@BYAPR11MB2806.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hHr56bbx+Ka6hPB9Tr6zB5ivWuQmLzJMACpwnCPT2SKsFDLurI5PHe68ayoOYnlhAFRh/cmxe93/14nV9VkPdbTDlSj4wK4JcrdF9agYEzCxwxcCo9OUopSFCDXhgJA2+b88nzbXGLUQQ+REbUA+F2GmfZ6r6Qg5oNFIMNy0ZZ1xnPzbjLqhjg9BlPx01YT7n8LTgiE3zd5ATrnf6E3e+mC8+si7jCPtbq7ARd3GvhCzfstGXSlGsJGNjatD0g+Wn3jV5ggjtwwsMqhl6toTDOC6f17C6cc+bqW6QjBTGsa20Dgp/DAUwGgyHGcLxBUIh2QMzrSCMdUlI95BPH1JfXonlr4wdpQeBjT608jMAjxO+3JE1dp7xdzvfAYK6thszKz0pD8Q2DYorNVEgdgiN9Qj9tlfX+hMVGIi+fbW6+ENQxhIrsHYq4rQhpObvkXTf2lXvq9wLyxRy2n9emPnEA23JfIkO3C8UTfNjFt9DsH0/a3SWDPBT7p8OBHjDjqaLhBGpw81jMNjkPZvXP0nKhM7pTIuhQDs4yi8O4IXiuSEoN2RHX8mtT6P8GLhbyBqyGFs9hwtGrLwwtzDriYbQYW7QctTb7JvOE5KaCOKGswX53RbwcRGy45naQLSY/hamzZy+xQ8CkBe4LqlVW6lhnGxjVA67I7jpWFk4kc5xfp5x2h7O+7OYfHnKmktlza9qHVMKiMbfrmZEznD713rsA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(8676002)(4744005)(2906002)(122000001)(38070700005)(6512007)(26005)(316002)(38100700002)(6486002)(478600001)(186003)(6506007)(5660300002)(66446008)(91956017)(110136005)(36756003)(71200400001)(76116006)(64756008)(66556008)(66476007)(2616005)(66946007)(8936002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3hmWFdlQnJPdUJaNXNDaDdLRUtrN2FCaWhnWVpBdHVmdjRERUJ4eFgySTlM?=
 =?utf-8?B?bEFSN2hVRTdkVDRaRkJkOFJnNHd0dmhKZ2ErZGdxUi9IQVNCODNrTUlka0lT?=
 =?utf-8?B?WW9VcXozbEh4ZHgyajZjeWYyZVp1RW44M25ZVWFhdXk5em5yS0ZuRjE3anND?=
 =?utf-8?B?MkFIRjFCMXJtRnVOQyswWmNuVjB0eUxENmNHMUlyUkRRbHRlQnE1bC8wQjZa?=
 =?utf-8?B?YU10czdmbHoza2s5eUw4Mms1SzBUbkN3ZzAraW02NDhETHVrTzNYTHZuYytC?=
 =?utf-8?B?bE5BR2FpUVFJaEVVaEJtY3AxVndzaS94QVpETmtQb2dwL0lVL2F0NTZ4d1RU?=
 =?utf-8?B?YkVqNHdwVE9Ybkt3S0Q1RmV1WGxjTW1mNFU0UFo2cGFrUHB6NWRqZDhsQ04x?=
 =?utf-8?B?cHo3RzBOeHdhd0Z0REY1cVlVMC9MeWJWekR0T2ErZlVJLzVFRnhTYlBpaTEw?=
 =?utf-8?B?dysyUjFpWVB3bnRZQ0hwd01TMWZWVmdoRE5UUXFORE9mdEJDZ0JDYWt2VG9l?=
 =?utf-8?B?cklSWHpLVUQvMXBnOThFbnpyZU5Rc0w4ZWJISnlUYkVHaVV4dlpBSW1iUVhE?=
 =?utf-8?B?ZEJIY2pGSjk5cnlHZmQ2M2RlOXcya054dXZuSHFCY095d2ZhZ29HdHB5NHZI?=
 =?utf-8?B?VkJ4dmVEVGhhekMzamQvL2gwY1Eybld2eXJwaUFIUzVpS2pqbU0rclFuTURo?=
 =?utf-8?B?cjBUSitlbUhhWmRwc3h3dFFIRVlUNEtNU1RrdG9lWjVKQWsxaTE0Vy94eGNJ?=
 =?utf-8?B?aTRwNDhQb2Q3L1MzZUhYZmpnckIxOTY5eGkzYzY1VG1RZnNHdTVhYXAyeUdH?=
 =?utf-8?B?bVIvN2hzcTF6L3gzYTloZDQ3T1N2THdkKzhpRHo0aXV1MVNzbmJZYXByMTVG?=
 =?utf-8?B?SDBtYlQyK3FRdFhaQ244Rm1XWlQrbUdITXg5czMyQVR6MnlITk1wczVxbnlX?=
 =?utf-8?B?UHhpRWZESG8ybCtXSTZmbC9kdktKaWdaSVpGR28rRGR6WldqbDBYdnJjYU04?=
 =?utf-8?B?S01YeWI2OVdJRjNLRi8rMUErRnZTNkREWC9lOGNXd2hhL3dySWFPUDFUY1F1?=
 =?utf-8?B?ejZhekpVaXlucXRaOUFFejhEaVJOcVdNV2dNeUdIOWErYlVzdnE1d0xrSUU5?=
 =?utf-8?B?YXdPWDYxMmtIZThhT0pINHVrSlhqVkhLc3pkZWVGOUNHOTdQbW5yVENxK3Mv?=
 =?utf-8?B?d0JZQ0pBMFY4SEV3dldCL2xiYTk4VURQQ052dGVKV1ZkaFMvTlozMGJkd0hy?=
 =?utf-8?B?VFV0MnZtQUJyU29uTXZXYnFQdm5FeHBOVkpxVzI4TXdXZksrY285SHNnVnc1?=
 =?utf-8?B?YkV3cERDYVY3dHcrMXZRUEU3V3l0S09rTzVIVnJlZWxuMUFkcmNtNjZHWCtZ?=
 =?utf-8?B?T0MreHphaGx2dmVqZ2FEV1Q0MnFINE9UTkhKQVVDK1lOOU9OcUVweFd0R0dh?=
 =?utf-8?B?czR1SC9IejNWTHJ0M0ZuSEtta3gwWEY3RzlxYTg2djFyNE04TUE5N0pnTDJk?=
 =?utf-8?B?VFJBYjl4Qjh0aGh6MmJpVW1WcExxbXlhbi93UlcvTDRuWjVrZHhScWJERXkv?=
 =?utf-8?B?MzlRMmduWDk3U2swM1lHeHdDS1BYTHBGR2tmUkpvOTFyRWdMejJiZVFTS0JK?=
 =?utf-8?B?N3creGRQZCtRTlR1UktaaGMvZXNUNkdURFQ2a1I0TEhaanRrd1VTeWh1UVpr?=
 =?utf-8?B?VGFwRklqdnlCUHVqOTM1aWRQcHd2TTk4ZDJXZ2NPNHJCR3hMdnM2eGJ4VSt5?=
 =?utf-8?B?MXg4SmxMazRhblZkSGVoNU5ZMFczZ3YxY2lZTEl1dGoxU1BlUzJYMWNFYlhi?=
 =?utf-8?B?aDBFRzEvbnRzT3lSc29Ndz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 869c263b-bc04-4f23-7481-08d96d20b1f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 08:15:44.0059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oMV2hoEYp6yGuRiE0a/ymspFx9bRK9JXJ0OquQuVUa78WVaWRNGOORmOSu7994lffnisjYpF/0V3sL6b7b33jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2806
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <697DF1801F045543B70336023843E8A2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

SGkgUGF1bCwNCg0KT24gTW9uLCAyMDIxLTA4LTMwIGF0IDA5OjMzICswMTAwLCBQYXVsIEJhcmtl
ciB3cm90ZToNCj4gSGkgQW51aiwNCj4gDQo+IFBsZWFzZSBjb3VsZCB5b3UgY29uc2lkZXIgYmFj
a3BvcnRpbmcgdGhlIGZvbGxvd2luZyBjb21taXQgdG8NCj4gaGFyZGtub3R0Og0KPiANCj4gwqAg
YWYyYTljOTJkNDQ5ICgia2VybmVsLXlvY3RvOiBTaW1wbGlmeSBubyBnaXQgcmVwbyBjYXNlIGlu
DQo+IGRvX2tlcm5lbF9jaGVja291dCIpDQo+IA0KPiBUaGlzIGhhcyBhbHJlYWR5IGJlZW4gYmFj
a3BvcnQgdG8gZHVuZmVsbC4gVGhlIHBhdGNoIGNoZXJyeS1waWNrcw0KPiBjbGVhbmx5IHRvIGhh
cmRrbm90dC4NCj4gDQoNClN1cmUsIEkgd2lsbCBpbmNsdWRlIGl0IGluIG15IG5leHQgcm91bmQg
b2YgdGVzdGluZyAocHJvYmFibHkgbmV4dA0Kd2VlaykuDQoNClRoYW5rcywNCg0KQW51ag0K
