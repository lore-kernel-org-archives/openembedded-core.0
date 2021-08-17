Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.41262.1629216431171311993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 09:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lWXNZv6E;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3863181313=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17HDVXBu023858
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 16:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=NFFkyKn87ReyGDCXYJiaAhTHCEMvNqVBynFx/Y8t6Ow=;
 b=lWXNZv6Efy/VNpiyCSTKfuMZv4RqqfWxCWq2odqxp+DqcbNChzTwvv0qwiG9i/FnAw4S
 ZHMIR4PMAC8aGxrCkWFG9SgHg3uDMyXiZykVNyNwbWN7t4fzaTh72t5cLXxInjZcIkK1
 TA8yLDdmE7sauGTbHTFX8GBanq0lPZfH0DLdVlqDHup3GK12zXIoSAd+aJviiDrS5EyQ
 tuYnxaPzOA6mfbm6kAMYCYgSsePXn9D3cExpqgyeDAiivGnKi2FyDS2bsov5J7OSo1/E
 kvfFLSmLW64LbD3ZEsqVtBE/t5EtQloa5C+vW3XLprN2dhheGWCCVnRvq5fsqaSc9V74 dw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3afwwg8p63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 16:07:08 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17HG77EF022902
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 16:07:08 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com with ESMTP id 3afwwg8p62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Aug 2021 16:07:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QN8D33v8DcXJuS+nQAhNJBFDM14fq1BFdbPKAtT+gMZhSAlThEaOpkbAJXb7z9JNi3GRWnxVxg3VRc1jiJZkNQJ7KKmRV8LssyfrJDSmmgza2bbD4RScVs6ErqP/Vy2f7T7teB+IrwW9N14vLlmwypVG4Ota17wr2QfOVfcfGLoWaZAfg3ChAqzl0DCgc5zB/JggFllvGaMB9W9y8RPiCn5hrnpX17IauwE/zFlrxtFkdCkoRO+8gVoh0x3tFx/PQ/E1ZO6SbgwxQWm2fBC24OVXRlSM6ja5QPfR84H4ebAlEsn58WfkDbfgdXyT1A6S/+g3UkVguU2zRCp0ZSg/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFFkyKn87ReyGDCXYJiaAhTHCEMvNqVBynFx/Y8t6Ow=;
 b=eZGFWGgQvTBfIR7eDBV8bVI8xMaIE58Glw4SwoRRhSaXmEgBwjMQlNSkmftDXcHTdEctpXXXQZ1z12rQ9lC/CXBzFa7J/Epmyb8L59W2DVaHRq9jARHPlgx8PpVV9pSjYSr++ClsRqyG9UUxt4XIOX/fqwbzX4mPU5xqpucHe9yEJ9RPJxM6tGUW8ccpf889CSCZ0W2bC9htQ3Yg4f9E18BQzKP1/Ch8zcG2NgL0fU54NYbkyTP3vLne7uViNdV+VxY3EUPt5HVMCiJsSIpWAHkGBxFTzpAoWZBhtyZlWKy06VAQpQP4hv7ERE21+D+IJBjIBRiXTSJtn12OTYIMjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by SJ0PR11MB4910.namprd11.prod.outlook.com (2603:10b6:a03:2d7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Tue, 17 Aug
 2021 16:07:06 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4%4]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 16:07:05 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Alexander Kanavin
	<alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: Re: [oe-core][PATCH 1/1] blktrace: change shebangs
Thread-Topic: [oe-core][PATCH 1/1] blktrace: change shebangs
Thread-Index: AQHXkstifYVeDwHKxEiRdhYdtDO3Y6t2ds2AgAA3gwCAAS4MIA==
Date: Tue, 17 Aug 2021 16:07:05 +0000
Message-ID: 
 <BY5PR11MB39922E8CFCFE4BCFB71DCFBC88FE9@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20210816182012.26458-1-joe.slater@windriver.com>
	 <CANNYZj9xLN5vDQ5vgHk1S7k8PfX_zM1+ThzfVF+Yw+Y4aQrpMA@mail.gmail.com>
 <3fd323f691fe9f1a8786e811bf3253fe9aaebba1.camel@linuxfoundation.org>
