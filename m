Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16898.1793100973148945541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 04:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OU8TsTJQ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OU8TsTJQ;
 spf=pass (domain: arm.com, ip: 52.101.65.64, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QNW9auylADvGRkGhb583sSMt4hBVli/qnyQY89hyizutBAs24gZ2BnCtVzXTdF+97J4rvtmMRKg/ULO8zYhyXpEM4e+xdiPtqQV516ai4BvjixULBLEboDWSVlbVwmXyFBqBOvjDI2JWQ/UTuO0enaq+ea7p8IrE0IDxRy8O9v6T7gNsuQ3/lpOFx3Z3MtpLh+Wx7AC+vlWBgw2KCnMYYwCsVUVqIozdCUGleyOfu9MC4mOLgngjNKwT+hFchaUqJcF5mP6kYXsZTMR2lcsMATwwX+LASDVJDIpi+BDyoCPoUdEiM7o5oaQkXNgOP/c3BGqLg7dHoAh7wHNS/xB3Wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jPemuYWFA3y8hVf/tKIqoIBowmBFXymEzEy8nvJ5pg=;
 b=Kq267463l8ZUwA7Eb8kjBWr+ccqShLCl9dg6nVz4oO9t++XnyMTGqrlP3wmCbHr2Mr7wDrYgKLWZbKmMdvWSkt9I3jrZVc5zOPZkP3l4MoaNk5FA7Y5TEr7zpfdRqJG89n/D1eJAQXxnXqWDRfECdPtQnYSKYAelT/tZt3W+jadx+nuQV/Jd9N2JSk1NJfDLR6O2WDohz7wffPV5FQIcu08xNrT26vDJAWnFNlVow9zDtkcGzF4ghtyB8VDC42I6tXDURYRRgVW8PqFyfWOGw2povuwBrydypvH79Glna0irj4FDVrHWJGi70ipe2Sfy+E3ipr6b+jrAMMIlvchnSw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jPemuYWFA3y8hVf/tKIqoIBowmBFXymEzEy8nvJ5pg=;
 b=OU8TsTJQaCteXyN3w0sZRwxyG52wR4qpDu2wpwCdauthhLmaNg5rMsgfXiNPslIgjCWjwKMdTzBo4qm6EvScA8aEV/bFuR/WJEjpmgFUXm2Oa23GN1LVSZcaTbkAvCo6Vu13k56t6p76EfSw3U+3y5FGg2FkYrL+X9ZXuWdkvcs=
Received: from AS4P189CA0033.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::6)
 by GVXPR08MB10939.eurprd08.prod.outlook.com (2603:10a6:150:1fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 11:36:04 +0000
Received: from AM1PEPF000C1ADA.eurprd02.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::15) by AS4P189CA0033.outlook.office365.com
 (2603:10a6:20b:5dd::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 11:36:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000C1ADA.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Tue, 27 Oct 2026 11:36:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upezUDNa9h3VlKj7j3WWYxI2kXBG3awhCyf7WdCH+8OnqWDXV4TOJBgXjIUfsDrsGULQ3mEkB21JOsllhX0OCUVrEjQaOtnxom/0zyAVjjnw1mNHR2K1fLR6ioe0XGb5CdrmDzv6Bc9DJ6VzedA1fbnxEsVfREtSsnI9cQSSTWaKN9S+VB8iAU9I4j6ss6cm58Slkvwt7pWgroHz+ThagfwdLCl+4ZMUEgPILYJ0Gb5I2fyImDnU8qdEpn54VpH6T6CKWulR3AX2csw5FaEg9X21IdVv6st1R+4F0RGyeeOp2TyxYkkzRATtx6clJrYUcKeSEzxFDC19OjBpy/HqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jPemuYWFA3y8hVf/tKIqoIBowmBFXymEzEy8nvJ5pg=;
 b=V3qDnidVSOcKyHSnD9Hb0Bc6SsQ3UvJtRd1PYKExjEX0iLRaVpun8Qt2iF2IH+M4VxltgGQBodsl1iELf0hzS59c1EkqSfOcUD7iJ4MZc0OLGioXq7aSbioJJZ8JIxyclLdffYiFYAA2SCDJfe+cyHXaXt4szZaTBdChyHS1WeEfe6+FccErGf1Hhv8EEW29K4bVDIFw3ojq15zyMsJA/qLW6KK5GLPyJpmns+5ap35DH/nzaVr1JV6Qe1mkI3f1pGATqyit3DIA2TJ7KbMq0Tsk9VdZwcIdUGX9d0HSRIFZ8NiH6fhpFbQktRZeolIVcrsiPTUCtKT4TgIg/Qch7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jPemuYWFA3y8hVf/tKIqoIBowmBFXymEzEy8nvJ5pg=;
 b=OU8TsTJQaCteXyN3w0sZRwxyG52wR4qpDu2wpwCdauthhLmaNg5rMsgfXiNPslIgjCWjwKMdTzBo4qm6EvScA8aEV/bFuR/WJEjpmgFUXm2Oa23GN1LVSZcaTbkAvCo6Vu13k56t6p76EfSw3U+3y5FGg2FkYrL+X9ZXuWdkvcs=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by PA4PR08MB6302.eurprd08.prod.outlook.com (2603:10a6:102:ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 11:35:31 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Tue, 27 Oct 2026
 11:35:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/6] expat: use .tar.gz instead of .tar.bz2 in
 SRC_URI
Thread-Topic: [OE-core] [PATCH 1/6] expat: use .tar.gz instead of .tar.bz2 in
 SRC_URI
Thread-Index: AQHdZgap0G7q2TNj6EGKbPTEBZzearcRQg8AgAAAY4A=
Date: Tue, 27 Oct 2026 11:35:31 +0000
Message-ID: <9DC5476F-0713-40E2-AA32-092F35865302@arm.com>
References: <20261027113048.1086884-1-ross.burton@arm.com>
 <AS8PR10MB50736A62150518929372A762FD602@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB50736A62150518929372A762FD602@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|PA4PR08MB6302:EE_|AM1PEPF000C1ADA:EE_|GVXPR08MB10939:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ddfa52-1d20-4f31-5e22-08df341e7b93
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|11063799006|4143699003|56012099006|261021123027099003|261009223027099003|261021121427099003|10067099003|22082099003|18002099003|261026121527099003;
X-Microsoft-Antispam-Message-Info-Original: G78aKt0fJ38Dxt7mm56BjwifGUit5U7/YFyIXnq9eV23L4tGFw6VzwhNHsrTuY7N0/BaUn7rzW+e+WsgkTQNfPq/saTa13wRx8YhxKUoyx63qLH3OznTPQ4Rurt32SR5nnmYDEP3JtTZQDK5hwCbvA+8SED3N8sRKcWrQu2TjWLaX+E0ex2dflM35CNcWlbiX7GVI9Agyyfihah8BDdVCOh8ylb7j7t01q7g67cvUDlLlpMVcGM/v1OYTsrDRU4dEOuepTUkIUP5XscvIsOhlYDLn5x5QFfzxmeEa9QnVjtmIexwMYcY+vlYUim++jIdnLlZ0Dz55xnmMfNpfILWWupAGgHDRo/HPdfS3Y3C28Tlo2oTIkkecsxv3KZSb9QK872th3nd2V4X4oWdfdVjvt5F5W7smlTG7J/P8JcGB83HFVN3RTvCzGWOcx3EEmjqYxUTPXBSNEDudKIHe8Q3FfW5bhOtsNuSRMZxIlQaOBWWrbRUqg08YU73PLPLpjDKRpoqakdmJcRPHPKJaG7bsyck35eyEwCdXUAXGkhRHWGIbV5zcflWHZAnK8jpq1A0NbRR1cJLPBBBXfzScE+IBJcATKDxdNpB+MKOMgxo98o/U+hSWwvnEzRsd0aDksk8fc3vmjVCyi26SGND3cQ6tm2l6pgmZIC72FQJ2Ei52mIGKDm4sFLytq7epQIDxh3rQ42ec07yHQJP1VNj7lHyRMJl1e9qUp3qUzbB+YrTYVE=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(11063799006)(4143699003)(56012099006)(261021123027099003)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(261026121527099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D1D9EEDA1D0B474683EDC4E8A023120F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NmHHnlzZDb0zvzclfUYxDADpYBdR6U/Inh+bqgpfrN43ShH2rdaDOW8TEMdkAkTTpXgMuiHaNeVaxaOIO7J1sE/0mVHlKThYAX46T8nYu+jxc8IktOX7Sk4TiucqWSwmZz8y8sWMpb5IooyCkKaZ8cWa+etj0SrgF+5dKQqrUNkfMvA2v1TNpOs+dHVbw5FdqjTPOrusI4SgytdL6FQVBGTCJwilvpFTEGxqtaqESZCFtd8l0ZR2MgwzJIJx384ggXucOW1EyOKwgIxlpxFyunbnh8i7XsOoo38yniRIq91UPetBkZkXoriW800/YcVLpt45y0lRqyt3PZ/bTzh9yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6302
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000C1ADA.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 40f1cd78-5695-473e-dc79-08df341e6873
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|35042699022|14060799003|10067099003|261021121427099003|261021123027099003|261009223027099003|11063799006|56012099006|261026121527099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: jfEoZ0nXTs9s98GcaYL3ZmyFybTqtwnsDxe3SAcs0x44xtMb7+Mkfr2A9cPM5X0zSyXSLPKkrAiNG49kRNJEIhHget3pChpjR3nlUAVQ9CF3yKSAjwkxGuA2qPwu6yw5tfCMeSHZq6dp6T94I8br590p/mzIDdjGP2dMTpt3DBPvTUjgLz/6y+sXrJHyAtO2lqN4WRiknN0ANTO2coHkOVXnypm9ZdjhtHWgpjzUmmjc9hto1xgrgIUZsiw2yv7/qhFIHneOg13RF62l7V7b1lswdGgHEBceAnRBcoIF29iFOn5t++XHDA3FIL1qlbqulpklgqz8S0VeQ0JLdsoLCauA5W6bpDgSjBWX75be81/PqZtwlMCEpo9Vv4LlQj+2kkM4S5xtZ4t/IFL2z29P/SnLmj7MAlS6nMcS/HV50DDOgz+2h5ubZTHB8Ws7uGFMcDJd0+4xH06FRpxv9PQBW/INV7gaYq5kdG3YogpYTgkC0o93y02RdYhTZLpmpyRvHaOJE6cGc3NdRiqfzu6idSJCRsszuAkfnoFFoCrNhhU3MmsWeVms2WOAEJKMAeD24AlY1GIXjKg4L7HD4uQ7k2KCuI/c2bmJaGkwT9VUPw6IVg6BiYuuwIjL57JF4UeaOyBcmNtnX97eARutMXpzPdV8iiJi/+ETyeWfdUubqaC7mzLrnqPDtNn/xgMbQnQUTvvDdk8RF4i0hF65xCC20Q==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(35042699022)(14060799003)(10067099003)(261021121427099003)(261021123027099003)(261009223027099003)(11063799006)(56012099006)(261026121527099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 58+QFPeQneYnN884p17yPHq+lHa+Iwi+NxdGUI3xanTjSStlh70v+lgPURQmGrzpTwIXRWtEfMLrZxOwxWA89oqTPHW0IfbmWdm8Cq916qroxjlPedbgr764ALOcbFERBqiSZDme79fV95mj6wfYohGx4vVx4Ju8US6Rwe1htlalIsGrbaH9XGe88qc/JRHK7SsL84BYLQNHtQsyTuypTUONk9Cs1AMjeq5HjC8SwzwRqp8TGMWWbfqRieZ31e2QLFYLaVAloEakBvxEEsWGsHckPATXlpSnGudgKJqHf07t/WKQ6KDnQ6FzYkAFtwBRMX/1bOdbpnYUNFSU+mvVPxj1W84L8rWEaq2B1sRqolnNxDnBfk2E6fcNPiqqIJ69yNnR5tQvN69ncSbIaIOYds0j6rUCmv9bVPfcwpUnKGfP1aT0h83uwcCVsnOzD2dd
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 11:36:03.6368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ddfa52-1d20-4f31-5e22-08df341e7b93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000C1ADA.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10939
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 11:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248742

<argh>

> On 27 Oct 2026, at 11:33, Marko, Peter <Peter.Marko@siemens.com> wrote:
>=20
> The commit messages in this series should be corrected to xz.
>=20
> Peter
>=20
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Ross Burton via
>> lists.openembedded.org
>> Sent: Tuesday, October 27, 2026 12:31 PM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 1/6] expat: use .tar.gz instead of .tar.bz2 in=
 SRC_URI
>>=20
>> .xz files are significantly smaller than .bz2, so download that instead.
>>=20
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>> meta/recipes-core/expat/expat_2.9.0.bb | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/recipes-core/expat/expat_2.9.0.bb b/meta/recipes-
>> core/expat/expat_2.9.0.bb
>> index e9bb21bd55c..9b337648390 100644
>> --- a/meta/recipes-core/expat/expat_2.9.0.bb
>> +++ b/meta/recipes-core/expat/expat_2.9.0.bb
>> @@ -8,14 +8,14 @@ LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3Df4fedd6116da0e171f7cb4d2923d7ac2"
>>=20
>> VERSION_TAG =3D "${@d.getVar('PV').replace('.', '_')}"
>>=20
>> -SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-
>> ${PV}.tar.bz2  \
>> +SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-
>> ${PV}.tar.xz  \
>>            file://run-ptest \
>>            "
>>=20
>> GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
>> UPSTREAM_CHECK_REGEX =3D "releases/tag/R_(?P<pver>.+)"
>>=20
>> -SRC_URI[sha256sum] =3D
>> "775e8a68f81a748a401dc3168318d4a39484eb4f954726f21517c8f42c0ba984"
>> +SRC_URI[sha256sum] =3D
>> "1e6371862cc31999b368c3b89b49994f0677e1bab5f1b2b85ae3741f5d803051"
>>=20
>> EXTRA_OECMAKE:class-native +=3D "-DEXPAT_BUILD_DOCS=3DOFF"
>>=20
>> --
>> 2.43.0
>=20

