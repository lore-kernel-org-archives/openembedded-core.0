Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8579.1795672674807368797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 21:57:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Lc1ivhTV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5790664bd9=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ3Cx1f1849502
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 21:57:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=YE+guAgC2
	1VTyD3AMgCfHRg3ZsulW9GdyG88Wi2OGXE=; b=Lc1ivhTVepoGFRJCHm3xajHwT
	BS9ukfowUnAJgTk0tOibpsGRECJzAsbKAn59uaB6+bIcX/cJEbDI5yWZhmU1kz4v
	1tgqM7buXzi/GD7qjcXuvqyJaEmOAv2y/eMBte/uDJLWYFDMfyNrYnVNfDqCIcvB
	oVmZEnu5KvbOwr3ubqlicYtsGCXn5h4B08YPqIyNmrT+QLLog8lNWZ0IANeN5+18
	hp3JyFu2uqlzOWsV6n/I6F34LEmDArgEDJckCf8NDuLqiwuVgptMG8Zg5smw9dPs
	iXI1I4CmNX5foJ4BCV64cqqlcC/42IiKfcbp2haHLETIMlqf8t8Oivjth/Jwg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023095.outbound.protection.outlook.com [40.93.201.95])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j516wwqv9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 21:57:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3n6+Xa5JsnRxNj+qRsZBv4g+31JoIN/OXKeA1LFpxmSwsLtdCcdD+7iCwiyWSHhs46lsoCEfCx9w7g70Bh1sI+9yQgT1DV6WdeOhu70v8eD2e1QzNVObewNdk9NKpQy/BIl+eGV2hnpUlOs0ONm7+aKJPWsskHClEGlo3zOXvCIy93wJhjSAkZZ6sbF945KHH9i8vBmYJtc9+oatXr6Urbv3EW63uFu9bp0AYGVyL8a5RSHno2AlZO5E55iLq08mtptqDqPhcGddqA/dQkYNwVgoScEu+BzW0GdjTtpY2k+z3Vi9KKh+Z8KUAcn92AnI7FHfXHE2XAiX0Wiuje3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YE+guAgC21VTyD3AMgCfHRg3ZsulW9GdyG88Wi2OGXE=;
 b=RuRiVRuBCKDad7QlhlX1bUHZMxoCrhWYZlNNHgVzT0UGny/G3XQLLTs1kqXoVWCHxtDdYPAH/jNT1sMpQBsoQAq6pXXc+i7ciE5tiqPy95HdaZltDIgahl801XEUJdMzgATJtt0Cbj4mURxNi15uJJv0O7xSPSLRe0YFxIkN/0UwW4eOGNXRIgGQnCSu+z8FDNXE7brtSXy8r0SUPIEe05V3AFWQh3R9quTdvWYdXrroqpWKMkQkW/X4HVtSuWfPr/Z7N+IDB4anhoxdXrs84IRAaRolhch8Y/qDvhk0//G7C+wTSQ+21FcK/zVAdGOU0IPvMKy4HVHRqFFpcX6LUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from CH3SPRMB0031.namprd11.prod.outlook.com (2603:10b6:610:14d::10)
 by IA4PR11MB629737.namprd11.prod.outlook.com (2603:10b6:207:12b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 05:57:51 +0000
Received: from CH3SPRMB0031.namprd11.prod.outlook.com
 ([fe80::edd3:84b0:a509:60df]) by CH3SPRMB0031.namprd11.prod.outlook.com
 ([fe80::edd3:84b0:a509:60df%6]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 05:57:51 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sunilkumar.Dora@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] cargo-c: upgrade 0.10.26 -> 0.10.28
Date: Wed, 25 Nov 2026 21:57:32 -0800
Message-ID: <20261126055732.1735494-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::6) To CH3SPRMB0031.namprd11.prod.outlook.com
 (2603:10b6:610:14d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3SPRMB0031:EE_|IA4PR11MB629737:EE_
X-MS-Office365-Filtering-Correlation-Id: a63dd61a-ce60-49f7-fca2-08df4b823473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|1800799024|23010399003|38350700014|10067099003|56012099006|5023799004|11063799006|260925022911599003|260925021911599003|260925021311599003|261026130827099003|261026140227099003|261026121527099003|261026135527099003|261022115727099003|261028144727099003|261022113327099003|261021135927099003|261021133027099003|261021130227099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261102130727099003|261102123227099003|261009223327099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: jg77pF6I9ldteZF4l4XhkN5MVqkTxnlS4LUhiVU9egK2GPE3z2QDBS3QNDDm/zF0HleMxopqvtfDB5OB2PrnwS07Os8D1E2f/jb+CE2twlU7TBvAsEdkBfSt6e0Ztl+b/AzvFo5hYPk9Cst7MvGQ3iN8Rx0rdwf14N3kTbIma62CoOIfGBnAuuUpCA264RN56KGhtok9+SSW7ynmFnduLXwey5SUolKV4WSaQHorr3iqzyV4YjlM5lynhF63mTzpP8k9XYleg2asc/3/egN1gpvln17082DqyJjxGXaL0qlBahaCVs9GOOiTqhJ9YKLpcULa/OpqUTW9H5F2Ikh25lCDFmGvS49OYdlw7aHGYKZbh9/MCAWTygbxR2/fL+urpu7hsPSov2catjN2h5b/fIxRBm8n7tYsWGqHHQnUGHbsubMrhGlQC5f9uQpiwVjPX/tFVjkM6BFlh+Sz8jEl7kRhdYTjFy5kBpaDNwjkaPTr5/YJK93C9uSCoU3U2Qp2HfRKq0v72PxX3rQRUiimOfJUU6Q9HXcVAT/U0hkNP30j7jhnBmg5f42RT2Q4wr5jcQmFYXOuPY5GTtvQIeQHPI0LhrzMKFEnVduoPgzCOCLtMwYpf+poHGUBEWCuVNctvoLFMbPEC93Yu8XU22WP6JOXHIl0p/45rKNNxKlJcJ5U0gH4m5Rnh6ChmYCAiKndbuGwros2RY3zZixXDH8uqymNrsmFYx80NweK8/70POw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3SPRMB0031.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(23010399003)(38350700014)(10067099003)(56012099006)(5023799004)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(261026130827099003)(261026140227099003)(261026121527099003)(261026135527099003)(261022115727099003)(261028144727099003)(261022113327099003)(261021135927099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261102130727099003)(261102123227099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K2k+UaCkEJlv/Of6kHoqZuv3SfwIn0W462Iivbv+RuGgkKhHZf+7l2ifvNr4?=
 =?us-ascii?Q?h7OZXa4c6eEjE0myKT+0mB7YZLq44UjB5XTIHsx6P85Aj3PfdGJ8tRBVWWsW?=
 =?us-ascii?Q?/zGU6fIw4sNVh9GscxwYEsyWMI7lkothshpQJ7kM1YkxtXzTjmMKl/KHitDO?=
 =?us-ascii?Q?B4L2xg4RmN5louPxzzJ6FLp9J5mbYsvDD5wsSG6OmYh/EhqL/pX9mwsp6Ozt?=
 =?us-ascii?Q?+PQaUy4chjalFPP+KI5lJ7TN2A6Z6F3qNC9rBvEIqyX8odvWvQVPJrTFlZ+r?=
 =?us-ascii?Q?InCZtHzkKddyHyunoYXM2sGLwDMs3h3lBK7eQXGwEhrkaVvgYppE3WDBk8ju?=
 =?us-ascii?Q?xjW7N3QYcB3lRk1hqYhamtlgR8Fa89mIh5sHeXDRDnTFlRmdUX/aeyxSFn73?=
 =?us-ascii?Q?L6fyOb9aJ9Un/t1kR/9XcIlVjvx2nk3q53JMcNb0Zs3L/97mmUg6R/LT5TKm?=
 =?us-ascii?Q?Nj2XwTf0LhuI+9V24r2MTKXmhkmFq6m39PrNwGoqbetz82/6BkCfZzKeWMct?=
 =?us-ascii?Q?Ft0F2/H2Wh2it//lGtcuEUROGcQusIKch+MUsB4glmZqaFHjdPvsPMWp6xzM?=
 =?us-ascii?Q?4Ph3cm9QCEuDaOB+p7vlSjY+C4tTF5fvk9/DeVMQvIeI2wJCjbyCL3JzUYnb?=
 =?us-ascii?Q?RHudFovrQxe0LJ42xMGGUDWAY8YiMsENXgU6N89YZqU55SDoX8fiwvcudWLI?=
 =?us-ascii?Q?sQ2+79ZKtCtZfjBjuiUphtgXw69M6ZNHKcCWG6L7CRA4hJwAhUO8GEf+7tp8?=
 =?us-ascii?Q?JQ330BDEYjbb01/wdniaFPsRk4bJjL86wcpiaANGpd2CMFEBhDdDgcjOxOmT?=
 =?us-ascii?Q?Lx8JuEnujcxoYpRmCn5BDPiDKDZgBIAXfK0wK/hc0vI8KL9N0S1ieVDoUzRX?=
 =?us-ascii?Q?uAYy2kFcoPMeppjtP0eExDwOVl9cPXl+9qqh8PHDjm/RhnYSRJdhUVPwCn+B?=
 =?us-ascii?Q?WJz4yDs3wXkvhTn/jskYKwGtm3HGd44XmetH+nWxov3JcjWSyZ/VllHCLU7h?=
 =?us-ascii?Q?KdJnPN3VFXwY0NX4h7c9BcTsfFFEkBrI5AHMwgqKsLU6F6EN2IGc29hAzuFl?=
 =?us-ascii?Q?wDKGvcHOeLArMFwcvRcr/8yC8MHwkYOeVVISBVWfzdzJ22DU3f7nr+n7YVJc?=
 =?us-ascii?Q?2WJqHlsASJHq2g2czF7pYZBOpDfo/J/9DXYfA4LL03mi3ZAa7pd5hzRmwkmM?=
 =?us-ascii?Q?SsVE+ngtP+rdIvEGqg7MM6FvIeGkdDhiBcc91+PBMrorEmpOBPufS562QZkk?=
 =?us-ascii?Q?O2UT8KNh9uUImooBycLnLCsZZsUDFghvuIyFenN+ZFq006d0ictf8tc2S3PH?=
 =?us-ascii?Q?tdJLD7a+w6NMXqJ8qu1iD0yM7ScW2wD4JBqlifSMS+blkVBs4tVy+OgbPKqe?=
 =?us-ascii?Q?Y7rKAyO0uKpTLkwlbTnbNt6U9iBOvEVv07Vldp+FHu/YFVqfhTQfOGJyru1e?=
 =?us-ascii?Q?2+kqlcHTPhB/xH0eIKDgqfgHOYWaEvs+uRlfWtDJeNIXm9edj/aFZSkFYY0E?=
 =?us-ascii?Q?oYBdigmG/maJztf2IXmolThj8uK1auCdYp00jWsUAi0kRHT72Uz0zN4N1Mun?=
 =?us-ascii?Q?x3faXm1P2lUO69IWWBpM3oKxi7YOFH5QB8PC0f/xm9+/OXjV6bXhsVBXC2EO?=
 =?us-ascii?Q?cLw79MV+hv54zAwoB8k9PzDB/XkMeQzCRffzlGW2P/n9Wy341aNXf1rmkGr4?=
 =?us-ascii?Q?SDgMAnp6N7nHEDItZmYJre1jQAl/zrDNJlPA/6ArRLiuL+f15o3UTaxjH1hg?=
 =?us-ascii?Q?XgMuphN3Sq21kQmZYoPthrsm1lxqaDW4lj14XijTd2Fd5e9HqwOa?=
X-Exchange-RoutingPolicyChecked: NlO92GGPYQSfp6rXTXZZeQV5jlkdZ4hxyiZfFnoEsIfOKmzGXezUebehByP0Qoxto/rx1XvZWPiSWu7wS4wV6EIHsZHPLOP8pXGTImIvGX50HKWTit5RAOiTDqm2lsBuyNY9CjrTPUXmT507MwM8X6hE75LT/oH/bvgnhFPaLulV59GAmS4+Cz+AwXIgnBaO9qnL9oev0fIjvyO/WptcB/BZLYfd46M+KU2gahThm+rS3szFElPmHb3YTWWlavhIZfZw9fZB6ze2T3UcL4XtwQpJ9BhW+8EaSUMbpsJDF+/EIMjxUuybJzePzdER953SmaDDyGr+u59zd+rkwqq2TA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a63dd61a-ce60-49f7-fca2-08df4b823473
X-MS-Exchange-CrossTenant-AuthSource: CH3SPRMB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 05:57:51.0543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLID4e/yiDSVPy1kzFGoou8DMAjGW2R9ah1kZBOy/lA4N2Ads1uQKqv8NhT40/qQRdDolZnPmwOtUNSwvBjZzGsAOSlvkBgeWXuL3khHz4mfX+Poa7jXJWj4yfqjO5AS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB629737
X-Proofpoint-ORIG-GUID: 8EM7xNf1YhbvE6hK10omTyuQW-zHqd6o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMiBTYWx0ZWRfX9+JKBJ4HbBhy
 EQrD+Y125NR16s56gwoMJZHK8jYlThMa+O4dIQiF3xq7cTZSRaLdVH5Qu9ivTdDy+5O6czEXLQJ
 mX/kh5i4S7pYmt6Txr2itb/QkLBBXQ/+uLDickDjmPQTNhbHHG//
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMiBTYWx0ZWRfXyBPj/P5hAZud
 gY56+pUtMj4kMT8iqq61dWZarp2zGhZqKlr2ljgX7DBG0YUaxR5TZ2ERRl3R+8ZnfsCEqjLxnvB
 a/vTdK/qXrk1jN+O3rE1wRcJSG+d6QNj+VsfdriRPN01IIRVlOqH/DJlxGrJo+LLw5vhbZrF3yl
 jhRcdvrwoVDP+1By0ykxaTm4nflYiOrJyY2XP7N7Nv/YnsaShV4QEG4VSxUpTtRBfC4wS0ulBgm
 yVOskJlYA8Ei5kUTw4QZtRYcZrdIo0IgPt0jYXqiBzbCs7z9SHmACVY9a8mLQX2RbULT98jL+YZ
 sp68WRGjNOzidp0h7xpgNFQ8UB2+jhhgZzJYtkog3pXGLVKPO8kxZ6mI86SuY4CRtQ5Ry3kWbSt
 eI/qlsqtuV4aGbzGJj5f+Ze3p+B0rPrFNgCYpcTgjlAQnp1vmwQGZhofgBYO2cjj7sMzN+5OGRd
 d3z2KBQbhJK9lnlhYfw==
X-Authority-Analysis: v=2.4 cv=bofZl0ai c=1 sm=1 tr=0 ts=6b07ca62 cx=c_pps
 a=ughbxRIXrQd+RLe3kEOXVA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=s6FN-gMcJaUwAEJaXLcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 8EM7xNf1YhbvE6hK10omTyuQW-zHqd6o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 05:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251279
Content-Type: text/plain; charset="utf-8"

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Update cargo-c from 0.10.26+cargo-0.100.0 to 0.10.28+cargo-0.101.0

The embedded cargo library is updated from 0.100.0 to 0.101.0

Notable upstream changes:
- Deploy the Rust stdlib when prefer-dynamic is enabled, detected from
  the effective rustflags, and export it in the .pc file. A new
  --prefer-dynamic option overrides the detection.
- Bump object to 0.41.
- Fix the example install on sudo-rs and give Cygwin proc-macro DLLs a
  unique image base (CI/docs only).

Notable dependency changes:
- cargo: 0.100.0 -> 0.101.0
- crates-io: 0.41.2 -> 0.41.3
- cargo-util: 0.2.32 -> 0.2.33
- cargo-util-schemas: 0.14.3 -> 0.15.0
- cargo-util-terminal: 0.1.2 -> 0.1.3
- cargo-credential-libsecret/macos-keychain/wincred: 0.5.10 -> 0.5.11 /
  0.4.25 -> 0.4.26 / 0.4.25 -> 0.4.26
- cc: 1.7.0 -> 1.11.3
- clap: 4.6.7 -> 4.6.9 (and clap_complete/clap_derive/clap_lex)
- toml: 1.1.8 -> 1.2.2 (and toml_edit/toml_parser/toml_writer/
  toml_datetime)
- jiff: 0.2.38 -> 0.2.46 (and jiff-core/jiff-static/jiff-tzdb)
- wasm-bindgen: 0.2.129 -> 0.2.130 (and macro/macro-support/shared
  sub-crates)
- icu_*: 2.3.0 -> 2.4.0
- rustix: 1.1.5 -> 1.1.6
- libc: 0.2.190 -> 0.2.191
- serde_json: 1.0.152 -> 1.0.154
- openssl: 0.10.81 -> 0.10.82, openssl-sys: 0.9.117 -> 0.9.118
- sha2: 0.11.0 -> 0.11.1

Removed crates (27): base16ct, base64ct, crypto-bigint, ct-codecs, der,
ecdsa, ed25519-compact, elliptic-curve, ff, fiat-crypto, getrandom 0.2.17,
group, hkdf, hmac, orion, p384, pasetors, pem-rfc7468, pkcs8, primeorder,
rfc6979, sec1, signature, spki, subtle, wasi 0.11.1 and zeroize.

Added crates (2): base64 0.23.1 and utf_types 1.0.0.

The parking_lot_core riscv32 patch is retained as the crate remains at
version 0.9.12.

Assisted-by: Kiro CLI 2.27.1 (AI assistant)
Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../cargo-c/cargo-c-crates.inc                | 450 ++++++++----------
 ....0.bb => cargo-c_0.10.28+cargo-0.101.0.bb} |   2 +-
 2 files changed, 199 insertions(+), 253 deletions(-)
 rename meta/recipes-devtools/cargo-c/{cargo-c_0.10.26+cargo-0.100.0.bb => cargo-c_0.10.28+cargo-0.101.0.bb} (87%)

diff --git a/meta/recipes-devtools/cargo-c/cargo-c-crates.inc b/meta/recipes-devtools/cargo-c/cargo-c-crates.inc
index da5994a9e8..b12786268d 100644
--- a/meta/recipes-devtools/cargo-c/cargo-c-crates.inc
+++ b/meta/recipes-devtools/cargo-c/cargo-c-crates.inc
@@ -5,23 +5,22 @@ SRC_URI += " \
     crate://crates.io/aho-corasick/1.1.5 \
     crate://crates.io/allocator-api2/0.2.21 \
     crate://crates.io/android_system_properties/0.1.6 \
-    crate://crates.io/annotate-snippets/0.12.16 \
+    crate://crates.io/annotate-snippets/0.12.18 \
     crate://crates.io/anstream/1.0.0 \
     crate://crates.io/anstyle/1.0.14 \
     crate://crates.io/anstyle-hyperlink/1.0.2 \
     crate://crates.io/anstyle-parse/1.0.0 \
-    crate://crates.io/anstyle-progress/0.1.4 \
+    crate://crates.io/anstyle-progress/0.1.6 \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
-    crate://crates.io/anyhow/1.0.104 \
-    crate://crates.io/ar_archive_writer/0.5.3 \
-    crate://crates.io/arc-swap/1.9.2 \
+    crate://crates.io/anyhow/1.0.105 \
+    crate://crates.io/ar_archive_writer/0.5.5 \
+    crate://crates.io/arc-swap/1.9.5 \
     crate://crates.io/arrayvec/0.7.8 \
     crate://crates.io/async-trait/0.1.92 \
     crate://crates.io/autocfg/1.5.1 \
-    crate://crates.io/base16ct/0.2.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/base64ct/1.8.3 \
+    crate://crates.io/base64/0.23.1 \
     crate://crates.io/bitflags/1.3.2 \
     crate://crates.io/bitflags/2.13.2 \
     crate://crates.io/bitmaps/2.1.0 \
@@ -29,90 +28,81 @@ SRC_URI += " \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/block-buffer/0.12.1 \
     crate://crates.io/block2/0.6.2 \
-    crate://crates.io/bstr/1.13.1 \
-    crate://crates.io/bumpalo/3.20.3 \
+    crate://crates.io/bstr/1.14.0 \
+    crate://crates.io/bumpalo/3.20.4 \
     crate://crates.io/byteorder/1.5.0 \
-    crate://crates.io/bytes/1.12.1 \
+    crate://crates.io/bytes/1.12.2 \
     crate://crates.io/camino/1.2.6 \
-    crate://crates.io/cargo/0.100.0 \
+    crate://crates.io/cargo/0.101.0 \
     crate://crates.io/cargo-credential/0.4.11 \
-    crate://crates.io/cargo-credential-libsecret/0.5.10 \
-    crate://crates.io/cargo-credential-macos-keychain/0.4.25 \
-    crate://crates.io/cargo-credential-wincred/0.4.25 \
+    crate://crates.io/cargo-credential-libsecret/0.5.11 \
+    crate://crates.io/cargo-credential-macos-keychain/0.4.26 \
+    crate://crates.io/cargo-credential-wincred/0.4.26 \
     crate://crates.io/cargo-platform/0.3.3 \
-    crate://crates.io/cargo-util/0.2.32 \
-    crate://crates.io/cargo-util-schemas/0.14.3 \
-    crate://crates.io/cargo-util-terminal/0.1.2 \
+    crate://crates.io/cargo-util/0.2.33 \
+    crate://crates.io/cargo-util-schemas/0.15.0 \
+    crate://crates.io/cargo-util-terminal/0.1.3 \
     crate://crates.io/cbindgen/0.29.4 \
-    crate://crates.io/cc/1.7.0 \
+    crate://crates.io/cc/1.11.3 \
     crate://crates.io/cfg-if/1.0.5 \
     crate://crates.io/cfg_aliases/0.2.2 \
     crate://crates.io/chacha20/0.10.2 \
-    crate://crates.io/clap/4.6.7 \
+    crate://crates.io/clap/4.6.9 \
     crate://crates.io/clap_builder/4.6.7 \
-    crate://crates.io/clap_complete/4.6.11 \
-    crate://crates.io/clap_derive/4.6.7 \
-    crate://crates.io/clap_lex/1.1.1 \
+    crate://crates.io/clap_complete/4.6.12 \
+    crate://crates.io/clap_derive/4.6.9 \
+    crate://crates.io/clap_lex/1.1.2 \
     crate://crates.io/clru/0.6.3 \
     crate://crates.io/cmov/0.5.4 \
     crate://crates.io/color-print/0.3.7 \
     crate://crates.io/color-print-proc-macro/0.3.7 \
     crate://crates.io/colorchoice/1.0.5 \
-    crate://crates.io/const-oid/0.9.6 \
-    crate://crates.io/const-oid/0.10.2 \
+    crate://crates.io/const-oid/0.10.3 \
     crate://crates.io/constant_time_eq/0.4.2 \
     crate://crates.io/core-foundation/0.10.1 \
     crate://crates.io/core-foundation-sys/0.8.7 \
     crate://crates.io/core_detect/1.0.0 \
     crate://crates.io/cpufeatures/0.2.17 \
     crate://crates.io/cpufeatures/0.3.1 \
-    crate://crates.io/crates-io/0.41.2 \
-    crate://crates.io/crc32fast/1.5.2 \
+    crate://crates.io/crates-io/0.41.3 \
+    crate://crates.io/crc32fast/1.5.5 \
     crate://crates.io/crossbeam-channel/0.5.17 \
     crate://crates.io/crossbeam-deque/0.8.8 \
     crate://crates.io/crossbeam-epoch/0.9.21 \
     crate://crates.io/crossbeam-utils/0.8.23 \
-    crate://crates.io/crypto-bigint/0.5.5 \
-    crate://crates.io/crypto-common/0.1.6 \
+    crate://crates.io/crypto-common/0.1.7 \
     crate://crates.io/crypto-common/0.2.2 \
-    crate://crates.io/ct-codecs/1.1.8 \
-    crate://crates.io/ctutils/0.4.3 \
+    crate://crates.io/ctutils/0.4.8 \
     crate://crates.io/curl/0.4.51 \
     crate://crates.io/curl-sys/0.4.91+curl-8.22.0 \
     crate://crates.io/dashmap/6.2.1 \
-    crate://crates.io/defmt/0.3.100 \
-    crate://crates.io/defmt/1.1.1 \
-    crate://crates.io/defmt-macros/1.1.1 \
-    crate://crates.io/defmt-parser/1.0.0 \
-    crate://crates.io/der/0.7.10 \
-    crate://crates.io/deranged/0.5.8 \
+    crate://crates.io/defmt/0.3.101 \
+    crate://crates.io/defmt/1.2.0 \
+    crate://crates.io/defmt-macros/1.2.0 \
+    crate://crates.io/defmt-parser/1.1.0 \
+    crate://crates.io/deranged/0.5.9 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/digest/0.11.3 \
     crate://crates.io/dispatch2/0.3.1 \
     crate://crates.io/displaydoc/0.2.7 \
     crate://crates.io/dunce/1.0.5 \
-    crate://crates.io/ecdsa/0.16.9 \
-    crate://crates.io/ed25519-compact/2.6.0 \
     crate://crates.io/either/1.19.0 \
-    crate://crates.io/elliptic-curve/0.13.8 \
-    crate://crates.io/encoding_rs/0.8.42 \
-    crate://crates.io/equivalent/1.0.2 \
-    crate://crates.io/erased-serde/0.4.10 \
-    crate://crates.io/errno/0.3.14 \
+    crate://crates.io/encoding_rs/0.8.44 \
+    crate://crates.io/equivalent/1.0.3 \
+    crate://crates.io/erased-serde/0.4.11 \
+    crate://crates.io/errno/0.3.15 \
     crate://crates.io/fallible-iterator/0.3.0 \
     crate://crates.io/fallible-streaming-iterator/0.1.9 \
     crate://crates.io/faster-hex/0.10.1 \
     crate://crates.io/fastrand/2.5.0 \
-    crate://crates.io/ff/0.13.1 \
-    crate://crates.io/fiat-crypto/0.3.0 \
-    crate://crates.io/filetime/0.2.29 \
-    crate://crates.io/find-msvc-tools/0.1.14 \
-    crate://crates.io/flate2/1.1.10 \
+    crate://crates.io/filetime/0.2.30 \
+    crate://crates.io/find-msvc-tools/0.1.15 \
+    crate://crates.io/flate2/1.1.11 \
     crate://crates.io/fnv/1.0.7 \
     crate://crates.io/foldhash/0.2.0 \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
-    crate://crates.io/form_urlencoded/1.2.2 \
+    crate://crates.io/form_urlencoded/1.2.3 \
     crate://crates.io/futures/0.3.34 \
     crate://crates.io/futures-channel/0.3.34 \
     crate://crates.io/futures-core/0.3.34 \
@@ -123,8 +113,7 @@ SRC_URI += " \
     crate://crates.io/futures-task/0.3.34 \
     crate://crates.io/futures-timer/3.0.4 \
     crate://crates.io/futures-util/0.3.34 \
-    crate://crates.io/generic-array/0.14.9 \
-    crate://crates.io/getrandom/0.2.17 \
+    crate://crates.io/generic-array/0.14.7 \
     crate://crates.io/getrandom/0.4.3 \
     crate://crates.io/git2/0.21.0 \
     crate://crates.io/git2-curl/0.22.0 \
@@ -181,69 +170,66 @@ SRC_URI += " \
     crate://crates.io/gix-worktree/0.54.0 \
     crate://crates.io/gix-worktree-stream/0.34.0 \
     crate://crates.io/glob/0.3.4 \
-    crate://crates.io/globset/0.4.20 \
-    crate://crates.io/group/0.13.0 \
+    crate://crates.io/globset/0.4.22 \
     crate://crates.io/hash32/0.3.1 \
     crate://crates.io/hashbrown/0.14.5 \
     crate://crates.io/hashbrown/0.16.1 \
-    crate://crates.io/hashbrown/0.17.1 \
+    crate://crates.io/hashbrown/0.17.2 \
     crate://crates.io/hashlink/0.12.2 \
     crate://crates.io/heapless/0.8.0 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/hex/0.4.3 \
-    crate://crates.io/hkdf/0.12.4 \
-    crate://crates.io/hmac/0.12.1 \
     crate://crates.io/hmac/0.13.0 \
     crate://crates.io/home/0.5.12 \
     crate://crates.io/http/1.5.0 \
     crate://crates.io/http-auth/0.1.10 \
     crate://crates.io/hybrid-array/0.4.15 \
-    crate://crates.io/icu_collections/2.3.0 \
-    crate://crates.io/icu_locale_core/2.3.0 \
-    crate://crates.io/icu_normalizer/2.3.0 \
-    crate://crates.io/icu_normalizer_data/2.3.0 \
-    crate://crates.io/icu_properties/2.3.0 \
-    crate://crates.io/icu_properties_data/2.3.0 \
-    crate://crates.io/icu_provider/2.3.1 \
+    crate://crates.io/icu_collections/2.4.0 \
+    crate://crates.io/icu_locale_core/2.4.0 \
+    crate://crates.io/icu_normalizer/2.4.0 \
+    crate://crates.io/icu_normalizer_data/2.4.0 \
+    crate://crates.io/icu_properties/2.4.0 \
+    crate://crates.io/icu_properties_data/2.4.0 \
+    crate://crates.io/icu_provider/2.4.0 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.2 \
-    crate://crates.io/ignore/0.4.33 \
+    crate://crates.io/ignore/0.4.35 \
     crate://crates.io/im-rc/15.1.0 \
     crate://crates.io/implib/0.6.0 \
     crate://crates.io/indexmap/2.14.2 \
     crate://crates.io/is_executable/1.0.6 \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.15.0 \
-    crate://crates.io/itoa/1.0.18 \
-    crate://crates.io/jiff/0.2.38 \
-    crate://crates.io/jiff-core/0.1.1 \
-    crate://crates.io/jiff-static/0.2.38 \
-    crate://crates.io/jiff-tzdb/0.1.9 \
+    crate://crates.io/itoa/1.0.19 \
+    crate://crates.io/jiff/0.2.46 \
+    crate://crates.io/jiff-core/0.1.8 \
+    crate://crates.io/jiff-static/0.2.46 \
+    crate://crates.io/jiff-tzdb/0.1.10 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.35 \
-    crate://crates.io/js-sys/0.3.106 \
+    crate://crates.io/js-sys/0.3.107 \
     crate://crates.io/kstring/2.0.5 \
     crate://crates.io/lazy_static/1.5.1 \
-    crate://crates.io/libc/0.2.190 \
+    crate://crates.io/libc/0.2.191 \
     crate://crates.io/libgit2-sys/0.18.8+1.9.7 \
-    crate://crates.io/libloading/0.9.0 \
+    crate://crates.io/libloading/0.9.1 \
     crate://crates.io/libnghttp2-sys/0.1.13+1.68.1 \
     crate://crates.io/libsqlite3-sys/0.38.2 \
-    crate://crates.io/libssh2-sys/0.3.3 \
-    crate://crates.io/libz-sys/1.1.29 \
+    crate://crates.io/libssh2-sys/0.3.4 \
+    crate://crates.io/libz-sys/1.1.33 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/litemap/0.8.3 \
     crate://crates.io/lock_api/0.4.14 \
-    crate://crates.io/log/0.4.34 \
+    crate://crates.io/log/0.4.35 \
     crate://crates.io/matchers/0.2.0 \
     crate://crates.io/maybe-async/0.2.11 \
     crate://crates.io/memchr/2.8.3 \
-    crate://crates.io/memmap2/0.9.11 \
+    crate://crates.io/memmap2/0.9.12 \
     crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/minimal-lexical/0.2.1 \
     crate://crates.io/miow/0.6.1 \
     crate://crates.io/multiversion_no_op/1.0.0 \
-    crate://crates.io/nix/0.31.3 \
+    crate://crates.io/nix/0.31.4 \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/nonempty/0.12.0 \
     crate://crates.io/normpath/1.5.2 \
@@ -265,57 +251,49 @@ SRC_URI += " \
     crate://crates.io/objc2-ui-kit/0.3.2 \
     crate://crates.io/objc2-user-notifications/0.3.2 \
     crate://crates.io/object/0.39.1 \
-    crate://crates.io/object/0.40.0 \
+    crate://crates.io/object/0.41.0 \
     crate://crates.io/once_cell/1.21.4 \
     crate://crates.io/once_cell_polyfill/1.70.2 \
     crate://crates.io/opener/0.8.5 \
-    crate://crates.io/openssl/0.10.81 \
+    crate://crates.io/openssl/0.10.82 \
     crate://crates.io/openssl-macros/0.1.1 \
     crate://crates.io/openssl-probe/0.1.6 \
     crate://crates.io/openssl-src/300.6.1+3.6.3 \
-    crate://crates.io/openssl-sys/0.9.117 \
+    crate://crates.io/openssl-sys/0.9.118 \
     crate://crates.io/ordered-float/2.10.1 \
-    crate://crates.io/orion/0.17.15 \
     crate://crates.io/os_info/3.15.0 \
-    crate://crates.io/p384/0.13.1 \
     crate://crates.io/parking_lot/0.12.5 \
     crate://crates.io/parking_lot_core/0.9.12 \
-    crate://crates.io/pasetors/0.7.8 \
     crate://crates.io/pathdiff/0.2.3 \
-    crate://crates.io/pem-rfc7468/0.7.0 \
     crate://crates.io/percent-encoding/2.3.2 \
-    crate://crates.io/pin-project-lite/0.2.17 \
-    crate://crates.io/pkcs8/0.10.2 \
+    crate://crates.io/pin-project-lite/0.2.18 \
     crate://crates.io/pkg-config/0.3.34 \
     crate://crates.io/portable-atomic/1.15.0 \
     crate://crates.io/portable-atomic-util/0.2.8 \
     crate://crates.io/potential_utf/0.1.6 \
     crate://crates.io/powerfmt/0.2.1 \
-    crate://crates.io/primeorder/0.13.6 \
     crate://crates.io/proc-macro2/1.0.107 \
     crate://crates.io/prodash/31.0.1 \
     crate://crates.io/quote/1.0.47 \
     crate://crates.io/r-efi/6.0.0 \
-    crate://crates.io/rand/0.10.3 \
+    crate://crates.io/rand/0.10.4 \
     crate://crates.io/rand_core/0.6.4 \
     crate://crates.io/rand_core/0.10.1 \
     crate://crates.io/rand_xoshiro/0.6.0 \
     crate://crates.io/redox_syscall/0.5.18 \
-    crate://crates.io/regex/1.13.1 \
-    crate://crates.io/regex-automata/0.4.18 \
-    crate://crates.io/regex-syntax/0.8.11 \
-    crate://crates.io/rfc6979/0.4.0 \
+    crate://crates.io/regex/1.13.2 \
+    crate://crates.io/regex-automata/0.4.19 \
+    crate://crates.io/regex-syntax/0.8.12 \
     crate://crates.io/rsqlite-vfs/0.1.1 \
     crate://crates.io/rusqlite/0.40.2 \
     crate://crates.io/rustc-hash/2.1.3 \
     crate://crates.io/rustc-stable-hash/0.1.2 \
     crate://crates.io/rustfix/0.9.8 \
-    crate://crates.io/rustix/1.1.5 \
+    crate://crates.io/rustix/1.1.6 \
     crate://crates.io/rustversion/1.0.23 \
     crate://crates.io/same-file/1.0.6 \
-    crate://crates.io/schannel/0.1.29 \
+    crate://crates.io/schannel/0.1.30 \
     crate://crates.io/scopeguard/1.2.0 \
-    crate://crates.io/sec1/0.7.3 \
     crate://crates.io/security-framework/3.7.0 \
     crate://crates.io/security-framework-sys/2.17.0 \
     crate://crates.io/semver/1.0.28 \
@@ -325,33 +303,29 @@ SRC_URI += " \
     crate://crates.io/serde_core/1.0.229 \
     crate://crates.io/serde_derive/1.0.229 \
     crate://crates.io/serde_ignored/0.1.14 \
-    crate://crates.io/serde_json/1.0.152 \
-    crate://crates.io/serde_spanned/1.1.2 \
+    crate://crates.io/serde_json/1.0.154 \
+    crate://crates.io/serde_spanned/1.1.3 \
     crate://crates.io/sha1/0.10.7 \
     crate://crates.io/sha1/0.11.0 \
     crate://crates.io/sha1-checked/0.10.0 \
-    crate://crates.io/sha2/0.10.9 \
-    crate://crates.io/sha2/0.11.0 \
+    crate://crates.io/sha2/0.11.1 \
     crate://crates.io/sharded-slab/0.1.7 \
     crate://crates.io/shell-escape/0.1.5 \
     crate://crates.io/shell-words/1.1.1 \
     crate://crates.io/shlex/2.0.1 \
-    crate://crates.io/signature/2.2.0 \
     crate://crates.io/simdutf8/0.1.5 \
     crate://crates.io/sized-chunks/0.6.5 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.16.3 \
+    crate://crates.io/smallvec/1.16.6 \
     crate://crates.io/socket2/0.6.5 \
-    crate://crates.io/spki/0.7.3 \
     crate://crates.io/sqlite-wasm-rs/0.5.5 \
     crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/subtle/2.6.1 \
     crate://crates.io/supports-hyperlinks/3.2.0 \
     crate://crates.io/supports-unicode/3.0.0 \
     crate://crates.io/syn/2.0.119 \
-    crate://crates.io/syn/3.0.7 \
+    crate://crates.io/syn/3.0.10 \
     crate://crates.io/synstructure/0.14.0 \
     crate://crates.io/tar/0.4.46 \
     crate://crates.io/tempfile/3.27.0 \
@@ -362,15 +336,15 @@ SRC_URI += " \
     crate://crates.io/time/0.3.55 \
     crate://crates.io/time-core/0.1.9 \
     crate://crates.io/time-macros/0.2.32 \
-    crate://crates.io/tinystr/0.8.4 \
+    crate://crates.io/tinystr/0.8.5 \
     crate://crates.io/tinyvec/1.13.3 \
     crate://crates.io/toml/0.9.12+spec-1.1.0 \
-    crate://crates.io/toml/1.1.8+spec-1.1.0 \
+    crate://crates.io/toml/1.2.2+spec-1.1.0 \
     crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
-    crate://crates.io/toml_datetime/1.1.2+spec-1.1.0 \
-    crate://crates.io/toml_edit/0.25.17+spec-1.1.0 \
-    crate://crates.io/toml_parser/1.1.5+spec-1.1.0 \
-    crate://crates.io/toml_writer/1.1.3+spec-1.1.0 \
+    crate://crates.io/toml_datetime/1.1.3+spec-1.1.0 \
+    crate://crates.io/toml_edit/0.25.20+spec-1.1.0 \
+    crate://crates.io/toml_parser/1.1.6+spec-1.1.0 \
+    crate://crates.io/toml_writer/1.2.0+spec-1.1.0 \
     crate://crates.io/tracing/0.1.44 \
     crate://crates.io/tracing-attributes/0.1.31 \
     crate://crates.io/tracing-chrome/0.7.2 \
@@ -381,35 +355,34 @@ SRC_URI += " \
     crate://crates.io/typenum/1.20.1 \
     crate://crates.io/unicase/2.10.0 \
     crate://crates.io/unicode-bom/2.0.3 \
-    crate://crates.io/unicode-ident/1.0.26 \
-    crate://crates.io/unicode-normalization/0.1.25 \
-    crate://crates.io/unicode-width/0.2.2 \
-    crate://crates.io/url/2.5.8 \
-    crate://crates.io/utf8_iter/1.0.4 \
+    crate://crates.io/unicode-ident/1.0.27 \
+    crate://crates.io/unicode-normalization/0.1.26 \
+    crate://crates.io/unicode-width/0.2.3 \
+    crate://crates.io/url/2.5.9 \
+    crate://crates.io/utf8_iter/1.1.0 \
     crate://crates.io/utf8parse/0.2.2 \
+    crate://crates.io/utf_types/1.0.0 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/vcpkg/0.2.15 \
     crate://crates.io/version_check/0.9.5 \
-    crate://crates.io/walkdir/2.5.0 \
-    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
-    crate://crates.io/wasm-bindgen/0.2.129 \
-    crate://crates.io/wasm-bindgen-macro/0.2.129 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.129 \
-    crate://crates.io/wasm-bindgen-shared/0.2.129 \
+    crate://crates.io/walkdir/2.5.1 \
+    crate://crates.io/wasm-bindgen/0.2.130 \
+    crate://crates.io/wasm-bindgen-macro/0.2.130 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.130 \
+    crate://crates.io/wasm-bindgen-shared/0.2.130 \
     crate://crates.io/winapi-util/0.1.11 \
     crate://crates.io/windows-link/0.2.1 \
     crate://crates.io/windows-sys/0.61.2 \
     crate://crates.io/winnow/0.7.15 \
-    crate://crates.io/winnow/1.0.4 \
+    crate://crates.io/winnow/1.0.5 \
     crate://crates.io/writeable/0.6.4 \
-    crate://crates.io/yoke/0.8.3 \
+    crate://crates.io/yoke/0.8.4 \
     crate://crates.io/yoke-derive/0.8.4 \
     crate://crates.io/zerofrom/0.1.8 \
     crate://crates.io/zerofrom-derive/0.1.8 \
-    crate://crates.io/zeroize/1.9.1 \
     crate://crates.io/zerotrie/0.2.5 \
-    crate://crates.io/zerovec/0.11.8 \
-    crate://crates.io/zerovec-derive/0.11.6 \
+    crate://crates.io/zerovec/0.11.9 \
+    crate://crates.io/zerovec-derive/0.11.7 \
     crate://crates.io/zlib-rs/0.6.8 \
     crate://crates.io/zmij/1.0.23 \
 "
@@ -417,23 +390,22 @@ SRC_URI += " \
 SRC_URI[aho-corasick-1.1.5.sha256sum] = "c982642fa9e8606056828ee9a8505737230110bb1099153c79efe865c59d12ba"
 SRC_URI[allocator-api2-0.2.21.sha256sum] = "683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923"
 SRC_URI[android_system_properties-0.1.6.sha256sum] = "ae221649c9976a6f6c56ae1facf410f3ddb33cc661c4b7b61020a912d4237fbc"
-SRC_URI[annotate-snippets-0.12.16.sha256sum] = "f211a51805bc641f3ad5b7664c77d2547af685cc33b4cd8d31964027a46f13f1"
+SRC_URI[annotate-snippets-0.12.18.sha256sum] = "0258346f92c78dbc5b336b9a5b27c64447aa10643bc64e651db2edb145361564"
 SRC_URI[anstream-1.0.0.sha256sum] = "824a212faf96e9acacdbd09febd34438f8f711fb84e09a8916013cd7815ca28d"
 SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
 SRC_URI[anstyle-hyperlink-1.0.2.sha256sum] = "7a14cad0fa1d1fb02de486a95ea7fd8dd28567b82f65b4ca34bffa7da81823e4"
 SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecdc9d355bbb4ce0c68908cd8130e"
-SRC_URI[anstyle-progress-0.1.4.sha256sum] = "082ebe8b7607a68881fbcccc7b3a3e784aa58593ed4261df0679a803fdb80853"
+SRC_URI[anstyle-progress-0.1.6.sha256sum] = "31c8de128a34de5ee1f96b96403c74611081e68100aa50368a2bf1d1a8e7d3f9"
 SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
-SRC_URI[anyhow-1.0.104.sha256sum] = "330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470"
-SRC_URI[ar_archive_writer-0.5.3.sha256sum] = "73cd58deff2140a0a8eae87e417bd01db68a33e148aa93d1e8cd837e55e312b6"
-SRC_URI[arc-swap-1.9.2.sha256sum] = "c049c0be4daef0b145cb3555416b3b8ef5b7888a38aea1a3a155801fe7b0810b"
+SRC_URI[anyhow-1.0.105.sha256sum] = "2cb931c189b85683d69a5cfad41d4d418671e1ac413dd209f3f2fc31e3cfd902"
+SRC_URI[ar_archive_writer-0.5.5.sha256sum] = "523e5e187fff36fcb8d1d19ccf0ca4ca43ec3d158316057f66dc6f72716bc5ec"
+SRC_URI[arc-swap-1.9.5.sha256sum] = "84a22b5d51209f6de83d37a0b33d320acb8da88823e42a94c075140708f032a5"
 SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
 SRC_URI[async-trait-0.1.92.sha256sum] = "82f6aeea286b8eb4dd3431a1be1b59d290ace00f5bfd8e2a159bc2a05e2c1667"
 SRC_URI[autocfg-1.5.1.sha256sum] = "f2032f911046de80f0a198e0901378627c33f59ea0ac00e363d481118bd70a53"
-SRC_URI[base16ct-0.2.0.sha256sum] = "4c7f02d4ea65f2c1853089ffd8d2787bdbc63de2f0d29dedbcf8ccdfa0ccd4cf"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[base64ct-1.8.3.sha256sum] = "2af50177e190e07a26ab74f8b1efbfe2ef87da2116221318cb1c2e82baf7de06"
+SRC_URI[base64-0.23.1.sha256sum] = "ac07cdecf99051d9a5238b80f35af32cdeba5b336e55d957b318b50137e18da5"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
 SRC_URI[bitflags-2.13.2.sha256sum] = "3ded4057c258ba199e2d26386d3af3780957ecaee6c4ef4041c6b4b8b97c0b06"
 SRC_URI[bitmaps-2.1.0.sha256sum] = "031043d04099746d8db04daf1fa424b2bc8bd69d92b25962dcde24da39ab64a2"
@@ -441,90 +413,81 @@ SRC_URI[blake3-1.8.7.sha256sum] = "6d9e454fc11f76977dc803893aff6304ed33d6a26efae
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[block-buffer-0.12.1.sha256sum] = "d2f6c7dbe95a6ed67ad9f18e57daf93a2f034c524b99fd2b76d18fdfeb6660aa"
 SRC_URI[block2-0.6.2.sha256sum] = "cdeb9d870516001442e364c5220d3574d2da8dc765554b4a617230d33fa58ef5"
-SRC_URI[bstr-1.13.1.sha256sum] = "6bb31b46c14244e20ee9984b11bf5c992b91fb6939fea616e3512c8baecdbe5f"
-SRC_URI[bumpalo-3.20.3.sha256sum] = "72f5acc6cb2ba439de613abc23857ec3d78374d8ed5ac84e9d11336e87da8649"
+SRC_URI[bstr-1.14.0.sha256sum] = "a680398c10c7bc0488067c4612226ea905a85f607134b69f3068d505d58c4214"
+SRC_URI[bumpalo-3.20.4.sha256sum] = "87a0cf66fd1eb2fb7b822cb78370d82303750809bc6ba855f3f58e517d3238db"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
-SRC_URI[bytes-1.12.1.sha256sum] = "fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04"
+SRC_URI[bytes-1.12.2.sha256sum] = "776dfebd015e2d8732c684a2c71003674ccb49457b539b9e82151ba38e96dd7c"
 SRC_URI[camino-1.2.6.sha256sum] = "bbbad30e4b4c14a39e3cc8aed085a12a327257c316619c93581e017bc52be591"
-SRC_URI[cargo-0.100.0.sha256sum] = "f4d8037642eef9a2744e1bbc775522cb20867ecc7ea35373f1769609d7386e60"
+SRC_URI[cargo-0.101.0.sha256sum] = "c6c1327f8e79d54291c59972479bbe14f0ff6ddf72dff2b6d5501affb5061ffa"
 SRC_URI[cargo-credential-0.4.11.sha256sum] = "5de74202293b2bc090da20d0b475aa74821caf0e901f29ba97003353886a5b42"
-SRC_URI[cargo-credential-libsecret-0.5.10.sha256sum] = "7a84968127ab001ecc938ea245ad6d93be6039eb7732ead0f16f9b83fc8d5334"
-SRC_URI[cargo-credential-macos-keychain-0.4.25.sha256sum] = "cf917177a4bb7f238e1b8b3084cae37a688910e3b7bd95403f43f7c3d5a93b0e"
-SRC_URI[cargo-credential-wincred-0.4.25.sha256sum] = "9234ec1ab98e92524fbf7ceb5dd06e0fcf2a046d6f341670d32796e9c5a9a384"
+SRC_URI[cargo-credential-libsecret-0.5.11.sha256sum] = "8db81e53925d0c8b7d1728fc884518d35e0b292873ef4c52447a3e807fade873"
+SRC_URI[cargo-credential-macos-keychain-0.4.26.sha256sum] = "daf279a812ba09450e150152a6cfdff65431a7b8692ea90167e30fd03a35ba70"
+SRC_URI[cargo-credential-wincred-0.4.26.sha256sum] = "ef800e2427d5ae8180407a95c31eac5f242a13065a0e95ee9cfa2f42550a1466"
 SRC_URI[cargo-platform-0.3.3.sha256sum] = "dd0061da739915fae12ea00e16397555ed4371a6bb285431aab930f61b0aa4ba"
-SRC_URI[cargo-util-0.2.32.sha256sum] = "dbe819082beae53247a2c440bece59bc2d1d90736cf5bed6b87f5e5bb53f0d30"
-SRC_URI[cargo-util-schemas-0.14.3.sha256sum] = "292e4a141b9c1ecfe5e6e960edc81a6ea3358a5440e030da848d0269376abeaf"
-SRC_URI[cargo-util-terminal-0.1.2.sha256sum] = "82be174c17e22a0366a1a0929e0306e0d53f120d159416b00f35e9708e7b2940"
+SRC_URI[cargo-util-0.2.33.sha256sum] = "33ab36e328ebd4ef4b7cf9a4532018012caf9facfd28426a0d5683dce92aeb46"
+SRC_URI[cargo-util-schemas-0.15.0.sha256sum] = "5f6852a6fffb5443e5c26155532745f3db7eec431e31581da2f844c0a437c8ff"
+SRC_URI[cargo-util-terminal-0.1.3.sha256sum] = "2f9e4b9b1629251f42ca7774d39a94486e575bf6629cfc20d5e99a04663fb7bd"
 SRC_URI[cbindgen-0.29.4.sha256sum] = "2ecb53484c9c167ba674026b656d8a27d7657a58e6066aa902bfb1a4aa00ae20"
-SRC_URI[cc-1.7.0.sha256sum] = "50a649af8a827553c29fb0cb4bd4a6f1a0dd695bd3232b9bc98bd9c8a3ffbb8b"
+SRC_URI[cc-1.11.3.sha256sum] = "02f0e023adb368345ce0ca6cdfc0f24a06554468d0e8503e14a0841de79bfa69"
 SRC_URI[cfg-if-1.0.5.sha256sum] = "4e7648175b45a9a48536d676f68d918270699102aa8dab5496df06904c914600"
 SRC_URI[cfg_aliases-0.2.2.sha256sum] = "f079e83a288787bcd14a6aea84cee5c87a67c5a3e660c30f557a3d24761b3527"
 SRC_URI[chacha20-0.10.2.sha256sum] = "65c35e4b699c7e15ccbe7ee35c005e4fc0a278d22238a2857e6ce2dadeda1b06"
-SRC_URI[clap-4.6.7.sha256sum] = "aa8876b300ab35ba921adea3dfd70157a46249b33f95c9084ae5709785478946"
+SRC_URI[clap-4.6.9.sha256sum] = "844c5c0b65be192cb68d570cca1b21a6444431d24e39c084dc0336177015337c"
 SRC_URI[clap_builder-4.6.7.sha256sum] = "ec0797fb7aeb1406c84efac526901f7ec3ead2124f946b494e72879d4b54704d"
-SRC_URI[clap_complete-4.6.11.sha256sum] = "037e2a1a92236d0aff7e845093f64661d6df4c02c9fcc61a60e9e1d736fa392f"
-SRC_URI[clap_derive-4.6.7.sha256sum] = "f9c751b79415d4e559e3d1fcf128e09e720eb673a06d26cf6f392d37d75b66e0"
-SRC_URI[clap_lex-1.1.1.sha256sum] = "1c133bc6a41be0d194c306b5506d15e6feeea7b1d6604bd3f8310dfb2ca96486"
+SRC_URI[clap_complete-4.6.12.sha256sum] = "6a35200383f20018d41c14d1ab19c1727c697f544492143f7d93aa39f0187848"
+SRC_URI[clap_derive-4.6.9.sha256sum] = "b4c174f11f949b9ca8c60580925e282b9cbd5454750e506f08648b2038080cd7"
+SRC_URI[clap_lex-1.1.2.sha256sum] = "e0921b3876b3a1df8a1c9f912e7f94342458022c2e84288015893d83c4d62a79"
 SRC_URI[clru-0.6.3.sha256sum] = "197fd99cb113a8d5d9b6376f3aa817f32c1078f2343b714fff7d2ca44fdf67d5"
 SRC_URI[cmov-0.5.4.sha256sum] = "0c9ea0ac24bc397ab3c98583a3c9ba74fa56b09a4449bbe172b9b1ddb016027a"
 SRC_URI[color-print-0.3.7.sha256sum] = "3aa954171903797d5623e047d9ab69d91b493657917bdfb8c2c80ecaf9cdb6f4"
 SRC_URI[color-print-proc-macro-0.3.7.sha256sum] = "692186b5ebe54007e45a59aea47ece9eb4108e141326c304cdc91699a7118a22"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
-SRC_URI[const-oid-0.9.6.sha256sum] = "c2459377285ad874054d797f3ccebf984978aa39129f6eafde5cdc8315b612f8"
-SRC_URI[const-oid-0.10.2.sha256sum] = "a6ef517f0926dd24a1582492c791b6a4818a4d94e789a334894aa15b0d12f55c"
+SRC_URI[const-oid-0.10.3.sha256sum] = "be95d4a884358a21a199689323c29e9256b4a1b315e22f183d155422041d3a9a"
 SRC_URI[constant_time_eq-0.4.2.sha256sum] = "3d52eff69cd5e647efe296129160853a42795992097e8af39800e1060caeea9b"
 SRC_URI[core-foundation-0.10.1.sha256sum] = "b2a6cd9ae233e7f62ba4e9353e81a88df7fc8a5987b8d445b4d90c879bd156f6"
 SRC_URI[core-foundation-sys-0.8.7.sha256sum] = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
 SRC_URI[core_detect-1.0.0.sha256sum] = "7f8f80099a98041a3d1622845c271458a2d73e688351bf3cb999266764b81d48"
 SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
 SRC_URI[cpufeatures-0.3.1.sha256sum] = "5ca28b0ae3115b884660db4118d803791fd6756b6e88f39c0f3f7859060d7566"
-SRC_URI[crates-io-0.41.2.sha256sum] = "c047c636cac168acc89c2df97a9017f2751e96742faaa35941fabec8c9d057a9"
-SRC_URI[crc32fast-1.5.2.sha256sum] = "01a7799fd6b852db0e61728dde9a204c423b44d689dbd432522543614b490e78"
+SRC_URI[crates-io-0.41.3.sha256sum] = "54c254dab5d7e143a186ed2797d71c2c5a8f54ed0f492c9b33b4eb49208248cb"
+SRC_URI[crc32fast-1.5.5.sha256sum] = "2b929dd2a135771f40afabd1073f85eed59c800b7c61901e5c254270497dad64"
 SRC_URI[crossbeam-channel-0.5.17.sha256sum] = "98b0cc327b5bc766e7fda9c9260cc0fa81b43a8e240440422dff70788e3f9ef1"
 SRC_URI[crossbeam-deque-0.8.8.sha256sum] = "622f3fc73690be383c7214310406f28a90e6edeadc3cea882f9d71e495b9711a"
 SRC_URI[crossbeam-epoch-0.9.21.sha256sum] = "dc74980687109a3b14c72fd458107bf0baa1da1a1a805e178d15501ba9b86d9d"
 SRC_URI[crossbeam-utils-0.8.23.sha256sum] = "a31eee39dddec8330830986fcd7625edb5a24ec90ea038215273bbc3adb08ac6"
-SRC_URI[crypto-bigint-0.5.5.sha256sum] = "0dc92fb57ca44df6db8059111ab3af99a63d5d0f8375d9972e319a379c6bab76"
-SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
+SRC_URI[crypto-common-0.1.7.sha256sum] = "78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a"
 SRC_URI[crypto-common-0.2.2.sha256sum] = "ce6e4c961d6cd6c9a86db418387425e8bdeaf05b3c8bc1411e6dca4c252f1453"
-SRC_URI[ct-codecs-1.1.8.sha256sum] = "8fd9f3db6f2cfef61c10613071955154ffdc9e515daebff26de4b54e35038fdd"
-SRC_URI[ctutils-0.4.3.sha256sum] = "03bb0e1cc970d482d121d9a1744999169b69a07470b3d644a7894e53fcaf4574"
+SRC_URI[ctutils-0.4.8.sha256sum] = "261af4dc7a06ea8a527a8717d8cbba3417530d6ea14e1edb3de6b67806be474f"
 SRC_URI[curl-0.4.51.sha256sum] = "ef3ce06df3ac230a4f5c91bfd3e3961cd66f177bd9964c87deb3cce59a54fb7b"
 SRC_URI[curl-sys-0.4.91+curl-8.22.0.sha256sum] = "cd39579123e45bf762716bb893d43886ed1cabe6289455be29a4f1d4e37afb06"
 SRC_URI[dashmap-6.2.1.sha256sum] = "e6361d5c062261c78a176addb82d4c821ae42bed6089de0e12603cd25de2059c"
-SRC_URI[defmt-0.3.100.sha256sum] = "f0963443817029b2024136fc4dd07a5107eb8f977eaf18fcd1fdeb11306b64ad"
-SRC_URI[defmt-1.1.1.sha256sum] = "e2953bfe4f93bbd20cc71198842756f77d161884c99ebbabc41d80231ded88d1"
-SRC_URI[defmt-macros-1.1.1.sha256sum] = "bad9c72e7ca2137e0dc3813245a0d282fd6daad32fd800af018306a9169b5fe8"
-SRC_URI[defmt-parser-1.0.0.sha256sum] = "10d60334b3b2e7c9d91ef8150abfb6fa4c1c39ebbcf4a81c2e346aad939fee3e"
-SRC_URI[der-0.7.10.sha256sum] = "e7c1832837b905bbfb5101e07cc24c8deddf52f93225eee6ead5f4d63d53ddcb"
-SRC_URI[deranged-0.5.8.sha256sum] = "7cd812cc2bc1d69d4764bd80df88b4317eaef9e773c75226407d9bc0876b211c"
+SRC_URI[defmt-0.3.101.sha256sum] = "4deef977660e373c458df605a913d4ab121db0ccd18d1ad6976dff7d37cddb53"
+SRC_URI[defmt-1.2.0.sha256sum] = "e4a0795ac740cb54d7b3775c9c17345f6aaecf884c01733b39d6017738e0e3e1"
+SRC_URI[defmt-macros-1.2.0.sha256sum] = "840bb056bd99c495c9188198a258ab787c79f306d864db3e6e8451442d6d8366"
+SRC_URI[defmt-parser-1.1.0.sha256sum] = "71958f69fb2de856c5dd51ac9377e986ca1aa5919f931bf5395a807277f889a0"
+SRC_URI[deranged-0.5.9.sha256sum] = "9e9de72ce2ad1f90dc62fa25f0f430ef85eb4b0d8fa0be4f30373bc40a21d28e"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[digest-0.11.3.sha256sum] = "f1dd6dbb5841937940781866fa1281a1ff7bd3bf827091440879f9994983d5c2"
 SRC_URI[dispatch2-0.3.1.sha256sum] = "1e0e367e4e7da84520dedcac1901e4da967309406d1e51017ae1abfb97adbd38"
 SRC_URI[displaydoc-0.2.7.sha256sum] = "c6232dd377dcc64799954cbd3a9bb882e9cdc1308ccd87b1c098f1fb2eaf82a8"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
-SRC_URI[ecdsa-0.16.9.sha256sum] = "ee27f32b5c5292967d2d4a9d7f1e0b0aed2c15daded5a60300e4abb9d8020bca"
-SRC_URI[ed25519-compact-2.6.0.sha256sum] = "1454db4f2edb7f0e8fe0c5b375b0c978fc63244cc9f010d160e417eb10139aa8"
 SRC_URI[either-1.19.0.sha256sum] = "0e9c71c2167ca323c882b99918929403426e2373ea17242ff5653e0d5e1058be"
-SRC_URI[elliptic-curve-0.13.8.sha256sum] = "b5e6043086bf7973472e0c7dff2142ea0b680d30e18d9cc40f267efbf222bd47"
-SRC_URI[encoding_rs-0.8.42.sha256sum] = "8e985e0451871ad22fb8d2b6b076e2028a502a0d3950998c2c5c0a4f9b5d9679"
-SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
-SRC_URI[erased-serde-0.4.10.sha256sum] = "d2add8a07dd6a8d93ff627029c51de145e12686fbc36ecb298ac22e74cf02dec"
-SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
+SRC_URI[encoding_rs-0.8.44.sha256sum] = "89253175e704ab869b04f9db224d38630e0211a53841a79181deae0889e169f5"
+SRC_URI[equivalent-1.0.3.sha256sum] = "00d174d5400e5e8fd687ad1049e2f578285fa914201b1af7e8b112a4546bd826"
+SRC_URI[erased-serde-0.4.11.sha256sum] = "1e59b668157f32d3459d4bd634861a06ffa2503a461ca5f0916b9f0252605e66"
+SRC_URI[errno-0.3.15.sha256sum] = "e35d6e78f4cebb90e51d543db8fe41528851d6deeef6ef21ebd4bfdc1e784776"
 SRC_URI[fallible-iterator-0.3.0.sha256sum] = "2acce4a10f12dc2fb14a218589d4f1f62ef011b2d0cc4b3cb1bba8e94da14649"
 SRC_URI[fallible-streaming-iterator-0.1.9.sha256sum] = "7360491ce676a36bf9bb3c56c1aa791658183a54d2744120f27285738d90465a"
 SRC_URI[faster-hex-0.10.1.sha256sum] = "04839bdf9d8c10f66806fad16b852fc72aab80873aebc3cb69d85b4fa41543ed"
 SRC_URI[fastrand-2.5.0.sha256sum] = "da7c62ceae207dd37ea5b845da6a0696c799f85e97da1ab5b7910be3c1c80223"
-SRC_URI[ff-0.13.1.sha256sum] = "c0b50bfb653653f9ca9095b427bed08ab8d75a137839d9ad64eb11810d5b6393"
-SRC_URI[fiat-crypto-0.3.0.sha256sum] = "64cd1e32ddd350061ae6edb1b082d7c54915b5c672c389143b9a63403a109f24"
-SRC_URI[filetime-0.2.29.sha256sum] = "5c287a33c7f0a620c38e641e7f60827713987b3c0f26e8ddc9462cc69cf75759"
-SRC_URI[find-msvc-tools-0.1.14.sha256sum] = "aedcfb3409746eddb02b9e19ebda1c3394f759a152e48ee875a0844d1b955484"
-SRC_URI[flate2-1.1.10.sha256sum] = "6e634e2e0ebac1ee034020da1ca582e17ffe4e0f5e985823721e168928136dcb"
+SRC_URI[filetime-0.2.30.sha256sum] = "e1255e7a9f1902190d4c10a75f2f7f495d3d3ce13e9ba26e6c48683a0f4dbed7"
+SRC_URI[find-msvc-tools-0.1.15.sha256sum] = "1c66915cc5391097de7a2b0b972e8505aa33c0df401fd3a6811dbdb32881ba48"
+SRC_URI[flate2-1.1.11.sha256sum] = "626d4928326b646e70f65ed36fc7cf9f206bdb68a0019ee7c6b4709da4e084c4"
 SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
 SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
-SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
+SRC_URI[form_urlencoded-1.2.3.sha256sum] = "afa489199eaffb1211795df1c6236ce1ad0d41a6fa45250add73e3b02420f06e"
 SRC_URI[futures-0.3.34.sha256sum] = "9a31d2a3fbaaeb2af2368bbdd904aa8e812d3c04a1ee10d3171f52d556e5d0a3"
 SRC_URI[futures-channel-0.3.34.sha256sum] = "b1f9e3d69d39e4862ffed03ed071a76f9a13ba1d9109d355b0f0aa6b15e393c4"
 SRC_URI[futures-core-0.3.34.sha256sum] = "92d699e522242e69e3003b94ecc1f960f3a5e015aa7c5d7486e65ad01dd94f5e"
@@ -535,8 +498,7 @@ SRC_URI[futures-sink-0.3.34.sha256sum] = "1944426bf7d03f1d14f708785e4b33efd750b3
 SRC_URI[futures-task-0.3.34.sha256sum] = "cd417de3d1d015fc3bfd2b1ea46dfc7bab72ef86f1cc7cc9c78e728b34a6d1fd"
 SRC_URI[futures-timer-3.0.4.sha256sum] = "af43fadb8a98512d547e37b4e92e0ced13e205c061b87b4623eff01d918d6968"
 SRC_URI[futures-util-0.3.34.sha256sum] = "0d50a92467f8ba5dd6e3ee5d4bd04d73ab2e4e1c44474a0674821dfce14b79bc"
-SRC_URI[generic-array-0.14.9.sha256sum] = "4bb6743198531e02858aeaea5398fcc883e71851fcbcb5a2f773e2fb6cb1edf2"
-SRC_URI[getrandom-0.2.17.sha256sum] = "ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0"
+SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
 SRC_URI[git2-0.21.0.sha256sum] = "ddddbf932745a6be37109b6112d3ee09696106f848449069d3a57bba937ab82e"
 SRC_URI[git2-curl-0.22.0.sha256sum] = "1f1f6fe01327a2f7a1d6ee519c14651f79530aa4d64e870f4cf672efe697bea5"
@@ -593,69 +555,66 @@ SRC_URI[gix-validate-0.11.4.sha256sum] = "4dae8780f63ed8a803b8bdabbd7aa5f5c5d745
 SRC_URI[gix-worktree-0.54.0.sha256sum] = "92399ed66f259592050c6ed9dc80105e095a2f8e87e6b83d98aa2e21d8e27036"
 SRC_URI[gix-worktree-stream-0.34.0.sha256sum] = "55f3a878c89a05470ad98c644b0015777c530da24854dd29e41fe4f41176840f"
 SRC_URI[glob-0.3.4.sha256sum] = "e4eba85ea1d0a966a983acd07deee566e67395d2d96b6fb39e62b5a833f1eb0b"
-SRC_URI[globset-0.4.20.sha256sum] = "07c34a9410465b45bd9787443bc7370f37735bad04b0f0cd57ff1a3186c98988"
-SRC_URI[group-0.13.0.sha256sum] = "f0f9ef7462f7c099f518d754361858f86d8a07af53ba9af0fe635bbccb151a63"
+SRC_URI[globset-0.4.22.sha256sum] = "71217a07f20b48b4938c14203b77b610f8a7fa6762c3f75394a10c5f31e5aee0"
 SRC_URI[hash32-0.3.1.sha256sum] = "47d60b12902ba28e2730cd37e95b8c9223af2808df9e902d4df49588d1470606"
 SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
 SRC_URI[hashbrown-0.16.1.sha256sum] = "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
-SRC_URI[hashbrown-0.17.1.sha256sum] = "ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a"
+SRC_URI[hashbrown-0.17.2.sha256sum] = "735eaa21a6a5ffb2e84362faaeb90c05ba8e19797ca30428478cb6ea3a4921bc"
 SRC_URI[hashlink-0.12.2.sha256sum] = "a596f1b20ed2cc5ecac41a164aaebc7258057060f06c0cf7a2ba3991ee7990fb"
 SRC_URI[heapless-0.8.0.sha256sum] = "0bfb9eb618601c89945a70e254898da93b13be0388091d42117462b265bb3fad"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
-SRC_URI[hkdf-0.12.4.sha256sum] = "7b5f8eb2ad728638ea2c7d47a21db23b7b58a72ed6a38256b8a1849f15fbbdf7"
-SRC_URI[hmac-0.12.1.sha256sum] = "6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e"
 SRC_URI[hmac-0.13.0.sha256sum] = "6303bc9732ae41b04cb554b844a762b4115a61bfaa81e3e83050991eeb56863f"
 SRC_URI[home-0.5.12.sha256sum] = "cc627f471c528ff0c4a49e1d5e60450c8f6461dd6d10ba9dcd3a61d3dff7728d"
 SRC_URI[http-1.5.0.sha256sum] = "918d3568bebf352712bc2ef3d46a8bcf1a75b373be6539de198e9105cbbf9ce0"
 SRC_URI[http-auth-0.1.10.sha256sum] = "150fa4a9462ef926824cf4519c84ed652ca8f4fbae34cb8af045b5cbcaf98822"
 SRC_URI[hybrid-array-0.4.15.sha256sum] = "27f864f10dfb56725ce5ce5472bc52252c8f93a4ab86327122cebf62c5f59a17"
-SRC_URI[icu_collections-2.3.0.sha256sum] = "fa68d21081c4a05d5a901a1c62add574c77048b6a1c67be3b50ce0b60d4ca513"
-SRC_URI[icu_locale_core-2.3.0.sha256sum] = "d56e28588da92eee5c3201a6eff33fabdd49b62269c8938d4ff050ce4d900deb"
-SRC_URI[icu_normalizer-2.3.0.sha256sum] = "12f9cf5f235641ed274641dd81c3f28d870e276763d0797aeeab72317b1c646f"
-SRC_URI[icu_normalizer_data-2.3.0.sha256sum] = "1563da1ed3e0b3bf3d74c9b85917ac9c56464d2f57242270c09c9e752f8021a0"
-SRC_URI[icu_properties-2.3.0.sha256sum] = "7e7ca276ad3145661a65914e6daf131ca5120cd3dcee8f8f3214b8875184a148"
-SRC_URI[icu_properties_data-2.3.0.sha256sum] = "e590f038c1464a96894fd6d10127e90a8be4509f56ff7ecef851b15cee0b7caa"
-SRC_URI[icu_provider-2.3.1.sha256sum] = "d27bbb9d3abbefac45d55f647c9de1d44aafcd1186eb91879afef17c396c3e73"
+SRC_URI[icu_collections-2.4.0.sha256sum] = "fe090a42a0d3140fed8c63263ed1fecc02422cb2f4bfe55cd8de2de1b8e105dd"
+SRC_URI[icu_locale_core-2.4.0.sha256sum] = "25d29b57c17c6528d0dc4c2141cfa2d08200465acb537a3909c8b9b8a4a984c0"
+SRC_URI[icu_normalizer-2.4.0.sha256sum] = "404a3b8c486f205c87fe7f23ab6894d84a4ad76d6e4671ae1981ba7def87c599"
+SRC_URI[icu_normalizer_data-2.4.0.sha256sum] = "20f0088bfb7441f7a37fa0c9e20cb1e9cba1cac6b9ce8cd2a6dc44294f8e8cbc"
+SRC_URI[icu_properties-2.4.0.sha256sum] = "2ea83d991c56158f7cf898bf86436c1dfe7c07ee82fe88951f2695c9f37a379f"
+SRC_URI[icu_properties_data-2.4.0.sha256sum] = "b98f29af82d02b163fe50161388350e743bb3107cc8e8c2f7314cb505faddfcf"
+SRC_URI[icu_provider-2.4.0.sha256sum] = "413099315636c588ee8f011190b329b971a09a8fae9d157e01dcae8379468514"
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.2.sha256sum] = "cb68373c0d6620ef8105e855e7745e18b0d00d3bdb07fb532e434244cdb9a714"
-SRC_URI[ignore-0.4.33.sha256sum] = "00b69833ed729dc5aa7d19541d96d6cf8e9137194207a04916d658e43168402f"
+SRC_URI[ignore-0.4.35.sha256sum] = "df0a7d5f105e76bda602bed0a44af048542d3c9af12ec35aaf16f106c6f34270"
 SRC_URI[im-rc-15.1.0.sha256sum] = "af1955a75fa080c677d3972822ec4bad316169ab1cfc6c257a942c2265dbe5fe"
 SRC_URI[implib-0.6.0.sha256sum] = "96e1090e37c7188a99a2353115083505ff6a489e86637dc41e1671457b1259d3"
 SRC_URI[indexmap-2.14.2.sha256sum] = "cc4e190f5d26ca7051642629da2c52fc03bde85a03197c99408dcd291734c855"
 SRC_URI[is_executable-1.0.6.sha256sum] = "82cb6a9f675da968c63b6208c641b9dca58fc0133ae53375736b1767b0cab8bd"
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.15.0.sha256sum] = "8b4baf93f58d4425749ca49a51c50ebab072c5df6994d08fed93541c331481dc"
-SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
-SRC_URI[jiff-0.2.38.sha256sum] = "b2b005715dcbeb0089a3c0dab99f2ff1cc3b2525323552703d648585d342a383"
-SRC_URI[jiff-core-0.1.1.sha256sum] = "5e52fe76043ccecc9005d2305ebaadf7d7fc0cc89ca6baa10a94d6bc68c7128c"
-SRC_URI[jiff-static-0.2.38.sha256sum] = "2cc9817253cf7c7ee4684451bd327e88d6f3658014e54a29198625590650695c"
-SRC_URI[jiff-tzdb-0.1.9.sha256sum] = "fa8377070c6bae868759445e5a77f66d84f0b72f3a054bfb00e6d038b8282da7"
+SRC_URI[itoa-1.0.19.sha256sum] = "3bd1574e617a9a6c1f8f8181bd7e841e1f20e4277607ef28945765188d6284d4"
+SRC_URI[jiff-0.2.46.sha256sum] = "175dc66334db3b9ab9985bf8b61cfed50dc16d20964bb47f9e479adcae984a7f"
+SRC_URI[jiff-core-0.1.8.sha256sum] = "e599b80292e597019b8b3e392de3f4bea2959ddfb8c7dff60e035e9e311a2c1b"
+SRC_URI[jiff-static-0.2.46.sha256sum] = "c7b1af7547d47354bc438d797e3854601bde8f8d185780c5ba4ab27afa54f1ba"
+SRC_URI[jiff-tzdb-0.1.10.sha256sum] = "0980fca2cc272465bd60e82397607ba9f33add9e48defd77923301bbd03808f2"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.35.sha256sum] = "1c00acbd29eabad4a2392fa0e921c874934dbbf4194312ad20f04a0ed67a3cb3"
-SRC_URI[js-sys-0.3.106.sha256sum] = "7883d941dae510fb2d978fc3fe018c71c9e2892fd38854de3e8b92c2e5ad9cc5"
+SRC_URI[js-sys-0.3.107.sha256sum] = "8dc09d2154098bbf4ef54eab6b117a3c24cbbffe94046b16ee6d6d4510584d3a"
 SRC_URI[kstring-2.0.5.sha256sum] = "7a09b82a7f771ed02dc0dd9b27130a0fa5499fa15ed3027116c1e5e4e591bd9e"
 SRC_URI[lazy_static-1.5.1.sha256sum] = "20870f649af7073d53e38067b2a84312175d56ea15217e1b15bc83506ec50afb"
