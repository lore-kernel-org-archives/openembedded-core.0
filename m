Return-Path: <chunrong.guo@nxp.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0091.outbound.protection.outlook.com [104.47.38.91])
	by mail.openembedded.org (Postfix) with ESMTP id 0584471A99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 09:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=7CisS7ul0qtUuK3ERjWu3raJwVZGGS4N0TBzIV4wycQ=;
	b=E+fntbUKFyVi/LO/edo8l830wlRpNbXofgBW0dHUipo0OcM1jam9mc9r47Lp3o5H6WeJV5emTaWSD4cbrc/CuZIDAmwRFmipbdNNw9qgCL2FMdkFuRWjtTs593sgGRTC1AW8azS9L+mS5A3wa+baDPIzmuNFiqWu6q/VV9Zlys8=
Received: from BN6PR03CA0060.namprd03.prod.outlook.com (10.173.137.22) by
	BLUPR03MB375.namprd03.prod.outlook.com (10.141.75.149) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1075.11; Wed, 10 May 2017 08:47:27 +0000
Received: from BL2FFO11FD021.protection.gbl (2a01:111:f400:7c09::102) by
	BN6PR03CA0060.outlook.office365.com (2603:10b6:404:4c::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1084.16 via
	Frontend Transport; Wed, 10 May 2017 08:47:27 +0000
Authentication-Results: spf=neutral (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Neutral (protection.outlook.com: 192.88.168.50 is neither
	permitted nor denied by domain of freescale.com)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD021.mail.protection.outlook.com (10.173.161.100) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1047.9 via Frontend Transport; Wed, 10 May 2017 08:47:27 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4A8lKCb017702; Wed, 10 May 2017 01:47:25 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 May 2017 16:47:13 +0800
Message-ID: <1494406033-28833-3-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1494406033-28833-1-git-send-email-B40290@freescale.com>
References: <1494406033-28833-1-git-send-email-B40290@freescale.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39850400002)(39860400002)(39400400002)(39840400002)(39450400003)(39410400002)(2980300002)(189002)(199003)(9170700003)(5660300001)(105586002)(106466001)(2351001)(189998001)(8656002)(54906002)(6666003)(2950100002)(42882006)(6916009)(104016004)(77096006)(50986999)(76176999)(38730400002)(107886003)(110136004)(53936002)(5003940100001)(356003)(47776003)(36756003)(8936002)(81166006)(50466002)(8676002)(48376002)(508600001)(50226002)(305945005)(4326008)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR03MB375;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Neutral; MLV:sfv; MX:1;
	A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD021;
	1:oU2cp11at5sN7mFO28am0CJl+c47K3AtARdaiqpuo9yohQKKXqWj1N2P/YRqQfiuTb0CzAJ8Hinak4DhAn3WmqWoVKf2RzH/giLj643QlRTC7ktDHNLwtNPFpHOffeyUfSHZYJ1OpkURYyKjeDkxgFCKPMxIar833mrBb7vKRc8XqLUvIajCOnOFA4HjLGzxXLI2DQiAuX4y6gx6NopZMrslfSOicirbhz8G5f4UOUf1J7uU8yKFFA/y0QviGlchjnRBZaWHSDX1v3dUqJF81qXnr5FVuIDx7JBOeKBYOpuSrD43xtSsvXN4uxyVM17xM9ygw8cS9LoZL6e4pIgP8/U/N14aaUekVly/80bTidPgwkczWpzQrxLfKk+XsjsQTGfyxmr0m1pjwzE3rNEwo0Xnq071jvmC3hq4StWM+8unItwykJs2ua0TRALN2LC0J1Xpy2XarccQqA1rCduUwUxr09ZRG1jXQMTC5qdKSlnBaPvo65UBvpjjuq26ScQYajem9WyCaoZe2JuqjW4VnbGrr5w/O91DdmTqlil+NZv6379wPl6+FpioYpQxILjWVtjw2VGDqF7WxeD98IfR0Q==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4561c330-c3eb-4401-c66c-08d497812fb2
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081)(201702281549075);
	SRVR:BLUPR03MB375; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB375;
	3:HQLCNM0+J0oevcJRBkrcNB7tNiKq0K1Kwtxe7w9OwYKkklbnGu4VwpH+JyiFVb94dSltL1Yoec5u/OTB+nlqaMnQx5vc/465R650Mx4RNq2xwD4/NTZzZsUiuTIpbYmaoXI0PnPzucECCzU4T3lbOZvmoL4dHjtWdtjO2d0yu+DcGtVf3BdX9202abVDzfFoyWzfXDSx6iYJLPqlbXaK2M+r8kV+8BW3CvKSVwmzc6X9bChQAL9R+QW7NPij9MhtAlAuAAo84AX0B7taYEgFgPd7AOCgvGulPgoRg/mPQ3wtY3gJ7YjphdKti7lv+UKSIWi/8Dm3+o2pGJz6Yf5rdrfhnjRaLaJDZTXqJlL+Cm5m4SIffVcqvI53yJVzU2VCV7Hq4U4qs6BnFxt/XNciN++xxpi5oC7Fn0D/mODxSBOEKou1o3whwIJiCx/KC8WPW/QObkWl0QiTd8v60Znx4k0hIp/TrRzQAuOJEduRn0JrvpoD0tcL7vkLRSIriv8d
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB375;
	25:5EPegeUfknh25t9qyMCONhe5CzSTVRKIJGBLyz8VFIXEjsCq0nTBp/lURcgsjv6I1lhfgziO6/AtVId1TJElO/VfBmkZZ5Wsi9abakVN56qNVSXv8CCSCVLdhhRLkouJLrfOZ/lBfq9ejXkSWem8EYL9TlyzzffzTpmw7vBEnC2G06abSAss3GE/0h7lGc5A511nLk1+edapJxqu7/LPjgYy5RjA363qaDBApvvO5/60hv6RHWQc6EmGR9qHOSfa7VqYYWrqWaES+5w2yP1t4x9q4g8rP3lrI49gJGtO+cM38E2giAA+pNG3cIUR1EAyKeiGjBjT1NZFqbdLaR7jEQWrpXgX13zK2SbNBTsyh3fIYE6JfqTG7701YJ2wg9hgUuQxEPdul/8HpOHUyRdxzWzLJeP9vEMVgmxKkb/Hmm7e9BFXIycJxUehIRCGWwxocBbIq51oisN5y5ub/uh6xw==;
	31:hkR/B+Ol/pdTAqacIpCHGx80UrG7pIiH/9GSS9WXlC6LLthiN7WLOLvZ6YxZMtiyVaHBSVe0Qqh+FB5Byck7AMVLnfFwko8IJ+DjwcPB0PiBiovc9H8I+qkaXBi3zxdnhzqtNYApJYEXlpN2XykAsSawJxh6LU5IeqExJSzyopTcf8jin8mMt1CQQzyLNsDvAe2cVTlDja9ebS4+orynsXvPNwzfP7/wS7nR5Q2cjqD+68Fe8N2qR2K4pYWB+sLv7pp5Kbfq9MaVtC5N6c1jYF+qjH5AjyZ1QKSO0DiC1vE=
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB375;
	20:LKZQfdgCu4DVVlr7L2r7bK18OSI0BZv6JGakSupwFqX1HFOKBAxeD1ApDvxPnlV1dtVL9LzDv6k4NNo4nqH5fCYtaU//MR8D9bDwmls5GMIYJG05FniJamRyUrZNUIefNu0xTEzoxdZb8yB20JtpMDfLKTcsX9aq9G35yS553GT8G3D3lCiv2SOUz7WbbCyJUi3Lpj5sRg0V3WrMXU6tvi5+8nu1axDdKw8TT08qMfoAt9HfNpP6jga7L6Z0J/AYS/fVeNs2ikuatKMEfbp8z6BDHLavP+WdnONPtaVBAkzrd50cn0tWv2Qu4iYuocpAhI1zh+mM5zO5Miu7tX3xmTNY0DndxHd07pn6fRMa29Ca9KzKzaKMDqBM7R7ieaVG89OW6AHp6dacaVBG7VKV/aFz5iMNm2mGX28F3oHf46YfsFAqEYPrM3yVo0vm2piaKe0KU6kewXt7VlbqvrEZX9xlJkEWZ2uGhvX0qHODGPNSlLgt34OtsKxYe5GbSXE7PkW8qCbks4cd5MriIcAi91yHvfjopLmT/HIAwZwRHXOpBZO71woKL4Q/Ef4lcEw6acsmWfrHDFjhfB1VLnDGcD5aRPejaXU+b/Nj16gSV1s=
