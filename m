Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4575.1795145415566585512
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 19:30:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pT3+/L5V;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5784f9bc1d=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK3TEql3646184
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 19:30:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=N2PDIGddk
	SOqLr0K2HGa28caqIIAGh8kP+luxskgk90=; b=pT3+/L5VxXkDxZc4d/hCKbWAs
	+dL2NuN+mYRo45d3kwL+/+KEtd8yqR6Mu/Duo/wJ1kz7bcuCkYeX/QP1O8Wm3mQM
	RwwWt8dU/hL6fE80jbnUFLkmMt75Thpimo4rltlhwKChzZ7EaCfRxsJlLnjpf+pb
	72EZZVAN7gMHvi5a0xZXveerQJwbkeG+FSAUlqwixcDSnnTkdCl9T0tksWK56Z/s
	tdlDy2C3yflTpsp23hC/QtHZLFm81fUQnSHhSJ7w3lYZYmRZ8sP7AcNKe8JarY4E
	PFdNpNU8sR9bRuT5Y4EVkjm8kT2wR0GazKrSuFl9LOmVgsvj5coiaFALqeyhA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020125.outbound.protection.outlook.com [52.101.61.125])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j0yvgg1dn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 19:30:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3gzt2D+tqJJAIPOAqLsVDj3f9lRqZkhKCqjAS54ynFAJQ5fqqgocoCJM7LWN9TZFPIeF70mMeHEDiPbAWTrQc6THTeiHTiCrCWwQDHPpCPwXPtj3rGQQyD2YRh8MEUYXeIpsEnGUNu8MsJP3dp7JvrDfmh+BNSEP8ZTtJjP0b1WVp17GUjP8BRHbJ8hSbFVInKh4LPgvy2IyKiU7bol4xm60wrkhqz76UeMfc8VI1nxjxRpL6QTdv2nGmShqm2AZVcjV1I6U0xEw9cEa5Dxxncgrbipcrdr7xR5WJm2UkahVxgdRvGsy4aO7zm6XSUE+AZKnIqdmLA7P+7bfVQB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2PDIGddkSOqLr0K2HGa28caqIIAGh8kP+luxskgk90=;
 b=SG+LQ7KmsFTLf5puU5+8JKFqeqZ+mJWnHBNEu0k4DFNCXeCSxKCva+GjxgZsxAhCZPrV0iITvIrygaIYzceDK1Uef1/SlXglVB4PZToE6//y6lgDjyUrbmts6fi41iyQC/q7rRgLolrfDaCNaLfT+/XlsafVMw8Q/9Cjnn2bty207X4W09v4/txvG9am3yRAmm13EFI99PAX/u1s501S2DwAUY7kQi/OgnQiExSuOoXI9sPlj1ft4HKfzqdfKtdhn4DLsoAkHP2YyBTH+gEmMHkNmCQoM5+YT4lhrWuYVhi1WiQwOBRDigsgBJ3SEQkfy9isNWxmqrY6B69/xoFHBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH0PR11MB4774.namprd11.prod.outlook.com (2603:10b6:510:40::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.10; Fri, 20 Nov 2026 03:29:06 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%4]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 03:29:06 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, alex.kanavin@gmail.com,
        sundeep.kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH 0/2] rust: link LLVM dynamically
Date: Thu, 19 Nov 2026 19:28:44 -0800
Message-ID: <20261120032846.2692732-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0189.namprd05.prod.outlook.com
 (2603:10b6:a03:330::14) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH0PR11MB4774:EE_
