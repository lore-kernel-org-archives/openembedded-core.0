Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.7819.1631848768988836560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 20:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=kMnY3VP1;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="286397463"
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; 
   d="scan'208";a="286397463"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2021 20:19:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; 
   d="scan'208";a="554436615"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by fmsmga002.fm.intel.com with ESMTP; 16 Sep 2021 20:19:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 20:19:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 16 Sep 2021 20:19:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 16 Sep 2021 20:19:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqFNneyRWJ6e2uT7KusLQW3/6rK4awEEDfjlAqr+IaV4TyVjiHRcer84iNP7mbq29UgrLL907DlvtB2u81X0vIVLDx+VqvMhbKZO0XS/Ubo9qCHl8zpkgQekeNqqueUceDYTTXzseeZWEQWBtTlPfp/+3bdKNYs21lMOslrf1eWBvn0aOwdx5W5KH8VZXekqsYFSr8NQCeuZcr9lMRKOaOC/0Se3Q5ocI9ZbrjN1rO7SkF3iD0YWIRaMtiJyepi8Gi9TVPhhZHQhUq1casexwHuczVy1uPFA2SCoIDC8eSljzUgNgMet7ky3VGAFPabvYDSUCEM2pmLNnmaGdPT7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ITW/KAMMUYuj6du17fZ0weHwHwCwBC+s6Ak3SqLd6Rw=;
 b=L8ai2JL21uNsb+OxLWZFBpwGn1XJowyFVn8w/f44o3g26QpOSaeRkTm/AAulJYoecB2pr7txhYHZVqERADN8GdoNY8yMeSk56VIq9ovs2UZRLuYIG6Eb31kb9ng26C/p4w0hVHZAuqPvvU0RYWGaEnVIMUyRMKxdOyIrJ+AGjhYlYpB2tXBNU+V43jCBN2A8XnlDHQ3ZyNAsdvvU5DTnExBG0towlhgS0DUtnUZI9n6bUPVsdb7ULZcJm8561UrEakS/GUJAHEb2eUIxi4mIWWCdSHGQUwetafJfUin19RqGkaqu0o6DiSkXnPz7AGnLJQXZ1rKC1vX7PoEWF8t8aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITW/KAMMUYuj6du17fZ0weHwHwCwBC+s6Ak3SqLd6Rw=;
 b=kMnY3VP1vCnqC0kq0OE7yLk+fMLei7jQH9p2RNUdl0cfmuXTZ0wNYZ2X3GkxDlkLKoJ6ijB0gQDqpd0yRb+wOrRKMU5FlZ8hxRCOfdtHlhL5I77pzJIy6zSj55/wEugl0Xzqn96gJ8QDsp7JuhnneScKLWj25rp6H6sjg/szfKs=
Received: from BN9PR11MB5372.namprd11.prod.outlook.com (2603:10b6:408:105::5)
 by BN9PR11MB5481.namprd11.prod.outlook.com (2603:10b6:408:102::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 03:19:24 +0000
Received: from BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::9ef:5965:3a7e:7b8c]) by BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::9ef:5965:3a7e:7b8c%8]) with mapi id 15.20.4500.018; Fri, 17 Sep 2021
 03:19:24 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.1.11.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.11.rc2)
