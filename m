Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.810.1795457344327406928
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 10:09:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=pdoWbeVD;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=pdoWbeVD;
 spf=pass (domain: arm.com, ip: 40.107.130.11, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FAg87GodP1rZva9bjZNecVyyvzwVJnnAsvPOz5HqKgR40W+HOkVlBU3NwJ7zm6S3Ni7TztJGOyyLnxICR5nizJY9j+bt+k1lizYUrL7N/7NHBbzaHCNcSYyWVw0sGGblJ+7Rx0RFHfGYcV13uwcTVxWPdmWOKxsCQMy49tjnp8WwDz0XmvuSy//PuL4QZaF60wWlw2Amqxg3giRAIVHb8kOXqzgpb4o/I/kglfspIA75KAuOXPy7S67f8RJ1d4V42HhbB8VwGYY6Cq+UQgkK5ecjDFrRv3Qg8qhpkS7tITmvxn8A24Q0mDne42YUwLHzE34iof4NvxFEZcNwagL0hg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z18xHkPXofpwuDmJdNjA/MLNwWqqSMMLBieUKSj0rkQ=;
 b=OvbgIqiKdpNKQuzbQwTMDYdIb6R5B+3fFyF3EtaTyMnCyb1B8CC7rGt8BVHDohy8i6XNjU6dYcGb3wpvYSrCxEvkdJZFTdMB4Gxg+pMDpqqtV+2/pWkw1BCa3my0FdIMqTLZuFVQ/NiqCgW/iRMZqVcV6G7I48a8d9RKBOIqn5ev+I1VTbYCXHigcg1M55zXc1cHUlink0HYEXY9NL7Giqb6bCAsSvhjkm7SH1iHxHHCYHsMCVcARUyKG64zlLZqCxrp+DGL+lz0U6dfMfhXNgWO5vviOshX0BuB8T+y09hwkz2UoOkdsMwtkQASM5YpcXH+kzbB8YFfFhgIZBaLOg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z18xHkPXofpwuDmJdNjA/MLNwWqqSMMLBieUKSj0rkQ=;
 b=pdoWbeVDUJImZn8BDDj3Jlsrq/hE85q/CmNE3TPkrkghG7EgZUC0pAoqjxiclr9SUrzv0dw+S8U5XSOkOtHFWJVp1CnOiBN6NfW9NW4eajq3F3bHoEWqXctxgaKCb0QjObHEXC0jDxy+YyUU6d9EfEhjt9tqz37mUflKUbCf2xQ=
Received: from PA7P264CA0139.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:377::15)
 by PR3PR08MB5851.eurprd08.prod.outlook.com (2603:10a6:102:85::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 18:08:58 +0000
Received: from ZR1PEPF0000E463.eurprd04.prod.outlook.com
 (2603:10a6:102:377::4) by PA7P264CA0139.outlook.office365.com
 (2603:10a6:102:377::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 18:08:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 ZR1PEPF0000E463.mail.protection.outlook.com (10.167.241.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Mon, 23 Nov 2026 18:08:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sG9Mi4f9Zwzt/MpA0qzZjdherDX+1lpcJbxhvn8/9lI3hkx5r9qOfMmGd5zbPIMz43VUf8M9jfuFYzkGCl896yz/MRKy4aFe22SOxErwfYsUGE1GbGGvWYIDk/0IiAjvWQnbm5X1eaO7ySIgc1dl4gmuv2jhYWBi37WtZnX9uZUmKD+ogmBTekvL3iDAQWrEDYNlWhtBBoeOli2W49bP5zxNQChuL6bYkGKXnXaD2N5MBAEbtDzmaxDE2pGBHJxRcMGIWNbhTGIMPn/plZuOvfjDUYM7+gyoSlLn9YIC8y4PdyRT0AOaMNcKKTEw1NNk8i2XG7nFLkJVQez8ebhYJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z18xHkPXofpwuDmJdNjA/MLNwWqqSMMLBieUKSj0rkQ=;
 b=rQarO5cNMxkSz/aTwAqkbpX1yW6HJU6n/iwevPIpA50Qd6Y027VzqHCqe4RxUXM1nF0dh6uACBS4eChwsabXTSwjVG3MnWSjdkkJF4vYgBbycDkFhXVAK49wU13oIvWjsLTbVG+rr8Eqzup272YRd7jk+7NY0eVh/HQUCAYzgBElvZJED6FdirD+Pbim0zR+DWxAoMc4g39JzBpgi7442I5D9llKHPaVME5QKmKIMMYTZHKBivwNSUgETCJF5mhM417503zF4lL6W6Om4JB5WiFhoHgHbEGOxYtylr9+8a+1L7SRBIANbAvkJwDKiuCzX7d/7i9xgffno7Riif67vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z18xHkPXofpwuDmJdNjA/MLNwWqqSMMLBieUKSj0rkQ=;
 b=pdoWbeVDUJImZn8BDDj3Jlsrq/hE85q/CmNE3TPkrkghG7EgZUC0pAoqjxiclr9SUrzv0dw+S8U5XSOkOtHFWJVp1CnOiBN6NfW9NW4eajq3F3bHoEWqXctxgaKCb0QjObHEXC0jDxy+YyUU6d9EfEhjt9tqz37mUflKUbCf2xQ=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by AS1PR08MB238936.eurprd08.prod.outlook.com (2603:10a6:20b:6e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 18:08:25 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 18:08:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/5] libtasn1: Enable linker version script
 explicitly
Thread-Topic: [OE-core] [PATCH 1/5] libtasn1: Enable linker version script
 explicitly
Thread-Index: AQHdd2zS3GjB5K1SuE2uelJZ95vTJLc7/F0A
Date: Mon, 23 Nov 2026 18:08:25 +0000
Message-ID: <3A5D79A8-C1BD-46AC-A9CB-6ED307184E9E@arm.com>
References: <20261118145502.3243739-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261118145502.3243739-1-khem.raj@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3901.200.71.1.16)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|AS1PR08MB238936:EE_|ZR1PEPF0000E463:EE_|PR3PR08MB5851:EE_
X-MS-Office365-Filtering-Correlation-Id: 26268af4-b791-440a-b176-08df498cd835
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261022105027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: eVq8JGqczuqtZ5RmLsqoqWMOzqpojY2K7NBzgt8L1xEZi7v+VW0xnTXeRR3qZln5STAXPfXlBMJVFRr3BEs0esxj+vn0DqZ0+9HW+c3IhyanUS6VO6+/XAOjojNNKyW++j96/C9jf2BEJRJqQtY3ONjMJIgp8EeKKq1/6Qo1PxOOuOVk4MxphYxsaVDUVifo1mJOCTpQok48j8WXQqX37ItX/XExs1ZeStYjwoQ50zN4lWP8RCNVguAFke9nhbTYLoV5Nz4ONRNEbrxZr/E3dFxEwCz6N8e7yQO/NSuow9jb8HFpushQx/qbMmhh9c0E3KxQEGnJXarI49KIWzKoggVkC/DcievoOPPalGa7nwHJDUWrhBntDBoPxvh9v1nJ+wQHqoHDCQbAm8sM7hQNNbeIVE413VKS23+H498uDxUfQthrazz6JhuyRFEOoNJElnvZVuIPk+wADyq1FnrAV6E4Eg00xfiQqRlUKRQJRkNlos8IsmwSU3ACSrq8j7kj6hQH2AWjzyTOQ1QdUmjudHB02/S1S6SVppK9ItvEn3hpS5fwT1qIjePpMne9eeWeeUWn6V9F/tMsrXJRvJkzMPwnH79FXkukOafHsHJwUHFRmjJvglzU2U/tqHqexWJHCei/h0fP6rXqPBwXbYfniti3cwt2yIzCwkbmBYJCy2zxJewZx1gCMyxJM4hwn+Om1AZWXg/A9oS4AuMZCGZdEg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E99B57A124DA244EBC8A9EFDDD6730FD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BU1DJx8ggBbN2x1/WTEfQRy2fx8fOr8qRjNqydtGHqnsOBN5qA07UyNVS2ZjHmiHSJsxNf7sMRIr+BG97g0eeurxtXFyTRCNUablfn/etZM8QR5a/2ToU/u7FOFybUVxpSk9j2nSaNGvEBWRZLTnbcZ7A68zl120g4p6hlv+Yqnm1aT6Z1rKnqnprMuaYfhOZdqgqAsOQMa3hASA7D1whHKho5wHGY2RWbU+pr8nUU70HP188mDHJVOwSdVCrIw6fWUPINeQ6wqWMqeLKX9dbjFWbxODpjyFafhpkJ0xcQ7PqyW5Rf9HupArJ1tmsKAbBKEWHYOr6XpDK0h4ZI+cNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB238936
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: ZR1PEPF0000E463.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d94406c9-db06-457f-e7c6-08df498cc4a4
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|376014|1800799024|23010399003|14060799003|36860700016|82310400026|56012099006|11063799006|10067099003|261022105027099003|261028144727099003|261026140227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: nXnt59fOCcXwmJr0CT7QjZaNdjT3HwT79mIeBnULJZpdGrdC35Gs5bemFnTgDdepLBEae1WsGlLeI0ph0EAuNOIwZf20m1rQOKZvpM/isF3BRS3dFy5/mkpj8V3RNVUme5T4MT6qoqeDzQc4i7++NG9H+NUSp4czxfjaA3Yk7PUM9OFTQ2akey3/Y+p4YrTP/+SWCedR+xhi60w8iN1TPbNKz61Wc5Nd0AdRNtrZkbKAEeTnTN7BlS478OOsn+HU2tALn7UB0iw0D1rC1AXNPnD0N7cYK/ruxUb5JIqBA/VRq8j0gpI4zUZ8bUSQRlHgMGfZCaoYbS2W2yHcTwlAcCBIXp1M/2r0SoN2XJYivHURBpbHVBDAh1CCBne2Y4BE6/QjM/AXBO3b5LBTqA3U3zJv7JZHtMFJDVxXcQl85rz2nopsoUX+mOUHL12PUyTtz/jqWhYkljABtfIF+1rFaCdp/XM4PoUIGBfTzGZnZfKnyh8xawVYqZ8E9/agy7Awp+8aVkL98DbI87b8uEDFvqhBy7t/Prm+ton08og8U70E/LvXR8lLpt4j677/5UDk/vdiYg+Wp6DOHGbJSmWGOkDr0IKot1GBUoS2Osm13ltLyIBNHbWidW8Xd6wvSESdvhUBRnvnBdoOT06yx0LKt56milgJNxxZRxCK/a7/x28M00tA8y1Pp68+r4Votb89YeKOqUy7cHkO9zFs14RZ8g==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(1800799024)(23010399003)(14060799003)(36860700016)(82310400026)(56012099006)(11063799006)(10067099003)(261022105027099003)(261028144727099003)(261026140227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JPOESBQbOBvXw3KBhoU39vqb9gbiM4LzZ7hbFxmQl/Gi2ycSIjr5y5cC5liUNo5EuPQHrhGe7eSkAcWYgvUSutZRHvz++TUyWwmKNXTSGFYswGhtYEOoIJMo9kbW8j4JqEu249l9Ry+v8K2/PLoI9WQt5mijns3CTbSg2IsLV+dePqoSY9NfBBTvpXgKkVcxZHITCJwVyF1ZiHh3Ujdfqijw7GdreCd15UBPFvBLmnua4leR66wlrRwC0ZE7x03bilgdyeeQN/NLQpZqcCVAOYwjdtKKOJjSS9m5YaRCUMCeD6k6S3c1W9EkGeCH3QxEyNIE4XsVqLRaRclt0iT7iSnTgUWpSYv9ZfeJ8fDURr+G1HCDBujLP1M8eydmJgN424bGKDwQsyYSEdVh0h6ZYaQH30iHugqsqvftZoplBa9xLEu3gnlx0ljC+fSS2C03
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 18:08:58.0676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26268af4-b791-440a-b176-08df498cd835
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E463.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5851
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 18:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250930

On 18 Nov 2026, at 14:54, Khem Raj via openembedded-core <raj.khem=3Dgmail.=
com@lists.openembedded.org> wrote:
>=20
> configure's linker version script check links an empty program with a
> script that assigns versions to an undefined symbol 'sym'. lld defaults t=
o
> --no-undefined-version and rejects it, so with ld-is-lld configure
> decides version scripts are unsupported and the library is built without
> any symbol versions, silently changing its ABI. Consumers linked earlier
> against the versioned library then fail file-rdeps QA, e.g. openldap:

This is part of gnulib, would you be able to file a bug with them?

Ross=