X-Microsoft-Antispam-PRVS: <BLUPR03MB37559ABB518A68A0B31BF3E84EC0@BLUPR03MB375.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(13023025)(13018025)(13024025)(8121501046)(5005006)(13017025)(13015025)(10201501046)(3002001)(93006095)(6055026)(6041248)(20161123558100)(20161123564025)(201703131423075)(201703011903075)(201702281528075)(201703061421075)(20161123555025)(20161123562025)(20161123560025)(6072148);
	SRVR:BLUPR03MB375; BCL:0; PCL:0; RULEID:; SRVR:BLUPR03MB375; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB375;
	4:14mpIw+bEKoqg9XDYA1G9RhfjOGywOTilsUKH9zUY1P?=
	=?us-ascii?Q?uKoBD/siTRcP2TpoGO3uQC14S4Hbr8MrD3ap7NGAliTVpTKtgsNdTAn+eAr4?=
	=?us-ascii?Q?9BPoGfieyE6d7Qccwx8A8INIGT6gVKFJqHpRU6eEF1MMyjdbT2Yhu8PttIKX?=
	=?us-ascii?Q?kZvA6//cgD7MyqHyeB1m2tVLBwyN4pwMKUHZ0LA1lPk6y07DfYwuQdvhLLMy?=
	=?us-ascii?Q?87y8bsfujP4fNQ/TmJ0EL3wRBWTv3DRGTAT+BQWtFPhtExsPG/omVp4fO9CC?=
	=?us-ascii?Q?wNSF8lZfCjydls+Aw9PVQDs0EVG2ThBKjt0yfiPjU25rA7ZkNd1wXqp46jSg?=
	=?us-ascii?Q?H0y2zvo+IkK70k2FnY13/CREch33e5kuHbSHG6Ucrl71s1moL3KghJ0Qr1iz?=
	=?us-ascii?Q?G01SBzKdVvebDjxrIqI/QcxIzrXGJ1FZhcHxsEPCEHIqFVQFHLxOxls3ZIht?=
	=?us-ascii?Q?RHbyxnlFx5Eu1TpiCLiZ+F0YGOwX4wVH8zTCV1qUDjRS444bujpzC7ta0aWC?=
	=?us-ascii?Q?Tv/ycSVxSbQstX+tpudDNFTufC9aczaV4yGqZuDJSDADdRp0ZNLEjBccwlh5?=
	=?us-ascii?Q?eGejdQUn1QJu8gR2oUHo89r1qZ5scbNB0I24qAB5CSOFK/15WaUlCxbiZvhb?=
	=?us-ascii?Q?f688VuL0ncVCzjGmTeQuZ719drbwqpPD4vyREn2R6KjGaRXGxGJSmC/QaZDN?=
	=?us-ascii?Q?xl963txnnVapLgKcgoFh+7YLeV//Lrh5NrhYgW29krzXzL2mc1tDNOMs54lO?=
	=?us-ascii?Q?IIy9IPmtvjj8Rsus6+ONKZ36PoR5KGrpNM4oYcicn5I5ccVyOjXxkV8PlGPw?=
	=?us-ascii?Q?esGf2IXijlDmdY1umTEzWDHbIk57cYoy0uX15Znpkke2/G3vJ+kcgsdf53o9?=
	=?us-ascii?Q?8/vX4w/s7nrySt8p11dr0SQ123y/AqCM0J0V2f0dXORmhK3MQAAqCkUNfYYn?=
	=?us-ascii?Q?sJWsSHMt2XFZT9RwkHRIOnhuSeeax1n2x0plFOQ=3D=3D?=
