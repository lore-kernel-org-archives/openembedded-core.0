Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32246.1793878352785478610
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=A2Mu6rqF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=576967b061=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59uQCv1187692
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Nov 2026 11:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=zHxm6dlk14PqgnoB6wV8HQj7vbHbTKWZTXxs9xCuYFs=; b=
	A2Mu6rqFugwkAGuEPqSbCiIToTMPDWyrk40E+mBSO/+vNX/R9vhku1jglpFFpZIv
	XP+p5aEZ2WijLtycb8NNXDQsAFCo+bZ7KXNaZbQpF9S4IDbWohR0zBd4DE8QhV3v
	hYzfVRtoJGL3huRGMqjuhSI9e/FGl2NjhZtmyMPpT/qsGfV8Bo75+w+4BYq0/SkK
	eTqlTvY4Ff5c5/nK+Ksg5B5YpNTgDfhIafHNExRkTTL4G43/fHGiL4LpTiyPmrf2
	bWViANRK86xmqsnQ5UpcFe07Io1UpVbOW1fgc7LnPHcC7qD3AzQ9MCx1vCjGtGHh
	11BqBFnJEwJQ1yt2PAdhZQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022130.outbound.protection.outlook.com [52.101.48.130])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hram4hnn8-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 11:32:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gg40i/5pLpxbEOun/wYkxRZABuSb0dUmTx2eqXoEZmXl0yzUpjQenN0ABph3fTi8mEV4ArATUuE8DSS5+ILMoS3ZWCwl/FWa6DGJvsnxtu/PUMsEI0Q4igu6cJ1RpEkEruhc12Kwa/KAAZecqwPgYYKAPRo3bxB5m4s65+Z8vBI9YelU2uU7FF5ei6YIb9L1qyCPM7++b/zFMDb4YXrCgzuCCC5mVIkVj4sJdbBnbsLlWC6//ifAodQFz7gGuDZbBss1LYCjqcWqSwFysYGghIEZMNLZgwqHz4UJjIPD8bsMA1m5rcdnAfH4t1FkuqGXBPVhHM/HayaRXXxtQfkQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHxm6dlk14PqgnoB6wV8HQj7vbHbTKWZTXxs9xCuYFs=;
 b=muQkhLGs5a0MJWIQsp3I7GHgx3N+G7yRz7TZ2gbFTZDrYR8urkUGiwGijDlRCBqyDdHn9ANInlneqeAtYG5PqSmuS7FWbQ0Jhk4bWIioLvYfASpcsT/11PXYweUO03uLpAdlXjagdgpbE8qjPdy99lowofeDA12/p27q7jM/C2DgJpNAD965Rvt5u1nOUlOICn3brag/woWJV4mybpptK523mkluQ+CbKqxnL0KI6zwVpG8s6ocqCzKiu6Zn6Mb9zD0yR6qZE+mvksJoBxr9ogsUJKpegEDhIncP/4aT9mV6kVZMwO9gKKHSNo8YLjRal/lLMmmnAtAdg1TCQ4kXGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.8; Thu, 5 Nov 2026 11:32:26 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 11:32:26 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, alejandro@enedino.org,
        sundeep.kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        sunilkumar.dora@windriver.com
