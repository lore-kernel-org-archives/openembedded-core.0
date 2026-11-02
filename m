Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7406.1793602911850584711
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 23:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=JRq+nDh5;
 spf=pass (domain: est.tech, ip: 52.101.66.56, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/Q631J0L0CE27hGEzKKbKzsHv81doQ3nSpfmgZGuhTQwDuWZBf0Qxy8/q1V+1ZsCOusqzyzXlggT48nP9ywT2bCNmNr3Hyj7VMpaWS37lJkA5jLqF5V8iNIW7/vEaLnD9Zu3TTJiNx4mbgWz8W9xZMCvXYXoOQcCCwqovtAqSbK8Tx41C3IpjPcfhvyS3pnQ+nYAd2yDGDr6xc2oRjaxcvbAnWt8Kggxu2T1U3iulEdV9tCn+M34xVlygDzb9asix9CST8l6nCh3WrCXk9Rum3WoSlPc08QvCVecvo50Z2oN/Fztn46ewMYAlyVTawiViObOggXk6YCfQqjoAZHPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LM9MH0jDlWu38T9Gbyafder5whjN75wF0rNS73C7ZWQ=;
 b=cz5K2TRWzEcJumsrhQknrTLL1onK/xwYRPiCxaLOVvsDFDQ0QXFqBwNVXfW7K+FZTnPVbyBY6FkaY/DbPw6eRCgrHdbZ9QcWX+wkK7ZLU9NhaTU8MxrDQglXyTGNBYUC+CTD/V/5DnOGgHtilw7v/A2IK0MhHy1IiHHiQMb7YhEyQCHIeScgdgQc1V3f+dNQoaOdQSxc074DyrVV5uEt6p3/O+6C2CBq1X5Nkwf+yBm5SgJb2Zjjv2YX9PGagYcoko1fBU4E8q+3dLTUQc0AbJWjKpUHjEpXOL9vbBkzPnGWPoJOXw4N8kxbjjG/Z1ueRM/RwtL2oPlia9cPRSkN0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM9MH0jDlWu38T9Gbyafder5whjN75wF0rNS73C7ZWQ=;
 b=JRq+nDh5D6mv+R9JreAsiNVR8JdjbXm+luVozxLoNZqJV0AAOkw2lyIoKcZxL27YhvvmMmf7y4qF/Vp6sriRq2wTj38w7amYbezUo+skGzIyMDnzTM/tsiP4OMJZNsPbUBCsRkDs2A38wwJcPrcb9jAsmiByj3l2kWRKPELOKdv35L8U9hYmx+vy9b8QOp2fu9YdckMnozFKWRnXImig8zao0SqcBGw7V6LKZBkRZ/88PS0R0w1edCD4iE2LVM718/+mr/bLzGKj1l6yXz2l8/nXJVZ9+gJ8GE+8/GkLuPAyq5mBnGmhlFjJUWbTTMa0ECDYC1LAzFAZwfCT1Kl5nQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI1P18901MB0784.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:127::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:01:46 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 07:01:45 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 0/3] python3: Upgrade to 3.15.2
