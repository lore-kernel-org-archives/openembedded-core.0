Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8529.1794469140220300706
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 23:39:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JMkUjbYs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5776f851ea=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2mY05227726
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 23:38:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=vr8pwUlNH
	9QCjvYgLM/NZseFWE+mV1SCouC99RzK+zA=; b=JMkUjbYsym4UQgVkApxRVTYl/
	tWVSd44JjSAKnBh3B9EBV13RTQJe5TboxVbafWNxJ2mw6zFhdmPeLyptWRf0o66s
	NhKaQaSXsSWAUTh50x/EtrTkbTvfsN218xQXdiWH4nklxWdWnHHVPsn0acB7+GR3
	xOht/sVYGvrCYernmhgUfPRbrf5TNMkszH8Eby4uYJcw3BMXeDF/Bv/wb4Y5lNR0
	XCifc61/eDPJlyNtldx1fk241mc7JOYz6MNSHNfHVeZzPlnaJzzbrX9W1WQLc0EP
	C5g7M2SFYbstRnm4LdqiEjUrJjRGaUtFKWKvGLfp+cFOO0txLY045RndIZFjg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021088.outbound.protection.outlook.com [52.101.62.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ht4cjh1b2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 23:38:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFlFb1qUnc8XuxSp04cqke3CFPeE0cV/gtsc1bRA9xaB2dCdrp6lJvZ0S0571+8OVjVqBcNM7n+8waBaS+97+S4tgdn7WAbpiylgacPZ1nDkwVp96ZwpnlcezUA138A7Jpqsi+CC99haxjYgnbCRhzcLolMSQMhjFc26BYV6HvGHvGTCKacnwgL6P7j7UOwgvStb4jhrx3GGTMxtes933pkJyeHcpk7T429ezUKoHvCWLU93Sd6ul3+kUok2/s+AFlgJBY/Vlilk4Zy5C0zC/VD2KZcJU0xNDAdVfRtwPKz0MZFvcJ9eLRtlm9+J/xbhFFvWb0dd0rIretFDzVYpJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vr8pwUlNH9QCjvYgLM/NZseFWE+mV1SCouC99RzK+zA=;
 b=IH09rYgcy0rsg5jNxugQF/wElomW0mEWnlBwpbBcw+V0HgdyMep7Gk6aNOm8XQTUUB1XA5cKZI+Rwn9hVIMIKF04XX8r3tOPZotZSTHgYQep3mYlGP8+Hl632KLxdBw4UFPwwShznZwdD0++7x7QGPXbZbFTrZUypdx/wT9i25Z2MSuVJV0ILjJfFByY/VeK5Q1XBKzaa66FB0lzKEH1hN63Zfhs3NW5but7YaWbBXQifRZGftbrZk4vTM4ppcsDpaGQBIzyyX7Q5a7khG6/EBOxt1C/O+/S3RsPIU78n+DlB4Ch+JXNDXIsbeDx/vma44YzOgZrGIgd7cyByxvMaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by PH8PR11MB6927.namprd11.prod.outlook.com
 (2603:10b6:510:225::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 07:38:25 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%6]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 07:38:25 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, richard.purdie@linuxfoundation.org,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] oeqa/selftest/gcc: Introduce SSH multiplexing for parallel tests
