Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32435.1793878352644103995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kqs2vmOv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=576967b061=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5AsUmY1287726
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Nov 2026 11:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=KIsD2ks6U
	tkIikDmC1F7nLXwMzinoVuiH4GGltMsmNw=; b=kqs2vmOvwZM6acWyfJbw5rhTq
	VXoVOFmr7dVPh2CWl471o/lRvRSAk+sWJ0mIFi5J4BFWNeb/hbx0XeSwWDEKfyKM
	AAKgfpm0LZxrN9PZxOKtJ/BqQxeLYvsI/LgSc0eRxt7Cid0P1u7wylnUwPVW2juX
	dU3GLdZjJi9fMA1jmAJ0kt5JNtHljjUNNuUWbNBG7++0FalvwUbWea0kDU2XH+7n
	SLQl6ESX6jD2gozmY7BV0Py4mQ1dTae9/tQAe+LMldcvKJ2Z6/sw/T7podHcU0bP
	/rcRG3imC97FJF3NF17OI2xi9Qkz2L4CiqiFmG8WZvipAPpFG/Jct0dpKKF5w==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022130.outbound.protection.outlook.com [52.101.48.130])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hram4hnn8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 11:32:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqnfsmgEj90yx+KCdiwb2AZlxqf8ZllKKAbHu0OzFmwf7+iP3DOE5CUyn+Wwa467LV0/0caDqIDs3iAA4g/lwOGQhTaaRVBLpTLMZQKfN7zkOzR+YKe2rF3MEwVeLIRmDiu8PxnV7vjFq4sSE3Fa3OiUe+OMv+fkyY07sxZwaSOfH6/zEbdsNk2RmnFSdL3bILxOY6TfIAn0Py7JQz4U+tCw68Al/pQ8MZPNc5ijA3vpq7YGEvXsg5+ssI8T97alopLJFzhhopSGT7jQOUdDSq4fmbhtnoDbXU/Dys0DrcUAVoUNyQKRUqNV0EV/ZwhGxW+jEI6ln9ukSj0cHo2sHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIsD2ks6UtkIikDmC1F7nLXwMzinoVuiH4GGltMsmNw=;
 b=pGclvbPYSUkwaHNHV08otH9aDGEpbsyM8/sAQvFCyTewOHnC6hTRsTU/IGHFhjgg/0CdD755J70WUCkKCkr7jbn4AD8qSmDZaqlzz10vU5OYsPf2VM4zkIqfoRYFjg7hDFcIIH6s+nMwxLXSOap/t065wA8mI2H6vlAxS2un4dvHtofAV1b2HFfaqUC9cwnD4aksKAxssudObo9AgkuiaIo+vx9tyAUyC5xQkaQZUzoj0+y4Q9nAPNpxqoXc5hO3nssCAiK3ZKGLOTpFLGE+8W57zrMNUwcp/CobS4GuVH7GwRLXACT76GSUvTZnq9dp48+Sh9w9YARwHkns4Rdlxg==
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
 11:32:25 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, alejandro@enedino.org,
        sundeep.kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        sunilkumar.dora@windriver.com
