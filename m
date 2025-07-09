Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282BAC83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 02:12:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4930.1752027135383876329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 19:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=928519c0ff=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5691lIYh009240
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Jul 2025 19:12:15 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47q3jn3dfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 19:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8/ExvMH8SqeXekxSBAd5nSsfYcMOreRWPT+eI4N7nZt7YKuOo5efP9ps02LtYzXTtyPl8krWt1Oii4Z1osKL15wGpRlsQOGs5lDJLuJCykyYSvYmklZz3tSksDjcDEszTSzBxfymUGDqprFQ3cvgo9qukMruvH5AlDHrXAk4BfVlGOYp4jZ++jA5hJEpbqHZEnHsa85eshLFjAi5nx7CIXD1rLE9bapUB2P5FYIgmpXWJBRurQBIrI4vmS+qReNBFS0zruWe44Shd0SxaGAZQhiEc+bLrIuZSkRSJESWKumnZHmNWYYE2aBVCcV6WN/Fto5g410D+o1BHgK+Usdzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kj6BpMbiBLXFCiXxqEyHnwGimTkNJASh+oQFaoLa4AI=;
 b=Mf5L9J88MUmoKtPA7dltQ488xPiRETmuKoSCsaIWaV/UqZ2Sg8WryAGdm1F56HnthwIEsvNApqFH69ZvSN0cWqgjAFcvht025b1CHpbzG5qZT4VXV7X8aJkoH86deiXJ3jNfJyzDGdPxRctyR+GLupf0RdMy7blwWKO8Z6k8jY0Z3qRNK3nndlZjJqdeVOQsCIo3uOmYGXVwBspl6w2aS6SXITlQNBrX2y+/w1kQhRmK/GO4D4JVY9PEcBTPVLMxVwaN0joZsk6SKZmBayPBixq0GwoHv2ViwakRGGTxKd6dnwPqwPuUJDi5dG1iuXCwLHNGsL17a8xhN1cDLUSLpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by LV8PR11MB8680.namprd11.prod.outlook.com (2603:10b6:408:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 9 Jul
 2025 02:12:09 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 02:12:09 +0000
From: "He, Guocai (CN)" <Guocai.He.CN@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][scarthgap][PATCH] wayland: correct the SRC_URIs
Thread-Topic: [oe-core][scarthgap][PATCH] wayland: correct the SRC_URIs
Thread-Index: AQHb7wR952zXK8HtaEyXDdDoGHby9rQpD5Mh
Date: Wed, 9 Jul 2025 02:12:09 +0000
Message-ID: 
 <CO6PR11MB5586AA1C6F78F524E6221638CD49A@CO6PR11MB5586.namprd11.prod.outlook.com>
