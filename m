Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35141.1793887816434282140
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 06:10:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dp/a9RtP;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dp/a9RtP;
 spf=pass (domain: arm.com, ip: 40.107.159.20, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=g4E8bXfg+OyZhIVzjJKG5N/5F7KY+ZM3JsXWPTT8Skpjl70nSaZMQVrNHkB8mUWPbRiJWE9q2Uvqshexe5Qn9Qy7Sfx0Fw8a5kGjwbtTnsqbOjcA1+DOWfIfbYxt8QbpbIJTXhfoeNMVnXPjjqIeCXo7qq3fYepj40hDhLg+ouwjxZMoDigxM1a1ruejrYXHi6k+/U1ZoYkc02IZGXyvVpXnZNvK4WiE+31ZIyOzhe5DYKTbyUHo3uzffFEhuszCAp3xy1wiiOPMhwLgskgblY+e6Dw7jPd2x5UGVy8AIQednvlfV5EKF0kIkr82Qx5z/ovs0Dpd7izLPeLbRTzWmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iiVjWqgLv2xT1ggNboBZvxGdhGj1hhMOK4Bqb1BtMA8=;
 b=RuPFUAcJWmIw+xIYq0M3xfUBHHnu/j00gsGr8eJnueVDRy45+nA7nsz8EAIAK/p3t+axi9ytufEdi9rBcP9uQLcHG02Kg8D0XNcznfDD9hbzTstmyHgNBfJNO+YGbrl+BSD6tR4cxnNyHRZ2X3RveOq2cfhvuY+M+QkrXEhwK7aS/GmM9QqIgCsHegH6K+9Xq7p7fZJ2lJwSzO2yqRICLHXjJGZ73FwA2P/LC4fS8/7snyRas0DsroiTyEtNFkf5AOrQlCdigIpGDreXS4HYAoVBX1EnQD3QEsdgZ3vQ18wcSDJrAcdM/QBBxJzgfefZRtKnNiKF/H8fkt7Xxuikig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiVjWqgLv2xT1ggNboBZvxGdhGj1hhMOK4Bqb1BtMA8=;
 b=dp/a9RtPfKouACgtvSCFCRj//9gpAHaljPGigvo5SNzHsSlnval2NCqHm91Au3d3dqky28zS24x1zuWsIhP7ZmRQFkIhnWfaweUS9SwIg+/7/IyOxuKlHmiFBztj+Oa9zDKZL7Qpu01uLADTl8A2GPsr4Yj2Mo4dKcw0tatWCqA=
Received: from AS8PR07CA0032.eurprd07.prod.outlook.com (2603:10a6:20b:459::6)
 by PA4PR08MB7388.eurprd08.prod.outlook.com (2603:10a6:102:2a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 14:10:06 +0000
Received: from AM1PEPF000C1AD7.eurprd02.prod.outlook.com
 (2603:10a6:20b:459:cafe::88) by AS8PR07CA0032.outlook.office365.com
 (2603:10a6:20b:459::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Thu, 5
 Nov 2026 14:10:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000C1AD7.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 5 Nov 2026 14:10:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zo4RVmRddpzcKN1o42tSnEZ8jA9hjy7RFeU0g5oX+XjBXOa1ZGqzLaulW4txEqyJadRy0IWaIxGh+DeeIszTB7tmQ/Rwmwp58qTROruk+DTzBmttBdi8BmRZwUsjAa0UYi8Qyxp4z6OdHj8V9xSbcuhJ7P8L49dm7np+eEs331S5ghvPG1dIdsxBolAAQOILW6fl49SoloPntU6AOGKsS2IYQKVndtzC6rKjOZ75Vdcdozk3cR0hZGwxvUvm9aTyRmvEmA5056KO0zdtAWsM7hDP7BhpLbkRyVtOCN4RAGgM5EMP04qmddY3uiugYGq1DrB3r/aCPeMYU6d0LzLACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iiVjWqgLv2xT1ggNboBZvxGdhGj1hhMOK4Bqb1BtMA8=;
 b=WEypyIFP2D74+PnWe3PaWBc4GbHtsrEJqvNamQPph+hYmunsZHIq7BW9p5j8Qj51UTacJ3h/jTQcMp9grN2zAv2rO/sPR3X+Ll4XOsWHuB6CssSxe4OW2sHc1miXlHBTMGnT8WuyWBg7zXbQ+fcL0YXJYb5CuNbVMxwjFsBbKtoXsJccRX/cNqnJaEH+qzif4dQ24f7r+H+QV56GXvD8RieN4U+iKtrggBU5t+ochJM2hj549C8IO31549w4zvaoB6+UAoEsmizgWBtOiMUyxRbHBT578YsFiEEasKI9SER1rVWt4S9+nAKZjXy2ZAIqAh4TtZmnrmw3Y3pKUsQz1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiVjWqgLv2xT1ggNboBZvxGdhGj1hhMOK4Bqb1BtMA8=;
 b=dp/a9RtPfKouACgtvSCFCRj//9gpAHaljPGigvo5SNzHsSlnval2NCqHm91Au3d3dqky28zS24x1zuWsIhP7ZmRQFkIhnWfaweUS9SwIg+/7/IyOxuKlHmiFBztj+Oa9zDKZL7Qpu01uLADTl8A2GPsr4Yj2Mo4dKcw0tatWCqA=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by GV2PR08MB11467.eurprd08.prod.outlook.com (2603:10a6:150:2b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 14:09:28 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Thu, 5 Nov 2026
 14:09:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Khem Raj
	<khem.raj@oss.qualcomm.com>
Subject: Re: [OE-core] [PATCH v3 2/2] dbus: Let the ptest package install
 alongside dbus-broker
Thread-Topic: [OE-core] [PATCH v3 2/2] dbus: Let the ptest package install
 alongside dbus-broker
Thread-Index: AQHdat2E2J4HA06wuUi1bw2gw9AITbcfiMMA
Date: Thu, 5 Nov 2026 14:09:28 +0000
Message-ID: <1DA56A0F-CBF7-474F-A185-B3A92432CCEF@arm.com>
References: <20261102151805.3233815-1-khem.raj@oss.qualcomm.com>
 <20261102151805.3233815-2-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261102151805.3233815-2-khem.raj@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|GV2PR08MB11467:EE_|AM1PEPF000C1AD7:EE_|PA4PR08MB7388:EE_
X-MS-Office365-Filtering-Correlation-Id: 169aa450-98e6-4240-6209-08df3b467d1c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|10067099003|38070700021|4143699003|261022105027099003|56012099006|5023799004|11063799006|261026121527099003|261102123227099003|261028144727099003|261026140227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info-Original: +i8pmhC1ELKSr1GkZVn2eJtVNUpHSXHaOfC1T8gmwmr/K/F0562kKoLYiLQRIzG0rr1dFog9kkA3l+5BwgxX3j+h6XiLp4nzJRpmCr2OuoQeYwMInTwAlNq7EzH5J3QVSlcpdKF2UeTdnUAX4+X5WZE/R3b8QZ3L+e+wW03ALPpui+J9mZqcK+m5yPLOiBOSbrcuFkcMHhYGJqFx1EWbsVNeulFtQWatLuoOcXTZXiZxLbnbvR6ywfPGicHZer/oEQzSi97kkhzbMf2+fbgCTx9ig0708f6N/O/Q1wwEDk6z7UxjybqxqSgz5NZJvEymZsaQ0jyGbTb+MSka9ngcpaUw9IvXrFu//5UWn1F8APl4pqiMRX0CdyFz/wA2tPqzBFcM52bFl/giIjGOmBor/KuthLMKd/fFJrw7XVV/AyiwetB2grDufCwPaEhNb1QVDUSlf3VXIkby3gDoj5T4GnEguhIrscJqtdXb+l7TDNEWjubeeBC1Kyv2iYYnJJ6ais3A2e83bcgKBxSXgkAlV7HfIGIe4cXBddsV+13Ie04gbe8uOKl9GiAasZoKrjtcvA42RGVlCuGbYjfBknCspefIyRfJe44/XMeE6sry+a24fW0CCgbGA+zMk3khoYCfyuArQIN2L91FniuL7SJPYNbV4ZJhwSvqOCl+DqWhc952A2B5eaBVg/pW2zQo8chqDEUEj8zLh8Tqy9vlbc8HTYQskrknY0wCHNQ9ZAilTJk=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(38070700021)(4143699003)(261022105027099003)(56012099006)(5023799004)(11063799006)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A9672E2EC661E45A5A7369FC61D4FBE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OYtqUghhYhAwtovK65fV19udyYFDLjaYssv+4K0SsuP+Aa4ktaXlEpGH+FfgkgkjUWD96i3Z1OTicqrcnBdbzELL0xmOQUFa5gZMbccLA0vC5Ggz6aZ3AVbg8pC1aVDBSXsUpoT+6cKxf4/V7396kcTziI3fTS12b5S+AIloeAJhHg0kWa44XlhPr3hKMw80ICJWQ392Kb44YllUtBfSlan8cw18XjfMBrMY0ji+ik1Zyh3+yslwPo/IW6lmCMxT/9U5/37hlu0OkkyoEVqXmOZrtUK2iP4j0gDoxw/x7VM4deionXmHAfiPwutQLS4qsrNx/90wvLczTwA56THnlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11467
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000C1AD7.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 967c3bc3-e5ef-46fa-2c36-08df3b4667cc
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|14060799003|23010399003|35042699022|376014|1800799024|22082099003|6133799003|10067099003|18002099003|4143699003|56012099006|5023799004|11063799006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261102123227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: ZYoAVanSTSLx68OCkkuxsAfHBRrcZgt5L+X/wcQY7wM4gyGqe/TC1Itu8t4QPr98bAbQlfweupwMYBvAIQBbA85JLL+BMqpNsMj5EQQe6iAiupnniOjHyF9B2b8mMYxe3hiPBXOKWrCaCd+30yNKNOeVptb0tsr2+K38d9MPt0KuzXpsHGBvpIs7HGYJ3HihW2tbfdIF8ofFwzF4H73u9g95/zpCIXEaw4t+OA/+4FTrkOLVoj57pMKhr+GZU7/MfX2+2Bf2/ApO3KUCnDFPjK9t2OlRd4hs0bKjK4aRTNKeT8UlQpuDW0oG3T4rQbizjxUlns/ldUpaJ20n+2raT0KetAw6Bxobe2gNqklIk1pNyQHXP5eHU/pU+PH7tzAnfbMuhXvJUs8YlgfV3h2YgDdtkhNZ0HQqGQ3ZGTTnKl8QohAitIga94agePP0g8r9Ffgam672w7H8c2s3cg9spNR4KqXwGaVIdDXrTmtvwRgntDpBA9/Ldbq6Yp89Fe+6wjK0ZgHw6GJDzzgnaTtL4iGMcNu9BzM1Ii/hP6xYFluyxftKjI1acaNdUlb+AAkr25/Oeb69DpHzhJpiNG15vyYxNM35FMNfAhLvn1x3b/2P455jF4YwU2yVjEHmPvmhkSAd+nhgMOr59VwZa2NTyaZJNaiclTU/mXEAC7UA6Bp7M0YAzjZRQ2A5oLtoWh98pxxv/D8wEq6DkWifh50NoA==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(14060799003)(23010399003)(35042699022)(376014)(1800799024)(22082099003)(6133799003)(10067099003)(18002099003)(4143699003)(56012099006)(5023799004)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261102123227099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YShL4HJZMxBtP9Hp+YytiSUwkzZmgrMiMInPfceaFqNHcz24AOjvwAw6JIGlV0of7X0AIhFjUh1U2cFx4e1zt+TopT3xOOzexRF9gzq3rSPk3qkn9PBR19RChPfFeyAob3Xb7CO3QX1C3WgMVgyLqJ0AqCpQW5jGnebsqhnssh8rX8KtGt+iC92XpKrXsZdI+e6mFG2KVr2jXrvdM5Pinp4mdBCkc4Kkp2eqOdD92YgKCL0QLtm5HS9+YzyJ04aEhDtC2I/Lswx+NgiLFA1GmeaAynmGUTyjqDFBUXgC+964gD9lesg/R2dNDvowMv54ZiOudu+tzLuRjqN3muz17JN+gq6aCI/NmbQRdoLgin+mYraVDFt+ve0q3S1C597guIpKfcxL5b6j4PWt0T1yJvhwPvHW1rPRSSgciJsY1anSwwz6Dk+DyrHouWTw20NJ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:10:04.1779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 169aa450-98e6-4240-6209-08df3b467d1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000C1AD7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7388
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 14:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249552

T24gMiBOb3YgMjAyNiwgYXQgMTU6MTgsIEtoZW0gUmFqIHZpYSBvcGVuZW1iZWRkZWQtY29yZSA8
cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiAtUkRF
UEVORFM6JHtQTn0tcHRlc3QgKz0gImJhc2ggbWFrZSBkYnVzIg0KPiArUkRFUEVORFM6JHtQTn0t
cHRlc3QgKz0gImJhc2ggbWFrZSAke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycs
ICdtZXNzYWdlLWJ1cycsICcke1BOfS1kYWVtb24nLCAnJywgZCl9ICR7UE59LXRvb2xzIg0KPiAr
IyBUaGUgdGVzdHMgc3RhcnQgdGhlaXIgb3duIGJ1c2VzIHdpdGggZGJ1cy1kYWVtb24gYW5kIHRh
bGsgdG8gdGhlbSB3aXRoDQo+ICsjIGRidXMtc2VuZDsgdGhleSBkb24ndCBuZWVkIHRoZSBzeXN0
ZW0gYnVzIChkYnVzKSwgd2hpY2ggd291bGQgY29uZmxpY3Qgd2l0aA0KPiArIyBvdGhlciBzeXN0
ZW0gYnVzIGltcGxlbWVudGF0aW9ucyBzdWNoIGFzIGRidXMtYnJva2VyLg0KPiArUkRFUEVORFM6
JHtQTn0tcHRlc3Q6cmVtb3ZlID0gIiR7UE594oCdDQoNClRoZSAtcHRlc3QgZGVwZW5kZW5jeSBv
biBQTiBpcyBkb2luZyBpbiBwdGVzdC5iYmNsYXNzIHdpdGggYSBzaW1wbGUgKz0sIHNvIHlvdSBj
b3VsZCBqdXN0IHVzZSA9IHRvIHJlcGxhY2UgdGhlIGRlcGVuZGVuY2llczoNCg0KUkRFUEVORFM6
JHtQTn0tcHRlc3QgPSAiYmFzaCBtYWtlICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdFQ09O
RklHJywgJ21lc3NhZ2UtYnVzJywgJyR7UE59LWRhZW1vbicsICcnLCBkKX0gJHtQTn0tdG9vbHMi
DQoNClJvc3M=
