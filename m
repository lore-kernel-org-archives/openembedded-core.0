Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3000.1795169345391601835
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:09:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=CoOEiN0p;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=CoOEiN0p;
 spf=pass (domain: arm.com, ip: 40.107.159.7, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=I95pyWnYESHA3DWygZ0jKMrQRZmXJKxEHD4mjVGYlZcwFo2n0Ddnxf83e5mqsVyvw6UptbyHAnwH/1EMAlOOPBOyNGqlkjh5jhI9JURZGu/fNW40lRKP2AeIC7IEXgqxtQbJ+Nziz4NxDJD3T8y58Ldgb1plH8CdAW3xequo3htSFgpeKZqfuSmWn1WpDLHUnEif5bIQmD/XFfW3fNu0FmIkBYrWWZ7Kiji6QX+Dh1FrU3bv92Yorrs5lgIuSX8pM/PFRxvWBCLAf3jkrDOOKfU0sjCBGsqgDMgHhBD4i9v+HrbHSxfHaz/WNUrXm6IocVkmgiHQgPflNRpD8HuMvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=temsZfy+hg9cn9V9OdU2sxtVegov10EhDrzysYFz0as=;
 b=dHtRlXEV6WhFVC/dF5lDl06FTkGmKH4tmBjhudP4+m+foSxEGcvKfOzYpjJ3pyWh0VkImovf8CFKJomSv3Ogn6BwzzF0Y404F7z0nRORHGROYHgmuXz3KbUj1ql8BHckFeZE2PBzcMH2aZ/6JC6TTufAm9I8VZlpt/51PIzxaA353t6zc5YJMDEr79ZA54Yu27PQ5CZzKzb+py+VmKbXK+6GvcHbbHAlt6jHpqjilaWOhlj2mn+XCCqvi92MGphZYpft7qYJa2qYCZo0wsQT/K/kckznT26rO3k/Xo74rpknOTLXxWoC1RG1HPhPs0lWZVOeQKXcyzNw5ATLg/wuVg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=temsZfy+hg9cn9V9OdU2sxtVegov10EhDrzysYFz0as=;
 b=CoOEiN0p+o0hNyrCE53eRTzdWlJgJsy3yHyuoAwcOSTB4of4HNC46zxAQQA+MWrHVmRuCXcZs+COG2MKCuWZSefeL9hFlewY8ZK21fJDOcghBZlUIKT6Fu8A2XAhDNW1Mfhvvq4xXalMKV5/mCoGG9TuUUxovf8fXV67JYLYfUA=
Received: from DUZPR01CA0153.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::6) by AM7PR08MB5350.eurprd08.prod.outlook.com
 (2603:10a6:20b:101::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 10:08:57 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::17) by DUZPR01CA0153.outlook.office365.com
 (2603:10a6:10:4bd::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 10:08:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 20 Nov 2026 10:08:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FaYFs8f8TE9FcV63l/x+MTGuXT7z48iQQmZHB1DG3DstegVuPt9GEulPCPuNItCIoy9SVm5gxziexLRSxXqGOWKdTPjN4jdH/sSuGBSfgA9UWF+Xqd7uHGeKo0ObF5VmhhG8uX/3kE+OikqSzz4Q3UpT3wqXuVDmfK3IoMlBSqjdR9ALSZIXi3S4s7/cKqMuoE0yT7ifUVUC5NOtOpAQymbXbfpVrCbUq/6i9dogWkbP+iQrQZX8/ekJvXVunPHgJneAwXOEl4n/XPaiJP2M8C5raOxRINzyg+/Qx8v1G3uwVI5MM1GzlFjgaNkenqwkPUBWEI3+gKbF79HSySUihA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=temsZfy+hg9cn9V9OdU2sxtVegov10EhDrzysYFz0as=;
 b=yPheWbf3W55ccdeDyLxSsCYhbWmR9ip2TWHwafkMcpJCRH/RedOqmxKWjcDyU4FL44PCro+6ZNJvA0maNJc1v77qffXgNd6ENBowLt3/eswuVY3okz1c9DHKEWdpO6r9125KBGk/w1sTvsv4r6jdtuvPCWnDy9aBt0qi7vJUMNm9uuG9uJQYnCkKGv17KLfKUPTfkbJUp1tn5IwAUzQKZMRnPtV2G79SNk0KDmGoSHobNqoGH7wn3gUC3UUTKsisdD/TS8bXX28t/rmAQJuBM8ddzCecywHZNuJ/0IATNGheEZ5viljikqzXGOan3dyCVzoxSEokPdIEiM8G4maUMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=temsZfy+hg9cn9V9OdU2sxtVegov10EhDrzysYFz0as=;
 b=CoOEiN0p+o0hNyrCE53eRTzdWlJgJsy3yHyuoAwcOSTB4of4HNC46zxAQQA+MWrHVmRuCXcZs+COG2MKCuWZSefeL9hFlewY8ZK21fJDOcghBZlUIKT6Fu8A2XAhDNW1Mfhvvq4xXalMKV5/mCoGG9TuUUxovf8fXV67JYLYfUA=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by AS8PR08MB9148.eurprd08.prod.outlook.com (2603:10a6:20b:57f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 10:08:24 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 10:08:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Babanpreet Singh <bbnpreetsingh@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-pygobject: add ptest support
Thread-Topic: [PATCH] python3-pygobject: add ptest support
Thread-Index: AQHddGrbw9yXsT/qAk280iYh/b0Exbc2xUWA
Date: Fri, 20 Nov 2026 10:08:23 +0000
Message-ID: <41E70606-A468-4811-80D0-794C5AC5085F@arm.com>
References: <20261114190330.7-1-bbnpreetsingh@gmail.com>
In-Reply-To: <20261114190330.7-1-bbnpreetsingh@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3901.200.71.1.16)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|AS8PR08MB9148:EE_|DB1PEPF000509E4:EE_|AM7PR08MB5350:EE_
X-MS-Office365-Filtering-Correlation-Id: c4b39992-553b-4d04-bb36-08df46ee4a4a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|10067099003|11063799006|56012099006|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: J5c7U2LKimrGoUWqkOfMqxphgqlKbLx3+V+vLr6ZmJQIqSqAmoopLEJiAC433AuVKdHjJpoTWqNkKnsBvJZKZfWir43y3Li/qpEyQ36CdROtB/qNuu8aY0tJriHnxk5X3BrAOqMVMBinNipbryflpxOZvxVXaVaOFsYk/HzwYnFFcl3qEy4g7lTJlQWW2i73/oXVjfCSdgvdBRWDpwS/+QjT9c/QlCUyG/J16LWORTDD6EHFUf0ct6FTz/nKwcRY2PBuXu5O1t/TNHe/qXblxg3CBWcK2k7wIjg2+O3lLsw8eBSX3dit3ih0TeFa3vhvaZQDMeuJnfWI91gpHIJrHZdkmnqrftBgPx9wy7cFHMQNa9tCOHXdVhWQS1QT1G9s4fOyqV5tSQqTfqeKwd6258I/i72IaB9I9TKwgP2ASWGhMIXwQm5w2Hx4CZu32f6GE8/FU+p5cr76VosKvOCUhHDXbdsnIvbVR65ER0jRXEzvJLZdMwGU6wssvodMSFEW74ky7UOgPBIFivQJalJvmTHERyT9Mfn4y9ASPpA3ytLUSy4X42rAgcgCXTWQD/hl3bG7FNAgCCR/5HFLElNz326NH+cLCQZ2eG9rZKnMrkfTNPFActG3rxu7FP34rXM8qZ5vkq4mezsYIgVADNLRdrzobjAuMlLtIhZdQopF8eg9DB4GbRxyujpyi5zzY4bfueGp5t2dM51geTQCXODf11HFyG3aQ0iNogkL+8tA3MI=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(10067099003)(11063799006)(56012099006)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <19F584CBEC5D834082FEE2552A45665D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 35hFQfYwh3f2nmkkUmbVlTLeGPKssy4j9MDyS38V5W7BR6sPrR6KIEI7JVOG8gn80zZXrFxWFLdKx0Jw9uLvKkyFhGN5G89f6NpiKw9KwS/uQCahNQu8z6gkdmA0iwE3KHXF9rBTzJnmd/bv1RwsvqFt0Io16HEpOXRx6UGqkFOWAEmxlAUDGtIAR/pCM0J+qGLRcY6aoI2Kveho0rq2Zch5TWNn6NH9K21kGGIqvvF2ZogXDNHJAPxihxsdWRDxBb9oIpy/JKx8JwhGU7iGDDunZ9mwyxCYZzUxoD/4c3yEkzyLIUQ/Yw4+ig7/XWAPhm8B/BEc4njENxzLi/UuwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9148
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 488c6571-e708-470e-d64d-08df46ee3680
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|376014|14060799003|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261022105027099003|261009223027099003|261028144727099003|261026140227099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: HnjxF56frNuWrWtEfqd8Yt6N9GKZhFzl/XPKmv0VnI8RkAulPWA4saCnHJHljGa7bChjcf+aAaBPlasNxoyskgMCi7gX1a1/nJvVpWjLF++6s3KUh5MVtssBekCn1ZtDfFGGLiDRb8r6W6Ur3bkdv2tiV/fk88KgiIzG5qJLd9HNCV4pB5t6HmyY621NhugE709jI1HEQI2LhuGoWIRhuk4ShOsaHlaskIiQc1i4LBrWeRXa69s/WX/OL/0H3z5nA/PM8lU8Xlx38t9K8hpiPLIrRW1frDaLHJ5EJySqq02ZSs00ScFR7dUEv60l5k63Nj9/1GChPlHPm3PCZaE3jPsmTdKCuMFZoxDlez49+p9PqedhQfsLptv9l1yzugfF1oKuSD4TIPXhOHZW4DM4v7dbsXUw2GJ13qC0RaDZzQOWEgGbv5bOry75kvRMpJjR2QNpo6Jo4aaTeHB39b74Dlmt2lZSdKVyYPHV9duHlC57iBaFzShw1bNqS3FZqCIUq1RMlUtKS1FRyXOOLyiwLRVmvm2lGJCd56SQSViCVpzoW0znNgRlXa+jvNgQmFYR3MM9aq08Io6CmkWZna/NrweD/l+Xbr0a4/HAg9Oh/dsziPzA0u4Hzz/+vbijWx64/ucYz0/tQbFkweSWoYWwArE/FxoVdCb4WNElr+T03YpRxQN2lgPZedoPgo2e29+M195uMh/Dqi4HfsJNgISioQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(14060799003)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261028144727099003)(261026140227099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V0jkZDxQhNKIrqG62RVIin92s58r9z02pna6wdMKe92wCYk0LSsMJv5RJ3EB3BxQ85MV1clUdE5GikbAj0qYw7jNDj2ef5tgYkU/cwtWkXDgpscNKf8ThaNbAuSfeSE5RmRA/9l9r54b0dlxc823tzzlA2j9kJsoNPHEgr89F6jJLtatimAXRMS0a4VdLX5i0bqlcZHHR1MBwxs1antDRbkBAb2gTFOKDPW7fUVVBiOYuX1kVsQslZGaYNnzKYVSz7z4cka10nLxBNe70VTSVP7LaSHoRjSrNwrvldMCH/U76dAiDcJMPeltZvIwDsCU5TmLBUYeMf12G+I5RGguE59e6IcOXiDxHWCu7JTpZDzqCbY/zhbFNcv/sJPAAjpEu7WHUI36vfzCu/CIVkjVewC+SPtCerzWJ6tvjjLMvjA+Gat1pM6P9wcBzF92x32N
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 10:08:57.1994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b39992-553b-4d04-bb36-08df46ee4a4a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5350
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:09:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250757

On 14 Nov 2026, at 19:03, Babanpreet Singh <bbnpreetsingh@gmail.com> wrote:
>=20
> +RDEPENDS:${PN}-ptest +=3D " \
> +    bash \

Note that the bash dependency bothered me so much I fixed it upstream (http=
s://gitlab.gnome.org/GNOME/pygobject/-/merge_requests/581), so this can be =
removed on the next release.

Ross=
