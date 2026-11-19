Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10221.1795074930962517536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 23:55:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ei0WtrkY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5783957acd=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vshj484790
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 23:55:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=pIli/a+PrgMyhjUqtmB02z
	bKo0KjwuAHHv9QBjoVlz4=; b=ei0WtrkYzBgNLH3nRrFZTSX6YimWBKeCbWZtN+
	2+61/+3cC2hEWj8s+uBajobUfs+9GLppaaxsKdIHLLAGZXwWfODcHN20wcmSuujY
	djVFtuD63Wdl4dema4HuCFMLcUQF0YzJkP118+wPZ0Pu9jCOtsJXjkODIK4Jo32N
	W9jEPULTknIjG6w+scReYYrEZqX7EYIOHI3r+mLQILgIE9mpWam5jHz1EP8ZBC9p
	BTGvVn5KBjFwu9g17pFJlNhHG0+aaUvUAagndtUj1U48p5aJ5gBgtEtix5RXTZab
	aJUwk15D39oPrOAmbHe8LsP69T8/04oLYl/Eqvm46CPMVGRA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023079.outbound.protection.outlook.com [40.107.201.79])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j0yvdnnkq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 23:55:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dP+xqhDr74ZDumbZqXKVqSfKKIQ4sbg0DY6S9JSf15KbCLfrqKA91GkUMcTMZf0DZCEdPZpuqKGkFnqScp0JRApxitwIkjvD2hs0+nuu4GInTKhtm8Hy80wGTyJu/0uz4hbuEe6AyhCjSfF45M6y88DnD03riMHpkRlwBNZxyVbbaQFgorAg17ZmQef6/qq9MTWL/oAHJk+ET1RMqVGiRg5XesrsbAj5XM5GjB5UiG9Aw2FzYfccMZ5+UzD0fV4Hc+yWs0ebzDpDKhDiI4VkZdODOV6UjJ4VXjHWk4GHdsVOqImygmLnQ36fuHv6EY2dK1Wbg4IiIxfI99uaJXQ6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIli/a+PrgMyhjUqtmB02zbKo0KjwuAHHv9QBjoVlz4=;
 b=ViS+bmSWWPimLatEeDkmr2TnVQxPwCX3q2XYl+YKtXFd0S2V+PvBrYFLMn0z+DeQwJ/NIJqB2fqwyoPM8Sx1n6K3VYiEpIcJtACUhan8ELJyhux0ig7NkjUfgBV+navgZnrBxOrGz83thFC9yRctZKYIgdAAFAifk0xtymukZUKUKeMi4+dLWISl9oN0PH2IOlciGPeUO46/JTPfU6T6Qp5OVzYRx3ASLM1CxsXkq/tVH7i18HuLiaUTkB0GjigEAWOjTZoLNaVm8W3KchH52CkMQyNyymhgZ4DC0zTPmood4W1BcS7k9sZ/e8DNIX/0uketI6Nv3iEjNksMJUCsIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by DM3PPF2DEFDE2DF.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 07:55:26 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 07:55:26 +0000
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Subject: Re: [blacksail][PATCH] gcc: Fix for CVE-2026-125709
Thread-Topic: [blacksail][PATCH] gcc: Fix for CVE-2026-125709
Thread-Index: AQHdd/No6jIJZ7w8Rk+Y9kIZzEsZjLc1BkBN
Date: Thu, 19 Nov 2026 07:55:26 +0000
Message-ID: <SA3PR11MB34648520FB4DD4D98BEDF4A072EF792@SA3PR11MB346485.namprd11.prod.outlook.com>
References: <20261119065723.3723895-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20261119065723.3723895-1-Harish.Sadineni@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-11-19T07:55:28.401Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB346485:EE_|DM3PPF2DEFDE2DF:EE_
x-ms-office365-filtering-correlation-id: 16d73c7f-1b44-40bf-c1eb-08df46127933
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|6133799003|3023799007|13003099007|8096899003|5023799004|11063799006|260925021311599003|260925021911599003|260925022911599003|56012099006|261026140227099003|261026121527099003|261102123227099003|261028144727099003|261022105027099003|261021121427099003|261009223027099003|38070700021|10067099003;
x-microsoft-antispam-message-info: DeOhBCRjFLBduQVa3CobS3eM2TRDfPft6g1Wf8uDtK1oseGYbs1M/lQkRNoZZkQaBU5hnsTw19gBC5mGam1Eg7AenGpUgC4gqxklqeLWUGmZ6s26wi8OJg/t1x5FKjfvW8AR3o3QugmeW7ju8DGuO/uBfV0rt3PoiUnc2S4n/BqTmxvlxC0z2KpnWbr8fJo6H6Zj/ZwpMd9t+rLR81ZTEpBzfoA3o3HfGOmqfVeLYg0uaf/w8nJkaEJImh0zEWwrpBI+/QjbPJtWg+6wZG7hfiBueuV/dWWD9gArQbIuIdHyAKHQFKPEqqmJQBK2M5yTxdxNoV5At84eei/e7mx48uYlewk2LG0IAngm/Y0yOfM5jE8GXaBnc+VtYWYAqTU6WIAuuHJBC748M7zRn/WwPJEJPyLwCbfNqd0+KrkAMGejXm96WqTH+mDGwsjddPsGkMVldlxCUsvTAVwkbQECBD5PJMT3rbtSSUpNOlbn07/PUGxodRAs8sBCAizI2guPRgGS3EM4ZuZ08aXdvjFA12mUebMpqDaWBdAJEdTx/pWItLFk6ymPzUJwTGe7VnutP4WL6JBJ+XUHbgvzFxepfEfXCTtlQBe2jgN9S5cobn0LR8gW6MHfDiIXiYihzCnwSZy5mHNX4kkn6itxfEvErM+Zo2GEGPOucgx+d3gvWE0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(3023799007)(13003099007)(8096899003)(5023799004)(11063799006)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261009223027099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?0DztksvFw5uDmFIZbdKhI0Lkw2rsIDwI6/JyIaIjkeDckNjONyF8U/rkCa?=
 =?iso-8859-2?Q?fhIMpc6SetkK15FIHHkwpE8z884CLbG9v/6DBpqLuqa+a7sc9TQk2wOj3T?=
 =?iso-8859-2?Q?yBFV8KE0IA5Fbs1zV2EhPRmHLsPHnWIMI2JEvoLWx5u81cClp9/YlFHXdw?=
 =?iso-8859-2?Q?qeGsCUvr+Argg37Wx0FnvWNRhj+TcFFYUjtDg23QZBsG5BVh1T2aIOy6iH?=
 =?iso-8859-2?Q?J+FcwtKAIPtkqUI2t9VEd7o7181WAcP6PFvwx69WaoZoBwtXqouebEBu4o?=
 =?iso-8859-2?Q?tf1VFBMNU563Zac6Vow1O8kzfLLrPORgUsYkfkoR4HzeZb3GyCj7Q1PiR2?=
 =?iso-8859-2?Q?hSC/flb7uEOBUeA+e9eWHMhl84x4AxGodr6CR2nnD4zl9bi/SLKertwjta?=
 =?iso-8859-2?Q?KzRClHQa+8WdCELptbB9T1tYsmZeJIsNmnu1VFyE6ElWH1eoMrPcaXo8HJ?=
 =?iso-8859-2?Q?dRKusk01//W3WNonrHhbjthYJ86dwM5KWHXjOZnOQCSQmQJixcghWZsxDB?=
 =?iso-8859-2?Q?C9piSVDQt7q8Kvq/KxAEDDSkHt8PP4Th6koLMhG8O5/uK3cv142xdEG6A6?=
 =?iso-8859-2?Q?gW6oEU0iSeOJoNp6lrf59gxLVuphst4UQs0i0TxoKtgczvoz+Zkb7x81Xv?=
 =?iso-8859-2?Q?dhBJAzZ9FEN81kWbKiB+40+Gu8n0M+C++Nb5cqik1pTcPy+j9VZweMM5Hi?=
 =?iso-8859-2?Q?6Tt2qaJLQguyYktYBsrAX/s95MDW5rURi2sTLcE5cTH4Bb9/AU6wbssVBC?=
 =?iso-8859-2?Q?KBQehXAY2VkmQCYTUHlp6OR953zlJwqLZETrmobNvg25LmJWj4r/XvHaGe?=
 =?iso-8859-2?Q?x5hA4rUSonOsiLHVL8PyUPJOHkqSAZbmkUbhVA2kqnhnmCBWagZkwim5sQ?=
 =?iso-8859-2?Q?Q4iYbwQkNdnjqVE96LceHgR9al8CsAWvDx+2jy0QhIqWbWxXCO5SS46Dzv?=
 =?iso-8859-2?Q?Skg7NAjVF6fVRNxb8ZopJO0bxVM+lPGZQ7sp7eiLn2XPxzkJwOX2rh4mVa?=
 =?iso-8859-2?Q?Ab/kFtN39U6YG+BGE8ax9AlS50W830cVUkIXvjTosDaZlp/uy0ue90/e88?=
 =?iso-8859-2?Q?um8199a7S8sSFdB4ZpI41j6hn2uSsPfSvqS9IvMVzMX2575qVoUqmTDGik?=
 =?iso-8859-2?Q?JODAYsdUiV7pfDn8nbUMj1g7XtBZ0sX7PAvxhXuCiawwG+o8jSb85UGTee?=
 =?iso-8859-2?Q?YBaKOxuKRdccHZbkFmiSOXOnmXaqQIodMHY1z9wRsfA482d0vi8KIZzCiY?=
 =?iso-8859-2?Q?7QAOoA6ptuyuCXqiurB+06Cr/Ou0jIgLD8izF9VYm+40IL0SxmYw4K2XRN?=
 =?iso-8859-2?Q?dyEJGPeluVCkhVyOdjCGknxNNmmFd8ALVXQS1beOVCPEmJaEr266UwxH25?=
 =?iso-8859-2?Q?iI6CIcff3br7iV3lf4wKiBBIT3OER6ggf2dNwpPyAqqNK9FqdgVC63lnL1?=
 =?iso-8859-2?Q?lRbSX152t+h0jcORQmFpagDS1kKkxZ5Ff4HODHyXn9erVZWebfY3tEGTBr?=
 =?iso-8859-2?Q?pTPSccpx4AEKrIlh+i8rdh1jBopUmaemEhHb1Rwm5FY/BPfC2wzzk84ePL?=
 =?iso-8859-2?Q?2+tN53NTG60QKbrGIFpLMuojyfyQ1QYDXgBpSNImFbHyQohNkX4umKSEZD?=
 =?iso-8859-2?Q?Q6YP+KCnaJFvZYc145zxf51ZPAkl6FUUq5xc2/zBZOfTE05qcOzj3hyimt?=
 =?iso-8859-2?Q?zoR0Zu6pli1MHOpr97zoOAhnVpgbrkjsQkkePO15HH4vT+rLIz+VaDlMbp?=
 =?iso-8859-2?Q?5N+bWvwQfSrvE6nuka4+k1xeQYq1DMizWGH20EksOBQgjox39SCVjuxN9J?=
 =?iso-8859-2?Q?ta0ANw8cYQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SA3PR11MB34648520FB4DD4D98BEDF4A072EF792SA3PR11MB346485_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lfvmQMZsUt2RAUh0cax+IUi1QGBHlsKzP4WWpKo8pzoNADaSycd8DIcEObV6mSgKj0YAcSSQgIKAq3lmjIWpNv6FQ9vmMoOYETNuZodlu4/VUmyCHQPHvzG5hgIeWAylc/8DVBFj66vuLFoXGhD7EZ4NmlnSxRW2rZav9B8NEWxYJ7z4oIMsdPCdwN0n7rtlxM3YZ3qAZJB27jMMoV47giqdTcwvLLGkyvraZWKgl8GQyGkNHm47fTgu9ntTjxauy3AtKyYTgkP5gaBtcNJNDSvyW4aa3phnQlaFN+SBAQoPxlW5WElOCWJ1F9JuTloH5wP0/wasMjupRoRBIdsNEA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d73c7f-1b44-40bf-c1eb-08df46127933
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 07:55:26.6592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kyT5F6lGFzOp6G3ad9LUSuRWBtGBL0WMWnoR25ATJVFoSyHTCn05bobA0iaJwMo3u1IPf3YRfs3tJm0Ty43VgffDXG+794b7Fu4XNR2sKUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2DEFDE2DF
X-Authority-Analysis: v=2.4 cv=XL2l2ghE c=1 sm=1 tr=0 ts=6afeab72 cx=c_pps
 a=QpQIPgq430LJFJp+cclIig==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=PYnjg3YJAAAA:8 a=mDV3o1hIAAAA:8 a=20KFwNOVAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=sZh3B_x7SRuSc-TSEK4A:9 a=jiObf9B0YAUA:10
 a=2YlgApYW55bGZapDbPgA:9 a=g6AiLOgQEiX9o_oS:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMSBTYWx0ZWRfX2Sa86+BIM8hB
 88Z6HZp/6emkbe3eyot4/uDKjXDalkr/5v/k0UClGs/yw0C68pHZA5bUyH+XXGVCNkjW7uKUeNT
 jaeSi8eKdiR3L2cPlpz/XODuruPZrm6qq4J9KePctfZf8r0j/Md455hTqNQTDYE1ORpOOuDQIjR
 dBvxU1Yay52AfEpfiGGTiPWoisg5otpZSgH2y7TkJGop8O3rX7i4Nmd1zzGJcres5pM9ltCKtZh
 Jvh/soMm2oPlkAFQ3errDW49jINtl1kyBuegPCJUvUu5z4OpTAQIVTS1SmmHEAlYvqL4ivnCUvc
 UWZgUZbFoqjpOims/gedAI+BVfDf1uuUnZKx84/bNlgB9vfWTZgqY8IGRgabtnWWn6CxD4Ng1Fd
 OFGCzbNUmeEXugmtlE+60pHHVcddE5BT3tCJWjGzMoemg3JjwfZdgBmUYsYA2QPXArZ4e2ZaYWW
 xNrFyPuYh4rhfJf5Gxw==
