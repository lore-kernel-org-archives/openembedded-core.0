Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web09.10928.1631725138922931884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 09:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=xQXoEtH+;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="244746820"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; 
   d="scan'208";a="244746820"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 09:58:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; 
   d="scan'208";a="508879092"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga008.fm.intel.com with ESMTP; 15 Sep 2021 09:58:58 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 09:58:58 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 09:58:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 15 Sep 2021 09:58:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 15 Sep 2021 09:58:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtuYiEmqsdUX8luQMLv8KcqxRblU/CrZ1VCp2YTgbdSM5ysFzXI1TDjHF8FK8vrxQndvufcrfoAMJ8/g3rgnzaalmGBsz0eJ/5etrZ4ZqxgOCIe8gvQK1y4q/upc0dRRyODmCN4Za7X3kMWNVdBdppcCKaBbgOltX49kgTymZkP9Jg2hKsHsesgpC7/jNfIZVuG0SXN588gOkGMfDKsD+q6KKako/UobJIh8VlqNpIQ+5g2w0gh98mPdohIh/zHpoLMq08kIPjSC8ORMJAFlP45RfGg+ZTlazEMgqE6qHlGHQsyL2YS4yyX/vomuuEw1+Bzr7+UXHKLbQ6EBvJ0gLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OmxlCX7EjsaYUerJiAR46pv2pq2RW4nkHpU7BIWApPM=;
 b=RCnp5An+4DoRTCARtqgLOoucAgJyvsOHm1+448UCYMuXLCWkDEBcem9TaSc/3nqDWECE+e/HnwHNOOimmwz+MbcRDtNHlFixgFxYekjUGiNg2k4hA9/IFvKgmG/1Ikqsck+6ScEUyQcoWm/y5r0A+zMFdMQuV3zpL5LF1MGyUKFycutkwwNzIcxyfEtRTWj01wgkowT0G8skv5LC8eU6MEXOriAcMXOZGdKA+VFxP+VlgJ2CkGmPF6mEyf9DKuTP0USc6eucCz/MsO+AS2ep1dVlPV2g2Ws+8GIEFlBesFu3/25/+zNKDn2jyDBThtL039jQYVycbE1tH9C/Y5lsJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmxlCX7EjsaYUerJiAR46pv2pq2RW4nkHpU7BIWApPM=;
 b=xQXoEtH+iaziX1CIF5vO1KqudREf0tJK9Xc46xWan+NbnImRseH6r5egRv+uE/IWBoUdsLxi1kOZdIFggljgm7cox2ZRZoqiWUb13NPCQm+6RI+3EXB+D/b6t7L/BcpF7MLl6sERd3LSX4QRevOIC4nz58KQA8xPEwjjOb0WPak=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by SJ0PR11MB5071.namprd11.prod.outlook.com (2603:10b6:a03:2d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 16:58:56 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be%3]) with mapi id 15.20.4500.020; Wed, 15 Sep 2021
 16:58:56 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "steve@sakoman.com"
	<steve@sakoman.com>, "yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [OE-core] OE-core CVE metrics for hardknott on Sun 12 Sep 2021 05:00:01 AM HST
Thread-Topic: [OE-core] OE-core CVE metrics for hardknott on Sun 12 Sep 2021
 05:00:01 AM HST
