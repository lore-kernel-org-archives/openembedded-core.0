Received: from mx0b-006e0602.pphosted.com (mx0b-006e0602.pphosted.com [148.163.140.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6316.1793344510968057809
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 00:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jp.honda header.s=PoD-DKIM-Selector header.b=nc7Xnypz;
 dkim=pass header.i=@jp.honda header.s=selector1 header.b=GpN8Gzj+;
 spf=pass (domain: jp.honda, ip: 148.163.140.78, mailfrom: kazuyoshi_akiyama@jp.honda)
Received: from pps.filterd (m0469178.ppops.net [127.0.0.1])
	by mx0b-006e0602.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F74s3627930;
	Fri, 30 Oct 2026 07:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PoD-DKIM-Selector; bh=3aDSVLCHYlk+rnzKHfjhWlx/QkAfrrfERg+zdgMBG6
	U=; b=nc7XnypzGtM+dybs0rctpEMa122WoXpA9HzC/hh5JXHN7UKT9qvWH0FvK7
	bwRDImMOkxppLurMIpuWmS72Q/REKBYIzQXWquIElwPfstfkwWsSMDXa08laYpOQ
	ysqqK+O/nhPOc0gwSUJUKmNIzrwCoJp9ATCsx9ZSBR1jWFOx0i0rDN8CHSPBTNhM
	JshLOAKEkZOoFgU+IAmx8ISNz+tv/MnpwaKvaDNIeCEK5BUrYdM5qcbFSuwt1Uxm
	GOIfhJG1C5WWoIC33cfdOLahoctpKjpOBcttuGdZhfTC2LZ1eJieSl5cJBIBOt5N
	9FDkq+sdqJj4dN6DDVP//1RqGTzA==
Received: from os0p286cu011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	by mx0b-006e0602.pphosted.com (PPS) with ESMTPS id 4hme6a9y2h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 07:15:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFsffKV62e29mpwhnzVVMwe7qoopISJcYwC9W3CY9Amzjpu9ZlXvRKBAPA03rwV4wl/7plzMc1Gm6iSfS6A1k0VeVHZkCyNQIe8jz8mnMSPcivf8T/6hYMowCz6Qf5loQUr99Ltq6KwJme0L4w1POHkIsfnVuqPA325cze2EeC09WjAWXRLN0ksJ+HlBOlV+VdZeu/beGTT26dZyNriyBGjbYPJXOcU0aPJJwe74Iwh8z8DBT3y5qnsYXWAcqO0UVoGw5cp89qFU8VlYEoLoGPxxyIZMI7QpK+LS571qNxzStOagYpMFqMsYq1uYWvaOCCgepbNx/j4dczFtrFiGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aDSVLCHYlk+rnzKHfjhWlx/QkAfrrfERg+zdgMBG6U=;
 b=tFoFisNIOapP/Y5C7lav/G/BsBdmJKZnQ32tIlst9PQ+QEePNCuASDTIJ488jo3465b6lp9D2dK995HE7UEM9eATr34CpO3Sb+/OdpDzS/8hNYSCf2/NH6yGAOnWlyoWh1sct2v9LyF5++fftbiDJ5JYJkDbNJ1Sc3hejp2c7JbeQd6DyJ72aB6Pc9AgAb/9JTh495AegL0bcD6Wz6HN2lmL1FIfb+KLZdclnfFhcXR7AC5RhKdGZC+xXGD/+yyQsWczkP2ppTgX4ENy0Rp7qHIx93McQhVz7KBTUsQGL0V1XkfgFZXMiZvZyYiw4KJD0y47nP89S1ozQv3BoxfoDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jp.honda; dmarc=pass action=none header.from=jp.honda;
 dkim=pass header.d=jp.honda; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aDSVLCHYlk+rnzKHfjhWlx/QkAfrrfERg+zdgMBG6U=;
 b=GpN8Gzj+lN9gUextx6Txdi7WjUbs1mBeiVq2IwffjUvLi3m/C3GJAiIJNWJYr51PX6BpHBd9YcegpQYBZwy5xZZIBwwbkaUZR1kUtAdKEuUi4qjEh4bvri872/WZ5/dHpGcwJRE8HxoNNjwa3wF7198D5zPA9nFAk4yoMv5pwjCncbzOWMhWJqqikY8AdWvOCBk6PhUZqxiC5cpFw5xdvax4bGyB26deZYXwQkdMETLcx3VaGb9bSGSgY8eVOtxZHUMAO3opcDRlyTLpAcLWXhWXIpvaSAVu3tjMY+Ps+7jhmGkmtZa7Yt0huVDo452xtju570dkC791UWnjsxjvRg==
Received: from TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:108::13)
 by TY4P301MB1836.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:34d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 07:14:59 +0000
Received: from TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM
 ([fe80::c99f:2932:2161:d608]) by TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM
 ([fe80::c99f:2932:2161:d608%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 07:14:59 +0000
From: =?utf-8?B?S0FaVVlPU0hJIEFLSVlBTUEgKOeni+WxsSDlkozmhbYp?=
	<kazuyoshi_akiyama@jp.honda>
To: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] spdx30_tasks: Fix duplicated revision in Git
 PURLs
Thread-Topic: [OE-core] [PATCH] spdx30_tasks: Fix duplicated revision in Git
 PURLs
Thread-Index: Ad00fbBy+DxqmyIcR1yoAPM9Ap/mEwLItgmAChiNNjAADssBgAAAD3qQ
Date: Fri, 30 Oct 2026 07:14:59 +0000
Message-ID: <TYYP301MB1158E4E9ED98D2902C09701AEB6D2@TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM>
References: <TYYP301MB1158B7A88A133C646658C16AEBAF2@TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM>
 <CAJdd5GZSuNS-ykMbZQc82aAqSmnGdv6-q0r7qfLUpjr_tBLiAA@mail.gmail.com>
 <TYYP301MB11587036529EF529116C88DDEB6D2@TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM>
 <DMHZHYL1PXD1.KB99W7BEUE3U@bootlin.com>
In-Reply-To: <DMHZHYL1PXD1.KB99W7BEUE3U@bootlin.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jp.honda;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYP301MB1158:EE_|TY4P301MB1836:EE_
x-ms-office365-filtering-correlation-id: 1e2f41cc-5db7-4e8e-ebc2-08df3655823e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|11063799006|4143699003|261028144727099003|56012099006|261022105027099003|261026135527099003|261026140227099003|261026130827099003|261026121527099003|261021133027099003|10067099003|261021123027099003|261022075727099003|261021135927099003|261021121427099003|261009223027099003|261022113327099003|261021130227099003|261022115727099003|22082099003|18002099003|4133799003;
x-microsoft-antispam-message-info: G16eGCsL3oRL8UOJj8dyF8vhEqQbi900bDO2qxw19LI/0bBJLnztOeqitYuD0kd6UKQ5IutgIzn+V8b4HbwBHcrPajVxFTT5KHe86RjzQfIapaVZA66ZZtYGoWkSxhraA1XEWUrRPoHHpUpIAnufTMKAOV/DOheTQwA6g3m317dZpnECuXR3F9WFkbXnlbmxrCIS+CXt8u4KWRj49X1D4DGuxEk4c+W1wQgWPZVK5go87L70zaWliVz56bxehTxafJ9ke8NxLVoPa6e/2hle5Gn6uLR5xHw4pnDv48DqJl9SAfxcCN3LoAMiO6yWUPEjVuasIYvl4gJ5xIf8hqY7gJobGAyS7Pe4RddUUW0FYnGYfD4U2PK+E/ApnZNCUSihC/Yn0xG95pn8iq9pr9mBzND245zuDdEdOdl2z3YuQ8FhIgsN7zBpHxGpE3z/F6g58DQoWld+yBuDtIbAw2jJXo+OMjy+FKirh7Da8OxpNtPyvwxGN6mB4Ldp3oSamFbcW5emVghFqrmQPHmVkQZjvOGheJh0yLUq73+CSxj6AgP0vtCEGtZsE4Fc7inT8FtWFspPU+QcYF5R0WzJ8vHO3kJjgN9pe5VGHxKsBbh2Z64eV6BtAIpB5rQaWAev5Pf/ocHCyApmugbYE86a32eOFO5AbEOmieX4Dxv6tPgyCt4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(11063799006)(4143699003)(261028144727099003)(56012099006)(261022105027099003)(261026135527099003)(261026140227099003)(261026130827099003)(261026121527099003)(261021133027099003)(10067099003)(261021123027099003)(261022075727099003)(261021135927099003)(261021121427099003)(261009223027099003)(261022113327099003)(261021130227099003)(261022115727099003)(22082099003)(18002099003)(4133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTBMUmRnOWhneHlkMEg3bVRoRnR3dFJwWWt3bmNQdDFzc1p2eXhzUTJ5MXhm?=
 =?utf-8?B?aVcySEV5M2hZM2RjQnFscy9XOUtIbUZtYjduUm1IN3ZSU05QWWlGYStxdG5R?=
 =?utf-8?B?RDlZcVBLemhxc29JWE85NldmOFl5bXF6Z3g2bU1XMzIwb2p6bEpxcWJMY0Ez?=
 =?utf-8?B?S2ZqSjk3UHVMVnljdm1uV1dySk9pSk53M2EyWm0wWFpJWi8zWjZSTWd6T0Zo?=
 =?utf-8?B?Mk54TkNsVmx1ODBvMkI1QTFHTHIyT3pQc01qL2c0U0FmcHFCd0p6U0dVbkkz?=
 =?utf-8?B?VURuRlRxcThHMnQ5SmZYbE0rck92dDl4ajY3eTFjejRxS0tqNEVrSnBaWDhI?=
 =?utf-8?B?SHc5QjBMcW12cSs1enZXZElaR2c2TmZGMHlsVmlNZzdsMGxWYW9wcXpFTVBY?=
 =?utf-8?B?R2xzUHdrM3k5SDdQcUlQTGY4UUdpMVFiNnA4MVg4ZDVveXY3SmhPVXFuUFpn?=
 =?utf-8?B?ZDBJVDU2TE5OUG9IQnhxMEFVeitIcW15bHhZZGtBanI5M3JSaitGUGhYN252?=
 =?utf-8?B?MHBPVEFENWNKUUFEcWlza05LMlpURGd1aXpMdTA2VVR3NXlUY28vdWdyRkhh?=
 =?utf-8?B?cE9oUHoxVkNDbnF1ZWovaHFoTGhacEptcXlwK2RpWGg0d2J3VW5CTGpxUGFa?=
 =?utf-8?B?TXlxbWp4cm5nKzdicHJpS1ozdkpMUzIwa1cwSEdibWRrVFJUSkI2UlBWdTBx?=
 =?utf-8?B?TURBUEQ4U3dRODQvWXlmZkZyWUlVSHZhLzV2WVNtam0wZk1VUU9PZENRdmgv?=
 =?utf-8?B?dVVZVHc1ZmN0TTJQdEpOM0tJMVhpOU5OaTNOM25iY2Y1ckRyZUlmZmFEYmFD?=
 =?utf-8?B?SkYzdU1WQlF5Z3JDQjlqQkdkd1MvVCtUcmtyQ3FEVWxyME5qVUhLOU91aHI0?=
 =?utf-8?B?RVcxYWlSK1VjVVVyZENuaElRNmJIemhDVXoxQkh1ZnVWNk5hcXJNd2dMY3Zi?=
 =?utf-8?B?MDlzZ1hIWlJXRFltRlN5anhkKzdneE8xbTVvZXozbzZpMkNCY25Qa2plRVRw?=
 =?utf-8?B?aEQ2NFcrbGxEaUU1azhCZzZOMUZPV29tdElqWW0yeXc4ZGNMVktTRkk5ei9w?=
 =?utf-8?B?NzRkMDFyWStBUVJtZ0YxUE81NjVzS1dWL3MvRTdlMnpVaDRLem9TNmlVMlBy?=
 =?utf-8?B?TEc4eTY1ZUMwNWM2RVpFYThPbjBzaHQvMis4Y0RPNURFYmtIdGUyREVnclVX?=
 =?utf-8?B?VUdyYU9lVTIrUUVBTG8xeHNvNGUybTJLalA0M2RtWDdEQnVRaVk4NTUwbTRk?=
 =?utf-8?B?elA3WW9wWEMzWmVsK3VoTHVRa2J4d2dHalBLaVI2WUROSEZud2dBNzNuZFRm?=
 =?utf-8?B?OEQ4S1IrK2IxZXJYYjFGWmtSZWxuSUZxWnhQY3hHYUI2NkYya3ZIb0o5YUVR?=
 =?utf-8?B?Y2dBMkU4RE50R0daemZmZ2tyT3BtZ1R4QzVndVNtbW1jUFc3elpianVvTDdF?=
 =?utf-8?B?RURSUFhUK0hPVFUrNWRFQXFNVHVyZVpCcnF6ZjRXSjZDV2tuM2ZwMGR4NUl0?=
 =?utf-8?B?Mlk4Z000Q1FSTk52VUk3elBPdWhHUmh6QjlwT1UzVTBjZGN0N0xiQjFFRWFO?=
 =?utf-8?B?SDU4QlFuaXFhMlIyOGs4Mi9FUGREVitPZzRaUW51eU93UmpjTDkxODRPMFEz?=
 =?utf-8?B?OVNEa2dNNGxVY2lMa2pMMjJvejNOeS9JZm9NTHdMQkNkRS9uRFV6K2VKeGRJ?=
 =?utf-8?B?L1BHOWZOc1pUMFhTWktwNW9VUThIRTllSHMwOFVaZ3RLdk8zTVd3UGxZUlFN?=
 =?utf-8?B?MDRvc2Fra0l0OVo1M3F4M0E2aUppMkNaclFrS3IvSCtpcXBUT2tGUTFadmFV?=
 =?utf-8?B?WElXbmY0aGV4VGhQNWdjSSs5YUtFb3NpU2d0bjg5TVJiN3dSc3lwNmoremxt?=
 =?utf-8?B?ZFUyMDZEN0lINW1MeHgvbmhyTXdiK1FTOEFqazNacGNrT09tbHJMY09qTGRV?=
 =?utf-8?B?VUUrU0xCVlVOZXlIcytWZ0s4dDhMZDVSVGhPMVBaRldxUElNL1p1alF0Z1Y3?=
 =?utf-8?B?WEcybUw4NDB5bWFtSWRJREgxV0FZbldWNGJQd2dhSVgrV2ROSTBlMlJEc1lw?=
 =?utf-8?B?TWZFYWN1bW9yd1QvMVBQRjZkTWR3OGl5SkxNNTdndlMrZG1CckxCMzBrSW1l?=
 =?utf-8?B?azQyQ0l4Y1Y3M09hOXBBMjErTWgzTEx5VmtlYjhtdDYzOHFrK3hTeUxRN0ZB?=
 =?utf-8?B?SzNDN21Id0M1NUhNbzlYVE55M1ova0xhcWVNQnNkL3MzWjBkSWtvaXVvaWk5?=
 =?utf-8?B?VHJkM2hMbFNjb2VWR3E1Mm9nT1M2WW9yejR1SXRxZ3FYeEs2TEZHVzMxcXBO?=
 =?utf-8?B?Y2x3MzMxOG5EMCswc2kxd3dYRE1zWXNPdW9jZjZXam82dkZFQ0Z1Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bCf/KkR7Y50zvMzqhVEw6pgeOfKsPJZ6Lt0BwJnpbBuOMHzT27pKuBNmtMExXscqk5f14iIki/rLQLsFqcmsrQ0u4Pu6poEgG0KUGJ8motSHm/rXIi0AgtAYPhnUaozHX9O1/bws6JJqA4EwPLlrXHUhBqs1svbqi1doIzBDzK4qoK/5PVo8yORzvRnZ8mc9CwQIcTx7NsdDhPYTgeqfDiMh3NMTN5UPr6RCCDTSON4bf+etWZVfY7u0uxCV/YClriZRgis82MPviGwShO6D/00rD02j2cSpAXMCGrSCjjvd+B9OPqFgw0Oyt6gn3qlo7PB/8cpqoQ8lQegnPpStuA==
X-OriginatorOrg: jp.honda
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2f41cc-5db7-4e8e-ebc2-08df3655823e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2026 07:14:59.4980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cc138ffb-9c4d-433b-b211-d4549ae62e8b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n0qkdgRL1t3zWWZdUkSz63RdBp1VmVk72JaV+gw9gsjtAqOxeBnkyhMam7u3nx029x2JUXB8t+akbh3DlesuRyYXEtxKlVDkW3KtzuvxD3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P301MB1836
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248993

SGksIE1hdGhpZXUNCg0KVGhhbmsgeW91IGZvciB0aGUgcmVwbHkgYW5kIG1lcmdpbmcuDQpTaW5j
ZSB0aGUgc3RhdHVzIG9mIFBhdGNod29yayBoYXMgbm90IGNoYW5nZWQsIEkgbWlzdW5kZXJzdG9v
ZC4NCg0KQmVzdCBSZWdhcmQsDQpLYXp1eW9zaGkgQWtpeWFtYQ0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogTWF0aGlldSBEdWJvaXMtQnJpYW5kIHZpYSBvcGVuZW1iZWRkZWQt
Y29yZSA8bWF0aGlldS5kdWJvaXMtYnJpYW5kPWJvb3RsaW4uY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IA0KU2VudDogRnJpZGF5LCBPY3RvYmVyIDMwLCAyMDI2IDQ6MTIgUE0NClRvOiBLQVpV
WU9TSEkgQUtJWUFNQSAo56eL5bGxIOWSjOaFtikgPGthenV5b3NoaV9ha2l5YW1hQGpwLmhvbmRh
Pjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KQ2M6IHN0b25kb0Bn
bWFpbC5jb207IEpQRVdoYWNrZXJAZ21haWwuY29tOyBQYXVsIEJhcmtlciA8cGF1bEBwYmFya2Vy
LmRldj4NClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBzcGR4MzBfdGFza3M6IEZpeCBk
dXBsaWNhdGVkIHJldmlzaW9uIGluIEdpdCBQVVJMcw0KDQpPbiBGcmkgT2N0IDMwLCAyMDI2IGF0
IDE6MDkgQU0gQ0VULCBLQVpVWU9TSEkgQUtJWUFNQSB2aWEgb3BlbmVtYmVkZGVkLWNvcmUgd3Jv
dGU6DQo+IEhpLA0KPg0KPiBBIGdlbnRsZSBwaW5nIG9uIHRoaXMgcGF0Y2guDQo+DQo+IEpvc2h1
YSByZXZpZXdlZCBpdCB3aXRoICJMR1RNIiBhbmQgYSBSZXZpZXdlZC1ieSB0YWcsIGJ1dCBpdCBz
dGlsbCANCj4gYXBwZWFycyB0byBiZSB3YWl0aW5nIGZvciBtZXJnZS4NCj4NCj4gV291bGQgaXQg
YmUgcG9zc2libGUgdG8gcGljayB0aGlzIHVwIGZvciBtYXN0ZXIgd2hlbiB5b3UgaGF2ZSBhIGNo
YW5jZT8NCj4NCg0KSGksDQoNCkkgYmVsaWV2ZSB5b3VyIHBhdGNoIGFscmVhZHkgbGFuZGVkIGlu
dG8gbWFzdGVyOg0KaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0Lm9wZW5l
bWJlZGRlZC5vcmcvb3BlbmVtYmVkZGVkLWNvcmUvY29tbWl0Lz9pZD1lMzE0NzlkZGJhZjVfXzsh
IUtFaVFsdTFCMzBCdCF4N3dhbEl1S2ZOWlZnMDFRZmZKb1BOTFB5cWF5bXJJaElLbC1EdWhMdlo2
Z1JlYWlWeUc5RFRGTlhQSWFPNFZxZFhrUWh4S1J3bjg1TTZRS29YMERyY2kyWGNIdmROOXpUVmEy
WlZxOWhSUW03Y2ckIA0KDQpUaGFua3MsDQpNYXRoaWV1DQoNCi0tDQpNYXRoaWV1IER1Ym9pcy1C
cmlhbmQsIEJvb3RsaW4NCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCmh0
dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2Jvb3RsaW4uY29tX187ISFLRWlRbHUx
QjMwQnQheDd3YWxJdUtmTlpWZzAxUWZmSm9QTkxQeXFheW1ySWhJS2wtRHVoTHZaNmdSZWFpVnlH
OURURk5YUElhTzRWcWRYa1FoeEtSd244NU02UUtvWDBEcmNpMlhjSHZkTjl6VFZhMlpWcTl1Tkha
LXNFJCANCg0K