Subject: [PATCH 1/3] cargo-c: keep the build host triple out of cargo unit metadata
Date: Thu,  5 Nov 2026 03:32:00 -0800
Message-ID: <20261105113205.1571267-2-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261105113205.1571267-1-sunilkumar.dora@windriver.com>
References: <20261105113205.1571267-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b0acef-d783-44eb-2512-08df3b3077c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|260925022911599003|260925021911599003|261102123227099003|260925021311599003|56012099006|261022075727099003|261022105027099003|261021121427099003|11063799006|261009223027099003|261026140227099003|261026121527099003|261028144727099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: vw7mqMItNS9/8V+7OXueXFkg3YROQfezl9IiFkzjaVUv3mrIsic1H6FYdwdCCPf5YrMk4mJ1VZO+HIQzB7tkfVRWH1v7ivo2KdA/ZAWreWBWlWGXprmDDsSnlZUVykEJcSZxhdhJ6IJSpkv8sHw6meM5fmbjdYoKTK44F1X52uV1HYnmy8g4PA6KfYujqIvrga1yIjIG8txfJti3A9icSnhAIB0Ep+tdMk+b1pkIXEhgq38dHIfub4UDHPgoazyS5WByfmtqiH6ecA8Skxh/EPQBjcC+icGXUOBIMaRGxJm17r4p9zCdiyey2AZw2VQgIzaX5b5TvdMvoBChx7vIPxFcxwJllfWBkU5Pz4prZFtexWNDn6+BgoP5Qay8F4WRXdV0noIv+sVi/zyBav9N9TJ54uqWSwTu6YfjnhLwxIElpoCniESIK1QiD0KcEjDARW95IGmwDg4PW1wqm9hOskugq0H0z32uDXVgNptiVrTBY3oluQaoYy9lqetiTT749ZCfci986vOHiFp878xvjnIn/TK1Pt4vtU9gtQyeCpC519Q/PFqBfE0+BS+bDiSUzkHrJmuidi9b/uv4LlukQPHF8eC1czIiVeWnC8YSA1R8C/gNnbcdw1WO6bTY6v24GgHz0rKFZn/GzcXkonCDkT14egSJ/s6hWq3xj5BUO/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(260925022911599003)(260925021911599003)(261102123227099003)(260925021311599003)(56012099006)(261022075727099003)(261022105027099003)(261021121427099003)(11063799006)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FNngD2BkdxYuAj3HD2kqYVGDrEUM7lzYASCFSz9c1C5hnHp7bGvLEqN36NM+?=
 =?us-ascii?Q?OscuJqhtiHLclLzf58LZaVQxokkM3nCcJWm04HUt47/KC0tY/SbENlBJILwp?=
 =?us-ascii?Q?5KR3vEby0AL5oDys/HfzIOmodQJfgZcM/DA0eZJpvOKR/xB9z2d5OytFF2+z?=
 =?us-ascii?Q?oc5Bq7GMCy0Zq7pakzyuhwni9/l2jAak5UDuAf5v3MJnO6/L4C4F6q8KpYCC?=
 =?us-ascii?Q?FwzC/r+E2QCFSCVeqBUZel2hIJY6tw2w3XUANwlfcAayR1ITdq3aFTxWCtov?=
 =?us-ascii?Q?H5d8/tmIq8Wx2U056xFB+sOo1i0zxFGbxrT/CehLvEW0nvkV2MVYMh8uTa8e?=
 =?us-ascii?Q?00CUekUKTawWyvrQVoGTBu5PZlrqYHMtZ6sCUxYP58HRTpq7S1edR6snufIa?=
 =?us-ascii?Q?BvmjkhGDzFOdwqPJAEDWwmb7yyhR26wfKnI1XndCLBV/Gh9puC8AF0aODR28?=
 =?us-ascii?Q?E8hPmo7gXPzWHCjfQykdYk/wmJ8H8JQhCO38Hm8CopGfxa7ol2lCeX4p8huY?=
 =?us-ascii?Q?SN7474zaBmPWURBBhk4FoOQYt0aLZlvoHcwR1v1iHmx5lG/JwCg+1XAa/CKX?=
 =?us-ascii?Q?2H/3NmP/i03kDMA36jvKOsqjRrm8ManT4faj/1DWW5JjJXN7eefBePJLK4rp?=
 =?us-ascii?Q?4Zj7ZEKC/AIGSvwxy6HzQa1+84Jke5gDSsY8fC1tW9nSe8FBdM6YIksCwiPI?=
 =?us-ascii?Q?SKfH2WIQMmteNosye6zpQdPF80vkn07zPEkto1C3dTYTdyUGF8AQ02L9cFId?=
 =?us-ascii?Q?OA97SavxaVGINTPlVCRQ9/XfMXkINvbtOTXVHopOBBLAWlrEbw42bTMVj3Gg?=
 =?us-ascii?Q?fASAFgkliIeKaN51b1HTM1JAveBtdL3cWzrH4ox3Gqy0qndEnYeG4XFD1IyF?=
 =?us-ascii?Q?0KPX7888+014U+8LD9ScUKgSdpXV7AMnRApY22rzTJU0yoaSGeItWavzsJqL?=
 =?us-ascii?Q?7oFPctC0ww3ErjAYbG/EUbgqP58s8FvHEsI71Js1igsURQuqzil5URfrd83M?=
 =?us-ascii?Q?lqYWzLAmqTDXkh7AvH+/jkc0LjNqZ7Bh8/C1COhadMuJuLre2ctmniwWW0hO?=
 =?us-ascii?Q?/Pn1zccDbtgSOti29En/p2Aw4FhxZuOohlhhZo5A603ExM0nI8nP6/j9Mm3c?=
 =?us-ascii?Q?Udp09KgKkiu1bLlh9sNx+2CNYIxTdCI0DFjVjQ+c++wYRDu9xSfEHEVBm71D?=
 =?us-ascii?Q?mudFa/X3dp7EHT959DIbV3LbhKlWJbUSiyKFJPnM1TM4yO0GXVQkXZeG7dOy?=
 =?us-ascii?Q?DqhILIT+338n80OXxB8ftOMXrPwY2o9/fD7tgS1Y2sNt6ewK36hv5M2uAXUf?=
 =?us-ascii?Q?mgTANffGDgCYQ5UyHv6P1njRqtuMxagEP/ggE78qgoopY0KeobsVSPMCagCq?=
 =?us-ascii?Q?T8BggpcHojs6c9173QH1k/QP/dzQap729e8GwaDECei/qVCKx5olSm0mfEgB?=
 =?us-ascii?Q?PK5ymmgUm2HjrjxYM1Guaq2zS7AIm/DOjovXLaqNaw0Gr1w5rZvQeXLIzRpN?=
 =?us-ascii?Q?69JynQ6jKcAVfI0EnTBfXmonpg3CSVHUmdaKUE34wdDDJ4TO5y9FgSAd6M4G?=
 =?us-ascii?Q?qiqiTSqxDzvsmhFOe1/bLzgSqBBIUZT5fRaaoqbQxSm3WtC4voMnO7cO/2sV?=
 =?us-ascii?Q?Xv+QxXdQo3wQ/V4WQo6NH5CD1p+Hq9jLZBtFJlFigByrjuU6EjUgduLEj/8g?=
 =?us-ascii?Q?uC4iAVa85khqbmHwfR8ylriOcVw2Rcpzly5VqGLBSABgvU9WSqQrpU8/i8Pd?=
 =?us-ascii?Q?l7f5MvVx798bAeNEg8gwpjAKEi6tdrI=3D?=