X-Proofpoint-ORIG-GUID: _GH2ckcWS30YVZ6WJwvPxS-aFuMTzkXk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMSBTYWx0ZWRfXy/CHkKK5nHf3
 Hyp/gNBuA6C56OubSu6kDqDnP0aLiLrBFL4VR5XbilRVQo6aB2oJ6mAX1cxnnSXDgoXAts96UgE
 66IFzPG+qM2GD2EOQ/lMuRStRIkwv6Bgn/rEXNotjtzjBkqbhDDj
X-Proofpoint-GUID: _GH2ckcWS30YVZ6WJwvPxS-aFuMTzkXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250653

--_000_SA3PR11MB34648520FB4DD4D98BEDF4A072EF792SA3PR11MB346485_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi All,

Please ignore this thread. Patch name is the wrong CVE number.
I will send a v2.

Thanks,
Harish
________________________________
From: Sadineni, Harish
Sent: Thursday, November 19, 2026 12:28 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Kokkonda, Sundeep <Sundeep.Kokkonda@windriver.com>
Subject: [blacksail][PATCH] gcc: Fix for CVE-2026-125709

From: Harish Sadineni <Harish.Sadineni@windriver.com>

libstdc++: Fix buffer overflows in basic_filebuf::overflow [PR118099]

If we fail to write the content of the buffer after inserting the
overflow character into the end of it, then remove that overflow
character before propagating the error back to the caller. Without this,
the caller is left with pptr set past epptr, and successive calls to
overflow will write further past the end of the managed buffer with each
failure.

