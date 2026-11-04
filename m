Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11668.1793806097546108257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 07:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=a3T87Qyt;
 spf=pass (domain: est.tech, ip: 52.101.72.19, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEol7M65zFJYC1gUtkuM1vXk++CJOMbbg+gkhMnn5c4s4eNUCjx9TfmFzAAl2AGxfQngvHJ9nfhDF3CsynZ3EOOJijLrtY1TB8Vl9JfrZ6qggjRFOlvEf1Zlr3ynAPK/7zRKFFWhzDBl5ouE9s9+7mD139HFoxGjIKNb8jSVDoqRShU9nukVNSjntVp+iX2QawG9hqunxabweP+AkFmyv3IEKVZZpd2NqOXba+D1jFTyABIUHOvfhjYIdyLd6Xi7xSXDtA0Rbw81J3cQjrf9Qq8/zjlrUnFHfYuGXG5orS6/REGWugtyKoiN2Nc4cRP2MkfjPubMn3rLmUU11fY37A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+3XevFhZbyf2cPt85IXqj9NUzsjxf+NkND4f5Ky0lE=;
 b=K4LzAv/msNwLr22qvSuhwTqq7tRFiAoFmbjtgrYbAuRipz3OVtSk1QVUwgeR0txfe5rcxaj8tl78TMCZm7WfqARvn8KUARtEscb8gJHZpFX7xsYvwieyVAVw3HlUKqvS4QECSiVQkCr1ud69Dk/rr/JlLR70dzYgAbWeevBkKhiidC+1/MelHzqwZDzMgaYiBKMtmmB0tBdy/NLIAKGfe6MzoQU3GlgjpUsGunMpbYC1pZjmlFiq8VW28ICG6ptMp8C2Nkhn9nUtJqrjq2Gvn9210OWWZKv2DPw2jbje/DI7xnm1IHY7Tx8JQnaIPYPvcKN526K7YE7CL64VIvkl9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+3XevFhZbyf2cPt85IXqj9NUzsjxf+NkND4f5Ky0lE=;
 b=a3T87Qyt1mvHOplOTPPv8kwtoWPFVKKm5jxTr3qOLRz2SUeveRmkIk96ASZIRT6W/9tG/Np1wO2JAxza/tDHPgCmT7WcqRVd7xr+XT7jjiAP0m6CZU3Gr1SN2e51IjjRCRvAMChUdo/xOCY7xuz+LYFD1uEc2B9exxrwQBJJd3KpfVeSVgONFTY/2Jc0VVBGVEkVJstd3QecIHKBJ32wnaxggyttMWjcZCbqpPmk1m+w5n8RC++ERzva1yjnLB77XFMNf0Epzy2evr37LIZhQnKdX8jbsSzVlV7Nmb8o5T+Pu9FRiFrFU5JnFHUw13iPFOXKDRK2N0rtaDvGoBzpnQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3594.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 15:28:12 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 15:28:12 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 2/2] python3: Upgrade 3.14.10 -> 3.15.2
Date: Wed,  4 Nov 2026 16:28:08 +0100
Message-ID: <20261104152808.47533-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261104152808.47533-1-jaipaul.cheernam@est.tech>
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
 <20261104152808.47533-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZP191CA0019.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::29) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3594:EE_
X-MS-Office365-Filtering-Correlation-Id: 20d1ca52-0b70-48b0-c69e-08df3a883cf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261022115727099003|260925021311599003|260925022911599003|260925021911599003|261022075727099003|5023799004|4143699003|11063799006|261009223327099003|261022105027099003|261009220027099003|261009221727099003|261009223027099003|261026140227099003|261009221227099003|261028144727099003|261022113327099003|261021135927099003|261021130227099003|261102123227099003|261026135527099003|56012099006|261026121527099003|261021123027099003|261026130827099003|261021121427099003|261021133027099003|12006099003|18002099003|25016099003|22082099003|6133799003|29003799003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: s4gcj0XziiTCPYWow9YhEHg0q/AIYWFuablltbGmV8fNNsYpy43mY242XOif6yjRf5HLI16YclWFfnKKP/7pXSqbUjzE3Swr94zsiCO8OmQWk3AHGnWs83Zl3PlKFAPGr+scNXj82E0TBQXlN9qoKqW4UZ1hgOavv1bOPCrIXmApScny3qSLTFNAiUH0px0IP5g9xiVrSwoeDzAwhEixfU+NcGkenoDGlp8uQokZO62jFo7I0dP0qF5tDa7fHTc9EYPjqpbd+r4wIOPkwgswyMLy3sL8K8yA+PWlzltBtbxlVOBoNJqAaEueV3pHwWd+pZ4EaEZsV1VjDKxpeEWDMdEHmwdUCbAH7fQmT5ibVYq/v+QS3XiD5rJoF6PmKjVwba43EnZTaE2JoFmKpg4ufBF4UoY3+huN1BgPBRSvLFpyypkRQ7EMkbM1eUIW8M3zjSPwNeEBn7twH4VsAQEPgjcZ4JvgrZx9P/yncb6IonG9Md+2x2z/q6dh49lQC8Z5xEEyFZoUgXIalFck0PwjRylozKCvNeNmlOD2NqaiBMCEWAqojpbvZN12gPHw93SV1xZDkBfmu0AuCLIeonh43tfiB7GAZb1uOeFxmJ1htZDsjHD2coe100FNVrzdpX9Z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261022115727099003)(260925021311599003)(260925022911599003)(260925021911599003)(261022075727099003)(5023799004)(4143699003)(11063799006)(261009223327099003)(261022105027099003)(261009220027099003)(261009221727099003)(261009223027099003)(261026140227099003)(261009221227099003)(261028144727099003)(261022113327099003)(261021135927099003)(261021130227099003)(261102123227099003)(261026135527099003)(56012099006)(261026121527099003)(261021123027099003)(261026130827099003)(261021121427099003)(261021133027099003)(12006099003)(18002099003)(25016099003)(22082099003)(6133799003)(29003799003)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RVQRDLk881PW8podRJvnNzTW+gHWvzEkvVae0E1MB7anIuuDMw8oqtpnBnzv?=
 =?us-ascii?Q?uT4nxjW8T3vZ/iFu0z8C85a/39iaNgTVWlwIDchTzUMFjjtAlbprTVCWaOno?=
 =?us-ascii?Q?cGIjisvOLkoGyX7ypWfkNfZvHz+k/PBwf+5TlYkgroW1qyno+mDFxc9+PPVJ?=
 =?us-ascii?Q?5JBPX/IYSxI4kHJ9HaUxlXf050s5XvR9LTi7um9LFbC/m/l4b1KtcQtO5zty?=
 =?us-ascii?Q?l+xaepwXG+iQTyDEu19+dYPruJ7rvz7YgSG5UYWjujzThRoAetNibSqQPFSy?=
 =?us-ascii?Q?OhIe6CufSzBf83sOFiXjlHAMIAm4LadCiKziZQFUSiSof5kFL666c17DiE8y?=
 =?us-ascii?Q?wQuJ9lrKdnqD2Eo6vYUWN5m+zeS+Lg7tVLo8hWdcPoLzJEfwT55WJnX9Q2rV?=
 =?us-ascii?Q?uxwGfvfcro6489oTFFOxd7ayFPK3lLysuGoahB73wdPaHuLmDTmFIP6J3MZR?=
 =?us-ascii?Q?oXHQF9FldhzxZGQCFJswvCktaFJHTeW8nVFnKU2QLv8Gg08+88hyxVA8yIpW?=
 =?us-ascii?Q?Zkx9re1aTabXxfJYTZSUVaMVhuayNJfsxN6Rfsqfca9jEvIiIjhEL4u3fzmo?=
 =?us-ascii?Q?0cq1YCx2RbHgANyXg09URl9LVr7l/jeGNw+APcgZzv2kCednj6wbvr6FwmfR?=
 =?us-ascii?Q?iRcKTR/7VQRQQwt7IZ67pnicmwkojACnpdwoh4qw/XX+qiRf3A9Q1k64mh1S?=
 =?us-ascii?Q?6/lY0NN9AWnoq1Q8kjSmigQZRtIHAAhZZb8yFM+yq0UI/u9ABcYywXe2uaLz?=
 =?us-ascii?Q?kKJ60uE2Cp3liDyqTXu9mpI5IJ0en1C4juNt2TSNQ6UCM1jiI0xDzFQj9DHK?=
 =?us-ascii?Q?wDOTR5oWVkjg2cbjTM9+XcM/6bMXc7n6SVhagX8lAxo+roF1f8s7ioDUJ5J1?=
 =?us-ascii?Q?r+0P1PnbYzzNkmgGkyENydiuA1BYhL1iAfr4wYsmctF5YOkQJpufwm9xp3ZH?=
 =?us-ascii?Q?SPUkAHbNMtjXvJFtZIbx99sbdMAIMEQ+tcKTjYxZT4L+AlHBBGj3mdy2CCyT?=
 =?us-ascii?Q?PM7UzgWu9n7D65NeubfOuL9L9JlFZCeVhAq5W194yIoJgMW4H649B+qWmLXG?=
 =?us-ascii?Q?ec4rLP2Xin+alAWEbs1pqSZFG0Fffqa1rvu93yJO0N94fqpq0fYUyhJRjN4/?=
 =?us-ascii?Q?0Lh2Rmv55+VXt4gIskxwpZcqK8/ZAhEWjUoFavtPtbNAHZiwuEGwfGgDY5+O?=
 =?us-ascii?Q?JlJ4VD5Qz/6WjI0e306YiTTMXsaCjD+AZkGlBtaDaAQnfa1rhJKFuAU9jvAc?=
 =?us-ascii?Q?g2OSwJBxfKwF1g0g1/1Minb0+5zNyQxbTCDrhWxI3JIEb8KLOcCGez61llUu?=
 =?us-ascii?Q?EpN5PSHWL2hdwcQmgabmYQhDAsJgi6jNiqPNS9b+IWM/+Pnm4ShYyKzdKNZG?=
 =?us-ascii?Q?f0bSGF0ykv0e/f+h+1qMbWuWuZerQej8RRpa4UwgGu7pcxWnvBi7nnwtuBNJ?=
 =?us-ascii?Q?eUzjVg9VAnft18eQKj8kXJF/HorDvdIYknp2b9s7Zn0zWpP4mp/zunNyO+31?=
 =?us-ascii?Q?goWpzREXC3IW1o40G83/zhrq+5CswO1wnWoDXqEaKp9hlVwgeGVTPIy7Q5CU?=
 =?us-ascii?Q?mf6dACbROC6ANqK39o3Sz6KEV9ecddGL0euW6SmuoG6w59cgAAU7DgbVR6Ug?=
 =?us-ascii?Q?3o6AAEKnPfmW3uO8ZfvvIoatuje9Asuz0EiKDjL4S+XQZiwQY6BObArAlw4x?=
 =?us-ascii?Q?bbNdJjUQMhv6UMPhg0P7Fhqj74UvHb/fHWAzKxArNT04SkbAQpi80lzlmolp?=
 =?us-ascii?Q?tbhw9n2Rqw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d1ca52-0b70-48b0-c69e-08df3a883cf1
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 15:28:12.4416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJ9wYsBB/n2jA+8exBQrZqqimjOselG+fUIy+D6+qAVOp0iaoztk4eGQF95pmWglTWmlF7MoxTldwgF+MmTnj9H5BynObbjL4MUcXwKl2M8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3594
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 15:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249393