X-Exchange-RoutingPolicyChecked: nR27J031ODrzrdeRyBNPDlNnSl5R0Ir8P1zKtCoBV03FZwlh3d6NSuSz9HY96ZbitsWGUyLUSrBXODRzWqRpngecRzrTOiuo5UI9HViyul7ggLP6KpG13VRpCwp6C8I7mqnNRNiUrILxLLd0py6PRtQgCUFmY8U+xW8/hlueLRGI6+RPVr+oz8scizsq4YAdteUCImSPhljmpjDayYnwccEGPpX9x/BOmHWA0Vvj2QDJxiGiZWxciWqcTqUPQjp/GV25lVEiLh4E3Sv7WPgI9tKdqigpiIj4B5sdv0bJAV+V3WRZh9GxAG6txtbug6uZi4QsKNSoqJVFS2KLPekIWQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b0acef-d783-44eb-2512-08df3b3077c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:32:26.6269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /elXxiOdPwgusz3shMiN/u7hIDFS+gdhEMb6v3bBi+awz2MJvntIGcVX0ngW7ug2G8Sfg73WUHpH7Sxc7GmPrbmWaMarGVp+5ernqNuFPu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cpMOAF4i c=1 sm=1 tr=0 ts=6aec694f cx=c_pps
 a=5U2/TfBw33PfA2YBhd8Q5Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=zjtiufAZAAAA:8 a=TrGZlGhXKWsQoEPy0aEA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=2tRhtM0yMehlNRDZlsEQ:22