Subject: [PATCH 0/3] rust/cargo-c: keep the build host out of cargo -C metadata
Date: Thu,  5 Nov 2026 03:31:59 -0800
Message-ID: <20261105113205.1571267-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a35576f-cd28-4cb3-f5c4-08df3b30774c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|261102123227099003|56012099006|261022075727099003|261022105027099003|261021121427099003|11063799006|261009223027099003|261026140227099003|261026121527099003|261028144727099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: RscVWVoIHnG/Iu3U40yfYToSJV28m59+msxC+TOzesSonU4gfuZJrdvIkc82hnMLjrdhk5wNyxdOKE5Ywtiw7Qwgjmf1RmnMBIxVszYehJaXRyovaJDspaLUVxlJfiqxCXXhQHZ4qSL13pXQ9CMTHcEARoU1XXrqZern9EIP/OhaN1nm1VUz5IZ8n6CP+FRf5w7iYbKmGSopwvlEjnj/84stwW/yscBmgxPMU9D6FiOB80zSvHufrl0ZCTJGSyNWLIGuKdoGDTITT+XL064Sc03ba2wsKZE3huWGkOS8HCXDhrq53YNsvByR55s5AP0IjErsrb3MeJvP0+o65Kd+InPMqyATi2d3oP4M4tStrnLdn7uE40q7O+BmzOuIObUFE+XawUJY156WwhXX8bA83RC0JVAfR8wPQeDa86P/uQUE02r3Q8GSod4DjxMQk+QqIuuaapTVB3TNEAV12A1GecWgCG8qyWTEUDrJU+PC/leIr+dM6oEvklXKDbM/ug+NyaQcYmLmlM0kRNT2Z2JcoMpGrUzP/B04Gp6EJF7dU4Xl+i6jFl2CZAJvCq+8zbnKEA77e0tj+cmgAFjbE2WH+aknnLDFZ86QBgDu0YEw+nOBIIkWYHkzWTMM4TyVeti6UjbOOe44R5beTy36dp014m2ai0C5WZocTyG5RPdkx7fSI/AwIEAFL924jEN9/If2eucOyuN3NiyZllTsXTFQgUKGliKYbdjS9Ncp1mmPuYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(261102123227099003)(56012099006)(261022075727099003)(261022105027099003)(261021121427099003)(11063799006)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7tS3pQhnDh0d7clHqs4IY/7hva03B5FDw4XACQlwsnWmYBEKPnVP/EiXLzGu?=
 =?us-ascii?Q?tuCT0Mvlc/jDdhNyynFuhUzneJ3GpaKyimEkf15+/0mJ73yWvfj7ZS0OXvcA?=
 =?us-ascii?Q?y8Sr64cQ7knBIcvKor0PdyOG/wP6ktJWex7njlWcy3z/aB0gLUyQ71NVE4UW?=
 =?us-ascii?Q?c3orCrT6E6+eLpDVRyvHaJgYIy9Z0xc6NKZtTK4PaAiC/fcirzIDfzf4Jz0x?=
 =?us-ascii?Q?QZePDvkHJ5doyqhu5nvcKHhMqybM8ispYUHn6tty6opgf9nrI15UBVTZ0ubJ?=
 =?us-ascii?Q?dkoYoR50k5IL+bgpZOuWIA+W+PBCUcf74DgHdXBjxwbVnw5gBkZSTveeOdCn?=
 =?us-ascii?Q?+fLkLaNm1QFpMhR8V1mzGMXyTcukckCfx9Rg/nrLce9NP7Jl4dywYAkxLSt7?=
 =?us-ascii?Q?vtcN+8oK4yspAxLdZ3xxJpqtZgUe/KKg+raYZUAfb+ae0PidiEC0WsO0YIr0?=
 =?us-ascii?Q?DBxfCypCHoTWTFX9aClED7Y/m+0h4MLYdnsQWG8DTWVEoZsVXN8rld6dN3Sq?=
 =?us-ascii?Q?7NwpwUou5VG6WE7Y8mmzzOZNklGMnv6cGrCko+VRh5wNO7ze/+UHd15FkMCi?=
 =?us-ascii?Q?stwsYDcGi7PfOP7QSerctQPjWeW8JNSNPEx1evTpXc/KnG7gfRE5mMaLnNvK?=
 =?us-ascii?Q?jzF9A4GbXnHm3OKCGCyQTasCM6gvK9wBX02Y1j/VQJdgkOk4AlGeryhaztiI?=
 =?us-ascii?Q?EH65XeTzXZibXFy4xWwEP5Ig2SpGn6ZHEH6a7bdigUA/Re2GlZGoz2ptpugX?=
 =?us-ascii?Q?Z4qzLXsDm/ru/ssK7/I853EHQCh7/Znkxa7mQUiQrRIayS7j+FBuMPNd8gq9?=
 =?us-ascii?Q?7RNMcD286n08uf3Yddsc1WwtaTHL1lPRmjoEKT8F9AktIXBolyzS0Tdatglj?=
 =?us-ascii?Q?zcc7kJFH0jZxVGVZpxDaZ1nrn3Yhc440sYBr+Jmk/VQeRoRI1tvXefaJ8QhP?=
 =?us-ascii?Q?+5hCZbU3LPFGaS+0P/Uh3GbMr2kKp2aY3jf+Oxb7naQhQYJv29LPn8Txj85f?=
 =?us-ascii?Q?BU4PLYQ5A+2+UaZa9xJXTuifC2EIcXbw79iDutxGWgg3jFc9XR595b8tKvOK?=
 =?us-ascii?Q?k+QaY0gsN4ZgAbpuclseOV1JUuYIniZE9FFF960XnQ8n+yvxWPPABfcMaZae?=
 =?us-ascii?Q?iO0uliizu72CyNZ92IqFpVFah7T4UXXcx/NgsNZZfEXd9b36WWhnF9ZuEw0n?=
 =?us-ascii?Q?ZConbin3SZ3rsY5v9NyvK/WeBBk13ZXlRq+4hHLlXnWe3FyvnZD7r7/IR/Nm?=
 =?us-ascii?Q?CbTSLWkVf1bTm79Nj4ARD3JcSGlXwI5xcQREnO6hHlx7yZwDEQGiO5yPDaCT?=
 =?us-ascii?Q?FuXG980nnTA8BEiDpW0f6omz/jnvVOUhMjNzKA77feu9TlBsof5WfiOymgZI?=
 =?us-ascii?Q?8pswlKTzQJIc9QW8Soz88eiecnrPJ7J39ZidXxA1lVfVVmQYev0oIaz8xOmh?=
 =?us-ascii?Q?axnGhtY4P9uehHf5rU7e91m+WTfpwKXQP0T+Tj9J10+iufbasSK9YH6xsAWL?=
 =?us-ascii?Q?PAVIqWENVmWALP2oY6N2pQE/+zQzpNXNhc72PLJlU+D0SOwduqE+We++PN7O?=
 =?us-ascii?Q?Q3Fv+q3wHbjeKBhXr02k1r6qisDtqx9Z21VxuDcdFRGDueE10qyx59o6MIy7?=
 =?us-ascii?Q?5tmVGdk7VLfk8d/CZTaJqHm+J0/Yosw4VJ6mPflgp2DV786Pq4I8OpOQgDM4?=
 =?us-ascii?Q?rREEh/GjNjs2oaBpk0tE/m5bWgIFn9EalfusOLfruASUQHJemKu0ZPHntSyg?=
 =?us-ascii?Q?IaTDQcui6rrClldOpNUgHQKF0eNrcJA=3D?=