-SRC_URI[libc-0.2.190.sha256sum] = "ce5d3ddc6d3fa000eb1536d85e147bfe31aacaba692ed6a876f95cb7c855be78"
+SRC_URI[libc-0.2.191.sha256sum] = "65cd87c9a6d60536580b316ad985726104730a5151c99845f2490428ef91240a"
 SRC_URI[libgit2-sys-0.18.8+1.9.7.sha256sum] = "7f7c568b25d7489bc3fb2988ed69ab111d2944d2f5fec3d5c987fe545ea97b50"
-SRC_URI[libloading-0.9.0.sha256sum] = "754ca22de805bb5744484a5b151a9e1a8e837d5dc232c2d7d8c2e3492edc8b60"
+SRC_URI[libloading-0.9.1.sha256sum] = "a1832accd5a4ca2795ace4d05d15c4039be15b62d3b950eff99746a990e3cc10"
 SRC_URI[libnghttp2-sys-0.1.13+1.68.1.sha256sum] = "492e00167f1418c15648144f42bbfc63099806ecee9bf8d09a6353d6b4856b3c"
 SRC_URI[libsqlite3-sys-0.38.2.sha256sum] = "f1d20bef17f513b9b3004532233187769cd072d790971f4e4da0e346eb6401e8"
-SRC_URI[libssh2-sys-0.3.3.sha256sum] = "0f5eb74291e8691cab524a01274a1b1e7742b1a94f29d8b101d8aadc8372c1cd"
-SRC_URI[libz-sys-1.1.29.sha256sum] = "85bc9657773828b90eeb625adff10eeac83cc21bbfd8e23a03eaa8a33c9e28d9"
+SRC_URI[libssh2-sys-0.3.4.sha256sum] = "fce5a0b125f6aeac93b304b35f7f1e9f054aad29ddac57091928e41df3ccd233"
+SRC_URI[libz-sys-1.1.33.sha256sum] = "fee3f59f4321dab0c78d828942e7aa09d0bd8ad6e78a501977e6bf3d02938045"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[litemap-0.8.3.sha256sum] = "47d9d19d1d6efa0109d2f65ff4c85cddd50bd572e5a00127ab10987290bcefae"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
-SRC_URI[log-0.4.34.sha256sum] = "f9f8bd3e56ce4dfc153cf470fffbfa98c7620958b312ca5c3a4b8d5181fd13c6"
+SRC_URI[log-0.4.35.sha256sum] = "5d15f86d12da44cd8d4ec3c73984537eb7f4cadcb9776a575a0a8a05ca11005c"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
 SRC_URI[maybe-async-0.2.11.sha256sum] = "746873a384ad60adc5db74471dfaba74bd278afbdcfd81db93fafcdfc8b5ca0c"
 SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