Date: Mon,  2 Nov 2026 08:01:40 +0100
Message-ID: <20261102070143.30639-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0062.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::13) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI1P18901MB0784:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e0d949e-3098-4bce-cbbe-08df38af281a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261021123027099003|261021121427099003|261022105027099003|261009223327099003|261009220027099003|261009221727099003|261009221227099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|11063799006|10067099003|56012099006|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: nGasNUKPbXwgKgom+tQr9Tz8B0/ZQdfx6U3RaIP4vm6A7hAWg0Pgqj3iFFRGREKibykSHXarbo6ZUJ0EUwLigwip9mnseqkPm89yKbjevmue4uso5RybwcFgfK3+j//oYUs5fZgVtTMhnz5PRcSdsBpaaQDw8cuPlKFloNJDqemoboKGDqzouhP4Pv63LEiy3y+dGYrjrtpaCpIr8YN9EqtapZ1yswDCZ+IaGF6rFbod5tyJaxs7gd4pzNU9TRXVp5JloOSBUR7hCwgYg+iEyXhmVrVxnGh+QY7mn1XPH36uA74gjrdVUOa0aWAE/30LM4kHfCLHoXp+jc6Luyf7kWNF/oJrAY3u8b11BauIEdEaiV4uLDWpVOw3efaq1t9Q5e7Lzw7UKUOqIDKvSPL22Qq4AYiBM+d2TCLSlxNudK1ygF+HKjLAy7jbHgQFOmM8GGloVEb8JU63hLciYp5rllW6OTGerUt6c3CbporiBBLcSGR0TtitGCom3ItWtqzSzf+eKT11ZUU4KYK+2NK1Rc+klBG3Hy2seXlj+67ZMF/pyytwBhjLzeXZMPvfwLLHWh+8uPO4oWGjXBu9O2kv6yeD19GWbxtEu2/k0ylQtog5Y9CXy098L/v9fVCUjeFA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261021123027099003)(261021121427099003)(261022105027099003)(261009223327099003)(261009220027099003)(261009221727099003)(261009221227099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?suB8Ow4LfCrPcZJ0FvzT3wDzrBnVtDGgcEahauvv9vGqhxu8sp5my8kEP1kG?=
 =?us-ascii?Q?ofZKc5aZ9ibSIocWMWwYG3rYn9JJXeg2/XNUbtK5ZtpLmvW8hgSQGqiM8Iw7?=
 =?us-ascii?Q?iCJwfwWfBonOtARCpGtxDGaUwBLR0bpQHD1MGIznUvelnZ1W/eIurH8J74Xi?=
 =?us-ascii?Q?q8sr8V1c2VR/nRmhae6VmEg5zulSu9Ke18jMCeKnjpz9vjTzFN2HN/wDBqyP?=
 =?us-ascii?Q?cq1KeW7di7irOdOBek9GgkV8wAl/8ghdignQPoN9/ggaEsDlxK4crbBFsRn9?=
 =?us-ascii?Q?6ZDz+ipm5xiQyzEWRTW+v04pSwVWpTrdR2/qGobf7Ymh07jjw/bPaUdLfIUv?=
 =?us-ascii?Q?GysDeNJChLFcqLjVPKZnJZiEIRC2QmXRCjDR37sZ3QckRYhUblfK5OBHtPTt?=
 =?us-ascii?Q?kjJ6hUvlSoFi44tdrBPYU1cC5YFE9M2f3C70ZoY2/HnQXErmz+vDzpND9egX?=
 =?us-ascii?Q?VSjXlPbrvxh6YJaHYPTociluw8FY3XYLn0fLfkWhqCyZqvTiPYjGQ3KmJMoO?=
 =?us-ascii?Q?9rdvAvxHWq7RUfbKtb3akCUN0z9PkKs/v2WsInWSCkp+rISP6vSYA0BHoC93?=
 =?us-ascii?Q?v534uZ/26hY/PlFwv47aoItXeS4I9jBZTBWp+Jdg8hoCAg2qu1alCoMIaxHw?=
 =?us-ascii?Q?xmMi0sVT87ZBtcqKYSoFCDCWOF8VqVZAxMmazYa0/tV4z69yFZ6dRxGESR3R?=
 =?us-ascii?Q?2WvoMmvWqm+oXj+FuQ0GbcoiR0OQy4By+VEGJeybOFXRc1gIsbbNpzD8VTwb?=
 =?us-ascii?Q?8lxlOV/hbFa+tSCMd4wXFthRPbpcnm8HjQf2z213bld8NMxEyEPDmQ9zEZXY?=
 =?us-ascii?Q?/TTUc7lVdQPPu6pFJKhxettisscAU1tiOG1e8ujcKtBoPuFgu/lZS7uyqpJd?=
 =?us-ascii?Q?OlczdjNvHgZ+SPqJRu0SyqwumNc28Un2GbL3ZmYl6R3y5foKom7dhywSHlFx?=
 =?us-ascii?Q?rMB4gxvH0Lnoe1dhbvI3vRs7ka+6ZjyLWSLKH25TSPaXNYJj8+CByVHwycH4?=
 =?us-ascii?Q?WmxV+CyO+Ez/ob8n0rZRQDBUL7jkX43x2+LVaZjuZ3Vh4wA+biwcnhhsE8YF?=
 =?us-ascii?Q?LkJr1UJzt4mOV7N78jugRa4XsdPdM4kHjl3LNRzi4SsV6ZXibVaUjbZlEhYQ?=
 =?us-ascii?Q?8Qk+0E8o5WYZTc7wuXzhXiK9YNy5r56m1ZOoy2kFvafVVYps9nI/lTRwySNu?=
 =?us-ascii?Q?s4GJ1V3aAc0151L54GZYkf9ZBkkDFzGiuEIUPt+nSN+kllrtotoeqnNOo7hH?=
 =?us-ascii?Q?zNcDOLjzb1HWhRbqBSHPuZeUn0PsORHYy3DkGqZWW2sJ+WiVJfo52QJSF1yT?=
 =?us-ascii?Q?rElVfx5ZMG0Ze7QS+wKbOSCkSf1s16mioRUe8/ITcUuOfGs3jpKylB3aaYZY?=
 =?us-ascii?Q?qDwGWhtmagR+Tiz0elCljZI8tUGsO2t4MT7gXMEgNKBOjr9BNzWgqrIzxVOR?=
 =?us-ascii?Q?hGYaw1gJtnLpXP1pWS4ifeC12I8k2Lf9TmsP1E44Fmf/EYW1r2PYRAbFFxUl?=
 =?us-ascii?Q?7Z5FWyFDWEbKy0PZ45wTpMhnJoigSLhhSO4VMWzReTWjic2zcp8bEXsmXqVr?=
 =?us-ascii?Q?BAWpVweM2ImAXK9NnlcDt0sNE6tcx96btn/TV6FrfUznr8lTvkdQFt80a4FZ?=
 =?us-ascii?Q?nYttdWqTFuItx7AedkDmSjBWLM/7LbOX0uWxX81xrV08uzQUloqBmK6YICiD?=
 =?us-ascii?Q?Hu5lgrbUB+yOuXqYu6GlN8r2oX23otQGFYv9fVGYHxjBuMqzWZgFCLrWoum+?=
 =?us-ascii?Q?y7S+OPKP3A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0d949e-3098-4bce-cbbe-08df38af281a
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:01:45.5392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRTgO5mMrHc9yWHhwpgqmAkGNHEXaF9R8vrFoPXRu14Eb0Y53hnUKrst1kulUYK/5dqAeF9Am48N+va0b8SZ2T+OGEeBDOn3wPHmx5asnmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0784
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 07:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249186