Thread-Index: AQHXp+cY3qcuUx38H0q8z6sXCrCNC6ulVh8A
Date: Wed, 15 Sep 2021 16:58:56 +0000
Message-ID: <643057cf221a41e13ae92c496ad6358a2a6db265.camel@intel.com>
References: <20210912150121.8237296032A@nuc.router0800d9.com>
In-Reply-To: <20210912150121.8237296032A@nuc.router0800d9.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17a186eb-54f8-409b-442b-08d9786a1ae5
x-ms-traffictypediagnostic: SJ0PR11MB5071:
x-microsoft-antispam-prvs: <SJ0PR11MB50712F6C2A17A8BD1D2309F7F8DB9@SJ0PR11MB5071.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n/cqEtrskBCBCCTGQUNX/wluTAfdoOVGTADHWmLN0cbJiq2txbdL0jxKyNNxRV0+epK7/r4K0HE/vl9z4r7uO/89Q1T0/vAV0sCvAds+N00ahdT7rPM22i5E9GTZ+MIZ2W8PKoyvky/gsltgRdJ7GGLiq1W/RScg3XmeOoKBSyqEHkOXSqZQvLvfjiTEcmqg3PMQiYLLlFWZDV2Q8b+A3IGc4k/Gvf2Dw2EKGtCVMG9ZmPGL2jKp/2W5Ev2rGoyZHNJeLatW29oVArpCW+eq8sZh8//Sj7ZwusoSeWLWRuKmsYuFS8PYO8ukA1Hr4D2/bw1EW8gawscmefYsjXZUUaECWyVBDIhrVfMONFosf2EnbyHLGdIkv0aPBYPYtbcbC+WnJiEq4zlXO+R4deJY6WGngMtRK7bDjwfkQrd+7ItYut7d/9l1BEJzyk4QYMWKdqDCnVBJKgJQMBDJdD9TwGZJ5cBKWkab3Tk84+8y4ULIKe6gTh90HTEacX9K+TunRbuJM1PI4Bs6WvcxNP9kufXUVO/E8pGMOfbmG5fBUTucsK1iS6FDJ3ofsuZnSaemrpdYPYyM30Syc3M9zYORRdIcRa+XO0nE6k7Mqf3OfA2UA4MPjY16d5iMBHnYVFr0lBDTQbMpsye4BJZX6kI7FWd/17r6kxAcwcMFR6HpdqL3qs4yd+nhwIg8BJmEt4UXONpxn5Hwl4XY6jgRU32JuOJXj7AVAQRJpNBicqXnbsTfdDS+0n+FIpRjlatN3Thbq7lqPsh0HPNC2rVRsgdaLy8UKXqXZIvI/uhRPBsPgQA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(91956017)(122000001)(38100700002)(8936002)(2616005)(86362001)(66946007)(5660300002)(8676002)(6486002)(316002)(2906002)(38070700005)(186003)(966005)(83380400001)(66556008)(64756008)(66476007)(66446008)(508600001)(6512007)(6506007)(110136005)(36756003)(26005)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVVkM0lIMmhuRkdFa3l1RFdvSy90NzdydkhCTzRqdDZySW5tU1hqTlFOdXVs?=
 =?utf-8?B?ZFhGT2F2TlR2Z2V1elZnSVhTNkdtTUNZanFHSUZEVzg3bTdaczAxZlJaa0NH?=
 =?utf-8?B?a2poUDN1NTN6eS9EVFFUcUN2b2g5WmdTbzJveElIa3dwQjNRK3gwb0xsb1Zr?=
 =?utf-8?B?eWZPNG0vRjlqTWJsVEEydk53UDlYQ0oxaXA0Z1RXbWZrNU8zNnZwamRXVjBr?=
 =?utf-8?B?M2M5UEdyYlBOaW45bmZzaENVT2hnVUZQNUVMWWJycGJONlMyTm1xS09yMUN6?=
 =?utf-8?B?bXRTRnNwS0Z1SlZUUzI3dmI2b1VsN0laS0dKVEtYaFF5Z25IUUZ0T1pQaVFN?=
 =?utf-8?B?QVFVVDJabWZmUXZSZ29Bc3E3NWpOV3hDckVYSG8xbkZpVDBka01oUHhPTkhQ?=
 =?utf-8?B?K2xvdUttQThuYUtIaDlCQ2VZNVdEOUxtSmUrcDRhelVrNEFoYVhpV3NPeFJI?=
 =?utf-8?B?b1JhMzBxRzlGbDZDZjVsenkzSzZCb1ZvZlJnSUk5Y3ZIYmEwRm1WNHVTdkhG?=
 =?utf-8?B?dDlzN3BIV2JjeDFKOTFWYTJEdXVLU0xhelhtRG1qR0xuSTFuM2NaVWFoM3VR?=
 =?utf-8?B?T0J2WnRmRCtudVJON01OdmxQMUhiMXp0VFh5S0lPNzVVS1pHN21lQk9ESGR2?=
 =?utf-8?B?dU9lclVHYzZYazZRQ21tVEg3Q1FmSGRsdnI2dCtReTFud2R5Ym4rM0NEdkNj?=
 =?utf-8?B?QWt2M2l1bi9USDJHVFltRTU4bnFnYzNaQUV3MjlZUHE5Tk5iQktHaXVCWDdI?=
 =?utf-8?B?VUdPWGN1ellKRGp6dm5DN2xnUTFOZzI4dHZUR0R0ZWZsNEdBdEZKU1pDcHY1?=
 =?utf-8?B?UVNZL21LejFwTkF2VmVLS2lyVDRKM0RkQ202bFNtS1V2UjZ2M3VmMm1SL0N3?=
 =?utf-8?B?cEZsS1liRm52MDJZaTQyeWxWcWlvc3dpRGVxMWQ2UXNDaktobWZSeTBrcEdh?=
 =?utf-8?B?QXNiL29VL0l3ZzNKaEJYVjQ5UUFrWnFObnRXUWhKY0xFU0lTUmRiSzdyOFRH?=
 =?utf-8?B?YnNXY3hxWXR4RHliT0hmVmthSWhHR0tCVWFyYjNONFNucDhmazE0K25IS0w5?=
 =?utf-8?B?dC9sdkdnSUN5UGw3SkN0U0pyZmFzZFBmMzQxQVdlVVNIZGQrNTlUY3Z0ZGtU?=
 =?utf-8?B?M1ZPWnlJRmJRaG5la3l6MERPMW9peVArNEZxOTk2SDZDd0tQN2NGaWlWNEpx?=
 =?utf-8?B?NXJpdDJ0WlF4b2wrOTRNL0ZQeEloeUNsOVlaV1psNERJZWxJVTRNSEs1ZXVG?=
 =?utf-8?B?NzYzTUxGUkoxN3BXNHk2SENNOUdzSUJYWjZrOVVCQVhpdmYzTjNNU0s5Nmgx?=
 =?utf-8?B?aGJXNnlNNDNBN2FDNG90anFGdVE2YnJUckZsdEFsaWZzUmk0SnEzc0RLWHJi?=
 =?utf-8?B?ZzdBczdtSkVXdFY1OUJ5M0QrcjhncGt6eHAwVGtDVEdhUFRlclM3WS84eEp6?=
 =?utf-8?B?RFJHS3VBQjRCRVRMOWtydG5RWXhYOEJ0dEZLR2ViVnJjazFWS3pzZHFQckZS?=
 =?utf-8?B?bFJJeTdacTFMNTMzVXpvcVd2YTl5RVdaUy84OXllZ2JLUjBjQmN5TDZTUHgz?=
 =?utf-8?B?YUttWWpMdkZKVFhtekZGVERXb1JyeStaa2JpV3l0d2ZENkhhQWZZRStYRmVF?=
 =?utf-8?B?UkVraXVtcnh3ZFpLU0paUnkzcU80MmlQZ1BHaVluVGlQRVMybVRPQWtjTlVy?=
 =?utf-8?B?SHpFZXEwTkhrSWExN1Q3OFFsK3RSRk43MklSbEwrR2k5Q2QvS2pkd3NZL1Zt?=
 =?utf-8?B?SVdYcGptSkszT2pRbGdMMTdIc2hhREF2Z2RlV3h1SGNaZk9pVThGVk1XcHVC?=
 =?utf-8?B?V1hRSk5OVjVOUjZJcmQzZz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a186eb-54f8-409b-442b-08d9786a1ae5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 16:58:56.1331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SBopzsvVP3xiAdbtvmHc67PAxgVtpUrDHYe/3bMn0mEWADiQqOkLACHP/N5JF3uFA1qKfvhqi/csgqmUngupGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5071
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC61FE706ECB8F429941F5E4B3597D16@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

