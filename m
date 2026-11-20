Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5584.1795180501618142653
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:15:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=upoa3dob;
 spf=pass (domain: est.tech, ip: 52.101.70.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUy7PPnCSrsjAuVcAFnJQkPWynmLYbz6QqWDdemqtTBevVH5OHG0etYhSB6I30MTHxSzQ5iI0f/5KpbmoEg5mctK19eSlLUHzu04szOhfnKlQFZKBzhtzNe1I4aN2rAr5dCLlcyhah810WAtBCdcdVV/3NPIA1tq68h3yJLTge10JWjWOr7MqGO2HgrnSIKNhddj6lDbinzajc+luYXiYYSps3c8mo0Ccx/3CDqsr/fyWOZ8izxa7QBvU3fmnuqgB3Ma86dTTOTe2bOJq4rfDwofeqQNqjsvxo97gE9gAMi0q6F7mS5c2hLaiGE74IkPl6xSMr5vsX+XxzRyvptreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zo0lpd5krFoLRpmFCQb04s3G6yTEFIK6NVaZGTxKu5A=;
 b=y/Q3h5AIaZ/Tzd5L+l48ZxcozrR6jPNBDAxPsqitLJzsvyNhLELXYkZooLK09fnIwaSp/xqqY6hf8VF5cq2LWGlN2dnmU6RMzTDKR9wi6IFarRbaCNhWSd4BSZm76p3c97y7QqXQeSnYrD1Z00noMTIXoOZGMSrjFteZv45eDIhoEgvP/rSRwBcEeHIxyGL6wRwjzap4M+GCAFD94X8ZvRwgcmQ++iYQNVObr9Ze62YgcsTIwCbmpDCGG1WAmSiGzBhQLRExgXsmxDcpBfE/+B4HDIfH67EMKTmY1jJBJBB1d3bo0q06ays+238ehiTOwIWoi3D81jMiiCogF3oCrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zo0lpd5krFoLRpmFCQb04s3G6yTEFIK6NVaZGTxKu5A=;
 b=upoa3dobWqZNOD9oFEaPk4+ui5+ADB5wyO4r5iFUsAorjYNFAlOu1O72KgNzMeUAohy/cG3NXqI1ZsDqlTfApFnUQu/v5HSw2jQeYswBxO7Jg9GRzvNlgWlsL45V1F4F7RfOnz0JT+VNCDp23G1wqyDKZX988q8qlmTgFLJryKpdwe+0RjxR+5UrJNzDJANaw2PFaYFrPqkSwudh/KvTR9jdktiSon1gU7dl4ho7tkM9CmYiJFR9bXY/t+z1q6VNjcoGTDd84OgV3gnjD5F2ljs8EuS6/kbqXYHM4qUl95J4QwnQwXHQWFjERpUwiOKw7kD+jIDFfE9gthAfENJDLA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI1P18901MB0815.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:12a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 13:15:01 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 13:15:01 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] libmicrohttpd: upgrade 1.0.10 -> 1.0.11
