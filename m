Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8449.1793269413219990545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 03:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=X9m+4iw6;
 spf=pass (domain: est.tech, ip: 40.107.159.31, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWZ7d0b0rtxq0EjEZcLJwtTk3+LE9KcMznxjlQxFVwRFzGpYbvLTRKb7xbtrTFks+ALREqX5D1gXCo32taF6hfyuVRSsuECaawrRUcnysgC8D+jxzEGbaj9QH9nMLNEp7wg0aoMDYlaO5HDT92wBTEa7lfOlQDU8ZdYyK8/rYHhH7XJr7Bl7BveQgrHh+/rEUowTnpns15dd+/QbXbNs8yjkZY4/QVI5y3FCCGPMqpfqH5D1IjWHaUkLpd07LZILaVNU0JHEe+FtGHMazfdnleehbVsCSWDT7yELc+X+vhDtFDYbFgIos0nc/6PhFS/pF6xUPPDRkwc5w0//pulhbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/ZDqLIIVHEDuwmHV+ON29I74MUoJ4xaZY2G7WMTeg0=;
 b=QkKfg1BSmyZ1XhBVLN3hcDHLzL83owFa5oGgANMKAlSrzxndd9tK73mrip6GCvyFRfgUG4fJm4xRHfka88kALpSEv4NUTAzE+ebQt0y+E/OIAH2lzxxas+vkB8Aep7alJDBwztQtrTpN86M1DKV0VeSvhc4kOb7ZGz/DciMe5mxLO9ktX0KWixj8nJe44IvSZjBH3NLixdh1dQW/DiAmY+/YtJbmzx+8eXSDH3pqr1/oBU+kNfP9krbu3EBPoy/rhe2WU+eAOTptraLr2MDNn/YKg4L1K3XNWU3LKFrG1UtJHO/Ci0uH9Tk8Q8gdDoY2MxD/kAn2zjDh9Juvc8zuqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/ZDqLIIVHEDuwmHV+ON29I74MUoJ4xaZY2G7WMTeg0=;
 b=X9m+4iw68sJiyll5pytMrHt13FSw2j1wmAVbZripbpLjFFIS6JYm+uR7fcV/zBUmR5Z89a3QgRjJbUzZrCP6NiKKLQM27ZtvU+LPWbrNrtjL1ckgnONUuA69h6V2N3je9Xl5nbSWzuGBO0+j5OKpedMKsFFxFGSBM175XonBBdPQrWoxgJE/R4fPMCShhNP/ebEuPnaz2PiR6MTys73JPHcDGgyAXu5XkAi55ocvqkORgDkflQhGGnDIINNf5tuxfFUIRN2aOz2nK6KbTWV7dDk8LBrNSpnoJ81yE6TOxBvcf6lWmYu1Mbyg6VaGM0b1FsbxoI67j3LQoseHsCPS0g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB3132.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:293::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 10:23:23 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 10:23:23 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] python3-pytest: upgrade 9.1.1 -> 9.2.0
Date: Thu, 29 Oct 2026 11:23:18 +0100
Message-ID: <20261029102318.10042-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261029102318.10042-1-jaipaul.cheernam@est.tech>
References: <20261028070350.13243-5-jaipaul.cheernam@est.tech>
 <20261029102318.10042-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0052.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::8) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB3132:EE_
