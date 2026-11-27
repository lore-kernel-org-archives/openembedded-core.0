Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13018.1795771034253337509
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 01:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gAQ+2Tqi;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gAQ+2Tqi;
 spf=pass (domain: arm.com, ip: 52.101.84.12, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AWtR1E+3tsKpOx9HdwOnkdTb8fpGd2y+iJrY2TOML9jocQxFFPNgu9QUslDgoSB2+aS+/nZEeH7AUhGO3bMxIbGQSuK1opJEf8A6k3r8Q3tbfn3JtMyFtdM0v8kt3nmH4di0AlnuBYp3sul1xgWcDQDDocBFe6VMpdwDT/lYGNNGO4Rwo6kD9Avje5iLaTwp5rRFDZ0TDQQdKtOjiOCI/vfCz4iobYOEmizSxUFkPm6DJTN8UXpzsQ69ULV1Oen24+Am94ECnqAmBn/5aKVkyA06w1wEd0qekm/tEfPBEmzCJstV0lqPpiGxK4TmtKvqmpqdwPzEFhTMZAX0Ujccpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0WNkqMKh0X9Rbod+zR/8vBgZ8fsJVz1Maf1dwAwUGg=;
 b=mNNlpHC9FfnteotX/mYfbmVwE2KPfFXFyUJxD32hpuw6JSIG7DiTZTa4bN5I8LQ2A2m2EGsKIYzmOdBE2Y9TE2ExfVO/R/k7qM1wH7ITquW+Uqk4wIQb5oZAf/bBCBFC1NEgZjYt1fgDUY57vGLcK1LYJ5h6vJggKu8SPwSGBsCtBTsVL7tUZrCY9Z7LqFcBvu3GVO0dK2b/P1UB5876/9cbSR2Up9imkr46ulBi8RpBPvQvHH8LMJq2qsQX/Dlv4T3/RXsDaVUWoAPC3PdnTKMk6LGj6XIEk3RS526b0UkoLCmnz2sr3Pe7PGmCmSk3PsM1putLp63i49TG5BLlyw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0WNkqMKh0X9Rbod+zR/8vBgZ8fsJVz1Maf1dwAwUGg=;
 b=gAQ+2Tqi77YjP5dBAelpqjJTX2gLXRSWJCqQdyjkJ6i8hOfoacRIdxSdD1VBoIL82V6KRbn9hHtzaRlFEAWG6/ciZZugoWgxvdEctsAS3f8S9Lc+KZq6CdXqWy/KsFgtKiHJUEZU1rxyBE4uj7H/1+4nhc7VUcQHYp+iVl4l4I0=
Received: from AS9PR05CA0064.eurprd05.prod.outlook.com (2603:10a6:20b:499::14)
 by PR3PR08MB5802.eurprd08.prod.outlook.com (2603:10a6:102:8a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 09:17:09 +0000
Received: from CPH1EPF0000051D.eurprd04.prod.outlook.com
 (2603:10a6:20b:499:cafe::28) by AS9PR05CA0064.outlook.office365.com
 (2603:10a6:20b:499::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.9 via Frontend Transport; Fri, 27
 Nov 2026 09:17:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 CPH1EPF0000051D.mail.protection.outlook.com (10.167.241.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5
 via Frontend Transport; Fri, 27 Nov 2026 09:17:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxkIAKcX/IVkqbhQ/CPPuQd1FykHRl1K9pPDfx/3+RygoxPyU/M2MsHVSFaG7WyLDMGK2MdS/BgXOUkjohnY6gh3o+oiglzipNpc+YMYw00lbnQc8IiLm8vQUL2uOik+B2ghBA1IvF9QkQFZu48AY5CLvHBKll9k6fUmRa32mSpVR7f4ronwv0QL4lqYsCMkXMq/HlSc930CjcveUK+lhTDaxrYHJ85L1GQ9/HQmpb5Db6bWPhqex/wT1+dLGnKKDg5SO/L9F0IQZ3ZHi09RQk+0AL7zEo/OUz46Ep5LsZYUsTYL8EP1IaBeR/tvDgmqa5vOKUD7Zjne/fpJaB5e2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0WNkqMKh0X9Rbod+zR/8vBgZ8fsJVz1Maf1dwAwUGg=;
 b=BNWNuavi2bidfLrMUfQi1ufSxoxxhQdhCPbZz0LrdLeHw7wZAq1AgN8zdY90LBfyO9SSfXnONeiYtxdcTIyKufVL0k2eKA9R0NE9gHHM9Ydp+ionqhTSERrGO2WeF5bl1rkHOx5AbpYDGHk8sCbJQ9I9CFNvw51HckWV0n+9ZJKJ0qJtF9YhxquC4Ox1kfUf5uR3mFDJiZiM/MUrc4BWkJx2bgYe2C7xEFtHUEUnN/fDewzVqM0bfxYnQ7Aav1f2MRozKRGfAmjijOrf0SH1N85MsfZQm5IJsmAuiQoQwoHHfr1oOUJGEGznBX0HPamCpiDZUdu9O6msK/qiV+s3pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0WNkqMKh0X9Rbod+zR/8vBgZ8fsJVz1Maf1dwAwUGg=;
 b=gAQ+2Tqi77YjP5dBAelpqjJTX2gLXRSWJCqQdyjkJ6i8hOfoacRIdxSdD1VBoIL82V6KRbn9hHtzaRlFEAWG6/ciZZugoWgxvdEctsAS3f8S9Lc+KZq6CdXqWy/KsFgtKiHJUEZU1rxyBE4uj7H/1+4nhc7VUcQHYp+iVl4l4I0=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by AS2PR08MB8477.eurprd08.prod.outlook.com (2603:10a6:20b:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 09:16:34 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 09:16:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "jaipaul.cheernam@est.tech" <jaipaul.cheernam@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 08/11] blueprint-compiler: upgrade 0.20.4 ->
 0.22.2
Thread-Topic: [OE-core] [PATCH 08/11] blueprint-compiler: upgrade 0.20.4 ->
 0.22.2
Thread-Index: AQHdfDgHklYZ9cAIUkK9yrBXr3vYQrdBp4GA
Date: Fri, 27 Nov 2026 09:16:33 +0000
Message-ID: <76377E90-D91B-4B16-9764-28857F6C8385@arm.com>
References: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
 <20261124171807.74394-9-jaipaul.cheernam@est.tech>
In-Reply-To: <20261124171807.74394-9-jaipaul.cheernam@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3901.200.71.1.16)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|AS2PR08MB8477:EE_|CPH1EPF0000051D:EE_|PR3PR08MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf32c7d-8bc1-4b9b-b653-08df4c673651
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|4143699003|261009223027099003|22082099003|18002099003|11063799006|10067099003|56012099006|261028144727099003|261026140227099003|261022105027099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: pA/g/OU9SJtpUHm97GxU5SfUg831NMcEYC7KuOcapymVYSTVEFmcrg3x56K8jFYYJwOYbKJ8kyYg5zx9x05mX+mE2dNne+enJafVUKOVcktw48TAJ1iPLs+iPNa2dkZ4PsG96abp+Ydlq3/wmQHizjCvqZa6tniwOdbxuNWWQLG8ZYapzNDJoMLRSC/lI+cSt48mLfKo/IpEQY1M7p80rZylebeZD78rx4rz2LizilNKhkmDkU172MfpcDeh1MQZ4RVjwSQCbmsVorh8SQhy42LxuAgPbphJeoSjIBtn9Y5WrNYItUn2pvQTj8Qdnx67o5IE5ltoncLljwmb2xDzuvA99MzP8/sguwrguNoogMvmTu3ds1l0u9h5yyL7BwNotyF24IHwGMzHHZQ+Omu1mAVFT2sNMlVNsaZLYLTPTLGMasMYkoS8h6GLOcdCrdHPivHfIdIAB0Nidb5Kqq9iWU/T5Qj3dkgoXb05B0AvjYOlaYmzO+nZmUNOaU6TycLpsDwoGPWiVtUhyUmT1BYMoJqK2WquKGUQu7qv5jf929+ure5ziefzf5ZTkrubjn0myLIbONB57UuRZAJOOFgaMHOoSiXQo+o0aXqAGC0tVKO6lfHDUwo/iqUGEzgGVXG1+utZ/aXgYN8PkEKUF+JcykElysfZTDXgI7Sz6dcbGUc=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(4143699003)(261009223027099003)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006)(261028144727099003)(261026140227099003)(261022105027099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DEB43E4C60B27840AD5DB9BDD73EFB0E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Y9EZH+2tuegcIkNq5oWbHHh3EJP03nS0u57C28xs8cVMFhl9O10HvvynUXRN2Dx+4AUB4KAckuFkz7nhMp4ZFbxGgmCx85IWSMH4tTt6Yz5EkBmj9hzJ8CSajOdUdsT6vgynpudQ65qVXX6rXMoLRpCUpAXp8TTyJHtUM4ExiBk9LSKPLOF+sJROf2SJhLxkdLAZ4DCx+6dlYpfCu2kDzi8BEtFTg1aIq/5+0gjDi11C1agzNxeQfzb9ffRcnY8To1niOQ7wQLwE1ooD8pHoCSPTJsYBYdCqd3nFXbvstVNwZ+7TqzhY19lzUGLyoP5xVKuAoUJIKOKz+z76RRLctw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8477
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CPH1EPF0000051D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e6197ff4-69b7-4fd8-0f1b-08df4c672191
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|35042699022|14060799003|36860700016|1800799024|23010399003|4143699003|11063799006|261009223027099003|18002099003|22082099003|13003099007|10067099003|56012099006|261028144727099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: qv59aeer+5II2pYUruVbIhbP2RKEuONgME7sB4Fe24SXDBEowv6dWihY14pXMLmf85nayvqhxe8w4G/qwcWUsIxt8EetBvHcUvEfTV6Z17J0t7GncMfOzwp8M+S8/KAZgT0gOvi9GHM/6F+I8gEqi1Osclj60NfWws2FF3dtomdyJ+N1w8Mvb14rh6A17qC6jzfb5NCHX6WHlF/J7ZUiK28eMHwdoO7QCFA7TVKdbQk/NQpyqrnACpFDmZ46dvcWb276hUyXodvEyPX7f896zdIPwTHkRnIQJIlDFNJg6NpMqxQ7x9Vtt63YkzwgLOsO5Nx9HS2zQCwIDMCf6awv5Ptl0Ki6U9XPlE4Z6oZV7MbuLnd109SPVThTW8IJUcvDAgcbIoux9T4eHPwd1zrHzsrQHvkgrC5Scx6Giqj52CRmS6X8j8SLuOooOqjcvsX4X0KAkUhHNuUCgS9tTw0WG+OxZdi8QL7hEA5l8F1UzVC0KGZjUGsPoKrN1d31hSlE9A6gQR+DYvUutrA6OaIldz0xNTzW/bN/nhmSTr9tn9mHE2Y+FmzDpv0PSSnmyaJw9Wj41lwVJ2vj9YeRhhMhlMNTA+pPAaf+03vJGHgd2DDb4B9KWfLc4gc0QfgGnOnIXdxkoZl713tN+Cvqnwn4HQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(14060799003)(36860700016)(1800799024)(23010399003)(4143699003)(11063799006)(261009223027099003)(18002099003)(22082099003)(13003099007)(10067099003)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: z9OtwfhkWmprKF1TCPIj24DwwdLgdtlgqG4EvNO8XmzIVvdrLygZ08DCOjtUN7EDpQjd4M2kY+9MFaQws6Iw2lHvE0dNwyMj2yHw8zj1I5Q7qSIHvRUy5Prqdx1NjveXTQMtxTR9trK6VfG+Yp2x0nGtsI5YK6GxfarTMSh/0FK8L59V7csQvRfxJ+XTVK5niDXdW5CfzaqrsCIuDiZ3HBxdcHFsVRG0ciHHULbeUEEsfQk6bbKUsQcxcVVdid3CWdDNdFHnYz8R7iVj26yS+zXbyhWPh2+2+aed8EHUL2wxrBNLtgIWhytE/VPmJ+zyoLHfoZN6UgLig+T0SrpKRx9NTbq3PR32qLCxWdGkAH9dWiOkh0NqqMM1vv8wmXKW4Qb1sI2jI8l7F3XQz1bJzv9eV/hB5Gdz+Sng9RakS1HBw3v9KZE1DFCZNRDZPMnr
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:17:08.5690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf32c7d-8bc1-4b9b-b653-08df4c673651
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF0000051D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5802
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251358

Hi Jaipaul,

On 24 Nov 2026, at 17:18, Jaipaul Cheernam via openembedded-core <jaipaul.c=
heernam=3Dest.tech@lists.openembedded.org> wrote:
>=20
> Compare Log: https://gitlab.gnome.org/GNOME/blueprint-compiler/-/compare/=
v0.20.4...v0.22.2
>=20
> - The release commit is only on the tag, so use nobranch=3D1.

I spoke to upstream and the branch has now been pushed, so this can be remo=
ved now.

https://gitlab.gnome.org/GNOME/blueprint-compiler/-/commit/ed35ac74de0c1bb1=
f5e852410b97edd1f08904c9

Ross=
