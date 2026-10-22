Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21952.1792672483066871624
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 05:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=IdKvnDK8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=IdKvnDK8;
 spf=pass (domain: arm.com, ip: 52.101.83.60, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FLGNIqdpuAM2MVcPSPgH1lNtmnWOiDrXskAvrsB7fbHR+AiwJIqGGEt8ndu6R8aPiSf1d2zfiHATN3qOprRLmDCJy5AXDQFiwIdzUj6nXYLYy8MrRn2jQE9Q5xdAHrTnuFhvAzKXC3aZBX4TgmgxSxEIH3hA0tFSBeUiI3PC4ibw9o7HGaLsF/0Or36owzdhNwpO+nfRE5YJsvCnowQ/9MtQ4RwzGBhc3JuXRDBLhfgvIwEhio0tuIqfaOgsQtPRVyPBVHVybr5St5Y8IGvKfo8Ik0QsISrAkD4/7GDvHT0/+/27HQaPx8G8kdAlDdXW9dtwkfej9UOo7zLV6z+FPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBPb4YyL+UtC8isAnv8oPOEDkCmUP2v72sl/Nr4sdOs=;
 b=pSTYJFEZca+1VHPhvrdsPfO/20yYHRhZR8W/xtZij8lhBJLW6kIrClyTCob9ZklsfS+qL4nSCdvZjoFlF96czs+Lh8j549T6VPsnwWFGGD1zDbjx7HeFabJ4MWg9NyKyNR2ZKFiVR3kUKiZ5ygQ4mdu9CFoMq+pxEIyUnyobz4ZbExSBoV7AxlLeX8TIpo5vATpC4JiuLebEd3szNd0LTZlIqTvpbmdHtxr5ITvUphkZjcBLlzlK+Ca1dbZ5Nfmu8tRor5Z0wYIX1I+vCrOj8orU0hIiwuJItgoH2o/7+PBTYHx6/1+eBK4idkA6ZQsmC2xKrcj4ynKhZqj8ns620A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBPb4YyL+UtC8isAnv8oPOEDkCmUP2v72sl/Nr4sdOs=;
 b=IdKvnDK8qhvAMZE34d8aTf4sJBQgTgXbQHI98+qrAiSwaEFSRtX65SgOd4bmkcVGvYoUgZobXnRueT51xbSFju3rzsHHoqNOZN734ysPr4D6bnMUF0Y41VnZybuJiFkUphEGB994NRf5EdJ9JZ9Mkc+lFZc6lZ3iN/6K7o0/ZTA=
Received: from DB9PR06CA0010.eurprd06.prod.outlook.com (2603:10a6:10:1db::15)
 by GV1PR08MB7346.eurprd08.prod.outlook.com (2603:10a6:150:21::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 12:34:35 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::5e) by DB9PR06CA0010.outlook.office365.com
 (2603:10a6:10:1db::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 12:34:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Thu, 22 Oct 2026 12:34:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q05oeulRscEhTKWeneSCJaKcGPAOEjAwvr8feasdCdl1IxnrGFnE6XcSvu1lrVdOsEHAEO5PE17a+ngvFl/vgzpuA+jvhm9DP9ThB9YPBu2j1NjuTG3rmUMWgMKdro71jIjK0tN/DXIoPOOSf6vApIausPqjqqolPLuLpJBL/viLbNtGf/zc/wA3l1vXwb7aSr41jAvfVQmVk20REaCyhAMQUV55gfo2ly3BzNuwnW7L7fGKp98eZ8sAsb0l6bsjNvowOCrQJQLszdt1LEowrO8e/1t47vgEivn/Xqx/j3JgpZeLbMhtrL43aAXDAEtUkXhxXNTW9ZpZ86qh++dOjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBPb4YyL+UtC8isAnv8oPOEDkCmUP2v72sl/Nr4sdOs=;
 b=w+O1wGjhl7zlOYMmqWdh0A9rS/0buNerQT8DHb2uelbgxskl+MCXMDUwNYGBExggDD8xksO46VyvpmAIHe7pglrzWL/pCgsPiUjZR17Nhj7W1x0EKKF/y66XsdguZZNn15ZWPQzEYNeH3eIpzOW4qGRJ5sshdo7aTJuBximuscw8TFlIvXwsF4EqIDB84OXU/rF57NboeLUq0ug7QE99+p7PuIliWBIg8qynPlDHYqvySLRVDb3ia+8Sc30ikVbB65regIEcBVEB0O7zn9T5LxeXnAn3j3gvg6iZt4mVk7Rw7jbhH8JbMFO/LPFiln/PkS+83DnuntgUxTUfBnnutg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBPb4YyL+UtC8isAnv8oPOEDkCmUP2v72sl/Nr4sdOs=;
 b=IdKvnDK8qhvAMZE34d8aTf4sJBQgTgXbQHI98+qrAiSwaEFSRtX65SgOd4bmkcVGvYoUgZobXnRueT51xbSFju3rzsHHoqNOZN734ysPr4D6bnMUF0Y41VnZybuJiFkUphEGB994NRf5EdJ9JZ9Mkc+lFZc6lZ3iN/6K7o0/ZTA=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 12:34:00 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.006; Thu, 22 Oct 2026
 12:34:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v4] libsoup: add ptest support
Thread-Topic: [OE-core][PATCH v4] libsoup: add ptest support
Thread-Index: AQHdYI5TqYkx4jJrPkK0yB9DxB2+zbcJghCA
Date: Thu, 22 Oct 2026 12:34:00 +0000
Message-ID: <1325FBB0-1DC4-48A2-A4AB-72F22FEE1D33@arm.com>
References: <20261014085044.14497-1-pratik.farkase@est.tech>
 <20261020122642.28387-1-pratik.farkase@est.tech>
In-Reply-To: <20261020122642.28387-1-pratik.farkase@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|GV2PR08MB8121:EE_|DU2PEPF00028D0E:EE_|GV1PR08MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb3c56f-9954-44f0-8c39-08df3038d444
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|18002099003|22082099003|11063799006|4143699003|56012099006|38070700021;
X-Microsoft-Antispam-Message-Info-Original: fbXgWnX+diL/cMTvol71kKjWAUKCGKVFc9FeZu6m1faKomjNobD5dlth5Pb/vW1nRUHtaOpQDirU6Q+vUgUNMUGnkX2NlvN2fO9TuyJIGQ1YUmwATb3JoAJsGJ5QOZM8dtNDsXoy7rJIHmOI8muiWMrhmAWe8H4cAbVzeeOPxmyk8scWIeSyPCSbH3CTOL5FaSXCxbVnl93+lzzrjm7WNjCUUdU/VO6vTU56BYy7/1RcF0Kro+HhayWcmodqIqD5oHywqRfRyMESijwJFL93F9CTUO92CHRKZIw9cjLX2ShdAsuddLSNxHf8RnOaFNwAz2aKYgkIGR9QkRskh0uxMgJjST0zM8IUC0D2Zq8TwYuLRFFVHUuVfhBA4fliv2Wz4+Iku/jTs6Fz/PdJBBnKebtu68pVpAoLPjjXzN394d9rXuSrEDz2QmTXvdFVCHrISVvAqQMtrAiI6N+aWsOraiEVP4TcRyZBN8TU5o231jGO9Y1wY/3R6v7cM8PAu0/9+WEjGsuB4NZijY6w01ronuauiNTzRG+z2sueCRVAp0LRh1MwY+4ipV7yfRxg+a+hPen/JLPRjyc3SgXMeWidUNebdkwhCico1LZILysGfuZRKZo7Cay+dtWmjtuIhonPU6gnojLOu898/TWOO0F8f2KXbsGVzR/b4N/YkcSGGV3fYN5Evf3+5qL9qKLw8JU02t6X/inKRV9Gup5CaN3HBCvVFXQgsYhzrDqh++GCDmw=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C6B615551D0EDC4C8E8601F9BDCCD537@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fBBgbm95dd1Xykkv3gHH7VgoWQMKpNlCOIC5DTdqCIxJ+bbRO14lfKa5+sThc3oSVJ9ifd2rp1O9pV3KqnZtAoLgOf1/N0TFP21zNYbN2ud7qlGwRTCFrPhhVH86woV2LbfWNRQJhQFs9NVI6aHPaHlg6GIOJVktQuDRkc9iwLyaFtDEJPGQ+iT+WFsDGljhzDjsKalFhg13Zq+GJ+0P3vJpFRZPwME1s56xMDGkYQEZmRlxPtIvbouJO3Pabwujis098atwacfx+vPGujhGZadjclH26gh/WeIe9ZBGQ8e34WqKDSL0gGkD5knl00iOiGaGITtB6smnmQqQd+QOMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8121
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 24ac965e-76ff-4152-4ab0-08df3038bfba
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|376014|36860700016|14060799003|82310400026|23010399003|1800799024|10067099003|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: JxvJhMbaEGGCnbvefMuSq2oNOEReOx6heAf9L4HzrNwMWsrJspHoGR2aDzrY56VmjKP2Oq6cOtD7oBnhuGMShfw++zbrt8b8JHMGkHQ2UiK57nhFQJjdm2igNcQpvkmB7O1c0IPKTcrquN3WpBih4ldvyNlNEuwrQZVl3SR50jsANyU2XuKyp45quGaNsv6GXntGdWGTDOrTm3RLOVqWA0l9cEM16BQI280mSBC2kXUlARAa4w1KGdhfs3fHv12KyCkDzYV1P1OkNnsJUkuOkkEwI3GLEqnt7mDkVvqgNTX8KADt8ZuY+qpWp+DTt1d6T46JJ6ReRdI35ASwBZAh/XLBnv7/NnscYbUkSQfU2j4zPr2gzqIQ6lGCGGOSZAl4ZMwoyd+Fj4X71wGGqybrXuwCBIi1ZuyXpaJTdO0ptZOOrgmK/DJ9wcq/NiVdx2oVsQo7yjSnWPmNK0pUfey9Wt/xs29kTghUBNovaKclwbZtItf4S1z84JRuyERahcgdqG0ExfmESfmGFnXgvo/Rgx9YIb2bKBnL27zbcrHJA70wvwGzdqrpKQfHLmTS8M9QtwZwcLDgQR96x+El75kRuSKUXta/UR7wwL90ZTmN2dR+J7A+i3GYUwQ7ph2FKQ0zQwNUFrZiWWEL2cpaD8apWasaQawSf0iUm932QpiUr+xvZVEEnD6eCnh3yybauHyCSjGr6G3+0iYlb74TCtdgow==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(36860700016)(14060799003)(82310400026)(23010399003)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TDfIuOBfphVtJ84YWclQXGrNbtvAUJPESu6qg33u+hDYbidKeH/mKtc5EuO7ifXuNeSpalbtXenk6dH4lxxeM4cmdARMmm/mhuTiptODz1qSGjoFez0a+2FevEIp/tuDVFsSH40Fg0S+Ie/TqB9uNRuREzaL0eoTHwUqq3PhmoeDCKpDvS+gQfPfDt3zNDcT0Jk1Ic3YOKrExV9hII/m7G84kDub/y5zJ2+3sSMcZuDpwwaGg+YUZz7UFfcHsOwq4RWVcbXta04HEHEU8XftWqyyczaAWaSHzaCJ3nPgA4TIbLL28ovFVyCG8jjOC/rdbAs5++sIQJ4W1VjR8sMgk6xWousk/4SriO4QsVt19YVSBQc5vxXQv3WJ1Dfvj9PeB1PBjr8vzsvGUJv8oly6qqk4kTBM43P/DaAJFkUqeHOfsLIfDJKlY19b+Q6exXuu
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 12:34:34.6488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb3c56f-9954-44f0-8c39-08df3038d444
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7346
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 12:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248442

On 20 Oct 2026, at 13:26, Pratik Farkase via lists.openembedded.org <pratik=
.farkase=3Dest.tech@lists.openembedded.org> wrote:
>=20
> +# These tests abort under ptest and leave the binaries in place:
> +# - header-parsing-test: a g_hash_table_size() assertion in
> +#   do_param_list_tests() does not hold (returns one entry instead of th=
ree)
> +#   with the current glib.

This feels like something that should be fixed.  Is there an upstream ticke=
t or fix for this? If not, can you file a bug?

Thanks,
Ross=