-SRC_URI[memmap2-0.9.11.sha256sum] = "d1219ed1b7f229ee7104d281dd01d6802fe28bb6e95d292942c4daacdeb798c0"
+SRC_URI[memmap2-0.9.12.sha256sum] = "6b0ca1155a9ecc25aa12e8313a119f32edf0255fea2f44839c4ac0a12b2ac157"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
 SRC_URI[miow-0.6.1.sha256sum] = "536bfad37a309d62069485248eeaba1e8d9853aaf951caaeaed0585a95346f08"
 SRC_URI[multiversion_no_op-1.0.0.sha256sum] = "743fb55ba31b18fb1ecef6bdc9aa2743314978ac084044301a7eee33fb99a20d"
-SRC_URI[nix-0.31.3.sha256sum] = "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
+SRC_URI[nix-0.31.4.sha256sum] = "2bc81ce8148d3b4f3274da811f11cdd824ae661ee4ef732cdb229825cf5be7f7"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
 SRC_URI[nonempty-0.12.0.sha256sum] = "9737e026353e5cd0736f98eddae28665118eb6f6600902a7f50db585621fecb6"
 SRC_URI[normpath-1.5.2.sha256sum] = "b11ce00d2594068e8a27c9146fdc5cf9f3ac38eb42c7cd34d05fea618873ac9f"
