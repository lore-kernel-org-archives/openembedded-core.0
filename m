Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.16.1615590948654292892
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 15:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=O6v6BiIu;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: DQVd83BqpBM772eZOdjI7vpprX6E3MvmXbLGk2zIcY3nzm6eojucYQXzA3Eyg/CKxANbDzXzHk
 R4/TXRGO00kg==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="188266972"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; 
   d="scan'208";a="188266972"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 15:15:47 -0800
IronPort-SDR: 9Qk7U7NeaeVNO9yisrKz+HLZtb/0ZvQKZpbcRYtvUE/2YtYRwSy/PidY0EemQeP3SG/DwOJct8
 ke3883wWg9ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; 
   d="scan'208";a="411168540"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga008.jf.intel.com with ESMTP; 12 Mar 2021 15:15:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 12 Mar 2021 15:15:46 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 12 Mar 2021 15:15:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Fri, 12 Mar 2021 15:15:45 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Fri, 12 Mar 2021 15:15:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmVnEaLh+truZVnlVQi30s7k4MGBg8k4SZBgeYGjJbo8CB4Dub4kIhUlaaqQdefHNTTrdcyWJ5iHsxBYlRApqFIEkxYJ0hnT16/Pe8psb0vh1tCljb5anNXDeLPbldHF60XFCIYBCTpgEDKWo4PjxPbwt7p2A0AeiGTq/rJv7hYFwLwx5Po3yFePTrf6T0lhV8LPrZYAJeIrdFbHvBi6Qg9CcIK3f5XNpUUuC6mcSU8xet7kdxwC0XtpOMq3XLiAc13ZQKk/eGO9MFZG3L7R4YJI4TjHLDDzwHkDBdec8HHFEZbeFIntG7wG4Vy7dD3lWl6sJ0d1HAN3/ChuG/nKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lttAUWNj4mvHzt6E0dHOzOmOaKMeF3WyKp2jbHjw5LU=;
 b=JeH1bHhbWEKOuf62jnPEze0ln5I2qtTbR9liG/5Zi4gxgv0JTk/OZZV28+yrxuh2HJectt5jVLAqLdNtVrCYlIOYAyBF+ZVb0gmqwjZhhiaAExqmnYPBUUP6Dkgg9lBPMZefTofcTvEmH2Kc1VBpa8OZTC0TJMsb4zPBc/mCCqamacSiFCKDNNHiCkVx6o0EKHuypm3cygGqsVJxZb8lE293CwYwag78Uqqga3QKLCXRNo+wWGb3JOCbFDEinvbw0AlE03trIApj7sF2JBLI4Mq6UmY0xEEEo5mP/pUt/UQl6fSjbmzaORA7k3PznQasX3rMlHJfr3st+iofjEwu4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lttAUWNj4mvHzt6E0dHOzOmOaKMeF3WyKp2jbHjw5LU=;
 b=O6v6BiIuq0fYZo2B9APETiEU4HUFelDe8soZnE/dQrfrSOH7hJmAqxBiJU2D+V134TFkTyQbL1l3IixdhLKf75PQuh44P6Lubx/ZFUe5juf8Mjjn2v5SDLobsnGgv9zpbiyyqBNgCSdQxvVw8b1vsAkqFkeYIi5JP6PspYipv5U=
