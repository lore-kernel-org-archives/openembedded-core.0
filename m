Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14038.1794492866647872929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 06:14:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=h2nImzNB;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=h2nImzNB;
 spf=pass (domain: arm.com, ip: 52.101.66.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CuOahsp6+ucFTqy819nlZGfcpeeAkgIWThbCqqyfL/Pv3OpsX3MQ65IRD5iGdUgkfcqFOLAaiDysWd5bcIgYoXyJhGVpCDe+NenVYVAVVK5VE8xUzoHKO6hGntgfnhR7/5pjO55peM+GMtzNcNRexiZl+F57FdHbMqgiyEmAg5ISepVeN0J/3xq0CKuB3hMBanT3epLkDYmRin9zMckGDFQY6QD3OgwQ6YrA6EgPDZeIs/iUBlfgTIkbM0DnQXpKH0rY2JhK9KWYHstRRRgdIx6FlFqOZ2TLxw3kCEWho6I4bE7bYCHdBj2haPChQ8hWBOljg8sY1PyEp3QJLhH9HQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMJ4ItodJsWQTIDI9XDPnXAExf5zhaYTzloN0lMd4n4=;
 b=ZHRPyL+NWCGD1xmtW0OYYk/xltqm6GJ8mpk0HDecMmdmSt65RK8mwTkRaemtcgEUw8p3UZYRw9MtzgOeioPptFyBRQzNk3tFWr3oeYo7o9iUu0qpAmk4dcGkw8OZtIUSPWyuw9PSfHcI/rEG7YWydE/vUiLRPBotBhsnsPrMoH4UlJqfEqH3s3zW+mvqKnzoaBjSgJrsKOx6nF9EsbvTVCGTayVelz/G2CMOkvIlvonCXMxQncGDG7YtEOg/rdCqLrvYO6vQ25d7wrd3JkQPpLXJO8HBaiGYUSG8E8un/zZ+aL6RayMo+04Kq5ZAGKv4TOPUrNzb0dc6ZPB1SsVlcw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMJ4ItodJsWQTIDI9XDPnXAExf5zhaYTzloN0lMd4n4=;
 b=h2nImzNBDl9lQ5g6T3tMLVgJllLhMT2KO00acckmIo83oytjYqi3XpxHP1IipIxj0pu1Jxq6srjOVXomDcESlZvLNOvJk3wNaQ1ysm7DAaCFks/s8KDz1Mg6YWGmLHDSN1aW/YT6wFcQq5cOl8yW0Xj9BAFOa9J3IK5GgF9M1qM=
Received: from AS9PR05CA0019.eurprd05.prod.outlook.com (2603:10a6:20b:488::9)
 by GV2PR08MB351161.eurprd08.prod.outlook.com (2603:10a6:150:386::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 14:14:21 +0000
Received: from AMS1EPF0000009A.eurprd02.prod.outlook.com
 (2603:10a6:20b:488:cafe::70) by AS9PR05CA0019.outlook.office365.com
 (2603:10a6:20b:488::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Thu, 12
 Nov 2026 14:14:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000009A.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 12 Nov 2026 14:14:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JhL6IVPwg4vnCha2ZgkmU0v36ByfKULK/VaehafvpucQrEVgxO/cXHPE5zihBbYCmGyWfeCrlAu4OPGa839VnkiXFbKdg13iJab2DcOCxpbI37zDE3TI44CfExkW2hnWrE8fzuDxG+C6a74iQXTeKBmJmG1+fRsxlUpaJDqp6klab6cFGRX3SAsGyn8xrgK8Pk6zA/mRRiabH6L+mPMGmfw4dK48xwjKpb1ceGda3104AcIpMVGiZPwIxRcUqv+JBjJ2LOy6hFX3K7gleO0/8IMQfnoHxOYR3bMlYfT1M+lCjuKJ/E2in0aNf1y/jYYB+lsKx1+5LWYsYhkQeUoOdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMJ4ItodJsWQTIDI9XDPnXAExf5zhaYTzloN0lMd4n4=;
 b=a1zh3GrJwfSVksdryUWHYMFrFD/qBnx+4u4TzeSovqmG6peRCMciDjtqO/3ALZ4LP5oTaxXURKN5aWyNo6d4LqBgzFDUbKzzyf3/NWmB3axgHMaYDFdgD4VnAZLGAqrkxk858VgLQtXwjgpVJoA66YScz9etcpHVixqysKDKSabJFennwN1cLYcNAHMhmDs3F/BIo6ZXVtcb2TslT92fd/p2m8eXRtnInz8PvGrx9MhE4lNeGcGL4QN95Sx8htxYllLERFwU/ncspOUnI4Apw5AQCRsN/9tGNPDjvCT6mSVO1sXrIpcapPBrvlCxZcsIMhKUa9scakBZ+uaLOal46A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMJ4ItodJsWQTIDI9XDPnXAExf5zhaYTzloN0lMd4n4=;
 b=h2nImzNBDl9lQ5g6T3tMLVgJllLhMT2KO00acckmIo83oytjYqi3XpxHP1IipIxj0pu1Jxq6srjOVXomDcESlZvLNOvJk3wNaQ1ysm7DAaCFks/s8KDz1Mg6YWGmLHDSN1aW/YT6wFcQq5cOl8yW0Xj9BAFOa9J3IK5GgF9M1qM=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by DB5PR08MB10116.eurprd08.prod.outlook.com (2603:10a6:10:4a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 14:13:38 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Thu, 12 Nov 2026
 14:13:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Khem Raj
	<khem.raj@oss.qualcomm.com>
Subject: Re: [OE-core] [PATCH] glib-networking: Fix openssl backend ptest
 failures
Thread-Topic: [OE-core] [PATCH] glib-networking: Fix openssl backend ptest
 failures
Thread-Index: AQHdb8aMeqGg/Z4ah0yc+p60/VECW7cqgGuA
Date: Thu, 12 Nov 2026 14:13:38 +0000
Message-ID: <7DF32BD4-6982-43CA-9162-A71059E5A2C9@arm.com>
References: <20261108211710.730810-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261108211710.730810-1-khem.raj@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.4)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|DB5PR08MB10116:EE_|AMS1EPF0000009A:EE_|GV2PR08MB351161:EE_
X-MS-Office365-Filtering-Correlation-Id: 760161b3-dce2-40d5-d7d0-08df40c73f3b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|261026140227099003|11063799006|38070700021|261022105027099003|261028144727099003|56012099006|261009223027099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info-Original: tSjdkc60Oor2VFJTYQgfi9/wFaJaFIGwWHfwTQI2aFbgu20QrAHP6SWGqQJa42/0/SO57m5mtRzyqkcOkk+hHV+VrjSaabLnR4E75boS5YI1mNtRHaUkTx0tgRhSKWCeK8Lesv7winYQ9s81HmfXa/5L1TK2qHLKpzadrLuQispD6Qhs3T9oRjZmKu3Dc7XT7TcWX1nam9Mr/lunysr2K/tzwQWumhtIQko4BRnXKAwcH77UebBcnk5N88+R5Za8fIhIo9lXK/Takpov4yK5h5d4mgkGnQyHbKX1lAdsegxL5FjKpdZpIHiGBfklCcMgSvZYnI+Q8SyGH7m6X8ImsWKdQi2BfAeG04suEO7QaQNpS4f0SM1ZkqzAukLcT/KzcMZ5wccnzPVUcEXXjGPz/W0jWsc0mWb6OVCYXW1GQXxOK0SY5hedIoUUgAbjOFK97I+Rzh/wr30p9fTw9sExjkcF+OCyMIIDVmhfgfGHKKIy9iyvStbFnZ++hNmapv4qUbajzaIYy4xRhlUE+q6mI5IkmXrXwZB8Kf8RF2ntBSUx3NLD9fyAOCsGSqXmc6AW6K5hpKEPB3M9GCh6wrE5WxhhdEqZygfBxQfiyqMqfFjiB8NtmKtMd6eUpYcZs1zONj8uM75F4P3FVAvmn0b8PO44aq2GQ14FST2PWYL21SoTrWkURFFdKs6mv8xTybYEDGtQAUv5iEqrIIbJ4UDrJA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(261026140227099003)(11063799006)(38070700021)(261022105027099003)(261028144727099003)(56012099006)(261009223027099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0FB661C9000D3A4AB8D821444C18E587@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eddym0fuw+ekbSSvIqwGNUXY9KFaZB52WQatys4k74P2uPOXVf9lcyg06JwaZhPMkUO378w+CYgt2wGnDJH03WU+/ObuSHYNGUz6wpQsU26Q92gpqOhJJqDHsKh5hKmizSqGzHcPH0dqy/ZicCiu6ppve9s325b/yPRK5s0XN/Xm3SALQcqKvtakyX07qV07w2aENeiZPnJ/+4w/24YmYVRzGm7pIwNAHwVaI5Gl8Hh0z5ru8vGhg0Bsl0h7do1UVmyFrRsC07LlCduXpaenRaZJeDlgAvlIFTD8b0j3s1cIKHCODEsV/ccNUZ5ipvrntz6sgPFzxlymum3EjIN4iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10116
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000009A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ce75dd2f-6387-4638-d907-08df40c7259f
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|36860700016|23010399003|376014|14060799003|1800799024|82310400026|10067099003|11063799006|56012099006|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: L7YlKJq6yvzbiXc3NmP/mFHZ6vmg0jXxMg92JTnNjoxwojFw3YSkVEMhwTokpqE5LUQiK2Ed8Hiktn/OUxjtYSaoTnBgJqlfXi2/QEFq2/DqRu8x8XnSZqcooMGYAdxcLu8vsA4EAvYqYbCQ6WPrBIIvYQL+kze6DTZH0DuWILdTVI7VUTOpVseEnQpKFEnBNUdYz8s/lROSp058yucfkV9Ef8ZiZpfSkWneVYBRhYDB3PTM8j43x2MXki/oTqr74I8HVjRQeBXcYmv0h4E7uq5q4J03cL98IdaXlIZbsqu82gKDwBv9/Bj+N5CgU58Ce2i8pFEgPxAtHdaRoDhB0TGWLFZH4GLUJOQdFY4WNlTFZ8lZ25B793jn9tlXMMI9uCKBAk1fIiNmh9T6CLrHT73DiS8FFGLrYBktA4hwQu/t+yFoVKo2I07UEkkdZDYpAcb63LF2lv9JsjhX7oiqOQNVRqoSDPNaArqzAthvKKicv/CV+xrgEeXbcONjN/7MT0IfV++LC4uDVnQYrFRnBud/aWjUCAJuSvpAgWEIVO/CBid0o5k254jwNU3H+kJzYZIOp+a/TwchQ5+EqYd/taXKt3SLlWs1zXELOiw96dU+1zHo6RdvbheG683mME6VMA+iTBTJjcG4S4Xh/vKeXL2clHIl6dr6i/sIt9qfkRMEAnjah+jR0v1q7KXkByOu
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(23010399003)(376014)(14060799003)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uc/IHPQQETA/l1AtVk6HrSV6ykVwFw86poTnE8AbtoHu6x1942o7TkDxmy7HyiD4+AcMCRRTwX057UW3TN0GPFJOwGi/ah9Se0GfcwYnnC1TJXjF5kb5BbO8UHKPwfXmQItdiaE7niwS30AjMRJ6m5pziBO2CAJf1spRm8A8b5KSeMRrWNSkJF1NFtxo8eVBEIjT/sVzbOUpeeis7/WZXkEDj2OFYGaXgl+KG+kHMtuxGENbs2RE7XGaOCex77wQ12xqE/BK+SzIX7eeStnibSZgCGmSoMWMqDILDoMoa0dure7BW6LYWq2t/sc5eeMxOAjVX/AoA5+8Pu3+WPllvGr1G8vvDgT5ddXXohu6/xjfCO1xVcgxDU1m/aX7eOz473EDhx8gO3QL1KG4CFkxYGR8j0k1DWF54oOWmBt7qZUB1eahzrsBWdH/HZF38J8h
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 14:14:21.2539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 760161b3-dce2-40d5-d7d0-08df40c73f3b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000009A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB351161
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 14:14:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250099

On 8 Nov 2026, at 21:17, Khem Raj via openembedded-core <raj.khem=3Dgmail.c=
om@lists.openembedded.org> wrote:
>=20
> With the openssl backend enabled, connection-openssl.test aborts, which
> fails the whole suite:
>=20
>  not ok /tls/openssl/connection/client-auth-fail-missing-client-private-k=
ey
>  not ok /tls/openssl/connection/read-time-out-then-write
>=20
> The first is a test issue: with TLS 1.3 the certificate-required alert is
> reported again when the client closes, which the test already ignores for
> openssl on Windows. The second is a real bug: a socket timeout is passed
> to OpenSSL as a fatal transport error, so the connection is unusable
> afterwards.

One of the patches is Submitted but is now merged, does it need to be refre=
shed?  Also one is Pending, is there a plan to upstream that too?

Ross=