In-Reply-To: 
 <3fd323f691fe9f1a8786e811bf3253fe9aaebba1.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e9ff146-c0aa-4f30-6c80-08d961990ee4
x-ms-traffictypediagnostic: SJ0PR11MB4910:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <SJ0PR11MB4910DF9A18B812A235643F8188FE9@SJ0PR11MB4910.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hUUW3zl5L1Y0GgPYuXxNf2NoOap3qIP2m5hmpHGHcePfTXt04j0eSaukUN7gq8gLJKpDk3Wpj1bmlshFoduWdJ3FAJeW9y4qVfIqMhsbu9HeBi12kvz6HziZgVSFkWWSuJOJVIh2rEgGE0aBWTRHeylade/lqpalKyb4DIMmnzh/d5uOq7630GcnLkNgLB4BsVBqp47PtdaowrhAdEoCfpIi42uvdnmgzEcMXnu+hiGQxlHQdWklI2EbOvFPNIGJVcEwQNQbnKwgdrv/+UGz2K5ZV0tXsjfDGbo3we7LITVliOpvWSY9OFpgL0frTgI+pKqJsmdJY12vZRA9SBHrQY9oF5Cyl92+wm4Z9Az15vxj+JGplWCDu6TZVqORTFvUS2JDos4ORm65gCrSjyI0i4BT2IJZ9o1boVge11hA/KO7rN7UDkfVPY5idO8xaQvSrobdUBbJ4CpstDeVv+8Wo+46uUn06lDExkNtNxaMhVQZXxJzOL91tNmb4St0wsA4iDMWA88yZ6RoZ2GGzjkR75g7lLOzH6rHe/dI7sG+YKTherxbDKIzzyfjrrtV3L0u9Fp/aUW7Qq3am8/m0oHe218WERfRPc4OslZvX4/ULE+5UrOjLk0blefbFo7GhePTkAln35DNCg7+lesM7P2PCo1Z9psaaSw+KKTrLrrxVSyFPB2IkdmLkSx9qQXsMwvWSjFFRhKWIUKODDrofN2Wkg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39850400004)(366004)(66476007)(64756008)(66556008)(66446008)(86362001)(6506007)(7696005)(66946007)(33656002)(107886003)(8936002)(71200400001)(26005)(8676002)(2906002)(186003)(53546011)(52536014)(38070700005)(5660300002)(54906003)(110136005)(55016002)(9686003)(122000001)(38100700002)(316002)(478600001)(76116006)(4326008)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bTd6NjgyUy9DMHpycWNXdmJSYlRnTFVEVmhBMUY3aytUek5udy9ncVBFaFBN?=
 =?utf-8?B?NVpiRXMxZVJGdzVxY1piaUdqYXJseEt5NW9GTjl3REFiUFVtazBnOTZQNG0w?=
 =?utf-8?B?cVFVa2gwUjZBZERxbHNNblYwejlNT2xmMTJKVTZQa1kwOFRrVEVQb01yUFVF?=
 =?utf-8?B?Z042bGhUc2VwVy9IVzE4ZHRLQW5KUGw1WVp3UU1jSlJPWE1VRFljbHc2Q2Y5?=
 =?utf-8?B?UDlsRUJUNkdwdFJLQUJrU3c4a1EzcnJMK05sSGpZbzhYRitQM0VWdy9rbGc4?=
 =?utf-8?B?MlNyL2JFZGRKZTJPbW44MUNxb0ZtUEVDV0IzVG9zWTc2MlZkdThMZ3hDTW9a?=
 =?utf-8?B?NFIzQ01PREdqTXZrMThmSitMRzdwdlpibU84NWNOWkc3d3pGRElSaXFEbURG?=
 =?utf-8?B?K1FYYUJKMEM3OHEzVlE4aTJlcU1RV2ZOUnVWWG4wR2ZPV0FIRVVoTFAyZHV2?=
 =?utf-8?B?aHRRRDgwZGlYUFRLbmpMWFByajJiM09WRjdVem5zeEo3MWlTWi9tdW1jUXZB?=
 =?utf-8?B?QzU4WXhQbFdxTHBkZlVZbklGVWdyRHhzZkJBZUxyL3UyWitIc01EYVlLVXRG?=
 =?utf-8?B?a3loZkdpbTlvOG1vZG00T2NlRDAvZGFQNG1oemo2b0xaVHJKdnMrUUVoZk9n?=
 =?utf-8?B?elN6Z3R6ZTVRZE9ROTVSOTA0VEtzSDhmUUFiQU5Ga2hOZnhSbVB3NUJRbmRG?=
 =?utf-8?B?QzZrdjFoNkpJZ2IyZGpnY2tBTUlmL3crM3pWVCtXdXAwZEE0b2dtdWVqd2ds?=
 =?utf-8?B?Uld3VWZhMUZhWnZNcVBNNHhwUWV3cWNpQXhFT2lKRnVoSTR3UjFiVGN2TXJI?=
 =?utf-8?B?UjlObHlGMVFibUhGSGFBWGF1NTRrdWpIU1pKNWtqUFJRK2RtUDFyZG1HOWdm?=
 =?utf-8?B?T3hySEhqa3FSZnpDTjFFRWROYWErVkU2VFlsOU9DczFxWkhCZDJ2ME9lSC9n?=
 =?utf-8?B?THE1WG5FVGFtRHNVNUJDak1wblJZNDlYcDNBRXRxMFpIRitvVUFTV082RDlV?=
 =?utf-8?B?UHBmT3QrZVZSeWRoQ2ttdzJBS1N0eUcwR2JJSzlWdFBUUm01TnFJU2hyN0ZZ?=
 =?utf-8?B?V3h5ODJZUjcvM1N1K29RMkdzOXFDS2Jsd3YwMVlXNTVVVUt6QTdPeElpNCsx?=
 =?utf-8?B?WDc2R3N3MDNOcitDZ3hacGROck9IWm04Rm4vWmp3SFJ6RUxQYWthL0lCVFMx?=
 =?utf-8?B?OFBiaEU0K0FTdU9vTlNwNklvWlRLZER5ZWV4elZEVzRSMG1RKzhHSjdaUWtD?=
 =?utf-8?B?MDQrVGhkVEhVa2wrdUtwbE80S3R5blBvYVVPNzFVSGpSeSs0R0FVcEVQNlFG?=
 =?utf-8?B?N05jSDVjVWxQNjNYRndmSC85NWZseU5IcE16TjB3dFF5eHMvSzlpZzZCVkd4?=
 =?utf-8?B?WlVnZjFCVzJmbHR3a2k2eXhmQUR1Y2p0cm82L1lRWDZPbkpTNkE3L1Q0TFBt?=
 =?utf-8?B?WXFlS0dEd0VCZUd1MEVuOTgxTXlQRldXb043TFVRclZ5bFQ4L2UralFmT0lD?=
 =?utf-8?B?Tm1EWGNOSEJwRUR0bHEwOTBWeGNTNG95TERhYkY1RkU4WGFwUU1hdVlTYlRl?=
 =?utf-8?B?SUxZZUh2bDBTNUtlbmtsMDRlRnpxVHZyUmRJR3Y1c0prSWVUQktPOWVHTTNv?=
 =?utf-8?B?WXNTT3ViaWpRbkVIbEh2OWwxNnlmWTIrY3p4M0hMeFlDVm1jYXZ4U2VaaGND?=
 =?utf-8?B?NlhlRzhydGl5N3JhWFh5bVRMdmc1N01SM2hzNVJkeVpZUUVwUHgxMUdGcnBP?=
 =?utf-8?Q?Zvi8Bspq3TSsZlt0RE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9ff146-c0aa-4f30-6c80-08d961990ee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 16:07:05.5208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eLxy9PInvdfZI6DptX6oUOo/g8PhetvhCjco47eVJJvbHRTYqtN424txYJ8FBNdXzqlBATFFgAlJxvHbRA5yZXxE6vnw+UKnFTP3sVg76lA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4910
