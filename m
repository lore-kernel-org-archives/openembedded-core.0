Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.15041.1627871956188220700
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Aug 2021 19:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=oQKmJkgs;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="192965852"
X-IronPort-AV: E=Sophos;i="5.84,287,1620716400"; 
   d="scan'208";a="192965852"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2021 19:39:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,287,1620716400"; 
   d="scan'208";a="568178811"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga004.jf.intel.com with ESMTP; 01 Aug 2021 19:39:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 1 Aug 2021 19:39:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Sun, 1 Aug 2021 19:39:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Sun, 1 Aug 2021 19:39:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDedJvPirO6wyDEmPet844qPPSUfHV4vzlkJ+92oi8eexoZaq84gC2kQTF9pEQq8718+y7QjV9jtMni2Dv3wqYwjNY6LrLbOEO1L5Aydp4dTG+VsQ8tk55B8X++nLWIy4JnPaKdxy+7DnNMCPEx3oJbc377vg2SNnjVvBov/tyJU7HEAyNjOUNRELvbG9nlUtlBQuXKk8vXcEigWtdBP6HSH3dCqJpL1+mmLtLQTCnV0JKFbxivk+C05WojI7+OIMV8Eekb9muD4zpmWu/XSEkvUuySsE9YnY1ucW1iNp4xJF9w+ZrBT6V/xT4bPpcZ1vRL6HmXi9xdt7KC5iYHVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2pSa0EDHQjWt8DU+BX/QDpes1KSPQeK/ORj9YmAEXU=;
 b=VnUGRQ6x0ehfK+2vn13wHR3ADff89SbHQdW9Yl8PO8yftLwGCOWyCLsMWlbvaaBBFLIAZbTGqZeUB2t0a3zchlVnWRAixmIzNK7Lrcq4xFeBuAjqWhT+UYMVWrGMhG+z10WAcf5nhymsV6N6oLuZ3GRIE7544dWjWEFvN3ZXhabrNjMluqCbNac20FEvKPFfTDsLzbwFvhczQ4kFJen3ueIhpDhOFwYW2EdgX17mN5WZszwZ/84hz9PMF0o8D3l/X8fYws62YVsLoXp7ZoWRO+AFw+0gcC/Fxs/KuvaEAJuI3fQ33H5lkigVxYt9colvHoTSXPfbVvt7TCvu1Ed6hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2pSa0EDHQjWt8DU+BX/QDpes1KSPQeK/ORj9YmAEXU=;
 b=oQKmJkgsc7+eUzsTpWv0yUckYH/WCVY9LpNYBKnOMqMH83+ncsBH8sO7EfAKeGib7eRaNMbs7z3ig3COR/KAdy7eICkOCwrqKeAGOq3pRRPcBhWRz1wU+G33UXEXT+9/n75WDnIvG+lUisQOOk6c1TRhsLQoh3o+RSAVMPK1454=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BY5PR11MB3893.namprd11.prod.outlook.com (2603:10b6:a03:183::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Mon, 2 Aug
 2021 02:39:13 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::91cb:cf5c:1dab:30cb]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::91cb:cf5c:1dab:30cb%8]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 02:39:13 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "vinay.m.engg@gmail.com" <vinay.m.engg@gmail.com>
CC: "vinay.kumar@blackfigtech.com" <vinay.kumar@blackfigtech.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"rwmacleod@gmail.com" <rwmacleod@gmail.com>, "umesh.kalappa0@gmail.com"
	<umesh.kalappa0@gmail.com>
Subject: Re: [PATCH] glibc: Fix CVE-2021-33574
Thread-Topic: [PATCH] glibc: Fix CVE-2021-33574
Thread-Index: AQHXgxawSji6PA7od0qNHTC+CiAm3KtcoqwAgACpIQCAAj0rgA==
Date: Mon, 2 Aug 2021 02:39:13 +0000
Message-ID: <6d88bfb57e64bfd5f169413c1fab0777ca3e811d.camel@intel.com>
References: <20210727183831.100545-1-vinay.m.engg@gmail.com>
	 <a3e9bd964546a48124dddfb13008e2bc1e467163.camel@intel.com>
	 <CANUMPcVH2STrqcD34DRXQ9ty3id9O0ZgZ_qWg76+F-pQ-6Hx5A@mail.gmail.com>