X-Forefront-PRVS: 03030B9493
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB375;
	23:pqn+fFI9Py+l9IcTdHNdBGfbCZPzhNQKLXfvNrK4bt?=
	=?us-ascii?Q?mtE0jnqjLViuKe6CYaDd7FUHMppxyhN7zd/vEWIrfrL4v9h7sMI+ZboSXIUN?=
	=?us-ascii?Q?kOibQf0URL7+la0KvqTAlBCBEv1u9jZodzyhz4RydgbJLor52fAnfEzz8P1f?=
	=?us-ascii?Q?55GAieLqh3ShYxdkSq3cpqKIt8jPRW2LefDhw4hxdMhInJYyjSFXURmYyTQm?=
	=?us-ascii?Q?DYnKWCcfVyuTcDST9dgmZqqXzOjDhZvYhKT/PwvB28ZHhzynAonE1xhVh2AR?=
	=?us-ascii?Q?pQsufAHEkOGZt+1VKzxGIHdDDNsDwFMinqcDjbJqk7hckiKyJVcSjZedeeTR?=
	=?us-ascii?Q?cc5Jp2wJofl+2EnQp3hVqoOATpyThEfTPAvvKauN3CErhXm+QTd/mgIvDJdw?=
	=?us-ascii?Q?uaqJznOJABPACFDPCn0WZwj2lp0OkOptkUs4QdXZMcxvgxop80fFGd0+2SyO?=
	=?us-ascii?Q?h4/7RzJsIZe8dXS0hu2XOvFAL5bEZobe91+rj45Jnbl+CaOSDdpk3aN6XJAZ?=
	=?us-ascii?Q?BAMDBbt4yDL3M80SMVwU7PvhXl2qY+weGj+r2DIThwpkuQMpnTnShSKS3rpW?=
	=?us-ascii?Q?ZGUlwjCtX6WGWN9tdbk7P5YuRdzON6L2XegFVQa56Re8uUIF2zzB1sbJ2xdJ?=
	=?us-ascii?Q?f7y+9mtIG0LKdAeDituKTwOlrq9LMMHd/I3OvphMuIPTpjkCSHpyz49enKTO?=
	=?us-ascii?Q?c9VZcDRmRvmLBQKU7SzaEYyuatH1a5W5DcwwVsVam4PNoeP4uFSCqXvol4gz?=
	=?us-ascii?Q?Kt4iYBPe+4Iztsc8uEOjU/KjU0VgBdnEnQIXtRahAKl3rFU12DTgS4K53C/b?=
	=?us-ascii?Q?GWbn9mwSIhXYE8OzgBQNiOgVQSgJ1S74SpR0+RHLy+l0eGeSBTEbFAP4k4WX?=
	=?us-ascii?Q?eggAQhQvkiMAoxLq2xlqWED9sJc3wdRsZUIEXJFqImYX+xv52I8eCeegbrFP?=
	=?us-ascii?Q?qEWSaFPNvcJ6gKZN3iUkJSVOuPNBbrRBfDY7aXPIXiIB8bF/Y62eLL2UrQeO?=
	=?us-ascii?Q?Uvo3huy/WixCUdPvPbxpQR6+zLNncFT19nEQhBqPhC/dya9lmSOpRUewSrjH?=
	=?us-ascii?Q?hOg1qVRUlNdMiAiRKL8FBrHX1cBRk9RU+1tcWv5QxKshgrRvRuR3kpXaXwyW?=
	=?us-ascii?Q?KHOtjOla8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB375;
	6:atmaRb67ocC+BLAzuhloTLF2GdPt53qeBLHxOoPGK9cUkkdFmRhKBdvlmJgW3q84/PRR2qMXUPWia4GFTI/nk3d2vT7dGhiEGOwzA7vDEv3ve9khtSmV239DXpE6iWxUrEkuRMrqQEi65HQfGlt6oX22GzybiEN/C4xjYcpItiVCRDIBjtUQFHTziOKzJwgnmjJ9S/7zDT/iupwFn49KCtVLEUPsvS+531vUJf9grn5KmO7v3CYpgYat9fsO6Yl/ATXpen4+FKWo9hr05YRFZADwD7bkVVZQxatfHQ5+WD/fp8aXaXsKpdEj7ZCFwDkBvL2Cex2Uvf2Y1SSuoEy8RKrl6MwlLEpEvrVoZG+WKAvsgwWUgz96ualEPRRsbTNxsvd6KH7CjGYPMOFC7vD4UA0oTKcK4eR4/9qAoQrp9YOVhoQeXGkAd5FpJHNf8pe7GhxypkYFcLByDBjEeHlKnkp3R3IKQ+bl3xvq5NwcmFM7dgTHQAlSqU0clsX+7GsYiCfN5AdloL37NSb41yvfj7/pBrqOlYSqTQb49OSSu4U=;
	5:fq22+S+xyJ62a7fYPiQvAHSqzwng77MLIU0eSrT5P8+iuhRmAdj33zd26cHm5m1xf/ZkCUipZd48YqO0pmTSozyRmjimH7/wGEccH7FipzdCU3FHJLTE9EvCIQMauuvpJdteODggoC3SXCQcN15t8g==;
	24:fVLbP19MlNIN7mSnA0qjJEYbmDxDoHy4KYVlWlojsRu/iAzwopk9pDOilJwUhdv3xQLvHXGBNKGVWArmuQaQNuP0fkeWrViP78FGRqN8YMY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB375;
	7:juhEuv0b7oOpUreLK925frP1NxXmaRFGbVsxwnk3ZlA7DCXfSUK1OtJR4G51mj/AUj8PEUzLY+nSj5BVIt2ye+hUl1WVqz/6HVT1ocfY/Q+irTVISX9Nk8XZmk67SzfeiZeA/t3SRslU6CUo7MLSfZqJl/XKJZ5hcIIGjZw9eQaGPCwR19UpxqL0QL+l/jJazfARqKDN46vdUmuv1W40B7TPqI+4vt+Fyb5ykbU+CXzfg+g5It3RnsdjGH8EipLrizwiQqu2vuwO7TIc9/ONtdOMqtPJffmMY6Ti9B2Nq3bD+9hiY8ozVJKm1geRt5vUGiR1kpX2txyw3+V5dSKoUw==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2017 08:47:27.1343 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB375
Cc: chunrong.guo@nxp.com
Subject: [PATCH 3/3] kernel-fitimage: fix KERNEL_DEVICETREE includes subdirectory issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 May 2017 09:01:51 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

    * For example:
      KERNEL_DEVICETREE ?= "freescale/fsl-ls1046a-rdb.dtb"

      ${DTB}= "freescale/fsl-ls1046a-rdb.dtb"

      but only fsl-ls1046a-rdb.dtb  should be used in fit-image.its

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/classes/kernel-fitimage.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 9fa836f..3171d10 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -346,7 +346,10 @@ fitimage_assemble() {
 				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
 				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 			fi
-			DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
+                          
+			DTB=`basename ${DTB}`
+                        DTB_PATH=`find arch/${ARCH}/boot -name "${DTB}"`
+ 
 			if [ ! -e "${DTB_PATH}" ]; then
 				DTB_PATH="arch/${ARCH}/boot/${DTB}"
 			fi
-- 
1.8.3.2


