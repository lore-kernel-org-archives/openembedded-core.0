Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32436.1793878353491142116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=QfpxVKhp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=576967b061=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59uQCw1187692
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Nov 2026 11:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=D6I0z1gqqJ52SIlmea6yoWr/ThCmChdtiZC9yo5Q3hQ=; b=
	QfpxVKhpWhPTuBmBDY5lrz0GuamQliGzMjbQUxKFUMMRYGqaIorqx5uJ0AGOrYn5
	/T9YeuyCwuRvKvcwCXQYv5DrjOc+6Lg1iChaF6FYtPOu1MdgG9rYyOmb+fkfufcC
	RCiRERLYhonFUdz0COPGez7cr41rljcXfMqlhPmfPaSTXx9CXV2yyq9J/Ojs1UzJ
	vPBCTTKiZn8AC6ZAPzDPUIFYye0v0vN7ke3dxOVwUT+j1fPJEVgHxckbCa10tgHg
	u4dNzuJT6Sw5UlWNB4lOBXJAzuMjT9u95/FZFLcR9WwvtSlT/yoVKk0roXNuoW3o
	5bqpJdZTsD6rLKYquEgLUQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022130.outbound.protection.outlook.com [52.101.48.130])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hram4hnn8-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 11:32:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkODLVbrGCfz4nrPoIln56i/ULI0FfZpe/NxmVxLiSnb6nCFIRtYIH89CvM97x25ASdwPb9C4YB686KuQbUT2LvPYYXEKULPz3FpA1Crmt9xTCmaNnRIz7me2O1a8H9v/pgUJLg7YEi312C7u3wOXFo9joEjEBVVfpkscyaviNFPYXO9fYUcoh4lgcnOsKC0JIPFpq6q+iZfI4hkFuVVRBH6DnKDjpAg5o8Arq375CZSyGtbLlLMbIZIkxvYmas649kdF6tV1g35p3/nUKMy859Dco6c8a5K1JE7P0Nc0rHx5itMtmjb6ptXJUrvrKeJhVwfNHetDc5IrUscoLyrdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6I0z1gqqJ52SIlmea6yoWr/ThCmChdtiZC9yo5Q3hQ=;
 b=mEZZzJoyaidZfJHw3KmaWIgnsm0MgFijfQvpkBIOS+g8Ss9q/ufDxZOxnpr/t1fywgVgKuqNsxIr6ioZCXq5zSRvylJntc1QEy6NzWP1jB6910qosUqDEGYyxUqAhctNCOVnZuCT746+Svxe1EeTOAYgbA9IbNiLTrFBpeKqB81emWE+A06eceH4TvYXO35Dc/9u6O9Uul8m4EaVxaM61WDfvIkEvls/tzfqdG8G0SluXyHSrX4G0h6iOKhkbpG7bWUIGRjH0v6+6/0NtkX48E8Xplux6auEzOolK06OkcnqUW0WronBd9RJtsPEwkKmljL5pdvyBvz+mrJR90OAJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.8; Thu, 5 Nov 2026 11:32:28 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 11:32:28 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, alejandro@enedino.org,
        sundeep.kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        sunilkumar.dora@windriver.com
