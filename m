Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11647.1795762056076806702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 22:47:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dZ8H+1eu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=57914e973c=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR506GT4170710
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=7SnlZupUaaGtV/1cBAwqPnqlOYpNyK8zbR7RlOs/sok=; b=dZ8H+1euyOra
	gOE3gMUCMW12uTyT3VWGG1g5BLYQ2x2Uy8U0Q2NuWYGDwQeFhYTn0Z50+gbB+hxd
	BPWtRbhiH42j6WJDXrnrVGGNK7gOutkwAXSZHV0MZ5z/z7zpTCr9AaIYaori57u6
	rtKzz53p30Md+0x+U0asMS9sL/EICWYA79OVhKOWuXysQc9j5BuF8rvL62k0gICs
	nsy3XzoDYNsQ7IDy1uWK50p7c+UjJNr2j4ApVzwj75RM70lmVCoq/9Lb7TtHpXEH
	EdiFjcGEI7IaoyMHL+DynxOFPfJqEJedU1YqRyV33R57/KhyaVCG2Yv/C+jnCXBJ
	Hm2DHs1AvA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023123.outbound.protection.outlook.com [40.93.201.123])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j60gh3x84-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGWhZkOza34i9sCRMfcE467KLbJ278ruVeF3bRZig8aGavbWFRci9iRa4+swGyThILRKQS8Tqb+m6hSZVGdWeVMWB92gMVWPkYT6AGedsTW1sade7BP8hliyMmgZx3jUN+phaKD8Ybg3P/zxs6YSmLDxFs+rD3cxLFgb4VewnB4J6Vq4mb86ZuEU51Phsbaf/IOL6zzgtearb3N6N+YQeBhJl3BUeWCPOwa6Ti5ocNfXTeZj0vd0JLRtarVlerLB2CaAkV/TVKgzgLm/LH85JJFuu2BpXm6Phd+38XLYJdS/o+IiCyfh4w7c9SSP2nNiYkKxaZX4rxDxfWIK+sXz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SnlZupUaaGtV/1cBAwqPnqlOYpNyK8zbR7RlOs/sok=;
 b=QuMw8q6UK6ncbeqxbpIWTKz9Lr3LSH4yh8C8+E3TxHA6bYT0/9wCka49CWjRBAQmiWMyEjZiB9Bq0qVv5TxfFfTlYMmbG6Qd3s/0MAII6BVMhKAnqBRfiVsKIkgoi+2tBkIZxOQb2FoJLVXEzb2972hu6u1BnhSqzmZ7XArJGKu1PZH/U5Tx6EHi/WJrj+CGDbQGBV/Yu1meCT5IhVn+28heFGvZQhiSs0H1GADqc1EQSMPe4Bs9RuNZgz8nCB+LQkwssu1mEthk3ABJAvyC3rBKTwJtqpnGSwwlkd0vg4Ln8rav0q1QLkcEwF6rqJNztwHqymcYEdhGfSu5f75yaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3243.namprd11.prod.outlook.com (2603:10b6:5:e::19) by
 FT1PR11MB780136.namprd11.prod.outlook.com (2603:10b6:170:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 06:47:34 +0000
Received: from DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1]) by DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 06:47:34 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 7/8] libconvert-asn1-perl: fix CVE-2026-131868
Date: Fri, 27 Nov 2026 12:16:58 +0530
Message-Id: <20261127064659.2169695-8-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20261127064659.2169695-1-OmkarAbaji.Patil@windriver.com>
References: <20261127064659.2169695-1-OmkarAbaji.Patil@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0194.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::19) To DM6PR11MB3243.namprd11.prod.outlook.com
 (2603:10b6:5:e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3243:EE_|FT1PR11MB780136:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b24a90-4d79-4a40-e642-08df4c52511a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|10067099003|56012099006|260925022911599003|260925021911599003|260925021311599003|261026135527099003|261026121527099003|261026140227099003|261026130827099003|261028144727099003|261022115727099003|261022113327099003|261022105027099003|261022075727099003|261021121427099003|261021130227099003|261021135927099003|261021133027099003|261021123027099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: BELlnErAyi12c20/gqhinXjThDjvZwBn9uYvzEQ8U2MpaZTSOstXkRj0+DyzJl5XsSNBmgpHfsJ3e0v+fGSoyDhl1THrULdlm1vUk6Sexg+1Xlg5VC6vGjjpqe11zTbk57snVbqikxCS0WJNi8YWd60cjKmgOfdHudYz5QrZ4PvKUzWZyXjD8yb/FL/Rcu6JnElZdWFab+VqfwMNjmhnMlWxAu5dqwRhD8TNOrh2H/PZP6xTBf8ZO2BuZHMgAP0SaNiJ4Pq9Q789fT3Mde67rfyWtni4vLG/hgLmcsPHGiUMg7UT7b/ljNUexeU9T+wU7fQ6j6Ffxqk87LQVrqvA1krzWXpEk/3z+K1swDt9SryntSuhdygjW/UTLNrcwUCb8jOC2a8VL5DOIA0bA6RYOadlmxb8ocvg3XUtx0kap5fBIOUaljdxXKiBKknCdEdS/8nQsYIKMCjaRe0nB4kamI7+ZJArZVMDL1FL516mLxzf9tTN2AIwcvzaKPFvxXnpiNMTJv6CYOeuKYbRJG9L/3QrdgqO1yBJ6D+Cp4KnEw61SWJeOGB640b1bnaVFLvX9h9K9Twl30ZoXMTzd8Jf/EaGDvoeK9/erOddcC9Ay2VuBz1E3p1aptDOx0vmzjzESeLr8yKkMrGs9koTUYHE8SRbkWLEIvtjmM3p37qCZvOg1y5G9dpIknVpstLQY/qDOXXkJzFcSDNsOpTZ6OE86eT01A5tVNYAOmIfNi9TLEc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3243.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(10067099003)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(261026135527099003)(261026121527099003)(261026140227099003)(261026130827099003)(261028144727099003)(261022115727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021130227099003)(261021135927099003)(261021133027099003)(261021123027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(6133799003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GT3tTjO9tmHABE91yFNt0Bn0mgOyMlP7ntvV/PlMypxMwbobwPiDPm2q1NTy?=
 =?us-ascii?Q?RAlecYR94HzksiD9MkNL4o1erOzSpOv2oNozqLNb7pQk4Jy5M0IaRFgEq/B4?=
 =?us-ascii?Q?C/URDmIi6JBtWj1PQpvf5CuL2dyZi9Dd9IUpVwey+TZNdj3WJflmPFP+t4os?=
 =?us-ascii?Q?7oNKvAW5NUHza2RPBPnyjn281NfF6anGkhaFw4GHntOHytYpfyJq9Up8H53S?=
 =?us-ascii?Q?i2RlUlmQ2cpuYQHqA778M/Ze+99FnK6bRtpXgKIQ1QkdHZdtCoya/YcDJ3O+?=
 =?us-ascii?Q?N9cSzO/lnFv4UehDAcikASIAWrn0mwBSdr47A0n6c0f0GPAL0MMNgh802TqM?=
 =?us-ascii?Q?P/+kzdhsT65mzvyGJWfITLrY1PaGV/cSHaRldJt3hxnT+i0K5t84+KvGIjwa?=
 =?us-ascii?Q?3FWfCMlAp2S/yEr1TkbtWfM5mFOqFxDJ5KTAEAAkM2ButuWJZwB9PY9VQdoo?=
 =?us-ascii?Q?Fr91Z21iCSpmePdhRAcXJNUWZ/PbZXD/3CItS91vxAsxY8Jt1DnMhoNUe+97?=
 =?us-ascii?Q?w1h9z8YpguUlH/X1KlPruIR0c3oeSErBQ61l5q7nPwPsuildT53lNOVrAVXx?=
 =?us-ascii?Q?vdOWvFJXzhmpGjQGi5KjUzVdoeOVP97f6Hpl3De9h3ZexKOlydLQFuoiGmCh?=
 =?us-ascii?Q?CILWLu6ZiBhdSi2yyYWVigokJGq+qamqsH5clxnFUlb+sWCcIavmb4pJBh7k?=
 =?us-ascii?Q?Lh7y7TIE9vWUPpQmyk/hk8WTWr7YzYnVFQLUM4dJ013LsVdBX3xdgzMVCo/c?=
 =?us-ascii?Q?7823wI8LxoIh2/Y9DAKx6Db+0+LOx+rm9yCYnq58OnXqvjpETz5eNyDy0Dk3?=
 =?us-ascii?Q?QMSP/hLQv1SjaLLJs9lyrfA9syYOYM0CutQ2uGlHg/HZxx+7ZK8z8yO7b4aS?=
 =?us-ascii?Q?vYEp4aFfNq+X2WpkmLojkNPhfy6znl1Ry9RolSzz5PXjNNwAYXhnsVIn52M0?=
 =?us-ascii?Q?09KqJbQo6QRqZZVKVvCslNEX3MYWaLQyfau3Kx9vH4twW0HQoluHQhg1V5wt?=
 =?us-ascii?Q?nHCWFrU2kCgVBG/utzkafxpDXSYpzu9g2JBVcTC2zme9OgnuTpQy7mEftpMZ?=
 =?us-ascii?Q?+d25IxnzqXJhdSEqvKHkAXQtJ3t8Jbgt8H7sb6VpNCJaOI+LETAelDt4iGKH?=
 =?us-ascii?Q?cwBBwMJahiKJ18jGUMc4/SxqTw85bez1Z2zHkDMy3pFar88j5mrfTnfRUQmY?=
 =?us-ascii?Q?OURjJMIp5vDu+f6CQFAJHhWGRi7oqXhxm9fLQ0/c3PG8VfYczXeMyWHtuAq/?=
 =?us-ascii?Q?fuLpZbDj8FEgk+X7MxtLOPbj7O69arWcI4jpBYvu7LEZvOityfI8+wGmXiU7?=
 =?us-ascii?Q?s0dKSPzPZayyksxvYScd4byAcWfF39F1CpOzegQAjlgPfnG3Dfx3iEWsHk3L?=
 =?us-ascii?Q?/qXqoofW/0oPcuEJ1BK3DmM9kQun8FJTlWRg3qba9N0dLHHhasARbeKGCXw7?=
 =?us-ascii?Q?5UKcCHxz9yIfsjZ2dn1ShqL2BZY50M7Wm2CJYDbcVDWfbIikSQX6X9qatNom?=
 =?us-ascii?Q?D3eqU5feJ3RP+9k6HRz0Kxxv76e3VanKLLBHEGAOkfw9XXqh3LxwvlvDaLm/?=
 =?us-ascii?Q?Nmnk6w7n3B0zydkfhqLYjNN28OZ+dWdmaACaKhXzBICVsg+bYPlwZWiNzTE/?=
 =?us-ascii?Q?DGvB4FmiZTEtemjYeFFuEngcu3n7OiA0HJWSrYMjiinkELNRRGVaIIRx8Ch+?=
 =?us-ascii?Q?11IC3xrgk/6z284WXNZN01RiceWdlmqrSkDS31M+HkBI7TtTV7tDe6dNlA0M?=
 =?us-ascii?Q?QSJjPYpSIurTBzjU+u0sbCFmHd2xdC0=3D?=
X-Exchange-RoutingPolicyChecked: buMJjaDF4dKaTAY3hI3kERIUXJw/PAazBz05rR4regfwL41PGdWiOHui4KCwK3iaAgsc1nx07/A0Ta6KzUCje2OXGbuSeA5dP9uXRwVZ7586ZzEqcoglFSam/1SDEfNYvsGkV1xl0LKqtznB+Ph7ukb7R4tWsfzlZA2YdiCr6xMHFd5X7KNO62zDz3Jm0ZKA6fMDZKMmG5Ds22G44gAKhzeYBdWLbk6wq14BQ6pdwTl+Sv1jGwFM5bJsqvSYR9S5K8pmkSXtnn1Zblbt0WUYt/34Z2FCks35NizTNXXJpDSfiXozg5g5Y4Q/8LmZy3gWSmRJ5+paw8euOsyiRzB/QQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b24a90-4d79-4a40-e642-08df4c52511a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 06:47:34.3917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJ0Th8jCpJX0lBwDAKzsH/TaMqVeIHZyi+cOuK6GtYyFfmjmVZFUk3NGQgjpluZHbJ3UrxlO5yVVSUf2et1mRJTEAFJDKGuHxTQjAVxDVm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB780136
X-Authority-Analysis: v=2.4 cv=R5SWitRX c=1 sm=1 tr=0 ts=6b092787 cx=c_pps
 a=5D4/3oYeZhDPDdnr7H2lFQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=rIBJHUus6d2i0TBX3h8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 9kdaS2kWfCieF6m2_4cGtosTedYJG2Xp
X-Proofpoint-ORIG-GUID: 9kdaS2kWfCieF6m2_4cGtosTedYJG2Xp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX3nB5NK1KBJT7
 774nkSHLQeyhrK/azWOXVYOZbeiYgtXZEYaPguKx6r7i9cxXGARc2SNXabxUbjOxHNi6TxPJGdM
 WcDBQeBXjJifNL903bY7Sz6AHiQ2LpvV+lnOe1HjI+x7EbYdDr6w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX116IYBN6n+eN
 2EM/449OJWb657lAYjqJwCnZ+RGPuze7MWQ4PZDjgnaksAQf4zqmt5hUbQfEVFYOD8gsba3p10I
 u1TUP8C5VfgVAHyuZeDVRBiU8M7jY4RSy5xI5Y6BwyGSg1tHHL+G05MKOsRFN8YqwjNMlHRMwyL
 e2WvRYRbzSrZO1Tt+ktxErQKe3jhSoE2vJbfM+DgnZ+fOcfXmdJVZRl2+4ELY2BcNnUtVGUUhWk
 kNOkdrHWyZGgVVEWc4m5SCk1cFiR/JC2C8I9oStAYXw6grr+W9/o22VWew/jZ2uxBjAi3wHa6Ji
 eEYIm3oyBQdF9LeHVSGyudZetU7A76PZ3BlxOFDCRhXYE6usvNoXoyiMDaBIleqh8uPzY1fUwFN
 px1fsLONGTJ92bx4jdKlVTHH1eX0bJ+bTzCWg57wQLgVrGvQosFtH2U73tknV3BpJUaBZhphV/+
 QEb2nPizOdYSeBOGDig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 06:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251350
Content-Type: text/plain; charset="utf-8"

Convert::ASN1 versions before 0.37 contain a flaw
in asn_read() and asn_get() that can lead to memory
exhaustion (DoS). A specially crafted BER header can
declare an extremely large element length, causing Perl
to allocate a massive buffer before reading any data,
potentially exhausting system memory and terminating the
process.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-131868]

Upstream patch:
[https://github.com/cpan-authors/perl-Convert-ASN1/commit/88bd86b5a3ce3430ebb8b78fe5307f234198bf16]

Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 .../CVE-2026-131868.patch                     | 190 ++++++++++++++++++
 .../perl/libconvert-asn1-perl_0.34.bb         |   1 +
 2 files changed, 191 insertions(+)
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-131868.patch

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-131868.patch b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-131868.patch
new file mode 100644
index 0000000000..d178c208f4
--- /dev/null
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-131868.patch
@@ -0,0 +1,190 @@
+From 95f4eb1da6ed1ec3d27777ad9fe9ad335e98019e Mon Sep 17 00:00:00 2001
+From: Timothy Legge <timlegge@gmail.com>
+Date: Tue, 17 Nov 2026 21:40:25 -0400
+Subject: [PATCH 7/8] Fix CVE-2026-131868: prevent huge allocations in asn_read
+ and asn_get
+
+Both functions passed the length declared by an element straight to
+sysread, and perl allocates a buffer of the requested size before
+reading. A 6-byte header declaring a 4GB length made the process
+reserve 4GB; where the allocation is refused, perl exits with "Out of
+memory", which eval cannot catch.
+
+Cap each sysread at 64KB. The existing loops already repeat until the
+element is complete, so memory now tracks the data actually received.
+Add t/27asn_read_length.t.
+
+CVE: CVE-2026-131868
+Upstream-Status: Backport [https://github.com/cpan-authors/perl-Convert-ASN1/commit/88bd86b5a3ce3430ebb8b78fe5307f234198bf16]
+Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
+---
+ lib/Convert/ASN1/IO.pm | 15 ++++---
+ t/27asn_read_length.t  | 88 ++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 98 insertions(+), 5 deletions(-)
+ create mode 100644 t/27asn_read_length.t
+
+diff --git a/lib/Convert/ASN1/IO.pm b/lib/Convert/ASN1/IO.pm
+index 5284d06..34f9964 100644
+--- a/lib/Convert/ASN1/IO.pm
++++ b/lib/Convert/ASN1/IO.pm
+@@ -12,6 +12,10 @@ BEGIN {
+   eval { require bytes } and 'bytes'->import
+ }
+ 
++# Largest single read, so the buffer perl allocates tracks the data
++# received and not the length an element declares
++my $MAX_READ = 65536;
++
+ sub asn_recv { # $socket, $buffer, $flags
+ 
+   my $peer;
+@@ -146,7 +150,7 @@ sub asn_read { # $fh, $buffer, $offset
+     $need = ($pos + ($depth * 2)) || 2;
+ 
+     while(($n = $need - length $_[1]) > 0) {
+-      $e = sysread($_[0],$_[1],$n,length $_[1]) or
++      $e = sysread($_[0],$_[1],($n > $MAX_READ ? $MAX_READ : $n),length $_[1]) or
+ 	goto READ_ERR;
+     }
+ 
+@@ -157,7 +161,7 @@ sub asn_read { # $fh, $buffer, $offset
+       do {
+         $need++;
+ 	while(($n = $need - length $_[1]) > 0) {
+-	  $e = sysread($_[0],$_[1],$n,length $_[1]) or
++	  $e = sysread($_[0],$_[1],($n > $MAX_READ ? $MAX_READ : $n),length $_[1]) or
+ 	      goto READ_ERR;
+ 	}
+ 	$ch = unpack("C",substr($_[1],$pos++,1));
+@@ -167,7 +171,7 @@ sub asn_read { # $fh, $buffer, $offset
+     $need = $pos + 1;
+ 
+     while(($n = $need - length $_[1]) > 0) {
+-      $e = sysread($_[0],$_[1],$n,length $_[1]) or
++      $e = sysread($_[0],$_[1],($n > $MAX_READ ? $MAX_READ : $n),length $_[1]) or
+ 	  goto READ_ERR;
+     }
+ 
+@@ -181,7 +185,7 @@ sub asn_read { # $fh, $buffer, $offset
+       $need = $pos + $len;
+ 
+       while(($n = $need - length $_[1]) > 0) {
+-	$e = sysread($_[0],$_[1],$n,length $_[1]) or
++	$e = sysread($_[0],$_[1],($n > $MAX_READ ? $MAX_READ : $n),length $_[1]) or
+ 	    goto READ_ERR;
+       }
+ 
+@@ -201,7 +205,7 @@ sub asn_read { # $fh, $buffer, $offset
+   }
+ 
+   while(($n = $pos - length $_[1]) > 0) {
+-    $e = sysread($_[0],$_[1],$n,length $_[1]) or
++    $e = sysread($_[0],$_[1],($n > $MAX_READ ? $MAX_READ : $n),length $_[1]) or
+       goto READ_ERR;
+   }
+ 
+@@ -246,6 +250,7 @@ sub asn_get { # $fh
+     }
+ 
+     my $get = $need > 1024 ? $need : 1024;
++    $get = $MAX_READ if $get > $MAX_READ;
+ 
+     sysread($_[0], $href->{'asn_buffer'}, $get, length $href->{'asn_buffer'})
+       or return undef;
+diff --git a/t/27asn_read_length.t b/t/27asn_read_length.t
+new file mode 100644
+index 0000000..1ede07c
+--- /dev/null
++++ b/t/27asn_read_length.t
+@@ -0,0 +1,88 @@
++#!/usr/bin/perl
++# asn_read and asn_get must not size their read buffer from the length an
++# element declares; memory should track the data actually received.
++
++use strict;
++use warnings;
++use lib 'lib';
++use File::Temp qw(tempfile);
++use Convert::ASN1 qw(:io);
++BEGIN { require './t/funcs.pl' }
++
++print "1..10\n";
++
++sub vmpeak {
++    open(my $fh, '<', '/proc/self/status') or return;
++    while (<$fh>) { return $1 if /^VmPeak:\s+(\d+)/ }
++    return;
++}
++
++# Return a read handle on a temporary file holding $data.
++sub handle_for {
++    my $data = shift;
++    my ($fh, $name) = tempfile(UNLINK => 1);
++    binmode $fh;
++    print $fh $data;
++    close $fh;
++    open(my $in, '<', $name) or die "open: $!";
++    binmode $in;
++    return $in;
++}
++
++sub mem_test {
++    my ($num, $before, $after) = @_;
++    if (defined $before && defined $after) {
++        btest $num, $after - $before < 64 * 1024;     # kB
++    }
++    else {
++        print "ok $num # skip no /proc/self/status\n";
++    }
++}
++
++my $huge = "\x30\x84\x7f\xff\xff\xff" . ("A" x 100);    # declares ~2GB, holds 100 bytes
++
++# --- 1-2: asn_read fails on the short input without a huge allocation ---
++{
++    my $in = handle_for($huge);
++    my $before = vmpeak();
++    my $buf;
++    my $ret = asn_read($in, $buf);
++    my $after = vmpeak();
++    btest 1, !defined $ret;
++    mem_test 2, $before, $after;
++}
++
++# --- 3-4: asn_get fails on the short input without a huge allocation ---
++{
++    my $in = handle_for($huge);
++    my $before = vmpeak();
++    my $ret = asn_get($in);
++    my $after = vmpeak();
++    btest 3, !defined $ret;
++    mem_test 4, $before, $after;
++}
++
++# An element larger than a single read, followed by a small one.
++my $big   = "\x04\x83\x03\x0d\x40" . ("B" x 200_000);
++my $small = "\x30\x03\x02\x01\x05";
++
++# --- 5-7: asn_read returns exactly one element at a time ---
++{
++    my $in = handle_for($big . $small);
++    my $buf;
++    my $ret = asn_read($in, $buf);
++    btest 5, defined($ret) && $ret == length $big;
++    btest 6, $buf eq $big;
++    asn_read($in, $buf);
++    btest 7, $buf eq $small;
++}
++
++# --- 8-10: asn_get returns each element whole ---
++{
++    my $in = handle_for($big . $small);
++    my $ret = asn_get($in);
++    btest 8, defined($ret) && $ret eq $big;
++    $ret = asn_get($in);
++    btest 9, defined($ret) && $ret eq $small;
++    btest 10, !defined asn_get($in);
++}
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
index fc47ccf8d7..c404b4f2b0 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
@@ -12,6 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz \
 	   file://CVE-2026-126682.patch \
 	   file://CVE-2026-126819.patch \
 	   file://CVE-2026-126956.patch \
+	   file://CVE-2026-131868.patch \
 	   "
 
 SRC_URI[sha256sum] = "a628d7c9d390568fb76359975fa03f626ce57f10dc17980e8e3587d7713e4ee7"
-- 
2.40.0