X-MS-Office365-Filtering-Correlation-Id: 258e7c31-97c0-4cdd-9b7c-08df46b66e3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|6133799003|18002099003|38350700014|11063799006|261022115727099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|56012099006|261028144727099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: hNO6024pb7eu7sWtbla5FFuyEpHyyzNMaNoKXoyPGz6dtKHml1JEjVmJ/C3J+bTUjDPK6G+Wnsn39Ni/9YvKJWPSf8fZ6cKdBIG01tUMEoXl1G8OApGU8VuzUQelrVbrm8G9nv3zVJoFUF8B6MWrxOk6//w7hiODncE4MmfD8RL62EOjO2EniHmoPvd8tgKRQMEkLWz91TOTbyFEtVso2l34eoc3s3k6EfDqbgXQh97+c8ma0RpKvBzPpTgNMl5Ijp/a2JQ5RUTOrVaH5yMRSw4emCEJHjVLiUUtrKq1sedGrHnSRSy/6aiJVgvK6RD1qevdDKHyc2p0DF5AKbk+I6zCgnLyNBsJgG/uA49RKXNTDLGGUUtXcbKRCC5ht7xKHXAC0kupcKXCiIbkc9gLz05fIBeLxZinF+qiaCQlPAUNV6IlQ5MkVSxIvPFiRiqzDD2SXwRS9Me8VUcC9dTMoQCG7GyR8ImulAh+6ZRkey+BTonPii81yI7vUqJ1TzubqrYIptBTgOd4p3M66znEZOvFWh8B2pXzfhYuEfu2qbgRN0U5VNOGVkqiX/6Akb5yll4ecysBshLwpvmTP4auhRxP0tqzpSBN2YEzlRDlH8Vqi5PLFHuAiOkvcGrHz69GxRe06xlabEEWY2Xs2boYrCfbpQzLWDE43JwhtXY9spA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(6133799003)(18002099003)(38350700014)(11063799006)(261022115727099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qx4FzqckXl51KGo/kqIUr9NX6l5iSV1txpntAbqIXHkrGtyVZZnmbeubjrkr?=
 =?us-ascii?Q?v6JyVJnlP7GRhLScCrMCwAH3i8ir2ZhT8DNw6vN7YKToajQC0+LytUy29K8Z?=
 =?us-ascii?Q?DK2tOv74EAis/r42fo6h3dsYQRTXcVD6o6cn65VRAUrgHemx7GcHwkjnxEQR?=
 =?us-ascii?Q?Fq0QPfa0sj9MG3ExLb/9tIamUmC7MkeuZKyOFNoCoeDqFWqrFY9v5/afo39M?=
 =?us-ascii?Q?Hq+49y3kE81TC8WNkEIPDkO64Z0UCTSDjZ6Q/dabkY/HNIKnBfI57XDfuyqm?=
 =?us-ascii?Q?Mz756CIWlexxQeSwMigl1UY8XhehOGzx59lpk19+TfUnuv1O7QmxJW9fOl2H?=
 =?us-ascii?Q?eOqcERV8O+F+fi6NL3zJfHNslQIgWurtahkjl5YDrvDaJlkmCWXzc9DBS18a?=
 =?us-ascii?Q?jKl65RqH497dpak497KxnoqggLp9Ef4Ufu+wdoikouwFzYyq/OI4OjXH6aww?=
 =?us-ascii?Q?yGtYo0j8n9vFEPax5HzE/xb3DolCnMnT2csoO+/nLwhUDY3A9S48ixJ+F6B7?=
 =?us-ascii?Q?CA0cZ0mEQ04xuTF+p0ZG0ThDwKK6IEhvZXjd4V3b9UmI+2S0cYLurfvl8cII?=
 =?us-ascii?Q?EunqZaNOiIgnxZv/hdXEYF91UVF76Jqm2qwOsrP5mZ4OX8dOfAR8hVLiGUK9?=
 =?us-ascii?Q?ZdoWyqIEcL4meLumA4dzp49vOHkjrUQijjwUoP3RLwPIZSuaoysZ7Mke/a+o?=
 =?us-ascii?Q?8KN3So+Njo7hnfMaZ2aMvlc2PRhK5Cyjd/UJEJmftZYnc1cvaajRFaUhEgNS?=
 =?us-ascii?Q?HvSNH6/PjIEflg11+Cy+i8S3JimkZaAu9c33F1SX0ruTT5zR65we/4R44kPP?=
 =?us-ascii?Q?X+VLE3gOPdpG4QGLP3qL7sXO11P7FtltLzrJVAbctuS5QC4zZs326TwUm3F3?=
 =?us-ascii?Q?pFcOZlfAUm5lAxTSjJ9jVSIRvkLYEHz9s4dXadLox5X3OF1rs9HLKdAco+9E?=
 =?us-ascii?Q?JEwF9dKbSP32TZL5uUXPkCeDM7sXJcacmFbl7r1DHO8wWnO31aX+H2+OjVXn?=
 =?us-ascii?Q?daiLOKxx+m/eCgu7yj9Pu/iXF7JX7zHVuWKZGNLguhx+icXfPZDO6OXnZ9eX?=
 =?us-ascii?Q?6p6bxv2zjgtI2kJ6LIIsQRjaNy8mqCsvxvEg8QxcJ87sMjy5hZjEEC0SDT+R?=
 =?us-ascii?Q?u6PEdLZexYIGiPw8BBGTf0ii2q07qvYoZUpetPCN0ULk+bghgEf+9J671G7f?=
 =?us-ascii?Q?MMCNPPHv3bSTs5XrbqLFtrLH5XV6jSDHf3XraabTN0yG4w3qy6ABcnQTH2xj?=
 =?us-ascii?Q?1kKDDNJat/orl7R8IqzrnlxqlfDautRrbegnBCVit+DDAL5jxrYxucuY1zGC?=
 =?us-ascii?Q?3yG9vExaducU5Dz2OCE2IH18qXzLbz5AWXCyKhS7fSOakiQiF9ujMXSRb7rP?=
 =?us-ascii?Q?cROlr6ZRk7WCcr7XVHSeCs8t4eQzv4IiHTqYn2PEwn1Ft0LbwsX3Th8UYQLH?=
 =?us-ascii?Q?OMZi6rjopnBgdfwLMW9Arp1ntdpiRcqnaLGS4KESLZ13EkiMxDl9T9bs+w9d?=
 =?us-ascii?Q?R8hzOgIL3Xp1LpSfSqnTROQOFbRMV/zUki7EppCZsgKwvSxI/abfUQeP5sUz?=
 =?us-ascii?Q?xJHlPLkyJyOuYPfN96bgJeFMeNiKAWuc5lIsrRuUl1kek8wCpCbBS8OD40rw?=
 =?us-ascii?Q?vseMnXsdESUaOCurl3B5Vxm/VvYHkiw7ZxXjmWqOGfxFcH/zlrSQ9zhaHELc?=
 =?us-ascii?Q?m6y5FdmKK+m+7lTwlD+9lRV5zX/9C0ZY+7V+Ve5SpuVG1ELHZcpKUaSznHWr?=
 =?us-ascii?Q?LHbUgUmfIu7pdI5j/cvTLUNaj/BHyoE=3D?=