Q2FuIHdlIGFsc28gc2V0IGNvbW1lcmNpYWwgZmxhZyB3aGlsZSBnZW5lcmF0aW5nIHRoaXMgbGlz
dCBzbyByZWNpcGVzDQpsaWtlIGZmbXBlZyBhcmUgYWxzbyBwaWNrZWQgdXA/DQoNClRoYW5rcywN
Cg0KQW51ag0KDQpPbiBTdW4sIDIwMjEtMDktMTIgYXQgMDU6MDEgLTEwMDAsIFN0ZXZlIFNha29t
YW4gd3JvdGU6DQo+IEJyYW5jaDogaGFyZGtub3R0DQo+IA0KPiBOZXcgdGhpcyB3ZWVrOiAwIENW
RXMNCj4gDQo+IFJlbW92ZWQgdGhpcyB3ZWVrOiAyIENWRXMNCj4gQ1ZFLTIwMjAtMjc3NDg6IHhk
Zy11dGlscw0KPiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxu
SWQ9Q1ZFLTIwMjAtMjc3NDjCoCoNCj4gQ1ZFLTIwMjEtMzgxODU6IGNwaW8NCj4gaHR0cHM6Ly93
ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIxLTM4MTg1wqAq
DQo+IA0KPiBGdWxsIGxpc3Q6wqAgRm91bmQgMjcgdW5wYXRjaGVkIENWRXMNCj4gQ1ZFLTIwMTMt
MDM0MDogZXhwYXQ6ZXhwYXQtbmF0aXZlDQo+IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3
L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAxMy0wMzQwwqAqDQo+IENWRS0yMDE5LTEyMDY3OiBx
ZW11OnFlbXUtbmF0aXZlOnFlbXUtc3lzdGVtLW5hdGl2ZQ0KPiBodHRwczovL3dlYi5udmQubmlz
dC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMTktMTIwNjfCoCoNCj4gQ1ZFLTIw
MTktNjI5MzogZmxleDpmbGV4LW5hdGl2ZQ0KPiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmll
dy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMTktNjI5M8KgKg0KPiBDVkUtMjAxOS02NDcwOiBi
aW5kDQo+IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1D
VkUtMjAxOS02NDcwwqAqDQo+IENWRS0yMDIwLTE4OTc0OiBuYXNtOm5hc20tbmF0aXZlDQo+IGh0
dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMC0x
ODk3NMKgKg0KPiBDVkUtMjAyMC0yOTYyMzogd2Via2l0Z3RrDQo+IGh0dHBzOi8vd2ViLm52ZC5u
aXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMC0yOTYyM8KgKg0KPiBDVkUt
MjAyMC0zNTUwMzogcWVtdTpxZW11LW5hdGl2ZTpxZW11LXN5c3RlbS1uYXRpdmUNCj4gaHR0cHM6
Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIwLTM1NTAz
wqAqDQo+IENWRS0yMDIxLTAxMjk6IGJsdWV6NQ0KPiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yv
dmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjEtMDEyOcKgKg0KPiBDVkUtMjAyMS0xNzY1
OiB3ZWJraXRndGsNCj4gaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/
dnVsbklkPUNWRS0yMDIxLTE3NjXCoCoNCj4gQ1ZFLTIwMjEtMTc4OTogd2Via2l0Z3RrDQo+IGh0
dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMS0x
Nzg5wqAqDQo+IENWRS0yMDIxLTE3OTk6IHdlYmtpdGd0aw0KPiBodHRwczovL3dlYi5udmQubmlz
dC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjEtMTc5OcKgKg0KPiBDVkUtMjAy
MS0xODAxOiB3ZWJraXRndGsNCj4gaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9k
ZXRhaWw/dnVsbklkPUNWRS0yMDIxLTE4MDHCoCoNCj4gQ1ZFLTIwMjEtMTg3MDogd2Via2l0Z3Rr
DQo+IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUt
MjAyMS0xODcwwqAqDQo+IENWRS0yMDIxLTIwMTk2OiBxZW11OnFlbXUtbmF0aXZlOnFlbXUtc3lz
dGVtLW5hdGl2ZQ0KPiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92
dWxuSWQ9Q1ZFLTIwMjEtMjAxOTbCoCoNCj4gQ1ZFLTIwMjEtMjAyNTU6IHFlbXU6cWVtdS1uYXRp
dmU6cWVtdS1zeXN0ZW0tbmF0aXZlDQo+IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1
bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMS0yMDI1NcKgKg0KPiBDVkUtMjAyMS0yMjkyMjogY3Vy
bDpjdXJsLW5hdGl2ZQ0KPiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFp
bD92dWxuSWQ9Q1ZFLTIwMjEtMjI5MjLCoCoNCj4gQ1ZFLTIwMjEtMjI5MjM6IGN1cmw6Y3VybC1u
YXRpdmUNCj4gaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklk
PUNWRS0yMDIxLTIyOTIzwqAqDQo+IENWRS0yMDIxLTI5OTIzOiBnbw0KPiBodHRwczovL3dlYi5u
dmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjEtMjk5MjPCoCoNCj4g
Q1ZFLTIwMjEtMzE4MTA6IHJ1Ynk6cnVieS1uYXRpdmUNCj4gaHR0cHM6Ly93ZWIubnZkLm5pc3Qu
Z292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIxLTMxODEwwqAqDQo+IENWRS0yMDIx
LTMxODc5OiB3Z2V0DQo+IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWls
P3Z1bG5JZD1DVkUtMjAyMS0zMTg3OcKgKg0KPiBDVkUtMjAyMS0zMjA2NjogcnVieTpydWJ5LW5h
dGl2ZQ0KPiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9
Q1ZFLTIwMjEtMzIwNjbCoCoNCj4gQ1ZFLTIwMjEtMzQ0NTogbGliZG5mDQo+IGh0dHBzOi8vd2Vi
Lm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMS0zNDQ1wqAqDQo+
IENWRS0yMDIxLTM1MDc6IHFlbXU6cWVtdS1uYXRpdmU6cWVtdS1zeXN0ZW0tbmF0aXZlDQo+IGh0
dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMS0z
NTA3wqAqDQo+IENWRS0yMDIxLTM1MzMxOiB0Y2w6dGNsLW5hdGl2ZQ0KPiBodHRwczovL3dlYi5u
dmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjEtMzUzMzHCoCoNCj4g
Q1ZFLTIwMjEtMzY4MjogcWVtdTpxZW11LW5hdGl2ZTpxZW11LXN5c3RlbS1uYXRpdmUNCj4gaHR0
cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIxLTM2
ODLCoCoNCj4gQ1ZFLTIwMjEtMzY5NzY6IGxpYmFyY2hpdmUNCj4gaHR0cHM6Ly93ZWIubnZkLm5p
c3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIxLTM2OTc2wqAqDQo+IENWRS0y
MDIxLTM3MTM6IHFlbXU6cWVtdS1uYXRpdmU6cWVtdS1zeXN0ZW0tbmF0aXZlDQo+IGh0dHBzOi8v
d2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMS0zNzEzwqAq
DQo+IA0KPiANCj4gDQoNCg==
