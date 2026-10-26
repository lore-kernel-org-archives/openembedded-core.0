Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40070.1793010710108282949
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=IdhuhGpW;
 spf=pass (domain: est.tech, ip: 40.107.159.33, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZO3TZkoV2ndaiEPdw1wR9I84hgO6SXTaQAmnjPItRqa9JHDMRW2mGaIgfb6NpHyH8bz1yTSJduJjL18+o54ORrBGrE38tsDY7Gj12bkisnQsAWrS73JK1EJUa7w3D5BsPnvUvnzidwEK504jB+cq95Hjj6ZZvatkrvvUHfMyE0Xg9qUYtAw1G1dvGij3m2zo7UqzevFWhHusfrV1IFbeaXkJ+IwMmoYPd8Mc23XkMYisIdk8qLIEpCgXs5wyP+gqfZhlJ6JJVNqSXjR7IeZrws2ro5fSUJTqbW8Jfv34ncuWZhcMJDA7KTcjvLgsT8h2p7I5wR6LkgEiLN0h4clow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVmjtDbBY/2te8J9Z+NdT8aSqLCWfjjSqMnXi2xqnfc=;
 b=HZdbyDiLwZg+R4wn0yKpPVTsHeP+Qk6rcCNCHH5d+sNP1hiEVVQi2RVP78t489hIf8dppTXd9BABwgIqPE57emqnS1IeemUz2sm1R41A1XN4obQ0ymmu2o7Mq4AO7qXgGgZw3tT8M874hWmnnf1/H1rwChVXkNQwrC+GElgyZkrRveJJohNg6HIR9KPaG8HGABh6bmO5Wcjm+IkB61xtnG9ybrGuEmAtdmis70WdLp5VRbI2S/a+rjM1TI6vFEUzZqVTACCuJMQyZbY/QHB/wRLOKq9w8eeFvbJoE+tSb2H0StqNwr4sjiC+ue8OQdV/mcKz+0ovIt264oLH8CtlMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVmjtDbBY/2te8J9Z+NdT8aSqLCWfjjSqMnXi2xqnfc=;
 b=IdhuhGpWeC/QLr+WLQFP7vTIJGWY1U4dLbnp5yMNNWuNw1pdyopRoOo8UvChEavjZCPAELtZ6BO8ROEx//qDKxwDeAFccAwldq/p/j0fvzG2AWFjtxCl8V8Zj36/WU4wNMmvdVprk9PWhhg7g6DqDdLwsVyL/7Rlfy0szwzZbzpY+B6vwvo3IlbdwncGNO6Pmfyh0Zf9xNelTomrgX9Sm1pb8JDNpQEd6wH/c9tUiqo4r4oaZVo4hVFIiFNfG0PxlRt1LEZ7Fnk6qOrUaekJwxnx8EJhDnQPie8P5SAEdJ8Hn6DBRfjYkEwHTjcQ5iafCdBMlS2LnR//Zj8Jfp1U8g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA4P189MB1280.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:31:46 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:31:46 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/12] python3-certifi: upgrade 2026.10.19 -> 2026.10.23
Date: Mon, 26 Oct 2026 11:31:30 +0100
Message-ID: <20261026103138.3137-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
References: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0151.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA4P189MB1280:EE_
X-MS-Office365-Filtering-Correlation-Id: 0713811d-3e22-451d-7410-08df334c55fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261009223027099003|261021121427099003|261021123027099003|261022105027099003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: V2pLtlcFucIpNCwVsNi3NANy3LyTDUotTkwCp2TJhXVp44ogUtUBWjR0l0J2UCrR0Qxlj9yMU7BAalaGyetrjlEkIeNWidJTouOF/5XwDnEqUHSH4jUiHY2Bn+slnRvEHJ53SRECEof/fX8zgOs/UtLbMv+N1oP9GW0/euj9BcGEQzAmqIlWPA0PIoPjqPFCpW2jQmQhq0j/1ADjWS0u9lg1qkyHcAg3UI80eHb92X+tSICkHr4hNi3NeeQf1kh83C3G6OULzvcQIlM8IKkui8FQZB912ALE6PtYyt855Vj4Tu2+suCq7s/Uk3A6xUlyID3U2TKAsosf8JbzwCouJX3NgGk+xoKHqbzpIRk8+HrJJcq+W7DWK7qhh3AlDcAeT4097aY/EjPB+gjLQnHLyK7HepGjN5KX6w8tIf/Yui8ym2iO+VrbkSq62vx+9Kxls9lo4+ozd0h3O68wXZOt3Xz59H8vhHP0RdihKwfIn8Q9Jf6fhRZuaLPOgumdN6WKBLZj0gBwxMBUZazyhN7mHgRMUxjfr2Sn/ghXVgEY+Ivq422R5UXWaQfpJjiSHcmVeAUBakYgRK4dVTzxecvVxMxnwSA3/qt/FQzzSFOgMwA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BREmn1iep0bj1QDqv+jNjN2Fpgz/H91aHAdqAoNmWabiUSL7w5cNyjn35eV6?=
 =?us-ascii?Q?Ma7s/PysPHtsGI07MxJ9wqpd9sWeR82sQKMbm/P/9A1a3rOjMDa3sdtR5sK9?=
 =?us-ascii?Q?iJl6VOysoMI4mrMW7HUSYiU49IgPDz/loCsfbQFWviekhYEAHN+DGjhrwGF1?=
 =?us-ascii?Q?VmKZtWYcnfh0mcBR7IsZlI5BWRRoxIrLRAFDbbUXgLwxvelh2gZWGH60qclw?=
 =?us-ascii?Q?usMMN+lbGvdQNcRxO1RjtudqZ0svbjmUp3L7t0VOoOea3/ZwXgx0Z7Ebt65+?=
 =?us-ascii?Q?jCTUmqlcd4Oimv7Fv2pvpy627jP+xQLS1x/oAc68wssRopnEzAMBfxSMRH2z?=
 =?us-ascii?Q?Epc/x11nwfbsIgnZ2RE5Tea6+6S2n4A/y4BOR2Z6LbwOQ+KMa2zDQutP39le?=
 =?us-ascii?Q?+ezfTS18IwS8I2QhjM7WS/FBEAGmOHFcl49118QdrboShuyfbFRHI86NO8FS?=
 =?us-ascii?Q?NfZT2goftFBpzzCq6VXEqoGfNEfvt8viGzIX/PPP3i4fusf1928RgTRtdyXE?=
 =?us-ascii?Q?9QZ+UbhfdWahkTMyNUhdktMNo70bKrKW3kJGtKycqhAAXsdrKDMbpAhehoh5?=
 =?us-ascii?Q?GapMU8wzE+yueWlF5DO5HAvF6IiXPcoBH6PazZowh5INvkBVbksqTD5Jy7Gi?=
 =?us-ascii?Q?/FKivfltc6mVzQjpi23UHafKiOfxF8N6pqK+7vng2cCOJk1kgqhwtSH+AjXa?=
 =?us-ascii?Q?hbUyp9JrNdhAtwSB4/oH5SrxadcYMZmvrqFurw6HZwsRgHCZegqReix4qZfK?=
 =?us-ascii?Q?fAcwCWL/wLHUM4NufMDLVobsdkqgfbVrnoD2a3wOlyYVKSngBX7boveir35w?=
 =?us-ascii?Q?g2vCfU5m7FRr8+WGLMrNu2kVkuWm8pJqRpjp84rqYxrcsM7SwIylBNYQo35d?=
 =?us-ascii?Q?DWl32GiZp2nCsP6+ntawTSMXcbHMbMcHAHicRUy9cLxz4LfMq/uxneKnnc4/?=
 =?us-ascii?Q?OKW/zg0sAsCag3Pc5fDiY3PKnZcqWGcgz3Tyzqrj3o9tXRD93Wn5VpEtDfgA?=
 =?us-ascii?Q?flG8IVckVW0YZj/8guffjrIyIm3BWFOOPFT3r/jqb8FmjrMKglfUfeZTwJS2?=
 =?us-ascii?Q?whslejajb4AzZqEdCskY90cSCnB75tcpdiAetKlVN7+AfLjxPPpHzqdo98DZ?=
 =?us-ascii?Q?LIXNsyOHGINw6euEw+8TP3/UIOuGq4x28SMkqI7cQFtJDif8Bmq3p/chtBvV?=
 =?us-ascii?Q?aJHdeSOlCkHPZMVnABwtCdsyh+Pg+nBIA4mKQVH/swCAWqvDA/h6ahEp6Jy0?=
 =?us-ascii?Q?74KDLRx86AOJmgjdU8hdlUStW5Ehz1fAV82z9SANyBjEltyPSYizVk3mX92a?=
 =?us-ascii?Q?+cTHxh+/N/NvPfne/greq+gErGuC8hzevL5RKNuNwTUUBH4uSFLSzELsrRLv?=
 =?us-ascii?Q?tv9aBqe0fb1SQkXDEuZr5uPlAOGMXWSXK3l9VP/gW03n8AoxIN7SIYp26/DH?=
 =?us-ascii?Q?ecznqQhyLmNaIKt4ZaQ2xbBKCL1XQdrq5QUg16fzwofXlo4ickcr1IwlffD5?=
 =?us-ascii?Q?PuJC8wx8vT6AFTkDpokdrg/8szPntKRk6tFOncFVAmAPgbeeVRyEfHY9Vpjc?=
 =?us-ascii?Q?wn6XiBmFDmhgByKeh2sNxnVgqyFE9QUUhsYDvmDEB2TkhVeg8IMp+bH3Quqs?=
 =?us-ascii?Q?OQBrDiqFvZYQ4K2+BgFM98KLAsmTvSznxxlfnfYuCVHidWmQrFHio+DC2tLI?=
 =?us-ascii?Q?lNvEptiWSB62tcAH8qNE7kmtNPc1cQeQil8YTCsYKW9QUpM2ztHk+e65O82S?=
 =?us-ascii?Q?GVK8rFtk4A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0713811d-3e22-451d-7410-08df334c55fc
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:31:46.4773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0nXu2RKgB+HdCxoPGsZlmCgjdj5DACvF/juKaBTqWyV+jp/gRausr5qgcTGkIQAFRUoRFu5npeaVvsv7ZhRo/wnToHvEg74LxJ5pZP3wVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1280
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 10:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248663
Content-Type: text/plain; charset="utf-8"

CompareLog: https://github.com/certifi/python-certifi/compare/2026.10.19...=
2026.10.23

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...hon3-certifi_2026.10.19.bb =3D> python3-certifi_2026.10.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2026.10.19.bb =3D> py=
thon3-certifi_2026.10.23.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb b/m=
eta/recipes-devtools/python/python3-certifi_2026.10.23.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.10.23.bb
index 02cdbe9a08b..670b96b006a 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.10.23.bb
@@ -7,7 +7,7 @@ HOMEPAGE =3D "http://certifi.io/"
 LICENSE =3D "ISC"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D11618cb6a975948679286b1211bd573=
c"
=20
-SRC_URI[sha256sum] =3D "035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075f=
f8d2fea780a1ae"
+SRC_URI[sha256sum] =3D "a9895e6e2758b371e0545e321a3a8fd1fcfd9829ada8824a93=
6dfb16aaaf36cd"
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
