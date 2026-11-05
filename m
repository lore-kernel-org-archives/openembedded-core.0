Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35868.1793888988803965626
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 06:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cq2hPI8h;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cq2hPI8h;
 spf=pass (domain: arm.com, ip: 52.101.83.8, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=P6HuHSaRK/kTb8ngsQqSMjQRMu+Nt6O6EDczrJThlGvtwzWfZlW5NlumJqiduU1MosKutvWJUhe4m6DM/Du5s/BARwy7g7HBS8JS69VmnXF5gg00wol3THImbIufp4+aj/AQdCbbW+lrwDJGkFRalrcy+waaDLwMKds5iDFT1xHjd4r9NFQmdxFmGIrSqEP+rYf1ZtdsQVjwjDIsi5yyjQ79V6YcHqLBuxY0Je2Qh/EEUBhH50wfcvJ42i+cMujn2xZF0JtRuTGmW63DS62VUNXgGFT+hhYUM/nS4iR7oKRZAWDIesJ2dKdepNOB25bhqb6LvW2wpspBpzkF1zSQQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GWhCpal9fzducAi79nf868h+u2NT8dkfnmPO6YsrFk=;
 b=lP2g+MtH7GhGqfVoWYRrgAu5AJ3h6jPiszm8QcBd6vpJuW6zGOr061uqLNvd3VgW/9JKVwUT1dkeDPfWASIsBvRr5z57hYOX47noMRgYOQWT6FhqLkFBy2vjhUuMad0W9u0ZQN8SQmF1ka3ku4L5xXf472yybIezV+3P/rhJOYskjw02D8JS3iIcWKSY16EYWE3cruYKtV6D3RUK46OaTUukHSlBFecv5AP4PdEjy4d3ulDef2F1QlNSWgSl7G+wUPsoa3ZAGxw7KDxYtQdXM4WLMYVBb8mB4MMgmbdtweknOfTYF2LOewFOpjGOrhTHxl1Qc4aWU2HSOEkYmo0MTw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=axis.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GWhCpal9fzducAi79nf868h+u2NT8dkfnmPO6YsrFk=;
 b=cq2hPI8hgZREAq1a/3OjW4Pk6WL30g/UMkBH0lrrFRdc0XTX4KxRhKHo6YeBj5uGGzyAue06Y3/9o2Myva9bwlVZ+U3rMl6B4MMdXw8wuVEjpj8MVdO2eqUbALy/Hxc4BgMuIgR69oHUONOQYgByOAe60gP/EV8UafbEUBUtYRQ=
Received: from AS9PR06CA0450.eurprd06.prod.outlook.com (2603:10a6:20b:49e::33)
 by PAXPR08MB7350.eurprd08.prod.outlook.com (2603:10a6:102:227::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 14:29:39 +0000
Received: from AMS1EPF0000009E.eurprd02.prod.outlook.com
 (2603:10a6:20b:49e:cafe::51) by AS9PR06CA0450.outlook.office365.com
 (2603:10a6:20b:49e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 14:29:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000009E.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 5 Nov 2026 14:29:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFl2FKq3+RXbC7ZAAsjJQlHjUZJx/xxGDm0hXREsUq8UYKQSZ0kBClmXxyD0NbjdhwTiwFeTOVb7kkBruApIDdPRZ9Ma2W2i4EfLBQmYlJ0UXqXYvUIO34armgcBcZkk8gdS2Kl6AII0Q+3pliWX/jhwMgejXp47urF53pNvqcW/1Yp7tSWlWDzXY6YVUYrVGjtD5jA2g7G3Qyagme94bUZyoDtmGsyCsgkxfNTka9qTnI9Wdr+w9Y3m1E8kdPLvF4T8V/9xwFhFBkoInWjI/yMjZsW5cZ/90Ksnrl8LcZ+ZcAUaFw4uWCFnxR1CKKutqBGss5RyqRL5cAJ4dqmcfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GWhCpal9fzducAi79nf868h+u2NT8dkfnmPO6YsrFk=;
 b=F8LvaLOfu4DKKKLxg9YmBatyIDG3uzsbbICpebY1aXxTUu+kpMR2V9efi/JrdW1z6dqgOnPb/uP5C8+EDvg3RAVzejDiqlzQP2LH5B1Tv5blCCf3XCuALDyb8c6DcorgkyVjGnEnZlqUKYiCMgJp716TbltxIEtigiYlUAX9mHtJXJs3nd17XLwPZU/mj591WUcq+WH9wNOuqzRZtJJyi5f5as0g6X8kTtm8Xpa6CFYmd00CaM/CvCNKVvh82pbJ99i9SaCvWRJCZjmDw2lylrwazuWQcOYCt5Y6VT67yZhUmaS/q+l2klYLC9s/l/DyVOOvz7jkU3nVQFin620J8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GWhCpal9fzducAi79nf868h+u2NT8dkfnmPO6YsrFk=;
 b=cq2hPI8hgZREAq1a/3OjW4Pk6WL30g/UMkBH0lrrFRdc0XTX4KxRhKHo6YeBj5uGGzyAue06Y3/9o2Myva9bwlVZ+U3rMl6B4MMdXw8wuVEjpj8MVdO2eqUbALy/Hxc4BgMuIgR69oHUONOQYgByOAe60gP/EV8UafbEUBUtYRQ=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by AM0PR08MB941774.eurprd08.prod.outlook.com (2603:10a6:20b:80a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 14:29:06 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Thu, 5 Nov 2026
 14:29:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Anton.Skorup@axis.com" <Anton.Skorup@axis.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Anton Skorup <anton@skorup.se>
Subject: Re: [OE-core][PATCHv1] zip: set CVE product identifiers
Thread-Topic: [OE-core][PATCHv1] zip: set CVE product identifiers
Thread-Index: AQHdbDY9Y6NU/tgFgUeQAdvSG2CvKLcfi40A
Date: Thu, 5 Nov 2026 14:29:06 +0000
Message-ID: <9BFE2C7F-923B-40ED-8C86-7E181E528B4A@arm.com>
References: <20261104082635.2183419-1-antonsk@axis.com>
In-Reply-To: <20261104082635.2183419-1-antonsk@axis.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|AM0PR08MB941774:EE_|AMS1EPF0000009E:EE_|PAXPR08MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 1275209c-bb1b-4081-a7ba-08df3b49397e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|11063799006|56012099006|261022075727099003|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 1bBAbOQVYwbx+dGsnWjAu1T+9niHcthOWB/G7uNxZWeysk+iDYCVF/KjqFEAQIK/AhzxHj2LeBd2TyAhaRvv394lEDneKBDIifW+lGFhLgQPEKZ/tiV4jEndaz3BgCPQtyQBz0Ap/1sVmYIZD2GGrDdUdHJ3XK8F6OFIeQuYH3mOwk268K9e7aL+cKxlY6/koM3EEogSTMZEC8HFdSvPdH8yRspDTf4XGEKdjPTZhXepiZ3yGt4dpX/mqlGWg6SAHVFk6IqpLCq3C6cV3u70nq582dCEmdxSG/9028SWJ9wut5GwsnM+F8rC2eNsWZ2qIRn9qn4zTTmZiJvfx1D5Ze3rK4AFtOKkXi2caABxsjNf6/SqOHqv15/IUIHohcxHJYhQ34bosZtKuKL2xL8Xxsh0wIOh0g9YleY2P6t6IolzHB9EFMXSLyTpjPcvGx8GpB18O3980WfUkbRBQzKq9ZTBQcLdH8wbtQDiXyGGLLgejR4WEzLGLV9E2TxHk886nTOLHUV+YJx0EzAIDkNUyPAUqdcq7DkSfOfc7Ek6wshixk++JjyeGc396V8ye1oitzTKmL96RgKsWd4PiXuanYbZKXNOtCiQfOQlPuwiWvggo4fg+9OC0salquygwGejIoA5oNOKYhySRycGERTGCrDyRsbSY0rDktEZyfnI7m6rOjkqEHpBP0l5nv3wjxmQBYt/yU9iu5TZbupRV803Z3YYRwX93Uz5w9DXq9lT5l4=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(11063799006)(56012099006)(261022075727099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F88E3BC8D92E541A8128C66DCDD000F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JiylqvKL/j23R6sOnRo52V0nhppMdMQQX1lnDOs/gqXGAAT7HYzfCEet6aEhne3C/wDez4Jyq4ZH0sCaWuPuVTj0SZK/8D7rpSSZYWJDF2OtG8IM/58RX5XyWTJnoSGAKXVqDdSmJlSTebN13lOkXehCT7DkzsI8oISU7HWtelqNyYQNHITKFr0p3lcz9TB8Y5EgnytEzvrv+5LiIyIjcuIG3HJ2Z2C+bvnAiP7FH1pFkQD3QqfDTjPrfie6EZJc+H//PyFUaMG9+M2kSj0+2/1VYXEVFyoAL6kx/7eN5c+hlTQtPaOAtRl4rvGTtdg3aaMz7M8yLY6+kq8VrT4htQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB941774
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000009E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 109541f2-b4e8-4ed6-71ce-08df3b492615
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|14060799003|1800799024|35042699022|36860700016|82310400026|56012099006|11063799006|261022075727099003|261026121527099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: MXSoOW33xOOTDld+CzJccPB2Bt5UfaLvi88WX7CAEOXvHu0d81TSwy0xKHDU/3W8fzoCG/FKhe9+WjPGbLT5E2DLoULhCE1QDPAx+5D2hEgvv3dxfWgcghKWosEgdnVEHGx/gAf2qMgW0IX1d5cpst22QrsXCpdwJNHMniNhclsOBE39LRPQJP9RaF+YCxUXWve7gsjYBgqcpYx9lHNBkJlnpsRsQjvk875DajHeYxcKMAUvTcZ5YO8/mjohS91WepPDXp9mkEWMJwplV1vUEswWnYJ6du44IH+/CuHYsKIVsUPN+sBKndwwLObNjy5glz+0XaOlxOqUawGGEl5DsozK4iNPzylVBPYX/sQsbZ6RZsxb4IoNLVrZk8zD2NA2s/+Kepj66kYcpYS9qvsNs0WDzyQovC0VbZ0fcGKp9xpHfpMlUPQQIK3BHJ+AV4gAlIcDIR5KjvR6SCJXwpxNxqBwnOS+pOdtje3f6qyQvu6Y/Y7fOec6huAZDSot1s3zdh6G1nFYzdqV0bPj9zIAGuQ0WTiWg+qiYRtWTHi6xz1JdUK9ccBJk0VqtgEcTfVFpcjxhNh3pGlj6FD+otaRW9R31Pod7F+fqIvVE9VhiCqernyJhK1ry20gjbjFNu6oKSeG4MlfVSoSL/FIxyFDH57cySAKKoBMPlwj1IlHRPO8U0QkxFc6nDr2bCsjKqBBU09PGSHVevvodfVomYrf4w==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(14060799003)(1800799024)(35042699022)(36860700016)(82310400026)(56012099006)(11063799006)(261022075727099003)(261026121527099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iunzoCUlIgUoBd0hOZhRzGqcK5gsUlA/fEEW+5iJFjG5EW8RsIoNAClI9ueVlDK26WKKVD1GyTbox3N5aM6yE7CWcW/RHnGSwVXdWQQV8JGiIBPIR2JGehtA5yJRrP38wbt5xzG41bcBSRPkvwsinCKJM9aoYJnI9OZZsmkkZYc7r8OF0Txvtk74sxVRZPN/OEbulvh0IUce6xoIcKsH0fwFkwNNg4KKRZN894oNcMMlJritWLANefBTvuMEjV1OzXtMsWXVKyZ8IFwfg4XX8QxFJ35W/DXC2jpr6dWfjkzBtCmeCpThTxp4L8boxCIxPUB7l7nllMbNPR46D1dz5YUr6oJBFcRt7Wg5KNzmUsqF0A/NmV+JNMLWk1wxz9fVUzPQWvu3MhUTb77GR6Rd+5edECwahLR5/9l1RxILs2n/7N0FVCOOcLJ0yHzZpkng
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:29:39.2228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1275209c-bb1b-4081-a7ba-08df3b49397e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000009E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7350
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 14:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249558

T24gNCBOb3YgMjAyNiwgYXQgMDg6MjYsIEFudG9uIFNrb3J1cCB2aWEgb3BlbmVtYmVkZGVkLWNv
cmUgPEFudG9uLlNrb3J1cD1heGlzLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToN
Cj4gK0NWRV9QUk9EVUNUID0gImluZm8temlwX3Byb2plY3Q6emlwIHppcF9wcm9qZWN0OnppcOKA
nQ0KDQpDYW4geW91IHByb3ZpZGUgc29tZSBwcm9vZiB0aGF0IHRoaXMgZG9lc27igJl0IGltcGFj
dCB0aGUgQ1ZFIHJlcG9ydHMgaW4gYW55IG5lZ2F0aXZlIHdheXM/IFNvbWUgZXZpZGVuY2UgdGhh
dCB0aGVzZSBhcmUgdGhlIG9ubHkgcmVsZXZhbnQgQ1BFcyBpcyBhbGwgd2UgbmVlZC4NCg0KUm9z
cw==