X-Exchange-RoutingPolicyChecked: MSJIDRp+SW1BPOc6npM2UhHcaVZlLahFQvEG2F5mv61SHj2SqLbhBLCqezudDWvgPrj2sEV0djEH1RrM6bb2yBXrRs1ZIhLA6s1tnOO1mtwZT65YRm2AHMLlHPCSeve5whSLPZv1eRmDyP6/LnPJ864iFXYlRuuPNF/cT6Jl0A6WfmJTrjK49/warZUdLTJKQWHEU9+8hRWFuP1nbCYeJttXcenxTT+1WtPsMjGw0DhxVmtbrXDvNJRS6/otHKdd+lx19/txA25QeQPsXhDbeQNZ8CP/6gaR3WjddW7SunJ7btrpVXYfGAa5ZnqOU2U7wzUk9Ws7SUzv2/IWgnT4cA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a35576f-cd28-4cb3-f5c4-08df3b30774c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:32:25.7776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+P6x+8BZCQIR+KjIl9YB1yHtn/bAjyR+EtlkRSwrhZLrnMZpxhaIA4jiOlb1c9JeFH924MxqQqoC9k1+9o51QhN81tOeF6JoMENFWEM8B4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cpMOAF4i c=1 sm=1 tr=0 ts=6aec694f cx=c_pps
 a=5U2/TfBw33PfA2YBhd8Q5Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=xi3ia9FtnKzXhdYnVDoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: aNAP_5yrRtjve8-jlXo5yCjyMk8DSByA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NSBTYWx0ZWRfX9weSXJIh2m5c
 /UdmNk62xFI8NcMMeEx/he4Wblkcz3n3P360WgBkuN6PUokL1svqDfP6uhDoMUMN/t0SNMPrI1g
 Xx+kqTUbfgMVSqwVu9izdF+NB26Ff0tAQr3agA67Xrb9pr5DmTGl
X-Proofpoint-ORIG-GUID: sPHa913z0AzJDkyvzBujD1hRp2bohV1z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NSBTYWx0ZWRfXyUSUVDu2pGJc
 VK0F8Bcmw6e3hPzfWrMcQrFtHdaVvyRRSbB8n+/a7Eg5HujPRDTMMNSXnAvLMhCC7rmTGHVoCku
 87AOGf8wAPqAWGtfYIPPSDrEOOwJtuWPG1G4uuCcVyWI7FinasH7DCMnPQs6RIGCdv4dEVjU6kn
 bGfB0QyLhncf07EdufTsUtqitfGEwJ4d2S8QvN326ko9N836gUblkgEiMAbSGyu87EQTwouJetS
 evPxT8pXafeIf33NdcsQKPguzFiOpg5qJECsdU7SlpYPA3Le3Oa7v1iOHUAICx5fkxYF2S8zhph
 DVW0KRp6nh6ZpD2kagLNRfmfzvc7jWleAg5eIo8SFxaCr1oC/sD/e0ciIdY+sgRJIICIjCty3Bd
 zi20KlAR+Jk8mEhf3hhcJZIKMUYDK3UbIDXlGJ4xhBVJ13SJGmYqvbs2LJPc0i1AedWRSH0hblZ
 tyXr6LYhHW7Psr96zFQ==
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249538
Content-Type: text/plain; charset="utf-8"