@@ -677,57 +636,49 @@ SRC_URI[objc2-quartz-core-0.3.2.sha256sum] = "96c1358452b371bf9f104e21ec536d37a6
 SRC_URI[objc2-ui-kit-0.3.2.sha256sum] = "d87d638e33c06f577498cbcc50491496a3ed4246998a7fbba7ccb98b1e7eab22"
 SRC_URI[objc2-user-notifications-0.3.2.sha256sum] = "9df9128cbbfef73cda168416ccf7f837b62737d748333bfe9ab71c245d76613e"
 SRC_URI[object-0.39.1.sha256sum] = "2e5a6c098c7a3b6547378093f5cc30bc54fd361ce711e05293a5cc589562739b"
-SRC_URI[object-0.40.0.sha256sum] = "dd229a0361b9d0d4396176e02d65897f487eebeab7caa6d443855ee152ca0b9c"
+SRC_URI[object-0.41.0.sha256sum] = "11dbdb66876026054e4ffc8d757d862bdf5df5aebd5c0b95a41f17832a94f7d2"
 SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
 SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
 SRC_URI[opener-0.8.5.sha256sum] = "b2b03ff07a220d0d0ec9a1f0f238951b7967a5a2e96aefcd21a117b1083415e9"
-SRC_URI[openssl-0.10.81.sha256sum] = "77823a27f0babb03091cb9ed9ef80af3b39dbc82f97e8fa530374b7dafd87a45"
+SRC_URI[openssl-0.10.82.sha256sum] = "4de8111e94a56adca7ebfe6c365b6d42f99deb69b74b6becacd4204e2f193aa2"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
 SRC_URI[openssl-probe-0.1.6.sha256sum] = "d05e27ee213611ffe7d6348b942e8f942b37114c00cc03cec254295a4a17852e"
 SRC_URI[openssl-src-300.6.1+3.6.3.sha256sum] = "46eb8fb9fb3b61ce1c0f8a026c4c1a0714d3a9e138e7fbde78753ce2babc3846"
