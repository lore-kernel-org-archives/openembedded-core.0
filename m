Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C629CC28B28
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 02:18:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5528.1741832293651817987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 19:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5167d38173=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D1vFKR006917
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 02:18:13 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0emse2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 02:18:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcGq/1AY209C/kNM9KC9vvx0e1qpkG0l8UgiQYV6ESiN/voLsBQoyP1fFZKyXvM0FCRriR62KmbZGwurzumIY70WdoXUwg0eCCvNJ3ts+6m2gvMZ8tSVj5p9ZFMo2IYwQ1zenXs63R0Smhk6WYuO4VyvpIqMHvssInlW9aA+s5oGCFqcAEA6EF9fjBkH+K1gpBY0+XBVBOTdskRmcc/k9O2udSn/jpvslwpXPHGKdYusjQLBFk4dPR4UoCmsagaw21a6rqe/NyPkDLHGfSN7t4LT23uKKiY92iNTJz37ITiQNnfcW6CaerOBO7l77VgswBBGHxHz0OFCF4+QqcHaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpG7erbUfe7MGZEiIFMAnt9P+qGSuWqLBrzEYkd1WNs=;
 b=Ii5vObXVT7KOjapncAnzGLDkt4emwNbyN4riKZTMyPKuqbxsU7FjwBvKyb+UtakwXOcnXpEL+JSyJOmojdyeBqrubURZpf5OvLSMFhR9wPEprP1AxUuELaWDte5H3ntZU8xjule5/289K3X9EV8Z2zYQtYg+Mqd4ZZLsL38St5C/S3gyJWE8P1A7yE06+Z66ruDAkIEoxOxLvb5m4SFjSmBj6B7m2kzo2HPY/glCMOxO0wIKp7KFWffrVIld5CDSHDuJNSV/W5eIbozExgv+5OdokaMGxLMdQxa5xQsq4d0up2ezdOvr9WhQfb4UnuW/GOPycBKSHXcBaSnnbqpcjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by PH7PR11MB6555.namprd11.prod.outlook.com (2603:10b6:510:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 02:18:10 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%2]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 02:18:10 +0000
From: bin.lan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v5 1/1] babeltrace2: upgrade 2.0.6 -> 2.1.0
Date: Thu, 13 Mar 2025 10:17:51 +0800
Message-Id: <20250313021751.2313822-2-bin.lan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313021751.2313822-1-bin.lan.cn@windriver.com>
References: <20250313021751.2313822-1-bin.lan.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
 To CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|PH7PR11MB6555:EE_
