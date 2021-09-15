Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.1574.1631668509547250259
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 18:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=Ek/JyTuz;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="244534985"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="244534985"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 18:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="583059932"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga004.jf.intel.com with ESMTP; 14 Sep 2021 18:15:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 18:15:08 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 18:15:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 14 Sep 2021 18:15:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 14 Sep 2021 18:15:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hm19sYssr+eegL/ULdi/9tDfXSDn2B03ILu3hmbHGOlzgW+jcvthJuixdmugky6vnariD8ObpzLPURXtDXXd71zB+1vj6i/tLiC4H++zctBI505trGwRitJaj7kwbfCzAOpbHinE76iw81QmBbmo4HcJv0MpjO+CB7YrxD6blKbxed7BT208P/7CRTjTdOsaezrPgFKMcJUpu0YfwqdYpnbbu/dvRzk347K5psTxVchOnnZPELsier79F72hAykiWr3p5fEmoGyI3QKmqLHTqqhShaOxKbRkGp5aWIukhTSioqOWkRjqazAD8GT6jvNi4uN7I4Ro0fG2q/i1+gwRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=KMGV4kmVcB8vPE45LTJrLO5lun/kHnWG/t4iqQG7UTE=;
 b=k9/zTqTyh4PUPqIHmXW1OzGIng/PhSZJ0hy4SbbB1VPWQ+PSpLei0I/fMcXRM6E+oqKdu/EjKFuIbAL+s58k/TXqhiBg8yKO/0dlUBar1oFV0QlnfHmD+aAYap/S+chZk7CamuZhzjVQwhmyeUgytlnVhtZw9+5O0Ivgl6XhfpBUhmFTd7bj8Ig9cMW5LMdykuJDxartzPmVkoJJ3Xxv+8kgVkxywB2MndbEiZb+IDlXGMnd35xRzzs64QN3VEr01+rTxZff9aZQydBTeLp4hd1jdX6aFcLWLKApvheiCK4XmPNxfr4u7Skwmb1RCmnfYxTToDWPy3MlREEktbHnAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMGV4kmVcB8vPE45LTJrLO5lun/kHnWG/t4iqQG7UTE=;
 b=Ek/JyTuzfrLW4+nW8Ry9RJ0MaTmtL26nA+RxE1C+dfeZwo6qo7rmyBvXTtAEdtvM3eEk3/ktq7KmULYZXBZUeHwv3gNy1ARcI0U7+b+ZHC2VwSSIY6V0TMpFxqzJYq12v3DYazLjzk7SEeY+jMPCT709J6JS5ojPgSXPrtiaPxQ=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB3623.namprd11.prod.outlook.com (2603:10b6:a03:b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 01:15:00 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be%3]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 01:15:00 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "steve@sakoman.com"
	<steve@sakoman.com>
Subject: Re: [OE-core] [PATCH] [master] [dunfell] [hardknott] Revert "db: update CVE_PRODUCT"
Thread-Topic: [OE-core] [PATCH] [master] [dunfell] [hardknott] Revert "db:
 update CVE_PRODUCT"
