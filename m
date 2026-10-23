Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14508.1792782789434314728
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 12:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O33+vyz4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4756619ca5=saisireesha.t@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NIaVq32269151
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 12:13:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=YTNMXBgQb
	DvlhIGP82Xz2FlY3gJJQd5sa7EGky4QrnU=; b=O33+vyz4zb7BLKVVIDcWJFgM6
	//dG+GRLCxTM+Q+sE47Imaw1O3NselmQTxXllAQcGlJbV+6nT4Lt0imlE3ph74lX
	5gasupcQYzEhZrn+JAvvxfRGv7swEzxWCRhxkMUH3pq0rt3t1RUn780UsAiPSEzS
	8KiKWmi0fMkhKkascd042+t5k5MU2mIr1RURsb2BWDPalbJmjSGqmqpnvm45Y7+O
	bPKmdCfsJWoI3tT7M/c4Z4VkAzBcWpW95k77dt1K2Lf9lo9bss+ofQrOxkv+wcm6
	B0ksKl2DPCknrCnIM+9XCJccntYgSbNiBpRYay+OfmbqoFbGED29fJMV1A8AQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021078.outbound.protection.outlook.com [52.101.57.78])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hf9h13ffe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 12:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvN/3jNnfkjlEtbd6KM3sOsfnS1q6ALR4OqSoq5D7cAsMtdduF4coqxQxxeC6pIoQkocMXD1ZMUyqL6ZOYS+zE/MCP9f0OiSYL6/TmMSTDdJAUameziARNd8EVwH+UqE49whgigwr/QjFXjbLK+e+U27rrpv9kEJ4/cj/F6VB7hh5bd+NMNDnzu9C5042UNpDPbcgwij5IfSxZYAzyYsEx5rW3Fib8RhmcGRMe/XfWOVOR9hmhSAWycWoHKK2+B7h2SGDclnrtdWNjUvn3vLNRKTOMsx0nBSlYVb9/ImLff4iArK55VR5yb13HBps0T4EHh7fSrYta3HE35tvBVH0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTNMXBgQbDvlhIGP82Xz2FlY3gJJQd5sa7EGky4QrnU=;
 b=OmMbTQ0QMSWQNc3UxcXSNnV8F608wdLLoivSLQbl8vvWFArYtRzgiF9ZyZ7GJlDM3S2Sg0JVpaElTHbuQkwcFXeh8APNEiNVg6LPSnEXeVSSQXXbKOnVC350My5Uleio1w4Qd0i0uOknpkKhUV45kX057QlqjAFfhbXGh5BeUh2qKBJDA67k/tfNGvtlWWzq5Y9pGVCF6VR1j6FYORK3/kDb3LOLJTXK4nlvwusSExG0WNERVM0uB+PqIUlmDpOfeeUPLCCKBwCKtYYPJFnpWpZCkhJztJqyEkvMORok+Mn83O2JuaZHLIAJm4I926/jrrjfw/qJvSip3U0eps6Bkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA7PR11MB9594.namprd11.prod.outlook.com (2603:10b6:806:4cf::24)
 by PH0PR11MB5048.namprd11.prod.outlook.com (2603:10b6:510:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 23 Oct
 2026 19:11:04 +0000
Received: from SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102]) by SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102%3]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 19:11:03 +0000
From: Sai Sireesha T <saisireesha.t@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: quic_vkraleti@quicinc.com
Subject: [PATCH]  systemd-boot,systemd-tools-native,systemd-boot-native,systemd: upgrade 262 -> 262.1
Date: Fri, 23 Oct 2026 14:10:44 -0500
Message-ID: <20261023191044.3603305-1-saisireesha.t@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: IA1P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:461::13) To SA7PR11MB9594.namprd11.prod.outlook.com
 (2603:10b6:806:4cf::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA7PR11MB9594:EE_|PH0PR11MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ab3f88-7106-4b98-28e7-08df313961bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|10070799003|376014|366016|23010399003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|56012099006|11063799006|261009223027099003|18002099003|6133799003|10067099003|3023799007|261022115727099003;
X-Microsoft-Antispam-Message-Info: Er+KpPBnaHJ0d3rj+KchkjTgFpAT8ofcHnEE/BZbIReCWASraUuMLTEHw7tttq+6G0s9PSXaCj8ChfNdunGvYqRatZE3fvspj7zBPGr5KBizl1AKCS+6vd2Oolqq6UvPNgV8Kz6XOYy0HDMwH9R0oYYBwbfHTVJ5NPgFrqG0qF805ps0nbKeIrqOqdahL2shVniVbBAkCGhUr1fXtcNCFDWltT4EXe4MuJ/xwn5k1uerryg3qrM2hiY73vI4gG7jcQ/oZY6AhnwlhfG/Yl2hj8DYWV5RA+BRRvzQetOG65j2cwulE9Ul12BCGXjPWbzGcv+b/85V6n+KJQcYwlGnvx62FuSZFhf1MAMGOhQKfvBBXnRUuQYpEJGOLEOWHOoX7rROCmELHI7WztrFiljoF9Vlrj1+5dBpbW4wQWqHp3nysEs/B3Ot/U4REgfopShE1352HBfhPaF/9n+Tbr+zQXqbx2fSlfH2mAoA/MblJBG7HNLMf1prK2edsYxWG+tB0dLYlBBJyAjKh6WoCcSssovb2VeNPddfQJrxOZeeJQRIEDOgnvpZ/8WP6DQ06BKDWNbIa1GeVHMsxrVPdUO5MByFgRiQKqVvUwRDbhhOO71rSeAxy16G8j+gN/fmRuQKwhOQ9WqRoraX+1nrCcOKOmztwbv4TpZkLg1EZu49vAA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA7PR11MB9594.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(10070799003)(376014)(366016)(23010399003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(56012099006)(11063799006)(261009223027099003)(18002099003)(6133799003)(10067099003)(3023799007)(261022115727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s8PJtAk0SvxQNYZ9OL55Inz+hk0sTDo8LtvoPAIaWBSCdw9rkudYMbDMmWts?=
 =?us-ascii?Q?5IfFCcCAmzWCwZtcr+hcqrXJEIHsBiuJH0/Vo2SxxB4gnIXruLEdepq3KNev?=
 =?us-ascii?Q?+BPgWIYBM1tx2JN26ZW/GiTjSJY7gzNo+1u3Vz1nh3xH/1GMzdYJ5PDpR86t?=
 =?us-ascii?Q?lDEx95+EfMeAmlJz6UJXa9u/coogSDyh3075B6ODzgvot2BCyB0odNS4ILb0?=
 =?us-ascii?Q?mkIvvj9N1lWvlGn3V+5E/SWgOAkIRikPELjt+awCXavIet/uYcTu79GFBAMd?=
 =?us-ascii?Q?5wsl6a67/vWNsAkPh3fcC0KsOIoyDgPfzaMrz/alSytoqRlwtH0MZX+IRkSH?=
 =?us-ascii?Q?XyY0M5Rxa0LXAdKW6b1Hl/XShxTNqM2ClmcAB92Ci4oFjVc58WNZ9xLXZz0V?=
 =?us-ascii?Q?c5//S9xDjQArVngYLYpxEa66Jhsg5OCuV2IXhhz5a5fyHiPDborP4+RAMdFr?=
 =?us-ascii?Q?+Uit4d2SEsZ4lcheEAQh8NZGmZx3iIPxOeAfsFVX9bdT+qu74q7s9WJicPRQ?=
 =?us-ascii?Q?E2vJvjgM6i9wD+vOxdjrlmhGBgRhQ80SHV33BYJrkYfeQWt1MqILsQo4DWHS?=
 =?us-ascii?Q?exi5eg4KKM4qMLWYroAjwDPpMeuMu+W8dsDF22sZwmvhDkwpCt8UO/77rl1/?=
 =?us-ascii?Q?Z17QOgLSa1Gr7JFA14i/KGnjCstfsqqHMy2mQfHK2WkaqCElli4So4LG4dz5?=
 =?us-ascii?Q?CvjhgtHouWaobiZYOzTCFOfWU7fN21jvVX5vvcoAVoOs2LECGfG6tbfe94g6?=
 =?us-ascii?Q?X2V55rQcR3El87y9RU/pt3m7/bsO94IfxWN8+3uVeXGiox0xWwFo/HGKt6X6?=
 =?us-ascii?Q?06a15Zw2cjjD95wP4vucvoIug1wxLugmqrANn6cByfKLXesJN5O1W3e1JLAa?=
 =?us-ascii?Q?N73FGAICYfL16b5wAIKUaBW7w47YLy9xRFmK4TL1nGRNT9/vSvqB/8WK+13l?=
 =?us-ascii?Q?mvUMYq/gkbIU9PIm6QyjFP+WK14buIrPiAr2SGMSwMI69hB9cN3WeltTqxyW?=
 =?us-ascii?Q?giXnGf76r/a34JuuOmL3J0Rf5bq3PyuwsQOUP5nQewIEtdlFW+gbVKOkkCaF?=
 =?us-ascii?Q?rduIVtBbt74qlf8RLfo16D9bXPCkhMK3zSsPXOqWOpWQh7i/Xt7980w/na5D?=
 =?us-ascii?Q?LHVDntCqluuhJBWnDxMmWPhVINtGnaaT/Y7mCAL4sEwROpbDhtN1W6y4Zuj6?=
 =?us-ascii?Q?VwciEGqUvHfc83mNwxS5VTMHU0E8/nCWXhcKYj8XCGmK+KLcLKM9ZSF3GI0N?=
 =?us-ascii?Q?kacMPnPHfDf85cNEpv058DCKTArkQ9jM3zAsYYp6beJncdm5APXRjcYma3fw?=
 =?us-ascii?Q?Mw7k0BsyqU/D+FZEZvvnEJjNbP7pgCridkUd5uGJjElezlXvUFSgU3VgPAHS?=
 =?us-ascii?Q?G0h+XHGojEl5YhAxwgx1lUf1xXhZEGf/Y/yIcfqysQsozG8EAgSAbAcmqe3t?=
 =?us-ascii?Q?dKOubMj7LY128pQsJygWboSI7mwt+WZkoFPDsDGzWyKmCwsuaWFTi0n56c4r?=
 =?us-ascii?Q?nWmZkwvtVDjtTfcfo6+NP/3AbAJtHF0zECEhdvrgwsyQjdYRh+pHANtW/rHx?=
 =?us-ascii?Q?J+2/OQRiERShbjUvZMlvowgo5BZc4X9KX9FB2ZvrdU3rLRAa9fotjeQCuvjJ?=
 =?us-ascii?Q?TIzWeaFsVHuFYPBXYZgIPxUisYWZ9m4d4fhOB0h7QwJ9VNO9NyU1OBfn8+sA?=
 =?us-ascii?Q?jbDqbAHPsGJsiJqs9TrXoZRv2OY3h/6m/Fvwhy6jOQ9uG03OrOhTdRHopw+s?=
 =?us-ascii?Q?qINQ9hnlh5KyfGj34DpMICF1VJfMMFp+BX48eZ0Dddhl20yuVpAuhUTC/Wcb?=
X-MS-Exchange-AntiSpam-MessageData-1: ALuWCmfK5Qd8szcU6LAgsBhoFz/FQbsPWqg=
X-Exchange-RoutingPolicyChecked: hYPd0orybNAYLk1ssXeXm4yBYKd2FRS0sPyATnCy7ecU/HYKaGaIcKusviaekvstIwE/vhrFccYGPVW4lfSn/xr/y4B1UnyIXSeYkLIgW7bhB3NrgStRdP2EYMucSHsbPHaV/RVlPnBhpSsAwQkgqbuGS69MPrLvqHICf1T+r0tTH0BPQ0qIe6rcDF3IMOcbE13gAYC3d1flL3QRkO+PsI6JwuHwua89oXR0O2+KvjKmEpHhrwbhB74VIaxHkVH7wNBMFcoJ9dEhYuOFcDVlnUGdsGRlBH1H0YATPNhCmPJr28e+o+hhI4yG0jhDH+8tnD3veBPqedaoieOXmEf7mA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ab3f88-7106-4b98-28e7-08df313961bf
X-MS-Exchange-CrossTenant-AuthSource: SA7PR11MB9594.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 19:11:03.6379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFjd8bpsHLKGcyGy9eSCf4dOaxt5xfvbYnnpvCZys+fsgbsQgQa3r7ds8Tj29qRCfbnUy+E8GpNZ/dviHMTWCO4VWIh3cVgtn1u1JZGvafA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5048
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA3NSBTYWx0ZWRfXzrq7enuwPiFA
 nCjpfTd2tvlVCccz8uMPedwYqWcuCTlKC3K2GwSfgfMdr3Nj7DTF2cBHiW9h3jaiHzfc6r5NWfp
 kQbJf1buXaaJDFZbZ/zVKW83OUP45UQOoFEZIVczUyIoJFddBAmJD6mb62BckOXXjaLaGuAMiLV
 avZDnQfrFow/mry/EoLDJd0ki7j+/DCYlZO5P3ma13vW8Z+rdxfSjeoJpl3KD4r0zCCdx0hVryf
 TCubWIiiCBH425xzhJx45aLa2ZMMMphMk8MMe8QTe73KcCMtpNlqe5zyrq4wmy0REA0SxrxWJQA
 t2jrGS17JUzx5fAyHmdZQr3RYUvgBbke2F1oOmJDONj4aP1vg0KLNViIA2RUZpZgJrj7ZRX59QY
 gU1vWVr0smtle7VF6GWtkO6PfjbT+BDLFh8GkIV9NVER2kAJxlPO7d17v91FjZYd7eYxDz3EI/v
 8rZTg7mPw4Y5qKSxexA==
X-Authority-Analysis: v=2.4 cv=Eu9HPicA c=1 sm=1 tr=0 ts=6adbb1c4 cx=c_pps
 a=sajROsZvL5DJSFuOmYePsA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=3-RhneuVAAAA:8 a=0FD05c-RAAAA:8 a=BdvB9D86KbjWMdbvNZ4A:9
 a=WtwlqiA7_YYXSVdy:21 a=FdTzh2GWekK77mhwV6Dw:22 a=VLVLkjT_5ZicWzSuYqSo:22
 a=l1rpMCqCXRGZwUSuRcM3:22
X-Proofpoint-GUID: PAfPZ3n-V5qTti-abKPpn1BmW9eYCt6-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA3NSBTYWx0ZWRfXwMTP9MbN3Jx6
 +UOulLnqq9nRTTYAelgUWdBkudqA+ZMiNIwPwNmr41de7w+ZA1h8kPyXXMFfHhLdmk816m873xi
 orMR4HW2sq9MzfKLOAl4cxSqU+70VLqvAmZi9iRudZmqqOiCDCE5
X-Proofpoint-ORIG-GUID: yt-gZ5h2iNZQb5UkRPWv2kD_BHo1eRVa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 19:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248560
Content-Type: text/plain; charset="utf-8"

Upgrade the systemd recipes to the 262.1 stable release.

Update the source revisions and refresh the existing patches
to apply against the updated upstream sources.

Notable fixes in v262.1:
  - logind: fix one-byte buffer overflow
  - ndisc: fix an off by 2 write in ndisc_option_build_encrypted_dns()
  - sd-bus: avoid overflow in sd_bus_message_append_{array,string}_memfd()
  - firstboot: fix use-after-free/double-free in process_hostname()
  - sd-event: fix hang after ratelimit expiry
  - journal-file: refuse hash chains and field lists that loop back
  - seccomp: mask socket() and setns() arguments to 32 bits
  - kernel-image: handle errors when reading .osrel section
  - udev-node: chase devlink on remove event

Refresh the patch context for the updated upstream sources.

Testing:
- bitbake systemd
- bitbake core-image-minimal
- Booted core-image-minimal on qemux86-64
- Verified systemd 262.1 as PID 1
- Verified zero failed system units
- Verified clean shutdown

Signed-off-by: Sai Sireesha T <saisireesha.t@windriver.com>
---
 ...temd-boot-native_262.bb => systemd-boot-native_262.1.bb} | 0
 .../systemd/{systemd-boot_262.bb => systemd-boot_262.1.bb}  | 0
 ...md-tools-native_262.bb => systemd-tools-native_262.1.bb} | 0
 meta/recipes-core/systemd/systemd.inc                       | 2 +-
 ...nfmt-Don-t-install-dependency-links-at-install-tim.patch | 2 +-
 .../systemd/systemd/0003-Do-not-create-var-log-README.patch | 2 +-
 .../Handle-missing-STATX_MNT_ID-on-older-kernels.patch      | 6 +++---
 .../systemd/{systemd_262.bb => systemd_262.1.bb}            | 0
 8 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_262.bb => systemd-boot-native_262.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_262.bb => systemd-boot_262.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-tools-native_262.bb => systemd-tools-native_262.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_262.bb => systemd_262.1.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_262.bb b/meta/recipes-core/systemd/systemd-boot-native_262.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_262.bb
rename to meta/recipes-core/systemd/systemd-boot-native_262.1.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_262.bb b/meta/recipes-core/systemd/systemd-boot_262.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_262.bb
rename to meta/recipes-core/systemd/systemd-boot_262.1.bb
diff --git a/meta/recipes-core/systemd/systemd-tools-native_262.bb b/meta/recipes-core/systemd/systemd-tools-native_262.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-tools-native_262.bb
rename to meta/recipes-core/systemd/systemd-tools-native_262.1.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 3efc48f65b..1098dc521e 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -13,7 +13,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=c09786363500a9acc29b147e6e72d2c6 \
                     file://LICENSE.LGPL2.1;md5=be0aaf4a380f73f7e00b420a007368f2"
 
-SRCREV = "8cc40e0c5e9234bf45084751ac53b1fbfe70b492"
+SRCREV = "73612ea502d53baf9b0df4336cfc296a7ee0d524"
 SRCBRANCH = "v262-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 0b9eb4ac3c..31aaa9d1f1 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,4 +1,4 @@
-From 4793a67d3d738520f0193a9edff491989e8d77bc Mon Sep 17 00:00:00 2001
+From 40a7e68660d7c295a851b7f3c32650ca8223dad1 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
 Subject: [PATCH] binfmt: Don't install dependency links at install time for
diff --git a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.patch b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.patch
index c64bfa8249..ee5fc2fd98 100644
--- a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.patch
+++ b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.patch
@@ -1,4 +1,4 @@
-From e36f6fc852f8331791f391a216885b9bea543aff Mon Sep 17 00:00:00 2001
+From 7359147bca7d72f97cf0b1f5dc2305894d64e524 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Tue, 21 Jan 2025 05:02:00 +0100
 Subject: [PATCH] Do not create /var/log/README
diff --git a/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-older-kernels.patch b/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-older-kernels.patch
index 7e96550dd3..eb4399cfed 100644
--- a/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-older-kernels.patch
+++ b/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-older-kernels.patch
@@ -1,4 +1,4 @@
-From 4f04acacb42d410d7002cae3e2bb6c51d47331d6 Mon Sep 17 00:00:00 2001
+From ca3997b157d681dd92d091be7b31f6ffe632bbd2 Mon Sep 17 00:00:00 2001
 From: Daniel Turull <daniel.turull@ericsson.com>
 Date: Tue, 23 Jun 2026 12:00:00 +0200
 Subject: [PATCH] Handle missing STATX_MNT_ID on older kernels
@@ -28,7 +28,7 @@ Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
  3 files changed, 80 insertions(+), 3 deletions(-)
 
 diff --git a/src/basic/chase.c b/src/basic/chase.c
-index 23a523798e..08ef95b3dd 100644
+index c07e8f6d92..20ea6ec649 100644
 --- a/src/basic/chase.c
 +++ b/src/basic/chase.c
 @@ -40,7 +40,9 @@
@@ -153,7 +153,7 @@ index c6e78c59b6..7f33d900e5 100644
  
          r = statx_mount_same(&sx1, &sx2);
 diff --git a/src/basic/fd-util.h b/src/basic/fd-util.h
-index 86bddb6dac..34370c8943 100644
+index 999b49ab03..c2f877d764 100644
 --- a/src/basic/fd-util.h
 +++ b/src/basic/fd-util.h
 @@ -188,6 +188,7 @@ static inline int dir_fd_is_root_or_cwd(int dir_fd) {
diff --git a/meta/recipes-core/systemd/systemd_262.bb b/meta/recipes-core/systemd/systemd_262.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_262.bb
rename to meta/recipes-core/systemd/systemd_262.1.bb
-- 
2.43.0