References: <20250707060021.2160604-1-guocai.he.cn@windriver.com>
In-Reply-To: <20250707060021.2160604-1-guocai.he.cn@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8f6178a8-b4c1-4a71-93eb-55364c907e8d_Enabled=True;MSIP_Label_8f6178a8-b4c1-4a71-93eb-55364c907e8d_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_8f6178a8-b4c1-4a71-93eb-55364c907e8d_SetDate=2025-07-09T02:12:30.497Z;MSIP_Label_8f6178a8-b4c1-4a71-93eb-55364c907e8d_Name=PUBLIC;MSIP_Label_8f6178a8-b4c1-4a71-93eb-55364c907e8d_ContentBits=0;MSIP_Label_8f6178a8-b4c1-4a71-93eb-55364c907e8d_Method=Privileged;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5586:EE_|LV8PR11MB8680:EE_
x-ms-office365-filtering-correlation-id: fe740cdb-de1b-467d-9964-08ddbe8e02c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|13003099007|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?ml+PzQQU9yg7YW5UN1k6G+wYLGD6QJdEDODlinl0txB5cO72LJCeqPQM?=
 =?Windows-1252?Q?rOVVHu3f6HRXtX5RRh3L4x2zwKZ9QK9gUcubiGqHYBnGry7syBMG4U+5?=
 =?Windows-1252?Q?xjW+S/NMo5/e28Iuc+ImuGyk3rYiDGiJo0Eypf2K5mqn13b6xizcID5g?=
 =?Windows-1252?Q?4I2+Hfa280Dy2pKbpIWrOuPmq0mfk2wCGHgsdi+2KkUIkJsikynae9Sb?=
 =?Windows-1252?Q?c8Lhe8qhQkjAEbXEJumQOnC1PFSZPb25LYHL0JsHEVZ+Iy3V4CXR7ui8?=
 =?Windows-1252?Q?3AoLajGWneMaHXCjVbe/oi/zNJ6DWxbFQ6seXkGiWAJ7juGIQiX6f5GG?=
 =?Windows-1252?Q?JXlNAdLDUBYLbpYccc2q+6tZLKulGRAoDo/CpGheSOxW/ddlbm9jdhuy?=
 =?Windows-1252?Q?Fsyt1V4f2ZyGXyiMrfNSwN6REdcAApf/ks1fOEMWTOullasrgket0ENO?=
 =?Windows-1252?Q?25653s5PuqsRmuhPj9ROYLmFSyF+aEUT84j8t2KPy94kk0n5jXZMDjiH?=
 =?Windows-1252?Q?221TsudP7aN5XEJHbH7wASadXLwtPPDqcTUhC62fgYDrhZbi4tqGg57e?=
 =?Windows-1252?Q?tNTlPiS9AZao3YJz1LLWqErDqyD+5Ee3zdcaTF6xlJ3+pceRsgRFeAgl?=
 =?Windows-1252?Q?QMe0k856mrE7cH40K4KkIKI5b+o86iUjGB7l5hpIaaV8Aqop53Wn0khv?=
 =?Windows-1252?Q?f3j4my1FVZ3Z/uokUoDQi7iiEg6uAA4L+Gc2gOKqJbbbExcYgpKXLj0k?=
 =?Windows-1252?Q?DDgjYB0rA8vb5hYS6U0knxOEF/sWNbGir/hb7O2Y2gCFln++qsbYQoU5?=
 =?Windows-1252?Q?3mMUAnyzDGSJI59U4TAKvXff3YRebrTwfKSSftrsbxpG+DZgNwm0qiMN?=
 =?Windows-1252?Q?MgSiMRowdXCtO0kstmArD9OTyoVLJvWiInk/KW5OC7GGsu7Mx9+xdvRA?=
 =?Windows-1252?Q?STCpZ0w/XXAsDNkWtcJLg5bWDpZu6AWr9PIQ2sV5T2QdA6/GsqETQcSo?=
 =?Windows-1252?Q?ppEjxy+6OiK5wyBlpmM/sw/+RyUZJWgxuG8CjFscPgEjako6JkdEsemT?=
 =?Windows-1252?Q?HpftTeXOtYCnwEPSErXjKG81lNoSxmI+DsKYRTcmFMosY0d7D8AroQ+Q?=
 =?Windows-1252?Q?wsBww8z6w8FRHVl2PSAMywSBKRHbOUETBIkML4ahFYPgmB1dt6wj4aS+?=
 =?Windows-1252?Q?0WGiGrBBMZSNMeSLfb62gRlcfojylDDetKfdOw5FawK7QgTrqPHwU89R?=
 =?Windows-1252?Q?mvLjkb9bHtcymOP6CQcXvORJkx+m0ztFqHnEpzLZ3H6/jmfQbKvgNt0E?=
 =?Windows-1252?Q?6eLgw0axwmTkpMYRaDqL/dIeti/lXLufz+6xEFl1rtevce6mthiKiaZL?=
 =?Windows-1252?Q?wCXoCM8faqs75WU/vlUQdl6uS7162j5H+3RE4Xlu31p6OICG+Mv7Vhfm?=
 =?Windows-1252?Q?xnnArqWih45ZEN6VUFV7F3tFeCDjieDNdUVYdUFvmPgYfQGNn3YFQ1CB?=
 =?Windows-1252?Q?1rS675UKws9mrya7tEiiuiabEZWMk08J5zsku1xCyy+kL5GhiPc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(13003099007)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?GwFhvCq2BR6vW6wUEMwhus14/0zLPdxSyguW6JYv1MZN4XnJYqCJOGkc?=
 =?Windows-1252?Q?XgzE19fnhlNwPxKi/l62FaLD0y7KT9RJfqCzBw1xayoQ2muZ9EVQvC7M?=
 =?Windows-1252?Q?g5DQzLcDN8W9EJWdQqExujAPkDGa23XX4zDtdXOJzBJCfk54rdetx7Dy?=
 =?Windows-1252?Q?tIRmlZULlgDlfxNm0Ee9Nfhvo1p209V7xCpNflhk0Ys0q35ApClw0z23?=
 =?Windows-1252?Q?RaH/Sp7w9/5E+4cp9bFSDlqKhbNppbNprnMoXBexJhWE8bPn6MvztY51?=
 =?Windows-1252?Q?lfzDrDp5BXnxDbTiZjAfXMsgMoQItKEHUFBcvqd83gDQeL1w49ekgpNT?=
 =?Windows-1252?Q?VQpJBfgP6/Lcl6m8Fk2WfHKiMYYBolRZz5fLdVOqhcrQaOm37dhL6kBw?=
 =?Windows-1252?Q?rBtEhCXW4LdEtd4FgiFidzZ31pe+G98q/uDwxHO7AH52MQ9e7AKXZ87T?=
 =?Windows-1252?Q?tBkQX4lGl1nSqAVDAygbcI1HIiOYXNnbV+6FR39vYN0hn3+VEP5HRT0o?=
 =?Windows-1252?Q?aqkNGK9fji4UfOcRy0NniSY+qV7hag+Z4X3HLK461g2mH8o0ZCdNbNQe?=
 =?Windows-1252?Q?BQWfCEVWQwTSa1hiqLA2y+skMXj8qLV45PFvWM01iiIyDcMWsVyFyGFD?=
 =?Windows-1252?Q?FAU94TgexmquCmBk0oo0GdsXJ7xFg54vcTpn2MNkrd51ESlJG2GgZHp+?=
 =?Windows-1252?Q?34FDGd60AArNZpV+y3ZMH8iwx9V9U+ezqAbVaSzp3GUGhH09sIT66LG5?=
 =?Windows-1252?Q?quHXpFXr1PfF/tneQFvAv4iM6q7CXnPuAtOjvpWz2hXC68wYMCGY8VCL?=
 =?Windows-1252?Q?5u1iNrOorVb41kwaJH0LmuFgjP9+7ZqFTXqmzuEa/hqfk/wbygTn7BHG?=
 =?Windows-1252?Q?cKqDcQNrhi3402plxCZ46jHr9SpQWjhbANrfCZNIv3l9Uh+5+5rRk+wY?=
 =?Windows-1252?Q?fIx7XrorNUlpef9PggquArtzYfhmvNgmhO1Ua5voZEjaUa45FV1Bx3DD?=
 =?Windows-1252?Q?/7tmH1WO/r4+XhfjrSz4yBRaQnoLHWZbLOi0xQkBEGM7QxHH9BrJM2v0?=
 =?Windows-1252?Q?VPc/02f8ZlS1nsTbNr9Vy97fHEwl5G/eSPPUIKf4tm995TeNXTGkRT68?=
 =?Windows-1252?Q?ovQZdHLgEyjxJGnwWvay6S80cpRZeIxevnbz1+N8YL+RLcBhKO8vejzf?=
 =?Windows-1252?Q?OU1O9csDBGgy5ZqlYniUm4AytARTfTFB8hjHSD33mYOnRrgw8oSvadPg?=
 =?Windows-1252?Q?fN1ZIImuyHOLnJFqGxUxVRoZeMfCRRKA5Ehe0NY6qKMzuIoNZBvrz6JK?=
 =?Windows-1252?Q?Tl1a7xbPMS5aXSKV4U33FK/DG5HzxHNcL6zfzs9zvaMHZSyVbP8lzV1i?=
 =?Windows-1252?Q?BOYBFDOj2BuDR65D4+191yYZzM/AW5b2x8lZhdnvTLSffR5RFaD7Uk/s?=
 =?Windows-1252?Q?pd9eXjkADYHApLDYDJcE24pP1M/0PgHi39/6VUOkoJnVT1i3m3fZnUZb?=
 =?Windows-1252?Q?FErmhoHA2Ga1Ypw53b2gJAFKm2jlIgHKnE2OOOnOJmOBnI89z/ql9+zX?=
 =?Windows-1252?Q?nB5Jw0mzwkPyGQse30ZdBlOeu+ptnpjpPjX1Dq2I6gpsIULt3WGO044J?=
 =?Windows-1252?Q?KWG7NX4sR3z7bc+WndJx6GHSkGYAdG0PPlXY3vv5Uf68Q45yOTlMHcxN?=
 =?Windows-1252?Q?rW/jRQzqPImB0wJ6iEbGbvpsNdjmo25R?=
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB5586AA1C6F78F524E6221638CD49ACO6PR11MB5586namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe740cdb-de1b-467d-9964-08ddbe8e02c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 02:12:09.7094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pnv7n3pLfqA3eZT9pA8nvB8Nq1q2XDfkr25gIC58/dcTcIexM0Kv4YJ0+q7TaETCrQjMFFj8veo0LLXwd4Xk9uiHj+G2J0X9acHbxhkjy0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8680
X-Proofpoint-GUID: Bgmb79WseTmMeC12e8pAPVDQYzbHXtwh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX7l55Yd6irA4i G+6UHRTVq+HSB8OqzA69V1ZS3dcWw/L3GHw3Nt00IqhUR2nrzL9sXVvhmeEhpka/esHidJIxYIm MtqwQACSGlnPk8XLIeMiuAKZAOhVBoO26uj2V7E8GwFXFOilpGpovCvWYDye4jSvkl6jGwZvwrn
 YUE1JT5cOH584hJ/39IPViRsyMwiOBvwWuTWdb7+/wLmL6UzL0JP95XDpHqN+UJ6/rRlCzmnpu0 g+FfrrWZOmLABN+j6L14AkY9oTpmYUE8tIFss0sGjKiiqDjeZpm6jxm+FOB57erRCDjtq69MzvI zVgmFXTmzB/oAURVqr+8mDWsjHPqxgNshnHrJDne7puLcOHEyTxFKl5KcKQtIs1Ljr3ZY8xWWi8 0mQTknI3
