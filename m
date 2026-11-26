Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16137.1795706825395859941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 07:27:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XGingVE7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5790daf1e5=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVcqw2664194
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 07:27:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=PPS06212021; bh=jnb8sbPk3K1uwhAlJxf2kDffSeHCnrpvoky1/376J80=; b=
	XGingVE7dkmwfHKbYIFKBT8uOydIK/BQdEsHBAmNeSE4Byyuj7BF1z4rnUNmS7B/
	XfJ6uieBlSIKhQwtr7BeSs/ewMi6zMCzziDdD0l8qNdtJLdGhc+BreJO43wH5H/N
	zmEHD4ycMTDFjTuPbsr7zAQr4O78BT0dBM//Jp9ATKJMMPj8Aajg+K3bbbrJA/9E
	HnD+De6lzHkOKNlN9TJ81bIwJZCza6zglfMRvaMkVLFjguZI0OVR2sTkNsn7GH+7
	slSTD+joe5UoilFlR+nvbvnAS7rWoSlCS1Q6mBIu+VZm5zIsBmlDpbKAg4hj0c96
	b4AeeIYVheZGdB+P1GsG9A==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020106.outbound.protection.outlook.com [52.101.193.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j60gh2vku-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:27:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLWUVqPfe7QoNMBPeJpz1xOVfVze+MekzBOF87jm5UZpX2R4pBB2wHl/br/Nl2K44+ISxU1UTQFQc8mVWsmOzpvfx5MuY7qwD1zYfOQOXfWm60m55vmgwIw+0tk2Zj/IW1WLW1J9hX/DjykVxQMpnX5i8o60BnKuCIJtAmNTo0382FoOgaeslgeOHNIBaymeT89oGH4/cxfiF2ArFgKnk9ZNHPtoQcqFjOH6lErDobgXgZSaCtSeT2cNsqNj7D6tlbxDYqedsCglXHG95SsKGtFkmMMtbXkqQZoRehz0o+x4I3joUHxFyQUx4HNVC4DjeCT+OUDGMDXwUyL52qk9TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnb8sbPk3K1uwhAlJxf2kDffSeHCnrpvoky1/376J80=;
 b=so26p2eDxjpoSPDog2wmYdF6sNndVeswKiFUZW9T7aMqNu12Arq5dSGKC2dd0/A1aCP8JMBLr/YnivZMZezB3ixW5AyE4+OfPtbabRsi8dNQ6VR+3Gq+33dyddiz1M8G0Y3UTyfncm5A1FQGmQ+X2qPuu92azzl46bL9e4SNvx8zcSw9OV3UOi5KsU59VDaHuDWYlpKMInVrV8WCvvgb0Zn7QRRsjARxxmScpI3VlKTmKUgdq9VFbiPWKcYb7jk6CltVc2bGGs293rC8+e/Vo+NkG1T/3SoAaN/BsBLxaz8I319zkZ6jAksKx8TaYygHuELdk6I8vveJgAK2cdRbyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA3PR11MB894536.namprd11.prod.outlook.com
 (2603:10b6:806:532::22) by PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 15:27:01 +0000
Received: from SA3PR11MB894536.namprd11.prod.outlook.com
 ([fe80::2af0:9d0a:b8a2:bcf1]) by SA3PR11MB894536.namprd11.prod.outlook.com
 ([fe80::2af0:9d0a:b8a2:bcf1%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:27:01 +0000
From: "Gavini, Sumanth" <sumanth.gavini@windriver.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [PATCH] shadow: upgrade 4.20.3 -> 4.20.4
Thread-Topic: [OE-core] [PATCH] shadow: upgrade 4.20.3 -> 4.20.4
Thread-Index: AQHdfCgCV0TzBi9HzkScQW+WXD51hLdAaEWAgAAUlAA=
Date: Thu, 26 Nov 2026 15:27:01 +0000
Message-ID: <fcd2b46b-163b-4098-a160-9d6b512c5bb1@windriver.com>
References: <20261124152449.2973779-1-sumanth.gavini@windriver.com>
 <3085864B-3AB6-4135-B33C-8663E1346941@arm.com>
In-Reply-To: <3085864B-3AB6-4135-B33C-8663E1346941@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB894536:EE_|PH7PR11MB5818:EE_
x-ms-office365-filtering-correlation-id: 4c011dac-82f2-4a50-f3ff-08df4bd1b7ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|38070700021|11063799006|4143699003|261022075727099003|10067099003|56012099006;
x-microsoft-antispam-message-info: C6pgl/XE3ECELJUg7X0Ph20AnHH1wxfAnNbQG17xir0aKXS+cmHbI91HHVPYEwdr1qCWjUwl4hp9C0K+MkQqQA2k/EHZc5e6O2KDVB3ZjDj37TyCPNhx7YbnbOVQ5D71XQ9MLSP5RY5Ig3ddlRXxWIS69/PtA6y/YVQZNrdj0Dr27L/DA6psI/7c21/ib0doI22cbm4xjLnVSg13csoocO+OkyoARqknE0sMHf4P2MNlQWJP/UfSsdtESIfk3LiWFy0LtXQ521EoKLM93wqle+CCUtB+MABPKI82puHVchL1nt4YzeMQpl7AyXZUxLe0JI8NmiXDpB1t0AfDFFaKUDOpl3LKg79rxSnWH019GDZUnrporiNQcs/DFf6eP7bVDCzN3S/JjPS5sdmfS8oWTsp9KGGoBmPSQsDCJ+ZHca/SM++Ay0GYGLPYH5UwyNpLHstQBUSPd4y1VY0bkhQfSsA4mRhGlp0AxfxlJWU8tKCutcyv2CZv2cLq0RZt/PZXiW/xS4PGhDXscjeT1uVKdeONiYjcYikkg/olw5mRFnPSSrZf3V42oVYn56IxTNrdAseKI22+QYrQozPTeQLJ2hJbWXp8xDuzBR/NDXcqXxdFeaSSXI4P5ptlMNW/Uh0z5yrSlaEmAg3noxYC6XCVrPEHq0D0gF8hO8KsJqQuTAzYvU6i45tuRgqBXAexwee4YtKtiED8lm60OAi9uDbbqEMUcJIqWM6FznawEIa9Ko8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB894536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(38070700021)(11063799006)(4143699003)(261022075727099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0IvVXFUVzJHa0xmS0lMckdvdENLczlCTHhDZ1Z4UVF1ZUxXTmdOQzl5MmZn?=
 =?utf-8?B?Q3ZLSFA4ZVloWDNmcnNHOVVpSThHTkdhMm1QM2lGWDdOVlRZN2ZGUituMVR6?=
 =?utf-8?B?dGhoTmFycmhma3VTeHJQSDdtRVUrVUY0UmNNTGlzMzJOYkhHVkhnVVBsbFgx?=
 =?utf-8?B?L1JRc2RCeS8vRERUMTVSak9Yc1hFaWdlK1BGQ0NOalpRZklMcEIwcHFwQnlK?=
 =?utf-8?B?VEJBZ2YzcXJFYWp6Qjd0TXl6MjFPdS9QelB5TGFEb3hCSEpLZzF4eTIvanox?=
 =?utf-8?B?VnFBWlNlV2Q3WnFzYklzL3o5YnpPRi9rSm1GUngrNmVSSDRBNGNGc3pSbUxR?=
 =?utf-8?B?T2ZmVmoyc2tNWGMyMy9SVlhLVGhVTnptbGJRd2d3Wisxek05SzBPa1ZpT200?=
 =?utf-8?B?T0x5V0lpK0VsdURoVWNKcGJpR0VqcGJJWFJ0TmZBOGhmZjBqZXlGbTlpNE5j?=
 =?utf-8?B?MzRGT3ZqWEhLbzNtWFg1cFR2RDZpZzhYNGlHd25yMk51TUpqTTM2eUdqaTdj?=
 =?utf-8?B?MmNQODFhVWQxM1E2UzlFWjlYQnQrY0NEVlNsSUF4N0hEVEF6TzNSTEorNkRr?=
 =?utf-8?B?K0pTYlAxbGdTT0ttU2cwMDh1UytybXYyNUxUb1NDWjgzNVZpRjI1aXJhQUI1?=
 =?utf-8?B?TXNNYmNyUmxxVGdzL3VLSlNIZVNyVjU5cHBva0NXTVI5b2lXZ09udHVVM011?=
 =?utf-8?B?am5kaXpTLzJtbitIMG9FSEFaYUkzZW1CL0R4S2NPeGFidVZWQldUOEw0aVlq?=
 =?utf-8?B?VitmNFBXMU1pWTUxaC9JV1ZJemVWancwdnJKS2xZYzVCb2JrZTcva0EyWHJ0?=
 =?utf-8?B?N25wUGFjbXFEYzJ4NUs2U21RWENRZnpIKytqajhUdDFPV3RMWjZNMllJaG1E?=
 =?utf-8?B?V3VlWTJXM2g3THJyRE5RS1l3VTRobUZQQ0hoeDhyRUlPSnl4MitwUmJNN25L?=
 =?utf-8?B?dHFBc3JabERjYlpQa3BZazhwMldkV1pieDJlZWpuZGtLSlo2NVF4eG16KzJO?=
 =?utf-8?B?YlNFUHRwZC9qOUEveGxRV2FmME5HVE52Q3ZlV2hXc1RKSUxzYU9lRnRCbmlT?=
 =?utf-8?B?ZlEzb3pvZ0dZMVhMVU0yUWJxcHVtTDQ2UzdPeHRkalRaclFrOHQ0NjJRSHgw?=
 =?utf-8?B?MkZnUVVPMTA0MU5IbzhXTzdCRUFoZFQwdEZndkNiUDRvT2NrSitqYnZmNHNN?=
 =?utf-8?B?Qk1Ma3h1cnc5a1RuODEyeEdQVzkwdDNFRnkvR2JGdFgxYmlpQXZzOGtaRDhE?=
 =?utf-8?B?MjhLRGJBRTRIOVFPeEc0Mzc4Y3NHTTdGT24veHhnc1Z5YkZmNmNJWUNWZ204?=
 =?utf-8?B?cS96K0xqK2pIQklPMm9GWUI4VjU3WGZlaCtPMWpNbGVQUUp1MWFHVnliUTdC?=
 =?utf-8?B?QVNJaDFVVnlqS2IxOW54RzdmQjdGVm12Ly9FaDJmTlVXcFFnSUlsdjBoOXp5?=
 =?utf-8?B?dm5NNDVkQk9kZ1YxVk9mSWsxamhaMkg0UGoyWDBkREE5YjdmL3RYN0Y3cXdZ?=
 =?utf-8?B?dFVqRDYveDdqWmtYMzB5OVVGZlNqYWRCTWhGUFEraGJFN2ZWbUwyZWRGZmN3?=
 =?utf-8?B?SWlrV2VmZXJRNFN2ZDc1SUxLbktUQngyYjJsTFFYQ2lZZ0E5Q0xqaTNjc2p4?=
 =?utf-8?B?Q2R2cjhpaXBKUmhrVnM4bDhzc2R5M1pLbnhsNEtXeVdVQnJXSkNyMHVBaHhG?=
 =?utf-8?B?UEhIeW8rME5wVWdSNVBQNit2b1huNDZWeXRBRWxUM0JuMWdPVTZMUHN3QVJi?=
 =?utf-8?B?cml1REJOVXg1SmlMelVBZFREaTJmanhPanluaTIwY1VZVEM3eHo1ekpvdWtr?=
 =?utf-8?B?RjNNRStLRUJES256VWhwMkxLRTVXdTZpRGdZWTE2alRIckpheGJRRUZJZ0o2?=
 =?utf-8?B?S29tU3AzR0pDanFaalpFRjJDWkJQT1lHb3hJWXhZZ3VoQTVkK0JkQjZma3hD?=
 =?utf-8?B?WkhObXJicmFrNGY2TTIzeGxGTlhMeHFTQkJkK3RGY2kxRlBoVUdnSEs0RUk1?=
 =?utf-8?B?YklDblo1WjZnWUlXamVoYmpodTV6V3hUa0hBSWlFeGlOTWU5REFkNmc1N1A1?=
 =?utf-8?B?OXFXVldMV2hjOHNibTdWQnhhYnUwSlJvK2RHN01iZ0tYZlpNaU5SVUxacWFW?=
 =?utf-8?B?K29DVWNCd3J2N00xUXJDbXkvSGVFMGRhaU5ZTm8waHk1bFJGaXFWU01jRlkr?=
 =?utf-8?B?emlMd09RbjlTOWVqYStjNmIvKy9PaVdyQlQ1eFdsWXgwNjB5Y21tVnpaR2s2?=
 =?utf-8?B?eDJFYk8wTW1HdmlRclJHYll1aVZQMVY0SlJOaEVIeWJ6VkxHVjY3bE4wTlBX?=
 =?utf-8?B?VEwxZEUyUzZaR01SOGdJTm1qd08yQVlnT0dpTWZMY3FYdStCM1UzRy9sYURm?=
 =?utf-8?Q?S7qvR6AuaEq4LcIakwfCIh1pReJh3pbcoxzPA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B67C7C9F5E41A44DA74F91698C0A57A5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: g4Q8G++Z5EJvA9gbp7bWT2H+hBRBL3WNeJI3Qpct9C+hYqM7DlYOZLemfwI3o2v4mnsGOho1+/6adoDy18Ar21r3yHQT20QQa9G3bj4ZtU8nVopDcHYD/npkKq/7xS46xxP47DXGyLBpCKqGCSAhQjADyrlTWzjQzlRLMW/L2q6dK4FSit2WEkZUaZlim1wxW80lAmKod4jnlmsxS7jJXvlTlGqbxrFCMohzKA/UatAKe56DN6oty9bQGCxXOyNjZbpV5mqXStHArZOxn3IFMguG72CveqB7RZHSXM3bLxlDrP/a7gXdfpGKi6ZM/Um20lI10CmjL00EOozoPjGCtg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB894536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c011dac-82f2-4a50-f3ff-08df4bd1b7ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 15:27:01.5663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nan6kbM25ppuXtIs3ZCcnxZ1sd7Aj4Wkcl2gzVntwF90cjq1D92/hke+95JlUXhq4yoHJC6r4703aPEr49+apwniYF6lxVcvsHhFBOtW/d0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5818
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=R5SWitRX c=1 sm=1 tr=0 ts=6b084fc9 cx=c_pps
 a=4ZUDiidoD8pqgsosA5oMHg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=a2oARJBWDeymtYi4uEkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 7PyoZOWNI_yaZyARQftIKglnsGPJH4cX
X-Proofpoint-ORIG-GUID: nclz1uRc5hzmPtZ8PwKjmNVkhuGPHt_2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MCBTYWx0ZWRfX7wfAI5eIheZ/
 Z6Da9LA9RrqslyWNK5/EOuLp360RqmYQutx5rSDMlepj6E8wgBENOx9popYw0N7YlHd45gSqQJt
 OPhlAJn5M6LTHZfnYQyuS5zzFN6+uNMen3JmYaP1ls44Rf7H7gwQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MCBTYWx0ZWRfX2msihZM8OJna
 t3j/qXWw4DlQtOdH3Yb8gZ2DlkWrUhFzZKp7OvZ+siWGsepN0rwBzl0kf7TNGTt7+40NvERh0we
 lcKyE4qxa6/nI7li9rrqAmabbXwkNUI8353PTAa+EM9SkcvzdPvn3vU+fatlzDDPlre6yJZa3eD
 PYFgTvmaV4x8RE5cRYKSZ8K32Ua5bzAHrVbYGygpY6lpROWDHu23LLbqvCW9K2sF5nqF+zxDPmL
 f+eRpJKrBIFVPimHOWE7XXuyBltwpgEmaz9biDZ04avyOJ8cBKrHD4hIj5R+F8GUqxnbQBLzu45
 XfqG3i6CxRefjXv1nxGWAwBGWpNloLDrphsbc3RQIpxhamfcCNbRJvSNYY9vB2GWmBehoeqIBa9
 xa4HOq/D4R3NUhEqktxK6M+xAQ9WL07Sx+mCLscQsW5ATF2STfWeOp3ESdb5PpINxka9LMzobtb
 UKm6ebwZxHvh8qWkorQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 15:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251317

T24gMTEvMjYvMjAyNiA4OjEzIEFNLCBSb3NzIEJ1cnRvbiB2aWEgb3BlbmVtYmVkZGVkLWNvcmUg
d3JvdGU6DQo+IFJlbWVtYmVyIHRvIGNoZWNrIHRoZSBwYXRjaGVzIHRoYXQgZGV2dG9vbC9BVUgg
Z2VuZXJhdGVzOiBsb2dpbl9kZWZzX3BhbS5zZWQgc2hvdWxkbuKAmXQgYmUgaW4gU1JDX1VSSSBi
ZWNhdXNlIGl04oCZcyBpbiBTUkNfVVJJOmFwcGVuZDpjbGFzcy10YXJnZXQgYmVsb3cgKHRoaXMg
aXMgYSBrbm93biBkZXZ0b29sIGlzc3VlKS4NCj4gDQo+IFJvc3MNCg0KSGkgUm9zcywNCg0KVGhh
bmtzIGZvciBjYXRjaGluZyB0aGF0LiBJJ3ZlIGRyb3BwZWQgdGhlIGR1cGxpY2F0ZSBsb2dpbl9k
ZWZzX3BhbS5zZWQNCmZyb20gU1JDX1VSSSBhbmQgc2VudCB2Mi4gSSdsbCBjaGVjayB0aGUgcGF0
Y2hlcyB0aGF0IGRldnRvb2wvQVVIDQpnZW5lcmF0ZXMgbW9yZSBjYXJlZnVsbHkgaW4gZnV0dXJl
Lg0KDQotLSANCiMgU3VtYW50aCBHYXZpbmkNCiMgV2luZCBSaXZlciBMaW51eA0K
