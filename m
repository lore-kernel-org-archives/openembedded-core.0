Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39849.1793184001842512781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 03:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Y9cHzfXM;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Y9cHzfXM;
 spf=pass (domain: arm.com, ip: 52.101.84.11, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ADyjsj2244bqG6/f5LeaCUgeq6IN9dfnDtuvXtly6HV6fH3EorN5gpZzBuzj2xCyUrSf2GvzqGgkooWQaYan7qaJs7QTzEosbh5v3nV6MB3jeEmQUiylzgnoHp/y3K3+xTZNNStKE8hMHKUrQnTKFFdW5NyBnlhbvlW3TowQPFd5ecAgPdj/Zg4R0sogQeabhbhQXbgp0CgfU6a5kbFlNgZBvydF9BI7MZXlM4ZirZIkHI1fD/d7SRepfand7wesSo3OttyYjlKdDOlHGAIKOc6Gj1fxxofFBUD/u8W2+oapuMDXxbwq5Nr4CPoGTNtLuDDTqaTGawj7BSvpulYKVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8SkAzfiJVGF08oHYHId+L7b294qO30fRbtI/GzWCis=;
 b=ITbcbPF7qdwBujdMJQzFvCHxIZ6qH3uVBxc5lRyJQOEFmTF/s+5PwDQvuQAiSxggmULhIZ5+B1q2ItPGWAYcsVolyloBcGOLsBBQ/2ILqqbIFZTtpSauKxF7Nh+9MFRqji1GCj6lxwk1cW7rpwL+xcNezNNDQB+EkVVzCi3svPa/IEhGFhNmHfy8KtOlurXQ7qJDiaoyqfjYRYYoCJiWqIttm7w/UPJ8HqZlDxkemoz5GmsTdSU8t1gjQyXSS/3auYm1zipBl3VH3IEo+zzb9c3W2PJRquUed2V2r4QM91FS5jE7+pE8Cvz71OQnlyAQ9oevw0spATnhWoFtErMhVA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8SkAzfiJVGF08oHYHId+L7b294qO30fRbtI/GzWCis=;
 b=Y9cHzfXMSftXUG2GfraHMrcO+uUubmkYmyQgcIY4ZxW0jHGDAr2A1zolt/yeb4TRyi/pvtwskkzesnq3JgTyMdj15KIVMKfokSgC50qXeMMLUpsl/SmqLBo1VtPuhPB7dKwK5xW6YBpw2QGMrGtuZuamQtcYNqtNDk4d95GnGZo=
Received: from AS4P191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::12)
 by DB5PR08MB10164.eurprd08.prod.outlook.com (2603:10a6:10:4a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.7; Wed, 28 Oct
 2026 10:39:55 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::7a) by AS4P191CA0015.outlook.office365.com
 (2603:10a6:20b:5d5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 10:39:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Wed, 28 Oct 2026 10:39:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFh4Ghww6bxQGSi4KRlTOR+aYD1FHgu1Pj/9r28FpjtL6QfqEm2hjVRXPdm7QmafXp3Sar/DGTOOjx3nmzRveYnUFxctMkvn2kZ8V+en/0eRSAqWd0D/s80jNJ+x2jiLZP9nBwwuR7dJQGh+ZDVXEepwXhYEnshiSpKy/9dZxJanEhi41zf2oPFRrMTzhzZm8zwCjuDiOQNX7/ntc+g12zB3jCTfnwzExSy9WMTvPvh59BWisMizXfTkNOmpZVb1KjhTLO7xEFA5rHOSi8uWfIeblium0IEUWUJjWq0X4bg5qnyrGBXvnkh+M7hBU8cQLTFB6ump//0JiFqnIs0hgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8SkAzfiJVGF08oHYHId+L7b294qO30fRbtI/GzWCis=;
 b=xA35qhqbVzoVprRJg8uTJd025Gb9Gt10ZmqS+MsMm7ILG4uYK3PUYudMjKp6fWdV+ZyRuNFVJrCuoaIP5w65aar3hHYVBaRZsie0pscHnIRZqCpX+OeAowEJnC8h8KO7RNSjkhLLzz7o0VhUzGIYy0c2m1bpkEwei5QGP0fWAEeRGL5mOfrTf2MjmTZG43ynN6XcqWR6FImrZxmrdjP+YTMJ+PFXq6ElAZwZlbaeNQ74xask4OvnlmkOqgExb9hxnqG51gWAR+yyHPO0phc7ZssVETUNuuA4zasvpTjuMFd02LukUwYBrgrN38qdDGZ2YpbMoSZV3p5AO6PpyhJ60A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8SkAzfiJVGF08oHYHId+L7b294qO30fRbtI/GzWCis=;
 b=Y9cHzfXMSftXUG2GfraHMrcO+uUubmkYmyQgcIY4ZxW0jHGDAr2A1zolt/yeb4TRyi/pvtwskkzesnq3JgTyMdj15KIVMKfokSgC50qXeMMLUpsl/SmqLBo1VtPuhPB7dKwK5xW6YBpw2QGMrGtuZuamQtcYNqtNDk4d95GnGZo=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by AM9PPFFB1A402E4.eurprd08.prod.outlook.com (2603:10a6:20f:fff1::9d7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 10:39:23 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Wed, 28 Oct 2026
 10:39:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] consolekit: Upgrade to ConsoleKit2 2.0.0
Thread-Topic: [OE-core] [PATCH 1/3] consolekit: Upgrade to ConsoleKit2 2.0.0
Thread-Index: AQHdY9I+pCTwBQISbkS3P/3oa3Uw57cSyYCA
Date: Wed, 28 Oct 2026 10:39:23 +0000
Message-ID: <39540EC2-E240-4E32-A94E-24EA33DE0310@arm.com>
References: <20261024161033.4140130-1-raj.khem@gmail.com>
In-Reply-To: <20261024161033.4140130-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|AM9PPFFB1A402E4:EE_|DB3PEPF0000885A:EE_|DB5PR08MB10164:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e572bc-12b2-43a4-49b7-08df34dfce5c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: xm4lccU8l3RXP5zGFaRPqsIrm7g/1CO+J31iXKr27KQIK4jmGCwWYg3+ih/26mW5CYDhw0zISNP178MNp/1Wh3+iyOS/BbXbuRjdF+UGTUuuGGE0SOzDruVFyGO5i46zVp+bjQHty+XeN65nVpmPYwXzl64SWOgswZmas8PU/8ZjWdNv6YgdW0gcvSI9kLhI7cOszItXS3eIMmvSRgl6g1XWKEptfxoMCxGYBA+9KxqBvM9tQ1MMwbeFIARoXxkRiN7Zx5DYtvcYRq/YZqWYozexoAHcUnNGMAFxd6HxB9sGF3b/3rhnKGzfY5olyRqRawpA4LqYOFkmQmAB5GcN9J+L2Mb0A7IiSCOcXK6H9eQWzUBr8SiMkc6vtlqqGf3AKH4UDDhmArVW0fMOM+o8R8gl+pHdAgo/5TXeOBWTIg1ayhyBgS/wTeYot4MVh5+2jXGBlB+nDs/K/m0Dtnd8iN30L+r6YcJDp79Vxeoh3OPI1BrIInFPI57CKvi1B/DglteBdv4PRZlMQ1DoDuO3Tw2lwUi5b+NARcG+QGumO7EsQg57ObwK1Tn/X7GebO/L7P7uG1oLrDEomPUCuwKYFzaA4B7iyvHTPr/dDCDiCeP74SH3//v/Tx4Xsw5IWpSJTQaRtIjuiM4uRBlSnt+6YW31OM4U7rtf9zp0bBTHFuNra7iXnQOVHlEz6lfHrg4tcjRkgnOJfZcDIT1p4v7VlQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <87AD2C1EDB8CA446BD1896900233B5A2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 5L8IgY9iBBOYYJ7WGZVqwo9QgSUtgckKHJWOWWxUMtznSSM03Hx5xVks12i0nTfVsMfi23xnqGa/1IJvMVilOWJjoKXdGOqnd+DhRhTyL4Uuh7JJdEo8BYy+m1usVx50kASQkvCLmnBcDTH0gNCUb2BrPuuH/AD62/ZgRngcp6OHvgtiB7DFXywk8Tp/MLgIWiWNz/3uSpaOzsZZQcu7/+X3k4Pitvq3molo0E5XJrbe9s3nniuwOLa7W+jgpT/iUxMwC1tEy1wEGCO+ARxICkKwyZCVh/GxUrWjthMJ9wtyjQTGnDQ8r6y15Zuxq5RDG6+ip6qkqS3qDIUILqCG4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PPFFB1A402E4
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9d59bc41-f2fb-4468-1aa3-08df34dfbb3a
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|14060799003|35042699022|23010399003|22082099003|18002099003|56012099006|11063799006|261022105027099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info: UG5/TZuMUkp8mToHW6kFFnRXkVI/kLOq7tA+H/BJmxp4YaovREfO+Jv/5nw7O+W3vG7Y5d4ft+sTbSUE0xwN9sTs4ycIRENv9BPuuW4R7FSclKMZfvyvKeVeW6vz1KHEi2KNcRz8s9ysBgT5IWUXdpQy0AuLqkQoxq89AbQ4NGu6T8AyMfFeZVZmQSsR50rjleCjngBArS+lOmx4JdLlxQDRfkIf7JnstHX9fYNv7XZ1tf7rpQOxt/Ijggn0o8c2+WlznP4HDZgANd444yp4s2v6FJuUtTl49GnLfDW7UZFtNWja2Tl1/BjHsbGahw4gi/mI9hfmIeQBEVrFw4GrVBdLuGj7MVAEP91dAuZFyPOxbKAqbXrsqRDvxfHIZUguR4mw805qISVESBC1rbndb4q/DhVL+PI7LUuJvo62SYIQUQDTIwgYlUVe7BXRMEQJUfVhc+ovgMNDGQjr+/JYNSQD55F7mSlJvJ7QPgqKRXbWF4Cn5g3rrQ0RAGoML4sdggTmTFmU1uylAm20PjMLjp3YOi4Q6MP0Z9SPSuPSIJv5b47mo1sZJVzxmHLRBqa9v130Bjxh5wqE2jJrAsz7dh8ZiHUhFWX3zcAPHvxenrrenj53DBF/ouG/0qMwK3BNWNBp3SxA23RM62TO2YUCX9eDQBsbSu6TNSbK01J0Qyb332AaOcljFf0JI4QEgcWpUS8Dhy5Im+/7OyDu5S1vlQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(14060799003)(35042699022)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(261022105027099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iUE8AnLntqUOp4GrzU024AMCa79WMiELZydK19N7TQUNI9QK60iKNVJZx5LgWD++AIDMO18qR7BAQwo8HRzYFbY7QVcanhf3sm4lBxbhcRQqvoiuHjPrZCfwwQ2T4hwBqTzb9Q5z9nJsLurYGkpdrL6kYTH4udzvmoTy0gHBhASn5sTp0OLHGXrmOjtVv8Ft+5GFDQoirpYIS6yTD0IIRKeHpbrLQwz6jTkneznA03z0wzCOt27G9yFG2vIu7DaMrwbQZM9kq14ZUNXhiALnS724QNCEpyWvvh5CQou55cOZi5zL0MqKvoZmLwYnmU26rFNGa6VB6y5yedYGRkIA/WDA0KFkGMB+URlCH6V3agN2rPi/FW8Yi1JE6+G8jf9sgsOZ3ecQ3zEkPTYKOZ5zu2i0qVWfMp78O88E0AmsqOI6DUhrJb7HOamd63fOhOXh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 10:39:55.3860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e572bc-12b2-43a4-49b7-08df34dfce5c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 10:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248807

On 24 Oct 2026, at 17:10, Khem Raj via lists.openembedded.org <raj.khem=3Dg=
mail.com@lists.openembedded.org> wrote:
> Note that 2.0.0 changes session and seat IDs on D-Bus from object
> paths to bare IDs, which needs a matching fix in polkit's ConsoleKit
> backend.

This makes me worry about switching consolekit -> consolekit2 in the same r=
ecipe. There are a number of recipes in oe-core and meta-oe that depend on =
consolekit so might be impacted, have these been reviewed:

- pulseaudio
- networkmanager
- polkit
- lxdm
- xfce4-power-manager

Ross=
