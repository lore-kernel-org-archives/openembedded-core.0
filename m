Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.4133.1626931766543922054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jul 2021 22:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=ZlnvXaXG;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: sangeeta.jain@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="211291265"
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; 
   d="scan'208";a="211291265"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2021 22:29:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; 
   d="scan'208";a="454623817"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga007.jf.intel.com with ESMTP; 21 Jul 2021 22:27:49 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 21 Jul 2021 22:27:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 21 Jul 2021 22:27:48 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 21 Jul 2021 22:27:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kA0f1L8RONInzV8jxDMX/IOtnKbZbFE8XeodbMuQqgLpoYiPuOvfoFVnY57sa0rXmPi9prbd2YixHCnAsolIcOnxxdRPf+lzvh7WDAjnL2Qk7sprC41M6o0tGCeEKBadV/cjmrZZKD5fZu6lBJlOLrqs9+OufhVpbnA+rw4bdknJwC5EhDGzhFhQcbkvzRczyk+LjVQ70vNtT095oV6k45aw8s+876IUWFBPfVKD80J4+sQw9OmtmMsxChihJ4gANjGpVo2z6o87R62a3d25G75V8LUcF/p8myFPoqeZrT68N0lbWEDYFicJcQ3lhEpkrUx8KZE0pYWqZ+TMPk/lPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYF4W/Jqh0LaKGtTYo07K5Wqq95iYj0KsMeThs2LGdE=;
 b=bvYo2Uh4mVCMHKzyCwye/B8CFQJ1pWX/zc0k3glO7IZOipgB4IgouTyGyQPbcSYaUSbf/xnNgVkF25dBMaVv/JYIJKeDBTSQA29TCmvZ04MeSavR4u0QVJa4iEE68HUmeSmmBUwE3/Avcd8+XwGs1sqF+YlYZn4hRg0ZdeUD/rm1Y6/ZUfmHGezTK+RfoJhCc5hcyUiAnIrEnAtOFKVxQXKyCweO7xvLVnVqSIpR7LsfS6Jsr8wPCoSB40rZ08I0A7RTjZQ/gCm03/QDRujzW2gcSNhpb5XZ7c9u7XZa/ORXXwoc3yJrEe3aIZvs7u9EOroqIFjB8F0w/+NfETsKhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYF4W/Jqh0LaKGtTYo07K5Wqq95iYj0KsMeThs2LGdE=;
 b=ZlnvXaXGTPvF9sBlBcJoxCYnkz5v+lDX7xg++1yX6ke0D5qJ31gS3lagUwAZgq+roWfGLt3jRJWykKejH1tuSzq49GVbCErUGExlPK8UfTOvnuntTJfw7hUp6DVMDzeTJEQlhdYtEHnrZTEwGCkmyhvE0DQ7RHhIxsU59OWEfgY=
Received: from DM8PR11MB5608.namprd11.prod.outlook.com (2603:10b6:8:35::5) by
 DM8PR11MB5607.namprd11.prod.outlook.com (2603:10b6:8:28::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25; Thu, 22 Jul 2021 05:27:47 +0000
Received: from DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::419f:4e95:48ef:398d]) by DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::419f:4e95:48ef:398d%3]) with mapi id 15.20.4352.025; Thu, 22 Jul 2021
 05:27:47 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.4_M2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.4_M2.rc1)