Thread-Index: AQHXqsUt+xn8GFsriEKfCE5ku096Gaunj2Tg
Date: Fri, 17 Sep 2021 03:19:24 +0000
Message-ID: <BN9PR11MB5372E578F237EBB5DE3378D6BBDD9@BN9PR11MB5372.namprd11.prod.outlook.com>
References: <c6530d49069932111797e610258038660a9f903c.camel@linuxfoundation.org>
In-Reply-To: <c6530d49069932111797e610258038660a9f903c.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60a5dbc9-f219-4add-1097-08d97989f324
x-ms-traffictypediagnostic: BN9PR11MB5481:
x-microsoft-antispam-prvs: <BN9PR11MB548176353D1BECEF0257D213BBDD9@BN9PR11MB5481.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 91cfPX/kJx8e8Hc30fKg8qjFH+X5tBqGLwnL0XGSWWGHpgO7eVeoa9wXGpcgjS+5fIAvk4d1heov33VLmf4CEPErpQSOtU3kvBg0TmKuH8V9gHIdUZmGfZXywwMxWMMiw/QF5p1Wjg6tdbZ4dS5vRng5umuGbV0FwLmA+YCJjpCtZQ6B3Dd2DfR1x+B3IViC8WnDtrlnscpsO52dNVnfAz2xqgYRsl5Jfxk4EYcilSTOfiwzY7IZP7C4FkZYXBr76MGlDf7czn6fcWPhMMWUKyOtWOm+n6ME2wkoSy13yvOkvc3ZA47iGPdq90K5o2qP6fYFKqQBXBNE7UmWegsXbIcdiQRx0nPXaGlGjhkwrMf/35agBrZKtnlzK/tftYO2ZR71LaWH3fOv7sxFv1o4uuIltKv1sA4TdNJKsflRF5QSeTo+Mc6xX9/VrJc1CzvxERiC4shTzlVArOPOTs2NrXGVaDI3tVAigaPgFQtrv6kH3S+ec9sXeDP4g/AUbJswghjhkF39oTrxAlcRL7i+X4eIzJIWCRuXHfSAMZh+WadswqZ/xwW30Qh8dpLN1U9L+wBsvyDcpdx0KjY7nailTTJEOij+nxrwccyW+Ukw5BlFoMyoZPmggZWnOn6FdcEVSWUQfihHZ7kdfMkX3dY1LDKO0lZPbVp19AN6P42AsPkngfM2qMVhfKK7fLZ568meaO+GMbzmOe0iS+dRrDURTAEpS7pjIshp0Yb7y2cDrB2DL0+AQncQS9GnThscryIdtv4vO+6/haZfcGWlVzsyTIG+ZwXMVwLAzMc5FktESghBjC+/zWcG375qfiOIMWokc89c/aJylmWjkTGMjCtlmA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5372.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(86362001)(508600001)(55016002)(7696005)(38070700005)(33656002)(8676002)(15650500001)(110136005)(52536014)(5660300002)(316002)(64756008)(122000001)(966005)(66476007)(66946007)(66556008)(66446008)(76116006)(38100700002)(186003)(71200400001)(9686003)(8936002)(53546011)(6506007)(2906002)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzRQZjRsY3krTU5CeFFqeUF5MjYrQXVQcjA2V0RzSFZ2TmZaODdrb0NuaU1Z?=
 =?utf-8?B?dFdoWDQvK2xHSllCUU1neTFaSHJJcVNxOUZhWWtiV05FcjU2OGU5NWV2Q0p4?=
 =?utf-8?B?OWlrRUM2VzlUNFljd0p4U2N2c2NFOFJRQmFSSmt4ckVrVXhkWmZLR3p3dHN2?=
 =?utf-8?B?aEtIUFJGT2NIM1hhQk5aRzdZb2NWVDNyNGl1OU9mcEU2Y21pSE9yR1VQQXRj?=
 =?utf-8?B?a2xjWUJKdnRaaFd0bTVjSHlIaE1CMzB6VzZlV0xaWWJ6Kzg2R2RJckpFUzJ2?=
 =?utf-8?B?blVuMjV3L25Ub242WDdFczRmUXFiNzh4VmtJa29jUU5hRHdsNmZZZTB1RHY4?=
 =?utf-8?B?OTljYXlmY1lKQXBPTUZMV0owNHFBWE1vZ3lyQlhXdGVPTENWa1NmUUtRQkVQ?=
 =?utf-8?B?ZUFSSWRtU3BKaXVoZDd1eVJFUFhJTW96bEVDcnZjTUM3YU1CSzROWENRMEVZ?=
 =?utf-8?B?NmJLZHdkbWtsRERUYThtOHdTZzQ5YmhnS2UzUXVFYy9iQk0vMU5xRkwxd0xU?=
 =?utf-8?B?ejc1K1pQdzc4ZHR2UVQvK25BaDVKSktuaXBPUnhTUW40N1V5VEcvK2pUR2V2?=
 =?utf-8?B?WkRleFFKSEh0TStMZ1FyczM1UnNDWkhVazdNSlNhM3RXN3JxSmJKN1B6MEF5?=
 =?utf-8?B?VmJTZkVvZ21mNUt1c1FKRG90WmdMSnMwLzlCbExadjlmWXF3Qm1pbkg3bExM?=
 =?utf-8?B?YzVpM0w5engxNG15N1NmZ3lxSURtdzRhMkk0dUxkZVkzRDhFSnRLTTZHNTRx?=
 =?utf-8?B?TmdLMW5PaVRNNzFyUnh3dUpNaU9MTDYyZHlMdkwyNjUvcitWcGFJZFpDRkRh?=
 =?utf-8?B?bGhLckMxQzVlZDJXUiswaVVZSW9Sd05WUnAvL0xBSk04cWhCMlBJMm5LT29U?=
 =?utf-8?B?QTZLZ1Q1MDBybnBKVDBiaUJFN3grWGhUY1RwVlk3TEpGS2FVMFB4YVJCcWJx?=
 =?utf-8?B?eTE0Tm1pR2wwZmI1cXFQTUJER1d2S3lMeW9aK054NktKZ213N3VFT2RFUmVH?=
 =?utf-8?B?bXF2V1BqRDdrSWdiYVR5N2Y2ZDI0dTlZcTFzTFVSeGlIbmJXNGZYdklTbXdk?=
 =?utf-8?B?bGdXNVNOT0g0N0VvOGVrNFYwR1huNGJEam9McWtaNXRuMlpSRnUxajFTVG1W?=
 =?utf-8?B?U1FpWnlDMG41UzQrc3NZbm00a3hVR1pYdnN6Y2tlL2NWVHd5TkJOZU9kY1NX?=
 =?utf-8?B?czc2N3NPQlpHQ0s1UmhBQ2tkY1Y4NGp4alc2NjRuQ0JZNGQxVWZ0R1RYRmtC?=
 =?utf-8?B?cGtCK1lubC9uM0RKblowTHFETWxMWVNDc1N6L1lUbHdFS1hLb0xadTZYbW02?=
 =?utf-8?B?dVRraWk5MTNwWkRQb3dJc2F5U2VNbWREamhRM282ajlNK1hMNzYvWjJMYnd6?=
 =?utf-8?B?M3RGZE44TUJQZ0c5UFJuajVtdXQ4Q3dibkJUVXN0ek11NG5QWjVFS0JGU1Iv?=
 =?utf-8?B?ZGJ0SW9GdW5Pa1pDWFJyczVZTXVrREtBbGdRUFdvZm1wQkgxeDdVVnZCQnVt?=
 =?utf-8?B?MjRROS9xT3lnZksvdlU0dW9rNFZpTm5qcFQvKzdMMk9zVmlhd1dudXZ3ZXV3?=
 =?utf-8?B?dUVteE1EeHNIQjdYR0p5bmprUVdlSmFyR3ZzTXo4U3BsNVlvUUdrejdmK0c3?=
 =?utf-8?B?L2VmUElUb2FNMzlOM1p0YmRvd1pkdUI1Tit0OGY5Y2M4THc1RnBkNFhTOG4r?=
 =?utf-8?B?R0dtMTU3dERZQ1FQRFRVSFNUWmNJcm5kMWFPcnhrT1lsTURScW1BeFlnUGFx?=
 =?utf-8?B?NTNrS1F6ZHh1K3VBQ2ZVSndySWpSRWFJdFJGREFUVnUwS3RyN3NHN2JFbFZJ?=
 =?utf-8?B?ajgyZkxNeGFySElhaVo0NFk5V0hMeWVQK0JrUE1rbUduS3B4VkZWZWdCamJX?=
 =?utf-8?Q?T5FrpPIhZ04EV?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a5dbc9-f219-4add-1097-08d97989f324
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2021 03:19:24.5287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w0vQjbE5YhLT/AmTBBqZ8AgVV8uhLWhJ32rHoSHWOde34GkHMfI9qQhunp8CuSISjttlDNV7zD3cd4VyR2cK3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5481
Return-Path: jay.shen.teoh@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpJbnRlbCBhbmQgV1IgWVAgUUEgaXMgcGxhbm5pbmcgZm9yIFFBIGV4ZWN1dGlv
biBmb3IgWVAgYnVpbGQgeW9jdG8tMy4xLjExLnJjMi4gV2UgYXJlIHBsYW5uaW5nIHRvIGV4ZWN1
dGUgZm9sbG93aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KDQpPRVFBLW1hbnVhbCB0ZXN0cyBm
b3IgZm9sbG93aW5nIG1vZHVsZToNCjEuIE9FLUNvcmUNCjIuIEJTUC1odw0KDQpSdW50aW1lIGF1
dG8gdGVzdCBmb3IgZm9sbG93aW5nIHBsYXRmb3JtczoNCjEuIE1pbm5vd1R1cmJvdCAzMi1iaXQN
CjIuIENvZmZlZSBMYWtlDQozLiBOVUMgNw0KNC4gTlVDIDYNCjUuIEVkZ2Vyb3V0ZXINCjYuIEJl
YWdsZWJvbmUNCg0KRVRBIGZvciBjb21wbGV0aW9uIGlzIG5leHQgV2VkbmVzZGF5LCBTZXAgMjIu
DQoNClRoYW5rcywNCkpheQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWlsZC0N
Cj4gbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBSaWNo
YXJkIFB1cmRpZQ0KPiBTZW50OiBUaHVyc2RheSwgMTYgU2VwdGVtYmVyLCAyMDIxIDI6MzYgUE0N
Cj4gVG86IDx5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPiA8eW9jdG9AbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZz4NCj4gQ2M6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbiA8cWEtYnVpbGQtbm90aWZp
Y2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+IFN1YmplY3Q6IFtxYS1idWlsZC1ub3Rp
ZmljYXRpb25dIFFBIG5vdGlmaWNhdGlvbiBmb3IgY29tcGxldGVkIGF1dG9idWlsZGVyIGJ1aWxk
DQo+ICh5b2N0by0zLjEuMTEucmMyKQ0KPiANCj4gQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9j
dG8tMy4xLjExLnJjMikgd2FzIGNvbXBsZXRlZCBvbiB0aGUgYXV0b2J1aWxkZXIgYW5kDQo+IGlz
IGF2YWlsYWJsZSBhdDoNCj4gDQo+IA0KPiAgICAgaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0by5p
by9wdWIvcmVsZWFzZXMveW9jdG8tMy4xLjExLnJjMg0KPiANCj4gDQo+IEJ1aWxkIGhhc2ggaW5m
b3JtYXRpb246DQo+IA0KPiBiaXRiYWtlOiBjMmEzYmRhM2EyOWUxMjQ3MmVmNzg2MmU0MjRlYTE1
NTJmYWIyOTU5DQo+IG1ldGEtYWdsOiA2MDM0NGVmYTdhNTBkYzI1NDhmYzRiNWQ2OGI1YWQ0ZDYw
YzQwMjNhDQo+IG1ldGEtYXJtOiBjZTUzNWRmYjk2ZGU0ZDI1MjlmMDkxZDdkODVhNzE3MmM2MjYw
MDFjDQo+IG1ldGEtYXdzOiBjNTE2NGMxYTc5NWMyMWY3Y2FjY2MzYjY4YmIyZTgxYTU1YmRkYjBl
DQo+IG1ldGEtZ3BsdjI6IDYwYjI1MWMyNWJhODdlOTQ2YTBjYTRjZGM4ZDE3YjFjYjA5MjkyYWMN
Cj4gbWV0YS1pbnRlbDogNjgzNzU1MjM2NWQzY2FjNWY4MDQ0YTVhZTkxMGFhODc0NDM1Zjc2Ng0K
PiBtZXRhLW1pbmd3OiA1MjRkZTY4NjIwNWI1ZDY3MzY2NjFkNDUzMmY1Zjk4ZmVlODU4OWI3DQo+
IG1ldGEtb3BlbmVtYmVkZGVkOiAyZTdlOThjZDBjYjgyZGIyMTRiMTMyMjRjNzExMzRiOTMzNWE3
MTliDQo+IG9lY29yZTogYzdkMjI4MWViNmNkYTljMTYzN2MyMGIzNTQwYjE0MjA3M2JjYTIzNQ0K
PiBwb2t5OiA3NGIyMmRiNjg3OWIzODhkNzAwZjYxZTA4Y2IzZjIzOWNmOTQwZDE4DQo+IA0KPiAN
Cj4gDQo+IFRoaXMgaXMgYW4gYXV0b21hdGVkIG1lc3NhZ2UgZnJvbSB0aGUgWW9jdG8gUHJvamVj
dCBBdXRvYnVpbGRlcg0KPiBHaXQ6IGdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL3lvY3RvLWF1
dG9idWlsZGVyMg0KPiBFbWFpbDogcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZw0K
PiANCj4gDQo+IA0KPiANCj4gDQo+IA0KPiANCg0K