X-Proofpoint-ORIG-GUID: Bgmb79WseTmMeC12e8pAPVDQYzbHXtwh
X-Authority-Analysis: v=2.4 cv=fv3cZE4f c=1 sm=1 tr=0 ts=686dcffe cx=c_pps a=KL7Y6FGphXEQM/AhdslM5w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=GmUfVegI4vmm9qKJe6EA:9 a=pILNOxqGKmIA:10 a=Fw-oE47YfpUy4_pEl9EA:9 a=um2aNtj89Jj2VOfz:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_01,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 02:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220055

--_000_CO6PR11MB5586AA1C6F78F524E6221638CD49ACO6PR11MB5586namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Sorry for the trouble. I=92ve confirmed with our IT team that the issue is =
indeed caused by our company=92s network security restrictions. When I=92m =
on a non-corporate network, the older URIs work just fine.
Please go ahead and skip it. Apologies for the inconvenience.
Thanks,
Guocai
________________________________
From: He, Guocai (CN)
Sent: Monday, July 7, 2025 2:00 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [oe-core][scarthgap][PATCH] wayland: correct the SRC_URIs

From: Guocai He <guocai.he.cn@windriver.com>

For wayland, wayland-utils and wayland-protocals, not only
the SRC_URIs are updated, but also the tar.xz are no longer
available. We have replaced them with the tar.bz2 barballs.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
The version for master is not the same, so this patch just
for [scarthgap] and I will send another patch for master.
---
 meta/recipes-graphics/wayland/wayland-protocols_1.33.bb | 4 ++--
 meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb    | 4 ++--
 meta/recipes-graphics/wayland/wayland_1.22.0.bb         | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb b/meta=
