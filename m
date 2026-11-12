Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14327.1794493594376014160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 06:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BZrdZhvH;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BZrdZhvH;
 spf=pass (domain: arm.com, ip: 52.101.83.33, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zMZjlpHnVLi+YjmgdlKWAysiqUIe1DGzy1SgqzpyeFGhZcWVwIZ5lv8MUSSWmn8PhWQc4zkyEY/a4O3EM7qCIPU4IayjGUfL/EuBmTwkg2C/qBS2Y+iasAk0xCn1Ll94U6REjq/AwzeY6L2S2jcbTsIMZLtbxLklAqVPtMHpDTOiiACFyy4RlC23e/0aXEuXGf9+2mmfOZy5NT5KaJTmsbdyYlfrp/8eiLpXhLh/rpkofumNbBMyAyLClzcCraXWeGZSnea43VBp/q3gEUk8UxBMSB4DnfjmRHd0zkwdvcZA3jY4esUfTHQST2vjjfZQRNjEZXIXZhee6PGETlNwIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3G94EDNJTrG43uPpIxriMZRlg/i8xpt+OoQab5yJGA=;
 b=UBK4/NfQfigtn8IORy6IQhf2eLgCEuyvQrYgKBo/5rx7+6TcMHm6qhbISB5itPwFMwYrCutRkOXSQhQIK3EozH6tB/Xps+5Co17W/jCXYiEnT61nQACtJ2GWRAGA76GOuAYgDzjKTZFJeN4VWY1MuJ7WJ9TJVCSKAgRo7elPK0L3efYBwX527MCJBl2Xes69NKSsEgV2tpdodkg9JFEJvDeB74hegYUB55HXzPL0phsXlT+04ep0msSuJMpjjHaWCU+mE+f+JXfYMmWccjPioyg/A05bPBPKrJVYgHN4yOkoW221KrnAhBgRfqaZZ5ZgQhAf/ia7hGQQEFijDlCaQg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3G94EDNJTrG43uPpIxriMZRlg/i8xpt+OoQab5yJGA=;
 b=BZrdZhvHb0gsYNgYhgwOwpstIqqS5SasEDWtu20eBAelpzTpuRQtwEOXCK+ZrZX1lpNvkMTyKzZ9Hoon7z5lHmw2vZktT4JkoMacbDA55EP8eF5Z68DGFtKSliH6TjWyQILvk4RYTORrnnocol1rBcEijzDBwBu4EgHwUNavoZQ=
Received: from BE1P281CA0242.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:8b::9) by
 GV2PR08MB11795.eurprd08.prod.outlook.com (2603:10a6:150:303::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Thu, 12 Nov
 2026 14:26:26 +0000
Received: from WA1PEPF00009B3A.eurprd05.prod.outlook.com
 (2603:10a6:b10:8b:cafe::34) by BE1P281CA0242.outlook.office365.com
 (2603:10a6:b10:8b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Thu, 12
 Nov 2026 14:26:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 WA1PEPF00009B3A.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 12 Nov 2026 14:26:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCIUhPnT7pXgp0tDn6G1d4fie2VXbtPNuJi9LOkJdg8GHJMiu/64jJww87BgKddvHshEWDJGhXH1MD5eVlGxKRGhC320yk5ohH2ZfR/22qh2PkVG1tdtAsBHgx1PMPcnMY7lUg8CipKaw2tiGJuPlluQQ5CZ1/xQ4+Pefjfpp/nNR40RlnrjCbAMT/BjbRxfqPHQ9uQSB72lom52cCPG6QQ0h6+6tA+msaGDLbQInrYyHGO/urKystGZdnxRTQ2iHxSwrXB5Sx1ybd1U5To/c+pPstcpwtDjNPKg2SujvTPqBd/O0DnEbYtZBMy5ZliPnL7Unpvxja1oyziYeG+HQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3G94EDNJTrG43uPpIxriMZRlg/i8xpt+OoQab5yJGA=;
 b=XshKOfZEXZp4Qd89ZR1QezsMUIhzPdZuNcVMRKvuZAbcMTNKj5w8i16CyPOjEJgl9IG90E02iKZ37oZLGrlff7eTXzWLYjb1tn+7mY4/C0Adi+3k7WhQX1pgQam8zOSlPcrZ7ZgBoXmFRzD8UnHCgF4tU+wb3QHNme//F/HlPd5fmeOCj2oBLUsago0Dh/Nf8L84hhYVxCgFsBFe+pIMFD6EIh1nUXCa5B3JxjP3gRWwCI2bmwdY8ZnklvtXozwTnVW6rceprh+vOlYuS1Hd1kKdfZryMDp/zwDQkEFTF+bpx/dqcfHtV2BRzCWo7NUqZx6DpFmsGhJ1rtp9HHLF5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3G94EDNJTrG43uPpIxriMZRlg/i8xpt+OoQab5yJGA=;
 b=BZrdZhvHb0gsYNgYhgwOwpstIqqS5SasEDWtu20eBAelpzTpuRQtwEOXCK+ZrZX1lpNvkMTyKzZ9Hoon7z5lHmw2vZktT4JkoMacbDA55EP8eF5Z68DGFtKSliH6TjWyQILvk4RYTORrnnocol1rBcEijzDBwBu4EgHwUNavoZQ=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by PA4PR08MB6094.eurprd08.prod.outlook.com (2603:10a6:102:f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 14:25:51 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Thu, 12 Nov 2026
 14:25:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Khem Raj
	<khem.raj@oss.qualcomm.com>
Subject: Re: [OE-core] [PATCH] ptest, packagegroup-core-buildessential: Add
 clang with clang toolchain
Thread-Topic: [OE-core] [PATCH] ptest, packagegroup-core-buildessential: Add
 clang with clang toolchain
Thread-Index: AQHdb8JUFRnKEGFHFEWGM9ZeBAZWL7cqg9+A
Date: Thu, 12 Nov 2026 14:25:51 +0000
Message-ID: <B58FCA39-4F88-49D1-BE7E-E120F9E03177@arm.com>
References: <20261108204650.3577385-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261108204650.3577385-1-khem.raj@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.4)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|PA4PR08MB6094:EE_|WA1PEPF00009B3A:EE_|GV2PR08MB11795:EE_
X-MS-Office365-Filtering-Correlation-Id: a5358d06-390b-4cdf-8f64-08df40c8ef32
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|10067099003|11063799006|56012099006|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 9LLNZ1e/RwYB3/n9HWgA6l58t+epZJcI0dAbR5HFdR3oK881xd3he9PKIfai6KepHHoNxFhiNz8LqjXjv1qwjuV9T98zLG05xAnlH3ZSDz7DYm/Pk1I+PpVy4bYcsRj3/GldllzNyjn5vTloFVJItzSF+iql1CdlINkjemTllRV8pSVp6ofhnXGeLtW5yENXnrSJNVCz1fC+zh6ttD7TkY0xkT9Gbhd9kgdFQbrn52zTgJb+nzYGi5tTirrnzz/eJ59yikJSV5vNbqwamU0NxjbQkxtoV+y8sX8oK/7uPoqn9AU8HdJoJO8JX6Ff4Mk6NrWYQtJTyPwmVta34ZGtOmQ/q+zS++kgiN3af4vgHs06KTM5u8SmU3YpjjCBCf/hTqjtxMHDQ9uQiryta6RnAZXuaMWQu+9Mx8vK92HSia6wOam/aESnKDAuUqSe0CZIL1RjghfQrc3bqr/YjY1kXn6plKgOaj1a5y7NxtUrwJPJX8Zdy4+ggpjei0x3zIdnkyVS5X+p2f0Rh7J/bw7741ud31QBVLa2UDVbvhb6f7gJqTQ00uC/uNurVkoyC/w72ZfAWLJhUbm267Uh/FRMd0uJM7/ZvNn3fIWH1lyMVyoCY3AcTdLJgHkJjeqEd7IfiAfbrj6r5Ndo/uPEmnm759nET1tHQIrAwP656XCIAIxEoUkbkj6l92/TCCQHei8C1Aryb85G7YtUOOD2KWSmeUdTsGadNPeWTXL+PBtlyq8=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(10067099003)(11063799006)(56012099006)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE274CC08D73B74A8B568C19AF7ED9B4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 4HaAo9qWvndSAdTT5dc98YChEpgoiPAJqsL1B1LoTrLF2iCs6lSMfKwBGM3SktuRORTCkNmUgMASUeArdUcpwWZkeOf2yJXdCrjVV7aK6iKMpkbgFrES9q2pDFIe7ecbBgKalupLd5ocZaNvI22xxXWzL3mFkmERUb3MeBuF+nUmksZsZ138EAdIk/li+fNvBhOxmvE+cKP4U8CQXOJr2UGx+kIm39TxsCJg7UxpmEz+sMq+p//CjyFaJZSieyNgsWMcFmG4g7508I/IiX6coUWQ4ogxexinW8rnRhJmhCKfAfAZ0mVbwyjbIDJQV/HD+1N1+9VC2ny4TMCRd/q47w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6094
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: WA1PEPF00009B3A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0e9d8494-6a04-4a4f-7844-08df40c8dabb
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|376014|36860700016|23010399003|82310400026|1800799024|14060799003|18002099003|22082099003|11063799006|56012099006|10067099003|261009223027099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: o6lvOO6aSYs7AWr0sCmH2RrLwy2X0EOLYQKKbAs+p3iYJOc9Z9Pm2Yc58s4/ZRGXInjtEggUoLyT/izOkqdkVs4pnkoHLaRKx6F3xTPgacbHP9GbqSI0zi/QOAyBCP2zMI+NmYKHOKHpiMc7TuJ/Wobr9SoEBEleZvV+cW07cXfjMEKMAC8GCAi9MzEFLvgRxbiXRoW5bJHRWk7Z3iiSVGN7LWSQZCrxFis1mlpIRmUD2334n3KjomVHK7++l7OJl+M8H1NRI1wAq3EEUZfthbRmaKStxSNB0t0cUlkmXLOSDOB32MnZAIKpIl49m+98sfsSg9wRR33QskQUZUCGXSZtsSAexmS6oHlL7Crh2MFuvmpXVyFCHaWvH8scJG/NdeBRWXvxZ2WzZBXgaHGtB5Q6/BkIJ+zpCCwJvS09tMhyQ0ragm00eDeJ9f2iafNL5xg/IS+6Fl5TqlkLNgLdovAB7kPMjCfbPl+rAuNb4UFByDR9N59QhkY2aQ79oUZy4ncCgKamX374lJzErmLzOlKE01+MCVxvjVC6PwIIxZ6N93yIC2P4jZEGym2M8iMimmp649IBghtslSKQ0h9Rh9EyGp3Hzt7YT/LRXWWDhbKRUkGafQng42/jdMa13mXKiM2x1Ty5gl3IaK5I6n6ArUEuuFCq5qDNWseuqGJsi7jdhvjPRN6C+cEjISVbTUNmPFYKSG5ai8SEGpap7C3A6A==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(14060799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7SL+DAS6OXZrI6ehQOC2MH6MIlrby6ds62umHFBhLSW2j+Qtce7uU/dVvHGOQALJDOHjtqtU+q/bpPiuqU9QK8laEEpjXoRRa838DGtW3SB8LB5hiOQM2FovlkohDBZbmE7W23IPCsJTOhICPCtjSs+JXsxpyi6Gtapy/kceo/PyrgfYthWn5ZyPisV1mgBHl8YyxkmZzJ01JubTR7NvCwoZeo8cCqIsXFdPKXR4uvwKRlNtZJvO1xzg7QTi1VDfB4nkY+JwZnrEhdl9DSe4s6MU3pJgmRef437DOfM2SMaCqV0VvnswjhTK5IWhyRbGy1WTvQ0pKsdsYTKz4rzCMTQy5D4JrvfC9/0rUQO8x7bkZFS4iFif+yiXn1bOjaXwlLG8qIRzSo8mriyzdTi/WHoqVAK8TXOCJL/UH3J9fFFWh+QTTiTjU1uzegUppIUu
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 14:26:25.8663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5358d06-390b-4cdf-8f64-08df40c8ef32
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF00009B3A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11795
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 14:26:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250100

T24gOCBOb3YgMjAyNiwgYXQgMjA6NDYsIEtoZW0gUmFqIHZpYSBvcGVuZW1iZWRkZWQtY29yZSA8
cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiBUaGUg
dGFyZ2V0IGNsYW5nIHBhY2thZ2UgaW5zdGFsbHMgdGhlICR7VEFSR0VUX1BSRUZJWH1jbGFuZyBz
eW1saW5rcy4NCj4gQWRkIGl0IHRvIHBhY2thZ2Vncm91cC1jb3JlLWJ1aWxkZXNzZW50aWFsLCBh
bmQgaW4gcHRlc3QuYmJjbGFzcyBhcHBlbmQNCj4gaXQgdG8gdGhlIHB0ZXN0IFJERVBFTkRTIG9m
IGFueSByZWNpcGUgYnVpbHQgd2l0aCBjbGFuZyB3aG9zZSBwdGVzdA0KPiBhbHJlYWR5IHB1bGxz
IGluIGdjYywgZysrLCB0aGVpciAtc3ltbGlua3MgcGFja2FnZXMgb3INCj4gcGFja2FnZWdyb3Vw
LWNvcmUtYnVpbGRlc3NlbnRpYWwuIFRoaXMgY292ZXJzIHB5dGhvbjMsIHB5dGhvbjMtY2ZmaSwN
Cj4gZWxmdXRpbHMgYW5kIG90aGVycyB3aXRob3V0IHBlci1yZWNpcGUgYXBwZW5kcy4NCg0KVGhp
cyBmZWVscyBsaWtlIHRoZSB3cm9uZyBzb2x1dGlvbiwgZXNwZWNpYWxseSBhcyB5b3XigJlsbCBl
bmQgdXAgd2l0aCBwYWNrYWdlcyBkZXBlbmRpbmcgb24gYm90aCBnY2MgYW5kIGNsYW5nLg0KDQpJ
4oCZdmUgc29tZSBwYXRjaGVzIGxvY2FsbHkgdGhhdCBjaGFuZ2UgcHl0aG9uIHRvIGRvIDphcHBl
bmQ6dG9vbGNoYWluLWdjYyBhbmQgOmFwcGVuZDp0b29sY2hhaW4tY2xhbmcsIGJ1dCBtYXliZSB3
ZSBuZWVkIGEgdmFyaWFibGUgdGhhdCBpcyDigJx0aGUgdG9vbGNoYWluIFJERVBFTkRT4oCdIGZv
ciBjYXNlcyBsaWtlIHRoaXMsIHRoYXQgdGhlIHRvb2xjaGFpbiBjbGFzc2VzIGNhbiBzZXQ/DQoN
ClNvbWV0aGluZyBsaWtlIFRBUkdFVF9UT09MQ0hBSU5fUkRFUEVORFMgPSDigJxnY2Mtc3ltbGlu
a3PigJ0gaW4gZ2NjLmJiY2xhc3MgbWF5YmU/IFRoZW4gcmVjaXBlcyB0aGF0IHJlc3BlY3QgdGhl
IGNvbXBpbGVyIGNob2ljZSBjYW4gdXNlIHRoYXQgYW5kIHdpbGwgcHVsbCBpbiB0aGUgcmlnaHQg
cGFja2FnZXMgYXV0b21hdGljYWxseS4NCg0KUm9zcw==
