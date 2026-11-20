Received: from mx-relay138-hz1-if1.hornetsecurity.com (mx-relay138-hz1-if1.hornetsecurity.com [94.100.128.148])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1662.1795160754057036084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 23:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=TZeh+xGN;
 spf=permerror, err=parse error for token &{10 18 _spf.eolas-services.com}: parse error for token &{10 18 _spf-paas.eolas-services.com}: too many SPF records (domain: witekio.com, ip: 94.100.128.148, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate138-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.84.82, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=db3pr0202cu003.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ELsGeb6IH7qeX/bm62dnp+Tp/gXnNolLwG0/crO3Z9o=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=2; s=hse1;
 t=1795160749;
 b=spMJslrFeYZ5Q9IJSUj81g7MkTH0A88x0thVp+kWNJclGZ3IE+mc7ZQZLXs7VF/Ezr12lLe2
 uskb318JaX8JaE6mmHSkk1imBHXie9RcrMd4Da8gM3NXCppGhFYBAYo9bYOI4ZvFPRaa6Kir1uK
 VXJmoMkrUiUb8OzK8KqsIBcyZbyu5sRm80xpHrYEa1th4XTD1i1dxsOsCDaXZRQAtwesat2Yhe7
 pN1bL7q5+8xr30iVmFi/J9ip1/j1rIjrsjWfOZJCDaRm37FH1MDnDiv31quqmUGMaCSfxwVMxQj
 Q22fOzFKMSOYWxFbaWsqxOlSsIU8ovv0m21HiPGiwh2/Q==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1795160749;
 b=i5YBxwk93xbNAiH+zzLM2s4ABCEm5+yU25vZCapdZVeF+ZqstwqO7G6W5+y8HsNf4XGMi6A2
 tqC7yNndeNkFABaEdh+uEv5ZBhX/YTMftcMIzTuZa83PK2SdSvnCoz5wN0q/ifIFFd86Xrc44TX
 W2Wj/dWYHWdgvSolLXUhtM6f1/DviCvODc8PbLMT8zUs0uqgEH2MbtAPQ4xjl3V+xC6mN3UErVD
 bqCIC9CLPVBSZ6B7NKTtzTeyYV4X7crzkgf9iUKez3maZYma3ZGkkU2S1p223DM0rUcnxcU6zEk
 kYkFtmt6UaMZBw/N69jcDuYSOLOT7Z6+erq4m6rI0Dv4A==
Return-Path: <hsimeliere@witekio.com>
Received: from mail-northeuropeazon11020082.outbound.protection.outlook.com ([52.101.84.82]) by mx-gate138-hz1;
 Fri, 20 Nov 2026 08:45:49 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koN2LcYBnnoSMUqA/C3xc6Cis0I7SulXiieeFgP2D348pwIurhc3RYRuKFJJI3zB2cwCsXFmyFxWbJLiNP0R8Itc6swDdzEhKiZbgbQ/YSTuHGgAHwFFUJbcfhnL9xZSe7PWXKAA0LKP6i8ZOeCQZgtTLKSkifpRDEq5A0LOaUvUfBG6IGnR9bZvftfn59goOdFPL6LiI+XQh+xTTJYau+9WFZV/eZds8EkoiQe76oHov5N63WSCAnghYPEstfcTXUe++96Hs0qwidaP3L+fQoyL1BMtw8+KxCruDHmOKi9iOFK17MARlMY6By82yqmFCBNVqcL1oXsXtAXreaLLoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELsGeb6IH7qeX/bm62dnp+Tp/gXnNolLwG0/crO3Z9o=;
 b=luMuaAt20ZN2KtdExAjsncSR5DkMm0Dcw9EWmT+1BdIOFAL1sAMPpX/qOSkcfv10Nu5eBCmNu3PoyQKtc1xPowfakHHgHyoOu+ZmYalVUXD5l76s0p9bQ2u1bXkwBYZ0ThBJzHxbD2i68eFwpzDTCFCY/Ssbk+vhUWTYeECQh9AMNVd9LijolABi6YBz9+GgjtK+QWwJWOwbLOeCLAhp4MlTNYc5y0+B3daWf00H0EAtFgXFULBGQ6ZIpo90dxBiNBzhwErk7BD5f9iZRH0ZxyN0/+04dtGcNM5MyYe5OBCcWScgWedNN0EEePKCCkqV/zjwj8cpUiPj7eYoX87ZuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELsGeb6IH7qeX/bm62dnp+Tp/gXnNolLwG0/crO3Z9o=;
 b=TZeh+xGNosYdjG2bq73mX5ONIDbTKZdGFyiqLk8AFPKyDYG7PP9a4gj1Bvn+cUbWpJuvESdN63xZVmAjpIAxU/pRbMdGk6xbfJ+8d1jujW/T/04XwQB2aUXbEeQ89O+Vnh3iYh4RE5yBzEVH715SAx9lhAWAynLm8NrVdCz9Mo+T/oZucsXgur2ZCfb1tlrP4z0GS4ukAkV+OPHRRwzlNRihyNyO7ndvD8FZtdtWWJXU8zkZWPyj0YXk3nVhVTvhVDi3te9861KE+f65S1u2KRh4l9n62cQh8JI7eSVLB3noowm9WVqXd5yfQXMY0FOUYn1Y6DMgLBJUCrEcqOqjTw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 AM8P192MB2822.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:6bd::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Fri, 20 Nov 2026 07:45:41 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 07:45:41 +0000
From: hsimeliere.opensource@witekio.com
To: yoann.congal@smile.fr,
	openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com,
	mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] [blacksail][PATCH] image_types: keep the rootfs mtimes in ext2/3/4 images