X-Exchange-RoutingPolicyChecked: lDRMfx9nVIbOiO3YcQca+7BW89UVSvhwA827oNtBSQ5Dp7UOYPqGU1+cuJ4XbNZ+tqOB4AI4OPuxB7cQdQt065PUPolr6srJGX3TJ9YWSbxNCceO2hKAy1RoxZMsIB+ChKtUWjb1JotfXsHJAWPIy7chcAqE5VhN0UlF7wgK/bOueb0Wj7nk96Fyt7uryKJvNQoaNCZZNxXZi1e2PPkGKqmKF7xH143TnaDSMti+jljPJCyv1uF62bMR//pyoq6UyWYK4bzMe4LPoXl+dik23pQKSsES/QPYTguRPuXutmvsMM8xy5DrP91Ir/0Ua8lST4PbtnuTTihVjE69kaaLVA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 258e7c31-97c0-4cdd-9b7c-08df46b66e3a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 03:29:06.0576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XhzmTPrbgCC9nkxd8efp+3vZeUOTDGwXCTIbFgtyAf1iIeC+NhPXXHB8K+5yNc095bsUL8z+hMltuWkaQmUHQoorO71MmDW/AdktqNkulTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4774
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=EudHPicA c=1 sm=1 tr=0 ts=6affbec7 cx=c_pps
 a=J2I5gP+8VxcSyNNGd87E2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=CCpqsmhAAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=dkoHOdR95ePWiN1mA2MA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ul9cdbp4aOFLsgKbc677:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX8+lugb87o3ka
 PdnImY807Lq8uQpo8yUYem8cOURNmEX7sqLvqfh0T3VW/joI7ME2wioCQMVqd7Cq1zqOI3YHsYt
 k5uXBbH1AHSC2VIAv9ZU/dCvpLgUXKBnagIxpTxu3hHL3awyjQp2YFj4/qYi25oXwROSO2OdAiu
 m9OU5LXmL/49nTJ9J6n8s8WZxxOshlmS1Ps1rkFSaP1yM7wfzSBKcKZSZaiBhS6RjXHQ6hOvn/D
 t9GHvoKcCWO3s2AvE7DvtL9/0GJtViRnBm4BIriL3MkYZB1sxrr70tQ/lFfOPw4KCdviOaeBhdM
 ziMZkWOdI7C8O0FLtnf/Uo72Ed0CMEwT7IOx4r49gzgVtjasuOGnU2eHgUtb3pbZnevuhe+g6Vi
 9O3zep0ml9JP2Zku+o8UTuUQBLT/Z/4DiLab6uOh8aCJYtrAKVgyfIY3UnFl68sxLgMZBbGgESr
 vogUhfnC7yw8uv0mvkw==
