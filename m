Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10325.1793617883382284427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 03:11:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YQfTCKEk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=57669e4cba=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29C6Dj906141
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Nov 2026 11:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=lekkMYUZo
	w+LExJhWahow2e7/XIIilNS4ykLCzs0qVA=; b=YQfTCKEkQwFslXBD5QAyBWQUa
	ZVpggw36eZTvTt1U3mFD1AJMKmvrBIctSlQuKU+7NOCGcerjVTZADieWsKzGZfUM
	Qe4lJuNZOPRPn6HqlS6jcO7Y/gTRXv+hSS4O+gZnyufFYk+jhEPnq4x/NHC+DdJC
	LMZi0rLbtpFaNF6Q+nSWxvtOOsGOuoP8iV8kDVOg3r8G1ETal3kq93f8VMOm2vhp
	SKJghgxiS9ClKDtV83BHbjPbpkSJ6KAwiOPdlhnzPx4XP4c3gXz4lADHmSKdcXeK
	Eu+PDeRY1qMK7eyxPHtpTMIlChAGHHE0PK9OTos111auklAelfo/iSGqUANww==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022077.outbound.protection.outlook.com [52.101.53.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hn5hxte7e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 11:11:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9vt9so3QCKiYbqDPLryOt+2AJ0dJxduHeWD2a9l+EOFBF4Y3UuiZZ3J+odoF+CYO4p2amK+bj9ONr8DNu8UZABDACTE00XydwrXfippxzbkj37vwUtJA5dBy+ArBIzukt5RZn+BeWg3ieu9u1P09uIptJVlECK+Abj6voDBvQpI4ecKs2NKcxYq4H1FCcNFkJrGD7aFbIl07Saa/jmzXZFPwo9j6V6PgyBgYnJW+LUlPTcyzyCeQdoxR7xGwqN0GalXlgISEY85BsP77lAGRIjwh1punvlPbkM0MQp7tLvaf1UVUwAOT7Oy/f3JHnW9O9sPlEBjBnds7PjElyfXfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lekkMYUZow+LExJhWahow2e7/XIIilNS4ykLCzs0qVA=;
 b=CFYKRezFBEbkElZP3hxx4HCoCeBftBVGrrmeeN9wEBeFObNQ4r7lXZtjJmYmqnXlefy2lOrBeihJARorMg55Yc1UzeltyqL9Gc4dUmXAFtwBm4sVzbK7XkqYwDKFMEqSwMXd7iI6I7dL+/l994drVZ8svZKFwzT7NRHg39QajVmR5IvxV5vz/9GKNN1rsUH51oboFVmcwYofBfNLbrI8LdEVZMHkBalO12Y8sE8TakPtDGOBA+PymwEAzKhNYWGO24ADPR1W3K0dCnrDuZEtqtKPN4AqDv3QReQURXaZC1h4FrqjXBZ43KkRB+KLAy1GnT5l2I4eZeefClP45mDE8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from CH3SPRMB0031.namprd11.prod.outlook.com (2603:10b6:610:14d::10)
 by DS6PR11MB478278.namprd11.prod.outlook.com (2603:10b6:8:4f7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 11:11:18 +0000
Received: from CH3SPRMB0031.namprd11.prod.outlook.com
 ([fe80::edd3:84b0:a509:60df]) by CH3SPRMB0031.namprd11.prod.outlook.com
 ([fe80::edd3:84b0:a509:60df%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 11:11:18 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Sunilkumar.Dora@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH] clang/llvm: Upgrade to 23.1.4 release
Date: Mon,  2 Nov 2026 03:10:46 -0800
Message-ID: <20261102111046.3459346-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To CH3SPRMB0031.namprd11.prod.outlook.com
 (2603:10b6:610:14d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3SPRMB0031:EE_|DS6PR11MB478278:EE_
X-MS-Office365-Filtering-Correlation-Id: dff9ec84-2b6d-42b8-3ddb-08df38d20472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|52116014|1800799024|6133799003|10067099003|18002099003|56012099006|261021123027099003|11063799006|261021121427099003|261022105027099003|261026121527099003|261026140227099003|261009221727099003|261009223327099003|261009221227099003|261009220027099003|261009223027099003|261028144727099003|38350700014|260925021911599003|260925022911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XfZZBPcErYcXcbe5RCVuNC9EmOVqU+pOlMvKpHOrNM28q2xl5s0ldO2MB+3G?=
 =?us-ascii?Q?slsMabjWYGqwntiHCwZtXyw8mNd4k6uPnRXm+UxMOz0dR5KUVLa+g9Qy06fx?=
 =?us-ascii?Q?eLEC8VpHQPnSpe/6kQBvMXZa3fv2Cj+SVYYGlnBsTrOp4GG22USBxlQeqHao?=
 =?us-ascii?Q?HwcdLvYCesqYMfA5p9ebrV2C0a0Nuohuc4vRpiLenZHPgRYKBw0GXdQKNFyB?=
 =?us-ascii?Q?/1121Nu9UpEMkoApsGDJmT+W3/I6gv6q5BHJs/G7ew+bA7DdzgUyVZxGnwxq?=
 =?us-ascii?Q?Wx8DaAMXsdHYagxyQ8ygnuRNIlrSrXyPVNg8j3MnvdpoFhlOA8UPL6kJ8OM3?=
 =?us-ascii?Q?dRQnP0f7AsUgaGjBKWemPih2Y2mNFHBWUPPzoj7rl1sdXwD1dL/2xa9G3biS?=
 =?us-ascii?Q?kRxPq1fOFq7tWJ2itF+aanAA+njjYO0j8bEORtiow0DtKD4QKm60h2qB0i7/?=
 =?us-ascii?Q?gLieASk3qR6UflcIe6Z7273fjw0GL0Oe4c9HFQSIyLIopfrOn9BNo+qpQowT?=
 =?us-ascii?Q?QIfVLxxS/hCnl5gDzgGIl8eEuAgxyY6ADBbzbc/8yJo5GoqH8oAb3OCnPZOu?=
 =?us-ascii?Q?/gujvmkLFoflBNypd6npS8mjoafQpFm3xuRlVIduDmmFx+oqvgEq71UtV0JI?=
 =?us-ascii?Q?jOy/FN+qDRvumGaBQeZmzcCKpyMJ6pWDgZ30oTUMtv8JTwxa83WSucV1rryq?=
 =?us-ascii?Q?9JX2uFIxPMBaMjp62IeuudJczATatAYjvFhPF/kWrqYZWK3da9Koubo323Q0?=
 =?us-ascii?Q?KU6EwTqkCJ3M5Lo+FwCqqbW5uVxdKJ8SD0waGKbZBYYrhXOpihK48oSZNsVa?=
 =?us-ascii?Q?e+rtQVxvH9fyUfeXnEpI7C5BS1BetTvEtRh8SbixVF7nXU2yMCPu3GPsH9I2?=
 =?us-ascii?Q?OS8MPS6F7IM9rCCKhrc905wPuZ5JSyqjJVZNuhwtAeURjrAsIF09+EVrcyBx?=
 =?us-ascii?Q?FZ1Nt0aKSsrPvGYXfNy+aFP36SXRRcGXvVahnM82yAEBa9kqbUlI6d8WoHcs?=
 =?us-ascii?Q?9VK3mbM2mkkYmw8eyeK+w57ztrl8Rjq7m6qCYc8ZVPcDXM5R9IIQGgI56B5I?=
 =?us-ascii?Q?387tavysLklCI8UMMh3hvzThl/39XzenhrOnpmAJsBuxKl//yh6D5ptOATi7?=
 =?us-ascii?Q?/9CzHo+SSmTlnwR5zNFADbLCH06ANqb8PQcqdySn912DbEXaAEJXPancyVKv?=
 =?us-ascii?Q?p+AbtHbFgL0Lm1zmf6LHvJOFCywPtHbHjM8aXuRMu9xiesyl4VCgsB1y23lF?=
 =?us-ascii?Q?pcKrSpTsPxPLHhgfMS9q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3SPRMB0031.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(52116014)(1800799024)(6133799003)(10067099003)(18002099003)(56012099006)(261021123027099003)(11063799006)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(261009221727099003)(261009223327099003)(261009221227099003)(261009220027099003)(261009223027099003)(261028144727099003)(38350700014)(260925021911599003)(260925022911599003)(260925021311599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7OHohjuuXlySSbiv0SeAgnbw8cZc4yF9cgthjckhjSeFINI0Xd6Eqf7NDaNh?=
 =?us-ascii?Q?Oq7011oLW8luuSsSwu9Z+mwd8ISY70HEs/I7iBWNUPhZ3hI7m7KK3TctHIxE?=
 =?us-ascii?Q?FFV+sN97HeRe9mLpsyOKVCXqzf7J5KTrmlGtGHGKpnck2pArsc4oXLBH4vrD?=
 =?us-ascii?Q?ncw/6OEUa5w/wG6R8OOYM0XM3OuR0XSwXGwaQQ8sxOGzj7xic2ROqOaunXrB?=
 =?us-ascii?Q?nW4WMaYhe4WjlggaZdK3jQDttKw2e5yJB+rkwJtThzG4tarAKNsaWQ9GoEdA?=
 =?us-ascii?Q?JGsJrGmnhi3bgbCpYTeXX6BCTGJNmBkuOLufQRadCxHIEp2LkYbeNHY6hxi6?=
 =?us-ascii?Q?29Diq1gVyIEM5MmH3w1wSEz9pi2lOO2L6aDFpNJtglIEPPy0oW1/DU/fWjEK?=
 =?us-ascii?Q?xPlQ++oaay+732B0GWt6sTao8LtyLkSjWjL8S6DV5Tiot4I4VQHjjgXhVmIM?=
 =?us-ascii?Q?sgJrxaBU8gT5+9yPTvfClqdCWRKEEIkuDRZ5cvECigFfajdC7cuJRdPpBVhw?=
 =?us-ascii?Q?pjRaeBlYgb++Jh9zktDb9Bm3v+06lC61ylq30yq5Nunsu2lSTUnpHNMto2MA?=
 =?us-ascii?Q?5kyUa0dEH1n/oo+t2YGDjDneXKpgXqPaH00v+Snyqmnnd7CSbJbNCFxhJMqo?=
 =?us-ascii?Q?pOBRYzsawnG8z/80/pG0qMYGCTqv0MBMQhova3xXLdSgK1+E7f33FW7WaAoj?=
 =?us-ascii?Q?TStBJfJd4jddLD1jokpM2AFaofea4bqG2tiqq3n7bEb5nCReM74x2ly1D3Wt?=
 =?us-ascii?Q?+VlGRh/+gDmwFbvhQ/+U3gyY1Z6q/I83rgwqRrH/x3D0BApEHJcH5zNz5rx7?=
 =?us-ascii?Q?GU0Aqnhht+3JwXEPW72XXJLkG8ZpUrZ6SjyUf9Jl7cpZ1TTYg0Klj/HXL0mp?=
 =?us-ascii?Q?5JSdNBM2Io/U6/7FVVi/cGxMGiWrQjzRsGKyK6fcD8/42ndG6RgHfktfSscN?=
 =?us-ascii?Q?BkOwCWrTGGYSDbAPbyqKAcXtRP+yrP17GqPpp9EIRe8c3v0NSQANtg18QP5y?=
 =?us-ascii?Q?+mMFFXyCXetTnN09PFVNwqw4hJlTw7XdprCCj0B/G5s7SH7LLbujnbn3YhFM?=
 =?us-ascii?Q?qFsmpE5olqMuO7B+1sI8cC/UUkdErQXyMfHPCAhyreOd/cWT5HpSQWC6r2CW?=
 =?us-ascii?Q?5HmFsV4objGZIUvJF3lIoH9KHZk4yhWK9fukIvxylwEMctQkzESCFM9ma+5m?=
 =?us-ascii?Q?xNH2BUsXtV8F2Wp/g0k3U7rA67VQ9Q1g/qCPl2Div5OuUdxm4xZitC5yZEOa?=
 =?us-ascii?Q?zGxeVEm3GLksJfgRAVIunz0Og7cNvRXbKx600b2vD07bgHrj7uHCR4UzOt8C?=
 =?us-ascii?Q?3wkyDfcv72+SXqoqKBC86VK0UiNTYhZNKokoVme2/g8uuP/s0O0gPM9MZB0G?=
 =?us-ascii?Q?4iVRci6Gx0MDacu8ZoHypFvE1sSCdfYFVooyzoKL2HOyqRIj3n0A8cjWbSZc?=
 =?us-ascii?Q?uvFihTZa+1LfI2xdMXeblQxveOVG8PQtVwn1vz1+s09A3K7pMbrQjSe6DwD9?=
 =?us-ascii?Q?HuCzZG2ShDPqHvv7QZ2tDNffcnA1OxJlWm3JSLls62DkfDZa6DFPYz9n5b/Z?=
 =?us-ascii?Q?EmO/iAF6a0gjEQVBE+7q/m0ii1aOPX/IiBXCvT7oAD0k0pwIGj0geBfQ6bVi?=
 =?us-ascii?Q?9bpHsRUVTjpg8SDcExWJM4ROma7EZxgdaaCTZX3ul8Uy41TeGY6qDId42RTG?=
 =?us-ascii?Q?1m9TtMLbeu7KlDZ4Gqmsf828ER5+gjx6Tf/z/gZO7tLP6uWLWPgoVj7npZw6?=
 =?us-ascii?Q?dFrmdr85lGojKsTEIlCLjmwS5nXTQ6vg3LuVDKD94HeDN2zFyw8l?=
X-Exchange-RoutingPolicyChecked: as5uTUKo3tgkSWn1B2/TPpSQOnGKp+b8upcOR6hqsW6W7uTyR+qDsaGe80Qiam/x45Oa/zXSYL0TYlNqDSxAP2Dt4sMOXCJpk3Ra8ATAHWOnmteRSyvJHYgnTM6M3G4UAqPKYNoa9q8YoEEgaSMmb2Hg2YCbBY6xdvJkEDF/bPZ9hSeD8Rb7bUsgb4QdgSvZwK2YWJ1hVIPcVZQqM9lKX7W/6VaHHLUPKigztbUC14cumsy8wS2u94qnS7qAxA1PSdJtyFfpVclJ2Ir7eANohzA/8ANUapuh3vJsxjv0U4tjaiu3SBLNgGTnZrzCQ2GpWvK67msnMvvo7LNPgzLssQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff9ec84-2b6d-42b8-3ddb-08df38d20472
X-MS-Exchange-CrossTenant-AuthSource: CH3SPRMB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 11:11:18.0704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uu47sO6o9ywuNg+20E0fZBxlKwOewdBv6nqpMWhWbfqwp04z3/8D9sUMDV0gEFmtdJooTTV4ZUrNwXVRshjiA+UhW6N9VY4m3/+IvX7qLygJ4tZI3x1XJCsnXV/drbHz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB478278
X-Authority-Analysis: v=2.4 cv=dvJOmFg4 c=1 sm=1 tr=0 ts=6ae86fd9 cx=c_pps
 a=xYKeb6kGun7gsC6lRUWGfA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Twlkf-z8AAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8
 a=uQhxRmtaBA7T0oC8DsgA:9 a=-74SuR6ZdpOK_LpdRCUo:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: vJCCIb17X4NBiSRsn_0f1Se0270wNF-J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX/A6ot6S5LmFu
 GdqMxjgLeosY762Vo028JE13TMN4sEdMZLDCDmzXvx6zqgxBCWXF+QFMOlCQQg5QJXJKfLX8Jzr
 gOWIKWzeVzNO/PkjEr3PV3PsjugJrnn/yZCn59DPY9zxVebonMb0
X-Proofpoint-ORIG-GUID: vJCCIb17X4NBiSRsn_0f1Se0270wNF-J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX28awqYrRFoSQ
 XrnrTB58oxr0j8G0zuhid17q56xlOTyB3UUxo89tKD2nrCa2NltDnxal0WKSKrPyjlHJ2dOrdPo
 BK/6mjEcMBqjzNkGY/lukoPnUI9dSsQa3kyYekxsDYSgIS5FoPHfafc1kuzzPBSMK3VGq/bSljR
 aADEDFKh1v9oczVse2zNfN5ir62pgcdV3uYHzv7zGJb1xvIwsju4AkxkKlRKFPRILI63ZvbAwZH
 Q4m1Ea54O6tCYN8vemaxUWihBODGgYBWQuOYQjm8EBRTXal0bVXv5UgUiZqk8uylGqVnIPzOuNo
 9P0XhJAX2ujbuguNbj4zoo9VOdbtT3Qwvk6JV5UWZH6jlIsht+pjQ6F+1kdJ76NHrAjEqBIC+Ja
 hwRkeb0BCN4lg1w27pv2SJZbqvlwWtJveVhm9gUmWuEl+XWce6II5sHRIIoZ6NvoF5JYCjQJyVQ
 cPeYpZxBG9Quj86eXjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 11:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249203
Content-Type: text/plain; charset="utf-8"

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

https://discourse.llvm.org/t/llvm-23-1-4-released/92564

Brings following fixes:
7a941dfb2877 github-upload-release: Update script to work with draft releases (#229909)
4635269e3782 [X86] Fix constant vector i64 signed div/rem on 32-bit targets (#229244)
524ac171cd43 [GlobalISel] Drop nuw/nsw/disjoint when widening a result with G_ANYEXT (#218558)
fdf44b31a63e [InstCombine] Drop poison-generating annotations forming min/max for clamp (#231537)
d5f50fc559a2 [Mips] Fix symbol names for private functions in relocation hints (#230572)
52e90e1917a4 [Mips] Lower calls to private functions the same way as internal functions (#229975)
d5ff1316673e [clang][bytecode] disable tail calls on mips (#229679)
41042adf8339 [ARM] Fix miscompile in MAC for 64b values (#231702)
6c859967be70 [SPARC] Lower dynamic v2i32 vector extracts on 32-bit SPARC (#222348)
71c76755a8ff [ELF] Move layout-changing transforms before address assignment (#232189)
d946f7b2b214 [PowerPC] Don't let optimizeCompareInstr define CR0 while it is still live (#220999)
a5eac6566485 [Clang][counted_by] Load the count through unions by byte offset (#228309)
beb6b7dfae46 [X86] Don't treat vectors with elements wider than 64 bits as immediate-shiftable (#228840)
0cd28174a1f6 [SimplifyLibCalls] Fix ConstantInt construction based on char (#231159)
d66309da4d8d [SCEV] Add missing scPtrToAddr to getCastExpr. (#211899)
94ae4f86b8f3 [Passes] Run MergeICmps/ExpandMemCmps in LTO post-link pipeline (#230562)
7909311aa6f3 [Mips] Remove experimental warning bits in a few places (#223230)
1be9d5eb62e0 [llvm-objcopy][COFF] Keep COMDAT section definition symbols when stripping (#228783)
8451016186f2 release/23.x: [llvm-ar][GOFF] Implement symbol attributes for GOFF archives (#214528)
1b843902f5b4 Change release notes wording
ca0b6a823a5b workflows/release-binaries: Improve Windows installer (#220414)
5177329b802a [Windows] Export Registry<T> members and accessors for plugins again (#221296)
bb46d66418b9 [X86] Don't double count the interrupt stack alignment push in StackSize (#224029)
15d373104a6e [GlobalsAA] Handle self-referencing stores in `AnalyzeUsesOfPointer` (#213631)
705f593fb506 [AArch64] Restore always-inline behaviour for incompatible SME attributes.
bbbf266c78bf pre-commit test
195209c5c105 [SanitizerCoverage] Don't create comdat for unnamed functions (#228959)
3dadaf417121 [PGO] Fix PGO instrumentation for selects with poison condition (#229002)
370eb8ddac24 [Mips][FastISel] Also add low part when materializing private functions (#229717)
d7cdb9b24351 [SelectionDAG] Do not flag undef bitcast lanes as known zero
13d7a167327c [CAS] Close the stderr temp file of the out-of-process validator (#226844)
affff9cc58ab [llvm][Support] Use ::closesocket for native sockets on Windows (#226613)
8e044a8f3ada [NVPTX] Set default value of nvptx-allow-ftz-atomics to true (#206154)

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 74db3e44e9..f914214115 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -484,7 +484,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.co
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-23.1.3 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-23.1.4 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index cf93fd0f62..421df9b5b6 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "23"
 MINOR_VER = "1"
-PATCH_VER = "3"
+PATCH_VER = "4"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index d1b784b450..541c53edc3 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "c44186a7762ed28954be72e5ff6df9808e0779d4f1bf014ecc4e7e211d31ee34"
+SRC_URI[sha256sum] = "819ecf7351f1a66f76b2d701d8942faaf5faeb324cb90c9d5b090de142434bb2"
 
 SRC_URI = "\
     ${BASEURI} \
-- 
2.51.0