References:
https://nvd.nist.gov/vuln/detail/cve-2026-125709
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D118099
https://bugzilla.redhat.com/show_bug.cgi?id=3D2569390

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-16.2.inc        |   1 +
 .../gcc/gcc/0027-CVE-2026-125907.patch        | 378 ++++++++++++++++++
 2 files changed, 379 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0027-CVE-2026-125907.patc=
h

diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtools=
/gcc/gcc-16.2.inc
index 3497493619..84a6175abe 100644
--- a/meta/recipes-devtools/gcc/gcc-16.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
@@ -75,6 +75,7 @@ SRC_URI =3D "${BASEURI} \
            file://0001-mapper-localhost-might-not-be-known.patch \
            file://0001-Fix-check-for-working-assembler-gdwarf-4-option.pat=
ch \
            file://0026-CVE-2026-102010.patch \
+          file://0027-CVE-2026-125907.patch \
 "

 UNPACKDIR =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-125907.patch b/met=
a/recipes-devtools/gcc/gcc/0027-CVE-2026-125907.patch
new file mode 100644
index 0000000000..cb3a437475
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-125907.patch
@@ -0,0 +1,378 @@
+From 68b1b9056c70acb31f2964963b51c480ff820602 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Wed, 28 Oct 2026 10:34:17 +0000
+Subject: libstdc++: Fix buffer overflows in basic_filebuf::overflow [PR118=
099]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+If we fail to write the content of the buffer after inserting the
+overflow character into the end of it, then remove that overflow
+character before propagating the error back to the caller. Without this,
+the caller is left with pptr set past epptr, and successive calls to
+overflow will write further past the end of the managed buffer with each
+failure.
+
+The new 118099-codecvt.cc tests were assisted by an LLM because I was
+too lazy to remember how to write codecvt facets.
+
+Assisted-by: LLM
+
+libstdc++-v3/ChangeLog:
+
+       PR libstdc++/118099
+       * include/bits/fstream.tcc (basic_filebuf::overflow): Rewind the
+       put position if outputting the put area fails.
+       * testsuite/27_io/basic_filebuf/overflow/char/118099-codecvt.cc:
+       New test.
+       * testsuite/27_io/basic_filebuf/overflow/char/118099.cc: New
+       test.
+       * testsuite/27_io/basic_filebuf/overflow/wchar_t/118099-codecvt.cc:
+       New test.
+       * testsuite/27_io/basic_filebuf/overflow/wchar_t/118099.cc:
+       New test.
+
+CVE: CVE-2026-125709
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=3D68b1b=
9056c70acb31f2964963b51c480ff820602]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+
+Reviewed-by: Tomasz Kami=F1ski <tkaminsk@redhat.com>
+(cherry picked from commit 2d296e9f024edbb49cad1f3ebb5ae34c71ea5f7a)
+---
+ libstdc++-v3/include/bits/fstream.tcc              |  8 +++
+ .../basic_filebuf/overflow/char/118099-codecvt.cc  | 76 +++++++++++++++++=
+++++
+ .../27_io/basic_filebuf/overflow/char/118099.cc    | 57 ++++++++++++++++
+ .../overflow/wchar_t/118099-codecvt.cc             | 76 +++++++++++++++++=
+++++
+ .../27_io/basic_filebuf/overflow/wchar_t/118099.cc | 57 ++++++++++++++++
+ 5 files changed, 274 insertions(+)
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/ch=
ar/118099-codecvt.cc
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/ch=
ar/118099.cc
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wc=
har_t/118099-codecvt.cc
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wc=
har_t/118099.cc
+
+diff --git a/libstdc++-v3/include/bits/fstream.tcc b/libstdc++-v3/include/=
bits/fstream.tcc
+index 99aa296b83c4..0d1d9491cb6a 100644
+--- a/libstdc++-v3/include/bits/fstream.tcc
++++ b/libstdc++-v3/include/bits/fstream.tcc
+@@ -561,11 +561,18 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+             }
+          if (this->pbase() < this->pptr())
+            {
++            struct _Guard {
++              ~_Guard() { if (_M_p) _M_p->pbump(-1); }
++              basic_filebuf* _M_p;
++            };
++            _Guard __g =3D { };
++
+              // If appropriate, append the overflow char.
+              if (!__testeof)
+                {
+                  *this->pptr() =3D traits_type::to_char_type(__c);
+                  this->pbump(1);
++                __g._M_p =3D this;
+                }
+
+              // Convert pending sequence to external representation,
+@@ -573,6 +580,7 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+              if (_M_convert_to_external(this->pbase(),
+                                         this->pptr() - this->pbase()))
+                {
++                __g._M_p =3D 0;
+                  _M_set_buffer(0);
+                  __ret =3D traits_type::not_eof(__c);
+                }
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/1180=
99-codecvt.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/11=
8099-codecvt.cc
+new file mode 100644
+index 000000000000..e4b1106b9b8d
+--- /dev/null
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099-code=
cvt.cc
+@@ -0,0 +1,76 @@
++// { dg-do run }
++// { dg-require-fileio "" }
++
++// PR libstdc++/118099
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/O =
error
++//
++// Companion test of 118099.cc testing the throwing failure path in overf=
low:
++// a codecvt whose do_out always returns error makes _M_convert_to_extern=
al
++// throw after the overflow character has been written to the end of put =
area.
++// If the put pointer is advanced before the throw (and only rewound on t=
he
++// non-throwing error path), a caller that catches the exception and keep=
s
++// writing will cause overflow(c) to write past the end of the managed bu=
ffer,
++// just like the original PR libstdc++/118099 testcase.
++
++#include <fstream>
++#include <locale>
++#include <testsuite_hooks.h>
++
++typedef char C;
++
++struct failing_codecvt : std::codecvt<C, char, std::mbstate_t>
++{
++protected:
++  result
++  do_out(state_type&, const intern_type* from, const intern_type*,
++       const intern_type*& from_next,
++       extern_type* to, extern_type*, extern_type*& to_next) const
++  {
++    from_next =3D from;
++    to_next =3D to;
++    return error;
++  }
++
++  bool do_always_noconv() const throw() { return false; }
++};
++
++static void
++test_pr118099_codecvt()
++{
++  const C val =3D C('x');
++  const C canary =3D ~val;
++  const int N =3D 8;
++  C buf[N * 2];
++  for (int i =3D 0; i < N * 2; ++i)
++    buf[i] =3D canary;
++
++  std::basic_filebuf<C> fb;
++  fb.pubimbue(std::locale(std::locale::classic(), new failing_codecvt));
++  fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]
++  fb.open("tmp_118099_codecvt", std::ios_base::out | std::ios_base::trunc=
);
++  VERIFY( fb.is_open() );
++
++  // Libstdc++ filebuf throws ios::failure for the codecvt error,
++  // but the standard allows overflow to return eof instead.
++  // To make this test portable, we check for either kind of error.
++  bool got_error =3D false;
++  for (int i =3D 0; i < N * 2; ++i)
++    try {
++      std::char_traits<C>::int_type r =3D fb.sputc(val);
++      if (std::char_traits<C>::eq_int_type(r, std::char_traits<C>::eof())=
)
++      got_error =3D true;
++    } catch (const std::exception&) {
++      got_error =3D true;
++    }
++  VERIFY( got_error ); // a codecvt error actually happened
++
++  for (int i =3D 0; i < N; ++i)
++    VERIFY( buf[i] =3D=3D val );
++  for (int i =3D N; i < N * 2; ++i)
++    VERIFY( buf[i] =3D=3D canary ); // nothing was written past buf[0..N]
++}
++
++int main()
++{
++  test_pr118099_codecvt();
++}
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/1180=
99.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099.cc
+new file mode 100644
+index 000000000000..2407119dcb1b
+--- /dev/null
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099.cc
+@@ -0,0 +1,57 @@
++// { dg-do run }
++// { dg-require-fileio "" }
++
++// PR libstdc++/118099
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/O =
error
++
++#include <fstream>
++#include <testsuite_hooks.h>
++
++static void
++test_pr118099()
++{
++  typedef char C;
++
++  // Only run if /dev/full already exists as a device: probe it with a
++  // read-only open first, so we never accidentally create a regular file
++  // named /dev/full on a hypothetical system with a writable /dev.
++  {
++    std::filebuf probe;
++    if (!probe.open("/dev/full", std::ios_base::in))
++      return; // no /dev/full here: nothing to test.
++  }
++
++  const C val =3D C('x');
++  const C canary =3D ~val;
++  const int N =3D 8;
++  C buf[N * 2] =3D { };
++  for (int i =3D 0; i < N * 2; ++i)
++    buf[i] =3D canary;
++
++  std::basic_filebuf<C> fb;
++  fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]
++  fb.open("/dev/full", std::ios_base::out);
++  VERIFY( fb.is_open() );
++
++  int i =3D 0;
++  // Keep writing until overflow happens (and fails):
++  while (fb.sputc(val) !=3D std::char_traits<C>::eof())
++    ++i;
++  // There should have been N-1 successful calls before overflow failed:
++  VERIFY( i =3D=3D (N - 1) );
++  // Overflow some more:
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++
++  // Verify that only the first N positions in the buffer were changed:
++  for (i =3D 0; i < N; ++i)
++    VERIFY( buf[i] =3D=3D val );
++  for (; i < N * 2; ++i)
++    VERIFY( buf[i] =3D=3D canary );
++}
++
++int main()
++{
++  test_pr118099();
++}
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/1=
18099-codecvt.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wcha=
r_t/118099-codecvt.cc
+new file mode 100644
+index 000000000000..add23cc99500
+--- /dev/null
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/118099-c=
odecvt.cc
+@@ -0,0 +1,76 @@
++// { dg-do run }
++// { dg-require-fileio "" }
++
++// PR libstdc++/118099
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/O =
error
++//
++// Companion test of 118099.cc testing the throwing failure path in overf=
low:
++// a codecvt whose do_out always returns error makes _M_convert_to_extern=
al
++// throw after the overflow character has been written to the end of put =
area.
++// If the put pointer is advanced before the throw (and only rewound on t=
he
++// non-throwing error path), a caller that catches the exception and keep=
s
++// writing will cause overflow(c) to write past the end of the managed bu=
ffer,
++// just like the original PR libstdc++/118099 testcase.
++
++#include <fstream>
++#include <locale>
++#include <testsuite_hooks.h>
++
++typedef wchar_t C;
++
++struct failing_codecvt : std::codecvt<C, char, std::mbstate_t>
++{
++protected:
++  result
++  do_out(state_type&, const intern_type* from, const intern_type*,
++       const intern_type*& from_next,
++       extern_type* to, extern_type*, extern_type*& to_next) const
++  {
++    from_next =3D from;
++    to_next =3D to;
++    return error;
++  }
++
++  bool do_always_noconv() const throw() { return false; }
++};
++
++static void
++test_pr118099_codecvt()
++{
++  const C val =3D C('x');
++  const C canary =3D ~val;
++  const int N =3D 8;
++  C buf[N * 2];
++  for (int i =3D 0; i < N * 2; ++i)
++    buf[i] =3D canary;
++
++  std::basic_filebuf<C> fb;
++  fb.pubimbue(std::locale(std::locale::classic(), new failing_codecvt));
++  fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]
++  fb.open("tmp_118099_codecvt", std::ios_base::out | std::ios_base::trunc=
);
++  VERIFY( fb.is_open() );
++
++  // Libstdc++ filebuf throws ios::failure for the codecvt error,
++  // but the standard allows overflow to return eof instead.
++  // To make this test portable, we check for either kind of error.
++  bool got_error =3D false;
++  for (int i =3D 0; i < N * 2; ++i)
++    try {
++      std::char_traits<C>::int_type r =3D fb.sputc(val);
++      if (std::char_traits<C>::eq_int_type(r, std::char_traits<C>::eof())=
)
++      got_error =3D true;
++    } catch (const std::exception&) {
++      got_error =3D true;
++    }
++  VERIFY( got_error ); // a codecvt error actually happened
++
++  for (int i =3D 0; i < N; ++i)
++    VERIFY( buf[i] =3D=3D val );
++  for (int i =3D N; i < N * 2; ++i)
++    VERIFY( buf[i] =3D=3D canary ); // nothing was written past buf[0..N]
++}
++
++int main()
++{
++  test_pr118099_codecvt();
++}
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/1=
18099.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/1180=
99.cc
+new file mode 100644
+index 000000000000..bcbbd58ee9c1
+--- /dev/null
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/118099.c=
c
+@@ -0,0 +1,57 @@
++// { dg-do run }
++// { dg-require-fileio "" }
++
++// PR libstdc++/118099
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/O =
error
++
++#include <fstream>
++#include <testsuite_hooks.h>
++
++static void
++test_pr118099()
++{
++  typedef wchar_t C;
++
++  // Only run if /dev/full already exists as a device: probe it with a
++  // read-only open first, so we never accidentally create a regular file
++  // named /dev/full on a hypothetical system with a writable /dev.
++  {
++    std::filebuf probe;
++    if (!probe.open("/dev/full", std::ios_base::in))
++      return; // no /dev/full here: nothing to test.
++  }
++
++  const C val =3D C('x');
++  const C canary =3D ~val;
++  const int N =3D 8;
++  C buf[N * 2] =3D { };
++  for (int i =3D 0; i < N * 2; ++i)
++    buf[i] =3D canary;
++
++  std::basic_filebuf<C> fb;
++  fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]
++  fb.open("/dev/full", std::ios_base::out);
++  VERIFY( fb.is_open() );
++
++  int i =3D 0;
++  // Keep writing until overflow happens (and fails):
++  while (fb.sputc(val) !=3D std::char_traits<C>::eof())
++    ++i;
++  // There should have been N-1 successful calls before overflow failed:
++  VERIFY( i =3D=3D (N - 1) );
++  // Cause some more calls to overflow, which should also fail:
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++
++  // Verify that only the first N positions in the buffer were changed:
++  for (i =3D 0; i < N; ++i)
++    VERIFY( buf[i] =3D=3D val );
++  for (; i < N * 2; ++i)
++    VERIFY( buf[i] =3D=3D canary );
++}
++
++int main()
++{
++  test_pr118099();
++}
+--
+cgit
+
--
2.49.0