From: Sunil Dora <sunilkumar.dora@windriver.com>

This series is for the remaining rust part of [YOCTO #16376]. On the
reproducible-arm (121) and reproducible-arm-cross (119) builders the
rust-rustdoc and librust-lib-example packages come out different from
the x86_64 build. The reason is in cargo, not in rustc.

cargo builds the -C metadata of a crate from the -C metadata
of all its dependencies, including the build script and the proc-macros.
Those are resolved for the build host, so their dependency graph can
change with the host. For rustdoc the build script depends on 
sha2 -> cpufeatures, and cpufeatures pulls in libc only on aarch64-linux.
That one extra crate changes the hash of the build script, then of
librustdoc, and with it every symbol name in rustdoc.

Patches:
1/3 cargo-c: the host-triple fix we already carry in rust/files/0004
    never reached cargo-c, because cargo-c links its own copy of the
    cargo crate. Carry the same patch for cargo-0.100.0. This one is
    about unit_id (file names, OUT_DIR); 3/3 is about -C metadata.
2/3 rust: carry the fix I sent upstream (rust-lang/cargo#17522). For a
    target unit, host-kind dependencies contribute only their package id
    to -C metadata. unit_id, -C extra-filename and fingerprints are not
    changed, so file names and rebuilds stay as they are.
3/3 cargo-c: same fix for the cargo crate in cargo-c.

Testing:
- Autobuilder run with these changes (x86_64 vs aarch64 sides confirmed).
- Built cargo-native, cargo-c-native, rust and rust-c-lib-example for
  qemuarm64.
- Local check on one x86_64 machine: with a rustc wrapper that reports
  aarch64 as the host, a crate with sha2 as build-dependency gets a
  different -C metadata from OE's cargo and cargo-cbuild without the
  series, and the same value with it.
- The upstream PR also has a cargo testsuite test for this. It is not
  carried here.

Upstream: rust-lang/cargo#17522[1] is still a draft. The discussion is in
rust-lang/cargo#8140[2]. On the rustc side there was no objection to
dropping build deps from -C metadata of the main crate, but the cargo
team would prefer to handle this as part of a bigger rework of
fingerprinting (rust-lang/cargo#17439)[3]. So I expect we have to carry
these for a while. They should be dropped on the rust / cargo-c upgrade
that has the upstream fix.

Not fixed by this series (still differing on the arm builders):
- rust, rust-dbg: this is on the rustc side (proc-macro host_hash in the
  rmeta, and one crate hash). Working on it separately.
- librpm-sequoia: symbols are identical now, but three strings still
  have the build script OUT_DIR hash in them. 1/3 takes the host triple
  out of that hash, but the host side dependency graph still goes into
  unit_id, and cargo keeps that host dependent on purpose.

[1] https://github.com/rust-lang/cargo/pull/17522/
[2] https://github.com/rust-lang/cargo/issues/8140
[3] https://github.com/rust-lang/cargo/issues/17439


Sunil Dora (3):
  cargo-c: keep the build host triple out of cargo unit metadata
  rust: keep host-kind dependency metadata out of target -C metadata
  cargo-c: keep host-kind dependency metadata out of target -C metadata

 ...-host-triple-from-unit-metadata-hash.patch |  64 +++++++++
 ...ps-out-of-the-target-C-metadata-hash.patch | 123 ++++++++++++++++++
 .../cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb  |   2 +
 ...ps-out-of-the-target-C-metadata-hash.patch | 123 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 5 files changed, 313 insertions(+)
 create mode 100644 meta/recipes-devtools/cargo-c/cargo-c/0002-cargo-omit-host-triple-from-unit-metadata-hash.patch
 create mode 100644 meta/recipes-devtools/cargo-c/cargo-c/0003-cargo-keep-host-deps-out-of-the-target-C-metadata-hash.patch
 create mode 100644 meta/recipes-devtools/rust/files/0006-cargo-keep-host-deps-out-of-the-target-C-metadata-hash.patch

-- 
2.49.0

