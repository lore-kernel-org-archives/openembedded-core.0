Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.5604.1631183669455759314
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 03:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=e6CRmsc9;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="220801856"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; 
   d="scan'208";a="220801856"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2021 03:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; 
   d="scan'208";a="648860770"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by orsmga005.jf.intel.com with ESMTP; 09 Sep 2021 03:34:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 03:34:28 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 03:34:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 03:34:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 9 Sep 2021 03:34:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CN3TBIjYZvxbuRk2D0cF4Gw4zYRBFd5sX9LFe3mO8uudIoPV82Ga+0bxvWmyaxUKmjZsQ5TV9f35hzH6ANwin+9DMFZNWz8t+chEkcwNywBLGuIYxqqgUGlgA5gA5/XwcqYj0k1T0VmBTi1Q9Y4vJyANjDORKfbG3wItC/hrT1g1QnA1Mjmq0qtZYYJU5Na5+oj5EwF6rR9ZxQK5q5OCknl32gT2p9rOxdkWaTshPF49hKzvU1AD7AO/ylBFkHYB+Bt8dy7OjJ3Lwvkhh+ar0GRFXUXdg+/ckGuGjDqeMB9JP/fhDCD+u7VWTEp6yRnrIVf+yUJWcfxs1DcD/fb8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=p+dts6nJsrdqmjqsjfe0LZDImUx2JY3DX+XJjLQvZTw=;
 b=byD3bgVlrxhuDc+GqPsYA4bSgMTMmJE0ecfK4XM86+TEzI+ly1kfbfDziMZDI0v98G8A5QQmGQ7Yv+B3WKxWnhtSvrB/XMGlzWrrGsWS7WhzRHFlkQAJvFRfhExZ967cxrfuiA7qngXpgEfiP+IqRBSmZgcQiTE9ekZ6Tz/4N+6eMDcyJ5WWJK0+KwUlNgpGMHaLcUCe2JsapD9HFwPWT7ftVq3H4cICV7J4mG+EReplESFr9iilwH3BJdcllCwEhp0GDmVhA030fCcn3h0rrCLkS8QMS32MyhClTde3Y17GlFff9npsxP71oNOpdA4kCUbbDh4xUhCcWTPxUDudug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+dts6nJsrdqmjqsjfe0LZDImUx2JY3DX+XJjLQvZTw=;
 b=e6CRmsc96N1zvORk/tiNBkh7EG8AuqUyZemHlmfPWcpbtB6quREOoryZAC937RFmvDZOgOpLQoIqsb+Syn2yB28c8fOll/UAQzitFdhFLge7cZ1G2EsGQCji4H8YRYxVy3WsTVlv4sqwuIF0/9/j2OqIOeBxURVNJD1qUuiov6U=
Received: from BN9PR11MB5372.namprd11.prod.outlook.com (2603:10b6:408:105::5)
 by BN9PR11MB5227.namprd11.prod.outlook.com (2603:10b6:408:134::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 10:34:26 +0000
Received: from BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::9ef:5965:3a7e:7b8c]) by BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::9ef:5965:3a7e:7b8c%9]) with mapi id 15.20.4478.025; Thu, 9 Sep 2021
 10:34:26 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.4_M3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.4_M3.rc1)
