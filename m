Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15315.1795517981160961420
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:59:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WTtghHfC;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WTtghHfC;
 spf=pass (domain: arm.com, ip: 52.101.83.49, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Y9Y9QLKpjNg/AsxxlVukW93kPeCo5QMao+wXRM1hWLJK18mDEjHgxHM2Uw020vgg0CWIKfL7Ym8Q+a4FdNSy3LLzMOV7c5Bbcy7Y4Gi55BoBj19rgL5bRPxmCIP1yYrY6287vt1FKiLWUWeC1IT8KVD4Ixp/5bEDc0WpX62UY2+LK/FaY2tpb88RjLWs7wblv3kzi8l3AEEQX7OD7QNYW/0MbcKhXuM7SGXPWmfJ5qllEKqzP5eFlLk1+IOparEzaaKl5Yaq1fdlTcYyixFU8lKi29VzCdLjpJs27+kq24dt1BM94i1qvIpIZh6JY8FA2/eFbEcqLsvQ/X1h8mV+aQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KHNHt8zNRIe7z5VD1igSC8zIXRgYLpZSbQGuUegYYo=;
 b=hNbdOkuNX1KWLXGVso+niW3Cs0vNvksV9C1tUO4cXDGX0oQCggEMhe+4iGcM4P4duQgF+JFEpt/sT2Qmb+SzWSgspMiQ9VmmtWoip4GcSGyr1fQ8nZzJRNqgEvMHENYG67n7/eQOzuVzbv3OTLmOv7NirgKjgGrliSvbiZdOjtEZUl+CYF7uOjU9RS/qIfC3I0otFfrdfhzvDTzHMpoeW4GLHmmc7PnEjVhFjcvGM0l2MdTiEdSOTuXovj9vxx3kSK0S5GouB4N1uaSH4mMXusKH6GR+9P3H8Fwzrxh1e1GPxnwr1CJIWMUSlUcSeJpzQ+gpguNO/rQLMkhHWnO0LQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KHNHt8zNRIe7z5VD1igSC8zIXRgYLpZSbQGuUegYYo=;
 b=WTtghHfCsya4I0pYJgRt7TTdQ3h24tiCFIjGIV9aEVnMWd2bSHmXqq3xv7hq5SbuhwubndiQ4zepKVxPiEgr+e90DuvmtzwS7UBMNuUDBjHGczBAPyegt5Wy4f/zNzTlyM3uken9iBTvcyhXNodYafvTgpmgv8wdB50vDpfNGOQ=
Received: from AS9PR06CA0278.eurprd06.prod.outlook.com (2603:10a6:20b:45a::18)
 by GV2PR08MB11491.eurprd08.prod.outlook.com (2603:10a6:150:2a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 10:59:32 +0000
Received: from AMS1EPF0000008F.eurprd05.prod.outlook.com
 (2603:10a6:20b:45a:cafe::9e) by AS9PR06CA0278.outlook.office365.com
 (2603:10a6:20b:45a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 10:59:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000008F.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Tue, 24 Nov 2026 10:59:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAIuywnppIIvdHiI72oBYNDc5nwN1kXBO8/jkX2v4mht0ktwCJLVdoqdRy0K/jDNhSRsCDAkr8b9uFEZJ1VgSIJe8qW3ZjqRzYZLQ4YPVNdcIXFtqrxIonFfD3NFmUv1IqeEDTMgYjO4ivl6KaOQ3nuKIOtYyOnzegdIQc4roKDe/L1UkSMl1P9nfynkZK70iukwp79lO0lT9ZspnB6DX2nwgz2BQs5ajIR+vUkHqrPpltDIRxldct+5qvC/fWa1kIr3RQpUG2pPjgE4mhTUd1TsRPiY9IHOsSF1R7/LDz/xVca2DnmPNLOR/PsGQBu7ZS5bGPx5Q+FMwCRvM46KWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KHNHt8zNRIe7z5VD1igSC8zIXRgYLpZSbQGuUegYYo=;
 b=bHfkm/gGbBPzvY/DES/3hLLNvh74kpliGey9vH2AGgd5amslfat7eJBuTORroZD10iWy/fr7hWglPv9+k/RYzUv7LHmk1lnVgF0xchTNnHft5mxBbUvXu9jjvApBwKqUZu2RmYRX86osL3zuDsllp6z+P7K5HBnc+NXkqv7ImC0EVFM0c1rR0bZKy8fGwECeQJSHRfG93+PE2F/958H/ZSyl0bhoTKNclp+tMpe0lbjOZ7KOjdsdh8NSChzzhXL2wTm6jrAxauUM7EVUZI0zbGYnd6aQIIRNft6N5xSuRz9XNuZamZarHc0HAdw0ghGgTG2CqM0suE0jfGrt5tu8Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KHNHt8zNRIe7z5VD1igSC8zIXRgYLpZSbQGuUegYYo=;
 b=WTtghHfCsya4I0pYJgRt7TTdQ3h24tiCFIjGIV9aEVnMWd2bSHmXqq3xv7hq5SbuhwubndiQ4zepKVxPiEgr+e90DuvmtzwS7UBMNuUDBjHGczBAPyegt5Wy4f/zNzTlyM3uken9iBTvcyhXNodYafvTgpmgv8wdB50vDpfNGOQ=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by VI0PR08MB10846.eurprd08.prod.outlook.com (2603:10a6:800:211::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 10:58:58 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 10:58:58 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/5] libtasn1: Enable linker version script
 explicitly
Thread-Topic: [OE-core] [PATCH 1/5] libtasn1: Enable linker version script
 explicitly
Thread-Index: AQHdd2zS3GjB5K1SuE2uelJZ95vTJLc7/F0AgAAfn4CAAPq4AA==
Date: Tue, 24 Nov 2026 10:58:58 +0000
Message-ID: <A84750DE-9576-4A92-AA9D-2867D047A31D@arm.com>
References: <20261118145502.3243739-1-khem.raj@oss.qualcomm.com>
 <3A5D79A8-C1BD-46AC-A9CB-6ED307184E9E@arm.com>
 <CAMKF1srXNYjihezOZ9-wccQMehaaT894joHWncgO8tLFAxUpOg@mail.gmail.com>
In-Reply-To: <CAMKF1srXNYjihezOZ9-wccQMehaaT894joHWncgO8tLFAxUpOg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3901.200.71.1.16)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|VI0PR08MB10846:EE_|AMS1EPF0000008F:EE_|GV2PR08MB11491:EE_
X-MS-Office365-Filtering-Correlation-Id: 62023b3e-1955-424f-99b6-08df4a1a044f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|56012099006|261022105027099003|11063799006|261026140227099003|261028144727099003|4143699003|261026121527099003|38070700021|10067099003;
X-Microsoft-Antispam-Message-Info-Original: gLdlmy9OO2V1cHaK6LFxVeCwappAKPBhRItjuvrQmxQGT/3+2NlRU7+txmp0Of/RDRMBSv55tWnTyPY38RKPotKX6fpuJTXB+oD94ig5MFAbwJAaEFycE9a83rfVyFAdWB1+/zl3yfLXbecbgajbG2xas/P0JTeE0VrIeCW4V/mXiupjdlrndSpUZEzWrO/otsueBPU5EnT41pkAGAm5j3WS3bKNOEK+Gj8gk+kDbVL7pkNAKBaXAcSCUEIE7HVzl7eybddO58Vwl7rZfw+cd5PVWP7Jd9yRNcsocBALpqn32WM0e17DOBIDPmvplOfxFfp/z5NCbsie4V/mfe4H8+wqGhjKmrSA9XUIYjsrk2OpmPiENT10AZY2NUhDkOkxbvJmcKmXUhfsMczOKrMcHzdOIDLipepYN2KsK82uFjs/VPYnbfyjGkLs6LISWWc8giEo8cE0kMiE1Q50ONqiU1E2kLASG90kXwdn34Vaj9zz9K14F1iOwl1Slmk4kCLt32P3GebQCYxAjHHAyXEiD5GaBCXOf4HgElEHLFDKKqMMckVVJkGm9HLONnEa8uBB6SR+Y+qNNv8NRQ+pTjdu4jHBfgufL70d/gVQ/AsdeARfm8EKvx8LiuQB1fjV+zXtVTEG3ofrFxXbLsWJCxWxR0+2uPApJzlp9meLmMZinkFanCWNPhlnhQoVoFqxLOK7AVuV00eJ9ZiYIAnAdpPNimRdxrSdHr+P2oZjt9UyGBk=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(261022105027099003)(11063799006)(261026140227099003)(261028144727099003)(4143699003)(261026121527099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0CFE91F362FB2498EC3F54D152C91C6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KZ/f9QrpzLpnAXgQBYCURDlp4f+MfxX0A8lGB2NEB/wfKNVUxGJacDUgOg6+CuzGqn7QlpA5vlmzDQfb0090hc1+b7bdx6yFfgBs9MeO8TvOHomxj2qQe6bWtmEIhCymds/IavDaXCN/WWIl69d64KjKL/9E3tNCcfcx7Ld0MbiPffxnZyciMpRcCvY/RJu+7WbCv2cxPSuPC3rxewBP9E1pQMGh9fDfiEXstnGdK3mjWnEPKL4avk3tB0N14htS+pqeJl5IuoIhc3ZmRp9z8+vQAWsQrn/thJJQzEysbeNYD0Mi6OVcl3RXVV8yKfZuSC627U3USBpa7TvIkf5jBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10846
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f2c95069-2b69-46e2-64db-08df4a19f0ac
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|35042699022|36860700016|14060799003|23010399003|82310400026|10067099003|11063799006|261028144727099003|4143699003|56012099006|261022105027099003|261026140227099003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: IJ1hrYURKHR2O6Si4k44VG79Lhxy5FCfay/EUk7a9BjCk69zuLxBShDjjGQNB81beQrRqA/SZYDOdS7wGQdlYgK3/vPmwdMlBKc5iWbokj09T1a+Wbd6fsYY4KlZJE57chBAcT/4KsMZQhoWXhNmB9899b9EIPsZcSfTkSrEjsGJW9FOlsT6UGsbWti0Bq0NdgLoIxHwEgA/flzeWTf64+jZHw+SjHiuXFQ/GMKxgUkb2nMzUcEHKdohcnrOJZgEwMazPmwCwwq20BqpRjbOdp4U1cb72esfPWk0pFhzlDJe84IAhp2r6A4efL2Swn/A0snaikF949NbIJVFzbRH4iFdGgccWJla+0pvGkIw9I/eDLscS/Tc8if3Efqvzr06ZoVdIZPBO3Xn5gZ1iRhEeRp1N/fO5NGbKOpulVnQaXUD9THz+XYvafBQ+K5MiwzEteXNS8AEtV3MPDncn52LMryCHvQPWfAP70N1GZr0iU7A5wLwtQc8S574narqRK852LTxh2lxT0gvbc9Q35YHCjBu+u0RvQYtdWfgB7udjDSo6KJ/cMkXN071NwkBxoEeayAUnL301/jpMOmP+p+mIJuerPxl0NFrShyP+9aH6vTLYTokEDBuZW1T3y5H8fa1drsInN0PgXa9UG3LP0SZmbNLhV8kxUv+ZrQWk3yZr+djYSsjQy9+F1gZ50Xue1ulR5InnsfraKVWVXbiIoSP3g==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(36860700016)(14060799003)(23010399003)(82310400026)(10067099003)(11063799006)(261028144727099003)(4143699003)(56012099006)(261022105027099003)(261026140227099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cjhhIyhs7VAmDIYb8gpn7m8aBuvyzbYXGFst+fwSf076PQRzI8Nm94cqLOgofPuw/HOrJCt1jAFymYdauOzC4CkD2NS15h+TLI3Gao+l9fmOtnfOaScG3VZLL80dXw5I4zSO6gVzwqtJbQ3HJvTB/hfNuSSlOvE8yw12wLDV18ap8VSdq1uNAHLCV4jOQhK44LdhA2B7uU2DhmsOy0BGKaaykJryLfhx2cQW4Nz5lznwwiOWR6Ut1NxRHiohNKglQdT/hoWQ+iyoAwydUMaUByhP92ue3vElHO5argvi48JC7wo6EVtvQGAh7WJkg6h+urTQd2n0okcpsVjmVx1i1lw1to9SOo+cfZjj0xI5Xdwhx4CvymHZBN+CBU9rcBE9ori4m6bL1gzRNyjRZOSGu2IvXz3GUBBTJ+YVkctmuTnMV42Tv7g57wOvdsi5R14D
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 10:59:31.1397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62023b3e-1955-424f-99b6-08df4a1a044f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11491
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251020

T24gMjMgTm92IDIwMjYsIGF0IDIwOjAxLCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gT24gTW9uLCBOb3YgMjMsIDIwMjYgYXQgMTA6MDnigK9BTSBSb3NzIEJ1cnRvbiA8
Um9zcy5CdXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+IE9uIDE4IE5vdiAyMDI2LCBhdCAxNDo1NCwg
S2hlbSBSYWogdmlhIG9wZW5lbWJlZGRlZC1jb3JlIDxyYWoua2hlbT1nbWFpbC5jb21AbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gDQo+ID4gY29uZmlndXJlJ3MgbGlua2VyIHZl
cnNpb24gc2NyaXB0IGNoZWNrIGxpbmtzIGFuIGVtcHR5IHByb2dyYW0gd2l0aCBhDQo+ID4gc2Ny
aXB0IHRoYXQgYXNzaWducyB2ZXJzaW9ucyB0byBhbiB1bmRlZmluZWQgc3ltYm9sICdzeW0nLiBs
bGQgZGVmYXVsdHMgdG8NCj4gPiAtLW5vLXVuZGVmaW5lZC12ZXJzaW9uIGFuZCByZWplY3RzIGl0
LCBzbyB3aXRoIGxkLWlzLWxsZCBjb25maWd1cmUNCj4gPiBkZWNpZGVzIHZlcnNpb24gc2NyaXB0
cyBhcmUgdW5zdXBwb3J0ZWQgYW5kIHRoZSBsaWJyYXJ5IGlzIGJ1aWx0IHdpdGhvdXQNCj4gPiBh
bnkgc3ltYm9sIHZlcnNpb25zLCBzaWxlbnRseSBjaGFuZ2luZyBpdHMgQUJJLiBDb25zdW1lcnMg
bGlua2VkIGVhcmxpZXINCj4gPiBhZ2FpbnN0IHRoZSB2ZXJzaW9uZWQgbGlicmFyeSB0aGVuIGZh
aWwgZmlsZS1yZGVwcyBRQSwgZS5nLiBvcGVubGRhcDoNCj4gDQo+IFRoaXMgaXMgcGFydCBvZiBn
bnVsaWIsIHdvdWxkIHlvdSBiZSBhYmxlIHRvIGZpbGUgYSBidWcgd2l0aCB0aGVtPw0KPiANCj4g
WWVzLCBnb29kIGlkZWEuIEhvd2V2ZXIsIEkgd29uZGVyIGlmIHdlIHNob3VsZCBnYXRlIHRoaXMg
Y2hhbmdlIHRvIHJvdW5kIHRyaXAgdGhyb3VnaA0KPiBnbnVsaWIgdG8gZW5hYmxlIGxsZCBpbiBP
cGVuRW1iZWRkZWQuIEl0IGNhbiBiZSBkb25lIGluIHBhcmFsbGVsLg0KDQpUaGUgcGF0Y2hlcyBo
YXZlIGJlZW4gbWVyZ2VkLCBJ4oCZbSBjb25jZXJuZWQgYWJvdXQgdGhlaXIgc3ByZWFkIGFjcm9z
cyBtb3JlIGF1dG9jb25mLXVzaW5nIHJlY2lwZXMuDQoNClJvc3M=