X-Proofpoint-GUID: waN2K0TNFwv98StvodefnjFBVFtDK82h
X-Proofpoint-ORIG-GUID: B9UFST3qip7cGQ4JmoCaisoK02qADBYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-17_05,2021-08-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108170099
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2hlbiBJIHByZXZpb3VzbHkgY2hlY2tlZCB1cHN0cmVhbSwgdGhleSBleHBsaWNpdGx5IGxlZnQg
dGhlICJweXRob24iIHdoZW4gdGhleSBjb252ZXJ0ZWQgdGhlIHNjcmlwdHMgdG8gd29yayB3aXRo
IHB5dGhvbjMgYmVjYXVzZSB0aGUgc2NyaXB0cyB3b3JrIHdpdGggMiBvciAzLg0KDQpKb2UNCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogTW9uZGF5LCBBdWd1c3Qg
MTYsIDIwMjEgMjo1OSBQTQ0KPiBUbzogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+OyBTbGF0ZXIsIEpvc2VwaA0KPiA8am9lLnNsYXRlckB3aW5kcml2ZXIuY29tPg0K
PiBDYzogT0UtY29yZSA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz47
IE1hY0xlb2QsIFJhbmR5DQo+IDxSYW5keS5NYWNMZW9kQHdpbmRyaXZlci5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbb2UtY29yZV1bUEFUQ0ggMS8xXSBibGt0cmFjZTogY2hhbmdlIHNoZWJhbmdzDQo+
IA0KPiBPbiBNb24sIDIwMjEtMDgtMTYgYXQgMjA6NDAgKzAyMDAsIEFsZXhhbmRlciBLYW5hdmlu
IHdyb3RlOg0KPiA+IE9uIE1vbiwgMTYgQXVnIDIwMjEgYXQgMjA6MjAsIEpvZSBTbGF0ZXIgPGpv
ZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+ID4gPiArYmxrdHJhY2UgY2FuIHVzZSBl
aXRoZXIgcHl0aG9uMiBvciBweXRob24zLCBidXQgd2UgcmVhbGx5IHdhbnQNCj4gPiA+ICtweXRo
b24zLCBzbyBtb2RpZnkgdGhlIHNoZWJhbmdzLg0KPiA+ID4gKw0KPiA+ID4gK1Vwc3RyZWFtLVN0
YXR1czogcGVuZGluZw0KPiA+ID4gKw0KPiA+ID4gK1NpZ25lZC1vZmYtYnk6IEpvZSBTbGF0ZXIg
PGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbS4NCj4gPiA+DQo+ID4NCj4gPg0KPiA+IFBsZWFzZSBz
dWJtaXQgdXBzdHJlYW0gZmlyc3QuIFNpZ25lZC1vZmYtYnkgaXMgaW5jb3JyZWN0bHkgd3JpdHRl
biwNCj4gPiBuZWVkcyB0byBiZSBhZGRlZCBieSBnaXQgcHJlZmVyYWJseS4gJ1BlbmRpbmcnIG5l
ZWRzIHRvIGJlIGNhcGl0YWxpemVkDQo+ID4gKGJ1dCBwbGVhc2Ugc3VibWl0IHVwc3RyZWFtIGZp
cnN0KS4NCj4gDQo+IEkgdmVyeSBtdWNoIGRvdWJ0IHVwc3RyZWFtIHdpbGwgd2FudCB0byBjaGFu
Z2UgInB5dGhvbiIgLT4gInB5dGhvbjMiIGFzIGl0IGlzIGENCj4gZGlzdHJvIHRoaW5nLiBJdCBp
cyBmcnVzdHJhdGluZyBpdCBpc24ndCBjb25maWd1cmFibGUuIEkgdGhpbmsgaW4gbW9zdCBvdGhl
ciBjYXNlcyB3ZQ0KPiBzZWQgdGhpcyBpbnRvIHNjcmlwdHMgYnV0IHRoYXQgaGFzIHByb3MgYW5k
IGNvbnMgdG9vIHJhdGhlciB0aGFuIGEgcGF0Y2ggd2UgaGF2ZQ0KPiB0byBjYXJyeS4uLg0KPiAN
Cj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQo=