ReleaseNotes: https://docs.python.org/3/whatsnew/changelog.html#python-3-15=
-2-final

- Drop patches which are part of upstream release
  - 0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
  - 0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
  - 0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
  - valid-dists.patch
- Add --without-system-libmpdec as EXTRA_OECONF configure option
  (--with-system-libmpdec is needed new package mpdecimal [1])
- Bump PYTHON_BASEVERSION to 3.15 in python3-dir.bbclass
- Update python3-manifest
- Refresh existing patches
- Add two fixes needed for the new release
  - 0001-gh-160881-Fix-test_is_python_process_non_python_subp.patch
  - 0001-configure-clear-RUNSHARED-when-cross-compiling.patch

Verification:
- Built python3 for glibc and musl
- verified ptest for all 34 python3 packages which supports ptest

[1] https://github.com/python/cpython/issues/115119

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v5:
 - Upgrade python3-setuptools

Changes since v4:
 - Add license tag for python3-dbus upgrade

Changes since v3:
 - Upgrade python3-dbus which is causing failure for glib-2.0

Changes since v2:
 - Drop mpdecimal new package and add --without-system-libmpdec
 - Add patch for maturin failure
 - verified ptest on all 34 python3 packages
 - Verified with glibc and musl as well

Changes since v1:
 - Update python3-manifest

 meta/classes-recipe/python3-dir.bbclass       |   2 +-
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
 18 files changed, 199 insertions(+), 851 deletions(-)
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

diff --git a/meta/classes-recipe/python3-dir.bbclass b/meta/classes-recipe/=
python3-dir.bbclass
index 3eb0dea9b2..b26621f365 100644
--- a/meta/classes-recipe/python3-dir.bbclass
+++ b/meta/classes-recipe/python3-dir.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-PYTHON_BASEVERSION =3D "3.14"
+PYTHON_BASEVERSION =3D "3.15"
 PYTHON_ABI =3D ""
 PYTHON_DIR =3D "python${PYTHON_BASEVERSION}"
 PYTHON_PN =3D "python3"
diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overfl=
ow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Av=
oid-shebang-overflow-on-python-config.py.patch
index 79fee9803f..f5acfb789c 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-p=
ython-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-p=
ython-config.py.patch
@@ -1,4 +1,4 @@
-From 3f2df0e1fce8c7425998dade00d084f1b101a982 Mon Sep 17 00:00:00 2001
+From c7712b4345e16786ee237427537b83787022c733 Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Tue, 7 Jun 2022 16:16:41 +0200
 Subject: [PATCH] Avoid shebang overflow on python-config.py
@@ -16,10 +16,10 @@ Upstream-Status: Denied [distribution]
  1 file changed, 2 insertions(+)
=20
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index e946018..345ed29 100644
+index a1d59e4..26a90e6 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2844,6 +2844,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/=
python-config.sh
+@@ -2938,6 +2938,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/=
python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >pyth=
on-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-st=
din-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index 532adfe69a..322de292ce 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O=
-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O=
-errors-same-way-as-maste.patch
@@ -1,4 +1,4 @@
-From 9cd44429215352eb2753e0fd8e25fef24f714006 Mon Sep 17 00:00:00 2001
+From 1e6d7f34c558ed05f7d35f4a2b86f079318fb6be Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 16 Sep 2021 16:35:37 +0200
 Subject: [PATCH] Lib/pty.py: handle stdin I/O errors same way as master I/=
O
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use=
-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 580d38a403..ce2efd431c 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix=
-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix=
-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From b5aad6a9b6c5add7a85861aed8aa030c1ad3d52f Mon Sep 17 00:00:00 2001
+From 7338a6821cdc4e7cab17ca255e484bf19b4b3670 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:26:32 +0100
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configurati=
on
@@ -18,10 +18,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
=20
 diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
-index 0a8bcc0..a2341f2 100644
+index 924401c..0ff84f7 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
-@@ -539,12 +539,12 @@ def _init_config_vars():
+@@ -537,12 +537,12 @@ def _init_config_vars():
      _CONFIG_VARS['py_version'] =3D _PY_VERSION
      _CONFIG_VARS['py_version_short'] =3D _PY_VERSION_SHORT
      _CONFIG_VARS['py_version_nodot'] =3D _PY_VERSION_SHORT_NO_DOT
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qem=
u-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index d3f46c372a..dd5a87cd54 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapp=
er-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapp=
er-when-gathering-profile.patch
@@ -1,4 +1,4 @@
-From d6f77e3a934616d1f6c083b7144c50a32e08b70a Mon Sep 17 00:00:00 2001
+From 61b446b8554b91b93f8ae40c654abf9d8a77145d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile dat=
a
@@ -15,10 +15,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
=20
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 526d500..a7e536d 100644
+index 95fefcc..24ca285 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -864,8 +864,7 @@ profile-run-stamp:
+@@ -879,8 +879,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfi=
g-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-=
Update-test_sysconfig-for-posix_user-purelib.patch
index 0864f23926..6cc7ae187e 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-p=
osix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-p=
osix_user-purelib.patch
@@ -1,4 +1,4 @@
-From c608cb4b3c8c31f1aa25ad1264ff58733fb99769 Mon Sep 17 00:00:00 2001
+From f1e23d641d6edb5bb82cd24272b7b1f8c42c64dd Mon Sep 17 00:00:00 2001
 From: Wentao Zhang <wentao.zhang@windriver.com>
 Date: Mon, 20 Mar 2023 13:39:52 +0800
 Subject: [PATCH] Update test_sysconfig for posix_user purelib
@@ -22,10 +22,10 @@ Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com=
>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
-index 1fe4b68..383142a 100644
+index ce3a3c6..4eb65fb 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
-@@ -435,7 +435,7 @@ class TestSysConfig(unittest.TestCase, VirtualEnvironm=
entMixin):
+@@ -432,7 +432,7 @@ class TestSysConfig(unittest.TestCase, VirtualEnvironm=
entMixin):
                  expected =3D os.path.normpath(global_path.replace(base, u=
ser, 1))
                  # bpo-44860: platlib of posix_user doesn't use sys.platli=
bdir,
                  # whereas posix_prefix does.