Thread-Index: AQHXfhHSHxBhFFyECkWTXZclnPZ59qtOeCdw
Date: Thu, 22 Jul 2021 05:27:47 +0000
Message-ID: <DM8PR11MB5608AA43999853FB9137C259E3E49@DM8PR11MB5608.namprd11.prod.outlook.com>
References: <0d1daf3f2a96b7268274674ea37e310b90255312.camel@linuxfoundation.org>
In-Reply-To: <0d1daf3f2a96b7268274674ea37e310b90255312.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.0.76
dlp-product: dlpe-windows
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4ab4422-2f76-4f1f-c4e6-08d94cd17101
x-ms-traffictypediagnostic: DM8PR11MB5607:
x-microsoft-antispam-prvs: <DM8PR11MB56078B5901C5755C83A0580CE3E49@DM8PR11MB5607.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OasA0X2+N6neHe0QldevPAcBbXIy5I5MVus5u42/T++N7UWtVBSB2RPBa0k9c2G8vS2dMrfLVeKB9WKNcNIIdcMmGPGFREEPgT7ci4keVhXRZm1HWPNt8amjAB56/zIDaUeQMZmf84YoHVjz+j/j0liZcLS4+tjFcr+8JtR8+VGNI/DwNLcRp/jrMEi9E3xxswV9yNAjUCPtLa1BXYd0l4ZkjCrHpmRrwlarR01jYOs0FNy7OlK6xznOt8PqUaAndDjkAPR7AVlYPmUPpvJ6TCf+ZpwH6mY9unaKolVyxCnO7eTl/fRdBNJA+WYeo+1tpF2KQyJ410hilsPX9B22v16TNTyvUYWvNUvqFoqG89W//Mm8sFwfaled1i7Gjjj5AhwKxLb9tJBU2PYvt/cQ5F/RUZqWExxiLIDhIdHrj0mBOx5lVjleU+df7olfYXw+3JOioshbqZ8WWJHN8m8N1Vdtja+JMpiHGr62EN1y0UAJYvz7nS3fsT6GbW7SMKQa8z8W1e3z33crhwBSQhp50Hu7ocq8vWzF+Kq4RoM4XFAu4m7TkVj3HkfDjvZakFPcEumcV8SbTybHdeZQ4BHecYGqH3KTeX4LCtJUFAfJThmvmCbjxe2Qsdmj8GG8aCeuzsyQ/+1BdrNkBzAyFrRG2R2TlCCCDPe+b87F0qANrlLQ0hAmsUw8OMQYVH1TtlCQ9bVTfjkNRGecRKQQLJKSZutocrmibpvOM407iGZuTv49f945fsAuFJEk/bAw9bvEXR5bHXDFj9ZKZZgld5tgOGsbB+tVT6JjaACz6eXS5lzM5coB1w/2QgmEHT0FktACvxQMvf7ArUJvNt1aJUQpZCbfwwa16gfH8DC0oTG6pcA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(966005)(53546011)(6506007)(316002)(86362001)(66446008)(64756008)(122000001)(66946007)(478600001)(76116006)(7696005)(55016002)(83380400001)(26005)(66556008)(66476007)(15650500001)(186003)(71200400001)(33656002)(9686003)(8936002)(5660300002)(110136005)(2906002)(38100700002)(8676002)(52536014)(491001)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TkI5NkVkMitQTGNzVW15U0tqVHpqcUdBQmtyalkwVXpyRTJWdTlUMWhJbFl1?=
 =?utf-8?B?bmd5Rk5XVTl0U081SnFXQXFlNTJreWd2RklqM1I3ajJnc0ZleTB1TDc4NFdZ?=
 =?utf-8?B?V09FRVNhbmtqcFFEV0Uxc2xVSkU3akt6V3NuRUhvRVd4MkIyY1NqMC9kY0xP?=
 =?utf-8?B?emlhd0RtRWIyL0V4b0xKSUlNaVAwYU9TOUc5cHJaN2tuY0F1Vm5aWTBrNXhH?=
 =?utf-8?B?N2xwNFRQeFJCVzVhQy9GZzhFSlllRlRMVU9UWkw4RXFpenovYU9INHE3TjI4?=
 =?utf-8?B?eVVtZm9QVmU0WjdBSk1tWHRhcitoUDNWMkMvM1h4ZUpLSzgvMm4xSFZ5Vm9r?=
 =?utf-8?B?Y25pdndhZ2hYSkZTYzdPUjFmQlhDR3hFeDF6SDlZVzRLUS9ib2luZjJGb1dP?=
 =?utf-8?B?ckZHak52bGN4OFQ5M29qWmEvWGpWRlFuV0Y1SEJZQnAyVkdOWG91Tm9sR1dm?=
 =?utf-8?B?ci9ZaTZYZ1k5ZExBaVJvL3VWclpCeGZiMEJ5VVJGTzBpc29Ddnk4cE55U3hS?=
 =?utf-8?B?K2pJRzZ2bTVFYmpzMVQ3UFBuWGxGTmwyc1gyTndzWCszY0VpYjFWeWFKNWFP?=
 =?utf-8?B?WWY2MmhOZjlkRGtVcDZCaEY2WmZKR2JQbWtZVVZXcW5JNGxXczI5aWNRMnMw?=
 =?utf-8?B?TU1kdzhHTlpvazRIbXhDSzNUQWRFVHFBall6NFNOTVR2NDYvREx2ZHZMTWpW?=
 =?utf-8?B?ZzdGK3BKNkdnaFBDbGZHSXpsb2RnQmY2Rkl0WjJmMHREb0t1MndSZXpaYTZT?=
 =?utf-8?B?eE4vWWxoR2s4dElPOWMrZm5sZ0l1UEtaMFB0NEZMOE1MSUxJK1pTTE1uWk12?=
 =?utf-8?B?bTlGSkRjayttOGdXYUp3U1p2bmV0ZzJqOStkSmR3VlB0aEUwdVBRc3U5MnVp?=
 =?utf-8?B?UDFibnZpNWxJM2hSaVpzeWExODJYcjM5MDlCZjNrSzhBM0gzeVRnRzJvOUNQ?=
 =?utf-8?B?ZEhmRTZHK05XeVhCL3dFQ05iTXhBRzVEMFFrcFJnNzdwN0RtM2JEaWVXbndZ?=
 =?utf-8?B?a3kyWnNuSERiekZYS3ROZ2hYR1paNlJLNVkwQVY2VFFHRk1MOEVka0s2TGZW?=
 =?utf-8?B?eldMakRneXRSZzIyZHMxUklPc3hya0hTWlRqc2U4SlVkUy96dGFLazBTVjcx?=
 =?utf-8?B?cnI3VGh0Z1F1Z3kvcEZKakhhdXZjOFQxc3dpellSVFFFRE1aRFpNa3pGTFpq?=
 =?utf-8?B?b3VaeXJ1K2FEZGlmc3IwWC9acXpFTERhUldtakszTHRTRERzamR4RUQ1Q0Z6?=
 =?utf-8?B?bTFGSjJhcytVaFBkNm1WUjFtZXFUZjFnWEVWRU8zRmlybWNLWVVSbWJZUTdX?=
 =?utf-8?B?d3ZNdkRZZ3lueG5nd0lEMUkxSTk4VHUvVngzMGExZVFQb2orL3FmL0NJWDBQ?=
 =?utf-8?B?TS8yTGRwQkd3eW1wSXo3c0pOaTZIUlBSS2RmY3MrQXdMbEhNSkZDMUdPSnhk?=
 =?utf-8?B?VytiODZ0YnBabGZEcHl5NE1pMFUyZWVIdHhjbCtIYnpiblR6cmdTYVlDdVpX?=
 =?utf-8?B?eFlvTVI5bnJNbEQ5Q2JKbUY2WWpRend2S2pYZVBJVS9WeTBlMHp2ZkU1N3l5?=
 =?utf-8?B?L3NIMDdLQURtcnByWjZ1RzIxd2xBY1diTXFEemFHL3F2QytyemlDTTlIV2sr?=
 =?utf-8?B?ZkdnYUVCU0o5KzFmZ2QweFNnQ3VSVlRyaGJQc2NuMEpXYVFuUGEydENUL1g2?=
 =?utf-8?B?QXRsQkFSdVVmclJ3N3FLNzNKZm9OVnVOVEcwMDVyaUpJcHVURlFuMlZ3cm0w?=
 =?utf-8?Q?+yfKCDzcw7spNHi1HsxiOKvNCs7Q5wmsC2YgJlS?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ab4422-2f76-4f1f-c4e6-08d94cd17101
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2021 05:27:47.6706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O81hPSAK7Ex+8tWU2qm6tcQug3poSnom9ZK8626WVtytOuePdFA82oDEEYBlQvx3UljLoA2JkxeG315hzWpH8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5607
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpJbnRlbCBhbmQgV1IgWVAgUUEgaXMgcGxhbm5pbmcgZm9yIFFBIGV4ZWN1dGlv
biBmb3IgWVAgYnVpbGQgeW9jdG8tMy40X00yLnJjMS4gV2UgYXJlIHBsYW5uaW5nIHRvIGV4ZWN1
dGUgZm9sbG93aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KDQpPRVFBLW1hbnVhbCB0ZXN0cyBm
b3IgZm9sbG93aW5nIG1vZHVsZToNCjEuIE9FLUNvcmUNCjIuIEJTUC1odw0KDQpSdW50aW1lIGF1
dG8gdGVzdCBmb3IgZm9sbG93aW5nIHBsYXRmb3JtczoNCjEuIE1pbm5vd1R1cmJvdCAzMi1iaXQN
CjIuIENvZmZlZSBMYWtlDQozLiBOVUMgNw0KNC4gTlVDIDYNCjUuIEVkZ2Vyb3V0ZXINCjYuIEJl
YWdsZWJvbmUNCg0KRVRBIGZvciBjb21wbGV0aW9uIGlzIG5leHQgTW9uZGF5LCBKdWx5IDI2Lg0K
DQpUaGFua3MsDQpTYW5nZWV0YQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWls
ZC0NCj4gbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBS
aWNoYXJkIFB1cmRpZQ0KPiBTZW50OiBXZWRuZXNkYXksIDIxIEp1bHksIDIwMjEgNToyMiBQTQ0K
PiBUbzogPHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IDx5b2N0b0BsaXN0cy55b2N0b3By
b2plY3Qub3JnPg0KPiBDYzogcWEtYnVpbGQtbm90aWZpY2F0aW9uIDxxYS1idWlsZC1ub3RpZmlj
YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NCj4gU3ViamVjdDogW3FhLWJ1aWxkLW5vdGlm
aWNhdGlvbl0gUUEgbm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0b2J1aWxkZXIgYnVpbGQN
Cj4gKHlvY3RvLTMuNF9NMi5yYzEpDQo+IA0KPiBBIGJ1aWxkIGZsYWdnZWQgZm9yIFFBICh5b2N0
by0zLjRfTTIucmMxKSB3YXMgY29tcGxldGVkIG9uIHRoZSBhdXRvYnVpbGRlcg0KPiBhbmQgaXMg
YXZhaWxhYmxlIGF0Og0KPiANCj4gDQo+ICAgICBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvLmlv
L3B1Yi9yZWxlYXNlcy95b2N0by0zLjRfTTIucmMxDQo+IA0KPiANCj4gQnVpbGQgaGFzaCBpbmZv
cm1hdGlvbjoNCj4gDQo+IGJpdGJha2U6IDEzZTI4NTViZmY2YTZlYWQ2ZGJkMzNjNWJlNGI5ODhh
YWZjZDRhZmENCj4gbWV0YS1hcm06IDllZmEzYjU2ODNhNWRkN2ViYmY2M2ZmMzFiODg5ZWQ1ODlm
ZjdhOWENCj4gbWV0YS1ncGx2MjogYjNmYTI2YmM3NzdlYzAxMzZjZTE4OWQ5MDEyM2I1MGY2ZWU1
NjdiOQ0KPiBtZXRhLWludGVsOiA5NGMwOTdhODJjZjkxNjdmYTU2N2MyYWY4MGQ1ZTM5YTNmYmJj
MTFmDQo+IG1ldGEtbWluZ3c6IDhmM2I2ZTM3NzI4NzlkYzJjYWVjOGZlMjQ5Y2UyNzdmYmIxYWE1
NWYNCj4gb2Vjb3JlOiBjNGZjMjI2YzJlMzg1NmI5NDJiYjRmNTdlYWQyMWE2NGMzZGM4YzBkDQo+
IHBva3k6IDFhZDc5MzEzYTVjM2U2YTQ1M2ZiZWI0NGNhYWM1YzViYmFkNDZkM2MNCj4gDQo+IA0K
PiBbUlAgc2VuZGluZyBtYW51YWxseSBhcyB0aGUgb3JpZ2luYWwgZmFpbGVkIHRvIGdldCB0aHJv
dWdoXSBUaGlzIGlzIGFuIGF1dG9tYXRlZA0KPiBtZXNzYWdlIGZyb20gdGhlIFlvY3RvIFByb2pl
Y3QgQXV0b2J1aWxkZXINCj4gR2l0OiBnaXQ6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy95b2N0by1h
dXRvYnVpbGRlcjINCj4gRW1haWw6IHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcN
Cj4gDQo+IA0KPiANCj4gDQo+IA0KPiANCg0K