Date: Wed, 11 Nov 2026 23:37:56 -0800
Message-ID: <20261112073756.1119386-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|PH8PR11MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c70a85-459a-4ea2-96df-08df408fef42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|52116014|1800799024|366016|18002099003|3023799007|6133799003|11063799006|261026121527099003|261022105027099003|261026140227099003|261022075727099003|261009223027099003|261028144727099003|56012099006|261021123027099003|261021121427099003|261102123227099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info: jZgPpsWzCMHJYzi9kGoIrdY9rQu9pNPB/lRitbp1vKmAdMTiA8mG1zWMPUDSGXm8uni21y/lQ1m5IixlAIpbnBA6d6jun5tzbAttBrqcDha58O+U7puKV6DUXoj6dRWeVdlVlt2SMWCOG9ovzbJqLSluBZ6Xzv7lZxyaj/HxIAX6HQ18UWjFtrYlusfrWM8RxXqaexjM1feKeP7u5BJABSwR5VCXYXmt1WodWO9WOC57PToBxhhBk0glkkaybW/5LDx6dBWvmrnd4wv+1kr1xdoI8xaW/9hMDDjLJLziNOlPRlobYl8SvnrUAjAtDwoIZVSJIZDvhCJXD4PDqPiR6qJmeH8+H53x7UzHC1/IV/aK9vwBscSif04OY4NvlNdeDFfUgjQ+fUjwYWGB1ZCeNgus0XcuJ3QGqRxntoDmR3JuGtgtpeekKWZ1BMX5jkVnK5UfWHIQoQbGg/cTy/+uuTe2QR7AESMCm+WpC+EhbrbqmrZHI9+OetO1dPdpDXKkGAjEiymwksitxd3AkFyb+4KPaRoP5YS22+3MhuUqkDsp27HFUYEIyWviz84u/JVGuXe8XS8TQo0SN9H4pij0b3R78+SeDHq7RDVYuTzOItd4wbcLU1BVp7XbF6kiJV1zyL4Cvm01soFP34MtTmwuuLpEJAJqynS4jDNCwLJr3B2ccYI7TsLRsrY2KxgH/nj2f9pED1u6znB9Wqoy0gOVT6PCVvWhf6no5HokN/ly8g8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(52116014)(1800799024)(366016)(18002099003)(3023799007)(6133799003)(11063799006)(261026121527099003)(261022105027099003)(261026140227099003)(261022075727099003)(261009223027099003)(261028144727099003)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(38350700014)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mjtlYZkJu45d2mf8v5W9tCXXiGvAWhntWU8qfNLl53L2iVWo4T1Qm6KXnOQs?=
 =?us-ascii?Q?w9AKNcVRzc0haGoQjxWUFSeJd0KvFS/0FK6EEjayiOVl3w9XS0+0QCicYbZy?=
 =?us-ascii?Q?uU3O2goevgFUTaux5OL10kchirmi04GjMkFscMHqkQvnokjSHchFG+m7Voeu?=
 =?us-ascii?Q?ZswjZdFr5OsNJKPTZMfgDOZy1H4FtUpZ4Eo3xHYJ0BXhUFnU2M2G9fP0zM+w?=
 =?us-ascii?Q?2pGdScgfEJVj/R3erVG0UqXwvqAzDM/R3BoB9pLENgRWzL310KreeJCgQVpQ?=
 =?us-ascii?Q?HJqQi7q0hmfkpYnh1QUlagBSTOrQ3TinJs9pPoRra37DTmijr3C7czJHXQOs?=
 =?us-ascii?Q?eKHZy6ltP3lD07t3Q5ziD8NLCTlH7xbrFPfpoe9uLZxnz2lpQDefVUQZhUO9?=
 =?us-ascii?Q?p2mAhY0wq5dypYRVpAzgDTQOg2uyOMJBWkPNf/qp4wsjZtQc7/Ccj3MQRhQr?=
 =?us-ascii?Q?JzI8GvyuRQIcblyFbOZHbMsavJyVgiGTcVp6+L0MoJarWvIFsnupJ6by+9YM?=
 =?us-ascii?Q?CmX3695G7OiSIDS4bec055CeKZZGV2Dc/sldOYL38Twzb0uOU6kH0cfuKKI1?=
 =?us-ascii?Q?sihaZ4ts+s+cOtIfhwncHU+XdKw8a6jiEK1MmgTVJ0nOnSh1peQXc3jTLqJN?=
 =?us-ascii?Q?17dECMrOWPjSoNe7KrU6w7Z+31emCtWD08MB8C+0vvxrWrs8urnGdVb86ga4?=
 =?us-ascii?Q?WkPHCPxC8s7SVy5IR+RKgmixIs6GP+0hcRi6IYlmT1UQ9rTUSscCBIR8xh8d?=
 =?us-ascii?Q?DNzwZbwAC27N+w1ZGZRb2hmwnCKcNM/3Dvi9/FS1cchilU6zESiPBhr9c2yM?=
 =?us-ascii?Q?7Q26/5/eBkfQIC71UP5DCvqbpdTFKy2auWR1oqTmZe71c9VLGiqNPq+rRZd4?=
 =?us-ascii?Q?Pkee3zr567/j39GbhPRvaR1z7BP3cZHz8Pc1WQvXjDsNp49tjnekPyaeKTMC?=
 =?us-ascii?Q?STqOd7zlWHA2ul8WP7C2zD648WLe3AzX5/P7N+m5LQZKn/UEqkCLq8TvV0hu?=
 =?us-ascii?Q?lcprMczL7HiYa8ZTBqga3bxb97rIblHvsNVZOPoiEpFnC/8Di74leAQicZUG?=
 =?us-ascii?Q?JQtlpxVc/K92DNZz3CPAFVhQgl2F1bwRRpyCgEIPn+dh0w0WwK2KN/GZ1+/e?=
 =?us-ascii?Q?8aW3k0ZeqbAKq/H8bl1QfgBmxKJTS50I18JtESNlA8cyE/1UIHzTrfnFyKqe?=
 =?us-ascii?Q?GCEpFhzFyETseOfR7H8SxtAcZPfQzoLBYYt0zbII9aUeM9obRt0XzKxyYQ0/?=
 =?us-ascii?Q?V6h7ngvgbhHehL7O/rXWjh9CGyobjoVxMsflUnRnb9ziiwbNLWnYBuAf7/MB?=
 =?us-ascii?Q?Wclf2qAPefRZrXWr9m7mhIwiEJBnVeiL0jbRl16zqzaLe7QevTKs456B2f3A?=
 =?us-ascii?Q?o0mSewtuhg/Kt69Tz5IH5dtw0j1bSA1VrKy/8kDPqlLW6CvZwxVIAdYoV95f?=
 =?us-ascii?Q?+Jt02rsSl203vcA9s05EGWYAY437dxmODjYP1ypr1fNCTFGKtI2mrQLkQLOM?=
 =?us-ascii?Q?R3LphmbxfhTXseQ2hgZzwXipksNSPFOsvh6oghqjYahDqa+cwkQPguLLSa0B?=
 =?us-ascii?Q?AQk3bdKZpKPRpRLXWYSevCZmE7CVWAThat2LECNgrGKLG+G0UI+9Ob/eyqzR?=
 =?us-ascii?Q?pgtAKHBD9sUj56Yo8ozVkq6e50916rLBWIqueDaJCiqJzM0xzKbFhDw8gPsR?=
 =?us-ascii?Q?7q2sODwdMGdceKK3l5U3Ro7nIO8976+J2Yr+MoQn7bZhQ2BtlO2NT7D7TOF/?=
 =?us-ascii?Q?fWsEQwVHC3pW+aCbjhNifJfRAUByh4U=3D?=