X-MS-Office365-Filtering-Correlation-Id: 45805ea9-d870-4740-1daa-08dd61d54cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?W3KSgSJDN8a/eEGOu835gtx0JNDUY6JekmRb/YdCZTdfUcHn+g453fT/Qnzk?=
 =?us-ascii?Q?ORGuas5iJyuCYgFo9SUTomUGoA7gthbuRzmBv9nDuCFchkA/OCuPSvbHSgjk?=
 =?us-ascii?Q?6QiqsoD2YND07CQbZZK1MMa7Se4Gg1scoXmNLLvkeK20iuB8TylT++kVBERq?=
 =?us-ascii?Q?8FJdE7OskTlY865ZiSZD2GWvXr/YC2Q3xE2p1BoQ/EEZX3CQKoVCMf5FTSao?=
 =?us-ascii?Q?7NEWLDylmCrz4LgA+mVdFD8668BLE/yVluADqg5WAfy6xqAC8aUkNrsUExAI?=
 =?us-ascii?Q?FjJH5Xl9jfVgqv9rTcYZntODlWKJm0tiY2HuSfmvaVsoDBkvL+m6x3pL2y7S?=
 =?us-ascii?Q?OM1kRIjogBjTlbc+cIoDJLps4qbjEb2X3u8bX7Rq7v0HflUrGGgHfgcX2Z8J?=
 =?us-ascii?Q?pplaTNb3huPtpmxYWcs+QgldJyjo1iqdVtlF650lu9Vi8X1E+ABuiQAwLcKr?=
 =?us-ascii?Q?OyMEZQjj6XkUC95CzY8hYZYQN5xb7+pgbZ337tNFOc75gp8EpBinMAo8HbVk?=
 =?us-ascii?Q?Q6ErIlzVzFN30+MGjcx+vcxYVKnR6XYIFzRc9/23ghjQRcfMixdMkUWo4xr6?=
 =?us-ascii?Q?Fk/MxBMSu6nlnstyor2jDYI5O92naeE0MCAdBzNNvRfQBU07HlpCdIxtHA43?=
 =?us-ascii?Q?ms28FdUhKgLsBSyiai6I/SUbhw7bssWMkmcRJZYL3yiVnHJfbDo5H384DCCv?=
 =?us-ascii?Q?iACETUukKGYHsnGkWt90R6XF6u657AyzqM13Uc2pS5I/jxpM0xyrDeCFF5DA?=
 =?us-ascii?Q?E8VdYEWPWy8HMgmcAOY4F+F1Vc0KvcuAhqJWGq0Ld4WlTfIztkLBGEgNjLHq?=
 =?us-ascii?Q?mwn9R6gXVSEhpyD8ESNul2tWzvCsVNyr0i+Yj8n2+tLeLnubPqA+8vO4iuKw?=
 =?us-ascii?Q?e1qeh5pyGJR7Ck5G1wyi5gC9wK9v2EIgqHCZ8AtzZHbg0X+JRnafIPdtvcIJ?=
 =?us-ascii?Q?+RjQ+0G7KB91d5WYlX5UK6EDBCgZ4IYyDoAutqmFGe6DXwn9GlGTNns9/NgW?=
 =?us-ascii?Q?vSMKcTpuLgjG5k0JepM/u7HHv13qyF0pS1u+/xnPESBjl9NhkNbnUepzre56?=
 =?us-ascii?Q?Ql6uNpXy+d98r5tvNwG4ZGRoD/evb6MKqO1vZI/fNRDACi/31r6NmAS+Xhn8?=
 =?us-ascii?Q?yMvn5Pq1r5LzCPT70vryuyIz4oYyz/NtTyigeeBQxBOiU55fX1pJN/QhVAuC?=
 =?us-ascii?Q?5B4x5jUcg9XEdOZayU3jdz0tJKEI9xW4FrR9Ur6/wAEjtmjHZz1AqiqwB4Kt?=
 =?us-ascii?Q?i+yfprkkQgL25eWHcnpKGwuK5YdJpMxE6588AeZz9DEmfAkDvLo5Mr/lvHVx?=
 =?us-ascii?Q?4zygY9/cWQR5eUWUSoqwHq1I7kwCklA1DCmtohutoN9HW5YEP5SrpTEL5sqO?=
 =?us-ascii?Q?1ckbMUXqLh3lOyra/r+fH4Bezdt/OgOf5aZRzp6wVEkDCF6rIA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OZR7TZZD0ygURvf3micrAk/H5e2aF7YRnQtSoS8CqvWJPcN24FuOzZN8EUcS?=
 =?us-ascii?Q?55F+V66rjWzWTFkWzJt9HV/vWGPo5ZkqdoGUXzDNF9QZMbG0stMBUbVw2AC5?=
 =?us-ascii?Q?P3EF+l4NWANoM58yyl2qu2QPDu2fvO0kQAj8s+0lxFiozwy1rgl8vVyNT+iW?=
 =?us-ascii?Q?c0xpprdWLBGGN5NZp3jo4PSPYsD0iN48kIc8aUsEIrL6s7DYbUEcqdgZzJJa?=
 =?us-ascii?Q?KBhkd788Yrl7cr4egf6yBm/wMzsAFH7W9m+075Ec+QILnlxViueSj4lxIhwA?=
 =?us-ascii?Q?rFW2weCIO4/JkIXdLgas04VbKpyW/7a4+6S/ztI2MLSLQ8wRAQ1V6saVpYDt?=
 =?us-ascii?Q?QfxF2c79i9T94mkPxFWhkpTJ8iLDyZIRzRbUWaZcRTZaDp4z7H1bs3zKO1yY?=
 =?us-ascii?Q?Iyb4FAA8bvdOn/PXr5dqHXy5iSc9I2R0n4adursfcotsb9uYkTH0AsSnWcVm?=
 =?us-ascii?Q?9pnLKJs5E1RkelctRqWsSx2nD1ZMy1dLgMoOQie94VoZuOaLmF7/h4C0TdPn?=
 =?us-ascii?Q?rcEO64qM50zZ29S+yHLn+ENm8C1e5hAiPoIa1BiY+DLGV6pTEVX2qGRaHtDb?=
 =?us-ascii?Q?vwkJdCQ43kGJ0e+kx7oMlq9ndVeq1OA0n+3bPrXbeTrhTX9sSF3M2UFQ4Iy9?=
 =?us-ascii?Q?TjNcIPtIR9gDR+QOU8rbYX2pFDnNe8EasZSTvjxgxswsy069FTQkAt5aUMOR?=
 =?us-ascii?Q?Gk3kzS6JLkt2kV7mB78uuoNnVk16Cy3dGnfwiV8e/7N08AdAlYWHzVm0ayZi?=
 =?us-ascii?Q?vceSTK38UC5b2o8W106chSEZv/a86F2Rn2u4+XldlHeOsCrPBYQ2VKO/8vMA?=
 =?us-ascii?Q?5ZSTT8HncLWJQZhZ/3F+mYvChRO9mSXr977DR2akYhEWAb/obCUBGAmV9r8f?=
 =?us-ascii?Q?p6P3Q80A2Ub5T/4/ti5EFL0GgfPtIwHu49KG8HLRVpdQB40JoO70+oXr5uL/?=
 =?us-ascii?Q?W9cvT+cXFp0iW7hycKlAUK3NgpgxUv0e9quWOGiyUS3jzfRTchcEAnS0D6Uo?=
 =?us-ascii?Q?Ztm+jyCMVie2LmGEaTBb//B9N8dKtk0sqfuocRfqQTNk4w8sBxtaAq0sPBTw?=
 =?us-ascii?Q?a97ipPl729gSAm0stjBL4b7pue62hRSTg7JgDgz4XHIMw9fcDQio82rCHhgC?=
 =?us-ascii?Q?Pe02qFAamNrfnh7No/Yixjigw9OqezQIDRktAwP/EZB2rrYvqLwAY3Hff7ec?=
 =?us-ascii?Q?BCaExO7Ri8QVfr5hByInd4ckr6ucVUm+GDQPHfuEX4auGxovSsmy5YeupOK9?=
 =?us-ascii?Q?5+GIoW+H0jssGOE0R7WvJIzJX5n0KpGcAnHrqa9RnVVzikv8t/dhRMR7dfv/?=
 =?us-ascii?Q?sLixYkFP7cx/W5G/NSAAta8z4u50Lu9HtAvyhZ7qgmeDyTkKVsxb4BKsgonY?=
 =?us-ascii?Q?zKRvR7gvXyThNMqY9PwldtNrYhWTM5rs4x1yCCh67q7C340NAcSCYoPCgi8M?=
 =?us-ascii?Q?Sv7m+4uGQz/7MdHua76UAzjV/vgHtoocIsTmKg3G14ITYZwj93k2d04uqwc9?=
 =?us-ascii?Q?TNaEpuCaYJZQdVaJ5k1CGM8xioQcpxHckqI07vS059HxQh4qFtemhZjVnfSy?=
 =?us-ascii?Q?t7Ga8hT3zjUxGlG5B+FiRuzMR2+P5lJGCl06NoU3Qq7Nbw2Be95DSS/QuD22?=
 =?us-ascii?Q?8w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45805ea9-d870-4740-1daa-08dd61d54cdd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 02:18:10.5603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhk8kIB2yt4vradwd7G1hAkRxUjlUdMcFUip1yQvkoLTkJTCTH3EJWj9+qb+sK6xd3H9SQmQVsv++zBafntRv50db+5sP+74KVBFCmkckVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6555