--_000_SA3PR11MB34648520FB4DD4D98BEDF4A072EF792SA3PR11MB346485_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi All,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please ignore this thread. Patch name is the wrong CVE number.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I will send a v2.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Harish&nbsp;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Sadineni, Harish<br>
<b>Sent:</b> Thursday, November 19, 2026 12:28 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Kokkonda, Sundeep &lt;Sundeep.Kokkonda@windriver.com&gt;<br>
<b>Subject:</b> [blacksail][PATCH] gcc: Fix for CVE-2026-125709</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Harish Sadineni &lt;Harish.Sadineni@windrive=
r.com&gt;<br>
<br>
libstdc++: Fix buffer overflows in basic_filebuf::overflow [PR118099]<br>
<br>
If we fail to write the content of the buffer after inserting the<br>
overflow character into the end of it, then remove that overflow<br>
character before propagating the error back to the caller. Without this,<br=
>
the caller is left with pptr set past epptr, and successive calls to<br>
overflow will write further past the end of the managed buffer with each<br=
>
failure.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/cve-2026-125709">https://nvd.ni=
st.gov/vuln/detail/cve-2026-125709</a><br>
<a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D118099">https://g=
cc.gnu.org/bugzilla/show_bug.cgi?id=3D118099</a><br>
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2569390">https://b=
ugzilla.redhat.com/show_bug.cgi?id=3D2569390</a><br>
<br>
Signed-off-by: Harish Sadineni &lt;Harish.Sadineni@windriver.com&gt;<br>
---<br>
&nbsp;meta/recipes-devtools/gcc/gcc-16.2.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&nbsp;.../gcc/gcc/0027-CVE-2026-125907.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 378 ++++++++++++++++++<br>
&nbsp;2 files changed, 379 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/gcc/gcc/0027-CVE-2026-125907=
.patch<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtools=
/gcc/gcc-16.2.inc<br>
index 3497493619..84a6175abe 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-16.2.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc<br>
@@ -75,6 +75,7 @@ SRC_URI =3D &quot;${BASEURI} \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-mapper-localhost-might-not-be-known.patch">file://0001-mapp=
er-localhost-might-not-be-known.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Fix-check-for-working-assembler-gdwarf-4-option.patch">
file://0001-Fix-check-for-working-assembler-gdwarf-4-option.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0026-CVE-2026-102010.patch">file://0026-CVE-2026-102010.patch</a=
> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0=
027-CVE-2026-125907.patch">file://0027-CVE-2026-125907.patch</a> \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;UNPACKDIR =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources&quo=
t;<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-125907.patch b/met=
a/recipes-devtools/gcc/gcc/0027-CVE-2026-125907.patch<br>
new file mode 100644<br>
index 0000000000..cb3a437475<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-125907.patch<br>
@@ -0,0 +1,378 @@<br>
+From 68b1b9056c70acb31f2964963b51c480ff820602 Mon Sep 17 00:00:00 2001<br>
+From: Jonathan Wakely &lt;jwakely@redhat.com&gt;<br>
+Date: Wed, 28 Oct 2026 10:34:17 +0000<br>
+Subject: libstdc++: Fix buffer overflows in basic_filebuf::overflow [PR118=
099]<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+If we fail to write the content of the buffer after inserting the<br>
+overflow character into the end of it, then remove that overflow<br>
+character before propagating the error back to the caller. Without this,<b=
r>
+the caller is left with pptr set past epptr, and successive calls to<br>
+overflow will write further past the end of the managed buffer with each<b=
r>
+failure.<br>
+<br>
+The new 118099-codecvt.cc tests were assisted by an LLM because I was<br>
+too lazy to remember how to write codecvt facets.<br>
+<br>
+Assisted-by: LLM<br>
+<br>
+libstdc++-v3/ChangeLog:<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PR libstdc++/118099<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * include/bits/fstream.tcc (basic_fil=
ebuf::overflow): Rewind the<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; put position if outputting the put ar=
ea fails.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * testsuite/27_io/basic_filebuf/overf=
low/char/118099-codecvt.cc:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New test.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * testsuite/27_io/basic_filebuf/overf=
low/char/118099.cc: New<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * testsuite/27_io/basic_filebuf/overf=
low/wchar_t/118099-codecvt.cc:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New test.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * testsuite/27_io/basic_filebuf/overf=
low/wchar_t/118099.cc:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New test.<br>
+<br>
+CVE: CVE-2026-125709<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/cgit/gcc/commit/=
?id=3D68b1b9056c70acb31f2964963b51c480ff820602">https://gcc.gnu.org/cgit/gc=
c/commit/?id=3D68b1b9056c70acb31f2964963b51c480ff820602</a>]<br>
+<br>
+Signed-off-by: Harish Sadineni &lt;Harish.Sadineni@windriver.com&gt;<br>
+<br>
+Reviewed-by: Tomasz Kami=F1ski &lt;tkaminsk@redhat.com&gt;<br>
+(cherry picked from commit 2d296e9f024edbb49cad1f3ebb5ae34c71ea5f7a)<br>
+---<br>
+ libstdc++-v3/include/bits/fstream.tcc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 +++<br>
+ .../basic_filebuf/overflow/char/118099-codecvt.cc&nbsp; | 76 ++++++++++++=
++++++++++<br>
+ .../27_io/basic_filebuf/overflow/char/118099.cc&nbsp;&nbsp;&nbsp; | 57 ++=
++++++++++++++<br>
+ .../overflow/wchar_t/118099-codecvt.cc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 76 ++++++++++++++++++++++<br>
+ .../27_io/basic_filebuf/overflow/wchar_t/118099.cc | 57 ++++++++++++++++<=
br>
+ 5 files changed, 274 insertions(+)<br>
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/ch=
ar/118099-codecvt.cc<br>
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/ch=
ar/118099.cc<br>
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wc=
har_t/118099-codecvt.cc<br>
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wc=
har_t/118099.cc<br>
+<br>
+diff --git a/libstdc++-v3/include/bits/fstream.tcc b/libstdc++-v3/include/=
bits/fstream.tcc<br>
+index 99aa296b83c4..0d1d9491cb6a 100644<br>
+--- a/libstdc++-v3/include/bits/fstream.tcc<br>
++++ b/libstdc++-v3/include/bits/fstream.tcc<br>
+@@ -561,11 +561,18 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (this-&gt;pbase(=
) &lt; this-&gt;pptr())<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct=
 _Guard {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ~_Guard() { if (_M_p) _M_p-&gt;pbump(-1); }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; basic_filebuf* _M_p;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _Guard=
 __g =3D { };<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; // If appropriate, append the overflow char.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; if (!__testeof)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; *this-&gt;pptr() =3D traits_type::to_char_type=
(__c);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; this-&gt;pbump(1);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; __g._M_p =3D this;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; // Convert pending sequence to external representation,<br>
+@@ -573,6 +580,7 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; if (_M_convert_to_external(this-&gt;pbase(),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; this-&gt;pptr() - this-&gt;pbase()))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; __g._M_p =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; _M_set_buffer(0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; __ret =3D traits_type::not_eof(__c);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/1180=
99-codecvt.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/11=
8099-codecvt.cc<br>
+new file mode 100644<br>
+index 000000000000..e4b1106b9b8d<br>
+--- /dev/null<br>
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099-code=
cvt.cc<br>
+@@ -0,0 +1,76 @@<br>
++// { dg-do run }<br>
++// { dg-require-fileio &quot;&quot; }<br>
++<br>
++// PR libstdc++/118099<br>
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/O =
error<br>
++//<br>
++// Companion test of 118099.cc testing the throwing failure path in overf=
low:<br>
++// a codecvt whose do_out always returns error makes _M_convert_to_extern=
al<br>
++// throw after the overflow character has been written to the end of put =
area.<br>
++// If the put pointer is advanced before the throw (and only rewound on t=
he<br>
++// non-throwing error path), a caller that catches the exception and keep=
s<br>
++// writing will cause overflow(c) to write past the end of the managed bu=
ffer,<br>
++// just like the original PR libstdc++/118099 testcase.<br>
++<br>
++#include &lt;fstream&gt;<br>
++#include &lt;locale&gt;<br>
++#include &lt;testsuite_hooks.h&gt;<br>
++<br>
++typedef char C;<br>
++<br>
++struct failing_codecvt : std::codecvt&lt;C, char, std::mbstate_t&gt;<br>
++{<br>
++protected:<br>
++&nbsp; result<br>
++&nbsp; do_out(state_type&amp;, const intern_type* from, const intern_type=
*,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const intern_type*&amp; from_next,<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern_type* to, extern_type*, exter=
n_type*&amp; to_next) const<br>
++&nbsp; {<br>
++&nbsp;&nbsp;&nbsp; from_next =3D from;<br>
++&nbsp;&nbsp;&nbsp; to_next =3D to;<br>
++&nbsp;&nbsp;&nbsp; return error;<br>
++&nbsp; }<br>
++<br>
++&nbsp; bool do_always_noconv() const throw() { return false; }<br>
++};<br>
++<br>
++static void<br>
++test_pr118099_codecvt()<br>
++{<br>
++&nbsp; const C val =3D C('x');<br>
++&nbsp; const C canary =3D ~val;<br>
++&nbsp; const int N =3D 8;<br>
++&nbsp; C buf[N * 2];<br>
++&nbsp; for (int i =3D 0; i &lt; N * 2; ++i)<br>
++&nbsp;&nbsp;&nbsp; buf[i] =3D canary;<br>
++<br>
++&nbsp; std::basic_filebuf&lt;C&gt; fb;<br>
++&nbsp; fb.pubimbue(std::locale(std::locale::classic(), new failing_codecv=
t));<br>
++&nbsp; fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]<br>
++&nbsp; fb.open(&quot;tmp_118099_codecvt&quot;, std::ios_base::out | std::=
ios_base::trunc);<br>
++&nbsp; VERIFY( fb.is_open() );<br>
++<br>
++&nbsp; // Libstdc++ filebuf throws ios::failure for the codecvt error,<br=
>
++&nbsp; // but the standard allows overflow to return eof instead.<br>
++&nbsp; // To make this test portable, we check for either kind of error.<=
br>
++&nbsp; bool got_error =3D false;<br>
++&nbsp; for (int i =3D 0; i &lt; N * 2; ++i)<br>
++&nbsp;&nbsp;&nbsp; try {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; std::char_traits&lt;C&gt;::int_type r =3D =
fb.sputc(val);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (std::char_traits&lt;C&gt;::eq_int_type=
(r, std::char_traits&lt;C&gt;::eof()))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; got_error =3D true;<br>
++&nbsp;&nbsp;&nbsp; } catch (const std::exception&amp;) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; got_error =3D true;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp; VERIFY( got_error ); // a codecvt error actually happened<br>
++<br>
++&nbsp; for (int i =3D 0; i &lt; N; ++i)<br>
++&nbsp;&nbsp;&nbsp; VERIFY( buf[i] =3D=3D val );<br>
++&nbsp; for (int i =3D N; i &lt; N * 2; ++i)<br>
++&nbsp;&nbsp;&nbsp; VERIFY( buf[i] =3D=3D canary ); // nothing was written=
 past buf[0..N]<br>
++}<br>
++<br>
++int main()<br>
++{<br>
++&nbsp; test_pr118099_codecvt();<br>
++}<br>
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/1180=
99.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099.cc<=
br>
+new file mode 100644<br>
+index 000000000000..2407119dcb1b<br>
+--- /dev/null<br>
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099.cc<b=
r>
+@@ -0,0 +1,57 @@<br>
++// { dg-do run }<br>
++// { dg-require-fileio &quot;&quot; }<br>
++<br>
++// PR libstdc++/118099<br>
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/O =
error<br>
++<br>
++#include &lt;fstream&gt;<br>
++#include &lt;testsuite_hooks.h&gt;<br>
++<br>
++static void<br>
++test_pr118099()<br>
++{<br>
++&nbsp; typedef char C;<br>
++<br>
++&nbsp; // Only run if /dev/full already exists as a device: probe it with=
 a<br>
++&nbsp; // read-only open first, so we never accidentally create a regular=
 file<br>
++&nbsp; // named /dev/full on a hypothetical system with a writable /dev.<=
br>
++&nbsp; {<br>
++&nbsp;&nbsp;&nbsp; std::filebuf probe;<br>
++&nbsp;&nbsp;&nbsp; if (!probe.open(&quot;/dev/full&quot;, std::ios_base::=
in))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return; // no /dev/full here: nothing to t=
est.<br>
++&nbsp; }<br>
++<br>
++&nbsp; const C val =3D C('x');<br>
++&nbsp; const C canary =3D ~val;<br>
++&nbsp; const int N =3D 8;<br>
++&nbsp; C buf[N * 2] =3D { };<br>
++&nbsp; for (int i =3D 0; i &lt; N * 2; ++i)<br>
++&nbsp;&nbsp;&nbsp; buf[i] =3D canary;<br>
++<br>
++&nbsp; std::basic_filebuf&lt;C&gt; fb;<br>
++&nbsp; fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]<br>
++&nbsp; fb.open(&quot;/dev/full&quot;, std::ios_base::out);<br>
++&nbsp; VERIFY( fb.is_open() );<br>
++<br>
++&nbsp; int i =3D 0;<br>
++&nbsp; // Keep writing until overflow happens (and fails):<br>
++&nbsp; while (fb.sputc(val) !=3D std::char_traits&lt;C&gt;::eof())<br>
++&nbsp;&nbsp;&nbsp; ++i;<br>
++&nbsp; // There should have been N-1 successful calls before overflow fai=
led:<br>
++&nbsp; VERIFY( i =3D=3D (N - 1) );<br>
++&nbsp; // Overflow some more:<br>
++&nbsp; VERIFY( fb.sputc(val) =3D=3D std::char_traits&lt;C&gt;::eof() );<b=
r>
++&nbsp; VERIFY( fb.sputc(val) =3D=3D std::char_traits&lt;C&gt;::eof() );<b=
r>
++&nbsp; VERIFY( fb.sputc(val) =3D=3D std::char_traits&lt;C&gt;::eof() );<b=
r>
++<br>
++&nbsp; // Verify that only the first N positions in the buffer were chang=
ed:<br>
++&nbsp; for (i =3D 0; i &lt; N; ++i)<br>
++&nbsp;&nbsp;&nbsp; VERIFY( buf[i] =3D=3D val );<br>
++&nbsp; for (; i &lt; N * 2; ++i)<br>
++&nbsp;&nbsp;&nbsp; VERIFY( buf[i] =3D=3D canary );<br>
++}<br>
++<br>
++int main()<br>
++{<br>
++&nbsp; test_pr118099();<br>
++}<br>
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/1=
18099-codecvt.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wcha=
r_t/118099-codecvt.cc<br>
+new file mode 100644<br>
+index 000000000000..add23cc99500<br>
+--- /dev/null<br>
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/118099-c=
odecvt.cc<br>
+@@ -0,0 +1,76 @@<br>
++// { dg-do run }<br>
++// { dg-require-fileio &quot;&quot; }<br>
++<br>
++// PR libstdc++/118099<br>
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/O =
error<br>
++//<br>
++// Companion test of 118099.cc testing the throwing failure path in overf=
low:<br>
++// a codecvt whose do_out always returns error makes _M_convert_to_extern=
al<br>
++// throw after the overflow character has been written to the end of put =
area.<br>
++// If the put pointer is advanced before the throw (and only rewound on t=
he<br>
++// non-throwing error path), a caller that catches the exception and keep=
s<br>
++// writing will cause overflow(c) to write past the end of the managed bu=
ffer,<br>
++// just like the original PR libstdc++/118099 testcase.<br>
++<br>
++#include &lt;fstream&gt;<br>
++#include &lt;locale&gt;<br>
++#include &lt;testsuite_hooks.h&gt;<br>
++<br>
++typedef wchar_t C;<br>
++<br>
++struct failing_codecvt : std::codecvt&lt;C, char, std::mbstate_t&gt;<br>
++{<br>
++protected:<br>
++&nbsp; result<br>
++&nbsp; do_out(state_type&amp;, const intern_type* from, const intern_type=
*,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const intern_type*&amp; from_next,<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extern_type* to, extern_type*, exter=
n_type*&amp; to_next) const<br>
++&nbsp; {<br>
++&nbsp;&nbsp;&nbsp; from_next =3D from;<br>
++&nbsp;&nbsp;&nbsp; to_next =3D to;<br>
++&nbsp;&nbsp;&nbsp; return error;<br>
++&nbsp; }<br>
++<br>
++&nbsp; bool do_always_noconv() const throw() { return false; }<br>
++};<br>
++<br>
++static void<br>
++test_pr118099_codecvt()<br>
++{<br>
++&nbsp; const C val =3D C('x');<br>
++&nbsp; const C canary =3D ~val;<br>
++&nbsp; const int N =3D 8;<br>
++&nbsp; C buf[N * 2];<br>
++&nbsp; for (int i =3D 0; i &lt; N * 2; ++i)<br>
++&nbsp;&nbsp;&nbsp; buf[i] =3D canary;<br>
++<br>
++&nbsp; std::basic_filebuf&lt;C&gt; fb;<br>
++&nbsp; fb.pubimbue(std::locale(std::locale::classic(), new failing_codecv=
t));<br>
++&nbsp; fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]<br>
++&nbsp; fb.open(&quot;tmp_118099_codecvt&quot;, std::ios_base::out | std::=
ios_base::trunc);<br>
++&nbsp; VERIFY( fb.is_open() );<br>
++<br>
++&nbsp; // Libstdc++ filebuf throws ios::failure for the codecvt error,<br=
>
++&nbsp; // but the standard allows overflow to return eof instead.<br>
++&nbsp; // To make this test portable, we check for either kind of error.<=
br>
++&nbsp; bool got_error =3D false;<br>
++&nbsp; for (int i =3D 0; i &lt; N * 2; ++i)<br>
++&nbsp;&nbsp;&nbsp; try {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; std::char_traits&lt;C&gt;::int_type r =3D =
fb.sputc(val);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (std::char_traits&lt;C&gt;::eq_int_type=
(r, std::char_traits&lt;C&gt;::eof()))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; got_error =3D true;<br>
++&nbsp;&nbsp;&nbsp; } catch (const std::exception&amp;) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; got_error =3D true;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp; VERIFY( got_error ); // a codecvt error actually happened<br>
++<br>
++&nbsp; for (int i =3D 0; i &lt; N; ++i)<br>
++&nbsp;&nbsp;&nbsp; VERIFY( buf[i] =3D=3D val );<br>
++&nbsp; for (int i =3D N; i &lt; N * 2; ++i)<br>
++&nbsp;&nbsp;&nbsp; VERIFY( buf[i] =3D=3D canary ); // nothing was written=
 past buf[0..N]<br>
