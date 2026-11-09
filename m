Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1368.1794247650443819078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 10:07:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bgxkJk+M;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bgxkJk+M;
 spf=pass (domain: arm.com, ip: 52.101.70.11, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=s09F9N+jDKjSyIIxW1ZsaZ8LEqkTuVPj0GiKUlY5mzntY/VLzgn63hYaUbNcP5CTtWnf9moHBxCCNepNx0uPaJuxkXCruw27sB2iK+/5kc9XI1mZ9A7dgCp4LGiAZCxb9SNMpWwLsqUvreFaDDWlZp2rJuYVwMH/Mq3ybnEfOd3dBzaA7M9EPS+tnqhISy6ptRJ66rhwzdlExTovr7uC7cGCGZxdhtklsgVWK/84ClJG9Tib7P9W9yGz3UZXrv4egQKp0C1+kqW6G3rq1/UusRgaLZPjTD4GW+vE1zuZNqravkZKiGppNvjXLTonK/4yJU7aX97Q4ZYOD4hvDm4fRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjPgF1Iec/PsUMDXQw0uW3TsqMjuAmcX/uTiJ5fE5YA=;
 b=pEWpvwV/n8Ul3tj/Q4j/uvfhDpkCPK/GvFU4kC/p11Y1bR/C/QQF+60mo9vzD6K55D48F9voRkOcR0zu6KA8rqJSSEWwVyrhk+zaej0czU5r7QT9ERlWmYgKp6Qavpu9FbJJsKw/MhMxH9SDhgng0nbkrzppEBnRmPazkO7z06sME0ED+APuT5StWV6OETsr6fS3YqJmOdrR0/vp3AeF5KkOZprAqY5oj+0lMwOYOx+NCSrt6kbh65ubECcG1rRdTxz4ZqRLGyM5tYiZ4zujDRlsE5QyV7zQxRbD6WkzBpYS6MKQN7Sd0Y0514TxgZSuoaMXwd8/cLs2kugymfcYcA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjPgF1Iec/PsUMDXQw0uW3TsqMjuAmcX/uTiJ5fE5YA=;
 b=bgxkJk+M3hSex7KaD35oGydXpRC8lbahKjp/ncGhILX+XWXVA7LD3QeFE4xSfVTMfJ2aoYw67Ib+Ol9wU3m/PZPgZVlDUjL5A145M4lAFmdrKd5qf0BGmU3zKGT0hJG1awfCYqTgStvNsFVpiF21CfC6entpBpUw2yqG2orn/Ac=
Received: from PR1P264CA0199.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:34d::18)
 by MMZPR08MB788669.eurprd08.prod.outlook.com (2603:10a6:190:37::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 18:07:24 +0000
Received: from MI3PEPF00008481.eurprd02.prod.outlook.com
 (2603:10a6:102:34d:cafe::3) by PR1P264CA0199.outlook.office365.com
 (2603:10a6:102:34d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 18:07:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008481.mail.protection.outlook.com (10.167.240.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 18:07:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUwVa46zKlLEOXKTsB3zOkYwv826QWDK4Pi/rho72do7kLsJF9QgXXZSVO8fcpblz68+2t0jilGzgyzRm2p6ydMQo7jTnCFVsU3QGP8sevECGYFN/xPEul3VvXiPtW0IgU5YQHKV0idD7YIYKhmWmMAesNgszxmxOXBhiqFPuCtdXtzA/84TUvv+yi6qnUu5F4h+RUQU/XZZonP4UD9PmN+9wAuy6mt8tyIHwwHiAb165XFs5dYOfz6ZEdHQhLFjzIW1P/Pdp+kH7OEQl5Ue/zUpJ0Xcp21mFbBMrKAPge8kcf/TW1PEeZRqaYKymf2RTdQozbX2lwWe6QQY7B1oiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjPgF1Iec/PsUMDXQw0uW3TsqMjuAmcX/uTiJ5fE5YA=;
 b=LRdpymsdKUzuJwafsM0RcQOIw7kedRNZVov0QnYMPRz7ssGlnN9RPlt/UK3OVe38HrfJ2+D7FUCGO8ND16Pd3z4/2/IrTeV9qHCcgNB4CJKLO2P/aAXTB7vG9tFbG5Tje9jnxO5ht5vnzX/S8fIftAOA1fvaKQuSv1+1Zaur6RIVR2nk+G9H/11EvGcfOJOR1AibYx+Q7QLnzZ5QJh0agmdWITOaG3/DHdouYBEITi6S8CTdG91RvNwZNzDwxEI1ZlFctWjplk9MBHamK1AMk/ZfvMkFUrWMJOo5PwXpd94OXlfHjrbHIuCFwf1U95XqbdllZECr/zKPizqDYpqdhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjPgF1Iec/PsUMDXQw0uW3TsqMjuAmcX/uTiJ5fE5YA=;
 b=bgxkJk+M3hSex7KaD35oGydXpRC8lbahKjp/ncGhILX+XWXVA7LD3QeFE4xSfVTMfJ2aoYw67Ib+Ol9wU3m/PZPgZVlDUjL5A145M4lAFmdrKd5qf0BGmU3zKGT0hJG1awfCYqTgStvNsFVpiF21CfC6entpBpUw2yqG2orn/Ac=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by VI0PR08MB10425.eurprd08.prod.outlook.com (2603:10a6:800:20e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 18:06:50 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Mon, 9 Nov 2026
 18:06:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] popt: patch CVE-2026-18839
Thread-Topic: [OE-core] [PATCH 1/2] popt: patch CVE-2026-18839
Thread-Index: AQHdb7/sdbmTkEZZEU2QZfG/bJinN7cmCqKA
Date: Mon, 9 Nov 2026 18:06:49 +0000
Message-ID: <70F205DF-CF63-4B50-9D06-38651703F4CD@arm.com>
References: <20261108202855.2743590-1-peter.marko@siemens.com>
In-Reply-To: <20261108202855.2743590-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.4)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|VI0PR08MB10425:EE_|MI3PEPF00008481:EE_|MMZPR08MB788669:EE_
X-MS-Office365-Filtering-Correlation-Id: 082af40b-1ea5-4278-56c7-08df3e8c4dd6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|38070700021|11063799006|261021121427099003|261009223027099003|56012099006|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info-Original: qKTLuVQflc2knIifA7tNGJb6rnP7mu0u2qMoRaD9Jcmtp/qIjLzyhHbBy2XuDBy50W8be6d/XWMx89SZN4CJjrmy44hZGyRDFPbLj45rNAecgCNFOF3MzaJKHTJg7DeeKuESiNgqhPqg+IpVkAFjE6zeYhn7tsn+d6E8DrqRmOleZVRAsBSAvYpPRdGktyxm1kUupa/hfO146hbsMt9g+TULVhpe+ofq1S2GJjVentyp0zKBfrKFw12r/CYqcMBvT8mIQ7hNqUWfjiyl91InG/iIACBDFXeb4zcFr6vphPlwZS0zDFMZEbjopB7oPY8MvuJMCmW3Sd80qeet/1/o8mP876491nC74HFTNl5UFUndMRu6wkZp6G0ltlnJAQPfS942RMVoa/erf+T8cnXHjnLOMYJXlWkMX1VnC3xrbN31zHPJU8uzGc9j3jS1uG1PA31GhHjAS5u9+cl8zxdJnlCbZxgXWbm33wNd/sTODOvkc9ALH+gutRFWSmwwj0rnWYDnMC3e5RCgNHn3kuMqZHkO+FLhBZ/ers50AlD0DaxW5ABRqDFdJZxckIIyWcxDbGT6/EsfNmYMB96FjyPNJQ/c4IHelIkJHJJAKOqzn2/9Cgayr51xuHf+OkxlsuQ+Eqmt/9LFHqVyLyu7rBVFY7qIFyZE2i7R62ilAZBPEbfa1kL3X6LEfg0GdMUqY2OBut+6DiKazx1/IbiNescrM21hy7e4BNvyDMZ2kBPr3OA=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(11063799006)(261021121427099003)(261009223027099003)(56012099006)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A8F568233A99DD4BB570C40689B8FE61@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hiGabVFrI9RSl0pXcjWg8z9A2jVk/QHEbPniAkYSMd8aTl4BXabE7jZ5S02RnG/bXijr9XkRHq2lWXMdPowXBJzo5GeGuMys/lJXA0m2qTUpEWGuM/Mlbg7wegLe6hXvWmDcw22PENuAmB6Lic1H/Jd16OwXI2wQIPX9Wu0tnPEW8y9sSnHr+tLBDi9zC+ctGxygWxEzsqrr7E8VqNLQxkCVFnRJRrJAnwneWIx6CvdlL+t9j/Pc9RO4Ux4cWLwyeSkVq/Vv/Wr+rG7tUDNQzrdYCtm64vnZiVx3iQ7sS/h/GDWKPjahfNE3MtjDKxRUKZR+pk8cSvCuAHWwWggyBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10425
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: MI3PEPF00008481.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: eb774e24-c3b6-4d48-2c3c-08df3e8c3a03
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|35042699022|36860700016|23010399003|14060799003|376014|18002099003|22082099003|6133799003|10067099003|261009223027099003|11063799006|56012099006|261102123227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: FsSV6YWeyRVIbqpom+joPNS4Uq6YfWY264+xtpWD4MZUCHSCSC0NvVdbz5r6gmxANSg5HQzgmhfasOkIwbqMQK5Mc4yPRkavqeiDM44alRnY78wtS3ciNscRwCU31BpT4VtutxZiHLIWtApfiPSZH0CDqqf38KxjTpba4QIybJOLHmInAGrDMS1/7nqF0CMJRD+JrH1Y3JnDSfOIpi7WTl+3f8Q0bL2WaXcsHG9IMaHxCqBF+Gg3x4z6qIsC+Af/S/WBfIcohWP1akDaRt8gneHYS8dXXgo9ZjGncPMx4RsV9ygYGPqrfaYEkdaCBBHtbvnQgfoL1nL3gV/6k66HhnWaVJwz7cNfFHJdrMKUJELJdhEaH5qoQZ/J4Ti9GnKjLb2PpokPdGE87d68YP96LfXzO91AgcstI35ieOc/QTX9x5OlZif4f4tl6FOm9HYJWfTFX0cNziZYK4jW1a0Luw7OmZkoRXbfwkIfkRw1Oe+R5tQiQpVJwGl2nXieeIf+eym4y9vCIFjyy2A8TIZ/f4NAH3shkkkAmnt9iQ5oqAC3p6E3m5Ydd+Zc0kRf/P0RlDfAiCtRxRcaObguHJMnZ7xWXVDTXKp49aGmgo1z9xxGHxx7xXMP0fIRRNz0geanhYqqd6H4KXfLRsln2cCg7fayah1yrK7riXqxmz5D85Ioq6+H3bQRKz0JV/R9PQn7qr7tl0nHyOdSi77FIYmpuw==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(36860700016)(23010399003)(14060799003)(376014)(18002099003)(22082099003)(6133799003)(10067099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xfSJSaSqJww0KmKhBkle6US5Wq4KaNP/jQ52dTJ26tCsNgbaD7fFKDEf1xCT1JhhhR5lUWSs5D0xwP4FsGWmkk6NEtx5Yoch8eBYlxYilkdXJfRVpFbYpLnADwURlQR5baFPTPD1B2iui4skRyEKv2o6s6X+gZNFooXBzGl+pMiIeViCxBOCr7lilHexLH/HkkmUEc6RniB8qcGZfamDn7gCO2hYkrQhT/nUfHv4dSMMGwgRzURPvmRBZSnBErOzVCTlcqAAdeo6q1QsWWg/2B3MxVFrTAOSPdjDkZEqqHUAhaPuWZhJwcQOU5lsyXohcmUSXZTyQrEkWrRyaU+K8fr0v1AX5LE7yXj9gXfFVzVjMNd23Z3ygt7SAIkcqARxKNtiMackKg5CIER29GDC/JlPnrxtT0CWKvgsPIIOFquRV5l5fqmKvihEs39nTcF+
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 18:07:23.0453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 082af40b-1ea5-4278-56c7-08df3e8c4dd6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008481.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR08MB788669
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 18:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249863

On 8 Nov 2026, at 20:28, Peter Marko via openembedded-core <peter.marko=3Ds=
iemens.com@lists.openembedded.org> wrote:
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Pick commits from PR [1] referencing this CVE.
> Modify the patch by converting cmake change to autotools.

Note that the patches have been backported to a -1.19.x branch:

https://github.com/rpm-software-management/popt/commit/f9771bcd15073c2835cb=
e06a5d65bcbf612675d8

Ross=