-SRC_URI[openssl-sys-0.9.117.sha256sum] = "b47e7e6bb2c38cd930d25a23b40fa52e068c10e85f3e03a7f5ba5aaca5713695"
+SRC_URI[openssl-sys-0.9.118.sha256sum] = "19c413d6ec9ebaf5e1c829d355cb3e9f783778d700f135be0921d52fce3c60ae"
 SRC_URI[ordered-float-2.10.1.sha256sum] = "68f19d67e5a2795c94e73e0bb1cc1a7edeb2e28efd39e2e1c9b7a40c1108b11c"
-SRC_URI[orion-0.17.15.sha256sum] = "5e6758747fd1ce1efaf2bd43219ac4aa9e28263b236b2b6a1e486bcd06820707"
 SRC_URI[os_info-3.15.0.sha256sum] = "9cf20a545b305cf1da722b236b5155c9bb35f1d5ceb28c048bd96ca842f41b5b"
-SRC_URI[p384-0.13.1.sha256sum] = "fe42f1670a52a47d448f14b6a5c61dd78fce51856e68edaa38f7ae3a46b8d6b6"
 SRC_URI[parking_lot-0.12.5.sha256sum] = "93857453250e3077bd71ff98b6a65ea6621a19bb0f559a85248955ac12c45a1a"
 SRC_URI[parking_lot_core-0.9.12.sha256sum] = "2621685985a2ebf1c516881c026032ac7deafcda1a2c9b7850dc81e3dfcb64c1"
