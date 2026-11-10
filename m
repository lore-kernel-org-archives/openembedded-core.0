Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14349.1794291392935251014
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 22:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pni9MhOQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5774fcad27=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA53YnJ3703171
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 06:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=B0xLGbw/kjHzCiarC3z9V85vUJjHzewY+rI8nR4PC6Y=; b=
	pni9MhOQ13D4Q20Gn98g5fyumyuWIbgcnFf8XHCClYscHkm4WgNh/rGR76PD4Ct7
	FYGk5UBZ4GEeDzXgkf7v1Hl+KcLuktDIBV+j8BGPtMI4ilbgThUV8nrFeK/bEvF7
	L3xc7OOZ5Y9fmrFHjsk5d8lQgZ8ri+lOpCDsgc2gjoL1xdPl5yFbTomIos2AaWdN
	0OMdTu9zXehmxPEvvs3wzDvk3LDAJ3sBXvzOwxTuWnqyCPgufFfmDh8hPLgsvNIS
	7kKogLeUxt+DLn+o6IZ78PkYKZbiVMiwR9dEN0Rtfx7gDOdlUb6w/P7i3xMQxoi0
	lsZ+wlO6ziddKIDyO0h5LQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020087.outbound.protection.outlook.com [52.101.85.87])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hss70nnnt-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 06:16:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4oEDML6E3aTEv4s4BylchMidLH5Nh5UGtG0b2yV4TohCWQZMRxLipbKQky5ZRipqQFF1FKH8cBdIRzQnet0JHeoPqfTRsjZl+8qA2PIVJgDSYw2VLvCEFELtb6zPinHXl6cq0TV4HPAq5yJ0SdWnaRnRDgMXGj/Kj93l/S3ojZc/ZfgfhwKL2qhB6DB0FMPXBvyS7JqWxLtazPURT2ctz5OV3IW6Cf0q+1rR0SNlMv0oUDKHlbMkzh2XKXSZGG4R12ysFVPFORAk2siqynMtAk2DaNYD7g5Js5WY/ke1bPr6Eavm7nG4fHxVywN6e1jrGYHA0dWKiSlPJ4gGzLaDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0xLGbw/kjHzCiarC3z9V85vUJjHzewY+rI8nR4PC6Y=;
 b=GdzqdR+m+MrndBKPciICNO4jHHwLXQ2ETsyqHK0l8Pad16wZx4+rCGzXLyZ/uWw64iSFNkI/VLGboHbldSvJKopcPgDRHQh84objNaySIutQAqJ6I5XdJgjg6IcO361CSFpY9mKHHIUHAyhPoyoEMcnwZIHpHM8J6hwzGsp01VQ8IP9WDD4xOTD+o7T41lKGtYy8On7QpIj/GEkiNbjmxg7uvlfhzhP2P9GW1jxFpbjpIL7oIvRh2r3zhHx+R1HgUAB39sKa/XnwctpMCQcADp9wckqDEiCpsL9nkka9rQejqxW6MiLOqCuYQtFCFpFX+itT1Hldpa5A/MD2oAPsgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 IA4PR11MB9060.namprd11.prod.outlook.com (2603:10b6:208:56d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 06:16:28 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0592.007; Tue, 10 Nov 2026
 06:16:28 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        Randy.MacLeod@windriver.com, sunilkumar.dora@windriver.com,
        raj.khem@gmail.com
Subject: [PATCH 2/3] clang/llvm: Point lit at the target python for the test suite
Date: Mon,  9 Nov 2026 22:16:07 -0800
Message-ID: <20261110061608.4043909-3-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261110061608.4043909-1-sunilkumar.dora@windriver.com>
References: <20261110061608.4043909-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|IA4PR11MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: 90df71b8-45c5-4c53-deaf-08df3ef22801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|23010399003|1800799024|366016|261009223027099003|10067099003|261028144727099003|261022105027099003|261102123227099003|261026121527099003|261026140227099003|261021121427099003|261022075727099003|38350700014|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LcdGTTpSHDsf9C0P6BY4/F4aPhF4/aRqsDjqqwC3wiRtumyUbrCc+DYITNiUugks8VgPqITX+SDRJrsUOpcriyHmki0+tTG7XAjE19K9c+RZoTbPfVPURApNvWQLw3QRmbzUr3KfLmCSjyJtjxdHBdFXfjzqBDeDNN4X4mPGUTv96KwN4KLrAnggruJOUDZRUklJtAjIQYlb5t8JH7jQcou6Hr1rn9npRGaJ9AYzIdeexmtzxbvq5ucqTy9PlqYafXf2vtGE9xg5AKptbkHTEK+NkdrnY4387E9Pkgyu/NmIQHkPuwM73BePUWog5xnNh93WqkI7ZGxW2nvROISzBKAe/DJdveqAnoD9rVOHFIrZ97jQrWJhwfeCPSCnfv2AD0jHi0c1Oyd6FMVaicxeRVwXz6eDwjS5xS/lQm5P+HGxESFAG7BsYCi+VQ5lEUeKYwNSdo1rme8Uzt/ALPygan+d+noSo8OHNwngXY7tJJtsyCuRdxrUPg7Krf1Gq6KxZNCa/eDAxg6G2KM74cQnCk3C+2ksNP2NCY6RdpfqrLTudaE6UIrt6qmtHAsiBvyRVHngUYz+sAvh+lvTTWpLuz1NhmRqb4N9z/Aaqm1TLHlD29zlYoyQt3x3oyqMTen1w4UyhxZGmx1R/Viu/gE0kcLTcIeVWpg3X0nBDyoF4vwOjrDHB41oU7YLeAmRwboac5gkxIFZ7s9ziOQZpjWukYTBOOTAEVw+lBVgDu8D1M4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(1800799024)(366016)(261009223027099003)(10067099003)(261028144727099003)(261022105027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022075727099003)(38350700014)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3aDAzdc+O/RMoyYeerAyaWaTREyfgGBG7OU0u93o/fe9SFE8yYUd6RSV0j0G?=
 =?us-ascii?Q?l2jD9uv+zWWWPcZUqYFcQDLCKgreyPwR6Yiw0Fwac1F3jS3XDu976Nn7T6bJ?=
 =?us-ascii?Q?AVV7sWqoh9VhQSN1a1jxaXXuCE9qsVDEp/yTg12Pn49yB6dU67ZEqC5yh3jB?=
 =?us-ascii?Q?xo9cJSogICdkhNiw2RxhByAkAOY1Gk3BN2AetfIAvtIRVexoQLJkWQ0Lj5re?=
 =?us-ascii?Q?R3qHmhcPD3QvyB4hInjqouHyQo9WzJdiQQ9+eiRZG5fGXjMAFowoGZwz/0j0?=
 =?us-ascii?Q?QCAv+YhvdCDLftzGFbYV212ihrr3lIk/XhbfzxMGg38FT1qPvjOcqR/uK3Wp?=
 =?us-ascii?Q?IaJ7+Fh548K3s7YWfATqx0QzEEAMF7H5EZTDLNm1KHm5R4i1vbOHk+sPjatb?=
 =?us-ascii?Q?SRIyoi6kvTF63uUJWLUvexXaMneCMYjWg10uKNUfs7HWYRBL6y4vRtQ57mBx?=
 =?us-ascii?Q?+8jwm+yYGavwmr6IdTevMf6Zj6FlD0MBjb14qjdpmjS56DVgDmbJ/nSAAYrQ?=
 =?us-ascii?Q?EXusJn3TtOTcyrGVEEZ6D3OBxCtX6j/C8oakGd315ilKIbGlfLUmlgfchowo?=
 =?us-ascii?Q?XjluG5nLgTYfF21/UVbFXJ1EQT8yjfq/XpoMFZP/ojzp+XLbsD2P3g8RX58F?=
 =?us-ascii?Q?MK+7ZD6ULf3tVvB9P09KbXM4k8IKQOZVCcOkX9c+oerQ2cA5j+lS8eh7AQpY?=
 =?us-ascii?Q?VzANZ2AfAVaPg3EFv192wCsE8+pYb83lPILNjimNlz5BXBxm3l8/L95Tr3Yh?=
 =?us-ascii?Q?s+GA1tyxgQvxULoxMYsntTQaWeKRE3OvL2It4eaNr/k4O9xKIXQ1uxZD2CmC?=
 =?us-ascii?Q?Neq8ib+1kBFQWg4Ds32elUbP1WtQjR2urrzmLNd0dmx3aYSG3mwCGoufcSIn?=
 =?us-ascii?Q?YDzufCwRWFsf29mJMGY7AK7jQ06+i86/vMMj8qJEAJR8ndJjjHWYTLyO/dSI?=
 =?us-ascii?Q?PCv9pTXVtaSjLZC1ZwFQ2oCYs0jodMLJnKB5GdndWX7P25bJTQoN47Ox2LBp?=
 =?us-ascii?Q?Zl924X4PAKXll1+o1Wq0R19YpeibXFnkcKQY6eJa9nfXqAwNkuWRWTZ80I0+?=
 =?us-ascii?Q?aHqVWvmjNBykXLtu87VpAE6VXOw+am12Yff0Zdxe00/S/4b9kyLv41Q4xKtT?=
 =?us-ascii?Q?itSUyMGe3xnNU5O56b2i/sH/TyJ1ziaapA35A/v4L9I2bmauAmsNCPgFH92w?=
 =?us-ascii?Q?S4lAJ1Z/wqwSTJqtgBZd1CTrncpPv6PdJB4fLjehynJoaE7i5S0DXCts0e9N?=
 =?us-ascii?Q?dBSFf7d/ugnIRrNxDlbLnsOhLk84pE+0oIuIkYMWF5f6Uw6/BGkR5/v1RC/G?=
 =?us-ascii?Q?wzdADmjwP6xiKgLEqtjip1D9OR9XJZwMl/Pl3XMqRnvO4dUrl1Ik6KKOdpHj?=
 =?us-ascii?Q?4Ofk7+uDP0UclqglxjLTin4O9Dgr5RS1bt3fKF19tbjV209+tDxIRorJzA3T?=
 =?us-ascii?Q?Oc0gGZ9BPDjf909CUxWm9l6jUD+a5PLExWhO9DSkxpvlueWYUDkciA6MeBgV?=
 =?us-ascii?Q?OXGa+13DXlFYU5TLmqOeEsGLjxCZDeocdMH8pSp8B3GZDTppE+Y/NPHGPTfR?=
 =?us-ascii?Q?bDHK8Ezh9tU/0wHUpz7RCWoyGEyNzrc+K+a2o+6EBDoK+ZMK0MfNWTv/11j6?=
 =?us-ascii?Q?2hkYztsfXEzsBUFyZuw30WRdI3YlbHDAYYXYDEy5Gocs5MSB2ldc5Ux1Z12O?=
 =?us-ascii?Q?vurGdxWAamPR1cmomzslRHlF0KDG908hcx0A/l9kRzfUSnStzMx4Zg1QBhbQ?=
 =?us-ascii?Q?X6dJPjTl/DlNnM8D1Dkw8h7pbiPUq64=3D?=
X-Exchange-RoutingPolicyChecked: kK8gJnWinHFXw7FmEWKDmd20xivmu712sXgoJzi9mFlkckQz+qXQwaQnRpsrPpi4H3WkSEN6EXemAei2cL7fPSiyM9QB+/n+DG37WR+rC+/mXcBZOcOyKbMYHUjKLmdVLRyEF+jF17KWvzBqsRp0MYCj8LNfDhag0d+MZF9E0fZOL6+CYlf/aZsxlvo+gb7sbl476Pt9nzQhuNOx8jXQDclRgFJeD5yhZEP7he1oI5PVJQnix5IIqlPyVX9czyKCRb2ZVE0S1TmJFjmragcR+NokIHJRmvn64rZtUU69jmLAyOEVO/CKxae9blQoXnaDqYypXhS23XAy/5bzojW1JQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90df71b8-45c5-4c53-deaf-08df3ef22801
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 06:16:28.5538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epQnuzKRrc5IhyKmR6aJ8DKYiM5jc/JxqebJkg9r/E6OVMMA4j3dl97ycBzsR8PyZTst3cTF12A7zBbH3zrjW4n1VK7WW2s7QFtPPy2+HdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9060
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=fvlJ914f c=1 sm=1 tr=0 ts=6af2b6bf cx=c_pps
 a=R61xy7Sxgg6fOHg0EL+J9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=cE7lhHPv_q89zpGTmAsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNCBTYWx0ZWRfX6s4RXU6NEM09
 XCTmfFOt6UL/WNtR4vQQyyFnLVFRcNsB8UlReR93Dnt/8oyIBHYb7cOeopx2MByasVElnBiTQ5j
 Gt9+3oA25SoHgjyJroWyPsP+BohiAjNOK1YKQGucCHbcJ5zu7B2jlwMBC0hCec573GNz9X0xCl+
 SutIbt/JcGh8wznWGvpMRLI4tKkmmx5jjOD/GW3Hd9P1TN7RFTjPbN9i7n4aPAo7DT4hPqKIXhJ
 jIUbg33YYR6wPECDocgHnNIPEA67Kn5rrdarYVVuc4hAEi9Jup9ZogQpetnvhfE696EGCKMWzfl
 D5EJiNa/jroNFcsujYd6KnEF1Rkc2SGEK02DTgqnN3jOqc2pSnQC4/dIHLqH0XVjx55uYgx9aZg
 HKg704cp2hY3mr0/ZPP0s1TmtosCRXOemE9DmSQTcTo5LF6WeDo1SPMv1pb0N3ozfbTnZtaLIVh
 YSD1ghZvdDbVy6ZYO1w==
X-Proofpoint-ORIG-GUID: lDsJlzfakSGgitAcdI1JtmlnKKfp4dyE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNCBTYWx0ZWRfX6I6WMalIQ2rv
 ElOF948Qz8a01w/7Rd8S+ILnEAOcP/SpyO1af7pfJ2IbqCk93mwaQMTCdCKwZa4DJAmdEzfBzti
 paczkh19+9ogxcT8/qB34LWkZnyonpOkExFoEpOGRmdtKbQNhw13
X-Proofpoint-GUID: 1ma2dIyy-KITWmhMtXB4s9gFNldavP8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 06:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249903
Content-Type: text/plain; charset="utf-8"

From: Sunil Dora <sunilkumar.dora@windriver.com>

lit.site.cfg.py records the python cmake found on the build host, but
the test suite runs on the target. Any test calling that python directly
fails there. In llvm the extract_symbols tests, new in 23.1.4, do this
and fail on all the -tc builders. In clang, %deps-to-rsp,
%scan-deps-filter, %hmaptool and %check_analyzer_fixit are built the
same way, which is why the ClangScanDeps tests got excluded in
0e7f898dc4.

Rewrite the recorded path after configure in both recipes. Changing
Python3_EXECUTABLE itself is not an option, cmake.bbclass needs it for
the build.

The extract_symbols config is being changed upstream to use the python
running lit, https://github.com/llvm/llvm-project/pull/240530. That
covers only those two tests though, the clang substitutions and the
other llvm ones still use the configured python, so this is done in the
recipes for all of them rather than by carrying the upstream patch.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 12 ++++++++++++
 meta/recipes-devtools/clang/llvm_git.bb  |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 90076f9d6d..6c149945fd 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -100,6 +100,18 @@ do_configure:prepend() {
   ln -srf ${S}/clang-tools-extra ${S}/clang/tools/extra
 }
 
+# The tests run on the target, so lit must use the target python.
+clang_lit_target_python() {
+    sed -i 's|^config.python_executable = .*|config.python_executable = "${bindir}/python3"|' \
+        ${B}/test/lit.site.cfg.py
+}
+
+do_configure:append:class-target() {
+    if [ "${CLANG_ENABLE_TESTSUITE}" = "1" ]; then
+        clang_lit_target_python
+    fi
+}
+
 do_install:append() {
     oe_multilib_header clang/Config/config.h
 }
diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/clang/llvm_git.bb
index bec7e93eab..a61ddcb7ef 100644
--- a/meta/recipes-devtools/clang/llvm_git.bb
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -105,8 +105,17 @@ reproducible_build_variables() {
         ${B}/tools/llvm-config/BuildVariables.inc
 }
 
+# The tests run on the target, so lit must use the target python.
+llvm_lit_target_python() {
+    sed -i 's|^config.python_executable = .*|config.python_executable = "${bindir}/python3"|' \
+        ${B}/test/lit.site.cfg.py
+}
+
 do_configure:append:class-target() {
     reproducible_build_variables
+    if [ "${CLANG_ENABLE_TESTSUITE}" = "1" ]; then
+        llvm_lit_target_python
+    fi
 }
 do_configure:append:class-nativesdk() {
     reproducible_build_variables
-- 
2.49.0