X-Authority-Analysis: v=2.4 cv=J6Gq7BnS c=1 sm=1 tr=0 ts=67d24064 cx=c_pps a=WCFCujto17ieNoiWBJjljg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=U40Yx87jAAAA:8 a=a5LkSv8FAAAA:8 a=t7CeM3EgAAAA:8 a=fk1lIlRQAAAA:8 a=pGLkceISAAAA:8 a=7d_E57ReAAAA:8 a=XIzVovBty1zWdf5VwuEA:9 a=_PE9Q_0Z8bzuyU0-:21 a=BBahhS0D0WQA:10 a=yv_D6YSC6K1Ih23S2Yuy:22 a=E2cWBXyb0kjxxB1PlMdk:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=U75ogvRika4pmaD_UPO0:22 a=jhqOcbufqs7Y1TYCrUUU:22
X-Proofpoint-GUID: 4xqLR5bjA3QDW0gCpuy3ypXWcMiVsLX6
X-Proofpoint-ORIG-GUID: 4xqLR5bjA3QDW0gCpuy3ypXWcMiVsLX6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503130017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 02:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212733

From: Bin Lan <bin.lan.cn@windriver.com>

Refresh 0001-Make-manpages-multilib-identical.patch with
correct number and upstream status. Create a new patch
0001-tests-fix-test-applications-in-cpp-common.patch
to fix test applications in cpp-common are needed to re-build when
running in an embedded environment.
0001-tests-do-not-run-test-applications-from-.libs.patch is deleted
for the commit log is not very accurate and the line number is changed,
is replaced by 0001-tests-set-the-correct-plugin-directory.patch.
Use 0001-tests-set-the-correct-plugin-directory.patch to set the
correct directory of plugin shared library.