X-Exchange-RoutingPolicyChecked: ugHzwnNXbJKWysllLPbxI+Ry/8ohuGjP+WcxbbAyttumiKhpwfopxaPyDhZhE73SR9l1BaAnmbB+7br6lNLNHql5HxkHiPK1287gbhT7RV9IxoSYq13k7kwgW+1/ekuuHnaOMJ79aNVsIwgvWw7ZSzQand438K6TwUC+cK9lt9O1Q9AlidA52O+tahem0DlANPmNDh4LIAO/osFXnt+rZ+2pq/TlfHcb/Bd8fEd3NxLNObag7TuPgUoyT1D1tabdVmkEHrGa6GzT4Az7hMBx+ODuWpmtEbp+qqixSKr36N5ICdIy4SZLdSINRQ9W6xzH9il36INfPhJ/9gF3atFUgQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c70a85-459a-4ea2-96df-08df408fef42
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 07:38:24.9334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjTDlBjEkFkoogL/nY8IB7d8aQRx6Qh8a0UlT7Sp9VPL25Cipm/kImWqmg8JVao1/AOe6dVaJbiqJ99j0fSTHVvpN1DA3XXDo/QScpwSpFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6927
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: PU_n6Kg4dsOWBuTRfKudaUQY4APUd371
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMCBTYWx0ZWRfX53dxWAMDTnrM
 xSE2It+w0ER8M5scTJGy6x2jGm3vo3pYsSr2sZqHvpojzO6c/dI6nVOMG8eKTbay/UfRqCLN9WN
 VZIz+2AaYyuIldEC6gCG4PcXuPseTK2EsZqJDoDqie8urnmiKSKx