-SRC_URI[pasetors-0.7.8.sha256sum] = "e838401fb2873bad417e6a03179014c748746f67311cb7317ab14fc0881fa9f0"
 SRC_URI[pathdiff-0.2.3.sha256sum] = "df94ce210e5bc13cb6651479fa48d14f601d9858cfe0467f43ae157023b938d3"
-SRC_URI[pem-rfc7468-0.7.0.sha256sum] = "88b39c9bfcfc231068454382784bb460aae594343fb030d46e9f50a645418412"
 SRC_URI[percent-encoding-2.3.2.sha256sum] = "9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220"
-SRC_URI[pin-project-lite-0.2.17.sha256sum] = "a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd"
-SRC_URI[pkcs8-0.10.2.sha256sum] = "f950b2377845cebe5cf8b5165cb3cc1a5e0fa5cfa3e1f7f55707d8fd82e0a7b7"
+SRC_URI[pin-project-lite-0.2.18.sha256sum] = "c938015719552d665fd0553b90d96cd7ff58e83e4c061ca99e6bb78865a72752"
 SRC_URI[pkg-config-0.3.34.sha256sum] = "f6b464fbc74e149a392436b17d523f769e057cb6877f6a5c4618bc6f11800548"
 SRC_URI[portable-atomic-1.15.0.sha256sum] = "05c8b63e8d9609db387f0324918f81d68fe27748f084ef092fb35954d0539a85"
 SRC_URI[portable-atomic-util-0.2.8.sha256sum] = "10ab3eb7f3becc3a1cbc4f2c6f20267996cfc1a6467a873763411b136a122715"
 SRC_URI[potential_utf-0.1.6.sha256sum] = "d83eb9bc6d8e5cf568e7a1101d60ee05e81ed50ea106026f3d18deeb046d7661"
 SRC_URI[powerfmt-0.2.1.sha256sum] = "4a6394b9e965e73d0a289ee54f589087e2c676aedf60885baf52c76b771e4958"