X-Proofpoint-GUID: j16htTy_rIk0XGREb44zElOKdPhlW3qE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NSBTYWx0ZWRfX9fSGZsHVxtKR
 3u7GtyD+8yFRZh2IETseYK6BEwH18SpyS1hi7msRCenlUiuwFXVA5BtvqFTP1SiE5U/0f3lzrHC
 V0Srs8XvWYX1hfpytkMXnhFY4RDNW8bKRsN+yRJA7awopABTWSdo
X-Proofpoint-ORIG-GUID: rebsG0RfMfunyr7YaitpCUzpEAptBIvO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NSBTYWx0ZWRfXxqPufyc3F76q
 izBp95jG3Idx3+Aha8SnYQ5K3eKUfzWPAsVU7/YNOZ8AwACjxTyD2A4x46DWsn05LYzk+TVM1or
 6fFJuCi4EckS7KZ6htK+BYhXOnK9tf53kw618KphbyqWa8JjVI8S2L/5pgbSh/N3jFlkVJzvAtg
 Ch6c3vl7C85825O3+tCdnRzyAAeiMCebxM4MJed6zLj4UM/gvzNmjoou2G4BRzTop8moUuObweW
 R6XvenSMW7pFG+lD0ulHnv5v7MGGlE95XrsZx2PGbRpHWQq6uj+liY0FZ3RP0i8trVEp+C3mfY5
 uzB5LJWx6t4MncD8EOwLF5hOQdt/HFuNsy90bX5Bj6vBvZkjlOG3UXllcF/UKPOqonzqHtaEjjf
 SGGpMVvj7S08gMRnE0/mRveFgfknIWjEbqkJKKamd/RzjyzREqMumKOgX1lH1BOqrlCijvSMeHx
 6VWQF6+c3bUU1c+EgUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 11:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249539
Content-Type: text/plain; charset="utf-8"

From: Sunil Dora <sunilkumar.dora@windriver.com>

rust-source.inc carries 0004-cargo-omit-host-triple-from-unit-metadata-hash.patch
so that cargo does not hash the "host:" line of rustc -vV into the unit
metadata of build scripts and proc-macros. That line goes into both
hashes of a host unit, so without the patch every target crate that has
a build script or uses a proc-macro gets a different unit_id, and with
that a different -C extra-filename and OUT_DIR path, on an x86_64 and
on an aarch64 build host.

The cargo-c copy of rust/files/0006-cargo-keep-host-deps-*.patch,
later in this series, takes care of the -C metadata (symbol names) side;
this one is still needed for the file names and OUT_DIR, which end up
in some binaries as strings.

cargo-c does not use that cargo binary. It links its own copy of the
cargo crate (from crates.io), so recipes built with cargo-cbuild still
have the problem. Carry the same patch here for that crate,
only the paths are different.

Drop this together with rust/files/0004-cargo-omit-host-triple-*.patch.