X-MS-Office365-Filtering-Correlation-Id: a6b5cd5e-2236-4679-93b7-08df35a6a8df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|3023799007|56012099006|4143699003|11063799006|261022105027099003|261021123027099003|10067099003|261028144727099003|261021121427099003|261009223027099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: UI5FzAMRZjel8tB5e6v5RwOd3ATb3W9Vm9a+k81e0uczGpMG5aTvFsl+IIJOMvoJ4B/3a3XCWYol33MwH+wOq12a8hnanWVk6CAtx85TtL9Z1SlhjqqWVfGWmPlvgWsP7HmS6LINH8Yget71/nU0ReEspNytFLp38IcvzxFtSvh4SXE0heqE91vFoiw00bBztfj3T+HYJve3KgVfjrKEVeNF9zpNIVf6Wf8jfCV5Sw6mjGvYpflBzi8tzbLoP470/RWVELCP+t1JAsYp4OO6odmjMa/HT5hFglkWln8PkCoCqX4hzS6K8/Ir1wlJCRFRCQEqLbUFRhYib/XIkZ1Rgs3fq9ElYDW7bYjOuifcqsWrramwbHzsf0zZ9SliTsVfjk8wIJb31mNSPJ4f/Jbmc765OtBTNhxxAPT2tUIpFGTonTP5IIB3elQgf4himyfuudS12h8sJYVaUf1qxS4Fou9kzjSEVNT4jgr2J3ymxO4J4Q4FWnWKylyV1fifLTOKnBtuk1qKmDUqYGkKKccKImeBNFOWKcJBrrJxkt0LpoTT0J69YxkdDMACY9LVTkjXmNjNpCFvMTU8cx+I5VVmoBkzPR311F+o56gzonTzkH1cqL9almpGp9BYgId/E5pa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(4143699003)(11063799006)(261022105027099003)(261021123027099003)(10067099003)(261028144727099003)(261021121427099003)(261009223027099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9CjKSYL6Hvlb3C7wKY/pSIcM4dcqb3r0Iut0xi/aTRqIlziacpx+dsCCQkHu?=
 =?us-ascii?Q?U8jA/+CegoOw+KAZqQj1uHDStz3P7fUa3aXmBMPq6hBHfQWIwpoWURf5EJyI?=
 =?us-ascii?Q?AxNYeaeiGkD/7+6qmpUDdKlxwq2YT3TDOhq+oK1r+CHnqlt8EXfq9GjP03bO?=
 =?us-ascii?Q?xzsNWNnsmaafpoz3Vd1IMXvnd1v88yOrrDxJNIOLcYoVh0ifoXFXutb3RVdc?=
 =?us-ascii?Q?02Z7YIC+Zx+PoqLI6WOYyKEOrWqQHdPJ0eE5ARsTrHTso27qYvXQ/FKDQ0NF?=
 =?us-ascii?Q?msIqBiSpI7qiA21iZkEqUF4tDYAbZZji2/80rwmYCn/vgAzLIszEk+1g4zUu?=
 =?us-ascii?Q?6iVjXQVsExF88h8y7E3vEbFRPpXhIlOQ4fLExhdvPXJ7XvHdjnJHxm/fGttL?=
 =?us-ascii?Q?hhNw383qpZhJe2sfmZ9d7r5rVAiNPqw+YYesXjB2qnf/12WImfaBrvmNgOcb?=
 =?us-ascii?Q?Omn4dJGa6R9p3jVqfbBd2mYxIxZ8LuFaxLIDKqG5SXZampGRN17YJHgSLQJz?=
 =?us-ascii?Q?IjvrzV49a3aTsTwFWs2+nQ8MbMc5ohWPqm2OCX7gy8VeHJAMJAgzOy/o/pdO?=
 =?us-ascii?Q?hbuW/4gkpqwQa3OuvGOTXBKiUPoxmgR+5i8IDTH9/9EAkRoBO/f+7ixr6bpd?=
 =?us-ascii?Q?wHnkHtQiFPUU+DEEaWAqVpWMp7MkLsmfpmNoVAkbBEFQr8gTsGrMQflbUdSi?=
 =?us-ascii?Q?bsNMzkMFIH7rgKy+ZA54QbRJFUj1d/Aonv2FPeryEjx+orPd/dwdZ7S0QbKL?=
 =?us-ascii?Q?quq/NdP2Q40p8dBJAF+zVwAvQEethaCJM7/2sOD75twBM4OSN+D2rwrCVqUO?=
 =?us-ascii?Q?yyBAcuK8p1Z6p+tld/mX8T03G2clCnnrSjyFs0oObIoC6F267bRuANJZbV/H?=
 =?us-ascii?Q?yd0v9XtC3ulqQT3lxmq0D2+hLlSB23MVNqSAq2lUMmxQ2BLQ9EC42H32hK7k?=
 =?us-ascii?Q?g75PDqemt843CV+sI8dtdJKpv9PDv5TPznz4nHikihQcOqFMoCsiY4g9fhjy?=
 =?us-ascii?Q?v6U0W+ZDEYQ5dJG1q59n1qar15uvrTh4B/hAR6CLMC4StmmCCS5h9yJrCtkO?=
 =?us-ascii?Q?SfnWKxlS4BhQaZl9wP6DDmSTBypJcjtPt9FwmJTRkPW27sQhoFhrgyMmVJqD?=
 =?us-ascii?Q?R09j94gdlBbaOL7rKTwOTkSitqCSeDIxXL0FF40SaL74awWRcX9YyUuP/fDN?=
 =?us-ascii?Q?k7aketiCfqVqpFzM0t+Prk1mXC4Jsn2F4MEgqkwivR0lBy088T60mGgmh4Oa?=
 =?us-ascii?Q?/lLtAUJaE6+bd5C0yz1XJCH1ECV4ShkSx/83eAn0xtdnApHQHKcuHBvyIgXP?=
 =?us-ascii?Q?uTY5JlGcl9JHEGIkpxbLUPs+BPt4A/uyxoOIrUlbk5TrLfgH8/TtKm2DXdur?=
 =?us-ascii?Q?OHwp6zy7n8rfojfl795b7Jv307sEM7dcrZNjWHhv0+hKDaGdiAeljh0JxjFc?=
 =?us-ascii?Q?N1wH2BPIi/H4GjRFFKFeIhoqOvjgCQNOs1HCMPGF4tHn/BnoV7Qn0M1hDFpt?=
 =?us-ascii?Q?WWZgi206yq2/dsB2KydqQcu9+Rhug+w6TX5mOqnNVvSa09N/Jyge9WHdlCms?=
 =?us-ascii?Q?XkyC+lNhCvUwzWbd+g9jLN56/yGFWT24CKgTOa1XIdU/HE44QS4jkf93POGf?=
 =?us-ascii?Q?uZ9sdpLGIwClSho6kZ2qXVq40aHeBqtTXqaOhJ85hoeyeXWkCURM5cbazYrD?=
 =?us-ascii?Q?q/fBQoh02zZgkzPYytY51ZeyKiBnb61iTahVZ5FF/PZZMeDquF6/JP4/Usbk?=
 =?us-ascii?Q?0SIRFaB8Bg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b5cd5e-2236-4679-93b7-08df35a6a8df
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 10:23:22.5409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SSJ2ZwljcETVmynhVIGoP5YIsiotC5CHEcqWlTt++tMQUdygIJhvx1TGBjjifpluse53v8EX5Xfvp8NsXY6UpibH+hZzm48AoDjeV07edk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 10:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248928
Content-Type: text/plain; charset="utf-8"

ChangeLog: https://docs.pytest.org/en/stable/changelog.html#pytest-9-2-0-20=
26-10-27

pytest-9.2.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The pytest team is proud to announce the 9.2.0 release!

This release contains new features, improvements, and bug fixes,
the full list of changes is available in the changelog:

    https://docs.pytest.org/en/stable/changelog.html
For complete documentation, please visit:
    https://docs.pytest.org/en/stable/
As usual, you can upgrade from PyPI via:
    pip install -U pytest
Thanks to all of the contributors to this release:

Happy testing,
The pytest Development Team

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes Since v1:
 - Fix python3-unittest-automake-output failure

 .../python/{python3-pytest_9.1.1.bb =3D> python3-pytest_9.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_9.1.1.bb =3D> python3-=
pytest_9.2.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_9.1.1.bb b/meta/re=
cipes-devtools/python/python3-pytest_9.2.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_9.1.1.bb
rename to meta/recipes-devtools/python/python3-pytest_9.2.0.bb
index 8c97596ccc..bd580dabd6 100644
--- a/meta/recipes-devtools/python/python3-pytest_9.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_9.2.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION =3D "The pytest framework makes it easy to writ=
e small tests, yet scal
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbd27e41b6550fe0fc45356d1d81ee37=
c"
=20
-SRC_URI[sha256sum] =3D "1088fbde8f2b49d95a549a195707afa7a76a3ce9bcadc26b6d=
71f0ffda5fe313"
+SRC_URI[sha256sum] =3D "97c4f3b1f3c7414aa36465e09b8220f1d03627993bd51b1282=
e193753c80557b"
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