Thread-Index: AQHXoZCDj6j4WWY/vkOSncz7A+wgJ6ubiSgw
Date: Thu, 9 Sep 2021 10:34:26 +0000
Message-ID: <BN9PR11MB5372E085693CF70A1E267952BBD59@BN9PR11MB5372.namprd11.prod.outlook.com>
References: <1e259a6e721b585979f81366408ed6570616441b.camel@linuxfoundation.org>
In-Reply-To: <1e259a6e721b585979f81366408ed6570616441b.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: afe862c8-49d7-4c5e-7485-08d9737d65e4
x-ms-traffictypediagnostic: BN9PR11MB5227:
x-microsoft-antispam-prvs: <BN9PR11MB5227130E7B43D91AC7449DD8BBD59@BN9PR11MB5227.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7+D8mcAaWJxjnmqKqKtPpTLZ0RzkvMN2+YoRcpD4dMlzAZ8sCVCd2bfzmNCvvYsskEZHZwmubty3jVpokUsYDmaXgMFlew4sznOfnhzUViW4dANjmYNQCS6YzXSj9DEpJ8og1W9/4fmrilgzn6YTr0Mmu4IC4M0rzWtXyJnLGMU6ncGooS0INRFFGAkCIYqjitnBQJRjxTwe7AbWcSHO41+9vX/c1Ooc1kLjlm4vAiWi4UtwG0tkJ8a7uxyDjhTYyjZNoClHa+jkI8MaGBB2ItuRjv3iLMOVX5deaYzhwx1sCDtxNikmxwZ6HN25nWzTN+YG0tJw8u7pQWhk+PDN2ychbIs5WWyLmy7io93YqcWi9j7ptqJOYeg8qRwhkbDYxCBHo8+UeakH7mZgBDLmxJvqBoouFog4XHSAFWepi4nRKtn/kLCi/JoqMUq59L6VkOJOIEKWmEHWKzYJbeneKZCW076TPxyXyJv6FazhCMA42mQdzfxScKgMjy78/tR6Slfw87zxcD4HMKHRQBhoZF5h8jHLLttIABPs3dIYmBr6405cycRcIVJB+h06AGQM+YJr29VA5Wbrw2XGDJ5ACiJrjHL/P1JzRcnfNc0GYh8TE2nR+AVrafQ2s/Ody7St6GZ/BMFqr0eocXWXJYxG89CHKLdnfQzQ0AOseCASK6SYIN/JDlb4fMIPM71x1E5DPZO3MixGUvulX0LOEj5FINtXdZYNAxKBu+aMo1fjwvM8qOjzoQdhVhuoBnxD/Cg3IqbTzg/NqCARTpolXDtVTlu1zDyAxQoWRhLGMMaA2HM+4tvWSUSTt/LXKIoHPAjSqUEVIbNrdPCPF8dVaFuCPA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5372.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(55016002)(6506007)(66476007)(478600001)(64756008)(66446008)(53546011)(66946007)(66556008)(38070700005)(8676002)(9686003)(5660300002)(15650500001)(186003)(26005)(33656002)(86362001)(83380400001)(2906002)(52536014)(966005)(76116006)(7696005)(110136005)(122000001)(38100700002)(8936002)(71200400001)(316002)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NSs2ZTlHY09lbVdZSk5aRmE1ekhaU3VBelQvb05aUnBPSEVzVWZGZlgvcDR4?=
 =?utf-8?B?OUhSNHlpeGN0VElZM1RMQkttTjFUYkNZZ1RVZmNhNFRzejdFVjF0TVdWK29C?=
 =?utf-8?B?dlNRSjdzcU9pT1dsZzVTWkw1MVhnQ29Ga21PWkJGVWtNOXFBdEI4RlIvY2p2?=
 =?utf-8?B?Q2ZkQmhzdTRwODRWU043TEFNS3RmMzU1VFk4ZDdWb2Vid29Bc1ltSzNDQmYz?=
 =?utf-8?B?Yks0VGdYNFhJenlsZ2xCUk9jR1RrNUJ1blBqRXQzL0lRekozdDVkM2ZjMFdN?=
 =?utf-8?B?NGJBRmhwaGNxY2RsNUh4ZFU4NFlkWk1jK002cEJna1JuNXpEMHVYVzVvZDht?=
 =?utf-8?B?eTczSE5mT3kzUDNCeU96dzJhdWN0K3JTa1FTaS9hWi9xSU9sNHNhWmdST2xS?=
 =?utf-8?B?cUZzQmxJYmZrRW9KSXg3UGM5NFU0ZXJiZG9uU1ZTN3lqN0hIbUhLaGRnVkJo?=
 =?utf-8?B?ZDNnZWhteEM0djA3amRacmRqVHFNUHlLT3Y5Rk8yOGFrS2pTK1BHTmVrdXlW?=
 =?utf-8?B?VC9yS3cyR0RvUGVmOEo1UjRBZTZlK3RSMys2elRnNDdIUGo0VE1ZbUsweDZm?=
 =?utf-8?B?MnFrM3g4czdSVnNTU2ZpeFV3c3RIellGdGwyMHdJMk1UdDUrcW9MTWoyZSt5?=
 =?utf-8?B?ZGptVUFaU2hnSktmUnFJbXJmTzJpb2tnNE5LdWdaYU9oZGg4UExCVWVkdTN3?=
 =?utf-8?B?MmxUSUo5NHFDbm91MHkyeU4zemRFOW9hWWNEVitMUEZIZTdqUDUwVGllVWcz?=
 =?utf-8?B?UTd3MVYvZmNlUWpVZ3JHRi92cW5ublcreG9lTVozUEd1Y3VTb3FWRlU4Ny9a?=
 =?utf-8?B?akQ4NDFNY1JYeXZkbXcydkhQVG5PdWRJK1R5MjcvZHNrdEF1VFdiRVpIY2Z2?=
 =?utf-8?B?RDJOcGRqc0NidHBxYXQweGY3QVBoRXVUN0M1ckp4V1M0NXplWEROUFdGd0F2?=
 =?utf-8?B?dkJZVXI0ZmFWb0NuTElDdmU4c1MyYnBmZFZhNmdWS3N6Y2gzRDFiQnFxQUs2?=
 =?utf-8?B?ZFByS0N0bXZmSjJGakgrM0FqM2N0dDM4TW5oVVpyT1JoaXR5RStlNitOd3Bn?=
 =?utf-8?B?SlFhTllDMjVwdGVQNmRSN25kcjVsYm1YY2ZXQ292bjc5c1FqdjBPZGF4UEt2?=
 =?utf-8?B?Nlg5aEVKSVRic3MwalZyUGdtaUVZQXNjQzVrN3R4ZzAwSXZzNEE1cEhaN2Jh?=
 =?utf-8?B?clFrWmZMUUtJYmZoV1VQS3JOb1hzbGh3T0dLbW12QVJOQWR6cHZ3ajg0UlRP?=
 =?utf-8?B?b0dTV0hVWkhWUUg2L1hhTVhLVVc5L3lPL1Zxa1JhbHY0clA2SXJ1Y2E5dUVJ?=
 =?utf-8?B?ZWk2MC9sKzRXR25DUndYb3lNVFk3SnRlU3owbU94NFpyWW9wZmJTNlRPdVRt?=
 =?utf-8?B?bVJkV0hRWUhZVXFhMDcrMlRGRHBweFV3RGJCeUsrMXQrRzl3cmtSY1ZSZGxj?=
 =?utf-8?B?cm1DdVZoL2llaGxPNzVqWTJxdThsZm5CaDRvK3FRbGNabXIvNG9YQWVQcUNl?=
 =?utf-8?B?ajZPbVZEZ2xkY1JnWkFiUFExU1hhd2p1OGZzdWsvSHI3STBOd0FkeEU1V0pK?=
 =?utf-8?B?ODJONTEyU1Q3elc5NUw4L0tKZFJ5YVFaZVVxeWhmUFdqUUJVUCtWb0xxdVNn?=
 =?utf-8?B?d0Q0blFsdGZRVmxFRDc2RnJPMG5QdThFd09BZjdBcnRQbEppbTNHT0tMcy8z?=
 =?utf-8?B?QTVDOVNibDRGc2pBeXVuTE9YYXBuQzR3akJZeC84QVl5c2VjMFE4anM5NC9V?=
 =?utf-8?Q?0J1/YnNlud9hXXUmBW1YSPYEj4FTfpD86No6wZL?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe862c8-49d7-4c5e-7485-08d9737d65e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 10:34:26.6396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /zhG5JKBJZmTzyTHoGfRZxrXdLYxiW8jCQnZsS/bCcIRXS5n/aZBmTxFUjoUwShqh3Qc0yxVOvZLiV4KKMwnZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5227