X-Proofpoint-GUID: vl3gVY5hg-hJO3GepMFH5N_lZQTbQh6x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMCBTYWx0ZWRfX4t+EjjA5Oi3g
 ulsjErkXbFFGnPXAka8ZdH+gQ/C7KpOlp+JR7lIqjV4D0M4kqaM/da7V8gMS4oaizZJv9cxOu01
 xpeOXaQzE5MYscTAOo6TefCF7ys09Sa1NN5W1IYa01fxTOyRDMLw10aTSVFepBqe7ygUqBZhN/5
 z1PeT01Yf1zP9yf1Z0u+sXUWTQgSAsI3/9SpKoAW7xtTmbLkxZweqQ1kwCrCCkImzafXgdnMOdh
 mEF84SAuRsMrV0ASMscVSF14bnt1eqivxVLV9Y8x2JWKayo8zlYuEG2sGS4m8YSS+ar1zmLC0JI
 mmFzpScgyf/BRrraSheQz9CXyhOMnTfxcgiRS2DgfwyIzGiFhhZmRXyHc83mH9HI+Xisg5Nq9gU
 /SBmZG9RjxF/EyL9pQSoBC/y+mRmCtjDtDrhqSjhYZyT5UxCrV2z90tJNAwB2rTOMfc0sNPXBHw
 RCOxJCjfSGnkCAuW+RA==
X-Authority-Analysis: v=2.4 cv=X9bHu2Te c=1 sm=1 tr=0 ts=6af56d13 cx=c_pps
 a=cooaqHSabeYmkmrBM5QRww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=lYZwt-qtJh_157rB7XIA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 07:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250076
Content-Type: text/plain; charset="utf-8"

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The removal of init-system-helpers-service from initscripts in
commit 674355759fdb[1] caused the service command to become
unavailable. As a result, restarting sshd failed, and the
configured MaxStartups setting was not applied. This caused
system-emulated GCC tests to fail with UNRESOLVED results.

Although this issue was addressed, intermittent SSH connection
failures were still observed when running tests in parallel
across builds which is addresed by ssh connection multiplexing.

Introduced SSH connection multiplexing to allow parallel GCC
test shards to share a master SSH connection, reducing
connection overhead and avoiding connection startup races
between ssh and scp.

Increase sshd MaxSessions to support the parallel sessions
required by GCC tests. Use a per-build ControlPath to avoid
conflicts between builds and clean up stale control sockets
before starting a new test run.

With SSH multiplexing, the GCC test build time was reduced
from approximately 8 hours to 3.5 hours on a local machine.

Test results:
+--------------------------------+---------+---------+---------+
| Metric                         |  Before |   After |   Diff  |
+--------------------------------+---------+---------+---------+
| # of expected passes           | 181458  | 210555  | +29097  |
| # of unexpected failures       |   3771  |     56  |  -3715  |
| # of unexpected successes      |      2  |      2  |      0  |
| # of expected failures         |   1512  |   1550  |    +38  |
| # of unresolved testcases      |  21501  |      0  | -21501  |
| # of unsupported tests         |   4102  |   3317  |   -785  |
+--------------------------------+---------+---------+---------+

Autobuilder results comparison with random old build and
new build with ssh multiplexing change.
+----------------+----------------------+---------------------+----------+
| Test           | w/o SSH multiplexing | w/ SSH multiplexing | Diff     |
+----------------+----------------------+---------------------+----------+
| test_cross_gcc | 40m 13s              | 21m 07s             | -19m 06s |
| test_libstdcxx | 30m 38s              | 28m 32s             | -2m 06s  |
| test_cross_gxx | 20m 49s              | 13m 24s             | -7m 25s  |
| test_libgomp   | 32m 36s              | 9m 09s              | -23m 27s |
| test_libatomic | 6m 52s               | 6m 36s              | -16s     |
| test_libitm    | 6m 04s               | 6m 29s              | +25s     |
+----------------+----------------------+---------------------+----------+
| cumulative gcc | ~2h 17m              | ~1h 25m             | -52m     |
+----------------+----------------------+---------------------+----------+