Received: from MWHPR11MB1326.namprd11.prod.outlook.com (2603:10b6:300:21::7)
 by MWHPR11MB1774.namprd11.prod.outlook.com (2603:10b6:300:10a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 12 Mar
 2021 23:15:41 +0000
Received: from MWHPR11MB1326.namprd11.prod.outlook.com
 ([fe80::e1c6:f0ea:ea3b:56ca]) by MWHPR11MB1326.namprd11.prod.outlook.com
 ([fe80::e1c6:f0ea:ea3b:56ca%11]) with mapi id 15.20.3933.032; Fri, 12 Mar
 2021 23:15:41 +0000
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
Thread-Topic: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
Thread-Index: AQHXFoo+3Jx9lAFlFU2WCuYh10gx96p/dvgAgAFImACAAD2n0A==
Date: Fri, 12 Mar 2021 23:15:41 +0000
Message-ID: <MWHPR11MB1326447A6A6AA12D09952A56DE6F9@MWHPR11MB1326.namprd11.prod.outlook.com>
References: <20210311152128.41215-1-khairul.rohaizzat.jamaluddin@intel.com>
 <CAMKF1spX6z9vvv7QNbWhkapX-Z1=FWZVh0W2+OM2qSbxPqQgkQ@mail.gmail.com>
 <DM5PR11MB1322590C6E8F9272ECC912CFDE6F9@DM5PR11MB1322.namprd11.prod.outlook.com>
In-Reply-To: <DM5PR11MB1322590C6E8F9272ECC912CFDE6F9@DM5PR11MB1322.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [113.210.54.148]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd75869a-5a3e-4a45-09e4-08d8e5acc184
x-ms-traffictypediagnostic: MWHPR11MB1774:
x-microsoft-antispam-prvs: <MWHPR11MB1774DE58E70237FAED44FA51DE6F9@MWHPR11MB1774.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qlga6eXQOEswfVrwdS7a3zhteUsMFxORA+jZf5m6qJF7lOFJVoDZ6+bOptoOu7+VpeE6S6ITgDRScuNmfWjc2FbJKlLsNOz4rmdpm+u8wsk6vqPhKXkNkxFa+Vnq7HXU8X1nG+ITq/zhipIV1aXiIAz2WZkUxh3yaC+az96MBrGkpScFh+5ZhaRwd0KdxmOsPp9qigiTmGHnEsvvyhNQVGyDESVah8f3RweZ9T6NlujEhDJBRhQfe6uJYEuDyRxZvLPLnhBZWKhxR0KnsuopS9dPtQMPYBjhjwpkqur/OYnQMHsZ8ZDHwtkEHknWDA4MLsIENL6d/JF8wQm/qY9nUj/JDZtik0grM/WuWJKVoZaYJnSC1pUE/rnpyDx8yUBBP9MlJkna33efo7+C/cVndvdH488DF4ILykvipeDjaaeNicD/Im8nRtD8ePneooDazkIfnN6z/XVXar1a7duAJiNozHkVAHAvcejEIA1mubkyYvkbyC/Rxv70izL+T9W48XWdYlJNStZJStEUS7WP/W699+w0tEEjPpJ/4DiklZGU7ZapkmBQAVt0Zd1odmA7mrSb55153wzQcXh6oByutTykUzOOfXVJA+fxPbcDb1Jv7XJlq4kYSgGutoDZP1Xjuu2iM6edLEGhhc9ltRcmVQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1326.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(366004)(396003)(136003)(376002)(478600001)(71200400001)(83380400001)(2906002)(316002)(186003)(66446008)(64756008)(66476007)(66556008)(8936002)(7696005)(66946007)(53546011)(6506007)(9686003)(55016002)(26005)(76116006)(86362001)(4326008)(52536014)(33656002)(8676002)(5660300002)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?REZiMHNDMlRFWTcrMWZHZldLeitobnczREFDZ3JLRjZETE1RNFg3MDNBMWR2?=
 =?utf-8?B?d28yRmV2RVA2RER3ZVB6VGpxQVZDUis3STEwZ1Y1dSt3Z1JTeEZ0KzZhcm5F?=
 =?utf-8?B?Ui9XSStHaTRwSnpMdnpNYUdMbTRRZkp5Ymt3L3hma09qekxoZkFzTmJMWUxT?=
 =?utf-8?B?bGZGcC93YStJWFQzNGlla3NUV2J0SHBsU1d2VjQ1UlVzbkJDRFNReTZ5UDVz?=
 =?utf-8?B?RGRtN3NrdHBDMThIMzRmUWxtSkh0S1E0YU5JQWtlTlFibFJiT295Qk9tS3lY?=
 =?utf-8?B?RVI5QUhjR0xEMjgxaWhSQXAvR0xHclA5VHNqaEtOd0lnMkxFNEE4RExuL01T?=
 =?utf-8?B?R0FQTmdORFN6dDZwQjZYam9DQ0N0a1k3QWdvV3BvYmVJckhhdlpDTzBRSU9N?=
 =?utf-8?B?QTA2VXd5ZFVpUWxHNHU0MWQrZjRQUTZIYWlyM0FUd3Y1U3NJVXFHNnpMbnlu?=
 =?utf-8?B?ZXdKQXNGQnU5cFdCWDRGTXJXRGRDeGVjc04wYzF4aGsxVGJGQnRocWhUNXVX?=
 =?utf-8?B?Y3NxUWcvOEtKM3BFbVF2VGtISmRidXRESHNuSG1QWEhpdkRudHJIWkFjM2FX?=
 =?utf-8?B?anBmMFBSNHJybXJFNkRlcVlxeHV3S1I2VXJaLy9yamlOV3pIWE5Gak1hdW5S?=
 =?utf-8?B?Rk9XekJjK1o4Vy80S3JYdmk5V1hCMzFDa1VJYTM0NE5HRWVhMVdLUG55Z0kz?=
 =?utf-8?B?YkFrajFKVFY3cEtBajk3aWtCcklDNVNaWDBhbVZ0ejNRdVJ4UWVkTFFrNGxM?=
 =?utf-8?B?djJQTUVySXVSVUd4U09heWFnRmNwR3JBRnJWU2FKdGJqeGRuZU5QemhmanBF?=
 =?utf-8?B?WmdXWjlmekxScmFiM1hzNm03bUZDVjBIZllVUndKZ3dSVzRQVVVwTDZSM2k1?=
 =?utf-8?B?UGFCWGpSazZ2bE14OFloblZqRG5NamlLeHNucmdXZVFiUWpOM1FVOUNkMDZ1?=
 =?utf-8?B?dndhNWxCT0Z5cnBHRnBZVm1VTG13dE9aMVBENlJGWEUzdlJXcUk0bWZrMy9v?=
 =?utf-8?B?bVVEdDRzZjFKUTlaTkdxSGprdGwyNjZQRkhrbkJBTUN4QjNTNnlub0tEM1ZM?=
 =?utf-8?B?RGRKVkJyc1lsb2dYa2xxMHlBQUZ5R2FDeWtGZHdwY3M4bndzNHZCVEFsZUNV?=
 =?utf-8?B?OG9CWmhsUUtpeTVzVDdtN3JTaFBMU3ZqOHVGQzBIRWNCc0JIQklCYlZxODlo?=
 =?utf-8?B?ZWh6eE5ySGp3d2o3Q2laSEZnUmxsVFl6cGdoQzB4blo0R1dUNHNpRUpEMHlO?=
 =?utf-8?B?dnN4OWdXZ1FKdDBaTk9ORjNXb0FJMERCV2xFY0xDY2hpZzdWdjJDdklvNFZ0?=
 =?utf-8?B?S1k3RkRaeVdYdzZTYVMzbXFkU3I0V3piQXorNDRaMnlkZDl4cExaMzJDNXpy?=
 =?utf-8?B?clpFUnlQUlpDNUhPTThuVlFIN2ZET3hKQWhEMnNCd0lJRXVndzVBcGFISjdl?=
 =?utf-8?B?aVVjcE51U0N0SU9DR2lMckdwcS9iMFFiQnl5cWpXRm10bnRtVDVUY0tNMFFM?=
 =?utf-8?B?Rjd6Y291OVk0eTAyc3NxMTJiTU5jd3JDY1JEbHZhcmo1OEhkcFpwMTA4TElS?=
 =?utf-8?B?R21oMU0vMTVNcVMxR2N6MlhJR3ltUDVnSm5heXBNRjRCejRXbnVkYTBFSzQz?=
 =?utf-8?B?L2FNNk5rMHErVHJMTGlacGhiZUlKMk9MQUxzbFpSN2N1UzFYOUVHYzJuVGtO?=
 =?utf-8?B?ejZyVmd6Vy96TTE2MGZCUU5BMC85WGxMRHAwbmtZRmx6MzBqRi9GUkhBU3Ix?=
 =?utf-8?Q?n7baBeD6TNtegX2eM2efpmZOL4m7LeK4n6esz5w?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1326.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd75869a-5a3e-4a45-09e4-08d8e5acc184
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 23:15:41.5757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6wlOUSbnMFXsb3O9VcFz+Roo4t+4PE8cZqCbIYyWc982HAv3Q1KelPlTp8K5exkfPHreQHqJWPegS/7pAaA4m6ZugRDBUqUU3CjnEl4GU51hIYoqM8x8YbxOP7pVuJBx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1774
Return-Path: khairul.rohaizzat.jamaluddin@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SnVzdCBkaWQgc29tZSBjaGVja2luZyBmb3IgdmVyc2lvbnMgZ2xpYmMtMi4zMSBhbmQgZ2xpYmMt
Mi4zMiAodXNlZCBpbiBkdW5mZWxsIGFuZCBnYXRlc2dhcnRoIHJlc3BlY3RpdmVseSksIGJvdGgg
b2YgdGhlc2UgdmVyc2lvbnMgY2Fubm90IHVzZSB0aGlzIHBhdGNoIGFzIHRoZXNlIHZlcnNpb25z
IGRvZXNuJ3QgaGF2ZSB0aGUgZmlsZSBpbnZvbHZlZCwgbmV0Z3JvdXBjYWNoZS5jDQoNCg0KVGhh
bmsgeW91ICYgS2luZCByZWdhcmRzLA0KS2hhaXJ1bA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogSmFtYWx1ZGRpbiwgS2hhaXJ1bCBSb2hhaXp6YXQgDQpTZW50OiBTYXR1cmRh
eSwgTWFyY2ggMTMsIDIwMjEgMzozNCBBTQ0KVG86IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+DQpDYzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXIg
PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0OiBSRTog
W09FLWNvcmVdIFtQQVRDSF0gZ2xpYmM6IEZpeCBDVkUtMjAyMS0yNzY0NQ0KDQpZZXMsIHNlZW1z
IHRvIGJlIGluIHRoZSBsaXN0IGFzIHdlbGwuLg0KVGhlIHZlcnNpb24gZm9yIGJvdGggYnJhbmNo
IGlzIHdpdGhpbiB0aGUgdmVyc2lvbnMgbWVudGlvbmVkIGluIHRoZSBDVkUgdG9vLg0KDQoNClRo
YW5rIHlvdSAmIEtpbmQgcmVnYXJkcywNCktoYWlydWwNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBLaGVt
IFJhag0KU2VudDogRnJpZGF5LCBNYXJjaCAxMiwgMjAyMSA3OjU2IEFNDQpUbzogSmFtYWx1ZGRp
biwgS2hhaXJ1bCBSb2hhaXp6YXQgPGtoYWlydWwucm9oYWl6emF0LmphbWFsdWRkaW5AaW50ZWwu
Y29tPg0KQ2M6IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVy
IDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KU3ViamVjdDogUmU6
IFtPRS1jb3JlXSBbUEFUQ0hdIGdsaWJjOiBGaXggQ1ZFLTIwMjEtMjc2NDUNCg0KT24gVGh1LCBN
YXIgMTEsIDIwMjEgYXQgNzoyMSBBTSBKYW1hbHVkZGluLCBLaGFpcnVsIFJvaGFpenphdCA8a2hh
aXJ1bC5yb2hhaXp6YXQuamFtYWx1ZGRpbkBpbnRlbC5jb20+IHdyb3RlOg0KPg0KPiBGcm9tOiBL
aGFpcnVsIFJvaGFpenphdCBKYW1hbHVkZGluDQo+IDxraGFpcnVsLnJvaGFpenphdC5qYW1hbHVk
ZGluQGludGVsLmNvbT4NCj4NCj4gQ1ZFOg0KPiBDVkUtMjAyMS0yNzY0NQ0KPg0KDQpsZ3RtLiBE
byB3ZSBuZWVkIGl0IGZvciBkdW5mZWxsIGFuZCBnYXRlc2dhcnRoIGFzIHdlbGwgPw0KDQo+IFNp
Z25lZC1vZmYtYnk6IEtoYWlydWwgUm9oYWl6emF0IEphbWFsdWRkaW4gDQo+IDxraGFpcnVsLnJv
aGFpenphdC5qYW1hbHVkZGluQGludGVsLmNvbT4NCj4gLS0tDQo+ICAuLi4vZ2xpYmMvZ2xpYmMv
Q1ZFLTIwMjEtMjc2NDUucGF0Y2ggICAgICAgICAgfCA1MSArKysrKysrKysrKysrKysrKysrDQo+
ICBtZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliY18yLjMzLmJiICAgICAgICAgfCAgMSArDQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliYy9DVkUtMjAyMS0yNzY0NS5wYXRjaA0KPg0K
PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmMvQ1ZFLTIwMjEtMjc2
NDUucGF0Y2gNCj4gYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliYy9DVkUtMjAyMS0yNzY0
NS5wYXRjaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi4yNmM1
YzBkMmE5DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMv
Z2xpYmMvQ1ZFLTIwMjEtMjc2NDUucGF0Y2gNCj4gQEAgLTAsMCArMSw1MSBAQA0KPiArRnJvbSBk
Y2E1NjU4ODZiNWU4YmQ3OTY2ZTE1ZjBjYTQyZWU1Y2ZmNjg2NjczIE1vbiBTZXAgMTcgMDA6MDA6
MDANCj4gKzIwMDENCj4gK0Zyb206IERKIERlbG9yaWUgPGRqQHJlZGhhdC5jb20+DQo+ICtEYXRl
OiBUaHUsIDI1IEZlYiAyMDIxIDE2OjA4OjIxIC0wNTAwDQo+ICtTdWJqZWN0OiBbUEFUQ0hdIG5z
Y2Q6IEZpeCBkb3VibGUgZnJlZSBpbiBuZXRncm91cGNhY2hlIFtCWiAjMjc0NjJdDQo+ICsNCj4g
K0luIGNvbW1pdCA3NDU2NjRiZDc5OGVjOGZkNTA0Mzg2MDU5NDhlZWE1OTQxNzlmYmExIGEgdXNl
LWFmdGVyLWZyZWUgDQo+ICt3YXMgZml4ZWQsIGJ1dCB0aGlzIGxlZCB0byBhbiBvY2Nhc2lvbmFs
IGRvdWJsZS1mcmVlLiAgVGhpcyBwYXRjaCANCj4gK3RyYWNrcyB0aGUgImxpdmUiIGFsbG9jYXRp
b24gYmV0dGVyLg0KPiArDQo+ICtUZXN0ZWQgbWFudWFsbHkgYnkgYSB0aGlyZCBwYXJ0eS4NCj4g
Kw0KPiArUmVsYXRlZDogUkhCWiAxOTI3ODc3DQo+ICsNCj4gK1Jldmlld2VkLWJ5OiBTaWRkaGVz
aCBQb3lhcmVrYXIgPHNpZGRoZXNoQHNvdXJjZXdhcmUub3JnPg0KPiArUmV2aWV3ZWQtYnk6IENh
cmxvcyBPJ0RvbmVsbCA8Y2FybG9zQHJlZGhhdC5jb20+DQo+ICsNCj4gK1Vwc3RyZWFtLVN0YXR1
czogQmFja3BvcnQNCj4gK1todHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1nbGliYy5naXQ7
YT1jb21taXQ7aD1kY2E1NjU4ODZiNWU4YmQ3OQ0KPiArNjZlMTVmMGNhNDJlZTVjZmY2ODY2NzNd
DQo+ICsNCj4gK0NWRTogQ1ZFLTIwMjEtMjc2NDUNCj4gKw0KPiArUmV2aWV3ZWQtYnk6IENhcmxv
cyBPJ0RvbmVsbCA8Y2FybG9zQHJlZGhhdC5jb20+DQo+ICtTaWduZWQtb2ZmLWJ5OiBLaGFpcnVs
IFJvaGFpenphdCBKYW1hbHVkZGluIA0KPiArPGtoYWlydWwucm9oYWl6emF0LmphbWFsdWRkaW5A
aW50ZWwuY29tPg0KPiArLS0tDQo+ICsgbnNjZC9uZXRncm91cGNhY2hlLmMgfCA0ICsrLS0NCj4g
KyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiArDQo+
ICtkaWZmIC0tZ2l0IGEvbnNjZC9uZXRncm91cGNhY2hlLmMgYi9uc2NkL25ldGdyb3VwY2FjaGUu
YyBpbmRleCANCj4gK2RiYTZjZWVjMWIuLmFkMmRhZGRhZmQgMTAwNjQ0DQo+ICstLS0gYS9uc2Nk
L25ldGdyb3VwY2FjaGUuYw0KPiArKysrIGIvbnNjZC9uZXRncm91cGNhY2hlLmMNCj4gK0BAIC0y
NDgsNyArMjQ4LDcgQEAgYWRkZ2V0bmV0Z3JlbnRYIChzdHJ1Y3QgZGF0YWJhc2VfZHluICpkYiwg
aW50IGZkLCByZXF1ZXN0X2hlYWRlciAqcmVxLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA6IE5VTEwpOw0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBuZG9tYWluID0gKG5kb21haW4gPyBuZXdidWYgKyBuZG9tYWluZGlmZg0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogTlVMTCk7DQo+
ICstICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJ1ZmZlciA9IG5ld2J1ZjsNCj4g
KysgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKnRvZnJlZXAgPSBidWZmZXIgPSBu
ZXdidWY7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9DQo+ICsNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuaG9zdCA9IG1lbWNweSAoYnVmZmVyICsgYnVm
dXNlZCwgQEANCj4gKy0zMTksNyArMzE5LDcgQEAgYWRkZ2V0bmV0Z3JlbnRYIChzdHJ1Y3QgZGF0
YWJhc2VfZHluICpkYiwgaW50IGZkLCByZXF1ZXN0X2hlYWRlciAqcmVxLA0KPiArICAgICAgICAg
ICAgICAgICAgIGVsc2UgaWYgKHN0YXR1cyA9PSBOU1NfU1RBVFVTX1RSWUFHQUlOICYmIGUgPT0g
RVJBTkdFKQ0KPiArICAgICAgICAgICAgICAgICAgICAgew0KPiArICAgICAgICAgICAgICAgICAg
ICAgICBidWZsZW4gKj0gMjsNCj4gKy0gICAgICAgICAgICAgICAgICAgICAgYnVmZmVyID0geHJl
YWxsb2MgKGJ1ZmZlciwgYnVmbGVuKTsNCj4gKysgICAgICAgICAgICAgICAgICAgICAgKnRvZnJl
ZXAgPSBidWZmZXIgPSB4cmVhbGxvYyAoYnVmZmVyLCBidWZsZW4pOw0KPiArICAgICAgICAgICAg
ICAgICAgICAgfQ0KPiArICAgICAgICAgICAgICAgICAgIGVsc2UgaWYgKHN0YXR1cyA9PSBOU1Nf
U1RBVFVTX1JFVFVSTg0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIHx8IHN0YXR1cyA9
PSBOU1NfU1RBVFVTX05PVEZPVU5EDQo+ICstLQ0KPiArMi4yNy4wDQo+ICsNCj4gZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIuMzMuYmINCj4gYi9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliYy9nbGliY18yLjMzLmJiDQo+IGluZGV4IGM0NzgyNmE1MWUuLmQwYTI5MDgy
MmIgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIuMzMuYmIN
Cj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi4zMy5iYg0KPiBAQCAtNDUs
NiArNDUsNyBAQCBTUkNfVVJJID0gICIke0dMSUJDX0dJVF9VUkl9O2JyYW5jaD0ke1NSQ0JSQU5D
SH07bmFtZT1nbGliYyBcDQo+ICAgICAgICAgICAgIGZpbGU6Ly8wMDMwLXBvd2VycGMtRG8tbm90
LWFzay1jb21waWxlci1mb3ItZmluZGluZy1hcmNoLnBhdGNoIFwNCj4gICAgICAgICAgICAgDQo+
IGZpbGU6Ly8wMDMxLXg4Ni1SZXF1aXJlLWZ1bGwtSVNBLXN1cHBvcnQtZm9yLXg4Ni02NC1sZXZl
bC1tYXJrZXIucGF0Y2ggDQo+IFwNCj4gICAgICAgICAgICAgDQo+IGZpbGU6Ly8wMDMyLXN0cmlu
Zy1Xb3JrLWFyb3VuZC1HQ0MtUFItOTg1MTItaW4tcmF3bWVtY2hyLnBhdGNoIFwNCj4gKyAgICAg
ICAgICAgZmlsZTovL0NWRS0yMDIxLTI3NjQ1LnBhdGNoIFwNCj4gICAgICAgICAgICAgIg0KPiAg
UyA9ICIke1dPUktESVJ9L2dpdCINCj4gIEIgPSAiJHtXT1JLRElSfS9idWlsZC0ke1RBUkdFVF9T
WVN9Ig0KPiAtLQ0KPiAyLjI5LjANCj4NCj4NCj4gDQo+DQo=