Date: Fri, 20 Nov 2026 08:45:28 +0100
Message-ID: <20261120074528.2738167-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <DMZV3VHOJ2E4.13Q2IBH3IK94@smile.fr>
References: <DMZV3VHOJ2E4.13Q2IBH3IK94@smile.fr>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::16) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|AM8P192MB2822:EE_
X-MS-Office365-Filtering-Correlation-Id: 47d8bae7-eb6d-4eff-8212-08df46da467a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|10070799003|366016|1800799024|376014|22082099003|18002099003|56012099006|261026140227099003|261028144727099003|261022105027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: unWo1KCG29OGS156SL21V8uAaN7hiP2ai/h7E2XgkTvWosvwQOo8ly9aJ04yWbeFsn5kdGA6C0m7OPKOXCbhJ4danj5MDO8SCHdO1O39zKKU/QLGrpsuyBTLQ0C/3t68j9u6r3XF24gDNmtS7vUELi80Uome9o3W4jq9Yy2LVvh15CnCp7FaXeyTW8JdMab6CmneOCiOWNmobDLbrm0wkadu0oys1w7LC/QuBQeG4wPpe72Ij1fP5S1R14/kOJfKRjoTwGS+qZwls0Na+/ALiVk1o0+otqGgbD7SAK5H8bYpY2E3o6XzxQpxslBLbu4Rr3TxsTb7Qy/m4qd7C6ZmoJh8Cqfq0+Omu9085OXvQZ1L5JIhLaqdNYlqoQ7VT5ZQdarShDZIWzg9XSdqWkAwvl8fs3G+9Z6BT0WZiv9VphXVRjbrDKnRi94oYvD19jmmwvgQHqCBCHQrLnkZGZFplMX7YDEMCSuP5KHBdfDfOjpxu4wWJj2DfMGoq0KpnyOxNzBXwT/iwac4xQXpuxwJlb6yfUGNuaj6MxUuwyV8JtujzqNtPDIjna1pqcVJiJA0GcIJYzEwgDsECIa82Wjo7hIyZUH/qW3qx/kKltC7v+s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(261026140227099003)(261028144727099003)(261022105027099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BlPbEsDB/xo1V/KdsvqFbjBdu3p98RzhzCsLzoSs1TONI7+TtGn+WMDIFVQ/?=
 =?us-ascii?Q?xO7XIbYRXU0aYgQyrYKGotSJGcLXGkufLJ8j9Uo1O6W2zofjzYjymO7WJNNi?=
 =?us-ascii?Q?tth+bhP8sIVT90IY3WX25k31LSVo3CjrbfwBrWgRB2i58vkZVjrYT35E3yAU?=
 =?us-ascii?Q?ZzYjzL1p4Ib0QIlHnUK1G+TXbXwY4Ijm1RqBuHjwbsA4ClOX14lO1tsnrVZf?=
 =?us-ascii?Q?GuZB/McY++FoTuvsNuzItVLWZshOGFAImjwgzl40axJl626DZJeoLj3TKE4l?=
 =?us-ascii?Q?3xTwWk1TTTdhiXRo/nQEkxfXkklbhEdvwtAz7v9LdJ99K3KyAjf96b8SZAiW?=
 =?us-ascii?Q?ugyTJwfohPuKvqR2d98EapnENxjpCqSXdLeZ7pNsAQ/RRhhWfDFUNEM6tqVx?=
 =?us-ascii?Q?g6jmdQJvjWchMLSdpIvsPYqrBFxT1iviU6jCVG7bJHwlYyVawKhsd6L/Z7/X?=
 =?us-ascii?Q?KnoPRTAYag1TzHbmKtagghCKC3HFoc0sqdtbx5ZseSv4jESo5OB6CfuqVbve?=
 =?us-ascii?Q?0VMZ2UdFEiqFEdYvDm+itIqjZhULL+RrZRCjxwkEUvAeMBi25hj5iuhnqPFY?=
 =?us-ascii?Q?xRVPJP+SYBfmbsWLFw2pJ8kQlLf9c4Jf8o4+8tIlgff6Y0QQGErENhRqGZXH?=
 =?us-ascii?Q?hXacZ8CIjOCQURqb+C5U0cLOetfhos16iI/fSG9hBrg4kGqfMKBQIJ2BchcM?=
 =?us-ascii?Q?hAYCFcjl4hsxEuseRutFg3g3R87cE+OgVBzqf8f5WW2QNgBUKzlu7ZqzK9Wj?=
 =?us-ascii?Q?oJQshpHHj0zvYyyOG9BkpSFYyQ+mDXp6gk3YZHV3CAi4wiVL7vrO9r+YX8Cu?=
 =?us-ascii?Q?WNY5oX6u+ItFe1GV0qSXn42omxM8qzkTOtdzuqFRKzcqWLu3f8GxjCKLTEaO?=
 =?us-ascii?Q?3CkbSu95Q1pAoNsOBzhfneHNMxU6Yr+CqrpiRxdd2i/oi68cwyfhGQOIoPfF?=
 =?us-ascii?Q?64PkgCpoAHa9fNeisSU9M2tvfoTvhNn9ZXJ4JDLdTM/4wJ6BhGYGhU5063AF?=
 =?us-ascii?Q?3uB9dp6DXrF3iuHIjx7SalGeeGR00wTdiq+JttIavFT8UE8sK3p+aUoivKNK?=
 =?us-ascii?Q?D2uSLxgBkxZGNG/uVbfxG0Na5YM6Eltrgtts1Sa+xcMOsp6DTEJqImN/fzNz?=
 =?us-ascii?Q?mUAIZIv3YFTjQXQUepDNVk2xZTFxomnR5KCMn3lIopPC2xBZ8+EtHDDLzVPR?=
 =?us-ascii?Q?7YYADdaT3TEnZRdpFByq8bvWdvMeyAL+f6tSYwvRiLkstek39fCgre6rCOcb?=
 =?us-ascii?Q?57uZQFq2sIWYogLgqAEIXhdaFjvpr05Qzq7Z9U3dZePtFRz1rk7MM5zynoTS?=
 =?us-ascii?Q?L0h639noztUCb0RWsKEyqyHCJGBWwuCXRzdufukdloeA60+Ur8l4sIZ7i2Wj?=
 =?us-ascii?Q?tVyOKLva71FCUSXOKNUb0hnrkQxRN/vakmj9FRWeg7HUFsN/8qnn4qLuUsXl?=
 =?us-ascii?Q?3oIINflmD0MDL6YUEKRVYU5y9JdkX0P+2w2qldNLUXhf3N8vJeN+3Gl01yJ8?=
 =?us-ascii?Q?vCI9hjjn1xtZIZosvEXchEb/euI7A/+cSKNJkBoeVyd3bj9ZlCBvHkqXNcDD?=
 =?us-ascii?Q?VcPlHEHkEbO8/b0zJaMiwQRBnQOguZbpfJ+lZxATouCJatONPKfq9rmCHptR?=
 =?us-ascii?Q?h1UnljJiIG/qL5NQVN4yk4rsaatgjrNcTvWAkoCWOh38mQ+0vJe9/l08U6sZ?=
 =?us-ascii?Q?ma2qssrxoPe0ykli6+BWpkY3mYPAs1kQAEJmAr2XF9E8ZR++eTW5wO0iyLjP?=
 =?us-ascii?Q?CbC5yaw9wKGlhLeV4idPX0QrnI5YEF4WyzuOZx5b6PwsCmujeU4Fc1/ohnSc?=
X-MS-Exchange-AntiSpam-MessageData-1: 4BanzSV7YF432w==
X-Exchange-RoutingPolicyChecked: ZuC+8Z39FJ3Np9BkooUyydV/J1BSBYIOTpAEoOt5STY1j3PgSYWioSc+rOfepQ+mW/d1tU10PC2Fsc88EsFrU2Ahct0Lnbq1iZKZ2vJRauEGLyB6Vt0uNGyQ/U8rQ4KpxefqNewKxr0nc2SeF3m/wh/6xqPLNgc+/9rvLCOyHtix2FdO5umO1iCItpLYadU9eXtEdwz8tOFmImciwjNOO65qSNofhrKSF6TanX6sY2ao1PcFL6vPA/0n6z29uuy1n+VmDxcEdcD7Zry5hIAFxN1wLm1rOJjpWlt+pWPafZ1ZpucZNlBDJddzXlkb+wrcH3GKIbXZAFKIQYV2AZch6Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: BHtnL7XqcLTNrONmIm+bn7uZo9JtAee9md2c5Go3PrhuuSY5zP37a7Hyzo0qF7bYMH7lIe1OIRT3YjKqRkuakVtwlwj9V5iGvihk+9Elqws6EirIhnqONS+0L4TlXBvoPN5Po3/yQZ4mE8+aj+/vOMzP21VsSdoDrOV1xxKqQzhWJ6WzZQn8IRI/RyD1BdRtpK6GQn4kh7w+Q+zfNGmCtN4V0SQo6rEiqPTdz1Gwz5HKRnFOwi1OFIDukotwY+MiAJcUFBgFIFwT1Rf20OlPP1sxl9FohVwPiNqshhWEL72XW+iGC1U4aiokRsC4qUpDTnBTxx1zxRw82E63CiQkPwiDLR16YAVscnrbDm7D0yUVafvJAOwjC4CbK0EHXUObHWAqtRkpShWSd/rk22DO4Ha7bqivT11J2T+V/RjXqTg3rG8QSPdvkLX9Gz5WXQzmB3+gCPGq9JebdgRqRbtiEJhskyoTPdTDv3tkFH0y14C7ymOcnhSGFjrvSis3LKOTDM4DAIj/HpmgWmIc9v0T0y0zaywUTQVrHypu6IX+NE5NaFeNZKCYW4RO2SfRKQBngDtLVRX+LQy4Fp5vqpXpwIcmUo+cTJm7q0eBvquq0OeLUiM3idL+ukacHwmO8MR8
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d8bae7-eb6d-4eff-8212-08df46da467a
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:45:41.0518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LI+89w3o2tk5rx5o1Kd1P012OGOJ83XpV4PYEKZO8i52WV8vmeFGHVCT9qpJgdp9rxUT06Ub2owgH5vgZIiVjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P192MB2822
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate138-hz1 with 4jW6nz0vTpz1NGXg
X-cloud-security-connect: mail-northeuropeazon11020082.outbound.protection.outlook.com[52.101.84.82], TLS=1, IP=52.101.84.82
X-cloud-security-Digest: ce343ffdd9674f216ebe7847ce057ae8
X-cloud-security: scantime:1.414
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 07:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250745
Content-Type: text/plain; charset="utf-8"

On Fri Nov 20, 2026 at 8:33 AM CET, Yoann Congal wrote:
> Noted. But
> https://patchwork.yoctoproject.org/project/oe-core/patch/20261120072058.2724815-1-hsimeliere.opensource@witekio.com/
> is indeed for blacksail, right?

Yes, that one is for blacksail.

I also mistakenly resent it as "[blacksail][PATCH v2]" after my
"please ignore" mail; it is identical to this v1, so please take
either one and drop the other.

Hugo