In-Reply-To: <CANUMPcVH2STrqcD34DRXQ9ty3id9O0ZgZ_qWg76+F-pQ-6Hx5A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f909e51-f4f0-48c7-d92a-08d9555eb6e2
x-ms-traffictypediagnostic: BY5PR11MB3893:
x-microsoft-antispam-prvs: <BY5PR11MB3893318C9C08DF9F15C7E928F8EF9@BY5PR11MB3893.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9CuhrD6RfLzUHUiV+1AKRVtJv992VMHc/FMv9lHStuG68N2LDEpBjoKKNnzpCGyhc3ZRlvF9Np8B8Df3X4x8o4Hm+dIbE4OEE04mEWzVEMs/OYdWLF++7mIP39R0+6Ds7g6rmR8ePAJhZXYrcvQlJfd/Gv9hU9v254M/+qwCgM+qE7GPF6BcbzUf/dLWhV8sGzA6Kl7NW+lS3wFSarUZZdFF2bw18CaRY91/eSub6wDoGM0+g8Wn7WRAhm8YzYwAWjcJVXeYgY29NP7dzIP6kUgK0unHWISB5wEu4lgAYyH4QdJZdb0Ng8eSqPukbAOYVIuXNZwxM4xvwvNk8+uaDJ/v3OAuRS22tI59sBnSHU2wt8DCUj/3jwFu1TP+/PaFXlSr0gR7FCSYY+kjdbHQEUb0YO1RjULeGA4k/mK+w0DFmXIV7LYLDLfIwnaDQxH7uMN1nUIAc24cT7YmH/+6L+rrD9AkNZNwn3FiZLG7VFlt7Tg4CzvnmMTcYRBPbcg3J7gi67zsyArPLrD8v3v72Rvg180ZzOlBEJLlAK/WkyrJegHa4p03kel04g+8mRqdyPk7MGanMtKHZTw6AFCqlyQtXG1dgC//qSKJ5iGQft1M3jaiDPHMtVMYnhQ21/PPrnTmTrGkVREkX9V+A7vQw/mEKWopG7jHhmD0b45io4hdO1dqq1lL7YPFjretqwTnvJDaQbeqX0UmX6NCWVovZhkvdThinoUjo0BUTctRs1eL+brValMecwOMchVgSbN86US8gxQwQREoAI47gEiIgMLGrxIR8MgbSFdcBQVaiTSCMXGCrztfHfqC5L328LDD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(66946007)(38070700005)(36756003)(83380400001)(54906003)(966005)(6916009)(478600001)(91956017)(76116006)(316002)(66446008)(64756008)(66556008)(2906002)(2616005)(4326008)(66476007)(8676002)(26005)(6486002)(53546011)(5660300002)(186003)(6512007)(6506007)(122000001)(38100700002)(71200400001)(86362001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YndWeEt4SE16dzBzNkxHZXU3N1RFTEVZaHRRR01EZ1Nwcnl2aFJPaEZwYTF4?=
 =?utf-8?B?TVErT2h6RkNQZU5qd0M5NDRxSmZXd0NXNmpwRitqb1pUS0JoZ3p6SzB1RVcw?=
 =?utf-8?B?WWRlVTcrNjE0cnVZaDlKRnZON3NMc0xNYTZBSjhaMkZjamY4MUt5MnhXL25s?=
 =?utf-8?B?c0RLK3lUcmJIRk5ESi9HenJ4YmZVTUhWU1J0UHhjVTIyTGJDcFczVnl4VnZt?=
 =?utf-8?B?VGV2bXNRWU5hWlZXSzJucjFKTFBRcUIwRENSVlppZ04vYkpZZHdvcDFGa21D?=
 =?utf-8?B?d3hVNHhqSUwwVVJQSzRsL0xjVEJQTDJEM2V0YXRpelFtckV3OUhYcDhWNzVU?=
 =?utf-8?B?bmpDR1R1d1NnSU5TZTEvcU0zV3lKMW1ZazBLYytMa1NMODYwWXlvZndXYXE5?=
 =?utf-8?B?R1dhd1FCRDVETnBpdXBMSFZXcEtVS0dKQ04rM0ZvZndwWVQxL1ptTm1xMHJh?=
 =?utf-8?B?YUxOV2lZa3pRdUhiVUtzdFdEYm50ZUh6dUluNEdNK20vaHVIY1JDbFVKbE9n?=
 =?utf-8?B?S1o3RXp2UWI2cXVFVURnMk0ydlhiUlRFQ2RqeDVVc2FjMWdoVmw4bUV6Rjgz?=
 =?utf-8?B?SUpTUXhCWWR4bUlna1d0cDc3azMwYkgxNmZKWjExSkR3WS9McXAvWG9KKzdz?=
 =?utf-8?B?MkplbXkwMnpzR00wbUQrdHhDVi9nRDMzVXBkNDM3VGFFY2ZHSGY4Rlp5UEc4?=
 =?utf-8?B?OGJ6OXhUdDRyL3FsK2Vpck5YT3kwd0hhT20xZGt5QzM1TDJ3TkVCYk5VTnZI?=
 =?utf-8?B?WFk4bEdFMXI3Qituc3dzejBaVFJQaUt1ODdxQ1Q0Ty9zK055OXpvdXFpeUg1?=
 =?utf-8?B?bTlZemhtNkhFcWVVSGZONXlTSGZaa2JmdEt2dk1TSW1lSjNBaU1TQ0t0Zmxi?=
 =?utf-8?B?R2FFeDBXRGo3Sk9HSGRjL2wrOE9LTTA4NW1hU1pYWkoxSG5jWFFuUGJhOGlZ?=
 =?utf-8?B?UmVLekloczh4ME9NZG9qVzFZY0Z3bmxTOUpJcXovQkhyeWtSZFNPZHZuM0ZK?=
 =?utf-8?B?ZkNnNWRlaS9NazZSM1Bic0EzQVhqekNVRDF1cnB1U3cvdjFRN0UwOWFINWR1?=
 =?utf-8?B?TFNEWlhaek1MajBKbEd1eGtHbEg2L1ROMStOUk05K08ycG00Unc0ejVXSTFJ?=
 =?utf-8?B?UGphY0JzTHREMzdmNDZSWUc1dVR1UHd1dVljSXNhbHdkanhGNWxHU0VGNmtr?=
 =?utf-8?B?YmNZdjVOZndCMDU3bGszaVZVU3BtMTlVQy9KZTgxYnN4c3h6Q2JFY3JPWnUr?=
 =?utf-8?B?eGRHV01Ta2QzdDJKWU1tQ0VFdEUrSmUyVSt3bzBzcEordzBIZzlwWUF6QUxy?=
 =?utf-8?B?S3VmQVVZaG5zNmdmWnpuV2ZxTnJWSFhFMG1mZUJra2JTSEsvNDluRGZvNGN6?=
 =?utf-8?B?MTl2cyt6bVpWb1Z5T2FCeEphVnllNkE2cnJpN3U3VmU0OVRTNkc0cUNPWUxY?=
 =?utf-8?B?R3UxRkI4dTZhSG9tYy94SzZnbDM5Y3ZOQk9CMS9tYzY5dnJneDhrU3ZDb1B5?=
 =?utf-8?B?Q0Vya3VNU082amhwUW1uenpRWnloc3hhSzlULzNPVVRTU2JGNW1YUVlXWU9M?=
 =?utf-8?B?Q2R6d2dsWUVLY2xiV0RUOE4xUExxaVdqNzhtTkxyc2kwM1doSEFxK0lqNmgy?=
 =?utf-8?B?c3UrQ1pYcjJTUTMxOTYyNld5MW52MTMrQmt4T2EvblE0NUJocHVaYjF1OVpE?=
 =?utf-8?B?d1J0S0tRRVJGeTVPYk1WSFVlVVYxeFAvV1pqcFQ0TmZKblBCVHUyMzA0d3li?=
 =?utf-8?B?bXcyTG9NNEYvVk5RWmdDY2NKOUZYTmRNQUtKbVAzMDZhZHhrY3RleU9JRmRC?=
 =?utf-8?B?U05rMDVEZmMvMG1Mdk5oUT09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f909e51-f4f0-48c7-d92a-08d9555eb6e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 02:39:13.2555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VknEoVygT8Di8yl5PJrpKQkaKVKSmx0657OuaN24JH1DvAwPIxMCuhXC6ZRmZDTaF+kwfLpXyqD825/btREJaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3893
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <853EFED7B8978849A639F56375C60595@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gU2F0LCAyMDIxLTA3LTMxIGF0IDIxOjU3ICswNTMwLCBWaW5heSBLdW1hciB3cm90ZToNCj4g
SGkgQW51aiwNCj4gDQo+IFRoZSBwYXRjaCBpcyBjb25qdWdhdGUgb2YgYm90aCBjb21taXRzLg0K
PiBodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1nbGliYy5naXQ7YT1jb21taXQ7aD00MmQz
NTkzNTA1MTA1MDZiODcxMDFjZjc3MjAyZmVmY2JmYzc5MGNiDQo+IMKgDQo+IGh0dHBzOi8vc291
cmNld2FyZS5vcmcvZ2l0Lz9wPWdsaWJjLmdpdDthPWNvbW1pdDtoPTIxN2I2ZGMyOTgxNTZiZGIw
ZDZhZWE5ZWE5M2U3ZTM5NGE1ZmYwOTENCj4gDQo+IEFsc28sIHRoZSBwYXRjaCBpcyBjb21taXR0
ZWQgdG8gbWFzdGVyIGJyYW5jaA0KPiBodHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9j
Z2l0LmNnaS9wb2t5L2NvbW1pdC8/aWQ9NTU2ODFkMDlkN2Y1MTlhMWM3ZjE3ZDE3YjE4ZWM1OWJj
Y2RjOTFjYQ0KPiANCj4gRHVlIHlvdSB3YW50IG1lIHRvIHJlc3VibWl0IGZvciAiaGFyZGtub3R0
IiBicmFuY2ggYnkgc3BsaXR0aW5nIGluIHRvDQo+IDIgcGF0Y2hlcyA/DQoNCkl0IHNlZW1zIHdy
b25nIHRvIG1lIGJlY2F1c2UgdGhlIHBhdGNoIGhlYWRlci9kZXNjcmlwdGlvbiBpcyBub3QNCmNv
cnJlY3QgaGVyZS4gSXQncyBubyBsb25nZXIgYSBiYWNrcG9ydCBvZiBqdXN0DQo0MmQzNTkzNTA1
MTA1MDZiODcxMDFjZjc3MjAyZmVmY2JmYzc5MGNiLg0KDQpJIGFsc28ganVzdCBub3RpY2VkIHRo
YXQgdGhlcmUncyBhbHJlYWR5IGEgZml4IGZvciB0aGlzIENWRSBpbiBteQ0KYnJhbmNoLiBTbyBJ
IHRoaW5rIEkgd2lsbCB0YWtlIHRoYXQ6DQoNCmh0dHBzOi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcv
b3BlbmVtYmVkZGVkLWNvcmUtY29udHJpYi9jb21taXQvP2g9YW51am0vaGFyZGtub3R0JmlkPWVk
ZTM1M2RmMDZhMDdkMzVkYzY2ZDAyNGUyYzdiZDFiMjUwZDk3NjENCg0KVGhhbmtzLA0KDQpBbnVq
DQoNCj4gDQo+IFJlZ2FyZHMsDQo+IFZpbmF5DQo+IA0KPiBPbiBTYXQsIEp1bCAzMSwgMjAyMSBh
dCAxMTo1MiBBTSBNaXR0YWwsIEFudWogPGFudWoubWl0dGFsQGludGVsLmNvbT4NCj4gd3JvdGU6
DQo+ID4gDQo+ID4gT24gVHVlLCAyMDIxLTA3LTI3IGF0IDExOjM4IC0wNzAwLCBWaW5heSBLdW1h
ciB3cm90ZToNCj4gPiA+IFNvdXJjZTogaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvZ2xpYmMu
Z2l0DQo+ID4gPiBUcmFja2luZyAtLSBodHRwczovL3NvdXJjZXdhcmUub3JnL2J1Z3ppbGxhL3No
b3dfYnVnLmNnaT9pZD0yNzg5Ng0KPiA+ID4gDQo+ID4gPiBCYWNrcG9ydGVkIHVwc3RyZWFtIGNv
bW1pdCA0MmQzNTkzNTA1MTA1MDZiODcxMDFjZjc3MjAyZmVmY2JmYzc5MGNiDQo+ID4gPiB0bw0K
PiA+ID4gZ2xpYmMtMi4zMyBzb3VyY2Ugd2l0aCBkZXBlbmRlbnQgY29tbWl0IGlkDQo+ID4gPiAy
MTdiNmRjMjk4MTU2YmRiMGQ2YWVhOWVhOTNlN2UzOTRhNWZmMDkxLg0KPiA+ID4gDQo+ID4gPiBV
cHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0DQo+ID4gPiBbDQo+ID4gPiBodHRwczovL3NvdXJjZXdh
cmUub3JnL2dpdC8/cD1nbGliYy5naXQ7YT1jb21taXQ7aD00MmQzNTkzNTA1MTA1MDZiODcxMDFj
Zjc3MjAyZmVmY2JmYzc5MGNiDQo+ID4gPiBdDQo+ID4gDQo+ID4gSXQgbG9va3MgbGlrZSB5b3Un
ZCBuZWVkIHRvIGJhY2twb3J0IHRoaXMgb25lIHRvbzoNCj4gPiANCj4gPiBodHRwczovL3NvdXJj
ZXdhcmUub3JnL2dpdC8/cD1nbGliYy5naXQ7YT1jb21taXQ7aD0yMTdiNmRjMjk4MTU2YmRiMGQ2
YWVhOWVhOTNlN2UzOTRhNWZmMDkxDQo+ID4gDQo+ID4gPw0KPiA+IA0KPiA+IFRoYW5rcywNCj4g
PiANCj4gPiBBbnVqDQo+ID4gDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFZpbmF5IEt1
bWFyIDx2aW5heS5tLmVuZ2dAZ21haWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiDCoC4uLi9nbGli
Yy9nbGliYy9DVkUtMjAyMS0zMzU3NC5wYXRjaMKgwqDCoMKgwqDCoMKgwqDCoCB8IDYxDQo+ID4g
PiArKysrKysrKysrKysrKysrKysrDQo+ID4gPiDCoG1ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2ds
aWJjXzIuMzMuYmLCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsNCj4gPiA+IMKgMiBmaWxlcyBjaGFu
Z2VkLCA2MiBpbnNlcnRpb25zKCspDQo+ID4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3Jl
Y2lwZXMtY29yZS9nbGliYy9nbGliYy9DVkUtMjAyMS0NCj4gPiA+IDMzNTc0LnBhdGNoDQo+ID4g
PiANCj4gPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliYy9DVkUt
MjAyMS0zMzU3NC5wYXRjaA0KPiA+ID4gYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliYy9D
VkUtMjAyMS0zMzU3NC5wYXRjaA0KPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+IGlu
ZGV4IDAwMDAwMDAwMDAuLmZkNzNiMjNjODgNCj4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ICsr
KyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjL0NWRS0yMDIxLTMzNTc0LnBhdGNoDQo+
ID4gPiBAQCAtMCwwICsxLDYxIEBADQo+ID4gPiArRnJvbSA0MmQzNTkzNTA1MTA1MDZiODcxMDFj
Zjc3MjAyZmVmY2JmYzc5MGNiIE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gPiA+IDIwMDENCj4gPiA+
ICtGcm9tOiBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQGxpbnV4LW02OGsub3JnPg0KPiA+ID4gK0Rh
dGU6IFRodSwgMjcgTWF5IDIwMjEgMTI6NDk6NDcgKzAyMDANCj4gPiA+ICtTdWJqZWN0OiBbUEFU
Q0hdIFVzZSBfX3B0aHJlYWRfYXR0cl9jb3B5IGluIG1xX25vdGlmeSAoYnVnIDI3ODk2KQ0KPiA+
ID4gKw0KPiA+ID4gK01ha2UgYSBkZWVwIGNvcHkgb2YgdGhlIHB0aHJlYWQgYXR0cmlidXRlIG9i
amVjdCB0byByZW1vdmUgYQ0KPiA+ID4gcG90ZW50aWFsDQo+ID4gPiArdXNlLWFmdGVyLWZyZWUg
aXNzdWUuDQo+ID4gPiArDQo+ID4gPiArVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydA0KPiA+ID4g
Ww0KPiA+ID4gaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvP3A9Z2xpYmMuZ2l0O2E9Y29tbWl0
O2g9NDJkMzU5MzUwNTEwNTA2Yjg3MTAxY2Y3NzIwMmZlZmNiZmM3OTBjYg0KPiA+ID4gXQ0KPiA+
ID4gK0NWRTogQ1ZFLTIwMjEtMzM1NzQNCj4gPiA+ICtTaWduZWQtb2ZmLWJ5OiBWaW5heSBLdW1h
ciA8dmluYXkubS5lbmdnQGdtYWlsLmNvbT4NCj4gPiA+ICstLS0NCj4gPiA+ICtkaWZmIC0tZ2l0
IGEvc3lzZGVwcy91bml4L3N5c3YvbGludXgvbXFfbm90aWZ5LmMNCj4gPiA+IGIvc3lzZGVwcy91
bml4L3N5c3YvbGludXgvbXFfbm90aWZ5LmMNCj4gPiA+ICtpbmRleCBjYzU3NWEwY2RkOC4uNmY0
NmQyOWQxZGMgMTAwNjQ0DQo+ID4gPiArLS0tIGEvc3lzZGVwcy91bml4L3N5c3YvbGludXgvbXFf
bm90aWZ5LmMNCj4gPiA+ICsrKysgYi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9tcV9ub3RpZnku
Yw0KPiA+ID4gK0BAIC0xMzMsOCArMTMzLDExIEBAIGhlbHBlcl90aHJlYWQgKHZvaWQgKmFyZykN
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCAodm9pZCkgX19wdGhyZWFkX2JhcnJpZXJfd2Fp
dCAoJm5vdGlmeV9iYXJyaWVyKTsNCj4gPiA+ICvCoMKgwqDCoMKgwqAgfQ0KPiA+ID4gK8KgwqDC
oMKgwqDCoCBlbHNlIGlmIChkYXRhLnJhd1tOT1RJRllfQ09PS0lFX0xFTiAtIDFdID09IE5PVElG
WV9SRU1PVkVEKQ0KPiA+ID4gKy3CoMKgwqDCoMKgIC8qIFRoZSBvbmx5IHN0YXRlIHdlIGtlZXAg
aXMgdGhlIGNvcHkgb2YgdGhlIHRocmVhZA0KPiA+ID4gYXR0cmlidXRlcy7CoCAqLw0KPiA+ID4g
Ky3CoMKgwqDCoMKgIGZyZWUgKGRhdGEuYXR0cik7DQo+ID4gPiArK8KgwqDCoMKgwqAgew0KPiA+
ID4gKyvCoMKgwqDCoMKgwqDCoCAvKiBUaGUgb25seSBzdGF0ZSB3ZSBrZWVwIGlzIHRoZSBjb3B5
IG9mIHRoZSB0aHJlYWQNCj4gPiA+IGF0dHJpYnV0ZXMuwqAgKi8NCj4gPiA+ICsrwqDCoMKgwqDC
oMKgwqAgcHRocmVhZF9hdHRyX2Rlc3Ryb3kgKGRhdGEuYXR0cik7DQo+ID4gPiArK8KgwqDCoMKg
wqDCoMKgIGZyZWUgKGRhdGEuYXR0cik7DQo+ID4gPiArK8KgwqDCoMKgwqAgfQ0KPiA+ID4gK8Kg
wqDCoMKgIH0NCj4gPiA+ICvCoMKgIHJldHVybiBOVUxMOw0KPiA+ID4gKyB9DQo+ID4gPiArQEAg
LTI1NSw4ICsyNTgsMTQgQEAgbXFfbm90aWZ5IChtcWRfdCBtcWRlcywgY29uc3Qgc3RydWN0IHNp
Z2V2ZW50DQo+ID4gPiAqbm90aWZpY2F0aW9uKQ0KPiA+ID4gK8KgwqDCoMKgwqDCoCBpZiAoZGF0
YS5hdHRyID09IE5VTEwpDQo+ID4gPiArwqDCoMKgwqDCoMKgIHJldHVybiAtMTsNCj4gPiA+ICsN
Cj4gPiA+ICstwqDCoMKgwqDCoCBtZW1jcHkgKGRhdGEuYXR0ciwgbm90aWZpY2F0aW9uLT5zaWdl
dl9ub3RpZnlfYXR0cmlidXRlcywNCj4gPiA+ICstwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXpl
b2YgKHB0aHJlYWRfYXR0cl90KSk7DQo+ID4gPiArK8KgwqDCoMKgwqAgaW50IHJldCA9IF9fcHRo
cmVhZF9hdHRyX2NvcHkgKGRhdGEuYXR0ciwNCj4gPiA+ICsrwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm90aWZpY2F0
aW9uLQ0KPiA+ID4gPiBzaWdldl9ub3RpZnlfYXR0cmlidXRlcyk7DQo+ID4gPiArK8KgwqDCoMKg
wqAgaWYgKHJldCAhPSAwKQ0KPiA+ID4gKyvCoMKgwqDCoMKgIHsNCj4gPiA+ICsrwqDCoMKgwqDC
oMKgwqAgZnJlZSAoZGF0YS5hdHRyKTsNCj4gPiA+ICsrwqDCoMKgwqDCoMKgwqAgX19zZXRfZXJy
bm8gKHJldCk7DQo+ID4gPiArK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtMTsNCj4gPiA+ICsrwqDC
oMKgwqDCoCB9DQo+ID4gPiArwqDCoMKgwqAgfQ0KPiA+ID4gKw0KPiA+ID4gK8KgwqAgLyogQ29u
c3RydWN0IHRoZSBuZXcgcmVxdWVzdC7CoCAqLw0KPiA+ID4gK0BAIC0yNjksOCArMjc4LDExIEBA
IG1xX25vdGlmeSAobXFkX3QgbXFkZXMsIGNvbnN0IHN0cnVjdCBzaWdldmVudA0KPiA+ID4gKm5v
dGlmaWNhdGlvbikNCj4gPiA+ICvCoMKgIGludCByZXR2YWwgPSBJTkxJTkVfU1lTQ0FMTCAobXFf
bm90aWZ5LCAyLCBtcWRlcywgJnNlKTsNCj4gPiA+ICsNCj4gPiA+ICvCoMKgIC8qIElmIGl0IGZh
aWxlZCwgZnJlZSB0aGUgYWxsb2NhdGVkIG1lbW9yeS7CoCAqLw0KPiA+ID4gKy3CoCBpZiAoX19n
bGliY191bmxpa2VseSAocmV0dmFsICE9IDApKQ0KPiA+ID4gKy3CoMKgwqAgZnJlZSAoZGF0YS5h
dHRyKTsNCj4gPiA+ICsrwqAgaWYgKHJldHZhbCAhPSAwICYmIGRhdGEuYXR0ciAhPSBOVUxMKQ0K
PiA+ID4gKyvCoMKgwqAgew0KPiA+ID4gKyvCoMKgwqDCoMKgIHB0aHJlYWRfYXR0cl9kZXN0cm95
IChkYXRhLmF0dHIpOw0KPiA+ID4gKyvCoMKgwqDCoMKgIGZyZWUgKGRhdGEuYXR0cik7DQo+ID4g
PiArK8KgwqDCoCB9DQo+ID4gPiArDQo+ID4gPiArwqDCoCByZXR1cm4gcmV0dmFsOw0KPiA+ID4g
KyB9DQo+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi4z
My5iYiBiL21ldGEvcmVjaXBlcy0NCj4gPiA+IGNvcmUvZ2xpYmMvZ2xpYmNfMi4zMy5iYg0KPiA+
ID4gaW5kZXggOTI1ZWZlOGNjNi4uZTlmMDFhMTRjNSAxMDA2NDQNCj4gPiA+IC0tLSBhL21ldGEv
cmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIuMzMuYmINCj4gPiA+ICsrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWJjL2dsaWJjXzIuMzMuYmINCj4gPiA+IEBAIC01Nyw2ICs1Nyw3IEBAIFNSQ19V
UkkgPQ0KPiA+ID4gIiR7R0xJQkNfR0lUX1VSSX07YnJhbmNoPSR7U1JDQlJBTkNIfTtuYW1lPWds
aWJjIFwNCj4gPiA+IA0KPiA+ID4gZmlsZTovLzAwMjktd29yZHNpemUuaC1VbmlmeS10aGUtaGVh
ZGVyLWJldHdlZW4tYXJtLWFuZC1hYXJjaDY0LnBhdGNoDQo+ID4gPiDCoFwNCj4gPiA+IA0KPiA+
ID4gZmlsZTovLzAwMzAtcG93ZXJwYy1Eby1ub3QtYXNrLWNvbXBpbGVyLWZvci1maW5kaW5nLWFy
Y2gucGF0Y2jCoFwNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmlsZTovL210ZS1iYWNr
cG9ydHMucGF0Y2jCoFwNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vQ1ZFLTIw
MjEtMzM1NzQucGF0Y2jCoFwNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIg0KPiA+ID4g
wqBTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiA+ID4gwqBCID0gIiR7V09SS0RJUn0vYnVpbGQtJHtU
QVJHRVRfU1lTfSINCj4gPiANCg0K