/recipes-graphics/wayland/wayland-protocols_1.33.bb
index 074ea3663a..2300ae46d1 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
@@ -9,8 +9,8 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc7b12b6702da38ca028ace54aae3d48=
4 \
                     file://stable/presentation-time/presentation-time.xml;=
endline=3D26;md5=3D4646cd7d9edc9fa55db941f2d3a7dc53"

-SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/re=
leases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "94f0c50b090d6e61a03f62048467b19abbe851be4e11ae7b36=
f65f8b98c3963a"
+SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/ar=
chive/${PV}/wayland-protocols-${PV}.tar.bz2"
+SRC_URI[sha256sum] =3D "622754e38cf70e9e02700e2df22cbd1257e523e0cc22004f1e=
ce409719823da5"

 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-pro=
tocols/-/tags"

diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb b/meta/re=
cipes-graphics/wayland/wayland-utils_1.2.0.bb
index 878c7a267e..4ff113f1e9 100644
--- a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
@@ -9,8 +9,8 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D548a66038a77415e1df51118625e832=
f \
                    "

-SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releas=
es/${PV}/downloads/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "d9278c22554586881802540751bcc42569262bf80cd9ac9b0f=
d12ff4bd09a9e4"
+SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-utils/-/archiv=
e/${PV}/${BPN}-${PV}.tar.bz2"
+SRC_URI[sha256sum] =3D "f38c6a4ca2113cf716ca687a4cd8e24a11cbeeb04759678b7b=
b2da7d16335d18"

 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-uti=