X-Proofpoint-GUID: rSZAP9uyRF0QyxxnpmGTB6Bw1YR7X0Zv
X-Proofpoint-ORIG-GUID: fJclmb956P9ihMW5QpkYnp2Ql2KFzH1f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfXxfDBocANQLLz
 tj8c31oWx8X1C3rd+lrK27HJs2zJFFPe0HC1m7GAnZi3VWhjcXsqO36WIYdsESjgXxXyYplvTEo
 JS5tE7Qeo2jxVpHL17rF+cqfIfXM/WxYjibR19ASQcBZ4x2TzMfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 03:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250727
Content-Type: text/plain; charset="utf-8"

From: Sunil Dora <sunilkumar.dora@windriver.com>

This is the scarthgap backport for the rustc segfault, YOCTO #16058.
It follows the RFC and discussion from June/July [1].

Root cause is a binutils bug, PR ld/32991 [2]. From binutils 2.45 gas
emits R_X86_64_GOTPCRELX for "push foo@GOTPCREL(%rip)". An older ld
which does not have the fix converts that push into a call. So when
rust-llvm-native comes from sstate built on a >= 2.45 host and
rust-native gets linked on a host with an older ld, librustc_driver
jumps into LLVM data and rustc crashes. Details are in the bug [3].

master fixed this with [4], rustc links libLLVM.so there so the
host ld never touches the LLVM objects, without it scarthgap is
broken whenever sstate is shared between >= 2.45 and older hosts
(Debian 12/13, Ubuntu 22.04/24.04, the pinned buildtools) and the
distros have not picked up the ld fix.

It is opt-out via PACKAGECONFIG, and Alex also suggested to just take
the backport.

master only needed rust changes because the llvm recipe already builds
the shared lib (rust-llvm was dropped there [5]). scarthgap still has
rust 1.75 with rust-llvm, which builds only static libs. Hence two
patches:

  1/2 rust-llvm: build libLLVM-17.so, install in ${libdir}, package as
      rust-llvm-libllvm. rust is not touched here.
  2/2 rust: llvm-shared PACKAGECONFIG, default on for native, nativesdk
      and target. Native only does not work, Yoann already hit that in
      the RFC, target rust bootstraps its own rustc with target settings.
      Remove llvm-shared from PACKAGECONFIG to get static back.

Tested on scarthgap with both patches:

 - rust-native, target rust, SDK build. librustc_driver has libLLVM-17.so
   in NEEDED now, size 142MB -> 70MB (native)
 - rustc and cargo on qemux86-64 and from the SDK, testsdk passes
 - multilib, musl, qemuarm, qemuppc, qemuarm64 build
 - llvm-shared removed: librustc_driver static again, no libLLVM-17.so
   in DT_NEEDED, 142MB like before
 - oe-selftest rust: same result with and without the series

Size: An image with rust is about 15MB bigger.

[1] https://lists.openembedded.org/g/openembedded-core/topic/119988126?msg=241069
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=32991
[3] https://bugzilla.yoctoproject.org/show_bug.cgi?id=16058#c86
[4] https://git.openembedded.org/openembedded-core/commit/?id=d0671c3dad87a063b3a41dd07cde89b5684e692c
    rust: enable dynamic LLVM linking by default
[5] https://git.openembedded.org/openembedded-core/commit/?id=c116828a876853cd5b53f7bd4607f0037fef4ee4
    rust: Drop rust-llvm

Sunil Dora (2):
  rust-llvm: build and install the LLVM shared library
  rust: enable dynamic LLVM linking by default

 meta/lib/oeqa/selftest/cases/rust.py           |  2 +-
 meta/recipes-devtools/rust/rust-llvm_1.75.0.bb | 15 ++++++++++++++-
 meta/recipes-devtools/rust/rust_1.75.0.bb      |  4 ++++
 3 files changed, 19 insertions(+), 2 deletions(-)

-- 
2.49.0