diff --git a/meta/recipes-devtools/python/python3/0001-configure-clear-RUNS=
HARED-when-cross-compiling.patch b/meta/recipes-devtools/python/python3/000=
1-configure-clear-RUNSHARED-when-cross-compiling.patch
new file mode 100644
index 0000000000..f5f09e81ee
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-configure-clear-RUNSHARED-w=
hen-cross-compiling.patch
@@ -0,0 +1,46 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Tue, 27 Oct 2026 10:00:00 +0000
+Subject: [PATCH] configure: clear RUNSHARED when cross compiling
+
+Since 3.15 the checksharedmods target runs the host build python with the
+target LD_LIBRARY_PATH, which breaks musl cross builds (host cannot load
+libc.so). Clear RUNSHARED for cross builds as before.
+
+Upstream-Status: Submitted [https://github.com/python/cpython/issues/16092=
4]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ configure    | 4 ++++
+ configure.ac | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/configure b/configure
+index 6f7ff1b..9702135 100755
+--- a/configure
++++ b/configure
+@@ -7867,6 +7867,10 @@ fi
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $LDLIBRARY" >&5
+ printf "%s\n" "$LDLIBRARY" >&6; }
+=20
++if test "$cross_compiling" =3D yes; then
++  RUNSHARED=3D
++fi
++
+ # HOSTRUNNER - Program to run CPython for the host platform
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking HOSTRUNNER" >&5
+ printf %s "checking HOSTRUNNER... " >&6; }
+diff --git a/configure.ac b/configure.ac
+index 9923805..9e86057 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1670,6 +1670,10 @@ else # shared is disabled
+ fi
+ AC_MSG_RESULT([$LDLIBRARY])
+=20
++if test "$cross_compiling" =3D yes; then
++  RUNSHARED=3D
++fi
++
+ # HOSTRUNNER - Program to run CPython for the host platform
+ AC_MSG_CHECKING([HOSTRUNNER])
+ if test -z "$HOSTRUNNER"
diff --git a/meta/recipes-devtools/python/python3/0001-gh-146207-Add-suppor=
t-for-OpenSSL-4.0.0.patch b/meta/recipes-devtools/python/python3/0001-gh-14=
6207-Add-support-for-OpenSSL-4.0.0.patch
deleted file mode 100644
index 37f55de65c..0000000000
--- a/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-O=
penSSL-4.0.0.patch
+++ /dev/null
@@ -1,254 +0,0 @@
-From 3364e7e62fa24d0e19133fb0f90b1c24ef1110c5 Mon Sep 17 00:00:00 2001
-From: Victor Stinner <vstinner@python.org>
-Date: Wed, 25 Mar 2026 07:44:47 +0100
-Subject: [PATCH] gh-146207: Add support for OpenSSL 4.0.0 alpha1 (#146217)
-
-OpenSSL 4.0.0 alpha1 removed these functions:
-
-* SSLv3_method()
-* TLSv1_method()
-* TLSv1_1_method()
-* TLSv1_2_method()
-
-Other changes:
-
-* Update test_openssl_version().
-* Update multissltests.py for OpenSSL 4.
-* Add const qualifier to fix compiler warnings.
-
-Co-authored-by: B=C3=A9n=C3=A9dikt Tran <10796600+picnixz@users.noreply.gi=
thub.com>
-Signed-off-by: Victor Stinner <vstinner@python.org>
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/3364e7=
e62fa24d0e19133fb0f90b1c24ef1110c5]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- Lib/test/test_ssl.py       | 52 ++++++++++++++++++++------------------
- Modules/_ssl.c             | 27 ++++++++++++++++----
- Modules/_ssl/cert.c        |  3 ++-
- Tools/ssl/multissltests.py |  7 ++++-
- 4 files changed, 58 insertions(+), 31 deletions(-)
-
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index dc795c6bd8a..61355927296 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -439,7 +439,7 @@ class BasicSocketTests(unittest.TestCase):
-         ssl.OP_NO_COMPRESSION
-         self.assertEqual(ssl.HAS_SNI, True)
-         self.assertEqual(ssl.HAS_ECDH, True)
--        self.assertEqual(ssl.HAS_TLSv1_2, True)
-+        self.assertIsInstance(ssl.HAS_TLSv1_2, bool)
-         self.assertEqual(ssl.HAS_TLSv1_3, True)
-         ssl.OP_NO_SSLv2
-         ssl.OP_NO_SSLv3
-@@ -630,11 +630,11 @@ class BasicSocketTests(unittest.TestCase):
-         # Some sanity checks follow
-         # >=3D 1.1.1
-         self.assertGreaterEqual(n, 0x10101000)
--        # < 4.0
--        self.assertLess(n, 0x40000000)
-+        # < 5.0
-+        self.assertLess(n, 0x50000000)
-         major, minor, fix, patch, status =3D t
-         self.assertGreaterEqual(major, 1)
--        self.assertLess(major, 4)
-+        self.assertLess(major, 5)
-         self.assertGreaterEqual(minor, 0)
-         self.assertLess(minor, 256)
-         self.assertGreaterEqual(fix, 0)
-@@ -700,12 +700,14 @@ class BasicSocketTests(unittest.TestCase):
-             ssl.OP_NO_TLSv1_2,
-             ssl.OP_NO_TLSv1_3
-         ]
--        protocols =3D [
--            ssl.PROTOCOL_TLSv1,
--            ssl.PROTOCOL_TLSv1_1,
--            ssl.PROTOCOL_TLSv1_2,
--            ssl.PROTOCOL_TLS
--        ]
-+        protocols =3D []
-+        if hasattr(ssl, 'PROTOCOL_TLSv1'):
-+            protocols.append(ssl.PROTOCOL_TLSv1)
-+        if hasattr(ssl, 'PROTOCOL_TLSv1_1'):
-+            protocols.append(ssl.PROTOCOL_TLSv1_1)
-+        if hasattr(ssl, 'PROTOCOL_TLSv1_2'):
-+            protocols.append(ssl.PROTOCOL_TLSv1_2)
-+        protocols.append(ssl.PROTOCOL_TLS)
-         versions =3D [
-             ssl.TLSVersion.SSLv3,
-             ssl.TLSVersion.TLSv1,
-@@ -1199,6 +1201,7 @@ class ContextTests(unittest.TestCase):
-                 ssl.TLSVersion.TLSv1,
-                 ssl.TLSVersion.TLSv1_1,
-                 ssl.TLSVersion.TLSv1_2,
-+                ssl.TLSVersion.TLSv1_3,
-                 ssl.TLSVersion.SSLv3,
-             }
-         )
-@@ -1212,7 +1215,7 @@ class ContextTests(unittest.TestCase):
-         with self.assertRaises(ValueError):
-             ctx.minimum_version =3D 42
-=20
--        if has_tls_protocol(ssl.PROTOCOL_TLSv1_1):
-+        if has_tls_protocol('PROTOCOL_TLSv1_1'):
-             ctx =3D ssl.SSLContext(ssl.PROTOCOL_TLSv1_1)
-=20
-             self.assertIn(
-@@ -1764,23 +1767,24 @@ class ContextTests(unittest.TestCase):
-         self.assertFalse(ctx.check_hostname)
-         self._assert_context_options(ctx)
-=20
--        if has_tls_protocol(ssl.PROTOCOL_TLSv1):
-+        if has_tls_protocol('PROTOCOL_TLSv1'):
-             with warnings_helper.check_warnings():
-                 ctx =3D ssl._create_stdlib_context(ssl.PROTOCOL_TLSv1)
-             self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1)
-             self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
-             self._assert_context_options(ctx)
-=20
--        with warnings_helper.check_warnings():
--            ctx =3D ssl._create_stdlib_context(
--                ssl.PROTOCOL_TLSv1_2,
--                cert_reqs=3Dssl.CERT_REQUIRED,
--                check_hostname=3DTrue
--            )
--        self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1_2)
--        self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
--        self.assertTrue(ctx.check_hostname)
--        self._assert_context_options(ctx)
-+        if has_tls_protocol('PROTOCOL_TLSv1_2'):
-+            with warnings_helper.check_warnings():
-+                ctx =3D ssl._create_stdlib_context(
-+                    ssl.PROTOCOL_TLSv1_2,
-+                    cert_reqs=3Dssl.CERT_REQUIRED,
-+                    check_hostname=3DTrue
-+                )
-+            self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1_2)
-+            self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
-+            self.assertTrue(ctx.check_hostname)
-+            self._assert_context_options(ctx)
-=20
-         ctx =3D ssl._create_stdlib_context(purpose=3Dssl.Purpose.CLIENT_A=
UTH)
-         self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLS_SERVER)
-@@ -3908,10 +3912,10 @@ class ThreadedTests(unittest.TestCase):
-                            client_options=3Dssl.OP_NO_TLSv1_2)
-=20
-         try_protocol_combo(ssl.PROTOCOL_TLS, ssl.PROTOCOL_TLSv1_2, 'TLSv1=
.2')
--        if has_tls_protocol(ssl.PROTOCOL_TLSv1):
-+        if has_tls_protocol('PROTOCOL_TLSv1'):
-             try_protocol_combo(ssl.PROTOCOL_TLSv1_2, ssl.PROTOCOL_TLSv1, =
False)
-             try_protocol_combo(ssl.PROTOCOL_TLSv1, ssl.PROTOCOL_TLSv1_2, =
False)
--        if has_tls_protocol(ssl.PROTOCOL_TLSv1_1):
-+        if has_tls_protocol('PROTOCOL_TLSv1_1'):
-             try_protocol_combo(ssl.PROTOCOL_TLSv1_2, ssl.PROTOCOL_TLSv1_1=
, False)
-             try_protocol_combo(ssl.PROTOCOL_TLSv1_1, ssl.PROTOCOL_TLSv1_2=
, False)
-=20
-diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index b45295b4c0c..6f75af86113 100644
---- a/Modules/_ssl.c
-+++ b/Modules/_ssl.c
-@@ -136,6 +136,17 @@ static void _PySSLFixErrno(void) {
- #error Unsupported OpenSSL version
- #endif
-=20
-+#if (OPENSSL_VERSION_NUMBER >=3D 0x40000000L)
-+#  define OPENSSL_NO_SSL3
-+#  define OPENSSL_NO_TLS1
-+#  define OPENSSL_NO_TLS1_1
-+#  define OPENSSL_NO_TLS1_2
-+#  define OPENSSL_NO_SSL3_METHOD
-+#  define OPENSSL_NO_TLS1_METHOD
-+#  define OPENSSL_NO_TLS1_1_METHOD
-+#  define OPENSSL_NO_TLS1_2_METHOD
-+#endif
-+
- /* OpenSSL API 1.1.0+ does not include version methods */
- #ifndef OPENSSL_NO_SSL3_METHOD
- extern const SSL_METHOD *SSLv3_method(void);
-@@ -1137,7 +1148,7 @@ _asn1obj2py(_sslmodulestate *state, const ASN1_OBJEC=
T *name, int no_name)
-=20
- static PyObject *
- _create_tuple_for_attribute(_sslmodulestate *state,
--                            ASN1_OBJECT *name, ASN1_STRING *value)
-+                            const ASN1_OBJECT *name, const ASN1_STRING *v=
alue)
- {
-     Py_ssize_t buflen;
-     PyObject *pyattr;
-@@ -1166,16 +1177,16 @@ _create_tuple_for_attribute(_sslmodulestate *state=
,
- }
-=20
- static PyObject *
--_create_tuple_for_X509_NAME (_sslmodulestate *state, X509_NAME *xname)
-+_create_tuple_for_X509_NAME(_sslmodulestate *state, const X509_NAME *xnam=
e)
- {
-     PyObject *dn =3D NULL;    /* tuple which represents the "distinguishe=
d name" */
-     PyObject *rdn =3D NULL;   /* tuple to hold a "relative distinguished =
name" */
-     PyObject *rdnt;
-     PyObject *attr =3D NULL;   /* tuple to hold an attribute */
-     int entry_count =3D X509_NAME_entry_count(xname);
--    X509_NAME_ENTRY *entry;
--    ASN1_OBJECT *name;
--    ASN1_STRING *value;
-+    const X509_NAME_ENTRY *entry;
-+    const ASN1_OBJECT *name;
-+    const ASN1_STRING *value;
-     int index_counter;
-     int rdn_level =3D -1;
-     int retcode;
-@@ -6599,9 +6610,15 @@ sslmodule_init_constants(PyObject *m)
-     ADD_INT_CONST("PROTOCOL_TLS", PY_SSL_VERSION_TLS);
-     ADD_INT_CONST("PROTOCOL_TLS_CLIENT", PY_SSL_VERSION_TLS_CLIENT);
-     ADD_INT_CONST("PROTOCOL_TLS_SERVER", PY_SSL_VERSION_TLS_SERVER);
-+#ifndef OPENSSL_NO_TLS1
-     ADD_INT_CONST("PROTOCOL_TLSv1", PY_SSL_VERSION_TLS1);
-+#endif
-+#ifndef OPENSSL_NO_TLS1_1
-     ADD_INT_CONST("PROTOCOL_TLSv1_1", PY_SSL_VERSION_TLS1_1);
-+#endif
-+#ifndef OPENSSL_NO_TLS1_2
-     ADD_INT_CONST("PROTOCOL_TLSv1_2", PY_SSL_VERSION_TLS1_2);
-+#endif
-=20
- #define ADD_OPTION(NAME, VALUE) if (sslmodule_add_option(m, NAME, (VALUE)=
) < 0) return -1
-=20
-diff --git a/Modules/_ssl/cert.c b/Modules/_ssl/cert.c
-index f2e7be89668..061b0fb3171 100644
---- a/Modules/_ssl/cert.c
-+++ b/Modules/_ssl/cert.c
-@@ -128,7 +128,8 @@ _ssl_Certificate_get_info_impl(PySSLCertificate *self)
- }
-=20
- static PyObject*
--_x509name_print(_sslmodulestate *state, X509_NAME *name, int indent, unsi=
gned long flags)
-+_x509name_print(_sslmodulestate *state, const X509_NAME *name,
-+                int indent, unsigned long flags)
- {
-     PyObject *res;
-     BIO *biobuf;
-diff --git a/Tools/ssl/multissltests.py b/Tools/ssl/multissltests.py
-index 3b4507c6771..48207e5330f 100755
---- a/Tools/ssl/multissltests.py
-+++ b/Tools/ssl/multissltests.py
-@@ -422,9 +422,11 @@ class BuildOpenSSL(AbstractBuilder):
-     def _post_install(self):
-         if self.version.startswith("3."):
-             self._post_install_3xx()
-+        elif self.version.startswith("4."):
-+            self._post_install_4xx()
-=20
-     def _build_src(self, config_args=3D()):
--        if self.version.startswith("3."):
-+        if self.version.startswith(("3.", "4.")):
-             config_args +=3D ("enable-fips",)
-         super()._build_src(config_args)
-=20
-@@ -440,6 +442,9 @@ class BuildOpenSSL(AbstractBuilder):
-             lib64 =3D self.lib_dir + "64"
-             os.symlink(lib64, self.lib_dir)
-=20
-+    def _post_install_4xx(self):
-+        self._post_install_3xx()
-+
-     @property
-     def short_version(self):
-         """Short version for OpenSSL download URL"""
diff --git a/meta/recipes-devtools/python/python3/0001-gh-160881-Fix-test_i=
s_python_process_non_python_subp.patch b/meta/recipes-devtools/python/pytho=
n3/0001-gh-160881-Fix-test_is_python_process_non_python_subp.patch
new file mode 100644
index 0000000000..581dad9b2e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-gh-160881-Fix-test_is_pytho=
n_process_non_python_subp.patch
@@ -0,0 +1,50 @@
+From 1db73a72041cdbbeb4ddef01595f25129a8138f7 Mon Sep 17 00:00:00 2001
+From: Tom Greenslade <thomgree@cisco.com>
+Date: Thu, 29 Oct 2026 14:17:40 +0000
+Subject: [PATCH] gh-160881: Fix test_is_python_process_non_python_subproce=
ss
+ with multicall sleep
+
+_wait_for_process_exec() waited for /proc/{pid}/exe to be named "sleep",
+which never happens when sleep is a multicall binary (BusyBox on Alpine,
+coreutils-single on RHEL UBI9). Wait instead until the child's executable
+differs from the parent's, which means the child has called exec().
+
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/160901]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ .../test_sampling_profiler/test_children.py            | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/Lib/test/test_profiling/test_sampling_profiler/test_children.=
py b/Lib/test/test_profiling/test_sampling_profiler/test_children.py
+index 4b27c6dbb1896c1..9a8d529c4b82444 100644
+--- a/Lib/test/test_profiling/test_sampling_profiler/test_children.py
++++ b/Lib/test/test_profiling/test_sampling_profiler/test_children.py
+@@ -85,12 +85,14 @@ def reader():
+     return result[0]
+=20
+=20
+-def _wait_for_process_exec(proc, name, timeout):
++def _wait_for_process_exec(proc, timeout):
+     # Wait until a child process calls exec() to replace the forked proce=
ss
+-    # executable. Raise AssertionError on timeout.
++    # executable. Don't check the executable name: it can be a multicall
++    # binary such as /bin/busybox. Raise AssertionError on timeout.
++    parent_exe =3D os.readlink("/proc/self/exe")
+     for _ in sleeping_retry(timeout, max_delay=3D0.1):
+         exe =3D os.readlink(f"/proc/{proc.pid}/exe")
+-        if os.path.basename(exe) =3D=3D name:
++        if exe !=3D parent_exe:
+             break
+=20
+=20
+@@ -625,7 +627,7 @@ def test_is_python_process_non_python_subprocess(self)=
:
+         )
+=20
+         try:
+-            _wait_for_process_exec(proc, "sleep", SHORT_TIMEOUT)
++            _wait_for_process_exec(proc, SHORT_TIMEOUT)
+=20
+             self.assertFalse(
+                 is_python_process(proc.pid),
diff --git a/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypo=
ints.patch b/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypo=
ints.patch
index 525a2ca700..e504325592 100644
--- a/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.pa=
tch
+++ b/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.pa=
tch
@@ -1,4 +1,4 @@
-From 8d7fcf04c6513841c7985e64b746b1ef5de0c426 Mon Sep 17 00:00:00 2001
+From 57c51c6746c1efdae1654df443c5d23351b2d131 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 17 Apr 2026 16:53:42 +0100
 Subject: [PATCH] prefer valid entrypoints
@@ -16,10 +16,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Lib/importlib/metadata/__init__.py b/Lib/importlib/metadata/_=
_init__.py
-index 085378c..ff5cae4 100644
+index 32f4b7d..705f245 100644
 --- a/Lib/importlib/metadata/__init__.py
 +++ b/Lib/importlib/metadata/__init__.py
-@@ -1016,7 +1016,7 @@ def entry_points(**params) -> EntryPoints:
+@@ -1120,7 +1120,7 @@ def entry_points(**params) -> EntryPoints:
      :return: EntryPoints for all installed packages.
      """
      eps =3D itertools.chain.from_iterable(
diff --git a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-pla=
tlibdir-also-for-purelib.patch b/meta/recipes-devtools/python/python3/0001-=
sysconfig.py-use-platlibdir-also-for-purelib.patch
index 7807827d9a..e24d6b63b1 100644
--- a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir=
-also-for-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir=
-also-for-purelib.patch
@@ -1,4 +1,4 @@
-From c10d1b295a9fb93836830cce441da3f22e5c7cd7 Mon Sep 17 00:00:00 2001
+From 07c5b43f29e93825e1c0b0fcebf40dc5971d438f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 12 Sep 2021 21:44:36 +0200
 Subject: [PATCH] sysconfig.py: use platlibdir also for purelib
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
-index faf8273..0a8bcc0 100644
+index b931551..924401c 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
 @@ -29,7 +29,7 @@ _INSTALL_SCHEMES =3D {
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-corre=
ct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001=
-test_locale.py-correct-the-test-output-format.patch
index a60d082e2f..12d87168ca 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-=
test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-=
test-output-format.patch
@@ -1,4 +1,4 @@
-From f0ac5b479b99bfb7f5e937a941b31a596f4caafc Mon Sep 17 00:00:00 2001
+From c8d8b7aaf96faa50d8bf20c59ed31e7c6a8d698c Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 5 Aug 2019 15:57:39 +0800
 Subject: [PATCH] test_locale.py: correct the test output format
@@ -31,10 +31,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
-index f918435..1910a43 100644
+index a06c600..38b91d0 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
-@@ -499,7 +499,7 @@ class TestRealLocales(unittest.TestCase):
+@@ -500,7 +500,7 @@ class TestRealLocales(unittest.TestCase):
              self.skipTest('test needs Turkish locale')
          loc =3D locale.getlocale(locale.LC_CTYPE)
          if verbose:
diff --git a/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ss=
l._SSLSocket-for-OpenSSL-4.patch b/meta/recipes-devtools/python/python3/000=
2-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
deleted file mode 100644
index 1b9a7fc942..0000000000
--- a/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLS=
ocket-for-OpenSSL-4.patch
+++ /dev/null
@@ -1,234 +0,0 @@
-From 3c2a3014af7d73cc34f2498f60fdf863d9bc7c6c Mon Sep 17 00:00:00 2001
-From: Victor Stinner <vstinner@python.org>
-Date: Mon, 4 May 2026 13:52:57 +0200
-Subject: [PATCH] gh-148292: Update _ssl._SSLSocket for OpenSSL 4 (#149102)
-
-The _SSLSocket object now remembers if it gets an EOF error. In this
-case, read(), sendfile(), write() and do_handshake method calls fail
-with SSLEOFError without calling the underlying OpenSSL function.
-
-Co-authored-by: Gregory P. Smith <greg@krypto.org>
-(cherry picked from commit 7b7fa3f9bf3d7cdf3eb669d02b386e05b39c402a)
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/3c2a30=
14af7d]
-
-Note: This is from the unmerged CPython PR #149783 which backports
-OpenSSL 4.0 support to the 3.14 branch. Upstream deferred merging
-until after Python 3.15.1 is released.
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- Lib/test/test_ssl.py                          | 82 +++++++++++++++++++
- ...-04-28-17-47-55.gh-issue-148292.oIq3ml.rst |  7 ++
- Modules/_ssl.c                                | 42 ++++++++++
- 3 files changed, 131 insertions(+)
- create mode 100644 Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-=
148292.oIq3ml.rst
-
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index 965dbc36f096499..03d9e3f9e5e96b5 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -3039,6 +3039,36 @@ class ThreadedEchoServer(threading.Thread):
-     def stop(self):
-         self.active =3D False
-=20
-+class TestEOFServer(threading.Thread):
-+    def __init__(self):
-+        super().__init__()
-+        self.listening =3D threading.Event()
-+        self.address =3D None
-+
-+    def run(self):
-+        context =3D ssl.create_default_context(ssl.Purpose.CLIENT_AUTH)
-+        context.load_cert_chain(CERTFILE)
-+        server_sock =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)
-+        with server_sock:
-+            server_sock.settimeout(support.SHORT_TIMEOUT)
-+            server_sock.bind((HOST, 0))
-+            server_sock.listen(5)
-+
-+            self.address =3D server_sock.getsockname()
-+            self.listening.set()
-+
-+            sock, addr =3D server_sock.accept()
-+            sslconn =3D context.wrap_socket(sock, server_side=3DTrue)
-+            with sslconn:
-+                request =3D b''
-+                while chunk :=3D sslconn.recv(1024):
-+                    request +=3D chunk
-+                    if b'\n' in chunk:
-+                        break
-+
-+                sslconn.sendall(b'server\n')
-+                sslconn.shutdown(socket.SHUT_WR)
-+
- class AsyncoreEchoServer(threading.Thread):
-=20
-     # this one's based on asyncore.dispatcher
-@@ -5079,6 +5109,58 @@ class ThreadedTests(unittest.TestCase):
-                     if cm.exc_value is not None:
-                         raise cm.exc_value
-=20
-+    def test_got_eof(self):
-+        # gh-148292: Test that _ssl._SSLSocket behaves the same on all Op=
enSSL
-+        # versions on calling methods after EOF (after the first SSLEOFEr=
ror).
-+
-+        server =3D TestEOFServer()
-+        server.start()
-+        if not server.listening.wait(support.SHORT_TIMEOUT):
-+            raise RuntimeError("server took too long")
-+        self.addCleanup(server.join)
-+
-+        context =3D ssl.create_default_context(cafile=3DCERTFILE)
-+        sock =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)
-+        sock.settimeout(support.SHORT_TIMEOUT)
-+        sock.connect(server.address)
-+        sslsock =3D context.wrap_socket(sock, server_hostname=3D'localhos=
t')
-+        with sslsock:
-+            sslsock.sendall(b'client\n')
-+            # test the _ssl._SSLSocket object, not ssl.SSLSocket
-+            sslobj =3D sslsock._sslobj
-+
-+            data =3D sslobj.read(1024)
-+            self.assertEqual(data, b'server\n')
-+
-+            # The second read gets EOF error and sets got_eof_error to 1
-+            with self.assertRaises(ssl.SSLEOFError):
-+                sslobj.read(1024)
-+
-+            # Following read(), sendfile(), write() and do_handshake() ca=
lls
-+            # must raise SSLEOFError
-+            with self.assertRaises(ssl.SSLEOFError):
-+                # The _SSLSocket remembers the previous EOF error
-+                # and raises again SSLEOFError
-+                sslobj.read(1024)
-+            if hasattr(sslobj, 'sendfile'):
-+                with open(__file__, "rb") as fp:
-+                    with self.assertRaises(ssl.SSLEOFError):
-+                        sslobj.sendfile(fp.fileno(), 0, 1)
-+            with self.assertRaises(ssl.SSLEOFError):
-+                sslobj.write(b'client2\n')
-+            with self.assertRaises(ssl.SSLEOFError):
-+                sslsock.do_handshake()
-+
-+            self.assertEqual(sslsock.pending(), 0)
-+            try:
-+                sslsock.shutdown(socket.SHUT_WR)
-+            except OSError as exc:
-+                self.assertEqual(exc.errno, errno.ENOTCONN)
-+            else:
-+                # On Windows and on OpenSSL 1.1.1, shutdown() doesn't
-+                # raise an error
-+                pass
-+
-=20
- @unittest.skipUnless(has_tls_version('TLSv1_3') and ssl.HAS_PHA,
-                      "Test needs TLS 1.3 PHA")
-diff --git a/Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-148292.=
oIq3ml.rst b/Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-148292.o=
Iq3ml.rst
-new file mode 100644
-index 000000000000000..e1f308df5a678e6
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-148292.oIq3ml.=
rst
-@@ -0,0 +1,7 @@
-+:mod:`ssl`: Update :class:`ssl.SSLSocket` and :class:`ssl.SSLObject` for
-+OpenSSL 4. The classes now remember if they get a :exc:`ssl.SSLEOFError`.=
 In this
-+case, following :meth:`~ssl.SSLSocket.read`, :meth:`!sendfile`,
-+:meth:`~ssl.SSLSocket.write`, and :meth:`~ssl.SSLSocket.do_handshake` cal=
ls
-+raise :exc:`ssl.SSLEOFError` without calling the underlying OpenSSL funct=
ion.
-+Thanks to that, :class:`ssl.SSLSocket` behaves the same on all OpenSSL ve=
rsions
-+on EOF.  Patch by Victor Stinner.
-diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index 1603d0ffd559559..376df32b7cb4bd6 100644
---- a/Modules/_ssl.c
-+++ b/Modules/_ssl.c
-@@ -352,6 +352,16 @@ typedef struct {
-      * and shutdown methods check for chained exceptions.
-      */
-     PyObject *exc;
-+    // gh-148292: If non-zero, read(), sendfile(), write() and do_handsha=
ke()
-+    // methods raise SSLEOFError without calling the underlying OpenSSL
-+    // function. Set to 1 on PY_SSL_ERROR_EOF error.
-+    //
-+    // On OpenSSL 4, if SSL_read_ex() fails with
-+    // SSL_R_UNEXPECTED_EOF_WHILE_READING, the following SSL_read_ex() ca=
ll
-+    // fails with a generic protocol error (ERR_peek_last_error() returns=
 0).
-+    // Use got_eof_error to have the same behavior on OpenSSL 4 and newer=
 and
-+    // on OpenSSL 3 and older.
-+    int got_eof_error;
- } PySSLSocket;
-=20
- #define PySSLSocket_CAST(op)    ((PySSLSocket *)(op))
-@@ -499,6 +509,10 @@ fill_and_set_sslerror(_sslmodulestate *state,
-     PyObject *init_value, *msg, *key;
-     PyUnicodeWriter *writer =3D NULL;
-=20
-+    if (ssl_errno =3D=3D PY_SSL_ERROR_EOF && sslsock !=3D NULL) {
-+        sslsock->got_eof_error =3D 1;
-+    }
-+
-     if (errcode !=3D 0) {
-         int lib, reason;
-=20
-@@ -654,6 +668,18 @@ PySSL_ChainExceptions(PySSLSocket *sslsock) {
-     return -1;
- }
-=20
-+
-+static void
-+set_eof_error(PySSLSocket *sslsock)
-+{
-+    _sslmodulestate *state =3D get_state_sock(sslsock);
-+    fill_and_set_sslerror(state, sslsock, state->PySSLEOFErrorObject,
-+                          PY_SSL_ERROR_EOF,
-+                          "EOF occurred in violation of protocol",
-+                          __LINE__, 0);
-+}
-+
-+
- static PyObject *
- PySSL_SetError(PySSLSocket *sslsock, const char *filename, int lineno)
- {
-@@ -901,6 +927,7 @@ newPySSLSocket(PySSLContext *sslctx, PySocketSockObjec=
t *sock,
-     self->server_hostname =3D NULL;
-     self->err =3D err;
-     self->exc =3D NULL;
-+    self->got_eof_error =3D 0;
-=20
-     /* Make sure the SSL error state is initialized */
-     ERR_clear_error();
-@@ -1043,6 +1070,11 @@ _ssl__SSLSocket_do_handshake_impl(PySSLSocket *self=
)
-         BIO_set_nbio(SSL_get_wbio(self->ssl), nonblocking);
-     }
-=20
-+    if (self->got_eof_error) {
-+        set_eof_error(self);
-+        goto error;
-+    }
-+
-     timeout =3D GET_SOCKET_TIMEOUT(sock);
-     has_timeout =3D (timeout > 0);
-     if (has_timeout) {
-@@ -2514,6 +2546,11 @@ _ssl__SSLSocket_write_impl(PySSLSocket *self, Py_bu=
ffer *b)
-         BIO_set_nbio(SSL_get_wbio(self->ssl), nonblocking);
-     }
-=20
-+    if (self->got_eof_error) {
-+        set_eof_error(self);
-+        goto error;
-+    }
-+
-     timeout =3D GET_SOCKET_TIMEOUT(sock);
-     has_timeout =3D (timeout > 0);
-     if (has_timeout) {
-@@ -2654,6 +2691,11 @@ _ssl__SSLSocket_read_impl(PySSLSocket *self, Py_ssi=
ze_t len,
-         Py_INCREF(sock);
-     }
-=20
-+    if (self->got_eof_error) {
-+        set_eof_error(self);
-+        goto error;
-+    }
-+
-     if (!group_right_1) {
-         dest =3D PyBytes_FromStringAndSize(NULL, len);
-         if (dest =3D=3D NULL)
diff --git a/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shu=
tdown-test-in-test_ssl.test_got_eof.patch b/meta/recipes-devtools/python/py=
thon3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
deleted file mode 100644
index 59742290e8..0000000000
--- a/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-t=
est-in-test_ssl.test_got_eof.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 81911909bc439d6de8ce6a173b0691b3c58e9e1a Mon Sep 17 00:00:00 2001
-From: Victor Stinner <vstinner@python.org>
-Date: Mon, 4 May 2026 16:20:25 +0200
-Subject: [PATCH] gh-148292: Remove shutdown() test in test_ssl.test_got_eo=
f()
- (#149366)
-
-The shutdown() behavior depends too much on the operating system and
-it's unrelated to the got_eof_error change.
-
-(cherry picked from commit 1e21cf6fee3830012e458c0fe5dbc6fcd45ace92)
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/819119=
09bc43]
-
-Note: This is from the unmerged CPython PR #149783 which backports
-OpenSSL 4.0 support to the 3.14 branch. Upstream deferred merging
-until after Python 3.15.1 is released.
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- Lib/test/test_ssl.py | 8 --------
- 1 file changed, 8 deletions(-)
-
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index 03d9e3f9e5e96b5..6445f122b4272be 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -5152,14 +5152,6 @@ class ThreadedTests(unittest.TestCase):
-                 sslsock.do_handshake()
-=20
-             self.assertEqual(sslsock.pending(), 0)
--            try:
--                sslsock.shutdown(socket.SHUT_WR)
--            except OSError as exc:
--                self.assertEqual(exc.errno, errno.ENOTCONN)
--            else:
--                # On Windows and on OpenSSL 1.1.1, shutdown() doesn't
--                # raise an error
--                pass
-=20
-=20
- @unittest.skipUnless(has_tls_version('TLSv1_3') and ssl.HAS_PHA,
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/rec=
ipes-devtools/python/python3/makerace.patch
index 7167d5b4e8..83ed34d986 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From b41557f570ff4451c477669d6ca5bfacabe21c66 Mon Sep 17 00:00:00 2001
+From be6588c8090edae5379f14dd76f146d383b25e50 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
@@ -17,10 +17,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoun=
dation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index a7e536d..e946018 100644
+index 24ca285..a1d59e4 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2750,7 +2750,7 @@ COMPILEALL_OPTS=3D-j0
+@@ -2844,7 +2844,7 @@ COMPILEALL_OPTS=3D-j0
  TEST_MODULES=3D@TEST_MODULES@
 =20
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/m=
eta/recipes-devtools/python/python3/python3-manifest.json
index 50fdf5d0ea..1919e32957 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -117,7 +117,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/asyncio",
             "${libdir}/python${PYTHON_MAJMIN}/concurrent",
             "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_asyncio.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_remote_debuggin=
g.*.so"
         ],
         "cached": []
     },
@@ -129,9 +129,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/wave.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/wave.*.pyc"
-        ]
+        "cached": []
     },
     "codecs": {
         "summary": "Python codec",
@@ -153,11 +151,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/filecmp.py",
             "${libdir}/python${PYTHON_MAJMIN}/py_compile.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/compileall.*.pyc=
",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/filecmp.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/py_compile.*.pyc=
"
-        ]
+        "cached": []
     },
     "compression": {
         "summary": "Python high-level compression support",
@@ -165,20 +159,16 @@
             "core"
         ],
         "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/compression/",
             "${libdir}/python${PYTHON_MAJMIN}/gzip.py",
             "${libdir}/python${PYTHON_MAJMIN}/tarfile.py",
-            "${libdir}/python${PYTHON_MAJMIN}/zipfile/",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zstd.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/zipfile/"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc"
-        ]
+        "cached": []
     },
     "core": {
         "summary": "Python interpreter and core modules",
-        "rdepends": ["compression"],
+        "rdepends": [],
         "files": [
             "${bindir}/python${PYTHON_MAJMIN}",
             "${bindir}/python${PYTHON_MAJMIN}.real",
@@ -195,6 +185,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/_colorize.py",
             "${libdir}/python${PYTHON_MAJMIN}/_compression.py",
             "${libdir}/python${PYTHON_MAJMIN}/_markupbase.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_missing_stdlib_info.py",
             "${libdir}/python${PYTHON_MAJMIN}/_opcode_metadata.py",
             "${libdir}/python${PYTHON_MAJMIN}/_py_warnings.py",
             "${libdir}/python${PYTHON_MAJMIN}/_pyrepl",
@@ -214,6 +205,11 @@
             "${libdir}/python${PYTHON_MAJMIN}/codeop.py",
             "${libdir}/python${PYTHON_MAJMIN}/collections",
             "${libdir}/python${PYTHON_MAJMIN}/collections/abc.py",
+            "${libdir}/python${PYTHON_MAJMIN}/compression",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/_common",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/_common/_streams=
.py",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd/_zstdfile.p=
y",
             "${libdir}/python${PYTHON_MAJMIN}/configparser.py",
             "${libdir}/python${PYTHON_MAJMIN}/contextlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/copy.py",
@@ -253,11 +249,14 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bz2.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_csv.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_heapq.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_interpreters.*.=
so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lzma.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_math_integer.*.=
so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixsubprocess=
.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_struct.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_typing.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zstd.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/array.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/binascii.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so",
@@ -283,6 +282,8 @@
             "${libdir}/python${PYTHON_MAJMIN}/pathlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/pathlib/_abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/pathlib/_local.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/_os.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/types.py",
             "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
             "${libdir}/python${PYTHON_MAJMIN}/platform.py",
             "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
@@ -439,18 +440,18 @@
             "${libdir}/python${PYTHON_MAJMIN}/hashlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_blake2.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hashlib.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hmac.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_md5.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha1.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha2.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hashlib.*.pyc"
-        ]
+        "cached": []
     },
     "ctypes": {
         "summary": "Python C types support",
         "rdepends": [
+            "compression",
             "core",
             "io",
             "math"
@@ -482,14 +483,9 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_strptime.py",
             "${libdir}/python${PYTHON_MAJMIN}/calendar.py",
-            "${libdir}/python${PYTHON_MAJMIN}/datetime.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_datetime.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/datetime.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_strptime.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/calendar.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/datetime.*.pyc"
-        ]
+        "cached": []
     },
     "db": {
         "summary": "Python file-based database support",
@@ -505,7 +501,15 @@
     "debugger": {
         "summary": "Python debugger",
         "rdepends": [
+            "asyncio",
+            "compression",
             "core",
+            "io",
+            "json",
+            "logging",
+            "math",
+            "netclient",
+            "numbers",
             "pprint",
             "shell",
             "stringold"
@@ -514,10 +518,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/bdb.py",
             "${libdir}/python${PYTHON_MAJMIN}/pdb.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bdb.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pdb.*.pyc"
-        ]
+        "cached": []
     },
     "dev": {
         "cached": [],
@@ -547,16 +548,22 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/difflib.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/difflib.*.pyc"
-        ]
+        "cached": []
     },
     "doctest": {
         "summary": "Python framework for running examples in docstrings",
         "rdepends": [
+            "asyncio",
+            "compression",
             "core",
             "debugger",
             "difflib",
+            "io",
+            "json",
+            "logging",
+            "math",
+            "netclient",
+            "numbers",
             "pprint",
             "shell",
             "stringold",
@@ -565,9 +572,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/doctest.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/doctest.*.pyc"
-        ]
+        "cached": []
     },
     "email": {
         "summary": "Python email support",
@@ -584,9 +589,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/email",
             "${libdir}/python${PYTHON_MAJMIN}/imaplib.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imaplib.*.pyc"
-        ]
+        "cached": []
     },
     "ensurepip": {
         "summary": "Support for bootstrapping the pip installer",
@@ -603,9 +606,7 @@
         "rdepends": [
             "core"
         ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so"
-        ],
+        "files": [],
         "cached": []
     },
     "gdbm": {
@@ -647,13 +648,12 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/colorsys.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/colorsys.*.pyc"
-        ]
+        "cached": []
     },
     "io": {
         "summary": "Python low-level I/O",
         "rdepends": [
+            "compression",
             "core",
             "math",
             "netclient"
@@ -667,12 +667,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/ssl.py",
             "${libdir}/python${PYTHON_MAJMIN}/tempfile.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pyio.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socket.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ssl.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tempfile.*.pyc"
-        ]
+        "cached": []
     },
     "json": {
         "summary": "Python JSON support",
@@ -715,9 +710,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mailbox.*.pyc"
-        ]
+        "cached": []
     },
     "math": {
         "summary": "Python math support",
@@ -729,9 +722,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/cmath.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/random.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/random.*.pyc"
-        ]
+        "cached": []
     },
     "mime": {
         "summary": "Python MIME handling APIs",
@@ -741,9 +732,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/quopri.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/quopri.*.pyc"
-        ]
+        "cached": []
     },
     "mmap": {
         "summary": "Python memory-mapped file support",
@@ -818,10 +807,12 @@
     "multiprocessing": {
         "summary": "Python multiprocessing support",
         "rdepends": [
+            "compression",
             "core",
             "crypt",
             "ctypes",
             "io",
+            "json",
             "math",
             "mmap",
             "netclient",
@@ -861,16 +852,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/urllib",
             "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/base64.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ftplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hmac.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mimetypes.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/poplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/secrets.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uuid.*.pyc"
-        ]
+        "cached": []
     },
     "netserver": {
         "summary": "Python Internet Protocol servers",
@@ -881,9 +863,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/socketserver.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socketserver.*.p=
yc"
-        ]
+        "cached": []
     },
     "numbers": {
         "summary": "Python number APIs",
@@ -895,17 +875,10 @@
             "${libdir}/python${PYTHON_MAJMIN}/contextvars.py",
             "${libdir}/python${PYTHON_MAJMIN}/decimal.py",
             "${libdir}/python${PYTHON_MAJMIN}/fractions.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*.s=
o",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_decimal.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/numbers.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pydecimal.*.pyc=
",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextvars.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/decimal.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fractions.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/numbers.*.pyc"
-        ]
+        "cached": []
     },
     "pickle": {
         "summary": "Python serialisation/persistence support",
@@ -919,12 +892,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/pickletools.py",
             "${libdir}/python${PYTHON_MAJMIN}/shelve.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compat_pickle.*=
.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickle.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickletools.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shelve.*.pyc"
-        ]
+        "cached": []
     },
     "pkgutil": {
         "summary": "Python package extension utility support",
@@ -944,9 +912,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/plistlib.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/plistlib.*.pyc"
-        ]
+        "cached": []
     },
     "pprint": {
         "summary": "Python pretty-print support",
@@ -956,9 +922,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/pprint.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pprint.*.pyc"
-        ]
+        "cached": []
     },
     "profile": {
         "summary": "Python basic performance profiling support",
@@ -969,13 +933,11 @@
             "${libdir}/python${PYTHON_MAJMIN}/cProfile.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lsprof.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/profile.py",
+            "${libdir}/python${PYTHON_MAJMIN}/profiling",
+            "${libdir}/python${PYTHON_MAJMIN}/profiling/tracing",
             "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
-        ]
+        "cached": []
     },
     "pydoc": {
         "summary": "Python interactive help support",
@@ -987,9 +949,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
             "${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
-        ]
+        "cached": []
     },
     "resource": {
         "summary": "Python resource control interface",
@@ -1004,17 +964,13 @@
     "shell": {
         "summary": "Python shell-like functionality",
         "rdepends": [
-            "core",
-            "stringold"
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/cmd.py",
             "${libdir}/python${PYTHON_MAJMIN}/shlex.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cmd.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shlex.*.pyc"
-        ]
+        "cached": []
     },
     "sqlite3": {
         "summary": "Python Sqlite3 database support",
@@ -1039,9 +995,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_statistics.*.so=
",
             "${libdir}/python${PYTHON_MAJMIN}/statistics.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/statistics.*.pyc=
"
-        ]
+        "cached": []
     },
     "stringold": {
         "summary": "Common string operations",
@@ -1074,10 +1028,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/pty.py",
             "${libdir}/python${PYTHON_MAJMIN}/tty.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pty.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tty.*.pyc"
-        ]
+        "cached": []
     },
     "threading": {
         "summary": "Python threading & synchronization support",
@@ -1089,10 +1040,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/queue.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_local=
.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
-        ]
+        "cached": []
     },
     "tkinter": {
         "summary": "Python Tcl/Tk bindings",
@@ -1143,15 +1091,15 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/getpass.py"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
-        ]
+        "cached": []
     },
     "venv": {
         "summary": "Provides support for creating lightweight virtual envi=
ronments with their own site directories, optionally isolated from system s=
ite directories.",
         "rdepends": [
+            "compression",
             "core",
             "logging",
+            "shell",
             "stringold"
         ],
         "files": [
@@ -1202,11 +1150,10 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/zipapp.py"
+            "${libdir}/python${PYTHON_MAJMIN}/zipapp.py",
+            "${libdir}/python${PYTHON_MAJMIN}/zipfile"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/zipapp.*.pyc"
-        ]
+        "cached": []
     },
     "zoneinfo": {
         "summary": "IANA time zone support",
diff --git a/meta/recipes-devtools/python/python3/valid-dists.patch b/meta/=
recipes-devtools/python/python3/valid-dists.patch
deleted file mode 100644
index 7fe18254e5..0000000000
--- a/meta/recipes-devtools/python/python3/valid-dists.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 66874ce1a9f21b4b00dc85919734d58e6243ca29 Mon Sep 17 00:00:00 2001
-From: "Jason R. Coombs" <jaraco@jaraco.com>
-Date: Tue, 23 Jul 2024 08:36:16 -0400
-Subject: [PATCH] Prioritize valid dists to invalid dists when retrieving b=
y
- name.
-
-Closes python/importlib_metadata#489
-
-Upstream-Status: Backport [https://github.com/python/importlib_metadata/co=
mmit/a65c29adc027b3615154cab73aaedd58a6aa23da]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- Lib/importlib/metadata/__init__.py   | 14 +++-
- Lib/importlib/metadata/_itertools.py | 98 ++++++++++++++++++++++++++++
- 2 files changed, 110 insertions(+), 2 deletions(-)
-
-diff --git a/Lib/importlib/metadata/__init__.py b/Lib/importlib/metadata/_=
_init__.py
-index 8ce62dd..085378c 100644
---- a/Lib/importlib/metadata/__init__.py
-+++ b/Lib/importlib/metadata/__init__.py
-@@ -21,7 +21,7 @@ import collections
- from . import _meta
- from ._collections import FreezableDefaultDict, Pair
- from ._functools import method_cache, pass_none
--from ._itertools import always_iterable, unique_everseen
-+from ._itertools import always_iterable, bucket, unique_everseen
- from ._meta import PackageMetadata, SimplePath
-=20
- from contextlib import suppress
-@@ -404,7 +404,7 @@ class Distribution(DeprecatedNonAbstract):
-         if not name:
-             raise ValueError("A distribution name is required.")
-         try:
--            return next(iter(cls.discover(name=3Dname)))
-+            return next(iter(cls._prefer_valid(cls.discover(name=3Dname))=
))
-         except StopIteration:
-             raise PackageNotFoundError(name)
-=20
-@@ -428,6 +428,16 @@ class Distribution(DeprecatedNonAbstract):
-             resolver(context) for resolver in cls._discover_resolvers()
-         )
-=20
-+    @staticmethod
-+    def _prefer_valid(dists: Iterable[Distribution]) -> Iterable[Distribu=
tion]:
-+        """
-+        Prefer (move to the front) distributions that have metadata.
-+
-+        Ref python/importlib_resources#489.
-+        """
-+        buckets =3D bucket(dists, lambda dist: bool(dist.metadata))
-+        return itertools.chain(buckets[True], buckets[False])
-+
-     @staticmethod
-     def at(path: str | os.PathLike[str]) -> Distribution:
-         """Return a Distribution for the indicated metadata path.
-diff --git a/Lib/importlib/metadata/_itertools.py b/Lib/importlib/metadata=
/_itertools.py
-index d4ca9b9..79d3719 100644
---- a/Lib/importlib/metadata/_itertools.py
-+++ b/Lib/importlib/metadata/_itertools.py
-@@ -1,3 +1,4 @@
-+from collections import defaultdict, deque
- from itertools import filterfalse
-=20
-=20
-@@ -71,3 +72,100 @@ def always_iterable(obj, base_type=3D(str, bytes)):
-         return iter(obj)
-     except TypeError:
-         return iter((obj,))
-+
-+
-+# Copied from more_itertools 10.3
-+class bucket:
-+    """Wrap *iterable* and return an object that buckets the iterable int=
o
-+    child iterables based on a *key* function.
-+
-+        >>> iterable =3D ['a1', 'b1', 'c1', 'a2', 'b2', 'c2', 'b3']
-+        >>> s =3D bucket(iterable, key=3Dlambda x: x[0])  # Bucket by 1st=
 character
-+        >>> sorted(list(s))  # Get the keys
-+        ['a', 'b', 'c']
-+        >>> a_iterable =3D s['a']
-+        >>> next(a_iterable)
-+        'a1'
-+        >>> next(a_iterable)
-+        'a2'
-+        >>> list(s['b'])
-+        ['b1', 'b2', 'b3']
-+
-+    The original iterable will be advanced and its items will be cached u=
ntil
-+    they are used by the child iterables. This may require significant st=
orage.
-+
-+    By default, attempting to select a bucket to which no items belong  w=
ill
-+    exhaust the iterable and cache all values.
-+    If you specify a *validator* function, selected buckets will instead =
be
-+    checked against it.
-+
-+        >>> from itertools import count
-+        >>> it =3D count(1, 2)  # Infinite sequence of odd numbers
-+        >>> key =3D lambda x: x % 10  # Bucket by last digit
-+        >>> validator =3D lambda x: x in {1, 3, 5, 7, 9}  # Odd digits on=
ly
-+        >>> s =3D bucket(it, key=3Dkey, validator=3Dvalidator)
-+        >>> 2 in s
-+        False
-+        >>> list(s[2])
-+        []
-+
-+    """
-+
-+    def __init__(self, iterable, key, validator=3DNone):
-+        self._it =3D iter(iterable)
-+        self._key =3D key
-+        self._cache =3D defaultdict(deque)
-+        self._validator =3D validator or (lambda x: True)
-+
-+    def __contains__(self, value):
-+        if not self._validator(value):
-+            return False
-+
-+        try:
-+            item =3D next(self[value])
-+        except StopIteration:
-+            return False
-+        else:
-+            self._cache[value].appendleft(item)
-+
-+        return True
-+
-+    def _get_values(self, value):
-+        """
-+        Helper to yield items from the parent iterator that match *value*=
.
-+        Items that don't match are stored in the local cache as they
-+        are encountered.
-+        """
-+        while True:
-+            # If we've cached some items that match the target value, emi=
t
-+            # the first one and evict it from the cache.
-+            if self._cache[value]:
-+                yield self._cache[value].popleft()
-+            # Otherwise we need to advance the parent iterator to search =
for
-+            # a matching item, caching the rest.
-+            else:
-+                while True:
-+                    try:
-+                        item =3D next(self._it)
-+                    except StopIteration:
-+                        return
-+                    item_value =3D self._key(item)
-+                    if item_value =3D=3D value:
-+                        yield item
-+                        break
-+                    elif self._validator(item_value):
-+                        self._cache[item_value].append(item)
-+
-+    def __iter__(self):
-+        for item in self._it:
-+            item_value =3D self._key(item)
-+            if self._validator(item_value):
-+                self._cache[item_value].append(item)
-+
-+        yield from self._cache.keys()
-+
-+    def __getitem__(self, value):
-+        if not self._validator(value):
-+            return iter(())
-+
-+        return self._get_values(value)
diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recipes=
-devtools/python/python3_3.15.2.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.14.10.bb
rename to meta/recipes-devtools/python/python3_3.15.2.bb
index c50c4d4bab..43630bb48e 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.15.2.bb
@@ -18,19 +18,17 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
            file://makerace.patch \
            file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch =
\
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-mast=
e.patch \
-           file://valid-dists.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch =
\
            file://0001-prefer-valid-entrypoints.patch \
-           file://0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch \
-           file://0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patc=
h \
-           file://0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got=
_eof.patch \
+           file://0001-configure-clear-RUNSHARED-when-cross-compiling.patc=
h \
+           file://0001-gh-160881-Fix-test_is_python_process_non_python_sub=
p.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-config=
u.patch \
            "
=20
-SRC_URI[sha256sum] =3D "de414a57119abef52784d8993e341d53aed635fc2b05c2607d=
9f98a2c5b72032"
+SRC_URI[sha256sum] =3D "8b5536d280142ecf6cdfe15d12a21ba1c65e300bbf7b28a8d0=
cdb849575797de"
=20
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -41,7 +39,7 @@ inherit upstream-stable-release-point
=20
 CVE_PRODUCT =3D "python:python python_software_foundation:python cpython"
=20
-PYTHON_MAJMIN =3D "3.14"
+PYTHON_MAJMIN =3D "3.15"
=20
 S =3D "${UNPACKDIR}/Python-${PV}"
=20
@@ -75,7 +73,7 @@ DEPENDS =3D "\
 DEPENDS:append:class-target =3D " python3-native"
 DEPENDS:append:class-nativesdk =3D " python3-native"
=20
-EXTRA_OECONF =3D " --without-ensurepip --enable-shared --with-platlibdir=
=3D${baselib} --with-system-expat"
+EXTRA_OECONF =3D " --without-ensurepip --enable-shared --with-platlibdir=
=3D${baselib} --with-system-expat --without-system-libmpdec"
 EXTRA_OECONF:append:class-native =3D " --bindir=3D${bindir}/${PN}"
 EXTRA_OECONF:append:class-target =3D " --with-build-python=3Dnativepython3=
 PLATFORM_TRIPLET=3D${HOST_ARCH}-${HOST_OS}"
 EXTRA_OECONF:append:class-nativesdk =3D " --with-build-python=3Dnativepyth=
on3"