Subject: [PATCH 3/3] cargo-c: keep host-kind dependency metadata out of target -C metadata
Date: Thu,  5 Nov 2026 03:32:02 -0800
Message-ID: <20261105113205.1571267-4-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261105113205.1571267-1-sunilkumar.dora@windriver.com>
References: <20261105113205.1571267-1-sunilkumar.dora@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb77a7d-3f3c-47c5-ee54-08df3b307890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|260925022911599003|260925021911599003|261102123227099003|260925021311599003|56012099006|261021121427099003|11063799006|261009223027099003|261026121527099003|10067099003|22082099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: jdVzl5uWeDFMgCjHI1y5nRfWlPsyIyLjyQjI+2BdKFHrQJ/NmmNksvKW1r6iWu5j5b2VYkNxAvmS5ikNOYT7aIeWbiwBb7g11S7wuXoUPaC6sEzv1ztIDwz0YaMYjUq1wutlEuAR553Pl9tTdkCW+Xi4VQX/WAMDhy1IDn3oIfq94Hky/rUUIlyceUjKDvI7o+T4rx0g1NuYoj1PtzzXh2vLyziBP23kJaKpY09pct4haA7veXQ7C1JFdMh+dbc6TTvnWM8yKDAAxS+3QOYZ172JXyd80oWVg0pWv8pNlXJ5HnWoEEIqV05H8om2AvagOWV0uPNCVvl5DjXqMMGgutmLQIIygSRTBno72kXlx0z1g0g5TuIf7mtzmJyz3+eAetPGQCVBswl9pRi0YutklK3vsSx7bfLzV2U1l/ozHIDIs2j8XdHEihfDZ8ZmdBqgI1OO5GDIXagONU8BGXB5IlpCqaq4SNx5PhZWwRaoqFIz8v+c9yxWzCV0upAM8ahKDEUVKMNZv5SXlQseu/49hOt6gynaRTDwweGZ+qKEd7MDsQOD/gG2YEst0hNJEiDbXHNLjC/FtzgTdsxkAwEmvMEeb/lqK+JsPQywZM2okNnB7pAhD1Bblom48GGmFaP628HYuD2P6ZDV3cE8Oc8aVZIuc/+fh6HjrQgz60oFEYLt1Zl8NvXku2QfCRxvJ+EVB+QpUNGWBxayB/L0REwLAsLxN8LMiqwmMoD5DZ8r/o8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(260925022911599003)(260925021911599003)(261102123227099003)(260925021311599003)(56012099006)(261021121427099003)(11063799006)(261009223027099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWp1Sk05aHVGcEdsc1c0U2FMUExWaCtRL0paTTJqVDRPUUErZTVtNkNKaXhS?=
 =?utf-8?B?WG54TmJjRm1zc2h0VnhDLytCUEtSZ0JsOFA3ZTl2VHNqVmdCQ01KZXpGWmpD?=
 =?utf-8?B?U253a2Y3M0dWQUY0OXY2SXpBMEFBczJqRGdWY3pNYUtJUHZqRkE0UlJENjMw?=
 =?utf-8?B?RXdpNlVjNER4RGk5WjUyZ1h4ZVpLQWlWMStTZy82aFRBK3JkYzJHNXI5MnBF?=
 =?utf-8?B?UmlabVZ2MFg5T2lVUDVLY0pkWVBjc3dIcytERC8vY2tGYlRibTc1QnV5MXhQ?=
 =?utf-8?B?MkF6SUhYZkVZVzRKakhzeTJOZWdEOGxzQUs0ODVrTVorR05ka0FyeCtVN0hi?=
 =?utf-8?B?aHN5d3EwNkRwWlp4eENZTVpxUDlPOXZBU29OQ1pkN213emwvandSS1J1TlZx?=
 =?utf-8?B?Z0t2Z3kyTEUxWHFFUVlmQXF6L0Jid3ozV2hPUUFHSCsyZ2xRRkVzRDM0NFRy?=
 =?utf-8?B?MjhCK29IeE1RaGhuSnl6RU5Mblk4bnZPd09FL1E2T0RUU01CQnZ4NTZXbWJE?=
 =?utf-8?B?L1loV3gyK3lCYXNVamJsaEhQVmJQOHhhblVYbVl2bThCMk5zYUlkTU04d05n?=
 =?utf-8?B?WlNKWWJuT1lWT3YwN2lLZ3k3ZHVCUGw3VU1NRHI2aDFkNEFDR2trQ25VelJU?=
 =?utf-8?B?bnp3NTdlVyt1czNWTDZhcHlRM29oaTkwWktVd3dlQTJxSC9nREdnNFJKampJ?=
 =?utf-8?B?aDMxeTc2YXRJRjhiZ2tLSVBPVTgrcW5yRlU4M0VqcEJkN0JLZFpkQW1PbWtW?=
 =?utf-8?B?bVR1M285N2JsbWh2VVhlR2RwMjdURFpkVnpQaFNNV1hKU2lSSWFpL1dtMGVG?=
 =?utf-8?B?VUZKbTJKc1JwTkJZNjJaY3lVa1ZqZHlTMDBwSTJsOHNENmxDbmpXRXFpT0xs?=
 =?utf-8?B?bTNudEhzUU1GeHF2RTNaQkVVcHErV1BNZnNOME4yMXQ5UXFoRGR5YTdpcllI?=
 =?utf-8?B?Z2lzMkVnM0NIUlZBWWdDTjlXSVZmemZvZGs2WUR4MmFxbFBSN3YwYThBTnBC?=
 =?utf-8?B?Zk9aaUV1bG1KaFRaaDdiTjhreGx5RTQvZVVYaGNRQjh3NlJFWmRVNmZjbTds?=
 =?utf-8?B?TjAwSTlQSDVhSjlQN0tseTM2VE0xQWtJcnRzSWY3T2pPOWUxY2lxTmNaT3RS?=
 =?utf-8?B?cVhlWjdrTVJYVkNLTnEwcklqVGZzMVIzWjVqb1ErS0lZRGJyQXpwbHNlK2oz?=
 =?utf-8?B?cDBKdGhqOUVjckZrNjgxdVBJMFBqOUMybFllYlRLNHFKaW9McEl4VGVwUFNS?=
 =?utf-8?B?RGR2L01GWERBZkYzUTEwRjFlSjlhWWQ0ajRDb3V1ZnhpejVHL3pUUEYvVVZu?=
 =?utf-8?B?V0R4c2V1Ujd2VGJNYmtQeVZsZUN2UDdSZms0bWhoTWVBcU9zcVVuVmxiaXdP?=
 =?utf-8?B?OWljYjVidXRyc1Y2OFB0ZzlSNitKL0tJdU9CV0cwbGVKOUhjcStiMkdoOVlN?=
 =?utf-8?B?bXNsYUF5bzQ0TXdkZi85R2tLVGhibFpPcGNBWndXNjBsOGlMdGs3SFNJeUVS?=
 =?utf-8?B?a0xqL0NqSTlCKy9GbXRVekRSSy9KWFB4UXJYSk1tVEFxZzI2SkIrK0IwQisy?=
 =?utf-8?B?a1dFdHdsdzcvV0ZFNmg2TXR1dkNIWmRPWDQrbkhXc1U0dUtRU2FrZHJtekZP?=
 =?utf-8?B?OEVEQ25YV213dlAranlkVExXaHlreVBpN1ZLZVNER0pyUTV4Q1dTZHp2V1lJ?=
 =?utf-8?B?YVZQUEgwZUZpcUlFUW9PRWphdDJpWkFOUGtiZWwzK1dEbVdYQnVpdFEyTDIr?=
 =?utf-8?B?dHZLdXVyS3VuVHpha1FYVlhhS0MxNHhtem1ZZXBYT1F2TFJtQ3pqcllBWTR2?=
 =?utf-8?B?alJzb3RLTGpNVVp6VldJOGJMWm84bVIwUlVCOTQzODB5V1dXcjBLcHFqeGJu?=
 =?utf-8?B?cklHTUIxWXduSk5iTG4vY0pPdm1yOGhBRDBCSzlsajdFYUUzRytJelRRN1ZW?=
 =?utf-8?B?SlRwekpuQkZqY29VRjVBM29kRitwdy9PKzYwRTJ5dkJnMERjNGxlWEgzZUJl?=
 =?utf-8?B?b1pPOFJoYzROcm1uZklUd0dKVGNSckdjSHV0eVM1em5VRk8weElDdXc0Qkti?=
 =?utf-8?B?YlRXaEFLK0REZ2w1V1JqU0JQb3VnYTh5NUdLMk1GZmxBTTYzTjZEN2pnYU9j?=
 =?utf-8?B?ZjlYQkh6RmVMYS9VZmk5d1lPR21KcUVUVExid2FKQllUVjRoRm0rM0hDdTRs?=
 =?utf-8?B?clo5WmxJU09QRzNhVlZla05ocWlRRFZzUEJ6MWtFSjVZNGFMRE5HSk8wK2J3?=
 =?utf-8?B?UWx5bnptQVBhWERMTUtqaERQTTlVdmtrOHc2VCsxd2JQdGVHQjVqQmpYMlJr?=
 =?utf-8?B?YjVCY3pZOXdHRGttTXB0V0ZqZHJMbnc0enlyZS9mcXRYVk1hRTdNeE9rWUdP?=
 =?utf-8?Q?cxJeTWRgHaCc6H34=3D?=
X-Exchange-RoutingPolicyChecked: rVXwXNyZ+80z3TQi3Npm7VoHuoV47rQ4wqLglvovIdV5ovMUHQa5ltWE0JNfpZHKAymuMvPu0I/14LoSa0LmbvSPkBenDpdOpARqcJjlW91mKJP3o24aCIom/+KDRsN4ole1tGWXjRcK5Uy8v44QyjEEdnbMtRuXnIw973ZhVKlbA0AYOdGuAB1QrlPt+IcEc8zX52XtSXFLlZS0V7E1pJZ/QhLpf+cb2R0fx74hisj9Jy0zCH6mpztpYO6nHrjTgN55MnFgaN4LynzYTn+kFOyFhKc8O7EYV7oVBeOli/k9L+f5bUIRzN//kR/+PERnoJGdY1WWabddGjbXJ9scTg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb77a7d-3f3c-47c5-ee54-08df3b307890
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:32:27.8062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NgU2uxwx83AXULNOZ87Tdu1iPZCtzVbl5/EviGSlQ72GRsrEESO6WxzSxk9tmfXoUsgaOb9EhmFlBIqX38PBYsXLToG053agBnObjhDVzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cpMOAF4i c=1 sm=1 tr=0 ts=6aec6950 cx=c_pps
 a=5U2/TfBw33PfA2YBhd8Q5Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=gVYdgmCXAPvokO4GIiEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: JpD3A7MY3L3SD1BORcRtOPrN1aLI9owT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NSBTYWx0ZWRfX5ec+JUnpG0g9
 CxQW/FWxD4HXsuLC9fFPmknjxYLTZ6AQ8IZ6Rok5hAnch5VRhmR8gUVOGJYbPzRK6pDCZS0BNmo
 liW3JpoLDT6FYUhOY+4IUc2Hj9XL01G7wv2vdhM0ZiyGP8owLPf0
X-Proofpoint-ORIG-GUID: TMROmLs731S_qzDCzz21o11PlpQWAkbM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NSBTYWx0ZWRfX4jdSAzIaK2rK
 hYW9UTbqO4McC6+NPt4D8pj6kLu1H3NOXNsg3UyPk3995lMSmKMQv6n+8wgzb4I4O35wzxDby1C
 no3aR0no8VjT76PPZ1RDlHc/STrA05t5p+ibkEYPWJumW0qdoDT3J7JSAUTPWHZq83HkMKJIN4f
 JOzOl3joXNpVzTkriGCOkR+9kK2Klu1Q9K8yAHgFPxYlQG4ENcap0iprYk7BqgN3pLgfTdIgKxs
 nviA7F01xy1oNPNBgKJYzEVJneAnmfCV5ADtp4/JDX/HST9pFI6WzlfuWRCYV73KvZLHoaHA+7p
 EeTZz9Gw/pleen+/k9zyyLMWQAArvSUKkPItcaSuRLKe28B5ddF6Dvd+HgGuzc4Qsy19LwNrFoF
 CJKZj0LPfMcoFXmPdWquTFJ8+llbz87pbtSagJBotlUS+KraNGQZzZ7jhVaGSRzvmSdR8GHfduS
 g6hoQxIpSpfUGAag/Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050045
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6A59uQCw1187692
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 11:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249541

From: Sunil Dora <sunilkumar.dora@windriver.com>

Same fix as rust/files/0006-cargo-keep-host-deps-*.patch
(rust-lang/cargo#17522)[1], for the cargo crate that cargo-c links.

Without it cargo-cbuild still mixes the hashes of the host side
dependencies (build script, proc-macros) into the -C metadata of target
crates, so the symbol names depend on the build host. Only the paths
differ from the rust copy.

Drop this together with rust/files/0006-cargo-keep-host-deps-*.patch.

[YOCTO #16376]

[1] https://github.com/rust-lang/cargo/pull/17522/

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...ps-out-of-the-target-C-metadata-hash.patch | 123 ++++++++++++++++++
 .../cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb  |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-devtools/cargo-c/cargo-c/0003-cargo-keep=
-host-deps-out-of-the-target-C-metadata-hash.patch

diff --git a/meta/recipes-devtools/cargo-c/cargo-c/0003-cargo-keep-host-d=
eps-out-of-the-target-C-metadata-hash.patch b/meta/recipes-devtools/cargo=
-c/cargo-c/0003-cargo-keep-host-deps-out-of-the-target-C-metadata-hash.pa=
tch
new file mode 100644
index 0000000000..a3caaa609e
--- /dev/null
+++ b/meta/recipes-devtools/cargo-c/cargo-c/0003-cargo-keep-host-deps-out=
-of-the-target-C-metadata-hash.patch
@@ -0,0 +1,123 @@
+From f936d6a954455eff3a60968d155852f9de730228 Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Sun, 27 Sep 2026 08:47:23 +0530
+Subject: [PATCH] fix(compile): Keep host deps out of the target `-C meta=
data`
+ hash
+
+A target unit's `-C metadata` mixed in the `c_metadata` of its
+host-kind dependencies (build scripts, proc-macros). Their dependency
+graph depends on the host `cfg`, e.g. `cpufeatures` pulls in `libc`
+only on aarch64-linux, so the build host leaked into the symbols of
+cross-compiled crates such as rustdoc.
+
+Host-kind dependencies are not linked into the target artifact, so use
+their package id instead. `unit_id`, `-C extra-filename` and
+fingerprints are unchanged, as are host units and builds without
+`--target`. The upstream PR also adds a testsuite test that fakes the
+reported host; it is not carried here.
+
+Upstream-Status: Submitted [https://github.com/rust-lang/cargo/pull/1752=
2]
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+
+diff --git a/src/compiler/build_runner/compilation_files.rs b/src/compil=
er/build_runner/compilation_files.rs
+index 593e57e..63855f3 100644
+--- a/src/compiler/build_runner/compilation_files.rs
++++ b/src/compiler/build_runner/compilation_files.rs
+@@ -89,6 +89,8 @@ impl fmt::Debug for UnitHash {
+ /// mangled symbols need to be stable between different builds with dif=
ferent
+ /// settings. For example, profile-guided optimizations need to swap
+ /// `RUSTFLAGS` between runs, but needs to keep the same symbol names.
++/// Likewise a target unit only mixes the package id of its host-kind
++/// dependencies into `c_metadata`, see `compute_metadata`.
+ #[derive(Copy, Clone, Debug)]
+ pub struct Metadata {
+     unit_id: UnitHash,
+@@ -744,7 +746,7 @@ fn compute_metadata(
+     let deps_metadata =3D build_runner
+         .unit_deps(unit)
+         .iter()
+-        .map(|dep| *metadata_of(&dep.unit, build_runner, metas))
++        .map(|dep| (&dep.unit, *metadata_of(&dep.unit, build_runner, me=
tas)))
+         .collect::<Vec<_>>();
+     let c_extra_filename =3D use_extra_filename(bcx, unit);
+     let pkg_dir =3D use_pkg_dir(bcx, unit);
+@@ -843,16 +845,28 @@ fn compute_metadata(
+=20
+     let mut c_metadata_hasher =3D shared_hasher.clone();
+     // Mix in the target-metadata of all the dependencies of this targe=
t.
++    // Host-kind deps of a target unit (build scripts, proc-macros) are=
 not
++    // linked into it, and their metadata depends on the build host, so=
 use
++    // a host independent stand-in for them (rust-lang/cargo#8140).
+     let mut dep_c_metadata_hashes =3D deps_metadata
+         .iter()
+-        .map(|m| m.c_metadata)
++        .map(|(dep, m)| {
++            if !unit.kind.is_host() && dep.kind.is_host() {
++                host_independent_c_metadata(dep, ws_root)
++            } else {
++                m.c_metadata
++            }
++        })
+         .collect::<Vec<_>>();
+     dep_c_metadata_hashes.sort();
+     dep_c_metadata_hashes.hash(&mut c_metadata_hasher);
+=20
+     let mut unit_id_hasher =3D shared_hasher.clone();
+     // Mix in the target-metadata of all the dependencies of this targe=
t.
+-    let mut dep_unit_id_hashes =3D deps_metadata.iter().map(|m| m.unit_=
id).collect::<Vec<_>>();
++    let mut dep_unit_id_hashes =3D deps_metadata
++        .iter()
++        .map(|(_, m)| m.unit_id)
++        .collect::<Vec<_>>();
+     dep_unit_id_hashes.sort();
+     dep_unit_id_hashes.hash(&mut unit_id_hasher);
+     // Avoid trashing the caches on RUSTFLAGS changing via `unit_id`
+@@ -884,6 +898,15 @@ fn compute_metadata(
+     }
+ }
+=20
++/// Stand-in `c_metadata` for a host-kind dependency of a target unit:
++/// only the dependency's package id, see `compute_metadata`.
++fn host_independent_c_metadata(dep: &Unit, ws_root: &Path) -> UnitHash =
{
++    let mut hasher =3D StableHasher::new();
++    METADATA_VERSION.hash(&mut hasher);
++    dep.pkg.package_id().stable_hash(ws_root).hash(&mut hasher);
++    UnitHash(Hasher::finish(&hasher))
++}
++
+ /// HACK: Detect the *potential* presence of `--remap-path-prefix`
+ ///
+ /// As CLI parsing is contextual and dependent on the CLI definition to=
 understand the context, we
+diff --git a/src/compiler/fingerprint/mod.rs b/src/compiler/fingerprint/=
mod.rs
+index 172165d..d7f1e55 100644
+--- a/src/compiler/fingerprint/mod.rs
++++ b/src/compiler/fingerprint/mod.rs
+@@ -74,7 +74,7 @@
+ //! `TargetKind` (bin/lib/etc.)                | =E2=9C=93           | =
=E2=9C=93                        | =E2=9C=93
+ //! Enabled Features                           | =E2=9C=93           | =
=E2=9C=93                        | =E2=9C=93
+ //! Declared Features                          | =E2=9C=93           | =
                         |
+-//! Immediate dependency=E2=80=99s hashes              | =E2=9C=93[^1] =
      | =E2=9C=93                        | =E2=9C=93
++//! Immediate dependency=E2=80=99s hashes              | =E2=9C=93[^1] =
      | =E2=9C=93                        | =E2=9C=93[^9]
+ //! [`CompileKind`] (host/target)              | =E2=9C=93           | =
=E2=9C=93                        | =E2=9C=93
+ //! `__CARGO_DEFAULT_LIB_METADATA`[^4]         |             | =E2=9C=93=
                        | =E2=9C=93
+ //! `__CARGO_RUSTC_BOOTSTRAP_WS_REMAP`[^2]     | =E2=9C=93           | =
                         |
+@@ -91,7 +91,7 @@
+ //! `[lints.rust.unexpected_cfgs.check-cfg]`   | =E2=9C=93           | =
                         |
+ //! `--extern priv:`                           | =E2=9C=93           | =
                         |
+ //!
+-//! [^1]: Bin dependencies are not included.
++//! [^1]: Bin dependencies other than artifact dependencies are not inc=
luded.
+ //!
+ //! [^2]: `__CARGO_RUSTC_BOOTSTRAP_WS_REMAP` is set by rustc bootstrap
+ //!       to customize remap-path-prefix
+@@ -111,6 +111,9 @@
+ //!
+ //! [^8]: including `-Cextra-filename`
+ //!
++//! [^9]: For a target-kind unit, host-kind dependencies (build scripts=
,
++//!       proc-macros) contribute only their `package_id`.
++//!
+ //! When deciding what should go in the Metadata vs the Fingerprint, co=
nsider
+ //! that some files (like dylibs) do not have a hash in their filename.=
 Thus,
+ //! if a value changes, only the fingerprint will detect the change (co=
nsider,
diff --git a/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.=
bb b/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb
index 37d6a59aca..be69393a7a 100644
--- a/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb
+++ b/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D " \
 SRC_URI =3D "crate://crates.io/cargo-c/${PV};name=3Dcargo-c \
            file://0001-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.=
patch;patchdir=3D../parking_lot_core-0.9.12/ \
            file://0002-cargo-omit-host-triple-from-unit-metadata-hash.pa=
tch;patchdir=3D../cargo-0.100.0/ \
+           file://0003-cargo-keep-host-deps-out-of-the-target-C-metadata=
-hash.patch;patchdir=3D../cargo-0.100.0/ \
 "
 SRC_URI[cargo-c.sha256sum] =3D "5ff6e05531e58286d3c02ec0adb7f254e5d532a8=
d4b667f30b9942d802e1db25"
 S =3D "${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV}"
--=20
2.49.0