[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...-host-triple-from-unit-metadata-hash.patch | 64 +++++++++++++++++++
 .../cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb  |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/cargo-c/cargo-c/0002-cargo-omit-host-triple-from-unit-metadata-hash.patch

diff --git a/meta/recipes-devtools/cargo-c/cargo-c/0002-cargo-omit-host-triple-from-unit-metadata-hash.patch b/meta/recipes-devtools/cargo-c/cargo-c/0002-cargo-omit-host-triple-from-unit-metadata-hash.patch
new file mode 100644
index 0000000000..339317d486
--- /dev/null
+++ b/meta/recipes-devtools/cargo-c/cargo-c/0002-cargo-omit-host-triple-from-unit-metadata-hash.patch
@@ -0,0 +1,64 @@
+From 5c4fd7d8b85f4de5be387777a782fc3ddd1227d8 Mon Sep 17 00:00:00 2001
+From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
+Date: Tue, 15 Sep 2026 17:05:36 +0530
+Subject: [PATCH] cargo: keep the build host triple out of unit metadata
+
+cargo hashes the "host:" line of "rustc -vV" into the metadata of host
+units, that is build scripts and proc-macros. Every target crate that
+depends on one picks that up through its own metadata, so the same crate
+gets a different -C metadata and StableCrateId on an x86_64 and an aarch64
+build host. Drop the host from the hash. The same class of problem is
+reported upstream, framed as OS differences, in
+https://github.com/rust-lang/cargo/issues/8140.
+
+Patch by Alejandro Enedino Hernandez Samaniego, from his strict-version-hash
+v5 series for openembedded-core:
+https://lists.openembedded.org/g/openembedded-core/topic/120939810
+
+This is the patch carried in rust-source.inc for the cargo binary, applied
+here to the cargo library crate that cargo-c links against, so that
+recipes built through cargo-cbuild get the same behaviour.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+
+diff --git a/src/compiler/build_runner/compilation_files.rs b/src/compiler/build_runner/compilation_files.rs
+index 88cab85..9dbd203 100644
+--- a/src/compiler/build_runner/compilation_files.rs
++++ b/src/compiler/build_runner/compilation_files.rs
+@@ -877,7 +877,7 @@ fn has_remap_path_prefix(args: &[String]) -> bool {
+ }
+ 
+ /// Hash the version of rustc being used during the build process.
+-fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, unit: &Unit) {
++fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, _unit: &Unit) {
+     let vers = &bcx.rustc().version;
+     if vers.pre.is_empty() || bcx.gctx.cli_unstable().separate_nightlies {
+         // For stable, keep the artifacts separate. This helps if someone is
+@@ -886,7 +886,7 @@ fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, uni
+         // omitted since rustc should produce the same output for each target
+         // regardless of the host.
+         for line in bcx.rustc().verbose_version.lines() {
+-            if unit.kind.is_host() || !line.starts_with("host: ") {
++            if !line.starts_with("host: ") {
+                 line.hash(hasher);
+             }
+         }
+@@ -899,12 +899,6 @@ fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, uni
+     // This assumes that the first segment is the important bit ("nightly",
+     // "beta", "dev", etc.). Skip other parts like the `.3` in `-beta.3`.
+     vers.pre.split('.').next().hash(hasher);
+-    // Keep "host" since some people switch hosts to implicitly change
+-    // targets, (like gnu vs musl or gnu vs msvc). In the future, we may want
+-    // to consider hashing `unit.kind.short_name()` instead.
+-    if unit.kind.is_host() {
+-        bcx.rustc().host.hash(hasher);
+-    }
+     // None of the other lines are important. Currently they are:
+     // binary: rustc  <-- or "rustdoc"
+     // commit-hash: 38114ff16e7856f98b2b4be7ab4cd29b38bed59a
+-- 
+2.43.0
diff --git a/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb b/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb
index 722a128d43..37d6a59aca 100644
--- a/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb
+++ b/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "crate://crates.io/cargo-c/${PV};name=cargo-c \
            file://0001-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.patch;patchdir=../parking_lot_core-0.9.12/ \
+           file://0002-cargo-omit-host-triple-from-unit-metadata-hash.patch;patchdir=../cargo-0.100.0/ \
 "
 SRC_URI[cargo-c.sha256sum] = "5ff6e05531e58286d3c02ec0adb7f254e5d532a8d4b667f30b9942d802e1db25"
 S = "${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV}"
-- 
2.49.0