python3-maturin: Add support for python 3.15.2 can be dropped if
https://lists.openembedded.org/g/openembedded-core/message/249174 merged be=
fore this series
python3-maturin 1.16.0 contains Update-maximum-Python-PyPy-version changes


Jaipaul Cheernam (3):
  python3-maturin: Add support for python 3.15.2
  python3-dbus: Upgrade 1.4.0 -> 1.5.1
  python3: Upgrade 3.14.10 -> 3.15.2

 meta/classes-recipe/python3-dir.bbclass       |   2 +-
 ...n3-dbus_1.4.0.bb =3D> python3-dbus_1.5.1.bb} |  16 +-
 ...1-Update-maximum-Python-PyPy-version.patch |  99 +++++++
 .../python/python3-maturin_1.15.0.bb          |   4 +-
 ...shebang-overflow-on-python-config.py.patch |   6 +-
 ...e-stdin-I-O-errors-same-way-as-maste.patch |   2 +-
 ...-use-prefix-value-from-build-configu.patch |   6 +-
 ...-qemu-wrapper-when-gathering-profile.patch |   6 +-
 ...est_sysconfig-for-posix_user-purelib.patch |   6 +-
 ...clear-RUNSHARED-when-cross-compiling.patch |  46 ++++
 ...146207-Add-support-for-OpenSSL-4.0.0.patch | 254 ------------------
 ...st_is_python_process_non_python_subp.patch |  50 ++++
 .../0001-prefer-valid-entrypoints.patch       |   6 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |   4 +-
 ...le.py-correct-the-test-output-format.patch |   6 +-
 ...Update-_ssl._SSLSocket-for-OpenSSL-4.patch | 234 ----------------
 ...utdown-test-in-test_ssl.test_got_eof.patch |  41 ---
 .../python/python3/makerace.patch             |   6 +-
 .../python/python3/python3-manifest.json      | 199 +++++---------
 .../python/python3/valid-dists.patch          | 164 -----------
 .../{python3_3.14.10.bb =3D> python3_3.15.2.bb} |  12 +-
 21 files changed, 311 insertions(+), 858 deletions(-)
 rename meta/recipes-devtools/python/{python3-dbus_1.4.0.bb =3D> python3-db=
us_1.5.1.bb} (50%)
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Updat=
e-maximum-Python-PyPy-version.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-configure-cle=
ar-RUNSHARED-when-cross-compiling.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-gh-146207-Add=
-support-for-OpenSSL-4.0.0.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-160881-Fix=
-test_is_python_process_non_python_subp.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0002-gh-148292-Upd=
ate-_ssl._SSLSocket-for-OpenSSL-4.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0003-gh-148292-Rem=
ove-shutdown-test-in-test_ssl.test_got_eof.patch
 delete mode 100644 meta/recipes-devtools/python/python3/valid-dists.patch
 rename meta/recipes-devtools/python/{python3_3.14.10.bb =3D> python3_3.15.=
2.bb} (98%)