ls/-/tags"

diff --git a/meta/recipes-graphics/wayland/wayland_1.22.0.bb b/meta/recipes=
-graphics/wayland/wayland_1.22.0.bb
index 6aa76063ea..e940065624 100644
--- a/meta/recipes-graphics/wayland/wayland_1.22.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
@@ -12,12 +12,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db31d8f53b6aa=
f2b4985d7dd7810a70d1 \

 DEPENDS =3D "expat libffi wayland-native"

-SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${P=
V}/downloads/${BPN}-${PV}.tar.xz \
+SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland/-/archive/${PV=
}/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            file://0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch \
            "
-SRC_URI[sha256sum] =3D "1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936eb=
b7e7cbc2425842"
+SRC_URI[sha256sum] =3D "1a681f14071d12c6263a7f7ac44e64ea85f2d39d177e69d035=
4d82860532e6b0"

 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland/-/t=
ags"
 UPSTREAM_CHECK_REGEX =3D "wayland-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
--
2.34.1


--_000_CO6PR11MB5586AA1C6F78F524E6221638CD49ACO6PR11MB5586namp_
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
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Sorry for the trouble. I=92ve confirmed with our IT team that the issue is =
indeed caused by our company=92s network security restrictions. When I=92m =
on a non-corporate network, the older URIs work just fine.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Please go ahead and skip it. Apologies for the inconvenience.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Guocai</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> He, Guocai (CN)<br>
<b>Sent:</b> Monday, July 7, 2025 2:00 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [oe-core][scarthgap][PATCH] wayland: correct the SRC_URIs</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Guocai He &lt;guocai.he.cn@windriver.com&gt;=
<br>
<br>
For wayland, wayland-utils and wayland-protocals, not only<br>
the SRC_URIs are updated, but also the tar.xz are no longer<br>
available. We have replaced them with the tar.bz2 barballs.<br>
<br>
Signed-off-by: Guocai He &lt;guocai.he.cn@windriver.com&gt;<br>
---<br>
The version for master is not the same, so this patch just <br>
for [scarthgap] and I will send another patch for master.<br>
---<br>
&nbsp;meta/recipes-graphics/wayland/wayland-protocols_1.33.bb | 4 ++--<br>
&nbsp;meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb&nbsp;&nbsp;&nbsp=
; | 4 ++--<br>
&nbsp;meta/recipes-graphics/wayland/wayland_1.22.0.bb&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 4 ++--<br>
&nbsp;3 files changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb b/meta=
/recipes-graphics/wayland/wayland-protocols_1.33.bb<br>
index 074ea3663a..2300ae46d1 100644<br>
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb<br>
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb<br>
@@ -9,8 +9,8 @@ LICENSE =3D &quot;MIT&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://COPYING;md5=3Dc7b1=
2b6702da38ca028ace54aae3d484 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://stable/pres=
entation-time/presentation-time.xml;endline=3D26;md5=3D4646cd7d9edc9fa55db9=
41f2d3a7dc53&quot;">
file://stable/presentation-time/presentation-time.xml;endline=3D26;md5=3D46=
46cd7d9edc9fa55db941f2d3a7dc53&quot;</a><br>
&nbsp;<br>
-SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/waylan=
d-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz">http=
s://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downl=
oads/wayland-protocols-${PV}.tar.xz</a>&quot;<br>
-SRC_URI[sha256sum] =3D &quot;94f0c50b090d6e61a03f62048467b19abbe851be4e11a=
e7b36f65f8b98c3963a&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/waylan=
d-protocols/-/archive/${PV}/wayland-protocols-${PV}.tar.bz2">https://gitlab=
.freedesktop.org/wayland/wayland-protocols/-/archive/${PV}/wayland-protocol=
s-${PV}.tar.bz2</a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;622754e38cf70e9e02700e2df22cbd1257e523e0cc220=
04f1ece409719823da5&quot;<br>
&nbsp;<br>
&nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.or=
g/wayland/wayland-protocols/-/tags">https://gitlab.freedesktop.org/wayland/=
wayland-protocols/-/tags</a>&quot;<br>
&nbsp;<br>
diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb b/meta/re=
cipes-graphics/wayland/wayland-utils_1.2.0.bb<br>
index 878c7a267e..4ff113f1e9 100644<br>
--- a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb<br>
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb<br>
@@ -9,8 +9,8 @@ LICENSE =3D &quot;MIT&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://COPYING;md5=3D548a=
66038a77415e1df51118625e832f \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;<br>
-SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/waylan=
d-utils/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz">https://gitlab.free=
desktop.org/wayland/wayland-utils/-/releases/${PV}/downloads/${BPN}-${PV}.t=
ar.xz</a>&quot;<br>
-SRC_URI[sha256sum] =3D &quot;d9278c22554586881802540751bcc42569262bf80cd9a=
c9b0fd12ff4bd09a9e4&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/waylan=
d-utils/-/archive/${PV}/${BPN}-${PV}.tar.bz2">https://gitlab.freedesktop.or=
g/wayland/wayland-utils/-/archive/${PV}/${BPN}-${PV}.tar.bz2</a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f38c6a4ca2113cf716ca687a4cd8e24a11cbeeb047596=
78b7bb2da7d16335d18&quot;<br>
&nbsp;<br>
&nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.or=
g/wayland/wayland-utils/-/tags">https://gitlab.freedesktop.org/wayland/wayl=
and-utils/-/tags</a>&quot;<br>
&nbsp;<br>
diff --git a/meta/recipes-graphics/wayland/wayland_1.22.0.bb b/meta/recipes=
-graphics/wayland/wayland_1.22.0.bb<br>
index 6aa76063ea..e940065624 100644<br>
--- a/meta/recipes-graphics/wayland/wayland_1.22.0.bb<br>
+++ b/meta/recipes-graphics/wayland/wayland_1.22.0.bb<br>
@@ -12,12 +12,12 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://COPY=
ING;md5=3Db31d8f53b6aaf2b4985d7dd7810a70d1 \<br>
&nbsp;<br>
&nbsp;DEPENDS =3D &quot;expat libffi wayland-native&quot;<br>
&nbsp;<br>
-SRC_URI =3D &quot;<a href=3D""></a>https://gitlab.freedesktop.org/wayland/=
wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \<br>
+SRC_URI =3D &quot;<a href=3D""></a>https://gitlab.freedesktop.org/wayland/=
wayland/-/archive/${PV}/${BPN}-${PV}.tar.bz2 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://run-ptest">file://run-ptest</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-build-Fix-strndup-detection-on-MinGW.patch">file://0001-bui=
ld-Fix-strndup-detection-on-MinGW.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch">
file://0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
-SRC_URI[sha256sum] =3D &quot;1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12=
936ebb7e7cbc2425842&quot;<br>
+SRC_URI[sha256sum] =3D &quot;1a681f14071d12c6263a7f7ac44e64ea85f2d39d177e6=
9d0354d82860532e6b0&quot;<br>
&nbsp;<br>
&nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.or=
g/wayland/wayland/-/tags">https://gitlab.freedesktop.org/wayland/wayland/-/=
tags</a>&quot;<br>
&nbsp;UPSTREAM_CHECK_REGEX =3D &quot;wayland-(?P&lt;pver&gt;\d+\.\d+\.(?!9\=
d+)\d+)&quot;<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO6PR11MB5586AA1C6F78F524E6221638CD49ACO6PR11MB5586namp_--

