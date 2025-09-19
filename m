Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09FECAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 14:04:57 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.7])
 by mx.groups.io with SMTP id smtpd.web11.17463.1758290687562330125
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 07:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=WSxcQiKb;
 spf=pass (domain: axis.com, ip: 52.101.70.7, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPNdLzmPJhLkDGFmy/eRRMqFgkgCrVc32xMaG43LbXgXntvKT2D7pcbGzUINJYWnZ76Vj+OJr0pq+jWnSr8WvwlXvy4F7HVmRUlsFZNciGgHVAUE7mk5Ij/LoyGJ6Xb9N+XKQxVe3/ZtM8yHuyOc08Y9014+GNGLpjz84seVHD/CjdCAmIzNC71Te9X7G1rqy62U0GtnSVTSEb38K7Ef3iEcRasoWWqDP7AUK5ZwpD3mgDOpa9kexwVOLExVLUQa2mcQ96DZirasVtTshxMZWX1YkjjQ8puZOnwQmmjFsatv5Mu7WVrL1U1zBtOT1WzmFwK7i2eHnx8CFcelQ5nykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKZ89CODv7YIVgIH2TmWULglbz11PLxisqT8wxsuCn0=;
 b=LXSU20yTDDL2IRakHYayvsTDYKq4E9ZKYZunjuLmarOAhxh/ph9gLynK89TuhD13v91j22Fz0XWgbbbmT/9fKad1c4saQDl7hsn+Ed5kUkw8/FYjDnkj5tvLkiSroBSLX2H2PAMFU6G4fUQCImUCaG6AwNPrjj194ZNYzTu1+OFl3zsRoMdSt/bwBGGKwJNVhh32DnTP8gwhgq2EXzy1PAVq0nskAKhlO+4L3sMzSNZouk6YGSi4K4SfjU8Tq3E0WzeMAbnEEWb91sk0fnDlAMha86/Eo7tai9eJZDZJl+V/ep77qvjyVRtsqcuumFmnGRHabCqzCpegl/UviQJmSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKZ89CODv7YIVgIH2TmWULglbz11PLxisqT8wxsuCn0=;
 b=WSxcQiKbTeU5oOn04rWB7j8esxzmrk5TC0u17LRI49AuA0bCCiJvzgSDOje4AUs2kCiBz3bvyDL5RH3mlTEk/jvKi3MbNPY/j7eBFy7Oom/+CVo1h1lvFJr4wSUuMQqgk2pJAJbU0AovVZ5CuQzKJup6+XNfmusC0EqAR3pcd8g=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI2PR02MB10952.eurprd02.prod.outlook.com (2603:10a6:800:27a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 14:04:43 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 14:04:43 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"liezhi.yang@windriver.com" <liezhi.yang@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/1] gawk: Append AGPL-3.0-or-later to LICENSE
 when pma is enabled
Thread-Topic: [OE-core] [PATCH 1/1] gawk: Append AGPL-3.0-or-later to LICENSE
 when pma is enabled
Thread-Index: AQHcKTGDFzujBCWbcE6BXGb14eM7XbSaTP+AgAA8sDA=
Date: Fri, 19 Sep 2025 14:04:43 +0000
Message-ID: 
 <DB5PR02MB10213C7F93117803D674E1CB2EF11A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <cover.1758264088.git.liezhi.yang@windriver.com>
 <d619772b36cee9470e7ea8bcb245e98cd8033556.1758264088.git.liezhi.yang@windriver.com>
 <CANNYZj_=ovyCMXfrNAqcwJ17iraVRJJQnSVFugH3EVeKPs+6=A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_=ovyCMXfrNAqcwJ17iraVRJJQnSVFugH3EVeKPs+6=A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI2PR02MB10952:EE_
x-ms-office365-filtering-correlation-id: bb668f11-2fb1-4b93-1cb7-08ddf7857bf1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bWFpYWEvNkZzVzJuMU1ZdnNyN3RIQ2RCSytDZkdma3BaU3h3RUduM1JJY2k2?=
 =?utf-8?B?TmRqZGxWZU12cWZaS3JUMmdnZG5OVlNxeHEwSjV1TWxsaEsvM0I0R1hRSGJW?=
 =?utf-8?B?dGxYL2ptOEpCRTV4bGlCdFZZUXZCZ01KdThpeVE2ZkV3OEJXN1QyckNtZXA0?=
 =?utf-8?B?Z3FyMFFIOHdHTGJobHBFVXhlT291dEo0emd1Zm03eURId2N1UDdwQSswSVFq?=
 =?utf-8?B?ZkFWYko3VUtUakozWURqRmNOMjNuUkZ3K1Zjc1hyZWF0elpLcHpieVVLNkJw?=
 =?utf-8?B?TkZSQS8rVmFBd3RnUGFSdTdGeDIySXhrVmEzU0ZNNWo3OENhVEdid250bmlL?=
 =?utf-8?B?amtuQk11b1JmTFNaemlrS1FoTnovTytOTThwMHFSaW9GL2ZwaUVTVkZMZGJD?=
 =?utf-8?B?TFJIRmxGaGowQ1JlK3Q5UDhCZ0RsL0ozT2NSMnZSdUprRU41VVB3ajVlNVU5?=
 =?utf-8?B?eCtQUzRSWjJqdmZ2bkhHOW5neDZSRHA1ZHN2bUVxQklzUWpDREx1cWVjOTE3?=
 =?utf-8?B?SG4yb3dFTHc5NzZSOVh2MTJlNFVJNTJlUmtVVkxWeTIvcmNaTU1ZYUd4TnIr?=
 =?utf-8?B?R3dKUzBlTUNvdkF2U2E5MWtpclQrcXV6VWVpcjRWS3k0VGwyZ0FhNndMRldV?=
 =?utf-8?B?ckEzNVMrUURpanJTKzN1N2w4aSsrSFY5VlJrZnhtcHMzZmpHR213UVBYbTFN?=
 =?utf-8?B?Ky9mN2I1aUhCMnkrYis0ZU15NFlwVW84NHY3azlsdlUzQ3FVMGROdndYZ1NV?=
 =?utf-8?B?T0ZvU0lmWWFlZXU5WWo2ck8xNWEvTEE3M2liL2JDTjNpb1JRVXQwYkN4akhZ?=
 =?utf-8?B?ZUpicmlwR3Vrd3d0NzR4bzQzU0RtN1hMUmh3MHBza0Q5dXdCc2R5YVRQeVR5?=
 =?utf-8?B?cVVhSUt1OGg3dkVyWFJFbmZQUmhacDRpbkVBRGF6OE40U1VYM1BJWmc3SnVF?=
 =?utf-8?B?UzBmYXBuV0NDNGk2NDhJOHpTTjVQOGkvMWVlYTNZdHI3M3ZUK2tCRG93TlJZ?=
 =?utf-8?B?L0wvUFM3QzZrd1VKdjQzZmg2L0gwY0d1bHpLcFhXWlhPUEhTamR3WHZRWmJK?=
 =?utf-8?B?ejlCVmRMUXBQaDM0T1p6WEdJdzFaRTE0NWRpNDJsL0pTM3R3Q2RPYmlHYnNi?=
 =?utf-8?B?OG5EQTYvYzRHUXJQbVdYMGtjMkZnQXR6VHRuZUtMNVdoU0FVVFNtZU5Jb2Ny?=
 =?utf-8?B?ZStnMlUzSlV6WXJVdTNLaE5wYXIxcGFBbFFOSmhpc3hrdmRINEkxajZSM1Uw?=
 =?utf-8?B?S21ucjI1RTIzMEpqRDZYbW55b3BIRUliOGxFMElHckdZQWY4ZGdTTXpJV3lm?=
 =?utf-8?B?N2dZbExFc0dHNitzTnRidHNCOTBnNDZWTjlhNzdMYlpxRVc0VVBqcjdKcU5D?=
 =?utf-8?B?dXI3aXd1YUZYRi9PTEx1NVRGSVJ1RGtTbENQRmpNZnhQUWJKNDRpN2ZMSnIy?=
 =?utf-8?B?Y0dTYmczVDJDRkp5MlNPZHBycG9rdmx4aE1WWk9SeUxac2hjaGVla1hCYnNt?=
 =?utf-8?B?QWhWZUxQc2tNOU1KYXFDM2pFZ2RIbEVkQkpJTEZnYzkzakxYdE1NemYwbXRL?=
 =?utf-8?B?SkhpV1UyazJZVTRTaGxyQ0tncWdOc09Yc0IrZXg1aFNmWEdkQmRndE90aStm?=
 =?utf-8?B?OGhjOWNpRktNQmZrelZUUU5jNloybmpXYVAwa2pEcW5pUHd0MkRLbVJ2U3ho?=
 =?utf-8?B?WHN0VnVyWnBKUGFVc3NlTWxpOW84dDluS2g3Q1FqSzQrN1VDVWM3Rkw1S1o1?=
 =?utf-8?B?VlJoc1NZRDJ4OGh4OU9pYncyQjhZQSsyWXg0OGxZZm9xdFI0eXVsQ09vMVFI?=
 =?utf-8?B?eFdYN0tRUUdZRkpQVnllSWN2TUNkMWdIdkhiaS9EbjBmc05KdTlrV3RodEdX?=
 =?utf-8?B?RHNZWG0xZXdKSnhqK0o0QUVVekFGNThyK1R0Y1BJQ1lvcHozUHJZV1c2QnlB?=
 =?utf-8?B?ckk2MTdWVkxEMkl3S3lXZW8rZS9LNTdNZXRKUHgvYmw1Yk90MlUvQVZaNVRi?=
 =?utf-8?B?cWNmYm9IeUVnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TGNXRWNvelpsWGhyMEZRZWtWbXBQOGl5RVRYczdaWXlPZ1VUL2x1Tks1YWNy?=
 =?utf-8?B?TklHekJOUjRtdVdCc2d3c0d0TTlFMy9hZEg3ems4aGVnSFhWclFJQktLbEhq?=
 =?utf-8?B?TkVuMElxVHV0MVhDU2d2V0JhUWgzNzY1bVkrTTFzcGRRQ1JYdjNUYTVKQlNr?=
 =?utf-8?B?S3p4T1hJeDN3NmM3N0hza1NxYXZ6QzdaenkxaU9DZVlBSjNsU1ZvU2hPVm9m?=
 =?utf-8?B?U0Y3b1NLbmxlUitNc3RXVFBoOFBGTWpZU3I3UGt2TloyL2NtUkZ0b1pWK0Z3?=
 =?utf-8?B?QUZtTS84a3ptbFFaQmxVSXdWRjBPTTFDZjdyQ2JIVDNPSy9BdFh3Y2VzQmlJ?=
 =?utf-8?B?Y04wUDBmUG9GRGFFK3hhcy9Ucmd1eXZ1S2VPWGhudXhSQUUrSDJYOWQvVkEy?=
 =?utf-8?B?azN1Sm41VHYvaXR1Wks1eFpLdURkVVRiekV4RlVPL2owb0hPY1NlVmliRHQv?=
 =?utf-8?B?b3RhSXE4MmpBdVZyQVdJbzVhZGt5YkV2bG1XaEZuY0ZaTWcwVjI2VlF6aDJ4?=
 =?utf-8?B?Q1RtWUpkQTNJSndXZFZMbHc5MkliNGswcm1CRGJNN2lXb3NmN2s3Q0g5NklU?=
 =?utf-8?B?Zk0vVHhURW9BZ2tSSmQrUmlDSHB1QjQyOGkwZ0daOVFIeHNaUGxwZkpxaTZj?=
 =?utf-8?B?ZTNsMHNjcDNmYzJTcnR2dlVDUFFZckZqcVBZMmpJSWlURTRmeUZjZWkydjZj?=
 =?utf-8?B?aHdqV3pheEJxb1NucEVzNW5DRFUvNVpuRng5OVowcDVURWpHOWZxYXlkWWZD?=
 =?utf-8?B?dTh4cWxwTG1xc203QlRpQjRndC9oblR5Qzl2NzhSWjJocFNSZ2ZHNUFqZVQx?=
 =?utf-8?B?MmJRMUJIZ1VBdmZGNmRITXRVTnI2b21LZGlIWkU2VGM3eGhoR0RtaEJGUmZj?=
 =?utf-8?B?eVZpdEZhUEVEaGFONUQ5UStaeXlrQVB4N2FWTHpBeDJERExmZFd4KzNKRWtQ?=
 =?utf-8?B?L0MraXg1RVdpUmF3cjF2NWE3VlhKQXJVcFpMNGt4R0ozZ1BwMW51ODdjKzJI?=
 =?utf-8?B?eTdUTjNZUGtBemIrOXdDSURwd3lSTUxmMHVqQkFIbFVLaDdQUy9wVEZHOWxO?=
 =?utf-8?B?bFBBQmE4MlVGakM0RUU0eDNJMXdqemxLdHJWOFRQNWNKL1AzRXA4WWtUcFFr?=
 =?utf-8?B?b1FmODFDSEdDQ095RmxXOHpKWm9TRnUzMXB0Tzl3emovcTlNOGJlaEVHZGUx?=
 =?utf-8?B?dmo3aWhKcTVWU3VKS2tGVXEwVzJwcWk4UVNPc0dIV3dLMThBbFZ5bEpRSnB2?=
 =?utf-8?B?a2FCSU5BRXN3RmN5TEdqQnpuQWRoVUlmeHNzby9iRzExMEJOOHdqNER2RGls?=
 =?utf-8?B?Sko4aEQzQlhXb2dUc1NPMkcycDQ4YVVPZ2pxTkgwVVhWcEoydzgzOHFycjIx?=
 =?utf-8?B?TURvRXZiOWxaWVVRUkVPbnlGWDNaV2crd3dUcGt5RHl1UnhURVVQMEZRTWVO?=
 =?utf-8?B?RTZNa01kQXFsT3pJemV3Z3plb25mbCtWYWhlN3BLSVk5NUthM1VXZGkveDgw?=
 =?utf-8?B?Tk1qOHFzQmN1bVAzbStkb29LenJjNDhzbHp5aURvRExoRi80YnJPY08zNU5H?=
 =?utf-8?B?Mlh6ZHFtRTVpQW9JSTMvVnNvYkVpSmJGVC81VFBTdjFJM3dacDRlY2JTWFQv?=
 =?utf-8?B?b1NISE1hVDZrOFd2dDAzZUZIOGVFYm9VdDFEcDdCcmx3bjhGNzlSM2VwNE4z?=
 =?utf-8?B?emZYMGJINXBrWXF1TWlPV0FPeG1TdE5hVzBXR1VLa2tDZy9sNEhBWHhhZDNZ?=
 =?utf-8?B?U3dhbHBRcmVvcFFMdGpzNTNpUXZoWGt2MzFUaU41ZUVLeFlYOG54MHVzREJL?=
 =?utf-8?B?NjUrbHBYdXZQQnhZbmVXT1Z4ZWJ6NHpWRTVJeU9EUHRUSElXK01aQXByekgx?=
 =?utf-8?B?UmZDTHhYQ3RzYVhNUFMyU3h4T0p5OUFFNW1zNWc0RFB1cVpWZ1BGQW9qZTlx?=
 =?utf-8?B?bzBaSzJZaW92Q2tSN1A5RlBKK0JOOU12Y1E2U1lLUVBFa0dac0xTd3VVWmFz?=
 =?utf-8?B?UDJvd1A5SENHZzhWaXZOL0RXbFQ2bFpzWk8veVRNdENjaDR1M213K3JMeVFF?=
 =?utf-8?B?TXFFdmlHUllKOHZqcnBQVjRNV3VBb1Z4SVovZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb668f11-2fb1-4b93-1cb7-08ddf7857bf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 14:04:43.8465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qtqX/IK7u6zOevh0XMzDlGxexeyVnR5MOmC4AmTInnZcoYnZhZkz5xqsxZWKzNco
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR02MB10952
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 14:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223756

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgQWxleGFuZGVyIEthbmF2aW4gdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gU2VudDogZGVuIDE5IHNlcHRlbWJlciAyMDI1IDEyOjI1DQo+IFRvOiBsaWV6
aGkueWFuZ0B3aW5kcml2ZXIuY29tDQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvMV0gZ2F3azog
QXBwZW5kIEFHUEwtMy4wLW9yLWxhdGVyIHRvIExJQ0VOU0Ugd2hlbiBwbWEgaXMgZW5hYmxlZA0K
PiANCj4gT24gRnJpLCAxOSBTZXB0IDIwMjUgYXQgMDg6NDgsIFJvYmVydCBZYW5nIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxsaWV6aGkueWFuZz13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+ICBQQUNLQUdFQ09ORklHID8/PSAicmVhZGxpbmUgbXBm
ciINCj4gPiAgUEFDS0FHRUNPTkZJR1tyZWFkbGluZV0gPSAiLS13aXRoLXJlYWRsaW5lLC0td2l0
aG91dC1yZWFkbGluZSxyZWFkbGluZSINCj4gPiAgUEFDS0FHRUNPTkZJR1ttcGZyXSA9ICItLXdp
dGgtbXBmciwtLXdpdGhvdXQtbXBmciwgbXBmciINCj4gPiArUEFDS0FHRUNPTkZJR1twbWFdID0g
IiwtLWRpc2FibGUtcG1hIg0KPiANCj4gVGhpcyBuZWVkcyAtLWVuYWJsZS1wbWEgdG9vLCB0byBh
dm9pZCBhIGZsb2F0aW5nIGZlYXR1cmUNCj4gZW5hYmxlbWVudC9kaXNhYmxlbWVudC4NCj4gDQo+
ID4gK3B5dGhvbigpIHsNCj4gPiArICAgIHBhY2thZ2Vjb25maWcgPSAoZC5nZXRWYXIoJ1BBQ0tB
R0VDT05GSUcnKSBvciAnJykuc3BsaXQoKQ0KPiA+ICsgICAgIyBUaGUgc3VwcG9ydC9wbWEuYyBh
bmQgc3VwcG9ydC9wbWEuaCdzIGxpY2Vuc2UgaXMgQUdQTC0zLjAtb3ItbGF0ZXINCj4gPiArICAg
IGlmICdwbWEnIGluIHBhY2thZ2Vjb25maWc6DQo+ID4gKyAgICAgICAgYmIud2FybigiQXBwZW5k
aW5nIEFHUEwtMy4wLW9yLWxhdGVyIHRvIExJQ0VOU0Ugc2luY2UgcG1hIGlzIGVuYWJsZWQiKQ0K
PiA+ICsgICAgICAgIGQuYXBwZW5kVmFyKCdMSUNFTlNFJywgJyAmIEFHUEwtMy4wLW9yLWxhdGVy
JykNCj4gPiArICAgICAgICBkLmFwcGVuZFZhcignTElDX0ZJTEVTX0NIS1NVTScsICcgZmlsZTov
L3N1cHBvcnQvcG1hLmg7ZW5kbGluZT0yMTttZDU9MzJiZDc1MGVlNWFhNWNiY2Y3OTc4YzFiZTY0
NjJiOGEgXA0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zdXBwb3J0L3BtYS5jO2Vu
ZGxpbmU9Mjg7bWQ1PWEzZjMzZWMyMzZhYjk2NTM3Y2RmZDFkY2RhMjcwYzc1JykNCj4gDQo+IFRo
aXMgc2hvdWxkIGJlIHNldCB1bmNvbmRpdGlvbmFsbHksIGFzIGl0IGlzIHNwZWNpZnlpbmcgc291
cmNlIGNvZGUNCj4gbGljZW5zZXMgdGhhdCBhcHBseSByZWdhcmRsZXNzIG9mIGJ1aWxkIHRpbWUg
Y2hvaWNlcy4gVGhlbiB5b3UgY2FuIHNldA0KPiBsaWNlbnNlcyBmb3IgYSBwYXJ0aWN1bGFyIHBh
Y2thZ2UocykgdG8gaW5jbHVkZSBBR1BMIG9yIG5vdCBkZXBlbmRpbmcNCj4gb24gcGFja2FnZWNv
bmZpZywgYnV0IEkgYmVsaWV2ZSB0aGF0IHRvbyBjYW4gYmUgZG9uZSB3aXRob3V0IHJlc29ydGlu
Zw0KPiB0byBhbm9ueW1vdXMgcHl0aG9uLg0KPiANCj4gQWxleA0KDQpZb3UgY2FuIGZpbmQgYW4g
ZXhhbXBsZSBvZiB0aGlzIGJlaW5nIGRvbmUgaW4gdGhlIGNhaXJvIHJlY2lwZS4NCg0KLy9QZXRl
cg0KDQo=

