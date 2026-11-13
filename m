Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9853.1794573143745282688
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 04:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UFflx57S;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UFflx57S;
 spf=pass (domain: arm.com, ip: 52.101.84.22, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wgu8Oe3tfZarSEhj2T08ZxEy8jaUz5E6R467cb/eh5/fbmRhqpY/rKNvCJHtpsH0anmNUSOoFOBXEvKbhQHU0KnQEnxm5E/Hqgvn0330D3CWr3XezgbZr/Qj9a34DhTYYCoRunlO4Z6O6ia/IfSf8QayrkzR5dHJvWcVknzdBqzye2e0R3NUAFiXcxn3W5uRIpnS81T8frOsV1LF2C1CsJepGmpDcUjq/OzZ/YFXkfrQwJT28+KD9eo8jMpfTy3gTH/h+/t1YAOBfF40Aj3k2KpDtsgyasyOWNNp9mz5Nw9OJiFDuica++/BR3UuJm0nfrVjg6LCmAxfnIDRE4DoTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzAsCCPJFWrV6cY07zBOXcpWhaLqreBiz/fcByn23x0=;
 b=Z3ADdIjv6XhiGXMTmcm9NdWDMUEzcHfKFz0xxvlT1NMGH6tptbXfZmdSDMp70jQEx5J+6M2LMJdSstMi16c5SMLaitfeZTZrsBnanOqLOggZsK8USjAhTnfH795otHhHVcZ441jffGjn+9rhakTcw4VREat8txZXgNw2JRw8ANVY0g7E4tfGEK4VKyuuRnlfnqAgXZcrapGlbbhXtpWsgs7if7g7qNS53c083AlgIhJrNRjIL6owK30ITbqcwX9agNDLm0NUg/XLI+IH6l9b9QIzfFt60/uQo1nyID9ESQdVx+9LYt6f+reLjcDwFKjdCU+e2kkgjCx3YXR6PIJg0g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amarulasolutions.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzAsCCPJFWrV6cY07zBOXcpWhaLqreBiz/fcByn23x0=;
 b=UFflx57SYWEGV8LoIxgzciwo9cTnppIXc/W2KFDm/jRxZU+5zA/aYx8bPcvRCco3qC7sUqMiCg0qw3ZiUYGBCgTlQXWp3fAkno0AsRNN9X03kWH/QsYmhjCkXsaIO2msAMaQwbeAa4JtNzlMK70oAYMbAQlInFQrmLrPdlApQZM=
Received: from PR3PR09CA0017.eurprd09.prod.outlook.com (2603:10a6:102:b7::22)
 by DB9PR08MB11464.eurprd08.prod.outlook.com (2603:10a6:10:60c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 13 Nov
 2026 12:32:18 +0000
Received: from ZR1PEPF0000E6B3.eurprd05.prod.outlook.com
 (2603:10a6:102:b7:cafe::95) by PR3PR09CA0017.outlook.office365.com
 (2603:10a6:102:b7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Fri, 13
 Nov 2026 12:32:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 ZR1PEPF0000E6B3.mail.protection.outlook.com (10.167.241.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 13 Nov 2026 12:32:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWVMhQXEa5FCPp9yWjg6uEUgIoK4rE+YdtGuJtxo6eYCn03OvWzsT2GMgCepZ6vR+a0uxfAJzVCl1uPTFGF6rxa4qICZIjL6DUP3gQ2YjmUxo27zT7J87iHl0V8PK9TUOCsGiHb5aqa5mG+reiHj4FMxPmAr4Hsekvx2GktaZKkoDHcPn8dDcf11Lt5ewHR+6AJk9VVV9QbWBbDlocXNmkM+QwSGtf7zlJEI9uh9Nte/6wa1MiBplg3KA0sb/ZYHifJpVV8iSg+Pzo6jjlQ2+q0uCENNnyVx6lXK5JZ/3dfFjis+FVPEaq5fjpfBl+FXMLm8GpstSrZZXwQRlpqlpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzAsCCPJFWrV6cY07zBOXcpWhaLqreBiz/fcByn23x0=;
 b=r3thsIq7hwF8MkT9ME0XY7YVqFU/M60ayh1RborFauRciPVBYgATWEO4Xdx0CLJoAK8OCwnxcn+TZELtbykaXIbXPKDL4P8px98geiBN1o98H+rR41r623NMf6PX83k8T6HuN6OIsF+6ND4A6UMpQybQ5Y/YCDIVRinqIncC+Mb7ipBeGkNUrSNVGY0BMguWTFSDfN7nSsIpEOleiA+mQ9yOEgk8gK+Sy6dEjoC4FbWmUOvCRZbT8bi7GDR/0+w40OsC4Flmowd4085kqEVZx7Onr5/F7zdlA2LwE4jBWhIhkFdOeVxgk77Sv9ifxAPVJpu7KhW9cN5/YTxrPE1kfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzAsCCPJFWrV6cY07zBOXcpWhaLqreBiz/fcByn23x0=;
 b=UFflx57SYWEGV8LoIxgzciwo9cTnppIXc/W2KFDm/jRxZU+5zA/aYx8bPcvRCco3qC7sUqMiCg0qw3ZiUYGBCgTlQXWp3fAkno0AsRNN9X03kWH/QsYmhjCkXsaIO2msAMaQwbeAa4JtNzlMK70oAYMbAQlInFQrmLrPdlApQZM=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by DB8PR08MB5452.eurprd08.prod.outlook.com (2603:10a6:10:111::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 12:30:42 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 12:30:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "adam.duskett@amarulasolutions.com" <adam.duskett@amarulasolutions.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v13 3/4] dnf: Upgrade to 5.4.7.0
Thread-Topic: [OE-core] [PATCH v13 3/4] dnf: Upgrade to 5.4.7.0
Thread-Index: AQHdbe9O/CA0/ydCSUC6Z58e8tobfbcr+ayA
Date: Fri, 13 Nov 2026 12:30:42 +0000
Message-ID: <8F4D5966-D631-44C3-94C7-20980A4D6C0C@arm.com>
References: <20261106130325.2154855-1-adam.duskett@amarulasolutions.com>
 <20261106130325.2154855-3-adam.duskett@amarulasolutions.com>
In-Reply-To: <20261106130325.2154855-3-adam.duskett@amarulasolutions.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.4)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|DB8PR08MB5452:EE_|ZR1PEPF0000E6B3:EE_|DB9PR08MB11464:EE_
X-MS-Office365-Filtering-Correlation-Id: 59873946-d99a-449c-6c82-08df41822638
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|11063799006|56012099006|10067099003|4143699003|261026121527099003|261022075727099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: F8ilrpT5nYKKy+IoiTDCIWdZBhdzDBT4JIN3OGiy2Ca545f4KMfePDQVdwOPyGclfTeudZjTGLZDUA00A7KAqgJ6ov5SOVTinXW5L5qh2XWiZYss+Rz+bZMlvqzkz5Hc+O8+heotsELM33ao6md5/tZ8Ax8oemUkl+2I7mNMVLTxmitxGk0WPuqKpm7KHvmZDCkEXn/DiJQLb6WS8mgH7JcN8GE7zj6nnyyN7lmyO4qbAD6WcRR5/pCQs7ZYCnq+4dg7wcjjZ23W8eJ+LoFxHCFUclVjWUxD6tpTZSfP8ABwuyCGk5xaXkkARkIJI7oM4dUQdkTDhG5OOQ3Cc23PpO0xh4Rh8P+zhi/FAMulFM4xep1k8iF/H1pzAFsv8ECAXbMb8YwXQV1hLAKfBOLF766H4QBGltllTSK9M3g+y6ZvsGA8sACq7kgeX3cBdoeM27DJIIKpYZV4lFkfEQxhBO1n796qLXUEnykQnZl5RDi79PAsrRRa3kV5dVJXQYUFXp/a71lAd0+ImUyGHzJva+LlqHuh9DW1PKxpY1SxpZgT9zRk4hAHCsqJlTCT6E5xn5DQnYuunIE3alKtXT94p62clt6QoK6AmS/DWhjrF4MrSd6tufYjlbFz+ois3JFumwJXYRZ/c331uRVMp0UzCDdFlS6EthOfHj0TM0msWdJjVfYFEgdpWH6PACYhScHaOVY8vaB2Z5xZZgIsjWvUKQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(4143699003)(261026121527099003)(261022075727099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7D535E9989BC244AE85A91AD4DD8C80@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: f91r1aLMzsQagXHgY0doic+5AODKfmj9873i/DLa6iTILK0ZGSeYb20gaZcLDu/pCyvPun/B+03KppyndqT8XmS2cyCtCNSPIUBfaPJPHHAvuDUEo0eb2cg9UunzbK7X6+vRJ/88StAEs2XHa1zKm7WxrcFteTy75d90cr5D9HTZwF6ND1VBtY/XLSGZnV6bGjJ/bTLCyNrvpGLZcgE86FR3o/HScaNgUIE2ypTLz+GReOzOo4yQAOnD4jTnTP0cazTQBDSHNHJppuLr44dOWS9NiIuINUwtCkribtxa5LFNFAtrxhwo5DZt9Q4LAccuiO3ieo/PpbUedzg5FKd+Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5452
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: ZR1PEPF0000E6B3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0b6099af-6335-4615-44fd-08df4181eecb
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|35042699022|376014|36860700016|14060799003|23010399003|1800799024|22082099003|18002099003|10067099003|11063799006|261022075727099003|4143699003|56012099006|261026121527099003;
X-Microsoft-Antispam-Message-Info: PwDodv7HfixwGBRUitEM3wiDYfbQF7S4o764p2oJWMSc8a0GW7hC6fIBBl5iGrLKf4ePr8fqNxA3SqH8vdnrjPeGAQkKmmH5DJdWX3BYw1v7vo4GE1M6yHmlqqHO+PYEhx+aiClF6N4zS/v0furP6UzMewl/ZYziP1mVQrj8YkNV2DGNobvb5m9ioEzWy5iSbWt+zqy+3eXHthLQCtye4dwt3YB6fq17838lVEl5pM7aOTPQJcZnar6Bf48boVGmGakSBUkZAiptsgPKOET6aUFfTIhSJkyLSEDFiyvyWkuzvULtbMRuZILaFLsRBcdk9HE5dojbke51zKeP1ijq2r4PomKrjQZLlS1BTOrZ6M5GBfwbWVJq4L/e3ZUo6q+NM/CyuCfdrKv7RaRT9NrwoqxcA0bv/7T7H7GagfZjv1WjmOepYzHhuAe25QcfzTwd3WyDj1fFgV0dX1E9hMyCXbG44ga+DSDyNZTF+ulipPUwjZueQfoGNUjj2a9ZLnRZWlndTI9tb0GtQi2Z/gmAaIWlgw1ZaNgPAb9J4FMk1gvPvD6Abc+I1/03OdZ8YBaTUhSdAw7z0BdabaNSwbmwxnaXhRpqVmxSCBPprhXAIAi7OrPsBz6sC9SUbbyUUY/Gz/quNJdbS5kr2wYzGmW+gjd9OPNXk6ogWpQNuEY9VdK4H9abAXF+QPqkVwODOYj0nEF8KoTciNXfwlpvGCJOOg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(36860700016)(14060799003)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(261022075727099003)(4143699003)(56012099006)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ecp1SDrQH40qhOvlXPuM4F3KVspXVhRtVNKzdO5NANNLf9zWDeEVdSB3ILVncaG+RgjMfvLnPdN0HJQx2/7rY6QMEiLkvSopqMFD6Dt/MXka4SjdqysmzXRoZEXp+oDP7aHeNYA1jIC3we7CvxRggO3WD/0n9WU4Y6jfwiw8iZaPK45pCyK9zocwGZo79i07gIS8k29rfSlHOdw34UP2L4U0V9/pyoCltqwBpp49wLtMXvkdjW5SP3nzYBLwcKYbpmNgTc6aiGTgGPykISn0wzNUQQRDyNfUH9RKrO1emK/kn/cc5pss5GsCKUziuyr8yJdB6jUHcWE32DxoCvh9VZ/Ug8Izp/L7my9+3GYjgekb3Sk5qtZHhQpsP/xWxauSyGEbRho+DcWtN3cv5Oh2/XTUkH3bDhs3pFodb90bgsNilIo5FDlco7W7XWa8ikoL
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 12:32:15.0777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59873946-d99a-449c-6c82-08df41822638
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E6B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11464
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 12:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250167

T24gNiBOb3YgMjAyNiwgYXQgMTM6MDMsIEFkYW0gRHVza2V0dCB2aWEgb3BlbmVtYmVkZGVkLWNv
cmUgPGFkYW0uZHVza2V0dD1hbWFydWxhc29sdXRpb25zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gDQo+IENvbXBsZXRlbHkgcmV3cml0dGVuIGluIEMrKywgdGhlcmUgYXJl
IHNldmVyYWwgY2hhbmdlcyBuZWVkZWQNCj4gdG8gZmFjaWxpdGF0ZSBtb3ZpbmcgZnJvbSBETkY0
IHRvIERORjUuIEJlbG93IGFyZSBzb21lIHNpZ25pZmljYW50DQo+IGl0ZW1zIHRvIG5vdGU6DQoN
Ckkga25vdyB0aGlzIGhhcyBiZWVuIHF1aXRlIGEgc2FnYSwgc28gdGhhbmtzIGZvciBwZXJzZXZl
cmluZyB3aXRoIGl0IQ0KDQpNeSBiYXNpYyB0ZXN0IG9mIOKAnGlzIGEgcm9vdGZzIHdpdGhvdXQg
cGFja2FnZSBtYW5hZ2VtZW50IGlkZW50aWNhbOKAnSBwYXNzZWQgd2l0aCBzdWJ0bGUgY2hhbmdl
cyB3ZSBjYW4gbGl2ZSB3aXRoLCBzbyBJ4oCZbSBoYXBweSB3aXRoIHRoaXMuDQoNCllvdSBjYW4g
bGlrZWx5IHJlbW92ZSBFWFRSQU5BVElWRVBBVEggKz0gInB5dGhvbjMtbmF0aXZlIiBmcm9tIHJv
b3Rmc19ycG0uYmJjbGFzcyB0b28gLCBhcyBkbmYgbm8gbG9uZ2VyIG5lZWRzIHB5dGhvbi4NCg0K
QWxzbywgZG5mMyB3YXMgdGhlIG9ubHkgdXNlciBvZiBsaWJjb21wcyBpbiBvZS1jb3JlLg0KDQpD
YW4geW91IHNlbmQgYSBmb2xsb3cgdXAgc2VyaWVzIG9uIHRvcCBvZiB0aGlzIHRvIGRvIHRob3Nl
Pw0KDQpDaGVlcnMsDQpSb3Nz