Return-Path: jay.shen.teoh@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KDQpUaGlzIGlzIHRoZSBmdWxsIHJlcG9ydCBmb3IgeW9jdG8tMy40X00zLnJjMTog
IA0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3lvY3RvLXRlc3Ry
ZXN1bHRzLWNvbnRyaWIvdHJlZS8/aD1pbnRlbC15b2N0by10ZXN0cmVzdWx0cw0KDQo9PT09PT09
IFN1bW1hcnkgPT09PT09PT0NCk5vIGhpZ2ggbWlsZXN0b25lIGRlZmVjdHMuDQoNCk5vIG5ldyBp
c3N1ZSBmb3VuZC4NCg0KDQpUaGFua3MsDQpKYXkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9y
ZyA8cWEtYnVpbGQtDQo+IG5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBPbiBC
ZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUNCj4gU2VudDogU2F0dXJkYXksIDQgU2VwdGVtYmVyLCAy
MDIxIDk6MjcgUE0NCj4gVG86IDx5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPiA8eW9jdG9A
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NCj4gQ2M6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbiA8cWEt
YnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+IFN1YmplY3Q6IFtx
YS1idWlsZC1ub3RpZmljYXRpb25dIFFBIG5vdGlmaWNhdGlvbiBmb3IgY29tcGxldGVkIGF1dG9i
dWlsZGVyIGJ1aWxkDQo+ICh5b2N0by0zLjRfTTMucmMxKQ0KPiANCj4gQSBidWlsZCBmbGFnZ2Vk
IGZvciBRQSAoeW9jdG8tMy40X00zLnJjMSkgd2FzIGNvbXBsZXRlZCBvbiB0aGUgYXV0b2J1aWxk
ZXINCj4gYW5kIGlzIGF2YWlsYWJsZSBhdDoNCj4gDQo+IA0KPiAgICAgaHR0cHM6Ly9hdXRvYnVp
bGRlci55b2N0by5pby9wdWIvcmVsZWFzZXMveW9jdG8tMy40X00zLnJjMQ0KPiANCj4gDQo+IEJ1
aWxkIGhhc2ggaW5mb3JtYXRpb246DQo+IA0KPiBiaXRiYWtlOiAwYTExNjk2ZTA4OThjM2M1MTA4
ZTZkN2M1YWQyOGRhNTBlMDBlYTY2DQo+IG1ldGEtYWdsOiA2MDM0NGVmYTdhNTBkYzI1NDhmYzRi
NWQ2OGI1YWQ0ZDYwYzQwMjNhDQo+IG1ldGEtYXJtOiA0NmU4ZmM2YTY3ZWZiY2MzNTdjZjUwN2I5
MDNhM2UzZTEzM2M3OGY3DQo+IG1ldGEtYXdzOiAzMmFlMjA1NjZhMzk0NTRhYjBiYTRjODBjMjNh
MzJlZDdjMTRkY2FmDQo+IG1ldGEtZ3BsdjI6IGYwNGU0MzY5YmY5ZGQzMzg1MTY1MjgxYjlmYTJl
ZDEwNDNiMGU0MDANCj4gbWV0YS1pbnRlbDogY2IxYmYyYmRjMWIyMGY3NmZkZThiMjkxYTEyYjM2
MWE0YmMyNTExZQ0KPiBtZXRhLW1pbmd3OiBmNWQ3NjFjYmQ1Yzk1N2U0NDA1YzVkNDBiMGMyMzZk
MjYzYzkxNmE4DQo+IG1ldGEtb3BlbmVtYmVkZGVkOiAxNTExZTI1Y2VhNjliOThiZjI3Nzg5ODRk
N2E2NDlkYWQ1NTk3ODc4DQo+IG9lY29yZTogZmZiODg2NDk3MzkwZDRkZTI2MzFiZGE2NzFmMmY2
MzFiYzBiYzdiZQ0KPiBwb2t5OiBmMjcyOGQzZWM4YzA1ODllMDJlOWEzY2U3Y2Y4YWNhOTAyY2Fl
MGEzDQo+IA0KPiANCj4gDQo+IFRoaXMgaXMgYW4gYXV0b21hdGVkIG1lc3NhZ2UgZnJvbSB0aGUg
WW9jdG8gUHJvamVjdCBBdXRvYnVpbGRlcg0KPiBHaXQ6IGdpdDovL2dpdC55b2N0b3Byb2plY3Qu
b3JnL3lvY3RvLWF1dG9idWlsZGVyMg0KPiBFbWFpbDogcmljaGFyZC5wdXJkaWVAbGludXhmb3Vu
ZGF0aW9uLm9yZw0KPiANCj4gDQo+IA0KPiANCj4gDQo+IA0KDQo=