Date: Fri, 20 Nov 2026 14:14:53 +0100
Message-ID: <20261120131454.45936-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261120131454.45936-1-jaipaul.cheernam@est.tech>
References: <20261120131454.45936-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0089.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::22) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI1P18901MB0815:EE_
X-MS-Office365-Filtering-Correlation-Id: 334439f9-8a5b-4729-b1e5-08df4708486a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|18002099003|22082099003|11063799006|56012099006|261026140227099003|261102123227099003|261028144727099003|261022105027099003|261021123027099003|261009223027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: Qs/oD1vSDtqEJBwQkOD4477T7hbtY2cxxkVxDHNWRnlgPm/C+YVudETJqhaMyOR6GETN7e0PAcXHReWYbQ/tpWCazJDQNMQZDfyvRRfEv1S0IiMtJquHy5UBnmdT/8Oww6F+QwQN8m30alsohlIchNc2CuBjMPBMYtQOyLqD6kU24tnMzbG1jvmFS2yRQNaIZ4IIEAfiI2Vs8aKIx0Lub1EP7yKeudf5hw5wMS86MisUi/oIoN/bkYdNl+2yjA/4ibpZLfh6U80uU8IkMva02U6/EAn5FiZYDATvN1bhCM23LiQNxfEtcWWqrAqew2CWn/ZCRpL5kzXarMlG8Jehdg5xpGAzLLRzSht/2Hl2Fi3rk/uhbMxLGMiwcYI11D5aMEdUevAVyjbHJK4KqjDRyi33sDskkKKl5wYH7m6NJp8qEAk+Dif08b4bfpmHrO6YzQfBpIJWqVhkKUTVqBVu/VdhtPq7Se/ybQU1eMxXv2kNNMSo7SAvQa9/Lm80h9pFAzpK0OKbif3sV209gH/VfBHDmFMyAISDz+M+eZiMev61y4xcF6zpa2yneckb08+euqWQxclQk95mpD1Ghk/86kGPzFSVJ0VR4cE8uBms3iT5TSXUwlo1A04Y8gvPjC+CqryC6aThxUihOwnafFNnQYaXj8YCYyA5xxg05v4JSKg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(261026140227099003)(261102123227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261009223027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LIISh512bRIwKTbv36pz8SXv5CCJ6XjPU6WKQsSAtho3Wf+CzC03gLWnoVCH?=
 =?us-ascii?Q?OVJfBn5krmN+vlu7NwFFt/9J/sAPao0ndCYjFwg6a5YHBFzgYDNrFKYA6UE6?=
 =?us-ascii?Q?eP0SeTN9wDTKZfNPqK5cvPNAC4l6sDWU8plCATT1e9U2EAUrF5TJfHgqkDgw?=
 =?us-ascii?Q?WLrxc5fiNoPmvuE3UoE+oQ0/sWldPmqidlugytq9v072B/ibWHfcB9j4ewsp?=
 =?us-ascii?Q?VoQ0KndfxpkhPMhtqz2BdgoOP4AveBEmiO1rTcct9SeWw9xbVWSD+XXrVZD3?=
 =?us-ascii?Q?XLtQWCunSdDAzi17fnR725esc3NAgeqQSSRhgNJ/POfHPrZQbut8V4mrLE9s?=
 =?us-ascii?Q?BrLE2iIuKBGR9fCCjTurSWbJJJFt3GcfaB7PlwyFlWExosj9wfFUK/MWo6g+?=
 =?us-ascii?Q?kk5/xd2xYXYdqiobY8A7vRpy0eEQeHrMD7DHyqbiRWJqHhLb8/B8iwyfeD8/?=
 =?us-ascii?Q?fHKw2cncIX3ruGTaGImcCWcmg8Wm9YviJCskzWaEI7gke32A6IGW//oblfk4?=
 =?us-ascii?Q?OVWy8ndUY39bNMv+Bb4eXfJn4u6/79YCvMEk5T7DZEHECI4SNhMjBWAqCyTx?=
 =?us-ascii?Q?HToONIcMsxNN9gOWcY8G3s+W5gtZApyxD8yJ/xVOloJvNczyPfWVgQ/5ofEL?=
 =?us-ascii?Q?4PgdXBYj83ay9BR3qbRgkqPUToHq+0lkPtGDXGn/eWSVQiPXSw5ucOKwzrBL?=
 =?us-ascii?Q?zzGWebjb0Dt53sYaSRcwrTwiSJXUK6bZCY8MdvcJJMQqcjSqqOgUOhCHH0In?=
 =?us-ascii?Q?fLm2pK71Z5RybVTxBY5l9sRy1RdReq38ZrW81/CwfpzNVuQ6QpVjXc+iBSnf?=
 =?us-ascii?Q?Q6CYp7ESzdG/nOmgGf6PcmVBN8ajGKSszH3c8oGVwk/IIde3v00cX+3qmwb8?=
 =?us-ascii?Q?urvQvEqvuid3fC+Cy/9LDBMqP28nTMzXoCJQ6JwA3r6Sg7HypxY6DEpNx0RV?=
 =?us-ascii?Q?h5oTLv923DCSZIFzU80hIKQ8MBMygcQZYSTb/z/6F0rOVab9St7SZj0whWTg?=
 =?us-ascii?Q?4Jren/0LDFU+Ify5Y43g3nflsYdmWc29FZALiyqwlHFHx+i7PFgjBP9PIhnF?=
 =?us-ascii?Q?ijh5rD7/vYupOSd17EV6/+ozXTiBeTwGWDMmi6g1ZP8h+VVqGcK+iJbii0DC?=
 =?us-ascii?Q?OPeds8giTg6wHY56hPmwRpBHDCEbZ9BVUlVmE/Sj0+6mZErVlCzGcF+ZwnOx?=
 =?us-ascii?Q?wdSrCfelYYDzAqL4pUw3NxYpYhJyBMksqTs9m/6iioG5FgrjS20QJsSRZXu9?=
 =?us-ascii?Q?XNvfbip4UV2+UBQPjG/aehejJD37SqFM0XoGW8OIX+05qBji6l/jVVR41nPX?=
 =?us-ascii?Q?09kDOqlPYse4ERsfmVw/qGWLLkWBcWa1t9+6VRYKRgPS2TF+4smnnxQOQ3y/?=
 =?us-ascii?Q?f0EeKcIJ+0SF7535nR9LJ5/sHQZh5wUiHyPy+idPRolRStpfNn4F1rrj8N6B?=
 =?us-ascii?Q?ld7KnsJ+mUzO/hsXSslV5CCQ4fg9Ju8dZR96fKoZ3nC8hD8/ItAfAPwL4xP3?=
 =?us-ascii?Q?njHthc+VfQ7cAGRTGHOdgciGZCCiyIk3EzZNiNwyXnHj6oYWAJmSwCTWHdoo?=
 =?us-ascii?Q?/vhdQViA6pQRXdpYRHHUOwVR8R/zwO1BPAAEGyLGfv0zTaG5jIWh4EOhWi+l?=
 =?us-ascii?Q?IvVoIb6WczpxsXpIgNW5oUEBTjX69XUlFR61Ym9WAud01ZWPS4DW+0LwVedm?=
 =?us-ascii?Q?NzVlRQ6O3MiyszczRUkeFnJM02K+NHiKLyyTAHW3zEEVSoi7rP0nXdLmUmbv?=
 =?us-ascii?Q?Vjfy38pKqg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 334439f9-8a5b-4729-b1e5-08df4708486a
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 13:15:01.1608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofyyEgrk9ehO++khQnf3dT9amfrdCmKlK+kszHkFLJqCThTdfIqFefb6+O46i90CpfH35e8UpAI9zy9YnYi/q0K1Kfe29sLhJlB82gFMdr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0815
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250788
Content-Type: text/plain; charset="utf-8"

Thu Nov 19 11:50:38 PM CET 2026
    Fix hang until timeout when epoll() would return exactly
    a full batch of events. Optimize header parsing, resulting
    in non-trivial speed-up for request handling. Both
    issues reported and fixed by Ken Zangelin, thanks a lot!
    Releasing GNU libmicrohttpd 1.0.11. -CG

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{libmicrohttpd_1.0.10.bb =3D> libmicrohttpd_1.0.11.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_1.0.10.bb =3D> li=
bmicrohttpd_1.0.11.bb} (91%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb b/m=
eta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.11.bb
similarity index 91%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.11.bb
index aab3041280d..b20a0d4cb2b 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.11.bb
@@ -7,7 +7,7 @@ SECTION =3D "net"
 DEPENDS =3D "file"
=20
 SRC_URI =3D "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "04bfe8ef75db7d629a33de767599765cecadc56274a39822d5=
d081030d577685"
+SRC_URI[sha256sum] =3D "f227a044b75688e449b58ddedf0582255cc562899ff69f173a=
8ef76439744b4e"
=20
 inherit autotools lib_package pkgconfig gettext
=20