-SRC_URI[primeorder-0.13.6.sha256sum] = "353e1ca18966c16d9deb1c69278edbc5f194139612772bd9537af60ac231e1e6"
 SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
 SRC_URI[prodash-31.0.1.sha256sum] = "cf52d87428247c5aa3760ac8e7d8b13ec7b3579b955a8c3f311668b6860acba5"
 SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
-SRC_URI[rand-0.10.3.sha256sum] = "65c9fb96cbc91e3478eaae79a69fcd3f1ae4ad052e471fe6732fff548984b4af"
+SRC_URI[rand-0.10.4.sha256sum] = "8f6fa277c67e6ea590466f04c3fe82cb509f0864fe470643e5570de9514a9b11"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
 SRC_URI[rand_core-0.10.1.sha256sum] = "63b8176103e19a2643978565ca18b50549f6101881c443590420e4dc998a3c69"
 SRC_URI[rand_xoshiro-0.6.0.sha256sum] = "6f97cdb2a36ed4183de61b2f824cc45c9f1037f28afe0a322e9fff4c108b5aaa"
 SRC_URI[redox_syscall-0.5.18.sha256sum] = "ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d"
-SRC_URI[regex-1.13.1.sha256sum] = "f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d"
-SRC_URI[regex-automata-0.4.18.sha256sum] = "ad8553b9b26413251cbf30e620595c7a41b3887f03da04579c0e6b0d6a06b4b2"
-SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
-SRC_URI[rfc6979-0.4.0.sha256sum] = "f8dd2a808d456c4a54e300a23e9f5a67e122c3024119acbfd73e3bf664491cb2"
+SRC_URI[regex-1.13.2.sha256sum] = "9807af0e638c12e753aa1b4e601791bf2a8f71274023c8bbeec12fc149950857"
+SRC_URI[regex-automata-0.4.19.sha256sum] = "41d60ef07df457506a0a1a2073112eb4aae5733dbd2813c3da77d1b0fd441158"
+SRC_URI[regex-syntax-0.8.12.sha256sum] = "d902046e6a28a1e4c3cab97258a0ce11e994903f01c2d97a9447a0b3df85f4f6"
 SRC_URI[rsqlite-vfs-0.1.1.sha256sum] = "c51c9ae4df8a7fba42103df5c621fa3c37eccf3a3c650879e90fc48b11cc192c"
 SRC_URI[rusqlite-0.40.2.sha256sum] = "23f2a97da3e3873c73cb2a2e71b35c40ff95e0b1eefa8d72d8499a6928c3b5b3"
 SRC_URI[rustc-hash-2.1.3.sha256sum] = "6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d"
 SRC_URI[rustc-stable-hash-0.1.2.sha256sum] = "781442f29170c5c93b7185ad559492601acdc71d5bb0706f5868094f45cfcd08"
 SRC_URI[rustfix-0.9.8.sha256sum] = "c614151d9f1b1e1f23041dacbf5f8dfab85687455b9e553f19f3d70275d1fe1c"
-SRC_URI[rustix-1.1.5.sha256sum] = "891efababe418670775f199f0d233d84843c227a0949a883ce15b37c78d6629d"
+SRC_URI[rustix-1.1.6.sha256sum] = "e5e76742e5294153d4dde1207dbec5bdd81eef6fabdc0d2118babadabfd858aa"
 SRC_URI[rustversion-1.0.23.sha256sum] = "cf54715a573b99ac80df0bc206da022bcd442c974952c7b9720069370852e21f"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
-SRC_URI[schannel-0.1.29.sha256sum] = "91c1b7e4904c873ef0710c1f407dde2e6287de2bebc1bbbf7d430bb7cbffd939"
+SRC_URI[schannel-0.1.30.sha256sum] = "9cb23c424d8ee841bb4d813677ca237e2a610067d594fec130f87d6093495ab5"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
-SRC_URI[sec1-0.7.3.sha256sum] = "d3e97a565f76233a6003f9f5c54be1d9c5bdfa3eccfb189469f11ec4901c47dc"
 SRC_URI[security-framework-3.7.0.sha256sum] = "b7f4bc775c73d9a02cde8bf7b2ec4c9d12743edf609006c7facc23998404cd1d"
 SRC_URI[security-framework-sys-2.17.0.sha256sum] = "6ce2691df843ecc5d231c0b14ece2acc3efb62c0a398c7e1d875f3983ce020e3"
 SRC_URI[semver-1.0.28.sha256sum] = "8a7852d02fc848982e0c167ef163aaff9cd91dc640ba85e263cb1ce46fae51cd"
@@ -737,33 +688,29 @@ SRC_URI[serde-value-0.7.0.sha256sum] = "f3a1a3341211875ef120e117ea7fd5228530ae7e
 SRC_URI[serde_core-1.0.229.sha256sum] = "67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48"
 SRC_URI[serde_derive-1.0.229.sha256sum] = "e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348"
 SRC_URI[serde_ignored-0.1.14.sha256sum] = "115dffd5f3853e06e746965a20dcbae6ee747ae30b543d91b0e089668bb07798"
-SRC_URI[serde_json-1.0.152.sha256sum] = "1741ab7a6cc54a03a89b5d563ed60075c277d9e3cfa73ad0c1f23f23974703c6"
-SRC_URI[serde_spanned-1.1.2.sha256sum] = "4e7523beb55eece201a2356bee0bbca0d1ab466c14c07703b2e0ee6d42cb0c2c"
+SRC_URI[serde_json-1.0.154.sha256sum] = "e7e9cc8b1b85264074fbcc02a88680c4096b1e47df8f739dceb03bf482f04bd6"
+SRC_URI[serde_spanned-1.1.3.sha256sum] = "9c187e0a369471c550af028cba56d4f4fa2a489ad28151ae95a4d340a2a8b782"
 SRC_URI[sha1-0.10.7.sha256sum] = "a978451301f4db1d02937a4ab3ccce137717b81826e79b7d49ffe3244a13c3b8"
 SRC_URI[sha1-0.11.0.sha256sum] = "aacc4cc499359472b4abe1bf11d0b12e688af9a805fa5e3016f9a386dc2d0214"
 SRC_URI[sha1-checked-0.10.0.sha256sum] = "89f599ac0c323ebb1c6082821a54962b839832b03984598375bff3975b804423"
-SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
-SRC_URI[sha2-0.11.0.sha256sum] = "446ba717509524cb3f22f17ecc096f10f4822d76ab5c0b9822c5f9c284e825f4"
+SRC_URI[sha2-0.11.1.sha256sum] = "47d7069beb7d6ac7b9acd1039986e73443f24234f41074da099d6f994ac9ad19"
 SRC_URI[sharded-slab-0.1.7.sha256sum] = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
 SRC_URI[shell-escape-0.1.5.sha256sum] = "45bb67a18fa91266cc7807181f62f9178a6873bfad7dc788c42e6430db40184f"
 SRC_URI[shell-words-1.1.1.sha256sum] = "dc6fe69c597f9c37bfeeeeeb33da3530379845f10be461a66d16d03eca2ded77"
 SRC_URI[shlex-2.0.1.sha256sum] = "f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba"
-SRC_URI[signature-2.2.0.sha256sum] = "77549399552de45a898a580c1b41d445bf730df867cc44e6c0233bbc4b8329de"
 SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
 SRC_URI[sized-chunks-0.6.5.sha256sum] = "16d69225bde7a69b235da73377861095455d298f2b970996eec25ddbb42b3d1e"
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.16.3.sha256sum] = "5b3dc8af474f516a851ff4bd12db780f948b9250ad37211e4eec0bccea54e01b"
+SRC_URI[smallvec-1.16.6.sha256sum] = "3244542535d5de959d90ec55d1b5ff0fd2bb7b1310223907d5f11932847f7b59"
 SRC_URI[socket2-0.6.5.sha256sum] = "c3d1e2c7f27f8d4cb10542a02c49005dbd6e93095799d6f3be745fae9f8fedd4"