[1] https://git.openembedded.org/openembedded-core/commit/?id=674355759fdb07f3d17a053de18cddb7ce758c62

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/gcc.py         | 22 ++++++++++++++++++---
 meta/recipes-devtools/gcc/gcc-testsuite.inc | 16 +++++++++++++--
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index d01a791cb5..efae5bedf4 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -3,6 +3,8 @@
 #
 # SPDX-License-Identifier: MIT
 #
+import hashlib
+import subprocess
 import os
 import time
 from oeqa.core.decorator import OETestTag
@@ -84,10 +86,24 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             # validate that SSH is working
             status, _ = qemu.run("uname")
             self.assertEqual(status, 0)
-            qemu.run('echo "MaxStartups 75:30:100" >> /etc/ssh/sshd_config')
-            qemu.run('service sshd restart')
 
-            return self.run_check(*args, ssh=qemu.ip, **kwargs)
+            # Increase MaxSessions to accommodate concurrent GCC test shards sharing
+            # the SSH master connection.
+            qemu.run('echo "MaxSessions 200" >> /etc/ssh/sshd_config')
+            status, output = qemu.run('[ ! -f /var/run/sshd.pid ] || kill -HUP $(cat /var/run/sshd.pid)')
+            if status != 0:
+                raise Exception(f"sshd reload failed (rc={status}): {output}")
+
+            # With ControlPersist=yes, never times out on its own, so close it
+            # explicitly once all test shards have finished.
+            controlpath = "/tmp/oe-gcc-ssh-" + hashlib.sha1(get_bb_var("B", "gcc-runtime").encode()).hexdigest()[:12]
+            try:
+                return self.run_check(*args, ssh=qemu.ip, **kwargs)
+            finally:
+                subprocess.run(["ssh", "-O", "exit",
+                                "-o", "ControlPath={0}".format(controlpath),
+                                "root@{0}".format(qemu.ip)],
+                               stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
 
 @OETestTag("toolchain-user")
 class GccCrossSelfTest(GccSelfTestBase):
diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index 4859d6d84c..db08a01f3d 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -80,6 +80,7 @@ python check_prepare() {
         return "\n".join(content)
 
     def generate_remote_ssh_linux_config(d):
+        import hashlib, os
         content = []
         content.append('load_generic_config "unix"')
         content.append('process_multilib_options ""')
@@ -87,8 +88,19 @@ python check_prepare() {
         content.append("set_board_info username {0}".format(d.getVar("TOOLCHAIN_TEST_HOST_USER")))
 
         port = d.getVar("TOOLCHAIN_TEST_HOST_PORT")
-        content.append("set_board_info rsh_prog \"/usr/bin/ssh -p {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR \"".format(port))
-        content.append("set_board_info rcp_prog \"/usr/bin/scp -P {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR \"".format(port))
+
+        # Use SSH multiplexing to share one master connection across GCC tests.
+        # Keep the master alive until the selftest explicitly closes it.
+        # Use a per-build ControlPath to avoid conflicts between builds.
+        controlpath = "/tmp/oe-gcc-ssh-" + hashlib.sha1(d.getVar("B").encode()).hexdigest()[:12]
+        # remove stale socket left by a previous stopped run of this build
+        if os.path.exists(controlpath):
+            os.remove(controlpath)
+        rsh_mux = " -o ControlMaster=auto -o ControlPath={0} -o ControlPersist=yes".format(controlpath)
+        rcp_mux = " -o ControlMaster=no -o ControlPath={0}".format(controlpath)
+
+        content.append("set_board_info rsh_prog \"/usr/bin/ssh -p {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR{1} \"".format(port, rsh_mux))
+        content.append("set_board_info rcp_prog \"/usr/bin/scp -P {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR{1} \"".format(port, rcp_mux))
 
         return "\n".join(content)
 
-- 
2.49.0