Thread-Index: AQHXqZMc/sJfTQF8e0KV5NS3r+BYVqukSw2A
Date: Wed, 15 Sep 2021 01:15:00 +0000
Message-ID: <af688aaba4eb2333f7c5bd3861151914220fe840.camel@intel.com>
References: <20210914180345.163507-1-steve@sakoman.com>
In-Reply-To: <20210914180345.163507-1-steve@sakoman.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bdb43fc-5f2d-4cc5-a427-08d977e63d4b
x-ms-traffictypediagnostic: BYAPR11MB3623:
x-microsoft-antispam-prvs: <BYAPR11MB3623B338CFCA7D507BE6E20DF8DB9@BYAPR11MB3623.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OruGWK25XR+iaohzim4eElPwYo/coqkwd5Px64fSSEvQNk2d0PydQtE7kuR2npCMpT09VKUtvht9GJB4cGSqWGPfD7LJ84bHvFhcDxJgX4wCWun1Wp8QT0ukXbMUUZNaisQmbWUmvykQaVR2FXK6ElO18UBsUso9DtAGKegx57fZgr0z3u+F9+ztFVb1W7l1bNaktyncbc6yiuGBpRDgOJrJftvOOs8kSQy1PYzR5YPb6JDDxlGLLTY1FXe925tbI1jpTXeAAsX68buuqeJCthAzsfgt8ABxkdAgg89N6eU57txlSiQWpadGqkt3CbM0tct2TIoLncagraKb7ItCVnObfo/I1mX+G7R8V9dH1dqWNZZLJfT3PIurvSq9Hfhye2qyHtDob3JO+fJFmsHdgsRRPCjRaJh44hKvfpIUdEIqRaKyPejnyPywVUFbtWsoCB2TXMQDtNIyRpG5QqCc6K5AYI90t2STpXeSJy1FBe36015DMVL3QIb4QzQyqq09yUg8BMWSKr00srJxZVzYzNCrR1c+keu/fS3pCwS293AuLgMF5KdGohEZZR4nc0noD34z4ffTM7m3p7ReNKlJgEUa5uQ8YHB7/ivBuxsJVpBPaPV/jJKRziXACP9BXdb2vPNoeNKBDLYXhcxqQ/KN7NoDmLg7CaLPfWpv6NKS7bGNnVONUS2TSCSPZSC7CasqFz5qEnT5ZjMBO60gKdTAXauTvbP7I1MtsCAGrbxqmE68xpJrbbsRt8uIekNxGpsTuduJMFBLG13mZrWq1LlBo/7ssPAXu0xIwYu2WameJFYcZhmhRhQ3C5gXNzuXhjodWuyVPNWrEv8ZuTICHG7WqQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(6506007)(6486002)(71200400001)(15650500001)(6512007)(186003)(316002)(110136005)(38070700005)(8936002)(38100700002)(26005)(122000001)(83380400001)(478600001)(66556008)(966005)(2616005)(91956017)(76116006)(86362001)(5660300002)(2906002)(66946007)(66476007)(64756008)(36756003)(8676002)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWJJVVpwTkcyUnBaZUlySnI5NVZaQVV4TUgzZzR4MklaZGFOQXp3aEJyWWR0?=
 =?utf-8?B?ZHduYVJldTRQSCtVN3VKYW9MZURZb29FcUw1V0thWTNPYm9WelJYSGVFU0JY?=
 =?utf-8?B?aGZRdmtlczE1SGJtQlNHb292N2hYajU4bmtoNVBocnI5dnBSMlgya3ZDYTZM?=
 =?utf-8?B?NWhDOGVyN3JXcDdiQUloWUR2TklPZ01UT0ZZL0pUTWVkd2RmTGZvSlVEUGp2?=
 =?utf-8?B?QUlOOGRUTjk4bkY3UlJVWS85MGEyem4rclRnT2piWVpuUUVsRG10Mk5TYUkz?=
 =?utf-8?B?Z0JVbkhjQlNPVjZiWENTNVBsRkpNZTFaOU9pNTFLbjhPU281WDNXeXY1M0FI?=
 =?utf-8?B?clN5OWJvRmNFeTFYTG9QQWI3bExQL3AzeGNyMC96WGlKUzZ5b3ZhbTJNVDRO?=
 =?utf-8?B?N0QwazUzZFJ5RUZ4d1NTRklWSzlxV0ZITEhOWnJSTk95aVZYMzdsZWcxYThK?=
 =?utf-8?B?cStLSjRBS0phMnJsUmRRQk1TSnBIUDk5RVVWOW9TaEZEY0NmR3RMOHhhcnVs?=
 =?utf-8?B?UnNwNXdGRXd4c1p0VWp5V21oUWswOVU3MG1CTGxtOG0wSE1iMHVZamkxdTZs?=
 =?utf-8?B?SDRsazB2a0E2UnJrVFo3Z3hvWGQ1QTJDeTZoOVp1bC9HSGc1bFYzUVJzbU1G?=
 =?utf-8?B?VmErMkxCaDJsODRZNzNwWnJUbjZuaGZuUHRWTDRYbzhpZjgwakdoYnlWYmRi?=
 =?utf-8?B?NjV5N1BxeDZWUEFNYUJjOU9TNTVGdzFVOUFYempWaGFENzl2TFJaZ3VOU3Zw?=
 =?utf-8?B?YlVZa2Z2QkdZVGVYOTlQaXM4eXA0NDZkYjlJVC9KMFlOM0hlZ0M5YmdibFFh?=
 =?utf-8?B?blRmWnFUUUo3MFJ3cEpDSlErRk5Vc3NGSDlCemNKZTVZZC9tNkMyb1JaR3Jx?=
 =?utf-8?B?TXloTGlNdVNJRkRNMG9WTm5aNnZOUlBaSWpINFAwNFBtT1FNRVdyVzJEbHFw?=
 =?utf-8?B?N1B2VFE3SmoxTVNKb3VwMGJVN0crS01BcTdhRXdvTnRlV0U2Z2gxMW4wVGow?=
 =?utf-8?B?b1RIMisyMURIMFNYVjBvb1E3UHV1YzFNYzN4eVFvOEYzalV0bFZrTC9mb3hy?=
 =?utf-8?B?WndOb1JRaHowdFhHY2lxQ0VOUDg1cEpEQ1dQeVBXRmFHcnBpTzZkeHpwT2FI?=
 =?utf-8?B?R1IwRXhUeHdHc0l1RXpFSXN6cGpybFFCZ3ZQTWtsUEx6REpYTXpzSmR6YWpa?=
 =?utf-8?B?eVN4K0QvN0pXTC94UkRNeFVvcWZabzdEMHM1N1RydU1saE52NVBzK3VxbDJX?=
 =?utf-8?B?WURZZnFxWFMzdTlNS0huWUJmc1FsUVU0K0xpcW1jODlneWd5UHlWV1F0bzNW?=
 =?utf-8?B?R0tTODFGYUVXNWFoVkZ4MUtveUhQcEZtMVhlb2J1ZmZLL1lUTzVKUUk3dzB0?=
 =?utf-8?B?Tlo2OE01Z2QvWHpNd29CNXpNc3lkcFp0VUhGakNZaFRGcGFabXhyVk9sN3Ru?=
 =?utf-8?B?aElrUGZSZElBQXZ5a1ViTzJRY2kyTkZiTnMvSGUxb21yRlVNK1lmNkV2c2Jv?=
 =?utf-8?B?b3hxOUZFTnljZXBIRjNzbEI5VXhlM1JibmhlMlZMWFFXQ1BrWUhQRWZ2NVlY?=
 =?utf-8?B?QzR4cDhZZ0hYeWpFUGF1d0I2R0d0Y3RmbU53WGtrWG5KQmNEU2xhM3NsSllv?=
 =?utf-8?B?THU5SEZWQUVGeGd0TlZXRUhYazdVa2huN0dRSDhpT3BJWmJGSDFGd1haVkhw?=
 =?utf-8?B?MTdBd2oxeUw5V0FXMVFwZmNRZ0x6eGVQY3NTU2Y2RnhJR3h0VWZOSmpZMzBz?=
 =?utf-8?B?bU1Rb1lHandIaFdJY2tLcjVTcEpiTWYvTTVyalZVMHh3WkJ1Ty9vNGU1NXRi?=
 =?utf-8?B?RU8xQklEZ21MTFMzZk1lQT09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdb43fc-5f2d-4cc5-a427-08d977e63d4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 01:15:00.3569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bC7yOV6awyxPtwee64BpfFg8HWOubzXZHmxQWgH6rJ3vzmcEEiYedNh+FuDMRZsCBoXiquX23RKLUq6c7ufsdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3623
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <CAAC71677EF42548AC9B9D3B4802448F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIxLTA5LTE0IGF0IDA4OjAzIC0xMDAwLCBTdGV2ZSBTYWtvbWFuIHdyb3RlOg0K
PiBUaGUgQ1ZFIGRhdGFiYXNlIGNvcnJlY3RseSByZXBvcnRzIENWRXMgZm9yIG9yYWNsZV9iZXJr
bGV5X2RiIGFuZA0KPiBiZXJrbGV5X2RiLsKgIFdlIHVzZSB0aGUgb3JhY2xlX2JlcmtsZXlfZGIg
c291cmNlIHRyZWUgYW5kIHRoZXJlZm9yZQ0KPiBzaG91bGQgb25seSBjaGVjayBmb3Igb3JhY2xl
X2JlcmtlbHlfZGIgQ1ZFcy4gT3RoZXJ3aXNlIHRoZSBzY2FubmVyDQo+IGZhbHNlbHkgcmVwb3J0
cyBDVkVzIHRoYXQgYXJlIGZpeGVkIGluIG9yYWNsZV9iZXJrbGV5X2RiDQoNCkFyZW4ndCBib3Ro
IHRoZSBzYW1lIHRoaW5nP8KgSSB0aGluayB0aGlzIHJldmVydCBpcyBpbmNvcnJlY3QgYW5kIHRo
ZQ0KQ1ZFcyBiZWluZyBmbGFnZ2VkIGFyZSBjb3JyZWN0Lg0KDQpodHRwczovL252ZC5uaXN0Lmdv
di92dWxuL2RldGFpbC9DVkUtMjAxNS0yNTgzDQoNClRoZSBDUEUgZGF0YSBzaG93cyBvcmFjbGUg
YXMgdGhlIHZlbmRvciBhbmQgYmVya2VsZXlfZGIgYXMgcHJvZHVjdC4NCg0KVGhhbmtzLA0KDQpB
bnVqDQoNCj4gDQo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgYWQ3OTliMTA5NzE2Y2NkMmY0NGRjZjdh
NmE0Y2ZjYmQ2MjJlYTY2MS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlIFNha29tYW4gPHN0
ZXZlQHNha29tYW4uY29tPg0KPiAtLS0NCj4gwqBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kYi9kYl81
LjMuMjguYmIgfCAyICstDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGIvZGJf
NS4zLjI4LmJiIGIvbWV0YS9yZWNpcGVzLQ0KPiBzdXBwb3J0L2RiL2RiXzUuMy4yOC5iYg0KPiBp
bmRleCBkNWI3ODhhM2Q3Li41ZTkzMDVhYjA2IDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9kYi9kYl81LjMuMjguYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGIv
ZGJfNS4zLjI4LmJiDQo+IEBAIC0xNSw3ICsxNSw3IEBAIEhPTUVQQUdFID0NCj4gImh0dHBzOi8v
d3d3Lm9yYWNsZS5jb20vZGF0YWJhc2UvdGVjaG5vbG9naWVzL3JlbGF0ZWQvYmVya2VsZXlkYi5o
dG1sDQo+IMKgTElDRU5TRSA9ICJTbGVlcHljYXQiDQo+IMKgUkNPTkZMSUNUUzoke1BOfSA9ICJk
YjMiDQo+IMKgDQo+IC1DVkVfUFJPRFVDVCA9ICJvcmFjbGVfYmVya2VsZXlfZGIgYmVya2VsZXlf
ZGIiDQo+ICtDVkVfUFJPRFVDVCA9ICJvcmFjbGVfYmVya2VsZXlfZGIiDQo+IMKgQ1ZFX1ZFUlNJ
T04gPSAiMTEuMi4ke1BWfSINCj4gwqANCj4gwqBQUiA9ICJyMSINCj4gDQo+IA0KPiANCg0K