-SRC_URI[spki-0.7.3.sha256sum] = "d91ed6c858b01f942cd56b37a94b3e0a1798290327d1236e4d9cf4eaca44d29d"
 SRC_URI[sqlite-wasm-rs-0.5.5.sha256sum] = "dc3efc0da82635d7e1ced0053bbbfa8c7ab9645d0bf36ceb4f7127bb85315d75"
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
-SRC_URI[subtle-2.6.1.sha256sum] = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
 SRC_URI[supports-hyperlinks-3.2.0.sha256sum] = "e396b6523b11ccb83120b115a0b7366de372751aa6edf19844dfb13a6af97e91"
 SRC_URI[supports-unicode-3.0.0.sha256sum] = "b7401a30af6cb5818bb64852270bb722533397edcfc7344954a38f420819ece2"
 SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297"
-SRC_URI[syn-3.0.7.sha256sum] = "d62a2e0561533f2ca2561d0cf27fd9fedb640a1bf2616ff5d5c80d99017faadc"
+SRC_URI[syn-3.0.10.sha256sum] = "4ae9ccbea3a7b0b09443036490c8f34a8b1b760fd345e5c0dae0aac718faea79"
 SRC_URI[synstructure-0.14.0.sha256sum] = "901704edd0dfe137f1987838ee4f259e4e063c31371bdb423f7ae38ec6f77f02"
 SRC_URI[tar-0.4.46.sha256sum] = "3f6221d9a6003c78398e3b239969f352578258df48c8eb051caadae0015bc840"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
@@ -774,15 +721,15 @@ SRC_URI[thread_local-1.1.10.sha256sum] = "1ad99c4c6d32803332c548b1af0540b357b3f5
 SRC_URI[time-0.3.55.sha256sum] = "cdb87b95ec50ddfa440816d227a17b2ccbdda963a316a727fda0fc4334f7d134"
 SRC_URI[time-core-0.1.9.sha256sum] = "9e1c906769ad99c88eaa54e728060edef082f8e358ff32030cb7c7d315e81109"
 SRC_URI[time-macros-0.2.32.sha256sum] = "7e689342a48d2ea927c87ea50cabf8594854bf940e9310208848d680d668ed85"
-SRC_URI[tinystr-0.8.4.sha256sum] = "b1e27c91459209c2986af3dcf603a5a74a4368754ce37414f59acc971167f643"
+SRC_URI[tinystr-0.8.5.sha256sum] = "abc840c238154d58f9e86b2792261edfde565a17696e1cda1a449de27979801a"
 SRC_URI[tinyvec-1.13.3.sha256sum] = "fd3ca314f692efd6c868f8408f53fe444634a845f96c028b97d35f6a1f79f0ee"
 SRC_URI[toml-0.9.12+spec-1.1.0.sha256sum] = "cf92845e79fc2e2def6a5d828f0801e29a2f8acc037becc5ab08595c7d5e9863"
-SRC_URI[toml-1.1.8+spec-1.1.0.sha256sum] = "20489e00e4d8741d6be680764cc12e270655e375a20d1011e844a9c3379e678d"
+SRC_URI[toml-1.2.2+spec-1.1.0.sha256sum] = "5426cb1b964690d913f6c5c1a1ae0b42f428ec506bb4d452876d7a209c9bca3b"
 SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] = "92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
-SRC_URI[toml_datetime-1.1.2+spec-1.1.0.sha256sum] = "2b86d767906c6c42421dcba507eb9d203e779497710a47782a224bb871653053"
-SRC_URI[toml_edit-0.25.17+spec-1.1.0.sha256sum] = "e3641d5bbb5349a79e1020a242d251efbc546ad8048d133958323ce9c40a9c9c"
-SRC_URI[toml_parser-1.1.5+spec-1.1.0.sha256sum] = "baa693a8032d7e1cada7d0041e96126df243179ff061456783ac7f12bda4744c"
-SRC_URI[toml_writer-1.1.3+spec-1.1.0.sha256sum] = "06bdbd8cfc056b8d2e2e85f29b56a3bdbecb527cef81eb39e3e7b98af4652770"
+SRC_URI[toml_datetime-1.1.3+spec-1.1.0.sha256sum] = "173f25c883cd2176a2d8212155638c0a60d484a9d84546d270866f40f56b6e49"
+SRC_URI[toml_edit-0.25.20+spec-1.1.0.sha256sum] = "e76360e201d6dbd6583e17795ba71a88f47365a9139c8450a7979c32303b8e73"
+SRC_URI[toml_parser-1.1.6+spec-1.1.0.sha256sum] = "e6769c452d71ba30696c6b37770c439a9cc9110f47f7d5cdbeda79840ef5ea31"
+SRC_URI[toml_writer-1.2.0+spec-1.1.0.sha256sum] = "009dbb7700f11c55ef83aebbe4c0e9cf1f1ac0844bd8d6f00dc38f302026e13a"
 SRC_URI[tracing-0.1.44.sha256sum] = "63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100"
 SRC_URI[tracing-attributes-0.1.31.sha256sum] = "7490cfa5ec963746568740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
 SRC_URI[tracing-chrome-0.7.2.sha256sum] = "bf0a738ed5d6450a9fb96e86a23ad808de2b727fd1394585da5cdd6788ffe724"
@@ -793,34 +740,33 @@ SRC_URI[typeid-1.0.3.sha256sum] = "bc7d623258602320d5c55d1bc22793b57daff0ec7efc2
 SRC_URI[typenum-1.20.1.sha256sum] = "b6f5e870be6c3b371b77fe0ee0bafb859fa4964b4404c27de1d380043c4dda20"
 SRC_URI[unicase-2.10.0.sha256sum] = "357cc3acc6a036009fd6c973ed009037c732d60d0b4f6c673e9041497482a28f"
 SRC_URI[unicode-bom-2.0.3.sha256sum] = "7eec5d1121208364f6793f7d2e222bf75a915c19557537745b195b253dd64217"
-SRC_URI[unicode-ident-1.0.26.sha256sum] = "d245f478577f809a851594d02313b640fb437e0bb33866753cff937863096954"
-SRC_URI[unicode-normalization-0.1.25.sha256sum] = "5fd4f6878c9cb28d874b009da9e8d183b5abc80117c40bbd187a1fde336be6e8"
-SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
-SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
-SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
+SRC_URI[unicode-ident-1.0.27.sha256sum] = "a2c754d6c33795a1c324727428e5a7dedb5b06195f9890bdbcba760d3e246563"
+SRC_URI[unicode-normalization-0.1.26.sha256sum] = "75cd3fb03d5288b3ba9a1ee103ac7e9cbb59f0b03d64f8ddfcc04dd42758a85d"
+SRC_URI[unicode-width-0.2.3.sha256sum] = "ca718471876992059f251e33aafc334346ada08042b7661dd1fe313a9bced557"
+SRC_URI[url-2.5.9.sha256sum] = "f00cd2407bb42c0ef17be88d4cf020f5cceffd121665bac9b8b9493a369b3b1a"
+SRC_URI[utf8_iter-1.1.0.sha256sum] = "af3bd9d3e571c26fcce9d033b87ea5ab061b8d2ffe9b7a5675d810d68f03edf0"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
+SRC_URI[utf_types-1.0.0.sha256sum] = "3a3b425286980a367278453f3b6d28cdcb134b574e5a35824a6ff5eebad50bb6"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
-SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
-SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
-SRC_URI[wasm-bindgen-0.2.129.sha256sum] = "9bb54f33acc68fd454578d9820b0bde1a1a3d17aa17bb7b6595806d02886d409"
-SRC_URI[wasm-bindgen-macro-0.2.129.sha256sum] = "2e29d0c35b16e224a7eeb5cd2d25e3e1968fbd65604117b44d3b789d00ee8535"
-SRC_URI[wasm-bindgen-macro-support-0.2.129.sha256sum] = "6f501a8bc3719dba86ef8ae4728879c08001bea749eb1333ac5b91e040e2a6b7"
-SRC_URI[wasm-bindgen-shared-0.2.129.sha256sum] = "23f0c9c52aa7cd7d77769a4cfe2a9adb1b331f489a41d912ce14513d5ab995c6"
+SRC_URI[walkdir-2.5.1.sha256sum] = "b42e295b7452c4604982280d8586001fcad9b8b201cac67bca9771e7a7475403"
+SRC_URI[wasm-bindgen-0.2.130.sha256sum] = "a0181c14ddd6c7b8b0b0132a5f1ea2f32be0d893cd3ea97b6e3b28886b8a3d1c"
+SRC_URI[wasm-bindgen-macro-0.2.130.sha256sum] = "6e931a02a39abdbf66966fc35902b5ed58344750a70885bed4ebb3d8eaf28ed9"
+SRC_URI[wasm-bindgen-macro-support-0.2.130.sha256sum] = "2ca4b54280e455bd831e33a6b8e734baf432fe63fbc35c42ac14ce67a043a53a"
+SRC_URI[wasm-bindgen-shared-0.2.130.sha256sum] = "3b1f9c3798725016c6ee5f2f57869ec0831e8bbc0ab0310a86e787e97f41389e"
 SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
 SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
 SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
 SRC_URI[winnow-0.7.15.sha256sum] = "df79d97927682d2fd8adb29682d1140b343be4ac0f08fd68b7765d9c059d3945"
-SRC_URI[winnow-1.0.4.sha256sum] = "23b97319f7b8343df12cc98938e5c3eb436064524c8d2b4e30a1d3a36eecdf81"
+SRC_URI[winnow-1.0.5.sha256sum] = "8c3b93199df0ab874cdf0c6a94f0a0dc3423fe41f1cafb62b8bd7b1deb277aef"
 SRC_URI[writeable-0.6.4.sha256sum] = "3ad82d2a33cdc9674dc7465672f271e096168fcdbe0f799d9e6db8c5892679dc"
-SRC_URI[yoke-0.8.3.sha256sum] = "709fe23a0424b6a435d82152b1bd3fdfb0833487d5fa90d05d42762a9891fef5"
+SRC_URI[yoke-0.8.4.sha256sum] = "417ef3fcf6c300b7dbd25c85531a746931c02ad536f3cf4786ed1e88223340b3"
 SRC_URI[yoke-derive-0.8.4.sha256sum] = "ec8ebde2db3681e8c9980cc27822030e68752690ddfa9473e739aeb4dbde6d71"
 SRC_URI[zerofrom-0.1.8.sha256sum] = "0ec05a11813ea801ff6d75110ad09cd0824ddba17dfe17128ea0d5f68e6c5272"
 SRC_URI[zerofrom-derive-0.1.8.sha256sum] = "f75b4683f6c7f45248d4d64056a24298c6281e0993356d7d1b4a1a962ef10d4a"
-SRC_URI[zeroize-1.9.1.sha256sum] = "e13084392c5e4bc371903e2935a5eaeed24905a7511356b883835e18a78f6879"
 SRC_URI[zerotrie-0.2.5.sha256sum] = "4ea269c3bd32f0a32c321907a2ae912ba6f4649bb0fc764a15627e99a7095a3f"
-SRC_URI[zerovec-0.11.8.sha256sum] = "bb0464e17806c1d976d5cba29399c7f08e516e279e2ba493f63123b5fca67dd8"
-SRC_URI[zerovec-derive-0.11.6.sha256sum] = "34df6fc39dbd26ddc9c10e6a2984476e13acce22e64e4487636ef494369225da"
+SRC_URI[zerovec-0.11.9.sha256sum] = "f58a2799cfe9a1670c7ea8edbd52ef8edb93cb37a7f83bf31ba9e35d9dae6a40"
+SRC_URI[zerovec-derive-0.11.7.sha256sum] = "c3743ddbf47738d929cd1ae2e199d40d0162979dfe31aef8ae646d2bf00bf97a"
 SRC_URI[zlib-rs-0.6.8.sha256sum] = "b268e58e7c693d7c271f93ffc4ba3b380412554231c85bf61ca7af91042a4112"
 SRC_URI[zmij-1.0.23.sha256sum] = "29666d0abbfad1e3dc4dcf6144730dd3a3ab225bbbdac83319345b1b44ccfc1b"
diff --git a/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb b/meta/recipes-devtools/cargo-c/cargo-c_0.10.28+cargo-0.101.0.bb
similarity index 87%
rename from meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb
rename to meta/recipes-devtools/cargo-c/cargo-c_0.10.28+cargo-0.101.0.bb
index 722a128d43..a08c674369 100644
--- a/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb
+++ b/meta/recipes-devtools/cargo-c/cargo-c_0.10.28+cargo-0.101.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = " \
 SRC_URI = "crate://crates.io/cargo-c/${PV};name=cargo-c \
            file://0001-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.patch;patchdir=../parking_lot_core-0.9.12/ \
 "
-SRC_URI[cargo-c.sha256sum] = "5ff6e05531e58286d3c02ec0adb7f254e5d532a8d4b667f30b9942d802e1db25"
+SRC_URI[cargo-c.sha256sum] = "489d4becd9fa75bf5b50af47267c88d2dcc6206a2850dc1f4f59d5e37d11e9c1"
 S = "${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV}"
 
 DEBUG_PREFIX_MAP += "-ffile-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}"
-- 
2.49.0