++}<br>
++<br>
++int main()<br>
++{<br>
++&nbsp; test_pr118099_codecvt();<br>
++}<br>
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/1=
18099.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/1180=
99.cc<br>
+new file mode 100644<br>
+index 000000000000..bcbbd58ee9c1<br>
+--- /dev/null<br>
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/118099.c=
c<br>
+@@ -0,0 +1,57 @@<br>
++// { dg-do run }<br>
++// { dg-require-fileio &quot;&quot; }<br>
++<br>
++// PR libstdc++/118099<br>
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/O =
error<br>
++<br>
++#include &lt;fstream&gt;<br>
++#include &lt;testsuite_hooks.h&gt;<br>
++<br>
++static void<br>
++test_pr118099()<br>
++{<br>
++&nbsp; typedef wchar_t C;<br>
++<br>
++&nbsp; // Only run if /dev/full already exists as a device: probe it with=
 a<br>
++&nbsp; // read-only open first, so we never accidentally create a regular=
 file<br>
++&nbsp; // named /dev/full on a hypothetical system with a writable /dev.<=
br>
++&nbsp; {<br>
++&nbsp;&nbsp;&nbsp; std::filebuf probe;<br>
++&nbsp;&nbsp;&nbsp; if (!probe.open(&quot;/dev/full&quot;, std::ios_base::=
in))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return; // no /dev/full here: nothing to t=
est.<br>
++&nbsp; }<br>
++<br>
++&nbsp; const C val =3D C('x');<br>
++&nbsp; const C canary =3D ~val;<br>
++&nbsp; const int N =3D 8;<br>
++&nbsp; C buf[N * 2] =3D { };<br>
++&nbsp; for (int i =3D 0; i &lt; N * 2; ++i)<br>
++&nbsp;&nbsp;&nbsp; buf[i] =3D canary;<br>
++<br>
++&nbsp; std::basic_filebuf&lt;C&gt; fb;<br>
++&nbsp; fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]<br>
++&nbsp; fb.open(&quot;/dev/full&quot;, std::ios_base::out);<br>
++&nbsp; VERIFY( fb.is_open() );<br>
++<br>
++&nbsp; int i =3D 0;<br>
++&nbsp; // Keep writing until overflow happens (and fails):<br>
++&nbsp; while (fb.sputc(val) !=3D std::char_traits&lt;C&gt;::eof())<br>
++&nbsp;&nbsp;&nbsp; ++i;<br>
++&nbsp; // There should have been N-1 successful calls before overflow fai=
led:<br>
++&nbsp; VERIFY( i =3D=3D (N - 1) );<br>
++&nbsp; // Cause some more calls to overflow, which should also fail:<br>
++&nbsp; VERIFY( fb.sputc(val) =3D=3D std::char_traits&lt;C&gt;::eof() );<b=
r>
++&nbsp; VERIFY( fb.sputc(val) =3D=3D std::char_traits&lt;C&gt;::eof() );<b=
r>
++&nbsp; VERIFY( fb.sputc(val) =3D=3D std::char_traits&lt;C&gt;::eof() );<b=
r>
++<br>
++&nbsp; // Verify that only the first N positions in the buffer were chang=
ed:<br>
++&nbsp; for (i =3D 0; i &lt; N; ++i)<br>
++&nbsp;&nbsp;&nbsp; VERIFY( buf[i] =3D=3D val );<br>
++&nbsp; for (; i &lt; N * 2; ++i)<br>
++&nbsp;&nbsp;&nbsp; VERIFY( buf[i] =3D=3D canary );<br>
++}<br>
++<br>
++int main()<br>
++{<br>
++&nbsp; test_pr118099();<br>
++}<br>
+-- <br>
+cgit <br>
+<br>
-- <br>
2.49.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SA3PR11MB34648520FB4DD4D98BEDF4A072EF792SA3PR11MB346485_--
