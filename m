Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27953.1793857637577694789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LVC8+ebG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=576940a4f8=abinivesh.ga@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A55R8Vw3858387
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Nov 2026 05:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:message-id:mime-version:subject:to; s=
	PPS06212021; bh=Z4DMn8JzwGJIxKwdY9AQ5gWD9eHXsylHtzw+ADY8IZI=; b=
	LVC8+ebGEh+TDeavVsswVChiFbicSV/B+Ywxk27J/lYe0OMN9zinrQmpCThLThdp
	ir2WTvYeNXPo8d+aKF3yMvHFCY6n5cQTbY3P49Kuy8LTQABDZgKMM1zlJYhpJyTD
	v5VSnekQ7LufJ32cFcu6IvD8/umtnCexUgVELN6DgyvuPGXUoT8xWYI2mjTZ6ED6
	LZJ8b3LgUsFIQWjhzj0X8/nH5Hj1QmKdIX4zmPhfKfINIZMDuGe8Hrq9eThgJIr8
	OuinbAju2S5ce8daliUjsMhNHbwlG0c3wr50CyBiCh6+njl1gR+1SW6wSUSUiLFx
	UzqC0wCOh2Fm2EutjUNq1A==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021107.outbound.protection.outlook.com [52.101.57.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hrafhs4yr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 05:47:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MD9+C7CCOEv1WqfIl9Z7BmeajiOtMIhgeUYRa6UmuKsBQonm55Qx+yfRp2boja8F65yZO6yzj+jffLPXeRGBfRL13PYxzy52zDjwTcBR/5PD6X1lxSChMpJyxMulRlViTj4vwgU4VSQBaPaF7Y5fV3zAA0hkYhJaxG1bH2Ys9jjy5f5fKCW32tpldWnNNMuOyVcHALQEjXJNBe9eGKSOom1SLS5W+z0GapnwurYey+G/NtDg1dX9tp07QMRO8mv9QIANL8t3q2A7+ODo2AnV6Zvb3VDgAwaDUH9HG6ACAepG3Bfheccr9bGRTpbQOdyx59x0zk1to3QTvTElV9qjqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4DMn8JzwGJIxKwdY9AQ5gWD9eHXsylHtzw+ADY8IZI=;
 b=D2HG9T9qLrYqRBvdPQrigP4dWyao9h7tZCUjlXfEsYn1QlO3DC+hzMs4fUMp3s1lSg7jSz6/slWREHaAbxRGC8otXsXM5RUZj1unYmd64dLiZhnr9s4YY+NSctgrxepwLcYUGjYLbE6b96uvLFDSPAf2MXy28R2EPJtcoTCEEEqkIpvAOv9XcZSFCNGwbdEiKlbUdmXs7+XTO/tuPPTGhHFPsmC2RRLEjIbFIScO85HBAXQKD2zydZ8xQiEAQ2F8OeHV6yQujZL40aMGawS0vQ7zrTzfn7A+xNPMX9u+j8h9nYhM8MGoc2Acd4+o2nIyeChvLr3c7kBQQqr4o/zTBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB8031.namprd11.prod.outlook.com (2603:10b6:a03:529::21)
 by SA2PR11MB5036.namprd11.prod.outlook.com (2603:10b6:806:114::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 05:47:14 +0000
Received: from BY1PR11MB8031.namprd11.prod.outlook.com
 ([fe80::a757:a627:ec17:3a6b]) by BY1PR11MB8031.namprd11.prod.outlook.com
 ([fe80::a757:a627:ec17:3a6b%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 05:47:14 +0000
From: "G A, Abinivesh" <Abinivesh.GA@windriver.com>
To: Yoann Congal <yoann.congal@smile.fr>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143
Thread-Topic: [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143
Thread-Index: AQHdbOgNrA/zCIqc+UqqaaIlgRT97Q==
Date: Thu, 5 Nov 2026 05:47:14 +0000
Message-ID: <BY1PR11MB8031A62694F8067F9ECF572396772@BY1PR11MB8031.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-11-05T05:47:13.368Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR11MB8031:EE_|SA2PR11MB5036:EE_
x-ms-office365-filtering-correlation-id: fef7e24c-fb61-4d8c-2cde-08df3b003e5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|11063799006|56012099006|261022105027099003|261022075727099003|261021121427099003|261009223027099003|261026121527099003|261026140227099003|261102123227099003|261028144727099003|18002099003|6133799003|10067099003|13003099007|8096899003|3023799007;
x-microsoft-antispam-message-info: So04E5+MWUHwYFdagclF6Y+kPQ0IPObsNdNnV9DyJUhnsdpqOKDDsc0sPISjPI+eg/iR46KV/TFLmFQL44d2+1Ra+m1l5QNGJV1oWM//0tcQZPaFEXKaQWfbMLf43GN6PXNc0QMnxBPykJFSjXW1c1I9cjt+SnokDYGno3K26gqe48CiNIr+6wTr/Lf1KlJkTAZFBMywVLPJg5kfbp2AocQE7acAYyAEznEt33WOpLPJG7J+Zo+BaddzJWZMw2g2ysc8DvqRvGYbDBCH5WugNK7USmWhUQ+4fmOyjO9dHkmoDpVSX6Z4pqLYZiT8Z4G7yZa3+XzgSn4ociByVBWFXX5i6liAae4y4WrQJCj9I3ghQ8haK7+SFg4Ec/e3drr7N1b5SNwGNGgt/Q0tksUzJCq8+4Vsr1VG65BGsgxQrnK36KJGAEVsUyNgS2vNdfzXOVWeh7ZesoANqSBIlS1G4axpau/uV0Fp9dpqHsaq1/IWPWeXQZiL6eDUUl3KobaXX9bkhrI3vg8Z9AYL+ujHiF7UdPSn4y/eFr2Oaia+dr9SKTjUqoBVedPA//ctQLcFKHsQW7DuHquyw01l+YdawWcr7i2XzvnpJI6qWDd0LqEBNglPbR9bUIYGs+9NiRSWFAPTjJ6L1OVOTnF3VT9y/MQ+ozGWn54Zpfnz2mLKK/w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB8031.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261009223027099003)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(18002099003)(6133799003)(10067099003)(13003099007)(8096899003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?7acS7bIk4sFzRSb7auSm4WXRPfQhXQauME28fGznKuVHcNCE/Vw3KNvE?=
 =?Windows-1252?Q?AYA6zYVy4IJ2FDMfPuVAga3aLWiC8W7ZznWDHBAKPxUZorzJ/evKVCeS?=
 =?Windows-1252?Q?qXdF+EIBgyzK54j87cTz9yv89pVkC+YD1Fvdte1MbBW9cWCNhguDq0H1?=
 =?Windows-1252?Q?y3dMyIWY1Fp7WG0BAGhBfZVaWCFDK5kArlceNKpHB36d7hBQdMdqucIo?=
 =?Windows-1252?Q?A6O7VjMJRaOzgNgFQWYGyqUBJAHu6bOEM7UL1qmk8hTIuLa7PC3qdRad?=
 =?Windows-1252?Q?YYIvJTuaE5A12DKVcW3hAn0M8JuCZzPZT1IN0SFcAGH3jWDBhzj5lzWN?=
 =?Windows-1252?Q?0IDy/W8yIZ//+mw3AjLhTxv5L/0z24Mz/OlMXDQBAS6RGTwelxpS7Yj4?=
 =?Windows-1252?Q?tCL0k/p2FlaipG2qGhXsr76h0jbCY+8sf3GylpJG7GUea+wFr6AT2598?=
 =?Windows-1252?Q?d0H3IxorqI4Glps4SrO7WsxTWICOAVapwKsMsl/LhrFZu8JV0gLxq7He?=
 =?Windows-1252?Q?Of4YnWA5de0KH14HcYiyxc/b4fV0jnHIgO/ZbWWxDSERyUzY+0zkYVDd?=
 =?Windows-1252?Q?Corr+D74Xe0tuIM+0PsOgtMhs/Dpd/UQfG7M6O+NYVVJPU6aBBZeBC8s?=
 =?Windows-1252?Q?h4UWX/tMVSwtLNnhGnSLAZgMaxy/Vjs2/PB9D+an4pLE4E2gRKfzPtPh?=
 =?Windows-1252?Q?RKhwc42v6bbnREi1EqrYeYbhDA87Hl5uxzig9fsi0cMzhF0PsCK7WG1o?=
 =?Windows-1252?Q?sHLmx/lSmm2QYXH7IGmkX02z13K1Mzu9nPZsRMNfD7RAL9NaHpLqqaPQ?=
 =?Windows-1252?Q?XX/cnQG10uK9OWl+8iXXah7yVKs2ZOCWCH/x92m8RSiDhsEBo/RNovk8?=
 =?Windows-1252?Q?PtWuunoX5bBhbpcBr8CptW62M+mKloAg5M/AD/Ma/y4LQhuVW7xbqMje?=
 =?Windows-1252?Q?JtDf/7VISEZwnyIRtLc6gOVG9CC1jO7ce5nf4xHU+I+ceqcZ7oZLowfS?=
 =?Windows-1252?Q?ddgSym3Mxf/AMTEUvrZNiuZm+DrI/r3nuWB+PvPghY13OyvsKNb3a6Yx?=
 =?Windows-1252?Q?j4WkfVGKXulXbqEQFJ0THbcdOyJAsQcHy+3YRu4zYdCg2wHZ/WySYFNS?=
 =?Windows-1252?Q?aot8CyJjbBkdnQtqPEm5zIIS3P+2OMnpDJROqRPGuiyygMV8j+eMRsBj?=
 =?Windows-1252?Q?1hQCxMPBXwxPDX6pbA/S/q0xj98kE1gDPGVGJaN4rNSxPvLERyz4Iyen?=
 =?Windows-1252?Q?m9vGMZwo2TL7dyy47FKkNInZCaBJJVqG8viZ7uMO3/CDOl5X/EyRsVlF?=
 =?Windows-1252?Q?OLuOBqWlNESjIPxwmo6GEMLgkxR46hUtYCap4l2naB4P7SD+DX4mtzc8?=
 =?Windows-1252?Q?m0uPDur5MYXR7MOr8/Xf4te402MYDfKhZ2siz+k4eR9Li/I7fCJuXaMS?=
 =?Windows-1252?Q?mLQW7uKuvKi8j39ji3LJJWUkJpcABsTIhAhMfh4INF0yG0K4Edju3QFG?=
 =?Windows-1252?Q?irWdkz9MzRBHF2ZRB0THuJ0EmgNeLCkz2Biwz2TwFg7ggpsVhbTMBhir?=
 =?Windows-1252?Q?kPrakVI743qRXmTWH+XCMWR2UKSTHBOFHngg6whcqd+XU8ZUT35LJ2Ag?=
 =?Windows-1252?Q?2Me5WNhRZZTvPxwWhL/y4Rb0Uhndz6wXkbp3sEKLM8nRcPrMB1VxTi3P?=
 =?Windows-1252?Q?bslHTmZ4qQZV1Ik2dUS2tnghDt+Iia/wZ6TkFMY5OLZklWFwUAPExl2M?=
 =?Windows-1252?Q?gmggMLRqMOX5bUIAeO7Al/g9Sy90DmEiIPZ7WIguwZZjVw3URmQXz9Pl?=
 =?Windows-1252?Q?R7WqZryAeGlqoovVR5ATCoEayXocffSbPic1rkyHhDmPAUIZ1rSiIO9F?=
 =?Windows-1252?Q?dq62IOQ2/1Ou6g=3D=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Gd/CtzcqKxCIvwMBiObtkiFeZe5dpd48OmDkXYbf6FQbxmkBRJ6yvjtLb31rnQjE7b7xrEnrPWS2M3xTJ1bHZ0u8GYt8YEh+Wj5nU2yeTLpEP9dYOc3z06miUeojs2NgTZtQhyuNUuNzVM1qcbPZ0UKmoJ+DZYSrhqN4e2SHAxpgSwylqlEn3TdtCC9qWh0V8GLqapn6S3IucMKfhsO8oQA8JzlBWQlCpEOyhN62mV+lkd1J89+ZTMuJOXcmkbXOYm78W78oMiahedt8e9WngibFVmn81geC7PhHGq82niaz49nNaU3mlbT6NVTzhQzO7t4ei7UsVuhLn3PaAJ7w0g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB8031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef7e24c-fb61-4d8c-2cde-08df3b003e5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 05:47:14.1586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YWBejcZTLPLZAsQeBuisJGrt7Ug7AFi8vtFE6Oc1+UJzoyKZbDvckhikRUNcnsCbNnu2WjqjwKwT7vDd6B3JJivGVNWKUt3visDXdp38OHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5036
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyMiBTYWx0ZWRfX00H3IsMYIEMu
 6ER9bbvl7jeXUWELtUev/3hmNsPRTV59kZAgf3boVhbfd8HiiK4Dh9R/4nChp9niMOU9YVzoMRt
 XdegvDvFvZysCCnBmlfFcBWexNw9mnDkTk903pwHaM4Hv4THGe6Mpqy6NqNpExgukJb3weoKdXT
 6B2eEjeAmbBvy/BcKut/cifJmSYIEgCoOCn9zKieEGUIWHIJDpGOE+luJtUY1nwTCkjs/R9jv1E
 KYdNXkGPAUnoAA9D3AfMlqLPFp3plmGqSB+2s286LRzK7zeOY55kJYbBhnT7Ke+frBtLWKjTGGK
 oPX7M7yTbxrOZ2Rgremx4ehc2kczPs+E1OmcKgTFM6m4Cra5DJar059bmRgbz/1L+xc8ZmeGBdp
 q6+FfDd+IrwrCFHfFY2Z3HC5sdQ3ytP79GZKvfrNgZZtNvDmhU++02mlQSOKoYQi5eVuAYCPfyC
 4OOMhVLtQuuDF+sfRYw==
X-Proofpoint-GUID: 4KKE1tcxuHMXcUtTv21SJkZNRIuVps81
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyMiBTYWx0ZWRfX6Rb7ge5nFGc3
 HAEuFqnkN0IDRxdi65w0BSiXWurQc92khD07KyYcu2WnBmjWX1jIPt0CojoS6R/GtieOL5MHKyx
 vso7zZtV6jMaBkIyCby8+DfhycObNCwvc09IX/1x+IKnp6jWdqu4
X-Authority-Analysis: v=2.4 cv=ZIJCCn7b c=1 sm=1 tr=0 ts=6aec1864 cx=c_pps
 a=AVViaUQ/FgKrFaIAxxVSSQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9
 a=pILNOxqGKmIA:10 a=O8hF6Hzn-FEA:10 a=os6td0F4vwOMeDdL:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: GzQe3hSqtIFR7rfDY-E0Ap1WemjoQXIZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050022
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BY1PR11MB8031A62694F8067F9ECF572396772BY1PR11MB8031namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 06:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249445

--_000_BY1PR11MB8031A62694F8067F9ECF572396772BY1PR11MB8031namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

   Hi Yoann,

   Thanks for the review.

   Commit message =97 agreed, I'll drop the upstream-code description and r=
eword as integration/provenance (revised version below, if you'd like a v2)=
.
   The .patch file keeps the upstream  author's message plus Upstream-Statu=
s: Backport [1c10bcc2e172] / CVE: trailers, matching our recent ffmpeg CVE =
patches.

   Provenance/correctness: NVD/Red Hat/SentinelOne all identify librist_rea=
d() in libavformat/librist.c as the vulnerable function (ignores the caller=
 size, copies full payload_len,
   reachable via async:rist://). Upstream 1c10bcc2e172 changes exactly that=
 line; it applies cleanly to 6.1.4.

   Other maintained branches =97 the vulnerable librist_read() is identical=
 from 6.1.4 through 8.0.x, and I confirmed none of the oe-core branches car=
ry the fix yet:
   scarthgap 6.1.4, styhead 7.0.2, walnascar 7.1.2, whinlatter 8.0, wrynose=
 8.0.3 =97 all affected by the same one-liner (master is already on 9.0.2, =
post-fix).
   So merging scarthgap   doesn't   leave a newer branch exposed on our sid=
e =97 the newer streams are tracked separately and will get the same backpo=
rt;
   happy to send those too if you'd prefer one series.

   Testing =97 note the oe-core ffmpeg recipe has no librist PACKAGECONFIG,=
 so a default build compiles ffmpeg without the RIST protocol and the vulne=
rable path isn't in the shipped                 binary   (same situation Re=
d Hat describes).   Verification is therefore build + boot + runtime sanity=
 rather than a RIST repro =97 which is how the equivalent LTS backport was =
validated on        our side  (clean build,  target boots with no calltrace=
/coredump, runtime sanity pass).

   Regards,
   Abinivesh

________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Wednesday, November 4, 2026 8:48 PM
To: G A, Abinivesh <Abinivesh.GA@windriver.com>; openembedded-core@lists.op=
enembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Hello,

On Wed Nov 4, 2026 at 10:53 AM CET, Abinivesh G A wrote:
> FFmpeg before commit 1c10bcc contains a heap buffer overflow in the RIST
> protocol reader (libavformat/librist.c). librist_read() ignored its size
> argument and copied the full payload length into the caller-provided
> buffer, overflowing it when the payload exceeds the destination size.
>
> Backport the upstream fix that clamps the copy to the caller buffer size.

We usually omit info about upstream code in our commit message.
We are more interested in integration information: patch provenance,
proof that this is indeed the right patch to fix this CVE.
Look at recent CVE patches to see what we expect.

> Upstream fix:
> https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/1c10bcc2e17255dacb717a25ab3d=
b142ce390602
>
> CVE: CVE-2026-75143
>
> Signed-off-by: Abinivesh G A <Abinivesh.GA@windriver.com>
> ---
>  .../ffmpeg/ffmpeg/CVE-2026-75143.patch        | 32 +++++++++++++++++++
>  .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-75143.=
patch

Also, please check if this patch is needed for other maintained stable
branches. I can't merge it on scarthgap if it is needed for wrynose (for
exemple).

Regards,
--
Yoann Congal
Smile ECS


--_000_BY1PR11MB8031A62694F8067F9ECF572396772BY1PR11MB8031namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Thanks for the review.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Commit message =97 agreed, I'll drop the upstream-code descrip=
tion and reword as integration/provenance (revised version below, if you'd =
like a v2).&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;The .patch file keeps the upstream &nbsp;author's message plus=
 Upstream-Status: Backport [1c10bcc2e172] / CVE: trailers, matching our rec=
ent ffmpeg CVE patches.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Provenance/correctness: NVD/Red Hat/SentinelOne all identify l=
ibrist_read() in libavformat/librist.c as the vulnerable function (ignores =
the caller size, copies full payload_len,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;reachable via async:rist://). Upstream 1c10bcc2e172 changes ex=
actly that line; it applies cleanly to 6.1.4.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Other maintained branches =97 the vulnerable librist_read() is=
 identical from 6.1.4 through 8.0.x, and I confirmed none of the oe-core br=
anches carry the fix yet:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;scarthgap 6.1.4, styhead 7.0.2, walnascar 7.1.2, whinlatter 8.=
0, wrynose 8.0.3 =97 all affected by the same one-liner (master is already =
on 9.0.2, post-fix).&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;So merging scarthgap&nbsp; &nbsp;doesn't&nbsp; &nbsp;leave a n=
ewer branch exposed on our side =97 the newer streams are tracked separatel=
y and will get the same backport;&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;happy to send those too if you'd prefer one series.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Testing =97 note the oe-core ffmpeg recipe has no librist PACK=
AGECONFIG, so a default build compiles ffmpeg without the RIST protocol and=
 the vulnerable path isn't in the shipped&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;binary&nbsp;&nbsp; (same situation Red Hat desc=
ribes).&nbsp; &nbsp;Verification is
 therefore build + boot + runtime sanity rather than a RIST repro =97 which=
 is how the equivalent LTS backport was validated on&nbsp; &nbsp; &nbsp; &n=
bsp; our side&nbsp; (clean build,&nbsp; target boots with no calltrace/core=
dump, runtime sanity pass).</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;Abinivesh</div>
<div class=3D"elementToProof" data-signature-name=3D"Abinivesh">
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div id=3D"x_divRplyFwdMsg" class=3D"elementToProof">
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Calibri=
, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b> Wednesday, November 4, 2026 8:48 PM<br>
<b>To:</b> G A, Abinivesh &lt;Abinivesh.GA@windriver.com&gt;; openembedded-=
core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt=
;<br>
<b>Subject:</b> Re: [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143</div>
<div class=3D"elementToProof" style=3D"direction: ltr;">&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-size: 11pt;">CA=
UTION: This email comes from a non Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Hello,<br>
<br>
On Wed Nov 4, 2026 at 10:53 AM CET, Abinivesh G A wrote:<br>
&gt; FFmpeg before commit 1c10bcc contains a heap buffer overflow in the RI=
ST<br>
&gt; protocol reader (libavformat/librist.c). librist_read() ignored its si=
ze<br>
&gt; argument and copied the full payload length into the caller-provided<b=
r>
&gt; buffer, overflowing it when the payload exceeds the destination size.<=
br>
&gt;<br>
&gt; Backport the upstream fix that clamps the copy to the caller buffer si=
ze.<br>
<br>
We usually omit info about upstream code in our commit message.<br>
We are more interested in integration information: patch provenance,<br>
proof that this is indeed the right patch to fix this CVE.<br>
Look at recent CVE patches to see what we expect.<br>
<br>
&gt; Upstream fix:<br>
&gt; <a href=3D"https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/1c10bcc2e17255=
dacb717a25ab3db142ce390602" target=3D"_blank" id=3D"OWAa8eb9107-be84-f034-a=
734-121c204b5e4d" class=3D"OWAAutoLink" rel=3D"noopener noreferrer" data-au=
th=3D"NotApplicable">
https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/1c10bcc2e17255dacb717a25ab3db1=
42ce390602</a><br>
&gt;<br>
&gt; CVE: CVE-2026-75143<br>
&gt;<br>
&gt; Signed-off-by: Abinivesh G A &lt;Abinivesh.GA@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../ffmpeg/ffmpeg/CVE-2026-75143.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 32 +++++++++++++++++++<br>
&gt;&nbsp; .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 33 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-202=
6-75143.patch<br>
<br>
Also, please check if this patch is needed for other maintained stable<br>
branches. I can't merge it on scarthgap if it is needed for wrynose (for<br=
>
exemple).<br>
<br>
Regards,<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_BY1PR11MB8031A62694F8067F9ECF572396772BY1PR11MB8031namp_--