Copy the trace files (*.ref) the metadata files (*.mctf) and json files
which are required by test cases from source directory in
babeltrace2_2.1.0.bb. Set the correct test environment variables in
tests/utils/env.sh when running in an embedded environment. Remove
"GREP=grep SED=sed PYTHON=python3" from the file run-ptest for these
test environment variables are set in tests/utils/env.sh.

License-Update: add new license BSD-4-Clause GPL-3.0-or-later CC-BY-SA-4.0 PSF-2.0
Babeltrace 2.1.0 is a major change. Babeltrace 2.1.0 is released after five years
of development after the release of Babeltrace 2.0.0. The licenses did change
significantly.

Changelog:
Babeltrace 2.1, MIP 1 is available and adds many functions
to support CTF 2 features.
The Python bindings wrap all the library changes in the same
systematic way as in Babeltrace 2.0. Add type hints to the
public API to assist with static analysis of your applications.

Details about the 2.1.0 release:
https://babeltrace.org/docs/release-notes/babeltrace-2.1.0-release-notes.html

Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
---
 ...001-Make-manpages-multilib-identical.patch |  12 +-
 ...not-run-test-applications-from-.libs.patch |  28 ----
 ...-fix-test-applications-in-cpp-common.patch | 129 ++++++++++++++++++
 ...sts-set-the-correct-plugin-directory.patch |  30 ++++
 .../lttng/babeltrace2/run-ptest               |   4 +-
 ...eltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} |  35 ++++-
 6 files changed, 198 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} (69%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
index 2401b176e6..c2b76b1ed5 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
@@ -3,17 +3,20 @@ From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Mon, 9 Mar 2020 21:10:35 +0000
 Subject: [PATCH] Make manpages multilib identical
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://review.lttng.org/c/babeltrace/+/14222]
+
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
 ---
  doc/man/asciidoc-attrs.conf.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/doc/man/asciidoc-attrs.conf.in b/doc/man/asciidoc-attrs.conf.in
-index ad1183f1..e11c7031 100644
+index 88fb13ce2..27858b720 100644
 --- a/doc/man/asciidoc-attrs.conf.in
 +++ b/doc/man/asciidoc-attrs.conf.in
-@@ -1,7 +1,7 @@
+@@ -4,8 +4,8 @@
+
  [attributes]
  # default values
 -system_plugin_path="@LIBDIR@/babeltrace2/plugins"
@@ -24,5 +27,4 @@ index ad1183f1..e11c7031 100644
  enable_debug_info="@ENABLE_DEBUG_INFO_VAL@"
  defrdport=5344
 -- 
-2.24.1
-
+2.34.1
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
deleted file mode 100644
index 805dde8064..0000000000
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 582713cc9a013481eeef253195d644020f637ec4 Mon Sep 17 00:00:00 2001
-Message-Id: <582713cc9a013481eeef253195d644020f637ec4.1583403622.git.wallinux@gmail.com>
-From: Anders Wallin <wallinux@gmail.com>
-Date: Thu, 5 Mar 2020 11:20:04 +0100
-Subject: [PATCH] tests: do not run test applications from .libs
-
-Cross compile specific change
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Anders Wallin <wallinux@gmail.com>
----
- tests/lib/test_plugin | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/lib/test_plugin b/tests/lib/test_plugin
-index 652c90cc..1f817c50 100755
---- a/tests/lib/test_plugin
-+++ b/tests/lib/test_plugin
-@@ -26,4 +26,4 @@ fi
- # shellcheck source=../utils/utils.sh
- source "$UTILSSH"
- 
--"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins/.libs"
-+"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins"
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
new file mode 100644
index 0000000000..87f94fb087
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
@@ -0,0 +1,129 @@
+From 1dc81f272855d94e6a78f7d10ea952745d991aa9 Mon Sep 17 00:00:00 2001
+From: Bin Lan <bin.lan.cn@windriver.com>
+Date: Tue, 11 Mar 2025 17:19:11 +0800
+Subject: [PATCH] Tests: fix test applications in cpp-common are needed to
+ re-build
+
+Test applications in cpp-common directory are needed to re-build when
+calling make check in embedded system. The following error is shown
+when running test applications:
+make[3]: *** No rule to make target 'cpp-common/test-c-string-view.cpp',
+needed by 'cpp-common/test-c-string-view.o'.
+make[3]: *** No rule to make target '../tests/utils/tap/libtap.la',
+needed by 'cpp-common/test-c-string-view'.
+make[3]: *** No rule to make target '../src/common/libcommon.la',
+needed by 'cpp-common/test-c-string-view'.
+make[3]: *** No rule to make target '../src/logging/liblogging.la',
+needed by 'cpp-common/test-c-string-view'.
+...
+make[2]: *** [Makefile:1274: check-TESTS] Error 2
+make[1]: *** [Makefile:1805: check-am] Error 2
+make: *** [Makefile:1033: check-recursive] Error 1
+make: Target 'check' not remade because of errors.
+
+Create some new shell scripts which are used to call test applications
+in cpp-common directory. Then these test applications can run without
+actually examining the source code.
+
+Upstream-Status: Submitted [https://review.lttng.org/c/babeltrace/+/14213]
+
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
+---
+ tests/Makefile.am                      |  6 +++---
+ tests/cpp-common/test-c-string-view.sh | 17 +++++++++++++++++
+ tests/cpp-common/test-unicode-conv.sh  | 17 +++++++++++++++++
+ tests/cpp-common/test-uuid.sh          | 17 +++++++++++++++++
+ 4 files changed, 54 insertions(+), 3 deletions(-)
+ create mode 100755 tests/cpp-common/test-c-string-view.sh
+ create mode 100755 tests/cpp-common/test-unicode-conv.sh
+ create mode 100755 tests/cpp-common/test-uuid.sh
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 2a4022bc4..c79b77b32 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -129,9 +129,9 @@ cpp_common_test_unicode_conv_LDADD = \
+ 	$(COMMON_TEST_LDADD)
+ 
+ TESTS_CPP_COMMON = \
+-	cpp-common/test-c-string-view \
+-	cpp-common/test-uuid \
+-	cpp-common/test-unicode-conv
++	cpp-common/test-c-string-view.sh \
++	cpp-common/test-uuid.sh \
++	cpp-common/test-unicode-conv.sh
+ 
+ TESTS_LIB = \
+ 	lib/test-bt-uuid \
+diff --git a/tests/cpp-common/test-c-string-view.sh b/tests/cpp-common/test-c-string-view.sh
+new file mode 100755
+index 000000000..9c2ca5818
+--- /dev/null
++++ b/tests/cpp-common/test-c-string-view.sh
+@@ -0,0 +1,17 @@
++#!/bin/bash
++#
++# SPDX-License-Identifier: GPL-2.0-only
++#
++# Copyright (C) 2025 Bin Lan <bin.lan.cn@windriver.com>
++#
++
++if [ -n "${BT_TESTS_SRCDIR:-}" ]; then
++	UTILSSH="$BT_TESTS_SRCDIR/utils/utils.sh"
++else
++	UTILSSH="$(dirname "$0")/../utils/utils.sh"
++fi
++
++# shellcheck source=../utils/utils.sh
++source "$UTILSSH"
++
++"${BT_TESTS_BUILDDIR}/cpp-common/test-c-string-view" "$BT_TESTS_BT2_BIN"
+diff --git a/tests/cpp-common/test-unicode-conv.sh b/tests/cpp-common/test-unicode-conv.sh
+new file mode 100755
+index 000000000..df490b2eb
+--- /dev/null
++++ b/tests/cpp-common/test-unicode-conv.sh
+@@ -0,0 +1,17 @@
++#!/bin/bash
++#
++# SPDX-License-Identifier: GPL-2.0-only
++#
++# Copyright (C) 2025 Bin Lan <bin.lan.cn@windriver.com>
++#
++
++if [ -n "${BT_TESTS_SRCDIR:-}" ]; then
++	UTILSSH="$BT_TESTS_SRCDIR/utils/utils.sh"
++else
++	UTILSSH="$(dirname "$0")/../utils/utils.sh"
++fi
++
++# shellcheck source=../utils/utils.sh
++source "$UTILSSH"
++
++"${BT_TESTS_BUILDDIR}/cpp-common/test-unicode-conv" "$BT_TESTS_BT2_BIN"
+diff --git a/tests/cpp-common/test-uuid.sh b/tests/cpp-common/test-uuid.sh
+new file mode 100755
+index 000000000..8c65daa94
+--- /dev/null
++++ b/tests/cpp-common/test-uuid.sh
+@@ -0,0 +1,17 @@
++#!/bin/bash
++#
++# SPDX-License-Identifier: GPL-2.0-only
++#
++# Copyright (C) 2025 Bin Lan <bin.lan.cn@windriver.com>
++#
++
++if [ -n "${BT_TESTS_SRCDIR:-}" ]; then
++	UTILSSH="$BT_TESTS_SRCDIR/utils/utils.sh"
++else
++	UTILSSH="$(dirname "$0")/../utils/utils.sh"
++fi
++
++# shellcheck source=../utils/utils.sh
++source "$UTILSSH"
++
++"${BT_TESTS_BUILDDIR}/cpp-common/test-uuid" "$BT_TESTS_BT2_BIN"
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
new file mode 100644
index 0000000000..7ac7582ad7
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
@@ -0,0 +1,30 @@
+From 32494b1726a881883cb6d317ab76d1ec3f1fa740 Mon Sep 17 00:00:00 2001
+From: Bin Lan <bin.lan.cn@windriver.com>
+Date: Wed, 5 Mar 2025 10:51:11 +0800
+Subject: [PATCH] tests: set the correct directory of plugin shared library
+
+The plugin shared libraries are put in test-plugins-plugins/.libs when 
+building in a host. test-plugins-plugins/.libs is not exist when cross 
+build. The plugin shared libraries are put in test-plugins-plugins 
+directory when cross build.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
+---
+ tests/lib/test-plugins.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/lib/test-plugins.sh b/tests/lib/test-plugins.sh
+index f83e42baa..939236393 100755
+--- a/tests/lib/test-plugins.sh
++++ b/tests/lib/test-plugins.sh
+@@ -14,4 +14,4 @@ fi
+ # shellcheck source=../utils/utils.sh
+ source "$UTILSSH"
+ 
+-"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-plugins-plugins/.libs"
++"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-plugins-plugins"
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
index 71a9c81bfb..a0bf33b75d 100755
--- a/meta/recipes-kernel/lttng/babeltrace2/run-ptest
+++ b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
@@ -4,7 +4,7 @@
 
 # Without --ignore-exit, the tap harness causes any FAILs within a
 # test plan to raise ERRORs; this is just noise.
-makeargs="LOG_DRIVER_FLAGS=--ignore-exit abs_top_srcdir=$PWD abs_top_builddir=$PWD GREP=grep SED=sed PYTHON=python3"
+makeargs="LOG_DRIVER_FLAGS=--ignore-exit abs_top_srcdir=$PWD abs_top_builddir=$PWD"
 
 exec 2> error.log
 make -C tests -k -s $makeargs $target
@@ -16,4 +16,4 @@ if [ -e tests/test-suite.log ]; then
     cat tests/test-suite.log
 fi
 
-exit $exitcode
\ No newline at end of file
+exit $exitcode
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
similarity index 69%
rename from meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
index 6a0052f779..648588d233 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
@@ -2,17 +2,18 @@ SUMMARY = "Babeltrace2 - Trace Format Babel Tower"
 DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
 HOMEPAGE = "http://babeltrace.org/"
 BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
-LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
+LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause & BSD-4-Clause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f6b015e4f388d6e78adb1b1f9a887d06"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0;protocol=https \
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https \
            file://run-ptest \
-           file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
+           file://0001-tests-fix-test-applications-in-cpp-common.patch \
+           file://0001-tests-set-the-correct-plugin-directory.patch \
            "
-SRCREV = "0a6632f77801f3218a288604c646f8a39cb0d2c4"
+SRCREV = "e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
@@ -33,6 +34,14 @@ LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', '-fuse-ld
 # coreutils since we need full mktemp
 RDEPENDS:${PN}-ptest += "bash gawk python3 make grep coreutils findutils"
 
+do_configure:append() {
+    # when doing cross compile, the path ${B}/src/plugins/ctf/common/src/metadata/tsdl
+    # is not created by the babeltrace2 build system. It is need when generating
+    # parser.cpp by executing /bin/bash ../../git/config/ylwrap.
+    # So make this directory after configuration.
+    mkdir -p ${B}/src/plugins/ctf/common/src/metadata/tsdl
+}
+
 do_compile_ptest () {
     make -C tests all
 }
@@ -51,6 +60,12 @@ do_install_ptest () {
 	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
 	find "${S}/tests/$d" -maxdepth 1 -name *.expect \
 	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
+	find "${S}/tests/$d" -maxdepth 1 -name *.ref \
+	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
+	find "${S}/tests/$d" -maxdepth 1 -name *.mctf \
+	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
+	find "${S}/tests/$d" -maxdepth 1 -name *.json \
+	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
     done
     install -d "${D}${PTEST_PATH}/tests/data/ctf-traces/"
     cp -a ${S}/tests/data/ctf-traces/* ${D}${PTEST_PATH}/tests/data/ctf-traces/
@@ -92,6 +107,16 @@ do_install_ptest () {
 
     # Remove architechture specific testfiles
     rm -rf ${D}${PTEST_PATH}/tests/data/plugins/flt.lttng-utils.debug-info/*
+
+    # Set the correct environment variables when running embedded environment
+    envsh=${D}${PTEST_PATH}/tests/utils/env.sh
+    sed -i "/BT_TESTS_SRCDIR/c\_set_var_def BT_TESTS_SRCDIR '${PTEST_PATH}/tests'" $envsh
+    sed -i "/BT_TESTS_BUILDDIR/c\_set_var_def BT_TESTS_BUILDDIR '${PTEST_PATH}/tests'" $envsh
+    sed -i "/BT_TESTS_AWK_BIN/c\_set_var_def BT_TESTS_AWK_BIN 'gawk'" $envsh
+    sed -i "/BT_TESTS_GREP_BIN/c\_set_var_def BT_TESTS_GREP_BIN 'grep'" $envsh
+    sed -i "/BT_TESTS_PYTHON_BIN/c\_set_var_def BT_TESTS_PYTHON_BIN 'python3'" $envsh
+    sed -i "/BT_TESTS_SED_BIN/c\_set_var_def BT_TESTS_SED_BIN 'sed'" $envsh
+    sed -i "/BT_TESTS_CC_BIN/c\_set_var_def BT_TESTS_CC_BIN ''" $envsh
 }
 
 do_install:append:class-nativesdk() {
-- 
2.34.1


